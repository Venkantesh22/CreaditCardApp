import 'package:cardapp/utility/appColors.dart';
import 'package:cardapp/utility/image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget buildActivationCard(double screenWidth) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      'Activate your LifelineCard',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      children: [
                        FaIcon(FontAwesomeIcons.indianRupeeSign, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '3499/- Life Time',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.indianRupeeSign,
                          color: Colors.red,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '9999/Year',
                          style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Offer Ends Soon!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.activePriceColor,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child: const Text(
                        'Activate Now',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Image.asset(
                  ImageClass.personImg, // your asset path
                  width: screenWidth * 0.3, // adjust as needed
                  height: 150,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
          Divider(),
          const Text(
            'Our Features',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              featContainText("Udhar Limit : ", " 74425"),
              featContainText("CP EML Limit : ", " 74425"),
            ],
          ),
          SizedBox(height: 18),
          Row(
            children: [
              IconContainer(FontAwesomeIcons.handHoldingDollar, "Udhar"),
              SizedBox(width: 8),
              IconContainer(FontAwesomeIcons.handHoldingDollar, "CP EML"),
              SizedBox(width: 8),
              IconContainer(
                FontAwesomeIcons.moneyBillTransfer,
                "Business Funds",
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget IconContainer(IconData icon, String text) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: FaIcon(
          icon, // This icon represents hands holding money
          size: 50,
        ),
      ),
      SizedBox(height: 12),
      Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    ],
  );
}

// Our Features Text Limit
Container featContainText(String heading, String balance) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(width: 1, color: Colors.grey),
    ),
    child: Row(
      children: [
        Text(
          heading,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        FaIcon(FontAwesomeIcons.indianRupeeSign, size: 14, color: Colors.grey),
        Text(
          balance,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
