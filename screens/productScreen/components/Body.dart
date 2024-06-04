import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/Project_Implementation/Database/db_helper.dart';
import 'package:project1/Project_Implementation/firebase/firebase.dart';
import 'package:project1/Project_Implementation/model/category.dart';
import 'package:project1/Project_Implementation/model/product.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Category> categoryList = [];  //Category ni list create karvnai //NEW TOPIC
  DbHelper dbhelper = DbHelper();    //Dropdown menu using the database(Dbhelper)
  Firebase_Services services = Firebase_Services();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController(text: "0.0");
  final _discountController = TextEditingController(text: "0");
  int categotyId = -1;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryList();  //same as the previous function in categoryScreen using Dbhelper
  }

  @override
  Widget build(BuildContext context) {
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
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(.30),
                  radius: 60,
                  child: const Icon(
                    Icons.add,
                    size: 50,
                    color: Colors.black45,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              buildTitleFormField(),
              const SizedBox(
                height: 16,
              ),
              buildDescriptionFormField(),
              const SizedBox(
                height: 24,
              ),
              buildAddCategoryButtonWidget(),
              const SizedBox(
                height: 24,
              ),
              buildPriceFormField(),
              SizedBox(
                height: 24,
              ),
              buildAddProductButtonWidget(),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildTitleFormField() {
    return TextFormField(
      controller: _titleController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Product",
        hintText: "Product Name",
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildDescriptionFormField() {
    return TextFormField(
      controller: _descriptionController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Description",
        hintText: "Product Description",
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildAddCategoryButtonWidget() {
    return DropdownButtonFormField(
      iconEnabledColor: Colors.black45,
      validator: (value) {
        if (value == null) {
          return "Select The Category";
        } else {
          return null;
        }
      },
      onSaved: (newValue) {},
      decoration: InputDecoration(
        labelText: "Category",
        hintText: "Select Category",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      items: categoryList.map((category) { // items use to show the list in foam of dynamic //NEW TOPIC
        return DropdownMenuItem(           // convert into the map and get the value one-by-one using the DropdownMenuItem and show the text foam and getting the value as the category.id
          value: category.id,
          child: Text(
            '${category.title}',
          ),
        );
      }).toList(),
      onChanged: (value) {
        categotyId = value!;
        print(value);
      },
    );
  }

  buildPriceFormField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter The Amount";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Price",
              hintText: "Enter The Price",
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            controller: _discountController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Discount";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Discount",
              hintText: "Enter Discount",
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          ),
        )
      ],
    );
  }

  buildAddProductButtonWidget() {
    return MaterialButton(
      color: Colors.green,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      onPressed: () {
        String title = _titleController.text.toString().trim();
        String description = _descriptionController.text.toString().trim();
        double price = _priceController.text.toString().trim().isEmpty ? 0.0 : double.parse(_priceController.text.toString().trim());
        int discount = _discountController.text.toString().trim().isEmpty ? 0 : int.parse(_discountController.text.toString().trim());

        Product product = Product(title: title, description: description, mrp: price, discount: discount, categoryId: categotyId, imagepath: "");

        addProduct(product);

        print('''
        title = $title
        description = $description
        price = $price
        discount = $discount
        categoryID = $categotyId
        ''');
      },
      child: Text(
        'Add Product',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> getCategoryList() async {
    var list = await dbhelper.getCategoryList();
    setState(() {
      categoryList = list;
    });
  }

  void addProduct(Product product) {
    services.createProduct(product).then( (value) {
      if(value){
        Navigator.pop(context);
      }
    });

  }
}
