import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temp_project/core/utils/enums/enums.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/services/image_picker/image_picker_bottom_sheet.dart';
import '../cubit/upload_cubit.dart';
import '../cubit/upload_state.dart';
import '../widgets/add_images_header.dart';
import '../widgets/image_grid.dart';
import '../widgets/upload_button.dart';
import '../widgets/upload_empty_state.dart';
import '../widgets/upload_failure_widget.dart';
import '../widgets/upload_loading_overlay.dart';
import '../widgets/uploaded_images_grid.dart';

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
            buildWhen: (prev, curr) =>
                prev.selectedImages.length != curr.selectedImages.length ||
                prev.uploadedFiles.length != curr.uploadedFiles.length,
            builder: (context, state) {
              if (state.selectedImages.isEmpty && state.uploadedFiles.isEmpty) {
                return const SizedBox.shrink();
              }
              return IconButton(
                onPressed: () => context.read<UploadCubit>().clearImages(),
                icon: const Icon(Icons.delete_outline),
                tooltip: 'Clear all',
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<UploadCubit, UploadState>(
        listener: _handleStateChanges,
        builder: (context, state) {
          return Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AddImagesHeader(
                        imageCount: state.selectedImages.length,
                        onAddSingle: () => _showImagePicker(context),
                        onPickMultiple: () =>
                            context.read<UploadCubit>().pickImages(),
                      ),
                      SizedBox(height: 16.h),
                      Expanded(
                        child: state.selectedImages.isEmpty &&
                                state.uploadedFiles.isEmpty
                            ? UploadEmptyState(
                                onTap: () => _showImagePicker(context),
                              )
                            : SingleChildScrollView(
                                child: Column(
                                  children: [
                                    if (state.selectedImages.isNotEmpty)
                                      ImageGrid(
                                        images: state.selectedImages,
                                        onRemove: (index) => context
                                            .read<UploadCubit>()
                                            .removeImage(index),
                                      ),
                                    if (state.selectedImages.isNotEmpty &&
                                        state.uploadedFiles.isNotEmpty)
                                      SizedBox(height: 16.h),
                                    if (state.uploadedFiles.isNotEmpty)
                                      UploadedImagesGrid(
                                        files: state.uploadedFiles,
                                      ),
                                  ],
                                ),
                              ),
                      ),
                      if (state.status == UploadStatus.uploadFailure &&
                          state.failure != null)
                        UploadFailureWidget(
                          message: state.failure!.message,
                          onRetry: () => context.read<UploadCubit>().retry(),
                        ),
                      SizedBox(height: 12.h),
                      UploadButton(
                        isEnabled: state.selectedImages.isNotEmpty,
                        isLoading: state.isUploading,
                        onPressed: () =>
                            context.read<UploadCubit>().uploadImages(),
                      ),
                      SizedBox(height: 8.h),
                    ],
                  ),
                ),
              ),
              if (state.isUploading) const UploadLoadingOverlay(),
            ],
          );
        },
      ),
    );
  }

  void _handleStateChanges(BuildContext context, UploadState state) {
    if (state.status == UploadStatus.uploadSuccess) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    '${state.uploadedFiles.length} image${state.uploadedFiles.length > 1 ? 's' : ''} uploaded successfully!',
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.green.shade700,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            margin: EdgeInsets.all(16.r),
            duration: const Duration(seconds: 3),
          ),
        );
    }
  }

  Future<void> _showImagePicker(BuildContext context) async {
    final source = await showImagePickerBottomSheet(context);
    if (source != null && context.mounted) {
      context.read<UploadCubit>().pickSingleImage(source);
    }
  }
}
