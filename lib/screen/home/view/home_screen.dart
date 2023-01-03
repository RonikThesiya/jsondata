import 'package:flutter/material.dart';
import 'package:jsondata/screen/home/provider/provider_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).ProductDetail();
  }

  HomeProvider? homeProvidertrue;
  HomeProvider? homeProviderfalse;

  @override
  Widget build(BuildContext context) {
    homeProvidertrue = Provider.of<HomeProvider>(context, listen: true);
    homeProviderfalse = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Product"),
              actions: [
                PopupMenuButton(itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                        child: TextButton(
                      onPressed: () {
                        homeProviderfalse!.filterPrice1();
                        Navigator.pop(context);
                      },
                      child: Text("\$10 - \$50"),
                    )),
                    PopupMenuItem(
                        child: TextButton(
                      onPressed: () {
                        homeProviderfalse!.filterPrice2();
                        Navigator.pop(context);
                      },
                      child: Text("\$50 - \$100"),
                    )),
                    PopupMenuItem(
                        child: TextButton(
                      onPressed: () {
                        homeProviderfalse!.filterPrice3() ;
                        Navigator.pop(context);
                      },
                      child: Text("\$100 - all"),
                    )),
                    PopupMenuItem(
                        child: TextButton(
                      onPressed: () {
                        homeProviderfalse!.ProductDetail();
                        Navigator.pop(context);
                      },
                      child: Text("Clear"),
                    )),
                  ];
                }),

                IconButton(onPressed: (){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      content: SizedBox(
                        height: 250,
                        child: Column(
                          children: [
                            TextButton(onPressed: (){
                              homeProviderfalse!.Category1();
                              Navigator.pop(context);
                            }, child: Text("men's clothing")),
                            TextButton(onPressed: (){
                              homeProviderfalse!.Category2();
                              Navigator.pop(context);
                            }, child: Text("jewelery")),
                            TextButton(onPressed: (){
                              homeProviderfalse!.Category3();
                              Navigator.pop(context);
                            }, child: Text("electronics")),
                            TextButton(onPressed: (){
                              homeProviderfalse!.Category4();
                              Navigator.pop(context);
                            }, child: Text("women's clothing")),
                            TextButton(onPressed: (){
                              homeProviderfalse!.ProductDetail();
                              Navigator.pop(context);
                            }, child: Text("Clear")),
                          ],
                        ),
                      ),
                    );
                  });
                }, icon: Icon(Icons.category)),

                IconButton(onPressed: (){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      content: SizedBox(
                        height: 250,
                        child: Column(
                          children: [
                            TextButton(onPressed: (){
                              homeProviderfalse!.Rate1();
                              Navigator.pop(context);
                            }, child: Text("1-2")),
                            TextButton(onPressed: (){
                              homeProviderfalse!.Rate2();
                              Navigator.pop(context);
                            }, child: Text("2-3")),
                            TextButton(onPressed: (){
                              homeProviderfalse!.Rate3();
                              Navigator.pop(context);
                            }, child: Text("3-4")),
                            TextButton(onPressed: (){
                              homeProviderfalse!.Rate4();
                              Navigator.pop(context);
                            }, child: Text("4-5")),
                            TextButton(onPressed: (){
                              homeProviderfalse!.ProductDetail();
                              Navigator.pop(context);
                            }, child: Text("Clear")),
                          ],
                        ),
                      ),
                    );
                  });
                }, icon: Icon(Icons.star_border)),


              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: homeProvidertrue!.productlist.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(offset: Offset.zero)]),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Image.network(
                                  "${homeProvidertrue!.productlist[index].image}",
                                  fit: BoxFit.fill,
                                  height: 100,
                                  width: 100,
                                )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Price : \$ ${homeProvidertrue!.productlist[index].price}",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  "${homeProvidertrue!.productlist[index].category}",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  "Rate : ${homeProvidertrue!.productlist[index].rating.rate}",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            )));
  }
}
