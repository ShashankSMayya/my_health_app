import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:my_health_app/data/models/medication_model.dart';
import 'package:my_health_app/domain/entities/app_error.dart';
import 'package:my_health_app/domain/entities/params/add_medication_params.dart';
import 'package:my_health_app/domain/entities/params/delete_medication_params.dart';
import 'package:my_health_app/domain/entities/params/update_medication_params.dart';
import 'package:my_health_app/domain/usecases/medications/add_medications.dart';
import 'package:my_health_app/domain/usecases/medications/delete_medication.dart';
import 'package:my_health_app/domain/usecases/medications/get_medications.dart';
import 'package:my_health_app/domain/usecases/medications/update_medications.dart';

import '../../domain/entities/params/no_params.dart';

part 'medication_store.g.dart';

class MedicationStore = MedicationStoreBase with _$MedicationStore;

abstract class MedicationStoreBase with Store {
  late final GetMedications _getMedications;
  late final AddMedication _addMedication;
  late final DeleteMedication _deleteMedication;
  late final UpdateMedication _updateMedication;

  MedicationStoreBase({
    required GetMedications getMedications,
    required AddMedication addMedication,
    required DeleteMedication deleteMedication,
    required UpdateMedication updateMedication,
  }) {
    _getMedications = getMedications;
    _addMedication = addMedication;
    _deleteMedication = deleteMedication;
    _updateMedication = updateMedication;
  }

  @observable
  ObservableList<MedicationModel> medicationList =
      ObservableList<MedicationModel>();

  @observable
  ObservableFuture<Either<AppError, List<MedicationModel>>>?
      getMedicationsFuture;

  @observable
  ObservableFuture<Either<AppError, void>>? addMedicationFuture;

  @observable
  ObservableFuture<Either<AppError, void>>? deleteMedicationFuture;

  @observable
  ObservableFuture<Either<AppError, void>>? updateMedicationFuture;

  @observable
  String? errorText;

  @action
  Future<void> getMedications() async {
    medicationList.clear();
    getMedicationsFuture ??= ObservableFuture(_getMedications(NoParams()));
    final response = await getMedicationsFuture!;
    response.fold((l) => errorText = 'Some error occurred',
        (r) => medicationList.addAll(r));
  }

  @action
  Future<void> addMedication(MedicationModel medication) async {
    addMedicationFuture ??= ObservableFuture(
        _addMedication(AddMedicationParams(medicationModel: medication)));
    final response = await addMedicationFuture!;
    response.fold((l) => errorText = 'Some error occurred',
        (r) => medicationList.add(medication));
  }

  @action
  Future<void> deleteMedication(int index) async {
    deleteMedicationFuture ??= ObservableFuture(
        _deleteMedication(DeleteMedicationParams(medicationId: index)));
    final response = await deleteMedicationFuture!;
    response.fold((l) => errorText = 'Some error occurred',
        (r) => medicationList.removeAt(index));
  }

  @action
  Future<void> updateMedication(MedicationModel medication, int index) async {
    updateMedicationFuture ??= ObservableFuture(_updateMedication(
        UpdateMedicationParams(medicationId: index, medication: medication)));
    final response = await updateMedicationFuture!;
    response.fold((l) => errorText = 'Some error occurred',
        (r) => medicationList[index] = medication);
  }
}
