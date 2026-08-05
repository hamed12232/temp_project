import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:injectable/injectable.dart';

/// Service responsible for video caching, preloading, and disk retrieval
/// using `flutter_cache_manager`.
@lazySingleton
class VideoCacheService {
  final CacheManager _cacheManager = DefaultCacheManager();

  /// Retrieves a video file from disk cache, downloading it if not present.
  Future<File> getSingleFile(String url) async {
    return await _cacheManager.getSingleFile(url);
  }

  /// Checks if the video file exists in local cache without downloading.
  Future<File?> getCachedFile(String url) async {
    final fileInfo = await _cacheManager.getFileFromCache(url);
    return fileInfo?.file;
  }

  /// Asynchronously preloads a video file into disk cache in the background.
  Future<void> preloadVideo(String url) async {
    try {
      final fileInfo = await _cacheManager.getFileFromCache(url);
      if (fileInfo == null) {
        await _cacheManager.downloadFile(url);
      }
    } catch (_) {
      // Ignore background preloading errors
    }
  }

  /// Removes a specific cached video file.
  Future<void> removeFile(String url) async {
    await _cacheManager.removeFile(url);
  }

  /// Clears the entire video cache.
  Future<void> clearCache() async {
    await _cacheManager.emptyCache();
  }
}
