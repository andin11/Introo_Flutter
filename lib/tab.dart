import 'package:flutter/material.dart';
import './hal_headset.dart' as headset;
import './hal_komputer.dart' as komputer;
import './hal_radio.dart' as radio;
import './hal_smartphone.dart' as hp;

void main() {
  runApp(MaterialApp(
    title: "Tab Bar",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Daftar Elektronik"),
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(icon: Icon(Icons.computer), text: "Komputer"),
            Tab(icon: Icon(Icons.headset), text: "Headset"),
            Tab(icon: Icon(Icons.radio), text: "Radio"),
            Tab(icon: Icon(Icons.smartphone), text: "Smartphone"),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          komputer.HalKomputer(),
          headset.HalHeadset(),
          radio.HalRadio(),
          hp.HalSmartphone(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.amber,
        child: TabBar(
          controller: controller,
          tabs: [
            Tab(icon: Icon(Icons.computer), text: "Komputer"),
            Tab(icon: Icon(Icons.headset), text: "Headset"),
            Tab(icon: Icon(Icons.radio), text: "Radio"),
            Tab(icon: Icon(Icons.smartphone), text: "Smartphone"),
          ],
        ),
      ),
    );
  }
}