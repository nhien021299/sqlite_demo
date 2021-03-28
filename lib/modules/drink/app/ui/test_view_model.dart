import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:sqlite_demo/modules/drink/domain/models/photo.dart';
import 'package:suga_core/suga_core.dart';

@lazySingleton
class TestViewModel extends BaseViewModel {
  RxList<Photo> _photos = RxList<Photo>();

  List<Photo> get photos => _photos.toList();

  Future getImage(ImageSource imageSource) async {
    final picker = await ImagePicker().getImage(source: imageSource);
    if (picker != null) {
      _photos.add(Photo(photoName: picker.path));
    }
  }

  void onDeletePhoto(int index){
    Get.defaultDialog(
      title: "Are you sure ?",
      middleText: "",
      textConfirm: "Yes",
      textCancel: "No",
      onConfirm: () {
        Get.back();
        _photos.removeAt(index);
      },
      onCancel: () {
        Get.back();
      },
    );
  }
}
