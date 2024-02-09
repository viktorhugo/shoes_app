import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/presentation/providers/shoe_provider.dart';

class ShoeSizePreview extends StatelessWidget {

  final bool? fullScreen;

  const ShoeSizePreview({
    super.key, 
    this.fullScreen = false
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if( fullScreen == false) {
          context.push('/shoe-desc');
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:  fullScreen! ? 10: 30, 
          vertical: fullScreen! ? 5:  5
        ),
        child: Container(
          width: double.infinity,
          height: fullScreen! ? 390: 410,
          decoration: BoxDecoration(
            color: const Color(0xffFFCF53),
            borderRadius: 
              (!fullScreen!)
              ? BorderRadius.circular(50)
              : const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )
          ),
          child: Column(
            children: [
      
              // shoe image with shadow
              const _ShoeWithShadow(),
      
              // Size
              if (!fullScreen!)
              const _ShoeSizes()
      
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  
  const _ShoeSizes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // SEPARATE SIZE BOXES
        children: [
          _BoxShoeSize(size: 7.0),
          _BoxShoeSize(size: 7.5),
          _BoxShoeSize(size: 8.0),
          _BoxShoeSize(size: 8.5),
          _BoxShoeSize(size: 9.0),
          _BoxShoeSize(size: 9.5),
        ],
      ),
    );
  }
}

class _BoxShoeSize extends StatelessWidget {

  final double size;

  const _BoxShoeSize({
    super.key, 
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    
    final shoeProvider = Provider.of<ShoeProvider>(context);

    return GestureDetector(
      onTap: () {
        shoeProvider.size = size;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: (size != shoeProvider.size ) ? Colors.white : const Color(0xffF1A23A),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            // For selected Shoe size
            if (size == shoeProvider.size ) 
              const BoxShadow(
                color: Color(0xffEAA14E),
                blurRadius: 20,
                offset: Offset(0, 5)
              )
          ]
        ),
        child: Text(
          size.toString().replaceAll('.0', ''),
          style: TextStyle(
            color: (size == shoeProvider.size ) ? Colors.white : const Color(0xffF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  const _ShoeWithShadow({super.key});

  @override
  Widget build(BuildContext context) {

    final shoeProvider = Provider.of<ShoeProvider>(context);

    return  Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [

          // SHADOW
          const Positioned(
            bottom: 10,
            right: 0,
            child: ShoeShadow()
          ),

          // SHOE IMAGE
          Image(image: AssetImage(shoeProvider.assetImage)),

        ],
      ),
    );
  }
}

class ShoeShadow extends StatelessWidget {
  const ShoeShadow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 220,
        height: 100,
        decoration: BoxDecoration(
          // color: Colors.black87,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 20)
          ]
        ),
      ),
    );
  }
}