import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../models/store_model.dart';


class StoreListItem extends StatelessWidget {
  final StoreModel store;
  final VoidCallback onTap;
  final bool isSelected;

  const StoreListItem({
    super.key,
    required this.store,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.selectedItemColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryColor.withOpacity(0.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.storefront, color: AppColors.primaryColor, size: 24),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        store.storeLocation,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        store.storeAddress,
                        style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w400,),
                      ),
                      const SizedBox(height: 8),

                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${store.distance.toStringAsFixed(2)} km',
                      style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 17),
                    ),
                    const Text('Away', style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,)),
                  ],
                ),
              ],
            ),
            Text(
              'Today, ${_getDayName()}  ${store.startTime} - ${store.endTime}',
              style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w400,),
            ),
          ],
        ),
      ),
    );
  }

  static String _getDayName() {
    final now = DateTime.now();
    return [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ][now.weekday - 1];
  }
}
