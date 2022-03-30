import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobx/mobx.dart';
import 'package:my_health_app/data/constants/enums.dart';
import 'package:my_health_app/data/models/medication_model.dart';
import 'package:my_health_app/data/models/medicine_info.dart';
import 'package:my_health_app/di/get_it.dart';
import 'package:my_health_app/domain/entities/params/get_medicine_params.dart';
import 'package:my_health_app/domain/usecases/medications/get_medicine_list.dart';
import 'package:my_health_app/presentation/stores/medication_store.dart';
import 'package:my_health_app/presentation/theme/app_colors.dart';
import 'package:my_health_app/presentation/widgets/label_text.dart';
import 'package:provider/provider.dart';

class AddEditMedicationScreen extends StatefulWidget {
  final bool isEdit;
  final MedicationModel? medicationModel;
  final int? index;

  const AddEditMedicationScreen(
      {Key? key, this.isEdit = false, this.medicationModel, this.index})
      : super(key: key);

  @override
  State<AddEditMedicationScreen> createState() =>
      _AddEditMedicationScreenState();
}

class _AddEditMedicationScreenState extends State<AddEditMedicationScreen> {
  final GetMedicineList _getMedicineList = getIt<GetMedicineList>();
  final TextEditingController _doseUnitController = TextEditingController();
  late final List<ReactionDisposer> _disposers;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int? _doseAmount;

  //Capsules and Syrup and Injection

  int? _frequency;
  FrequencyTypes _frequencyType = FrequencyTypes.day;
  String? _instructions;
  String? _prescriptionReason;

  MedicineInfo? _medicineInfo;

  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      _doseAmount = widget.medicationModel?.doseAmount;
      _doseUnitController.text = widget.medicationModel?.doseUnit ?? '';
      _instructions = widget.medicationModel?.instructions;
      _prescriptionReason = widget.medicationModel?.prescriptionReason;
      _medicineInfo = widget.medicationModel?.medicineInfo;
      _frequency = widget.medicationModel?.frequency;
      _frequencyType =
          widget.medicationModel?.frequencyType ?? FrequencyTypes.day;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers = [
      reaction(
        (_) => context.read<MedicationStore>().addMedicationFuture?.status,
        (result) {
          if (result == FutureStatus.fulfilled) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Medication added successfully'),
              ),
            );
            Navigator.pop(context);
          }
          if (result == FutureStatus.rejected) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error adding medication'),
              ),
            );
          }
          if (result == FutureStatus.pending) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Adding Medication...'),
              ),
            );
          }
        },
      ),
      reaction(
        (_) => context.read<MedicationStore>().updateMedicationFuture?.status,
        (result) {
          if (result == FutureStatus.fulfilled) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Medication updated successfully'),
              ),
            );
            Navigator.pop(context);
          }
          if (result == FutureStatus.rejected) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error updating medication'),
              ),
            );
          }
          if (result == FutureStatus.pending) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Updating Medication...'),
              ),
            );
          }
        },
      )
    ];
  }

  @override
  void dispose() {
    for (var d in _disposers) {
      d();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.isEdit ? 'Edit Medication' : 'Add New Medication'),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LabelText('Medication Name'),
                  DropdownSearch<MedicineInfo>(
                    showAsSuffixIcons: false,
                    mode: Mode.MENU,
                    dropdownSearchDecoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10)),
                    itemAsString: (MedicineInfo? medicineInfo) =>
                        medicineInfo!.name,
                    showSearchBox: true,
                    isFilteredOnline: true,
                    onChanged: (MedicineInfo? medicineInfo) {
                      setState(() {
                        _medicineInfo = medicineInfo;
                        _doseUnitController.text = medicineInfo?.drugForm ?? '';
                      });
                    },
                    emptyBuilder: (_, String? filter) {
                      if (filter!.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return const Text('No results found');
                    },
                    onFind: (String? filter) async {
                      if (filter!.isEmpty) {
                        return [];
                      }
                      var response = await _getMedicineList(
                          GetMedicineParams(query: filter));
                      return response.fold((l) => [], (r) => r);
                    },
                  ),
                  const Gap(10),
                  if (_medicineInfo != null) ...[
                    _DrugInfo(
                      medicineInfo: _medicineInfo!,
                      key: UniqueKey(),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const LabelText('Dose'),
                                TextFormField(
                                  initialValue: _doseAmount?.toString(),
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter dose amount';
                                    }
                                    if (value == '0') {
                                      return 'Please enter valid dose amount';
                                    }
                                    return null;
                                  },
                                  onChanged: (String? value) {
                                    setState(() {
                                      _doseAmount = int.tryParse(value!);
                                    });
                                  },
                                  keyboardType: TextInputType.number,
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
                                child: DropdownSearch(
                                  items: const ['Tablet', 'Syrup', 'Injection'],
                                  mode: Mode.MENU,
                                  dropdownSearchDecoration:
                                      const InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(left: 10)),
                                  onChanged: (String? value) {
                                    setState(() {
                                      _doseUnitController.text = value!;
                                    });
                                  },
                                  selectedItem: _doseUnitController.text,
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
                              children: [
                                const LabelText('Frequency'),
                                TextFormField(
                                  initialValue: _frequency?.toString(),
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter frequency';
                                    }
                                    if (value == '0') {
                                      return 'Please enter valid frequency';
                                    }
                                    return null;
                                  },
                                  onChanged: (String? value) {
                                    setState(() {
                                      _frequency = int.tryParse(value!);
                                    });
                                  },
                                  decoration: const InputDecoration(),
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
                                  child: DropdownSearch(
                                    selectedItem: _frequencyType,
                                    dropdownSearchDecoration:
                                        const InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(left: 10)),
                                    itemAsString: (FrequencyTypes? value) {
                                      return value == FrequencyTypes.day
                                          ? 'Day'
                                          : 'Week';
                                    },
                                    mode: Mode.MENU,
                                    onChanged: (FrequencyTypes? value) {
                                      setState(() {
                                        _frequencyType = value!;
                                      });
                                    },
                                    items: FrequencyTypes.values,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    //TODO: Add a field to take in dosing hours
                    const LabelText('Instructions'),
                    TextFormField(
                      initialValue: _instructions,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter instructions';
                        }
                        return null;
                      },
                      onChanged: (String? value) {
                        _instructions = value!;
                      },
                    ),
                    const Gap(10),
                    const LabelText('Reason for Prescription'),
                    TextFormField(
                      initialValue: _prescriptionReason,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter reason for prescription';
                        }
                        return null;
                      },
                      onChanged: (String? value) {
                        _prescriptionReason = value!;
                      },
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (widget.isEdit) {
                                  context
                                      .read<MedicationStore>()
                                      .updateMedication(
                                          widget.medicationModel!.copyWith(
                                            doseAmount: _doseAmount,
                                            doseUnit: _doseUnitController.text,
                                            instructions: _instructions,
                                            prescriptionReason:
                                                _prescriptionReason,
                                            updatedDate: DateTime.now(),
                                            frequencyType: _frequencyType,
                                            frequency: _frequency,
                                            dosingTimes: [
                                              '8:30 AM',
                                              '10:30 PM'
                                            ],
                                          ),
                                          widget.index!);
                                } else {
                                  context.read<MedicationStore>().addMedication(
                                      MedicationModel(
                                          medicineInfo: _medicineInfo!,
                                          doseAmount: _doseAmount!,
                                          doseUnit: _doseUnitController.text,
                                          instructions: _instructions!,
                                          frequencyType: _frequencyType,
                                          addedDate: DateTime.now(),
                                          updatedDate: DateTime.now(),
                                          frequency: _frequency!,
                                          dosingTimes: ['8:30 AM', '10:30 PM'],
                                          prescriptionReason:
                                              _prescriptionReason!));
                                }
                              }
                            },
                            child: const Text('Save')),
                        const Gap(10),
                        OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            )),
                      ],
                    ),
                  ]
                ],
              ),
            ),
          ),
        ));
  }
}

class _DrugInfo extends StatefulWidget {
  final MedicineInfo medicineInfo;

  const _DrugInfo({Key? key, required this.medicineInfo}) : super(key: key);

  @override
  State<_DrugInfo> createState() => _DrugInfoState();
}

class _DrugInfoState extends State<_DrugInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LabelText('Drug Class'),
        TextFormField(
          readOnly: true,
          initialValue: widget.medicineInfo.drugClass,
          decoration: const InputDecoration(fillColor: AppColors.readOnlyField),
        ),
        const Gap(10),
        const LabelText('Drug Brand'),
        TextFormField(
          readOnly: true,
          initialValue: widget.medicineInfo.drugBrand,
          decoration: const InputDecoration(fillColor: AppColors.readOnlyField),
        ),
        const Gap(10),
        const LabelText('Drug Code(GCN)'),
        TextFormField(
          readOnly: true,
          initialValue: widget.medicineInfo.drugCode,
          decoration: const InputDecoration(fillColor: AppColors.readOnlyField),
        ),
        const Gap(10),
        Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LabelText('Drug Type'),
                TextFormField(
                  readOnly: true,
                  initialValue: widget.medicineInfo.drugType,
                  decoration:
                      const InputDecoration(fillColor: AppColors.readOnlyField),
                ),
              ],
            ),
          ),
          const Gap(10),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const LabelText('Strength'),
              TextFormField(
                initialValue: widget.medicineInfo.drugStrength,
                readOnly: true,
                decoration:
                    const InputDecoration(fillColor: AppColors.readOnlyField),
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
                  children: [
                    const LabelText('Form'),
                    TextFormField(
                      readOnly: true,
                      initialValue: widget.medicineInfo.drugForm,
                      decoration: const InputDecoration(
                          fillColor: AppColors.readOnlyField),
                    ),
                  ]),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelText('Route of Administration'),
                    TextFormField(
                      readOnly: true,
                      initialValue: widget.medicineInfo.administrationRoute,
                      decoration: const InputDecoration(
                          fillColor: AppColors.readOnlyField),
                    ),
                  ]),
            ),
          ],
        ),
        const Gap(10),
      ],
    );
  }
}
