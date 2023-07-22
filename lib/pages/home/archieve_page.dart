import 'package:flutter/material.dart';

class ArchievePage extends StatefulWidget {
  const ArchievePage({super.key});

  @override
  State<ArchievePage> createState() => _ArchievePageState();
}

class _ArchievePageState extends State<ArchievePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              child: Text("Running"),
            ),
            Tab(
              child: Text("History"),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: Text("Running Order"),
          ),
          Center(
            child: Text("Order History"),
          ),
        ],
      ),
    );
  }
}
