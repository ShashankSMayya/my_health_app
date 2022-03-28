
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_health_app/presentation/theme/app_colors.dart';
import 'package:my_health_app/presentation/widgets/label_text.dart';

class AddEditMedicationScreen extends StatelessWidget {
  final bool isEdit;

  const AddEditMedicationScreen({Key? key, this.isEdit = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(isEdit ? 'Edit Medication' : 'Add New Medication'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                LabelText('Medication Name'),
                TextField(),
                Gap(10),
                _DrugInfo(),
              ],
            ),
          ),
        ));
  }
}

class _DrugInfo extends StatelessWidget {
  const _DrugInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LabelText('Drug Class'),
        const TextField(
          readOnly: true,
          decoration: InputDecoration(fillColor: AppColors.readOnlyField),
        ),
        const Gap(10),
        const LabelText('Drug Brand'),
        const TextField(
          decoration: InputDecoration(fillColor: AppColors.readOnlyField),
        ),
        const Gap(10),
        const LabelText('Drug Code(GCN)'),
        const TextField(
          decoration: InputDecoration(fillColor: AppColors.readOnlyField),
        ),
        const Gap(10),
        Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                LabelText('Drug Type'),
                TextField(
                  decoration:
                      InputDecoration(fillColor: AppColors.readOnlyField),
                ),
              ],
            ),
          ),
          const Gap(10),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  LabelText('Strength'),
                  TextField(
                    decoration:
                        InputDecoration(fillColor: AppColors.readOnlyField),
                  ),
                ]),
          ),
        ]),
        const Gap(10),
        Row(
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    LabelText('Form'),
                    TextField(
                      decoration:
                          InputDecoration(fillColor: AppColors.readOnlyField),
                    ),
                  ]),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    LabelText('Route of Administration'),
                    TextField(
                      decoration:
                          InputDecoration(fillColor: AppColors.readOnlyField),
                    ),
                  ]),
            ),
          ],
        ),
        const Gap(10),
        Row(
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    LabelText('Dose'),
                    TextField(
                      decoration: InputDecoration(),
                    ),
                  ]),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LabelText(''),
                  Container(
                    color: Colors.white,
                    child: DropdownButton<String>(
                      underline: const SizedBox.shrink(),
                      items: const [
                        DropdownMenuItem(
                            child: Text('Capsules'), value: 'Capsules'),
                      ],
                      onChanged: (value) {},
                      isExpanded: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(10),
        Row(
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    LabelText('Frequency'),
                    TextField(
                      decoration: InputDecoration(),
                    ),
                  ]),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LabelText(''),
                  Container(
                    color: Colors.white,
                    child: DropdownButton<String>(
                      underline: const SizedBox.shrink(),
                      items: const [
                        DropdownMenuItem(
                            child: Text('Capsules'), value: 'Capsules'),
                      ],
                      onChanged: (value) {},
                      isExpanded: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(10),
        //TODO: Add a field to take in dosing hours
        const LabelText('Instructions'),
        const TextField(),
        const Gap(10),
        const LabelText('Reason for Prescription'),
        const TextField(),
        const Gap(10),
        Row(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Save')),
            const Gap(10),
            OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                )),
          ],
        ),
      ],
    );
  }
}
