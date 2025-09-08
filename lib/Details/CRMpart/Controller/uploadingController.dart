import 'package:billing/Details/CRMpart/Controller/uploadrowController.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class UploadingController extends GetxController {
  var isButtonEnabled = false.obs;
  var displayedFiles = <PlatformFile>[].obs;
  var submittedEntries = <Map<String, dynamic>>[].obs;

  void addFiles(List<PlatformFile> files) {
    displayedFiles.addAll(files);
  }

  void removeFileAt(int index) {
    if (index >= 0 && index < displayedFiles.length) {
      displayedFiles.removeAt(index);
    }
  }

  void setButtonEnabled(bool isValid) {
    isButtonEnabled.value = isValid;
  }

  void clearDisplayedFiles() {
    displayedFiles.clear();
  }

  void storeCurrentEntry(String uploadrowTag) {
    final uploadrowController = Get.find<UploadrowController>(
      tag: uploadrowTag,
    );

    Map<String, dynamic> entry = {
      'notes': uploadrowController.notesText.value,
      'fileType': uploadrowController.selectedConsultant.value,
      'files': List<PlatformFile>.from(uploadrowController.selectedFiles),
      'timestamp': DateTime.now(),
    };

    submittedEntries.add(entry);
    print('Stored entry: $entry');
    print('Total entries: ${submittedEntries.length}');
    print('All entries: ${submittedEntries}');
  }
}
