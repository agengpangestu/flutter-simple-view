import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    @override
    Widget myTitle = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  "RM Padang Super Duper Enak",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const Text(
                "Santapan istimewa untuk diri sendiri",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              )
            ],
          )),
          FavoriteWidget()
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget myIcon = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _iconButton(color, Icons.call, "Telepon"),
        _iconButton(color, Icons.near_me, "Rute"),
        _iconButton(color, Icons.share, "Share")
      ],
    );

    Widget myDesc = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        "Voluptatem rerum aut. Incidunt ab impedit ipsam placeat quia in officia ut. Neque doloremque ipsam fuga non ut. Vel neque voluptatem repellendus repudiandae placeat voluptatem consequatur. \n\nIn fugiat sunt dolorem odio. Ad quaerat modi omnis ut excepturi quasi. Rerum ea quidem est blanditiis neque. Delectus rerum porro excepturi dolore. Dolorem alias qui atque tempore consequatur ipsum architecto itaque labore. A blanditiis porro est. Molestias et et commodi similique ea. \n\nIn voluptatem optio porro vero expedita esse odit. Nobis tempora sint omnis et eveniet eum. Harum qui optio corrupti atque et.",
        softWrap: true,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Wisata Kuliner",
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Wisata Kuliner"),
          ),
          body: ListView(
            children: [
              Image.asset(
                "assets/images/rm_padang.jpg",
                height: 250,
                fit: BoxFit.cover,
              ),
              myTitle,
              myIcon,
              myDesc
            ],
          )),
    );
  }

  Column _iconButton(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: color),
          ),
        )
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorite = true;
  int _favoriteCount = 31;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _favoriteCount -= 1;
        _isFavorite = false;
      } else {
        _favoriteCount += 1;
        _isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorite
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.yellow,
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text("$_favoriteCount"),
          ),
        )
      ],
    );
  }
}
