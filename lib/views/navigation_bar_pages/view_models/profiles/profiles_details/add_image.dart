import 'package:el_emegim/dao/firebase.dart';
import 'package:el_emegim/getx/product_controller.dart';
import 'package:el_emegim/views/navigation_bar_pages/view_models/5.profiles_page_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddImage extends StatefulWidget {
  const AddImage({Key? key}) : super(key: key);

  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    final Storage storage= Storage();
    return Scaffold(
      appBar: AppBar(
        title: Text("Resim Ekle"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_a_photo),
            tooltip: 'Open shopping cart',
            onPressed: () async {
              final results = await FilePicker.platform.pickFiles(
                allowMultiple: false,
                type: FileType.custom,
                allowedExtensions: ["png", "jpg"],
              );
              if (results == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Dosya seçilmedi.")));
                return;
              }
              final path =results.files.single.path!;
              final fileName = results.files.single.name;
              storage.uploadFile(path, fileName).then((value) => print("done"));
              print("$path deneme");
              print(fileName);
            },
          ),
          SizedBox(
            width: 20.0,
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => Flexible(
                child: ListView.builder(
                  itemCount: productController.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Images(index: index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Images extends StatelessWidget {
  final ProductController productController = Get.find();
  final int index;

  Images({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.red,
            backgroundImage:
                NetworkImage(productController.products[index].imageUrl),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
              child: Text(
            productController.products[index].name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          )),
          Expanded(child: Text("${productController.products[index].price} ₺")),
        ],
      ),
    );
  }
}
