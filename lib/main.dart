import 'package:clean_movies/data/core/api_client.dart';
import 'package:clean_movies/data/datasources/movie_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'data/repositories/movie_repository_impl.dart';
import 'domain/repositories/movie_repository.dart';
import 'domain/usecases/get_trending.dart';

void main() {
  //1 - Iniciando a ApiClient
  ApiClient client = ApiClient(Client());
  //2 - Instanciando o datasource e passando a instancia do cliente
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(client);
  //3 - Instanciando o repository e passando a instancia do datasource
  MovieRepository repository = MovieRepositoryImpl(dataSource);
  //4 - Instanciando o usecase e passando o repository
  GetTrending getTrending = GetTrending(repository);
  //5 - Executando o usecase
  getTrending();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
