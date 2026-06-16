import 'package:flutter/material.dart';
import 'package:flutter_assignment/colors.dart';
import 'package:flutter_assignment/features/products/provider/product_provider.dart';
import 'package:flutter_assignment/features/products/screen/product_details_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListScreen extends ConsumerStatefulWidget {
  const ProductListScreen({super.key});

  @override
  ConsumerState<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends ConsumerState<ProductListScreen> {
  String input = "";  //isme search value ayegi
  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(
      productProvider,
    ); // iske ander loading, error and DATA bhi aa rah h
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: AppColors.roseWood,
        appBar: AppBar(
          backgroundColor: AppColors.roseWood, //text ke background ka color
          leading: Padding(
            padding: const EdgeInsetsGeometry.all(8),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/image/img1.jpg"),
            ),
          ),
          centerTitle: true,
          title: Text(
            "Vané",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              color: AppColors.vanilla,
            ),
          ),
        ), // text ka color
        body:

        productState.when(
          data: (productsList) {
            final filteredList = productsList.where((product){
              return product.title.toLowerCase().contains(input.toLowerCase());
            }).toList();


            return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:

                    TextField(
                      onChanged: (value){
                        setState(() {
                          input = value;
                        });
                      }

                      ,decoration: InputDecoration(
                      labelText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      )
                    ),),
                  ),

                  Expanded(
                    child: ListView.builder(
                    itemCount:

                    filteredList.length,

                    itemBuilder: (context, index) {
                      final product = productsList[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        elevation: 6,
                        shadowColor: AppColors.butterCupYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        color: AppColors.vanilla,

                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailsScreen(product: product),
                              ),
                            );
                          },
                          leading: Image.network(
                            product.thumb,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                          title: Text(product.title),
                          subtitle: Text("\$ ${product.price}"),
                        ),
                      );
                    },
                                ),
                  ),
                ],
              );
          },
          error: (err, stack) => Center(child: Text("Error: $err")),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),


      ),
    );
  }
}
