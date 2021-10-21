import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.indigo,
            ),
            onPressed: () {},
          ),
          title: const Text(
            "Weather",
            style: TextStyle(color: Colors.black87),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.indigo,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

class _buildBody extends StatelessWidget {
  const _buildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: 400,
          child: Column(
            children: [
              _headerImage(),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _weatherDescription(),
                      Divider(),
                      _temperature(),
                      Divider(),
                      _temperatureForecast(),
                      Divider(),
                      _footerRatings(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _headerImage extends StatelessWidget {
  const _headerImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(
        "https://avatars.mds.yandex.net/get-zen_doc/169683/"
        "pub_5b37d5317aa92600aa96d74f_5b37d57aa9112400ae6e63b9/scale_1200",
      ),
      fit: BoxFit.cover,
    );
  }
}

class _weatherDescription extends StatelessWidget {
  const _weatherDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "Tuesday - May 22",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
        Text(
          "In the south of the country it’s very windy and chilly. "
          "There is a chance of some rain. The temperature is around 10º. "
          "In the north and middle of the country we’re expecting a "
          "thunderstorm. The west has the best weather today: "
          "It’s sunny, windless and warm. The temperature is around 17º.",
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        )
      ],
    );
  }
}

class _temperature extends StatelessWidget {
  const _temperature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.wb_sunny,
              color: Colors.yellow,
            ),
          ],
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "15" + "\u2103" + " Clear",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Murmanskaya oblast, Murmansk",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _temperatureForecast extends StatelessWidget {
  const _temperatureForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: List.generate(
        8,
        (int index) {
          return Chip(
            label: Text(
              "${index + 20}" + "\u2103",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            avatar: Icon(
              Icons.wb_cloudy,
              color: Colors.blue.shade300,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(color: Colors.grey),
            ),
            backgroundColor: Colors.grey.shade100,
          );
        },
      ),
    );
  }
}

class _footerRatings extends StatelessWidget {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.star,
        size: 15,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.black,
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.black,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Info with openweathermap.org",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        stars,
      ],
    );
  }
}
