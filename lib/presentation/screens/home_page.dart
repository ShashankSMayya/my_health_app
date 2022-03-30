import 'package:flutter/material.dart';
import 'package:my_health_app/presentation/screens/documents/documents_screen.dart';
import 'package:my_health_app/presentation/screens/medications/view_medications_screen.dart';
import 'package:my_health_app/presentation/stores/documents_store.dart';
import 'package:my_health_app/presentation/stores/medication_store.dart';
import 'package:my_health_app/routes/route_arguments.dart';
import 'package:my_health_app/routes/routes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      body: DefaultTabController(
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
    );
  }
}
