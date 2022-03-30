// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MedicationStore on MedicationStoreBase, Store {
  final _$medicationListAtom = Atom(name: 'MedicationStoreBase.medicationList');

  @override
  ObservableList<MedicationModel> get medicationList {
    _$medicationListAtom.reportRead();
    return super.medicationList;
  }

  @override
  set medicationList(ObservableList<MedicationModel> value) {
    _$medicationListAtom.reportWrite(value, super.medicationList, () {
      super.medicationList = value;
    });
  }

  final _$getMedicationsFutureAtom =
      Atom(name: 'MedicationStoreBase.getMedicationsFuture');

  @override
  ObservableFuture<Either<AppError, List<MedicationModel>>>?
      get getMedicationsFuture {
    _$getMedicationsFutureAtom.reportRead();
    return super.getMedicationsFuture;
  }

  @override
  set getMedicationsFuture(
      ObservableFuture<Either<AppError, List<MedicationModel>>>? value) {
    _$getMedicationsFutureAtom.reportWrite(value, super.getMedicationsFuture,
        () {
      super.getMedicationsFuture = value;
    });
  }

  final _$addMedicationFutureAtom =
      Atom(name: 'MedicationStoreBase.addMedicationFuture');

  @override
  ObservableFuture<Either<AppError, void>>? get addMedicationFuture {
    _$addMedicationFutureAtom.reportRead();
    return super.addMedicationFuture;
  }

  @override
  set addMedicationFuture(ObservableFuture<Either<AppError, void>>? value) {
    _$addMedicationFutureAtom.reportWrite(value, super.addMedicationFuture, () {
      super.addMedicationFuture = value;
    });
  }

  final _$deleteMedicationFutureAtom =
      Atom(name: 'MedicationStoreBase.deleteMedicationFuture');

  @override
  ObservableFuture<Either<AppError, void>>? get deleteMedicationFuture {
    _$deleteMedicationFutureAtom.reportRead();
    return super.deleteMedicationFuture;
  }

  @override
  set deleteMedicationFuture(ObservableFuture<Either<AppError, void>>? value) {
    _$deleteMedicationFutureAtom
        .reportWrite(value, super.deleteMedicationFuture, () {
      super.deleteMedicationFuture = value;
    });
  }

  final _$updateMedicationFutureAtom =
      Atom(name: 'MedicationStoreBase.updateMedicationFuture');

  @override
  ObservableFuture<Either<AppError, void>>? get updateMedicationFuture {
    _$updateMedicationFutureAtom.reportRead();
    return super.updateMedicationFuture;
  }

  @override
  set updateMedicationFuture(ObservableFuture<Either<AppError, void>>? value) {
    _$updateMedicationFutureAtom
        .reportWrite(value, super.updateMedicationFuture, () {
      super.updateMedicationFuture = value;
    });
  }

  final _$errorTextAtom = Atom(name: 'MedicationStoreBase.errorText');

  @override
  String? get errorText {
    _$errorTextAtom.reportRead();
    return super.errorText;
  }

  @override
  set errorText(String? value) {
    _$errorTextAtom.reportWrite(value, super.errorText, () {
      super.errorText = value;
    });
  }

  final _$getMedicationsAsyncAction =
      AsyncAction('MedicationStoreBase.getMedications');

  @override
  Future<void> getMedications() {
    return _$getMedicationsAsyncAction.run(() => super.getMedications());
  }

  final _$addMedicationAsyncAction =
      AsyncAction('MedicationStoreBase.addMedication');

  @override
  Future<void> addMedication(MedicationModel medication) {
    return _$addMedicationAsyncAction
        .run(() => super.addMedication(medication));
  }

  final _$deleteMedicationAsyncAction =
      AsyncAction('MedicationStoreBase.deleteMedication');

  @override
  Future<void> deleteMedication(int index) {
    return _$deleteMedicationAsyncAction
        .run(() => super.deleteMedication(index));
  }

  final _$updateMedicationAsyncAction =
      AsyncAction('MedicationStoreBase.updateMedication');

  @override
  Future<void> updateMedication(MedicationModel medication, int index) {
    return _$updateMedicationAsyncAction
        .run(() => super.updateMedication(medication, index));
  }

  @override
  String toString() {
    return '''
medicationList: ${medicationList},
getMedicationsFuture: ${getMedicationsFuture},
addMedicationFuture: ${addMedicationFuture},
deleteMedicationFuture: ${deleteMedicationFuture},
updateMedicationFuture: ${updateMedicationFuture},
errorText: ${errorText}
    ''';
  }
}
