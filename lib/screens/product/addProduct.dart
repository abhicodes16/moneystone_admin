import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:moneystone_admin/style/Palette.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'package:moneystone_admin/style/constants.dart';
import 'package:moneystone_admin/utils/common.dart';
import 'package:moneystone_admin/widgets/customDescription.dart';
import 'package:moneystone_admin/widgets/customTextField.dart';
import 'package:moneystone_admin/widgets/cutomePhoneTextField.dart';
import 'package:moneystone_admin/widgets/error_dialouge.dart';
import 'package:moneystone_admin/widgets/loadingDialog.dart';

class AddProduct extends StatefulWidget {
  AddProduct({Key key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final GlobalKey<State> _errorKeyLoader = new GlobalKey<State>();

  TextEditingController _productNameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _detailsController = TextEditingController();
  TextEditingController _FeatureOneController = TextEditingController();
  TextEditingController _FeatureTwoController = TextEditingController();
  TextEditingController _minimumController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _lengthController = TextEditingController();
  TextEditingController _widthController = TextEditingController();

  List<String> _statusDropDown = ['Active', 'De-Active'];
  String _selectedStatus = 'Active';

  var appbarTitle;

  String _imageInfo = '';
  final _pickedImages = <Image>[];

  List<int> _selectedFile;
  Uint8List _bytesData;

  // Future<void> _pickImage() async {
  //   Image fromPicker =
  //       await ImagePickerWeb.getImage(outputType: ImageType.widget);

  //   if (fromPicker != null) {
  //     setState(() {
  //       _pickedImages.clear();
  //       _pickedImages.add(fromPicker);
  //       print('From Picker ==== $fromPicker');
  //     });
  //   }
  // }

  // Future<void> _getImgFile() async {
  //   html.File infos = await ImagePickerWeb.getImage(outputType: ImageType.file);
  //   setState(() {
  //     _imageInfo = 'Name: ${infos.name}\nRelative Path: ${infos.relativePath}';
  //     print('Image Info : $_imageInfo');
  //   });
  // }

  // Future<void> _getImgInfo() async {
  //   final infos = await ImagePickerWeb.getImageInfo;
  //   setState(() {
  //     _pickedImages.clear();
  //     _pickedImages.add(Image.memory(
  //       infos.data,
  //       semanticLabel: infos.fileName,
  //     ));
  //     _imageInfo = '${infos.toJson()}';
  //   });
  // }

  @override
  void initState() {
    super.initState();
    appbarTitle = 'Add Product';
  }

  //---------------- build function ----------------//
  @override
  Widget build(BuildContext context) {
    //---------------- Scaffold ----------------//
    return Scaffold(
      appBar: AppBar(
        title: Text('$appbarTitle', style: Palette.appbarTitle),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 30.0),
          child: _cardWidget(),
        ),
      ),
    );
  }

  Widget _cardWidget() {
    return LayoutBuilder(builder: (context, constraits) {
      return Center(
        child: Container(
          width: constraits.maxWidth > 1200
              ? MediaQuery.of(context).size.width / 2
              : MediaQuery.of(context).size.width,
          child: Card(
            margin: EdgeInsets.all(25.0),
            shape: Palette.cardShape,
            shadowColor: Colors.green[700],
            elevation: 18.0,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 20.0),
                          CustomTextField(
                            controller: _productNameController,
                            hint: 'Product Name',
                          ),
                          SizedBox(height: 10.0),
                          CustomDescriptionTextField(
                            controller: _detailsController,
                            hint: 'Description',
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            child: Row(
                              children: [
                                SizedBox(width: 40.0),
                                Expanded(
                                    child: Text('Price', style: Palette.title)),
                                Expanded(
                                  child: CustomTextField(
                                    controller: _priceController,
                                    hint: 'INR',
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            child: Row(
                              children: [
                                SizedBox(width: 40.0),
                                Expanded(
                                    child: Text('Minimum Qty.',
                                        style: Palette.title)),
                                Expanded(
                                  child: CustomTextField(
                                    controller: _minimumController,
                                    hint: '',
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Height',
                                        style: Palette.title,
                                      ),
                                    ),
                                    CustomTextField(
                                      controller: _heightController,
                                      hint: '0',
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Width',
                                        style: Palette.title,
                                      ),
                                    ),
                                    CustomTextField(
                                      controller: _widthController,
                                      hint: '0',
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Length',
                                        style: Palette.title,
                                      ),
                                    ),
                                    CustomTextField(
                                      controller: _lengthController,
                                      hint: '0',
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                    Expanded(child: _imagePickerWidget())
                  ],
                ),
                SizedBox(height: 30.0),
                _uploadBtnWidget(),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _uploadBtnWidget() {
    return MaterialButton(
      onPressed: () {
        //_uploadProductApi();
        //_getImgFile();
      },
      minWidth: 200.0,
      height: 55.0,
      elevation: 0.0,
      color: kThemeColor,
      shape: Palette.btnShape,
      child: Text('Upload', style: Palette.whiteBtn),
    );
  }

  Image image;

  Widget _imagePickerWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Wrap(
          //   // spacing: 15.0,
          //   children: <Widget>[
          //     AnimatedSwitcher(
          //       duration: const Duration(milliseconds: 300),
          //       switchInCurve: Curves.easeIn,
          //       child: SizedBox(
          //         width: 300,
          //         height: 300,
          //         child: ListView.builder(
          //             scrollDirection: Axis.horizontal,
          //             itemCount:
          //                 _pickedImages == null ? 0 : _pickedImages.length,
          //             itemBuilder: (context, index) => _pickedImages[index]),
          //       ),
          //     ),
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: image != null ? image : Text('No Image selected...')),
          ),
          MaterialButton(
            //onPressed: _pickImage,
            onPressed: () async {
              // final _image = await FlutterWebImagePicker.getImage;

              // setState(() {
              //   image = _image;
              // });
            },
            child: Text('Pick Image'),
            color: Colors.green[50],
            shape: Palette.btnShape,
            minWidth: 200.0,
            height: 55.0,
            elevation: 0.0,
          )
        ],
      ),
    );
  }

  //
  /*--------------- Add user Calling -------------*/
  Future<String> _uploadProductApi() async {
    LoadingDialog.showLoadingDialog(context, _keyLoader);

    var productName = _productNameController.text;
    var price = _priceController.text;
    var details = _detailsController.text;
    var featureOne = _FeatureOneController.text;
    var featureTwo = _FeatureTwoController.text;
    var minimum = _minimumController.text;
    var height = _heightController.text;
    var lenght = _lengthController.text;
    var width = _widthController.text;

    final String url = Common.PRODUCT;

    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest("POST", Uri.parse(url));

    //add text fields
    request.fields["productName"] = "$productName";
    request.fields["price"] = "$price";
    request.fields["details"] = "$details";
    request.fields["featureOne"] = "$featureOne";
    request.fields["featureTwo"] = "$featureTwo";
    request.fields["minimum"] = "$minimum";
    request.fields["height"] = "$height";
    request.fields["lenght"] = "$lenght";
    request.fields["width"] = "$width";

    if (_imageInfo == null) {
      _imageInfo = null;
    } else {
      var userImage = await http.MultipartFile.fromPath(
          "image", _pickedImages[0].toString());
      request.files.add(userImage);
    }

    var response = await request.send();
    print(response.statusCode);

    //listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
      Map<String, dynamic> decode = json.decode(value);

      setState(() {
        if (response.statusCode == 200) {
          Navigator.pop(_keyLoader.currentContext);

          ErrorDialouge.showErrorDialogue(
              context, _errorKeyLoader, 'Product Add Successfully.');

          //Navigator.pop(context);
        }
        //wrong username and password
        else {
          ErrorDialouge.showErrorDialogue(
              context, _errorKeyLoader, 'Product Upload Faild..!');
        }
      });
    });

    return 'Success';
  }
}
