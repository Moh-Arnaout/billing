import 'package:get/get.dart';

class RowsController extends GetxController {
  var selectedConsultant = RxnString();
  var selectedOfferNumber = RxnString();
  var selectedOfferDate = Rxn<DateTime>();
  var selectedOfferDate2 = RxnString();
  var itspressed = false.obs;
  var showMoreInfoConsultant = false.obs;
  var showMoreInfoOfferNumber = false.obs;
  var showMoreInfoOfferDate = false.obs;
  var comments = ''.obs;
  var invoiceNumber = ''.obs;
  var invoiceValue = ''.obs;
  var invoiceStatus = RxnString();
  var isAdditionalEdits = false.obs;
  var isUploadToCRM = false.obs;
  var isEmail = false.obs;
  var isScan = false.obs;
}
