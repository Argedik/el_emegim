import 'package:el_emegim/dao/firebase.dart';
import 'package:el_emegim/models/customer_product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  final products =<CustomerProduct>[].obs;
  @override
  void onInit(){
    products.bindStream(Database().getAllProducts());
    super.onInit();
  }
}