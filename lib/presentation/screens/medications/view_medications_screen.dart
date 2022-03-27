import 'package:flutter/material.dart';

import 'medication_card.dart';

class ViewMedicationsScreen extends StatefulWidget {
  const ViewMedicationsScreen({Key? key}) : super(key: key);

  @override
  State<ViewMedicationsScreen> createState() => _ViewMedicationsScreenState();
}

class _ViewMedicationsScreenState extends State<ViewMedicationsScreen>
    with AutomaticKeepAliveClientMixin<ViewMedicationsScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'DAILY',
            style: TextStyle(color: Colors.black38),
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) => const MedicationCard(),
                itemCount: 10),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
