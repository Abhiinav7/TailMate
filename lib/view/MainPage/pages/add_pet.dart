import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/controller/petController.dart';
import 'package:tailmate/services/validation_services.dart';
import 'package:tailmate/view/MainPage/widgets/customAppbar.dart';
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
                      MyTextfields(
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
                        horizontalPadding: 8,
                        verticalPadding: 20,
                          validator: (value) =>
                              Validation.validateFields(value!),
                          controller: controller.petDiscriptionController,
                        keyboardType: TextInputType.name,
                        hintText: 'About pet!',
                         ),
                      SizedBox(
                        height: 15,
                      ),
                      DropdownSearch<String>(

                        popupProps: PopupProps.menu(

                          showSelectedItems: true,
                          disabledItemFn: (String s) => s.startsWith('I'),
                        ),
                        items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                        dropdownDecoratorProps: DropDownDecoratorProps(

                          dropdownSearchDecoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            focusedBorder: OutlineInputBorder(),
                            labelText: "Breed",
                            hintText: "country in menu mode",
                          ),
                        ),
                        onChanged: print,
                        selectedItem: "",
                      ),


                      TextButton(
                          onPressed: () {
                            if (petKey.currentState!.validate()) {
                              petKey.currentState!.save();
                            }
                          },
                          child: Text("Sell Pet"))
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
