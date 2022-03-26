import 'package:flutter/material.dart';
import 'package:my_health_app/presentation/screens/documents/documents_screen.dart';
import 'package:my_health_app/presentation/screens/medications/view_medications_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Health',
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
                  const ViewMedicationsScreen(),
                  Container(),
                  const DocumentsScreen(),
                  Container(),
                ],
              ))
            ],
          )),
    );
  }
}
