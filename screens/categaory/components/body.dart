import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project1/Project_Implementation/Database/db_helper.dart';
import 'package:project1/Project_Implementation/model/category.dart';

class body_categaory extends StatefulWidget {
  Category? category;


  body_categaory(this.category);

  @override
  State<body_categaory> createState() => _body_categaoryState(category);
}

class _body_categaoryState extends State<body_categaory> {
  Category? category;

  _body_categaoryState(this.category);

  final titleController = TextEditingController();
  final decriptionController = TextEditingController();
  DbHelper db_helper = DbHelper();
  @override
  void initState() {
    super.initState();
    // titleController.text = category!.title!;
    // decriptionController.text = category!.description!;
    if (category != null) {
      titleController.text = category!.title ?? '';
      decriptionController.text = category!.description ?? '';
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    File? imagefile;
    ImagePicker imagepicker = ImagePicker();
    Future<void> pickImageFromGallary() async {
      var tempFile = await imagepicker.pickImage(source: ImageSource.gallery);

      if (tempFile != null) {
        var file = File(tempFile.path);
        setState(() {
          imagefile = file;
        });
      }
    }

    return Center(
      child: SingleChildScrollView(
        reverse: true,
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  pickImageFromGallary();
                },
                child: CircleAvatar(

                  backgroundColor: Colors.grey.withOpacity(.30),
                  radius: 60,
                  backgroundImage: imagefile != null ? FileImage(imagefile!) : AssetImage('assets/Images1/rating.png') as ImageProvider,
                ),
              ),
              SizedBox(height: 24,),
              buildTitleFormField(),
              SizedBox(height: 16,),
              buildDescriptionFormField(),
              SizedBox(height: 24,),
              buildAddCategoryButtonWidget(context),
              SizedBox(height: 24,),

            ],
          ),
        ),
      ),
    );
  }

  buildTitleFormField() {
    return TextFormField(
      controller: titleController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Category",
        hintText: 'Category Name',
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildDescriptionFormField() {
    return TextFormField(
      controller: decriptionController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Description",
        hintText: 'Description',
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildAddCategoryButtonWidget(BuildContext context) {
    return MaterialButton(
      color: Colors.green,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      onPressed: () async {
        String _title = titleController.text.toString().trim();
        String _desc = decriptionController.text.toString().trim();
        print("Title : $_title , Decription : $_desc");

        Category category = Category(title : _title , description : _desc);
        addcategory(category, context);

      },
      child: Text(
        category ==  null ?  "Add Category" : "Update Category",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
  Future<void> addcategory(Category category, BuildContext context) async {
    int? id = await db_helper.insert(category);
    if (id != -1) {
      print('category added successfully');
      category.id = id;
      Navigator.pop(context, category);
    } else {
      print('getting error');
    }
  }
  }




