import 'package:flutter/material.dart';
import 'package:module_business/module_business.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

void main() {
  BlocFactory.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final MainBloc _mainBloc;

  @override
  void initState() {
    super.initState();
    _mainBloc = BlocFactory.instance.get<MainBloc>();
  }

  @override
  void dispose() {
    _mainBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<MainBloc>(
      create: (_) => _mainBloc,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int valInt = 0;

  void _nextData() {
    setState(() {
      valInt = context.read<MainBloc>().refresh();
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
          children: [
            Text(valInt.toString()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nextData,
        tooltip: 'Get next',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
