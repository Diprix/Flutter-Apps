//import 'package:flutter/material.dart';
//import 'package:nymboapp/ui/home/home.dart';
//import 'package:audioplayers/audioplayers.dart';
//
//
//
//class DetailedScreen extends StatelessWidget {
//  final title;
//  final artist;
//  final image;
//
//
//  DetailedScreen(this.title, this.artist, this.image);
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: blueColor,
//      body: Column(
//        children: <Widget>[
//          Container(
//            height: 320,
//            child: Stack(
//              children: <Widget>[
//                Container(
//                  decoration: BoxDecoration(
//                      image: DecorationImage(
//                          image: NetworkImage(image), fit: BoxFit.cover)),
//                ),
//                Container(
//                  decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                        colors: [blueColor.withOpacity(0.4), blueColor],
//                        begin: Alignment.topCenter,
//                        end: Alignment.bottomCenter),
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                  child: Column(
//                    children: <Widget>[
//                      SizedBox(height: 52.0),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Container(
//                            decoration: BoxDecoration(
//                                color: Colors.white.withOpacity(0.1),
//                                borderRadius: BorderRadius.circular(50.0)),
//                            child: Icon(
//                              Icons.arrow_drop_down,
//                              color: Colors.white,
//                            ),
//                          ),
//                          Column(
//                            children: <Widget>[
//                              Text(
//                                'Playlist', //PLAYLIST
//                                style: TextStyle(
//                                    color: Colors.white.withOpacity(0.6)),
//                              ),
//                              Text('Nome Playlist', //Nome Playlist
//                                  style: TextStyle(color: Colors.white)),
//                            ],
//                          ),
//                          Icon(
//                            Icons.playlist_add,
//                            color: Colors.white,
//                          )
//                        ],
//                      ),
//                      Spacer(),
//                      Text(title,
//                          style: TextStyle(
//                              color: Colors.white,
//                              fontWeight: FontWeight.bold,
//                              fontSize: 32.0)),
//                      SizedBox(
//                        height: 6.0,
//                      ),
//                      Text(
//                        artist,
//                        style: TextStyle(
//                            color: Colors.white.withOpacity(0.6),
//                            fontSize: 18.0),
//                      ),
//                      SizedBox(height: 16.0),
//                    ],
//                  ),
//                )
//              ],
//            ),
//          ),
//          SizedBox(height: 42.0),
//          Slider(
//            onChanged: (double value) {},
//            value: 0.2,
//            activeColor: pinkColor,
//          ),
//          Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 16.0),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Text(
//                  '2:10',
//                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
//                ),
//                Text('-03:56',
//                    style: TextStyle(color: Colors.white.withOpacity(0.7)))
//              ],
//            ),
//          ),
//          Spacer(),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              IconButton(
//                color: Colors.white54,
//                iconSize: 42.0,
//                icon: Icon(Icons.fast_rewind, size: 42.0, color: Colors.white54,),
//                onPressed: () => {},
//              ),
//              SizedBox(width: 32.0),
//              Container(
//                  decoration: BoxDecoration(
//                      color: pinkColor,
//                      borderRadius: BorderRadius.circular(50.0)),
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: IconButton(
//                      color: Colors.white,
//                      iconSize: 58.0,
//                      icon: Icon(stato == false ? Icons.play_arrow : Icons.pause, size: 58.0, color: Colors.white,),
//                      onPressed: () async => {
//                        if(stato == true){
//                          await audioPlayer.pause(),
//                          stato = false,
//                        }else{
//                          await audioPlayer.resume(),
//                          stato = true,
//                        }
//                      },
//                    )
//
//                  )),
//              SizedBox(width: 32.0),
//              IconButton(
//                color: Colors.white54,
//                iconSize: 42.0,
//                icon: Icon(Icons.fast_forward, size: 42.0, color: Colors.white54,),
//                onPressed: () => {},
//              )
//            ],
//          ),
//          Spacer(),
//          Padding(
//            padding: EdgeInsets.only(top: 55),
//            child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              Icon(
//                Icons.bookmark_border,
//                color: pinkColor,
//              ),
//              Icon(
//                Icons.shuffle,
//                color: pinkColor,
//              ),
//              Icon(
//                Icons.repeat,
//                color: pinkColor,
//              ),
//            ],
//          ),),
//
//          SizedBox(height: 58.0),
//        ],
//      ),
//    );
//  }
//
//
//}
//
////play(titolo) async {
////  var uri = "http://localhost:3000/canzoni/" + titolo + '.mp3';
////  var encoded = Uri.encodeFull(uri);
////
////  int i = await audioPlayer.stop();
////  if (i == 1) {
////    print('STOP');
////  }
////
////  int result = await audioPlayer.play(encoded);
////  if (result == 1) {
////    print('SUCCESS');
////    stato = true;
////  }
////}
