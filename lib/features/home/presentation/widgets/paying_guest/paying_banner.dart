import 'package:flutter/material.dart';
import 'package:realestate_fe/core/utils/app_assets.dart';

class PayingBanner extends StatelessWidget {
  const PayingBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> roomText = [
      "Apartment",
      "Villa",
      "Independent Houses",
      "Fully Furnished",
      "Apartment",
    ];
    final List<String> roomImg = [
      AppAssets.rentApartmentImg,
      AppAssets.rentHouseImg,
      AppAssets.rentVillaImg,
      AppAssets.rentApartmentImg,
      AppAssets.rentHouseImg,
    ];
    return Column(
      children: [
        MediaQuery.removePadding(
          context: context,
          removeBottom: false,
          removeLeft: false,
          removeRight: false,
          removeTop: false,
          child: SizedBox(
            width: double.infinity,
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.fromLTRB(
                12,
                10,
                12,
                0,
              ),
              itemCount: 5,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 100,
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            roomImg[i],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                            ),
                            child: Text(
                              roomText[i],
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.1,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
