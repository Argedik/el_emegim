import 'package:el_emegim/views/navigation_bar_pages/5.profiles.dart';
import 'package:el_emegim/views/navigation_bar_pages/view_models/profiles/profiles_body/profile_menu.dart';
import 'package:el_emegim/views/navigation_bar_pages/view_models/profiles/profiles_body/profile_picker.dart';
import 'package:el_emegim/views/navigation_bar_pages/view_models/profiles/profiles_details/add_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Fotoğraf Ekle",
            icon: "assets/icons/Add Document2.svg",
            press: () {
              Get.to(()=>AddImage());
            },
          ),
          ProfileMenu(
            text: "Hesabım",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Bildirimler",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Ayarlar",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Yardım",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Çıkış Yap",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),

        ],
      ),
    );
  }
}
