import 'package:demo_provider/home_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
        create: (context) => HomeModel(),
        child: Consumer<HomeModel>(
          builder: (context, homeModel, child) {
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
                      homeModel.counter.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          homeModel.incrementCounter();
                        },
                        child: const Text('data'))
                  ],
                ),
              ),
              // floatingActionButton: FloatingActionButton(
              //   onPressed: homeModel.incrementCounter(),
              //   tooltip: 'Increment',
              //   child: const Icon(Icons.add),
              // ), // This trailing comma makes auto-formatting nicer for build methods.
            );
          },
        ));
  }
}
