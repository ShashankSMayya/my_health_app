import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:my_health_app/data/models/medication_model.dart';
import 'package:my_health_app/presentation/stores/medication_store.dart';

import 'medication_card.dart';

class ViewMedicationsScreen extends StatefulWidget {
  final MedicationStore store;

  const ViewMedicationsScreen({Key? key, required this.store})
      : super(key: key);

  @override
  State<ViewMedicationsScreen> createState() => _ViewMedicationsScreenState();
}

class _ViewMedicationsScreenState extends State<ViewMedicationsScreen>
    with AutomaticKeepAliveClientMixin<ViewMedicationsScreen> {
  late final ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();
    widget.store.getMedications();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //Delete document reaction
    _disposer = reaction(
      (_) => widget.store.deleteMedicationFuture?.status,
      (result) {
        if (result == FutureStatus.fulfilled) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Medication deleted successfully'),
            ),
          );

        }
        if (result == FutureStatus.rejected) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error deleting medication'),
            ),
          );
        }
        if (result == FutureStatus.pending) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Deleting medication...'),
            ),
          );
          Navigator.pop(context);
        }
      },
    );
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(builder: (_) {
      switch (widget.store.getMedicationsFuture!.status) {
        case FutureStatus.pending:
          return const Center(child: CircularProgressIndicator());
        case FutureStatus.rejected:
          return const Center(child: Text('Error'));
        case FutureStatus.fulfilled:
          return widget.store.errorText != null
              ? Center(
                  child: Text(widget.store.errorText!),
                )
              : Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: widget.store.medicationList.isEmpty
                            ? const Center(
                                child: Text('No Medications Found'),
                              )
                            : ListView.builder(
                                itemCount: widget.store.medicationList.length,
                                itemBuilder: (_, index) {
                                  final MedicationModel medication =
                                      widget.store.medicationList[index];

                                  return MedicationCard(
                                      medication: medication, index: index);
                                },
                              ),
                      ),
                    ],
                  ),
                );
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
