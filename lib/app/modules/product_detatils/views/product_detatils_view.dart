import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/utils/resources/color_manager.dart';

import '../controllers/product_detatils_controller.dart';

// class ProductDetatilsView extends GetView<ProductDetatilsController> {
//   const ProductDetatilsView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ProductDetatilsView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'ProductDetatilsView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class ProductDetatilsView extends GetView<ProductDetatilsController> {
  const ProductDetatilsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          header(),
          hero(),
          Expanded(child: section()),
          bottomButton(context)
        ],
      ),
    ));
  }
}

Widget header() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        Column(
          children: [
            Text("Smiles Offers",
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16)),
            Text("Yum Burger",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24))
          ],
        ),
        Icon(Icons.shopping_bag),
      ],
    ),
  );
}

Widget hero() {
  return Container(
    child: Stack(
      children: [
        Image.asset("assets/images/img1.webp"),
        Positioned(
            bottom: 10,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {},
              child: Icon(Icons.favorite_border),
              // child: Image.asset(

              //   // isFavourite ? "images/heart_icon.png" : "images/heart_icon_disabled.png",
              //   height: 34,
              //   width: 34,
              // ),
            ))
      ],
    ),
  );
}

Widget section() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Column(
      children: [
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In "
          "rutrum at ex non eleifend. Aenean sed eros a purus "
          "gravida scelerisque id in orci. Mauris elementum id "
          "nibh et dapibus. Maecenas lacinia volutpat magna",
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 14, height: 1.5),
        ),
        SizedBox(height: 20),
        property()
      ],
    ),
  );
}

Widget property() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Size",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 10),
            Row(
              children: ["S", "M", "L"]
                  .map((e) => GestureDetector(
                        onTap: () {
                          // print("index $index clicked");
                          // setState(() {
                          //   selectedColor = colors[index];
                          // });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(right: 10),
                          height: 34,
                          width: 34,
                          child: AppText(
                            e,
                            style: TextStyle(
                              color: ColorManager.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ],
    ),
  );
}

Widget bottomButton(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(right: 20),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              final snackbar = SnackBar(
                content: Text(
                  '🏆 1 points added to your score',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                duration: Duration(milliseconds: 3000),
                elevation: 8,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.green,
                margin: EdgeInsets.only(
                    bottom: Get.height - 100, right: 8.0, left: 8.0),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              Get.back();
            },
            child: AppText(
              "Buy Now",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
          Text(r"$95",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 28))
        ],
      ),
    ),
  );
}
