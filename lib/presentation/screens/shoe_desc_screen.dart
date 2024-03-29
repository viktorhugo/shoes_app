import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/helpers/helpers.dart';
import 'package:shoes_app/presentation/providers/shoe_provider.dart';
import 'package:shoes_app/presentation/widgets/widgets.dart';


class ShoeDescPage extends StatelessWidget {
  
  const ShoeDescPage({super.key});

  @override
  Widget build(BuildContext context) {

    changeStatusLight();

    return  Scaffold(
      body: Column(
        children: [ 

          Stack(
            children: [
              const Hero(
                tag:'shoe-1',
                child: ShoeSizePreview(fullScreen: true)
              ),
              Positioned(
                top: 80,
                child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                  child: const Icon(Icons.chevron_left, color: Colors.white, size: 60,),
                  onPressed: () {
                    changeStatusDark();
                    context.pop();
                  }
                )
              )
            ],
          ),

          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  // Shoe Description
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),

                  // Amount Buy Now
                  _AmountBuyNow(amount: 184.0,),

                  _ColorsShoesAndMore(),

                  _ButtonsLikesSettings()
                ],
              ),
            )
          ),
          
        ],
      ),
    );
  }
}

class _ButtonsLikesSettings extends StatelessWidget {
  const _ButtonsLikesSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _ShadowButton(
            icon: Icon(Icons.heart_broken, size: 30, color: Colors.red,),
          ),
          _ShadowButton(
            icon: Icon(Icons.add_shopping_cart, size: 30, color: Colors.grey.withOpacity(0.4),),
          ),
          _ShadowButton(
            icon: Icon(Icons.settings, size: 30, color: Colors.grey.withOpacity(0.4),),
          ),
        ],
      ),
    );
  }
}

class _ShadowButton extends StatelessWidget {

  final Icon icon;

  const _ShadowButton({
    super.key, 
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: -5, blurRadius: 20,offset: Offset(0, 10))
        ]
      ),
      child: icon,
    );
  }
}

class _ColorsShoesAndMore extends StatelessWidget {
  const _ColorsShoesAndMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          const Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 90,
                  child: _RoundedSelectShoeColor(
                    color: Color(0xffC6D642),
                    index: 4,
                    imageUrl: 'assets/imgs/verde.png',
                  )
                ),
                Positioned(
                  left: 60,
                  child: _RoundedSelectShoeColor(
                    color: Color(0xffFFAD29),
                    index: 3,
                    imageUrl: 'assets/imgs/amarillo.png',
                  )
                ),
                Positioned(
                  left: 30,
                  child: _RoundedSelectShoeColor(
                    color: Color(0xff2099F1),
                    index: 2,
                    imageUrl: 'assets/imgs/azul.png',
                  )
                ),
                _RoundedSelectShoeColor(
                  color: Color(0xff364D56),
                  index: 1,
                  imageUrl: 'assets/imgs/negro.png',
                ),
              ],
            )
          ),
      
          ButtonOrange(text: 'More related items', heightButton: 30, widthButton: 170, colorButton: Colors.orange[300],)
        ]
      ),
    );
  }
}

class _RoundedSelectShoeColor extends StatelessWidget {

  final Color color;
  final int index;
  final String imageUrl;

  const _RoundedSelectShoeColor({
    super.key, 
    required this.color, 
    required this.index, 
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {

    final shoeProvider = Provider.of<ShoeProvider>(context, listen: false);

    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () => shoeProvider.assetImage = imageUrl,
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}



class _AmountBuyNow extends StatelessWidget {

  final double amount;

  const _AmountBuyNow({
    super.key, 
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child:  Row(
          children: [
            Text('\$$amount', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold ),),
              
              const Spacer(),
        
              ///*priceButton
              Bounce(
                delay: const Duration(seconds: 1),
                from: 8,
                child: const ButtonOrange(text: 'Buy Now', heightButton: 40, widthButton: 120)
              ),
          ],
        ),
      ),
    );
  }
}