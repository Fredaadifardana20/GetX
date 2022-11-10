import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:minggu_9/controller/demoController.dart';
import 'package:minggu_9/controller/purchase.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class HomePage extends StatelessWidget {
  final purchase = Get.put(Purchase()); // controller inti
  DemoController cart = Get.find(); // controller cart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      bottomSheet: SafeArea(
        child: Card(
          elevation: 12.0,
          margin: EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            height: 65,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Icon(
                        Icons.shopping_cart_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                      Positioned(
                        right: 5,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Center(
                            child: GetX<DemoController>(builder: (controller) {
                              return Text(
                                '${controller.cartCount}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.0),
                              );
                            }),
                          ),
                        ),
                      )
                    ],
                  ),
                  GetX<DemoController>(
                    builder: (controller) {
                      return Text(
                        'Total Amount - ${controller.totalAmount}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 16.0),
                      );
                    },
                  ),
                  IconButton(
                      onPressed: () => Get.toNamed('/cart',
                          arguments:
                              "Home Page To Demo Page -> Passing arguments"),
                      icon: Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: GetX<Purchase>(
          builder: (controller) {
            return ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        'https://s0.bukalapak.com/img/0870981233/w-1000/Tas_eiger_2154_DIGI_VAULT_14_INC.jpg',
                        fit: BoxFit.cover,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.products[index].productName,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                  Text(
                                    controller
                                        .products[index].productDescription,
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12.0),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
