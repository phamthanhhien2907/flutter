// ignore_for_file: unused_local_variable

import 'package:colen/plant_data.dart';
import 'package:colen/store/plant_info_cart.dart';
import 'package:colen/widget/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomSheetStore extends StatefulWidget {
  final Plant treeDetail;
  final List<Plant> allPlants;
  const BottomSheetStore({
    super.key,
    required this.treeDetail,
    required this.allPlants,
  });

  @override
  State<BottomSheetStore> createState() => _BottomSheetStoreState();
}

class _BottomSheetStoreState extends State<BottomSheetStore> {
  // định nghĩa biến có kiểu dữ liệu là List = []
  late final List<Plant> allPlants;
  // định nghĩa biến có kiểu dữ liệu là String
  late final Plant currentTree;

  @override
  void initState() {
    super.initState();
    // gán currentTree = treeDe
    currentTree = widget.treeDetail;
    allPlants = widget.allPlants;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 16.0,
        bottom: 56.0,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 48.0,
            height: 8.0,
            decoration: BoxDecoration(
              color: const Color(0x3F06492C),
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          const SizedBox(height: 40.0),
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(currentTree.imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            currentTree.plantName,
            style: const TextStyle(
              color: Color(0xFF111111),
              fontSize: 24.0,
              fontFamily: 'Proxima Nova',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                currentTree.plantType,
                style: const TextStyle(
                  color: Color(0xBF06492C),
                  fontSize: 21.0,
                  fontFamily: 'Proxima Nova',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                width: 4.0,
                height: 4.0,
                decoration: const BoxDecoration(
                  color: Color(0xBF06492C),
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                '\$${currentTree.price}',
                style: const TextStyle(
                  color: Color(0xFF0C9359),
                  fontSize: 21.0,
                  fontFamily: 'Proxima Nova',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          SizedBox(
            width: screenWidth * 0.75,
            child: Text(
              currentTree.description,
              maxLines: 2,
              style: const TextStyle(
                color: Color(0xBF111111),
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24.0),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32.0),
                  ),
                ),
                builder: (BuildContext context) {
                  return PlantInfoCart(
                      treeDetail: currentTree, allPlants: allPlants);
                },
              );
            },
            child: const Text(
              'Read more',
              style: TextStyle(
                color: Color(0xFF0C9359),
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 32.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 14.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: const Color(0xFF0C9359),
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.heart,
                    color: Color(0xFF0C9359),
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: SizedBox(
                  child: SubmitButton(
                    text: 'Add to Cart',
                    textColor: Colors.white,
                    backgroundColor: const Color(0xFF0C9359),
                    boxShadowColor: const Color(0x1F0C9359),
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
