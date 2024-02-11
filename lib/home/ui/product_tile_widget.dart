import 'package:first_project_flutter/home/model/product_data_model.dart';
import 'package:flutter/material.dart';

class PorductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  const PorductTileWidget({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/peakpx 3.jpg')),
            ),
          ),
            Text(productDataModel.name),
            Text(productDataModel.brand),
        ],
      ),
    );
  }
}