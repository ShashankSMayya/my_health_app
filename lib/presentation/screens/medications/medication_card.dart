import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MedicationCard extends StatelessWidget {
  const MedicationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: ExpansionTile(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Placeholder(
              fallbackHeight: 50,
              fallbackWidth: 50,
            ),
            const Gap(10),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Medication Name'),
                Gap(5),
                Text('THRICE',
                    style: TextStyle(
                      fontSize: 12,
                    )),
              ],
            ))
          ],
        ),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              _DrugInfoText(
                                  title: 'Drug Class', value: 'Liptropics'),
                              _DrugInfoText(
                                  title: 'Drug Code', value: '123223'),
                              _DrugInfoText(title: 'Form', value: 'Capsule'),
                              _DrugInfoText(title: 'Strength', value: '500 mg'),
                              _DrugInfoText(
                                  title: 'Dosing Hours', value: '08:30 AM'),
                              _DrugInfoText(
                                  title: 'Date Added', value: '22 Mar 2020'),
                            ],
                          ),
                        ),
                        Container(
                          height: 220,
                          color: Colors.grey,
                          width: 0.5,
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              _DrugInfoText(
                                  title: 'Drug Brand',
                                  value: 'Shangai Pharmaceuticals Limited'),
                              _DrugInfoText(
                                  title: 'Drug Type', value: 'Generic'),
                              _DrugInfoText(
                                  title: 'Route of Administration',
                                  value: 'Oral'),
                              _DrugInfoText(title: 'Dose', value: '2 Drops'),
                              _DrugInfoText(
                                  title: 'Frequency', value: 'Once a Day'),
                              _DrugInfoText(
                                  title: 'Last Updated', value: '22 Apr 2020'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    const Text(
                      'Instructions:',
                      style: TextStyle(color: Colors.black38),
                    ),
                    const Gap(4),
                    const Text(
                      'To be taken before breakfast and dinner with warm water',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Gap(10),
                    const Text(
                      'Reason fro Prescription:',
                      style: TextStyle(color: Colors.black38),
                    ),
                    const Gap(4),
                    const Text(
                      'This will help with maintiaining the overall blood glucose level and consistency',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              const Gap(10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Medication added by you'),
              ),
              Row(
                children: [
                  TextButton(onPressed: () {}, child: const Text('Edit')),
                  const Gap(10),
                  TextButton(onPressed: () {}, child: const Text('Delete')),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _DrugInfoText extends StatelessWidget {
  final String title;
  final String value;

  const _DrugInfoText({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black38,
            ),
          ),
          const Gap(2),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
