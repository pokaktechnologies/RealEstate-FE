import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';
import 'package:realestate_fe/features/payment/payment_pages/payment_successful.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.arrowbackIcon),
        ),
        backgroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        AppAssets.imageOne,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '3BHK Apartment',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Kakkanad, Kochi',
                            style: TextStyle(
                              color: AppColors.mediumGray,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '₹8000/Month',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.tealBlue,
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(AppAssets.sqfeetIcon,
                                  height: 18, width: 18),
                              SizedBox(
                                width: 4,
                              ),
                              Text('1250 sq-ft',
                                  style: TextStyle(color: AppColors.grey)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoCard('Check-in', '22 October 2024'),
                        _buildInfoCard('Duration of Stay', '4 Months'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoCard('Furnished', 'Yes'),
                        SizedBox(
                          width: 4,
                        ),
                        _buildInfoCard('Security Deposit', '₹50,000'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            // Payment Method
            Text('Select payment method',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.black)),
            SizedBox(height: 10),
            _buildPaymentMethod(
              AppAssets.creditCardIcon,
              'Credit/Debit Card',
              'Accepting Visa, Mastercard, etc',
            ),
            _buildPaymentMethod(AppAssets.paypalIcon, 'Add UPI',
                'Google Pay, PayPal, Paytm and More...'),
            _buildPaymentMethod(
                AppAssets.bankTransferIcon, 'Add Bank Account', ''),
            _buildPaymentMethod(AppAssets.moneyIcon, 'Cash Payment', ''),
            SizedBox(height: 10),
            Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price Details',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.black),
                    ),
                    SizedBox(height: 10),
                    _buildPriceDetail('Rent', '₹8,000'),
                    _buildPriceDetail('Deposit', '₹50,000'),
                    _buildPriceDetail('Service fee', '₹1000'),
                    Divider(
                      color: AppColors.grey,
                    ),
                    _buildPriceDetail('Amount to be Paid Now', '₹59,000',
                        isBold: true),
                    Divider(
                      color: AppColors.grey,
                    ),
                    Text(
                      "Note",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black),
                    ),
                    Text(
                      '  **Security deposit is refundable at the end of stay\n'
                      '  **Monthly rent must be paid by the 5th of each month',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaymentSuccessfulScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.tealBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text('Confirm & Pay',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.white)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    color: AppColors.mediumGray, fontWeight: FontWeight.w500)),
            SizedBox(height: 5),
            Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(
    String imagePath,
    String title,
    String subtitle,
  ) {
    return Card(
      color: AppColors.white,
      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: 30,
          height: 30,
          fit: BoxFit.contain,
        ),
        title: Text(title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.black)),
        subtitle: subtitle.isNotEmpty
            ? Text(subtitle,
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: AppColors.mediumGray))
            : null,
      ),
    );
  }

  Widget _buildPriceDetail(String label, String amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                  fontWeight: isBold ? FontWeight.w600 : FontWeight.w400)),
          Text(amount,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.w900 : FontWeight.w400)),
        ],
      ),
    );
  }
}
