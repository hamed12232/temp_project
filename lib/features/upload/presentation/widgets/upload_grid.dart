import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/upload_item.dart';
import 'upload_card.dart';

class UploadGrid extends StatelessWidget {
  final List<UploadItem> items;
  final ValueChanged<String> onRemove;
  final ValueChanged<String> onRetry;

  const UploadGrid({
    super.key,
    required this.items,
    required this.onRemove,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 1.0,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return UploadCard(
          key: ValueKey(item.id),
          item: item,
          onRemove: () => onRemove(item.id),
          onRetry: () => onRetry(item.id),
        );
      },
    );
  }
}
