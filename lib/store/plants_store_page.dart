import 'package:colen/plant_data.dart';
import 'package:colen/store/bottom_sheet_store.dart';
import 'package:colen/widget/big_text.dart';
import 'package:colen/widget/custom_text.dart';
import 'package:flutter/material.dart';

class PlantsStorePage extends StatefulWidget {
  const PlantsStorePage({super.key});

  @override
  State<PlantsStorePage> createState() => _PlantsStorePageState();
}

class _PlantsStorePageState extends State<PlantsStorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FDFB),
      body: SizedBox(
        // width và height đc set để phù hợp với mọi màn hình
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SizedBox(
            height: 310,
            // khi nào dùng listview.builder -> khi mà muốn đổ api (bởi vì dữ liệu nhiều nên ta phải dùng list view để có thanh kéo và  listview builder nó  giống vs hàm map trong js)
            child: ListView.builder(
              // axis.horizontal là trục ngang nên dữ liệu đc đổ từ trái qua phải
              // axis.vertical là trục thẳng nên dữ liệu đc đổ từ trên xuống dưới

              scrollDirection: Axis.horizontal,
              // item count là lấy cái số lượng api mình hiện có
              itemCount: samplePlants.length,
              // hàm này làm gì -> là nó sẽ chạy lặp qua tất cả api mình mà mình có nó mặc định có 2 giá trị
              itemBuilder: (BuildContext context, int index) {
                return _buildPageItem(samplePlants[index], index, samplePlants);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageItem(var plant, int position, var allPlants) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(32),
            ),
          ),
          builder: (BuildContext context) {
            return Wrap(
              children: [
                BottomSheetStore(
                  treeDetail: samplePlants[position],
                  allPlants: samplePlants,
                ),
              ],
            );
          },
        );
      },
      child: Container(
        width: 177,
        height: 250,
        margin: EdgeInsets.only(
            left: position == 0 ? 24 : 6, right: 6, top: 30, bottom: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1F0C9359),
              blurRadius: 20,
              offset: Offset(0, 8),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 177,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(plant.imageUrl),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            BigText(
              text: plant.plantName,
              color: const Color(0xFF06492C),
              fontSize: 21,
              fontFamily: 'Proxima Nova',
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: '\$${plant.price}',
              color: const Color(0xBF06492C),
              fontSize: 14,
            )
          ],
        ),
      ),
    );
  }
}
