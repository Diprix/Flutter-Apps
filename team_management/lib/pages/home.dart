import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Management'),
      ),
      body: Container(
        child: Row(
          children: [
            Flexible(
              child: Column(
              children: [
                ...List.generate(5, (index) => ListTile(
                  title: Text('Progetto $index'),
                  subtitle: Text('descrizione progetto $index'),
                ),)
              ],
            ),),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
