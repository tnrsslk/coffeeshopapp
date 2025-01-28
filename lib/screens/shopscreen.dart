// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:coffeeshopapp/data/productrepo.dart';
import 'package:coffeeshopapp/widgets/shopitem.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int activecategory = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 12, bottom: 2),
            child: Text(
              "Welcome, ${GetIt.I.get<SharedPreferences>().getString("username") ?? "User"}",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontFamily: "Cartoonist",
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            child: Text(
              "Fuel Your Passion for Great Coffee",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(193, 77, 77, 77),
                fontFamily: "Cartoonist",
              ),
            ),
          ),
          const SizedBox(height: 15),
          // Оборачиваем в SingleChildScrollView для прокрутки
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                categoryButton(1, "Hot Drinks", "assets/coffeecup.png", "assets/hotcoffee.png"),
                categoryButton(2, "Cold Drinks", "assets/icedcoffee.png", "assets/bubbletea.png"),
                categoryButton(3, "Snacks", "assets/muffins.png", "assets/cake.png"),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: SingleChildScrollView(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 6.6 / 10,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, id) {
                    return ShopItem(
                      product: ProductRepository.getbycategory(
                        activecategory,
                        GetIt.I.get<SharedPreferences>().getBool("onlyvegan") ?? false,
                      )[id],
                    );
                  },
                  itemCount: ProductRepository.getbycategory(
                    activecategory,
                    GetIt.I.get<SharedPreferences>().getBool("onlyvegan") ?? false,
                  ).length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Метод для создания кнопок категорий
  Widget categoryButton(int category, String label, String image1, String image2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            activecategory = category;
          });
        },
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: (activecategory == category)
                ? const Color.fromARGB(255, 105, 54, 3)
                : const Color.fromARGB(255, 180, 166, 124),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: (activecategory == category)
                      ? const Color.fromARGB(255, 237, 201, 154)
                      : Colors.black,
                  fontWeight: FontWeight.w900,
                  fontFamily: "Cartoonist",
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 8),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(height: 32, child: Image.asset(image1)),
                  Positioned(
                    right: -15,
                    child: SizedBox(height: 32, child: Image.asset(image2)),
                  ),
                ],
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ),
    );
  }
}
