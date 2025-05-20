import 'package:flutter/material.dart';
import 'location_search_page.dart';
import 'package:reorderables/reorderables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beach weather app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> infoGrid = List.generate(
    10,
        (index) => Container(
      key: ValueKey(index),
      height: 80,
      width: 175,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.black26,
      ),
      child: Text(
        'Item $index',
        style: TextStyle(fontSize: 18),
      ),
    ),
  );

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final item = infoGrid.removeAt(oldIndex);
      infoGrid.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background-image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LocationSearchPage(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 18),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    height: 60,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            '[Location]',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.search, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 175,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(child: Text('Top page info')),
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 175,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(child: Text('Image')),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black26,
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text(
                  'Suggestion',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ReorderableWrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                needsLongPressDraggable: true,
                onReorder: _onReorder,
                children: infoGrid,
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: containerData.map((data) {
                return InfoContainer(
                  title: data['title'],
                  number: data['number'],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoContainer extends StatelessWidget {
  final String title;
  final int number;

  const InfoContainer({
    super.key,
    required this.title,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black26,
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18)),
          Text(number.toString(), style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> containerData = [
  {'title': 'Monday', 'number': 1},
  {'title': 'Tuesday', 'number': 2},
  {'title': 'Wednesday', 'number': 3},
  {'title': 'Thursday', 'number': 4},
  {'title': 'Friday', 'number': 5},
  {'title': 'Saturday', 'number': 6},
  {'title': 'Sunday', 'number': 7},
];