import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:my_health_app/data/constants/enums.dart';
import 'package:my_health_app/data/models/medication_model.dart';
import 'package:my_health_app/presentation/stores/medication_store.dart';
import 'package:my_health_app/presentation/widgets/confirm_dialog.dart';
import 'package:my_health_app/routes/route_arguments.dart';
import 'package:my_health_app/routes/routes.dart';
import 'package:provider/provider.dart';

class MedicationCard extends StatelessWidget {
  final MedicationModel medication;
  final int index;

  const MedicationCard(
      {Key? key, required this.medication, required this.index})
      : super(key: key);

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
            medication.medicineInfo.imageUrl == null
                ? const Icon(
                    Icons.medication,
                    size: 50,
                  )
                : CachedNetworkImage(
                    imageUrl: medication.medicineInfo.imageUrl!,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    width: 50,
                    height: 50,
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
                            children: [
                              _DrugInfoText(
                                  title: 'Drug Class',
                                  value: medication.medicineInfo.drugClass),
                              _DrugInfoText(
                                  title: 'Drug Code',
                                  value: medication.medicineInfo.drugCode),
                              _DrugInfoText(
                                  title: 'Form',
                                  value: medication.medicineInfo.drugForm),
                              _DrugInfoText(
                                  title: 'Strength',
                                  value: medication.medicineInfo.drugStrength),
                              const _DrugInfoText(
                                  title: 'Dosing Hours', value: '08:30 AM'),
                              _DrugInfoText(
                                  title: 'Date Added',
                                  value: DateFormat('dd MMM yyyy')
                                      .format(medication.addedDate)),
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
                            children: [
                              _DrugInfoText(
                                  title: 'Drug Brand',
                                  value: medication.medicineInfo.drugBrand),
                              _DrugInfoText(
                                  title: 'Drug Type',
                                  value: medication.medicineInfo.drugType),
                              _DrugInfoText(
                                  title: 'Route of Administration',
                                  value: medication
                                      .medicineInfo.administrationRoute),
                              _DrugInfoText(title: 'Dose', value: '2 Drops'),
                              _DrugInfoText(
                                  title: 'Frequency',
                                  value:
                                      '${medication.frequency} times a ${medication.frequencyType == FrequencyTypes.day ? 'day' : 'week'}'),
                              _DrugInfoText(
                                  title: 'Last Updated',
                                  value: DateFormat('dd MMM yyyy')
                                      .format(medication.addedDate)),
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
                    Text(
                      medication.instructions,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Gap(10),
                    const Text(
                      'Reason fro Prescription:',
                      style: TextStyle(color: Colors.black38),
                    ),
                    const Gap(4),
                    Text(
                      medication.prescriptionReason,
                      style: const TextStyle(fontWeight: FontWeight.bold),
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
                child: Text(
                  'Medication added by you',
                  style: TextStyle(
                    color: Colors.black38,
                  ),
                ),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.addEditMedication,
                            arguments: AddEditMedicineArgs(
                                isEdit: true,
                                medicationIndex: index,
                                medicationModel: medication));
                      },
                      child: const Text('Edit')),
                  const Gap(10),
                  TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => ConfirmDialog(
                                  title: 'Delete Medication',
                                  message:
                                      'Are you sure you want to delete this medication?',
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.white,
                                    size: 64,
                                  ),
                                  onConfirm: () => context
                                      .read<MedicationStore>()
                                      .deleteMedication(index),
                                ));
                      },
                      child: const Text('Delete')),
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
