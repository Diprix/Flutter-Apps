import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:nymboappclient/model/brano_model.dart';
import 'package:nymboappclient/routes/home/ui/home.dart';

class Playlist extends StatelessWidget {
  final String title;
  final String user;

  Playlist(this.user, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 30.0),),

        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: FutureBuilder(
        future: getPosts(user),
        builder: (context, snapshot) {
          final posts = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done){
            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {

                  return ListTile(
                    leading: CircleAvatar(child: Image.network(path+"images/cover/"+posts[index].disco+'.jpeg'), radius: 40),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_forever),

                      //TODO: Bug, non si autoaggiorna la lista
                      onPressed: () => {

                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text('Elimina Playlist', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 30.0)),
                              content: Container(
                                width: 300,
                                height: 100,
                                child: Column(
                                  children: <Widget>[
                                    Text('Sei sicuro di voler cancellare il Brano : ${posts[index].titolo} dalla playlist ' + title + ' ?', style: TextStyle(fontSize: 18),),

                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Annulla'),
                                  textColor: Colors.black,
                                  onPressed: () => Navigator.pop(context, 'Annullato'),
                                ),
                                FlatButton(
                                    child: Text('Elimina', style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold),),
                                    color: Colors.red,
                                    textColor: Colors.white,
                                    padding: EdgeInsets.all(10),
                                    onPressed: () => {
                                      Navigator.pop(context, posts[index].titolo),
                                      http.get(path+'eliminabranodaplaylist/'+user+'/'+title+'/'+posts[index].iDCanzone.toString()),
                                    }
                                )
                              ],

                            )).then((returnVal){
                          if(returnVal != null) {

                            Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Hai rimosso ' + returnVal + ' da '+ title),
                                  action: SnackBarAction(
                                    label: 'OK', onPressed: () => {},),
                                )
                            );
                          }})

                      },


                    ),
                    title: Text(posts[index].titolo),
                    subtitle: Text(posts[index].autore),
                    onTap: () async => {
                      await play(posts[index].titolo)
                    },

                  );
                });

          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child:  Icon(Icons.music_note),
        onPressed: () async {


          if (stato == false){
            await audioPlayer.resume();
            stato = true;
          } else {
            await audioPlayer.pause();
            stato = false;
          }


        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<List<Brano>> getPosts(arg) async {
    final body = await playlistPost(arg);
    return parsePosts(body);
  }


  Future<String> playlistPost(arg) async {


    String url;

    arg == 'genere' ? url = path+"genere/"+title : url = path+"playlist/"+user+"/"+title;


    print(url);

    //chiamata http get asincrona
    final response = await http.get(url);

    //controllo se lo stato del response è quello desiderato
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  List<Brano> parsePosts(String body) {
    final parsed = json.decode(body);
    return parsed.map<Brano>((p) => Brano.fromJson(p)).toList();
  }
}