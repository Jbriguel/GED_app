import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ged_app/components/defaultButton.dart';
import 'package:ged_app/components/ligne_details.dart';
import 'package:ged_app/core/modele/document_model.dart';
import 'package:ged_app/core/themes/theme_colors.dart';
import 'package:ged_app/core/themes/theme_images.dart';
import 'package:ged_app/screens/add_file/updateFile_screen.dart';
import 'package:ged_app/widgets/bottomSheet_cardContent.dart';
import 'package:ged_app/widgets/customImageView.dart';

class ListItem extends StatelessWidget {
  ListItem({super.key, required this.document});
  Document document;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CardContentBottomSheet.show(context,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    document.name,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 15,
                        color: ThemeColors.greyDeep,
                        fontFamily: "Aller",
                        fontWeight: FontWeight.normal),
                  ),
                  AutoSizeText(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: ThemeColors.greyDeep.withOpacity(0.95),
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  detailsLigne(
                    paddingV: 2,
                    titre: "Type",
                    data: document.type,
                    nLigne: 1,
                    dataColor: ThemeColors.greyDeep,
                  ),
                  detailsLigne(
                    paddingV: 2,
                    titre: "Archivé par",
                    data: document.archivedBy ?? 'Unknown',
                    nLigne: 1,
                    dataColor: ThemeColors.greyDeep,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    " Servcice : ${document.serviceName ?? 'Pas de service'}",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 13,
                        color: ThemeColors.greyDeep,
                        fontWeight: FontWeight.w500),
                  ),
                  DefaultButton(
                    backColor: ThemeColors.primary,
                    text: 'Modifier',
                    elevation: 1.0,
                    textColor: Colors.white,
                    fontSize: 15,
                    height: 40,
                    press: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              UpdateFileScreen(document: document),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            fit: BoxFit.contain,
            setCircle: false,
            image: Images.logo2);
      },
      child: ListTile(
        leading: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey.shade100),
            padding: const EdgeInsets.all(8.0),
            child: getDocumentIcon(type: document.type)),
        title: Text(
          document.name,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   document.serviceName ?? 'Pas de service',
            //   overflow: TextOverflow.ellipsis,
            //   style: Theme.of(context).textTheme.bodySmall!.copyWith(
            //         fontWeight: FontWeight.w400,
            //         color: Colors.black87,
            //       ),
            // ),
            Text(
              document.archivedBy == null
                  ? 'Non archivé'
                  : 'by ${document.archivedBy}',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
            ),
          ],
        ),
        trailing: Container(
          decoration: BoxDecoration(
              color: !document.validated
                  ? ThemeColors.greyDeep.withOpacity(0.2)
                  : ThemeColors.redOrange.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5.0)),
          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
          child: Text(
            document.validated ? "Validé" : "Non Validé",
            style: TextStyle(
              fontSize: 9,
              color: !document.validated
                  ? ThemeColors.greyDeep.withOpacity(0.8)
                  : ThemeColors.redOrange.withOpacity(0.8),
            ),
          ),
        ),
      ),
    );
  }
}

class getDocumentIcon extends StatelessWidget {
  getDocumentIcon({
    super.key,
    required this.type,
  });
  String type;

  getImage() {
    switch (type) {
      case "DOCX":
        return Images.docx;
      case "PDF":
        return Images.pdf;
      case "Image":
        return Images.image;
      case "XLSX":
        return Images.xlxs;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: getImage(),
      height: 24,
      fit: BoxFit.contain,
    );
  }
}
