import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddImagesHeader extends StatelessWidget {
  final int imageCount;
  final VoidCallback onAddSingle;
  final VoidCallback onPickMultiple;

  const AddImagesHeader({
    super.key,
    required this.imageCount,
    required this.onAddSingle,
    required this.onPickMultiple,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            imageCount > 0
                ? '$imageCount image${imageCount > 1 ? 's' : ''} selected'
                : 'No images selected',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        TextButton.icon(
          onPressed: onPickMultiple,
          icon: Icon(Icons.photo_library_outlined, size: 18.sp),
          label: const Text('add images'),
        ),
        SizedBox(width: 4.w),
        TextButton.icon(
          onPressed: onAddSingle,
          icon: Icon(Icons.add_a_photo_outlined, size: 18.sp),
          label: const Text('add image'),
        ),
      ],
    );
  }
}
