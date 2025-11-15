import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  /// Request camera permission
  static Future<bool> requestCameraPermission() async {
    var status = await Permission.camera.request();
    return status.isGranted;
  }

  /// Request gallery (storage/media) permission
  static Future<bool> requestGalleryPermission() async {
    // For Android 13+ (READ_MEDIA_IMAGES), permission_handler handles it internally
    var status = await Permission.photos.request();
    return status.isGranted;
  }
}
