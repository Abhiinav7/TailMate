import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/controller/petController.dart';
import 'package:tailmate/services/validation_services.dart';
import 'package:tailmate/view/MainPage/widgets/customAppbar.dart';
import 'package:tailmate/view/MainPage/widgets/customBottomsheet.dart';
import 'package:tailmate/view/MainPage/widgets/customButton.dart';
import 'package:tailmate/widgets/CustomTextfield.dart';

class AddPetScreen extends StatelessWidget {
  AddPetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final petKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: MyAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Sell My Pet.",
                    style: GoogleFonts.aDLaMDisplay(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.indigo),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: petKey,
                child: Consumer<PetController>(
                  builder: (context, controller, child) => Column(
                    children: [
                      controller.img == null
                          ? Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.indigo, width: 2),
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/logo/logo1.png")),
                              ),
                            )
                          : Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(130),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: FileImage(controller.img!))),
                            ),
                      SizedBox(
                        height: 15,
                      ),
                      MyButton(
                        text: "Choose Image",
                        onTap:(){
                          showModalBottomSheet<void>(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 120,
                                child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        MyButton(
                                          height: 35,
                                          width:200,
                                            onTap: (){controller.imagePickCamera();}, text: "Camera"),
                                        MyButton(
                                            height: 35,
                                            width:200,
                                            onTap: (){controller.imagePickGallery();}, text: "Gallery"),
                                      ],
                                    )),
                              );
                            },
                          );

                        } ,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      DropdownSearch<String>(
                        validator: (value) =>
                            Validation.validateDropList(value!),
                        popupProps: PopupProps.menu(
                          showSelectedItems: true,
                        ),
                        items: controller.petTypesList,
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            icon: Icon(Icons.pets),
                            contentPadding: EdgeInsets.all(5),
                            labelText: "Pet Type",
                          ),
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            controller.petTyp(value);
                          }
                        },
                        selectedItem: " ",
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MyTextfields(
                        labelText: "Pet name",
                        horizontalPadding: 8,
                        verticalPadding: 16,
                        validator: (value) => Validation.validateName(value!),
                        controller: controller.petNameController,
                        keyboardType: TextInputType.name,
                        hintText: 'Enter Pet Name',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MyTextfields(
                        labelText: "breed",
                        horizontalPadding: 8,
                        verticalPadding: 15,
                        validator: (value) => Validation.validateFields(value!),
                        controller: controller.petBreedController,
                        keyboardType: TextInputType.name,
                        hintText: 'Enter breed name',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MyTextfields(
                        labelText: "Discription",
                        horizontalPadding: 8,
                        verticalPadding: 20,
                        validator: (value) => Validation.validateFields(value!),
                        controller: controller.petDiscriptionController,
                        keyboardType: TextInputType.name,
                        hintText: 'About pet!',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text("Gender"),
                        ],
                      ),
                      SizedBox(
                        height: 45,
                        child: RadioListTile(
                          title: const Text('Male'),
                          value: "male",
                          groupValue: controller.petGender,
                          onChanged: (String? value) {
                            controller.petGen(value!);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        child: RadioListTile(
                          title: const Text('Female'),
                          value: "female",
                          groupValue: controller.petGender,
                          onChanged: (String? value) {
                            controller.petGen(value!);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MyTextfields(
                        suffixText: "years",
                        labelText: "Age",
                        horizontalPadding: 8,
                        verticalPadding: 15,
                        validator: (value) => Validation.validateFields(value!),
                        controller: controller.petAgeController,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        hintText: 'Enter pet age',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MyTextfields(
                        suffixText: "Kg",
                        labelText: "Weight",
                        horizontalPadding: 8,
                        verticalPadding: 15,
                        validator: (value) => Validation.validateFields(value!),
                        controller: controller.petWeightController,
                        keyboardType: TextInputType.name,
                        hintText: 'Enter pet weight',
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: 250,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.indigo.shade400)),
                            onPressed: () {
                              if (controller.img == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        content: Text("Image is empty")));
                              }

                              if (petKey.currentState!.validate()) {
                                petKey.currentState!.save();
                                if (controller.img != null) {
                                  controller.addPetData(
                                      controller.imageName, controller.files);
                                  Navigator.pushReplacementNamed(
                                      context, "/home");
                                }
                              }
                            },
                            child: Text(
                              "Sell Pet",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
