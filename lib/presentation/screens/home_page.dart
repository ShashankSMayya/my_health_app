import 'package:flutter/material.dart';
import 'package:my_health_app/presentation/screens/documents/documents_screen.dart';
import 'package:my_health_app/presentation/screens/medications/view_medications_screen.dart';
import 'package:my_health_app/presentation/stores/documents_store.dart';
import 'package:my_health_app/presentation/stores/medication_store.dart';
import 'package:my_health_app/presentation/theme/app_colors.dart';
import 'package:my_health_app/routes/route_arguments.dart';
import 'package:my_health_app/routes/routes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.addEditMedication,
                        arguments: const AddEditMedicineArgs(isEdit: false));
                  },
                  icon: const Icon(Icons.add_circle),
                  iconSize: 30,
                ),
              ],
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: _currentPage,
          onTap: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.monitor_heart), label: 'Health'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: 'Calendar'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Team'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat')
          ],
        ),
        body: IndexedStack(
          index: _currentPage,
          children: [
            DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: const TabBar(
                        tabs: [
                          // Tab(
                          //   text: 'Activities',
                          // ),
                          Tab(
                            text: 'Medications',
                          ),
                          // Tab(
                          //   text: 'Resources',
                          // ),
                          Tab(text: 'Documents'),
                          // Tab(
                          //   text: 'Profile',
                          // )
                        ],
                      ),
                    ),
                    Expanded(
                        child: TabBarView(
                      children: [
                        // Container(),
                        ViewMedicationsScreen(
                          store: context.read<MedicationStore>(),
                        ),
                        // Container(),
                        DocumentsScreen(store: context.read<DocumentsStore>()),
                        // Container(),
                      ],
                    ))
                  ],
                )),
            Container(),
            Container(),
            Container(),
          ],
        ));
  }
}
