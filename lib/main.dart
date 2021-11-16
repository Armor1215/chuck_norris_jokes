import 'package:chuck_norris_jokes/model/chuck_norris_joke.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Chuck Norris Jokes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var defaultChuckJoke = ChuckNorrisJoke();

  void getJokeAndUpdateUi() async {
    ChuckNorrisJoke chuckJoke = await getJoke();

    setState(() {
      defaultChuckJoke.imageUrl = chuckJoke.imageUrl;
      defaultChuckJoke.joke = chuckJoke.joke;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(defaultChuckJoke.imageUrl),
            Text(
              defaultChuckJoke.joke,
              style: const TextStyle(fontSize: 25.0),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => getJokeAndUpdateUi(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<ChuckNorrisJoke> getJoke() async {
    var url = Uri.https('api.chucknorris.io', '/jokes/random');

    var response = await http.get(
      url,
      headers: {
        "accept": "application/json",
      },
    );
    
    if(response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);

      return ChuckNorrisJoke(
        imageUrl: json['icon_url'],
        joke: json['value'],
      );

    } else {
      print(response.statusCode);
      
      return ChuckNorrisJoke();
    }
  }
}
