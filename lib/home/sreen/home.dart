import 'package:cardapp/home/widget/card_img.dart';
import 'package:cardapp/home/widget/card_infor.dart';
import 'package:cardapp/home/widget/wallet_can1.dart';
import 'package:cardapp/home/widget/wallet_can2.dart';
import 'package:cardapp/home/widget/wallet_can3.dart';
import 'package:cardapp/utility/appColors.dart';
import 'package:cardapp/utility/image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LifelineHomePage extends StatefulWidget {
  const LifelineHomePage({super.key});

  @override
  State<LifelineHomePage> createState() => _LifelineHomePageState();
}

class _LifelineHomePageState extends State<LifelineHomePage> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.arrow_back_ios_new),
            SizedBox(width: 8),
            Text('Card & Wallets', style: TextStyle(color: Colors.black)),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topCardSection(screenWidth),
            const SizedBox(height: 24),

            // Activation Card Section
            buildActivationCard(screenWidth),
            const SizedBox(height: 24),

            // Wallet Section
            _buildWalletSection(),

            const SizedBox(height: 24),
            walletCont1(screenWidth),
            walletCont2(screenWidth),
            walletCont3(screenWidth),
          ],
        ),
      ),
    );
  }

  Stack topCardSection(double screenWidth) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 12, bottom: 12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 208, 227, 242),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SizedBox(
                    child: CarouselSlider(
                      items: ImageClass.imageList.map((img) {
                        return Builder(
                          builder: (BuildContext context) {
                            return cardImg(img);
                          },
                        );
                      }).toList(),
                      carouselController: _carouselController,
                      options: CarouselOptions(
                        viewportFraction: 1, // Slight spacing on sides.
                        autoPlay: true,
                        enlargeCenterPage: true, // Animate the center image.
                        autoPlayCurve: Curves.easeInOut,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30, bottom: 20, top: 12),
                    width: screenWidth / 1.8,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 208, 227, 242),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                        // topRight:R,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Card Status : ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Inactive',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 12,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 208, 227, 242),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(255, 132, 117, 117),
                              ),
                            ),

                            child: Text(
                              'Guide',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.activePriceColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 200,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ImageClass.imageList.asMap().entries.map((entry) {
                final isActive = _currentIndex == entry.key;
                return GestureDetector(
                  onTap: () => _carouselController.animateToPage(entry.key),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: isActive
                        ? Container(
                            width: 50, // line length
                            height: 4, // line thickness
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          )
                        : Container(
                            width: 20,
                            height: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.grey,
                            ),
                          ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWalletSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: const Text(
        'Wallet',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
