import 'package:flutter/material.dart';
import 'package:nymboappclient/routes/home/ui/playlist.dart';

class ItemCard extends StatelessWidget {
  final image;
  final title;

  ItemCard(this.image, this.title);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 120.0,
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      height: 140.0,
                      width: double.infinity,
                    ),

                  ), onTap: () => {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new Playlist('genere', title))),
                },
                ),

                Positioned(
                  right: 16.0,
                  top: 16.0,
                  child: Icon(
                    Icons.bookmark,
                    color: Colors.white.withOpacity(0.6),
                    size: 24.0,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
//          Padding(
//            padding: const EdgeInsets.only(left: 4.0),
//            child: Text(
//              title,
//              style: TextStyle(color: Colors.black, fontSize: 20.0),
//            ),
//          )
        ],
      ),
    );
  }
}