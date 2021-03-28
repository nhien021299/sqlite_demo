import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqlite_demo/injector.dart';
import 'package:sqlite_demo/modules/drink/app/ui/test_view_model.dart';
import 'package:sqlite_demo/modules/drink/domain/models/photo.dart';
import 'package:suga_core/suga_core.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends BaseViewState<Test, TestViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
        backgroundColor: Color(0xFF2ac1bc),
      ),
      body: Center(
        child: Obx(
          () => viewModel.photos.length != null
              ? ListView.builder(
                  itemCount: viewModel.photos?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onLongPress: (){
                        viewModel.onDeletePhoto(index);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 300,
                        width: 300,
                        child: Image.file(
                          File(viewModel.photos[index].photoName),
                        ),
                      ),
                    );
                  },
                )
              : Text('Please add a photo'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.getImage(ImageSource.gallery);
        },
        backgroundColor: Color(0xFF2ac1bc),
        child: Icon(Icons.camera_alt),
      ),
    );
  }

  @override
  TestViewModel createViewModel() => injector<TestViewModel>();
}
