import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadrowController extends GetxController {
  var selectedConsultant = RxnString();
  var selectedOfferNumber = RxnString();
  var selectedOfferDate = Rxn<DateTime>();
  var selectedFiles = <PlatformFile>[].obs;
  var notesText = ''.obs;

  var showMoreInfoConsultant = false.obs;
  var showMoreInfoOfferNumber = false.obs;
  var showMoreInfoOfferDate = false.obs;

  late TextEditingController notesController;
  Function(bool)? onValidationChanged;

  @override
  void onInit() {
    super.onInit();
    notesController = TextEditingController();
    notesController.addListener(_onNotesChanged);
  }

  @override
  void onClose() {
    notesController.dispose();
    super.onClose();
  }

  void _onNotesChanged() {
    notesText.value = notesController.text;
    _validateFields();
  }

  void _validateFields() {
    bool isValid =
        selectedFiles.isNotEmpty &&
        selectedConsultant.value != null &&
        notesController.text.trim().isNotEmpty;

    onValidationChanged?.call(isValid);
  }

  void addFiles(List<PlatformFile> files) {
    selectedFiles.addAll(files);
    _validateFields();
  }

  void clearFiles() {
    selectedFiles.clear();
    _validateFields();
  }

  List<PlatformFile> getSelectedFiles() {
    return List.from(selectedFiles);
  }

  void setConsultant(String? value) {
    selectedConsultant.value = value;
    showMoreInfoConsultant.value = value != null;
    _validateFields();
  }

  void setValidationCallback(Function(bool)? callback) {
    onValidationChanged = callback;
  }
}
