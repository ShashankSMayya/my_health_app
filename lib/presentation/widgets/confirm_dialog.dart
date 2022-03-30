import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_health_app/presentation/theme/app_colors.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final Icon icon;
  final VoidCallback onConfirm;

  const ConfirmDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.icon,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child:  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: icon
                  ),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.dialogIconBackground),
                ),
                const Gap(20),
                Text(
                 title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Gap(10),
                 Text(
                  message,
                  textAlign: TextAlign.center,
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: onConfirm,
                      child: const Text('Delete'),
                    ),
                    const Gap(10),
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel',style: TextStyle(color: Colors.black),),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.clear),
            ),
            top: 0,
            right: 0,
          ),
        ],
      ),
    );
  }
}
