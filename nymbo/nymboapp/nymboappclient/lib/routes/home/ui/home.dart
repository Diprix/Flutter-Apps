import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nymboappclient/model/brano_model.dart';
import 'package:nymboappclient/model/playlist_model.dart';
import 'package:nymboappclient/routes/home/component/customtextfield.dart';
import 'package:nymboappclient/routes/home/component/itemcard.dart';
import 'package:nymboappclient/routes/home/ui/playlist.dart';



//final path = 'http://localhost:3000/';
final path = 'https://nymbo.herokuapp.com/';


//in home


AudioPlayer audioPlayer = AudioPlayer();
bool stato = false;
String plaing = 'Titolo';
String idUser = 'oscar';


class home extends StatefulWidget {

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int _currentTabIndex = 0;



  @override
  Widget build(BuildContext context) {

    final newPlaylistNameController = TextEditingController();
    final newPlaylistDescriptionController = TextEditingController();

    final _TapPage = <Widget>[

      //Home
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[



          SizedBox(
            height: 10,
          ),
          Row(

            children: <Widget>[
              Text('Album', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 38.0),),
              Spacer(),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: IconButton(
                  padding: EdgeInsets.only(left: 10),
                  icon: Icon(Icons.settings, color: Colors.black),
                  onPressed: () => {
                    Navigator.of(context).pushNamed('/settings'),

                  },
                ),
              ),

            ],
          ),

          SizedBox(width: 10.0,),
          Expanded(
            child: Padding(

                padding: EdgeInsets.only(right: 10),
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Row(

                          children: <Widget>[
                            Container(
                                width: 160.0,
                                child: Row(
                                  children: <Widget>[
                                    ItemCard('assets/images/dance.png', 'Electro'),
                                    SizedBox(width: 16.0,),
                                  ],
                                )
                            ),

                            Container(
                                width: 160.0,
                                child: Row(
                                  children: <Widget>[
                                    ItemCard('assets/images/country.png', 'Country'),
                                    SizedBox(width: 16.0,),
                                  ],
                                )
                            ),

                            Container(
                                width: 160.0,
                                child: Row(
                                  children: <Widget>[
                                    ItemCard('assets/images/rock.png', 'Rock'),
                                    SizedBox(width: 16.0,),
                                  ],
                                )
                            ),

                            Container(
                                width: 160.0,
                                child: Row(
                                  children: <Widget>[
                                    ItemCard('assets/images/cupo.png', 'Mood'),
                                    SizedBox(width: 16.0,),
                                  ],
                                )
                            ),

                            Container(
                                width: 160.0,
                                child: Row(
                                  children: <Widget>[
                                    ItemCard('assets/images/classica.png', 'Classica'),
                                    SizedBox(width: 16.0,),
                                  ],
                                )
                            ),

                            Container(
                                width: 160.0,
                                child: Row(
                                  children: <Widget>[
                                    ItemCard('assets/images/jazz.png', 'Jazz'),
                                    SizedBox(width: 16.0,),
                                  ],
                                )
                            ),

                            // - - - - - -  FUTURA SECONDA RIGA - - - - - - -

                            Container(
                                width: 160.0,
                                child: Row(
                                  children: <Widget>[
                                    ItemCard('assets/images/disco.png', 'Disco'),
                                    SizedBox(width: 16.0,),
                                  ],
                                )
                            ),

                            Container(
                                width: 160.0,
                                child: Row(
                                  children: <Widget>[
                                    ItemCard('assets/images/energy.png', 'Energy'),
                                    SizedBox(width: 16.0,),
                                  ],
                                )
                            ),

                            Container(
                                width: 160.0,
                                child: Row(
                                  children: <Widget>[
                                    ItemCard('assets/images/background.png', 'Backgrount'),
                                    SizedBox(width: 16.0,),
                                  ],
                                )
                            ),

                            Container(
                                width: 160.0,
                                child: Row(
                                  children: <Widget>[
                                    ItemCard('assets/images/hip-hop.png', 'Hip-Hop'),
                                    SizedBox(width: 16.0,),
                                  ],
                                )
                            ),

                            Container(
                                width: 160.0,
                                child: Row(
                                  children: <Widget>[
                                    ItemCard('assets/images/funky.png', 'Funky'),
                                    SizedBox(width: 16.0,)
                                  ],
                                )
                            ),

                            Container(
                                width: 160.0,
                                child: Row(
                                  children: <Widget>[
                                    ItemCard('assets/images/R&B.png', 'R&B'),
                                  ],
                                )
                            ),

                            // - - - - - - - - - - - - - - - - - - - - - - - -

                          ],
                        ),

//                      SizedBox(
//                        height: 16,
//                      ),
//                      Row(
//                        children: <Widget>[
//                          Container(
//                              width: 160.0,
//                              child: Row(
//                                children: <Widget>[
//                                  ItemCard(path+'images/naviga/disco.png', 'Disco'),
//                                  SizedBox(width: 16.0,),
//                                ],
//                              )
//                          ),
//
//                          Container(
//                              width: 160.0,
//                              child: Row(
//                                children: <Widget>[
//                                  ItemCard(path+'images/naviga/energy.png', 'Energy'),
//                                  SizedBox(width: 16.0,),
//                                ],
//                              )
//                          ),
//
//                          Container(
//                              width: 160.0,
//                              child: Row(
//                                children: <Widget>[
//                                  ItemCard(path+'images/naviga/background.png', 'Backgrount'),
//                                  SizedBox(width: 16.0,),
//                                ],
//                              )
//                          ),
//
//                          Container(
//                              width: 160.0,
//                              child: Row(
//                                children: <Widget>[
//                                  ItemCard(path+'images/naviga/hip-hop.png', 'Hip-Hop'),
//                                  SizedBox(width: 16.0,),
//                                ],
//                              )
//                          ),
//
//                          Container(
//                              width: 160.0,
//                              child: Row(
//                                children: <Widget>[
//                                  ItemCard(path+'images/naviga/funky.png', 'Funky'),
//                                  SizedBox(width: 16.0,),
//                                ],
//                              )
//                          ),
//
//                          Container(
//                              width: 160.0,
//                              child: Row(
//                                children: <Widget>[
//                                  ItemCard(path+'images/naviga/r&b.png', 'R&B'),
//                                ],
//                              )
//                          ),
//                        ],
//                      )
                      ],)
                  ],
                )),


          ),
          SizedBox(
            height: 0,
          ),
          Text('Hits', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 30.0),),
          Expanded(
            flex: 2,
            child: Padding(
                padding: EdgeInsets.only(left: 0, right: 0),
                child: FutureBuilder(
                  future: getPosts('hits'),
                  builder: (context, snapshot) {
                    final posts = snapshot.data;
                    if (snapshot.hasData){
                      return ListView.builder(
                          itemCount: posts.length,
                          itemBuilder: (context, index) {

                            return index < 15 ? ListTile(
                              leading: CircleAvatar(child: Image.network(path+"images/cover/"+posts[index].disco+'.jpeg'), radius: 40),
                              trailing: IconButton(icon: Icon(Icons.add),onPressed: () => {

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) => SimpleDialog(

                                      title: Text('Playlist', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 30.0)),
                                      children: <Widget>[
                                        Container(
                                          height: 300.0, // Change as per your requirement
                                          width: 300.0,
                                          child: FutureBuilder(
                                            future: getPlaylist(),
                                            builder: (context, snapshot) {
                                              final playlistItems = snapshot.data;
                                              if (snapshot.hasData){
                                                return ListView.builder(
                                                    itemCount: playlistItems.length,
                                                    itemBuilder: (context, Index) {

                                                      return ListTile(
                                                        leading: Icon(Icons.playlist_add),
                                                        //trailing: IconButton(icon: Icon(Icons.delete_forever),onPressed: () => {},),
                                                        title: Text(playlistItems[Index].nome),
                                                        subtitle: Text(playlistItems[Index].descrizione),
                                                        onTap: () => {
                                                          Navigator.pop(context, playlistItems[Index].nome+'/'+playlistItems[Index].refUtente),
                                                          http.get(path+'aggiungibranoaplaylist/'+idUser+'/'+playlistItems[Index].nome+'/'+posts[index].iDCanzone.toString()),

                                                        },

                                                      );
                                                    });

                                              } else {
                                                return Center(
                                                  child: CircularProgressIndicator(),
                                                );
                                              }
                                            },
                                          )
                                      )
                              ]
                                    )
                                ).then((returnVal){
                                  if(returnVal != null) {

                                    Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Aggiunto ' +
                                              posts[index].titolo +
                                              ' a ${returnVal.split('/')[0]}'),
                                          action: SnackBarAction(
                                            label: 'OK', onPressed: () => {
                                              Navigator.of(context).push(new MaterialPageRoute(
                                                  builder: (BuildContext context) =>
                                                  new Playlist(returnVal.split('/')[1], returnVal.split('/')[0]))),
                                          },),
                                        )
                                    );
                                  }})

                              },),
                              title: Text(posts[index].titolo),
                              subtitle: Text(posts[index].autore),
                              onTap: () => {
                                play(posts[index].titolo),
                              },

                            ) : null;



                          });

                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
            ),
          ),
        ],
      ),


      //Cerca
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text('Brani', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 38.0),),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            child: CustomTextField(),
          ),

          Expanded(
            flex: 2,
            child: Padding(
                padding: EdgeInsets.only(top: 0),
                child: FutureBuilder(
                  future: getPosts('brani'),
                  builder: (context, snapshot) {
                    final posts = snapshot.data;
                    if (snapshot.hasData){
                      return ListView.builder(
                          itemCount: posts.length,
                          itemBuilder: (context, index) {

                            return ListTile(
                              leading: CircleAvatar(child: Image.network(path+"images/cover/"+posts[index].disco+'.jpeg'), radius: 40),
                              trailing: IconButton(icon: Icon(Icons.add),onPressed: () => {

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) => SimpleDialog(

                                        title: Text('Playlist', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 30.0)),
                                        children: <Widget>[
                                          Container(
                                              height: 300.0, // Change as per your requirement
                                              width: 300.0,
                                              child: FutureBuilder(
                                                future: getPlaylist(),
                                                builder: (context, snapshot) {
                                                  final playlistItems = snapshot.data;
                                                  if (snapshot.hasData){
                                                    return ListView.builder(
                                                        itemCount: playlistItems.length,
                                                        itemBuilder: (context, Index) {

                                                          return ListTile(
                                                            leading: Icon(Icons.playlist_add),
                                                            //trailing: IconButton(icon: Icon(Icons.delete_forever),onPressed: () => {},),
                                                            title: Text(playlistItems[Index].nome),
                                                            subtitle: Text(playlistItems[Index].descrizione),
                                                            onTap: () => {
                                                              Navigator.pop(context, playlistItems[Index].nome+'/'+playlistItems[Index].refUtente),
                                                              http.get(path+'aggiungibranoaplaylist/'+idUser+'/'+playlistItems[Index].nome+'/'+posts[index].iDCanzone.toString()),

                                                            },

                                                          );
                                                        });

                                                  } else {
                                                    return Center(
                                                      child: CircularProgressIndicator(),
                                                    );
                                                  }
                                                },
                                              )
                                          )
                                        ]
                                    )
                                ).then((returnVal){
                                  if(returnVal != null) {

                                    Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Aggiunto ' +
                                              posts[index].titolo +
                                              ' a ${returnVal.split('/')[0]}'),
                                          action: SnackBarAction(
                                            label: 'OK', onPressed: () => {
                                            Navigator.of(context).push(new MaterialPageRoute(
                                                builder: (BuildContext context) =>
                                                new Playlist(returnVal.split('/')[1], returnVal.split('/')[0]))),
                                          },),
                                        )
                                    );
                                  }})

                              },),
                              title: Text(posts[index].titolo),
                              subtitle: Text(posts[index].autore),
                              onTap: () => {
                                play(posts[index].titolo),
                              },

                            );
                          });

                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
            ),
          ),
        ],
      ),


      //Playlist
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          SizedBox(
            height: 10,
          ),
          Row(

            children: <Widget>[
              Text('Playlist', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 38.0),),
              Spacer(),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: IconButton(
                  padding: EdgeInsets.only(left: 10),
                  icon: Icon(Icons.add, color: Colors.black, size: 30,),


                  onPressed: () => {

                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                      title: Text('Nuova Playlist', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 30.0)),
                      content: Container(
                        height: 200,
                        width: 300,
                        child: Column(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Nome Playlist',
                                enabled: true
                              ),
                              controller: newPlaylistNameController,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Descrizione',
                              ),
                              maxLines: 3,

                              controller: newPlaylistDescriptionController,
                            ),
                          ],
                        ),
                      ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Annulla'),
                              onPressed: () => Navigator.pop(context, 'Annullato'),
                            ),
                            FlatButton(
                              child: Text('Crea'),
                              onPressed: () => {
                                  Navigator.pop(context, 'Aggiorna'),
                                  http.get(path+'new/'+idUser+'/'+newPlaylistNameController.text+'/'+newPlaylistDescriptionController.text)

                              }
                            )
                          ],

                    )).then((value) {
                      setState(() {});
                    })
                  },


                ),
              ),

            ],
          ),
          Expanded(
            flex: 2,
            child: Container(
                padding: EdgeInsets.only(top: 10),
                child: FutureBuilder(
                  future: getPlaylist(),
                  builder: (context, snapshot) {
                    final playlistItems = snapshot.data;
                    if (snapshot.hasData){
                      return ListView.builder(
                          itemCount: playlistItems.length,
                          itemBuilder: (context, index) {

                            return ListTile(
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
                                              Text('Sei sicuro di voler cancellare la playlist: ${playlistItems[index].nome} ?', style: TextStyle(fontSize: 18),),
                                              Spacer(),
                                              Text('Questa operazione non potra essere annullata.', style: TextStyle(fontSize: 15)),
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
                                                Navigator.pop(context, 'Elimina'),
                                                http.get(path+'eliminaPlaylist/'+idUser+'/'+playlistItems[index].nome),
                                              }
                                          )
                                        ],

                                      )).then((value) {
                                    setState(() {});
                                  })

                                },


                              ),



                              title: Text(playlistItems[index].nome),
                              subtitle: Text(playlistItems[index].descrizione),
                              onTap: () => {
                                Navigator.of(context).push(new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                    new Playlist(playlistItems[index].refUtente, playlistItems[index].nome))),
                              },

                            );
                          });

                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
            ),
          ),
        ],
      ),

      //Amici
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text('Amici Connessi', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 38.0),),
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(top: 0),
                child: FutureBuilder(
                  future: getPlaylist(),
                  builder: (context, snapshot) {
                    final playlistItems = snapshot.data;
                    if (snapshot.hasData){
                      return ListView.builder(
                          itemCount: playlistItems.length,
                          itemBuilder: (context, index) {

                            return ListTile(
                              leading: CircleAvatar(child: Text(index.toString(), style: TextStyle(color: Colors.white),), backgroundColor: index%2 == 0 ? Colors.blue : Colors.lightBlue,),
                              trailing: IconButton(icon: Icon(index%2 == 0 ? Icons.favorite_border : Icons.favorite),onPressed: () => {},),
                              title: Text('Nome Cognome'),
                              subtitle: Text('Canzone in Riproduzione'),
                              onTap: () => {},

                            );
                          });

                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
            ),
          ),


        ],
      )

    ];


    return Scaffold(

      body: Padding(
        padding: EdgeInsets.only(top: 23, left: 10),
        child: _TapPage[_currentTabIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Cerca')),
          BottomNavigationBarItem(icon: Icon(Icons.queue_music), title: Text('Playlist')),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('Amici'))
        ],
        currentIndex: _currentTabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
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
    if(arg == 'hits'){

      final body = await HitsPost();
      return parsePosts(body);

    } else if (arg == 'brani') {

      final body = await BraniPost();
      return parsePosts(body);

    }


  }

  Future<List<PlaylistModel>> getPlaylist() async {

      final body = await PlaylistPost();
      return parsePostsPlaylist(body);
  }



  Future<String> PlaylistPost() async {

    final String url = path+"playlistPersonali/"+idUser;
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

  Future<String> HitsPost() async {

    final String url = path+"hits";
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

  Future<String> BraniPost() async {

    final String url = path+"playlist/"+idUser+"/Brani";
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



  //metodo per convertire il json ricevuto
  List<Brano> parsePosts(String body) {
    final parsed = json.decode(body);
    return parsed.map<Brano>((p) => Brano.fromJson(p)).toList();
  }


  List<PlaylistModel> parsePostsPlaylist(String body) {
    final parsed = json.decode(body);
    return parsed.map<PlaylistModel>((p) => PlaylistModel.fromJson(p)).toList();
  }


}

//TODO: promare a mettere qusto metodo e le rispettive variabili in app.dart

play(titolo) async {
  var uri = path + "canzoni/" + titolo + '.mp3';
  var encoded = Uri.encodeFull(uri);

  plaing = titolo;


  int i = await audioPlayer.stop();
  if (i == 1) {
    print('STOP');
  }
  int result = await audioPlayer.play(encoded);
  if (result == 1) {
    print('SUCCESS');

    stato = true;


  }
}




