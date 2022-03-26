import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Health',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          Row(
            children: [
              const Text(
                'Add New',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_circle),
                iconSize: 30,
              ),
            ],
          )
        ],
      ),
      body: DefaultTabController(
          length: 5,
          child: Column(
            children: [
              const TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                    text: 'Activities',
                  ),
                  Tab(
                    text: 'Medications',
                  ),
                  Tab(
                    text: 'Resources',
                  ),
                  Tab(
                    text: 'Documents',
                  ),
                  Tab(
                    text: 'Profile',
                  )
                ],
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ))
            ],
          )),
    );
  }
}
