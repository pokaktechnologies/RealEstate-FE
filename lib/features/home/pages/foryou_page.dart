import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/home/widgets/foryou/banner.dart';
import 'package:realestate_fe/features/home/widgets/foryou/best_properties.dart';
import 'package:realestate_fe/features/home/widgets/foryou/bottom_image.dart';
import 'package:realestate_fe/features/home/widgets/foryou/stay_finder_screen.dart';
import 'package:realestate_fe/features/home/widgets/foryou/trending_properties.dart';
import 'package:realestate_fe/features/home/blocs/properties/properties_bloc.dart';
import 'package:realestate_fe/features/home/blocs/properties/properties_event.dart';

class ForyouPage extends StatefulWidget {
  const ForyouPage({super.key});

  @override
  State<ForyouPage> createState() => _ForyouPageState();
}

class _ForyouPageState extends State<ForyouPage> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<PropertiesBloc>();
    bloc.add(LoadProperties());
    bloc.add(LoadIdealPGProperties());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SizedBox(height: 10),
          SponsoredScreen(),
          SizedBox(height: 15),
          StayFinderScreen(),
          SizedBox(height: 15),
          TrendingProperties(),
          SizedBox(height: 15),
          BestProperties(),
          BottomImage(isForyou: true),
        ],
      ),
    );
  }
}
