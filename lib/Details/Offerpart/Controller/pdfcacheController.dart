import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PdfCacheController extends GetxController {
  final Map<String, bool> _loadedPdfs = {};

  bool isPdfCached(String path) => _loadedPdfs[path] ?? false;

  void markPdfAsLoaded(String path) => _loadedPdfs[path] = true;

  void clearCache() => _loadedPdfs.clear();
}
