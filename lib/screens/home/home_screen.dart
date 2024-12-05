import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ged_app/components/search_bar.dart';
import 'package:ged_app/core/modele/document_model.dart';
import 'package:ged_app/core/provider/document_provider.dart';
import 'package:ged_app/core/provider/user_provider.dart';
import 'package:ged_app/core/themes/theme_colors.dart';
import 'package:ged_app/screens/add_file/add_new_file_screen.dart';
import 'package:ged_app/screens/home/components/noData_widget.dart';
import 'package:ged_app/screens/home/components/selected_list.dart';
import 'package:ged_app/screens/userProfil/userProfil_screen.dart';
import 'package:ged_app/widgets/skeleton/loader.dart';
import 'package:provider/provider.dart';

import 'components/list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  String? typefilter;

  ValueNotifier<List<String>> typeDocListNotifier =
      ValueNotifier<List<String>>([
    "Toutes",
    "Documents PDF",
    "Documents Word",
    "Documents Excel",
    "Images"
  ]);

  Widget typeFieldWidget() {
    return selectedWidget(
        dataList: typeDocListNotifier,
        hintText: "Filter par type ...",
        onSelected: (newValue) {
          setState(() {
            typefilter = newValue;
            typeDocListNotifier.notifyListeners();
          });
        },
        itemSelected: typefilter);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leadingWidth: 60,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          },
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey.shade100),
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            child: const Icon(
              CupertinoIcons.person,
              color: ThemeColors.primary,
              size: 22.0,
            ),
          ),
        ),
        title: _titleContent(context),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey.shade50),
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.power_settings_new_outlined,
                color: ThemeColors.primary,
                size: 24.0,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          RechercheBar(onClear: () {
            setState(() {
              searchController.clear();
            });
          }, onChanged: (String value) {
            setState(() {
              searchController.text = value;
            });
          }),
          Container(height: 65, child: typeFieldWidget()),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Mes Documents',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                color: ThemeColors.greyDeep,
              ),
            ),
          ),
          _buildDocumentList()
        ]),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        height: 50,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GestureDetector(
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const AddNewFileScreen(),
                ),
              );
            },
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.shade100),
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.all(8.0),
                child: const Icon(
                  CupertinoIcons.add,
                  color: ThemeColors.primary,
                  size: 20.0,
                ),
              ),
              const Text(
                'Nouveau document',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.greyDeep,
                ),
              ),
            ]),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const AddNewFileScreen(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey.shade100),
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.post_add_outlined,
                color: ThemeColors.primary,
                size: 24.0,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  String getFilterType() {
    switch (typefilter) {
      case "Toutes":
        return '';
      case "Documents PDF":
        return 'pdf';
      case "Documents Word":
        return 'docx';
      case "Documents Excel":
        return 'xlsx';
      default:
        return '';
    }
  }

  List<Document> filterDocuments(DocumentProvider docProvider) {
    List<Document> data = docProvider.documents
        .where((document) => document.name
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();

    return data
        .where(
            (element) => element.type.toLowerCase().contains(getFilterType()))
        .toList();
  }

  Widget _buildDocumentList() {
    return Consumer<DocumentProvider>(builder: (context, docProvider, child) {
      return docProvider.isLoading
          ? Expanded(
              child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return buildSkeletonLoader_Item(context, double.infinity, 70);
              },
            ))
          : filterDocuments(docProvider).isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filterDocuments(docProvider).length,
                  itemBuilder: (BuildContext context, int index) {
                    Document document = filterDocuments(docProvider)[index];
                    return ListItem(document: document);
                  },
                ))
              : Expanded(
                  child: Center(
                    child: noDataWidgetEasy(
                      text: searchController.text.isNotEmpty
                          ? "Aucun document correspondant à votre recherche"
                          : "Aucun document disponible",
                    ),
                  ),
                );
    });
  }

  _titleContent(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Joseph Boukhatir",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
        ),
        Text(
          "josephboukhatir@gmail.com",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w400,
              ),
        ),
      ]);
    });
  }
}
