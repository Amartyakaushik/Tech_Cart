import 'package:flutter/material.dart';
import 'package:tech_cart/pages/home_detail_page.dart';
import '../../models/catalogModel.dart';
import 'catalog_item.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index){
        // final catalog = CatalogModel.getByPosition(index);
        final catalog = CatalogModel.items![index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeDetailPage(catalog: catalog),),),
          child: CatalogItem(catalog : catalog));
      },
      itemCount: CatalogModel.items!.length,
    );
  }
}
