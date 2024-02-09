import 'package:flutter/material.dart';
import 'package:shoes_app/helpers/helpers.dart';
import 'package:shoes_app/presentation/widgets/widgets.dart';


class ShoePage extends StatelessWidget {
  const ShoePage({super.key});


  @override
  Widget build(BuildContext context) {

    changeStatusDark();

    return const Scaffold(
      // body: CustomAppBar(text: 'For you',)
      // body: ShoeSizePreview()
      body: Column(
        children: [
          CustomAppBar(text: 'For you',),
      
          SizedBox(height: 20),
      
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  //* shoe image widget
                  Hero(
                    tag:'shoe-1',  
                    child: ShoeSizePreview()
                  ),
      
                  //* shoe desc widget
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  )
                ],
              ),
            )
          ),
      
          //* Card Button car widget
          AddCarButton(amount: 180.0)
        ],
      ),
  );
  }
}