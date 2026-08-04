import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/services/image_picker/image_picker_bottom_sheet.dart';
import '../../../../core/utils/enums/enums.dart';
import '../cubit/upload_cubit.dart';
import '../cubit/upload_state.dart';
import '../widgets/add_images_header.dart';
import '../widgets/upload_empty_state.dart';
import '../widgets/upload_grid.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<UploadCubit>(),
      child: const _UploadView(),
    );
  }
}

class _UploadView extends StatelessWidget {
  const _UploadView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Images'),
        centerTitle: true,
        actions: [
          BlocBuilder<UploadCubit, UploadState>(
            buildWhen: (prev, curr) => prev.items.length != curr.items.length,
            builder: (context, state) {
              if (state.items.isEmpty) {
                return const SizedBox.shrink();
              }
              return IconButton(
                onPressed: () => context.read<UploadCubit>().clearAll(),
                icon: const Icon(Icons.delete_outline),
                tooltip: 'Clear all',
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<UploadCubit, UploadState>(
        builder: (context, state) {
          final totalCount = state.items.length;
          final successCount = state.items
              .where((item) => item.status == UploadItemStatus.success)
              .length;

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AddImagesHeader(
                    imageCount: totalCount,
                    onAddSingle: () => _showImagePicker(context),
                    onPickMultiple: () =>
                        context.read<UploadCubit>().pickImages(),
                  ),
                  if (totalCount > 0) ...[
                    SizedBox(height: 6.h),
                    Text(
                      '$successCount of $totalCount uploaded',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                  SizedBox(height: 16.h),
                  Expanded(
                    child: state.items.isEmpty
                        ? UploadEmptyState(
                            onTap: () => _showImagePicker(context),
                          )
                        : SingleChildScrollView(
                            child: UploadGrid(
                              items: state.items,
                              onRemove: (id) =>
                                  context.read<UploadCubit>().removeItem(id),
                              onRetry: (id) =>
                                  context.read<UploadCubit>().retryItem(id),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _showImagePicker(BuildContext context) async {
    final source = await showImagePickerBottomSheet(context);
    if (source != null && context.mounted) {
      context.read<UploadCubit>().pickSingleImage(source);
    }
  }
}
