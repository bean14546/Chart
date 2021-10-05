import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fruitName = StateProvider<String>((ref) => 'UNKNOWN');

class RiverpodApp extends ConsumerWidget {
  const RiverpodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Riverpod'),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Text(
                'My favorite fruit is ' + watch(fruitName).state,
                style: TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FruitButton('Apple'),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FruitButton('Oranges'),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FruitButton('Bananas'),
              ),
              SizedBox(height: 80),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FlatButton(
                  child: Text(
                    'Back To Homepage',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FruitButton extends StatelessWidget {
  final String fruit;

  FruitButton(this.fruit);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        fruit,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onPressed: () {
        context.read(fruitName).state = fruit;
      },
    );
  }
}
