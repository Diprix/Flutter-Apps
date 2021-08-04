import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SongItem extends StatelessWidget {
  final title;
  final artist;
  final image;
  SongItem(this.title, this.artist, this.image);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()  async {
       // await play(title);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 26.0),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 80.0,
                  width: 80.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                    height: 80.0,
                    width: 80.0,
                    child: IconButton(
                      icon: Icon(
                       Icons.play_circle_filled,
                        color: Colors.white.withOpacity(0.7),
                        size: 42.0,
                      ),
                    onPressed: () async => {
                        //await play(title),
                    } ))
              ],
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  artist,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 18.0),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.more_horiz,
              color: Colors.black.withOpacity(0.6),
              size: 32.0,
            )
          ],
        ),
      ),
    );
  }

}
