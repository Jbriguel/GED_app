import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ged_app/components/defaultButton.dart';
import 'package:ged_app/core/themes/theme_colors.dart';
import 'package:ged_app/core/themes/theme_images.dart';
import 'package:ged_app/widgets/customImageView.dart';
import 'package:ged_app/widgets/input/cutomInput.dart';

class AddNewFileScreen extends StatefulWidget {
  const AddNewFileScreen({super.key});

  @override
  State<AddNewFileScreen> createState() => _AddNewFileScreenState();
}

class _AddNewFileScreenState extends State<AddNewFileScreen> {
  String? _fileName;
  File? _file;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _documentNameController = TextEditingController();
  final TextEditingController _serviceNameController = TextEditingController();

  //-------------------------------------------------------------//
  String message = '';

  bool reload = false;

  void setMessage(String msg) {
    setState(() {
      message = msg;
    });
  }

  //-------------------------------------------------------------//

  void _pickFile() async {
    //await FilePicker.platform.pickFiles(
    // Ouvre le sélecteur de fichiers avec des extensions de fichiers spécifiques
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom, // Type de fichier personnalisé
      allowedExtensions: [
        'jpg',
        'jpeg',
        'png',
        'pdf',
        'docx'
      ], // Extensions autorisées
    );

    if (result != null) {
      // Récupère le fichier sélectionné
      String? path = result.files.single.path;
      setState(() {
        _fileName = result.files.single.name; // Nom du fichier
        _file = File(path!); // Chemin du fichier
      });
      print('Fichier choisi : $_fileName');
    } else {
      // Aucun fichier sélectionné
      Flushbar(
        message: "Aucun fichier choisi",
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        margin: const EdgeInsets.all(8),
        flushbarPosition: FlushbarPosition.BOTTOM,
        flushbarStyle: FlushbarStyle.FLOATING,
        forwardAnimationCurve: Curves.decelerate,
        duration: const Duration(seconds: 3),
        icon: const Icon(
          Icons.info,
          color: Colors.white,
        ),
        backgroundColor: ThemeColors.greyDeep,
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1)),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          elevation: 1.0,
          centerTitle: true,
          title: const Text(
            "Uploader Document",
            style: TextStyle(
                color: Colors.black, fontFamily: "Aller", fontSize: 15),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: CustomImageView(
                      imagePath: Images.logo1,
                      fit: BoxFit.contain,
                      height: 70,
                    ),
                  ),
                  Expanded(
                    child: Column(children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: AutoSizeText(
                          "Renseignez les informations les champs correspondants.",
                          presetFontSizes: [13, 12],
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ThemeColors.greyDeep,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5),
                        child: InputTextField(
                            type: "info",
                            text: "Nom du Document",
                            controller: _documentNameController,
                            prefixIcon: true),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5),
                        child: InputTextField(
                            type: "info",
                            text: "Nom Département",
                            controller: _serviceNameController,
                            prefixIcon: true),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      _documentAddedZone,
                      DefaultButton(
                          paddingV: 10,
                          fontSize: 15,
                          textColor: ThemeColors.white,
                          backColor: ThemeColors.primary,
                          text: "Ajouter".toUpperCase(),
                          press: () {}),
                    ]),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  get _documentAddedZone => GestureDetector(
        onTap: _pickFile,
        child: Card(
          elevation: 1.0,
          surfaceTintColor: Colors.transparent,
          color: ThemeColors.white,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            leading: CircleAvatar(
              backgroundColor: ThemeColors.primary,
              child: Icon(
                CupertinoIcons.doc_plaintext,
                color: ThemeColors.white,
              ),
            ),
            title: Text(
              "Ajouter un document",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ThemeColors.greyDeep,
              ),
            ),
            subtitle: Text(
              "Choisir un fichier à envoyer",
              style: TextStyle(
                fontSize: 12,
                color: ThemeColors.greyDeep,
              ),
            ),
            trailing: Icon(Icons.add_circle_outline_rounded),
          ),
        ),
      );
}
