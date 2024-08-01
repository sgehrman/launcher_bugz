import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Is a Disaster',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Is a Disaster'),
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
  Future<void> launchUrl(String url) async {
    try {
      final result = await launcher.launchUrl(
        Uri.parse(url),
      );

      if (!result) {
        // why does it return false on Flutter web?
        print('Flutter is a disaster - Could not launch $url');
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Flutter is WAY TOO BUGGY!! 3.22.x is a disaster!!  Please fire the Flutter Technical Program Manager!',
              style: TextStyle(fontSize: 32),
            ),
            const Text(
              'launchUrl always returns false on Flutter web.  Works fine on Linux.  See console for print() output',
              style: TextStyle(fontSize: 32),
            ),
            const Text(
              'Flutter\'s quailty has really dropped. Have you given up on Flutter already?',
              style: TextStyle(fontSize: 32),
            ),
            const Text(
              'Unban my github sgehrman@gmail.com. Why do you ban people reporting bugs?',
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => launchUrl('https://flutter.dev'),
                child: const Text('Click me for Bugz')),
          ],
        ),
      ),
    );
  }
}
