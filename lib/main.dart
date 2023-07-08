import 'package:animated_refresh/animated_refresh.dart';
import 'package:flutter/material.dart';
import 'package:loader_dynamic_island/data.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          secondary: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).canvasColor,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: AnimatedRefresh(
        backgroundColor: Theme.of(context).colorScheme.primary,
        color: Theme.of(context).canvasColor,
        onRefresh: () {
          return Future.delayed(const Duration(seconds: 3));
        },
        swipeChild: Icon(
          Icons.arrow_downward,
          color: Theme.of(context).canvasColor,
        ),
        refreshChild: Lottie.asset(
          'assets/refresh.json',
          fit: BoxFit.fill,
          width: 50,
          height: 50,
        ),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                ListTile(
                  subtitle: Text("${mockData[index]["body"]}"),
                  leading: Text(
                    "${mockData[index]["userId"]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: Text(
                    mockData[index]["title"],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  color: secondaryColor,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                )
              ],
            );
          },
          itemCount: mockData.length,
        ),
      ),
    );
  }
}
