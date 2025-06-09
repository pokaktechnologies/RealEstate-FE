import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';
import 'package:realestate_fe/core/utils/app_colors.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final List<Transaction> transactions = [
    Transaction("Alen John", "Annie Villa, Kochi", "10 Dec 2024", "₹8000"),
    Transaction("Alen John", "Annie Villa, Kochi", "10 Nov 2024", "₹8000"),
    Transaction("Alen John", "Annie Villa, Kochi", "10 Oct 2024", "₹8000"),
    Transaction("Amy", "3BHK Appartment, Kochi", "10 Oct 2024", "₹80,000"),
    Transaction(
        "Alen John", "Orchard House Women’s PG", "10 Aug 2024", "₹3000"),
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.arrowbackIcon),
        ),
        backgroundColor: AppColors.lightGray,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: GestureDetector(
          onTap: () {},
          child: Container(
            width: width * 0.96,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: AppColors.mediumGray,
                style: BorderStyle.solid,
              ),
            ),
            child: Center(
              child: TextField(
                enabled: false,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400, color: AppColors.mediumGray),
                  prefixIcon: Icon(Icons.search),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.tealBlue),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(AppAssets.filterIcon),
                    SizedBox(
                      width: 10,
                    ),
                    _FilterButton("Date", AppAssets.arrowdownIcon),
                    SizedBox(
                      width: 10,
                    ),
                    _FilterButton("Payment Method", AppAssets.arrowdownIcon),
                    SizedBox(
                      width: 10,
                    ),
                    _FilterButton("Amount", AppAssets.arrowdownIcon),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return _TransactionTile(transaction);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Filter Button with Dropdown Icon
  Widget _FilterButton(String title, String assetImagePath) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      ),
      child: Row(
        children: [
          Text(title,
              style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14)),
          const SizedBox(width: 5),
          Image.asset(
            assetImagePath,
            height: 18,
            width: 18,
          ),
        ],
      ),
    );
  }

  Widget _TransactionTile(Transaction transaction) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(AppAssets.transactionperson),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transaction.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                Text(transaction.location,
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.mediumGray,
                        fontWeight: FontWeight.w500)),
                Text(transaction.date,
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColors.mediumGray,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),

          // Amount
          Text(
            transaction.amount,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.green),
          ),
        ],
      ),
    );
  }
}

// Transaction Model
class Transaction {
  final String name, location, date, amount;
  Transaction(this.name, this.location, this.date, this.amount);
}
