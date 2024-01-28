import 'package:flutter/material.dart';

class ShoeSizePreview extends StatelessWidget {
  const ShoeSizePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 410,
        decoration: BoxDecoration(
          color: const Color(0xffFFCF53),
          borderRadius: BorderRadius.circular(50) 
        ),
        child: const Column(
          children: [

            // shoe image with shadow
            _ShoeWithShadow(),

            // Size
            _ShoeSizes()

          ],
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
    return Container(
      alignment: Alignment.center,
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: (size != 9 ) ? Colors.white : const Color(0xffF1A23A),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          // For selected Shoe size
          if (size == 9 ) 
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
          color: (size == 9 ) ? Colors.white : const Color(0xffF1A23A),
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  const _ShoeWithShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(50),
      child: Stack(
        children: [

          // SHADOW
          Positioned(
            bottom: 10,
            right: 0,
            child: ShoeShadow()
          ),

          // SHOE IMAGE
          Image(image: AssetImage('assets/imgs/azul.png')),

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