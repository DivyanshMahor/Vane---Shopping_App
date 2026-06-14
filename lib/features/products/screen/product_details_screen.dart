import 'package:flutter/material.dart';
import 'package:flutter_assignment/colors.dart';
import 'package:flutter_assignment/features/products/model/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product });
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.roseWood,

      appBar: AppBar(

          backgroundColor: AppColors.roseWood,
          title: Text(product.title, style: TextStyle(color: AppColors.vanilla, fontWeight: FontWeight.w400),) ),

      body:

      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),

            child: Container(

              // clipBehavior: (),
              decoration: BoxDecoration(
                color: AppColors.vanilla.withAlpha(180),
                borderRadius: BorderRadiusGeometry.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.vanilla.withAlpha(10),
                    blurRadius: 20,
                    spreadRadius: 2,
                  )
                ],
              ),

              // width: 400,
              // height: 400,

              child: Column(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Product Image
                  Image.network(product.thumb),
                  SizedBox(height: 12),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 2, 22, 2),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text("\$ ${product.price}" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.vanilla  ),),

                        Text("⭐ ${product.rating}" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color:
                        AppColors.butterCupYellow,shadows: [
                          Shadow(color: Colors.yellow ,
                            blurRadius: 3,

                          )
                        ] ),),



                      ],
                    ),
                  ),

                  //Description
                  Padding(padding: EdgeInsetsGeometry.all(12),
                  child: Text(product.desc, style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20, color:AppColors.vanilla.withAlpha(240)),),
                  ),

                ],
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.fromLTRB(12, 44, 12, 10),
            child: Text("Made by Divyansh🔥",style: TextStyle(
                fontSize: 64, fontWeight: FontWeight.bold, color: AppColors.vanilla.withAlpha(180) ,
              shadows: [
                Shadow(
                  color: AppColors.butterCupYellow.withAlpha(150),
                  blurRadius: 5,
                )
              ]

            ),

            ),
          )
        ],
        
        
      ),
      );


  }
}
