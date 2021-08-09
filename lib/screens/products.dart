import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/home/homeCubit.dart';
import 'package:shop_app/cubit/home/homeStates.dart';
import 'package:shop_app/cubit/sign/signCubit.dart';
import 'package:shop_app/model/home/cateogriesModel.dart';
import 'package:shop_app/model/home/homeModel.dart';
import 'package:shop_app/screens/search.dart';
import 'package:shop_app/style/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shop_app/widgets/buttonMain.dart';
import 'package:shop_app/widgets/textFieldGrey.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        var cateogriesModel = cubit.cateogriesModel!.data!.data;
        ThemeData theme = Theme.of(context);
        TextEditingController searchTextEdit = TextEditingController();
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //user image , name and bell
              Padding(
                padding: EdgeInsets.fromLTRB(25, 70, 25, 0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://student.valuxapps.com/storage/assets/defaults/user.jpg'),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Hello Ahmed!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    Container(
                      // padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1,
                          )),
                      child: Stack(
                        children: [
                          IconButton(
                            // borderRadius: BorderRadius.circular(25),
                            // radius: 90,
                            onPressed: () {},
                            splashRadius: 24,
                            icon: Icon(
                              Icons.notifications_none_rounded,
                              size: 25,
                            ),
                          ),
                          Positioned(
                            right: 15,
                            top: 15,
                            child: Container(
                              width: 9,
                              height: 9,
                              decoration: BoxDecoration(
                                color: accentColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              //Big Text and search row
              Padding(
                padding: EdgeInsets.fromLTRB(25, 40, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Discover Our',
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'New Deals',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: accentColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchScreen(),
                                  ));
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[100],
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Search',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: accentColor,
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: 1,
                              )),
                          child: IconButton(
                            onPressed: () {},
                            splashRadius: 24,
                            color: Colors.white,
                            icon: Icon(
                              Icons.filter_list_rounded,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // Stack(
              //   children: [
              //     CarouselSlider(
              //       items: cubit.homeModel!.data!.banners
              //           .map(
              //             (banner) => CachedNetworkImage(
              //               imageUrl: banner.image!,
              //               imageBuilder: (context, imageProvider) => Container(
              //                 padding: EdgeInsets.symmetric(
              //                     horizontal: 0, vertical: 0),
              //                 margin: EdgeInsets.symmetric(
              //                     horizontal: 20, vertical: 40),
              //                 width: double.infinity,
              //                 decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   // color: Color(0xffF5F7FB),
              //                   borderRadius: BorderRadius.circular(20),
              //                   image: DecorationImage(
              //                     image: imageProvider,
              //                     fit: BoxFit.fill,
              //                     colorFilter: new ColorFilter.mode(
              //                       Colors.black.withOpacity(.0),
              //                       BlendMode.srcATop,
              //                     ),
              //                     // fit: BoxFit.fitHeight,
              //                   ),
              //                 ),
              //               ),
              //               progressIndicatorBuilder:
              //                   (context, url, downloadProgress) => Center(
              //                 child: CircularProgressIndicator(
              //                   value: downloadProgress.progress,
              //                   color: Colors.grey,
              //                 ),
              //               ),
              //               errorWidget: (context, url, error) => Icon(
              //                 Icons.error,
              //                 color: Colors.red,
              //               ),
              //             ),
              //           )
              //           .toList(),
              //       options: CarouselOptions(
              //         initialPage: 0,
              //         scrollPhysics: BouncingScrollPhysics(),
              //         viewportFraction: 1,
              //         height: 280,
              //         autoPlay: cubit.autoPlayBanners,
              //         autoPlayInterval: Duration(seconds: 4),
              //         autoPlayAnimationDuration: Duration(seconds: 2),
              //         autoPlayCurve: Curves.fastOutSlowIn,
              //         enableInfiniteScroll: true,
              //         scrollDirection: Axis.horizontal,
              //         reverse: false,
              //       ),
              //     ),
              //     Positioned(
              //       right: 30,
              //       bottom: 50,
              //       child: Container(
              //         width: 35,
              //         height: 35,
              //         padding: EdgeInsets.all(0),
              //         margin: EdgeInsets.all(0),
              //         decoration: BoxDecoration(
              //           color: Colors.grey[300]!.withOpacity(.5),
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: IconButton(
              //           padding: EdgeInsets.all(0),
              //           color: Colors.white,
              //           splashRadius: 30,
              //           iconSize: 25,
              //           onPressed: () => cubit.bannerPlay(),
              //           icon: cubit.autoPlayBanners
              //               ? Icon(Icons.pause)
              //               : Icon(Icons.play_arrow),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),

              Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 20, 10),
                child: Row(
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: accentColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //cateogries slider
              Container(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cateogriesModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    List<DataModel> modifiedCateogries = [];

                    modifiedCateogries
                        .add(DataModel(id: 1, name: 'All', image: ''));
                    modifiedCateogries.addAll(cateogriesModel);
                    return Stack(
                      children: [
                        // CachedNetworkImage(
                        //   imageUrl: cateogriesModel[index].image!,
                        //   imageBuilder: (context, imageProvider) => Container(
                        //     height: 160,
                        //     width: 100,
                        //     margin: EdgeInsets.symmetric(horizontal: 5),
                        //     decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       // color: Color(0xffF5F7FB),
                        //       borderRadius: BorderRadius.circular(25),
                        //       image: DecorationImage(
                        //         image:
                        //            imageProvider,
                        //         // fit: BoxFit.fitHeight,
                        //       ),
                        //     ),
                        //   ),
                        //   progressIndicatorBuilder:
                        //       (context, url, downloadProgress) => Center(
                        //     child: CircularProgressIndicator(
                        //       value: downloadProgress.progress,
                        //       color: Colors.grey,
                        //     ),
                        //   ),
                        //   errorWidget: (context, url, error) => Icon(
                        //     Icons.error,
                        //     color: Colors.red,
                        //   ),
                        // ),

                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                          decoration: BoxDecoration(
                            color: modifiedCateogries[index].name == 'All'
                                ? accentColor
                                : Color(0xffF5F7FB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            modifiedCateogries[index].name!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: modifiedCateogries[index].name == 'All'
                                  ? Colors.white
                                  : Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 20, 20, 0),
                child: Row(
                  children: [
                    Text(
                      'All Products',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: accentColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                childAspectRatio: 1 / 1.4,
                children: List.generate(
                  cubit.homeModel!.data!.products.length,
                  (index) => productItem(
                      cubit.homeModel!.data!.products[index], theme),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget productItem(ProductsModel productModel, ThemeData theme) => Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[100]!.withOpacity(.8),
              blurRadius: 8,
              spreadRadius: 5,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CachedNetworkImage(
                  imageUrl: productModel.image!,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 160,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // color: Color(0xffF5F7FB),
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: imageProvider,
                        // fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                      color: Colors.grey,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
                if (productModel.discount! != 0)
                  Positioned(
                    bottom: 15,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                      decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // height: 20,
                      child: Center(
                        child: Text(
                          '${productModel.discount!} %',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              '${productModel.name!}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.headline5!.copyWith(
                fontSize: 17,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${productModel.price!.toString()}',
                  style: TextStyle(
                    color: accentColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
}
