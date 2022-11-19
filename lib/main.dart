import 'package:flutter/material.dart';
import 'warhammer_info.dart';
import 'warhammer_mini.dart';
import 'warhammer_functions.dart';

// Main Function

void main() {
  runApp(const WarhammerApp());
}

// Global Variables

var isDataNew = DataChange();
var unitChoosed = UnitChoosed();
var functions = Functions();

var maximData = 3;
var jsonReader = loadJsonData();

class DataChange {
  bool dataChanged = false;
}

class WarhammerApp extends StatelessWidget {
  const WarhammerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WarcryApp Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.white),
      home: const HomePage(title: 'WarcryApp Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: jsonReader,
        builder: (context, data) {
          if (data.hasData) {
            var warhammerData = data.data as List<Warhammer>;
            return ListView.builder(
              itemCount: warhammerData == null ? 0 : maximData,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: InkWell(
                    onTap: (() {
                      unitChoosed.unitImageChoosed = warhammerData[index].image;
                      unitChoosed.unitNameChoosed = warhammerData[index].name;
                      unitChoosed.index = index;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ToWarhammerMiniInfo(
                              title: "Warhammer Rating"),
                        ),
                      );
                    }),
                    child: functions.cardConstructor(
                        warhammerData[index].name,
                        warhammerData[index].cost,
                        warhammerData[index].image,
                        warhammerData[index].rating,
                        context),
                  ),
                );
              },
            );
          } else if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {});
          if (maximData < 5) {
            maximData++;
          }
        },
        icon: const Icon(Icons.add_a_photo),
        label: const Text(
          "New Mini",
        ),
      ),
    );
  }
}
