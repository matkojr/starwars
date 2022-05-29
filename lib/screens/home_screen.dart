import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:starwars/http.dart';
import 'package:starwars/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scrollController = FixedExtentScrollController();
    final double _itemHeight = 100.0;
    return Scaffold(
        appBar: AppBar(title: const Text('Starwars')),
        body: FutureBuilder<dynamic>(
            future: http.getPeople(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Center(child: const Text('error'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('loading');
              }
              dynamic data = snapshot.data['results'];

              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: ClickableListWheelScrollView(
                      scrollController: _scrollController,
                      itemHeight: _itemHeight,
                      itemCount: data.length,
                      onItemTapCallback: (index) {
                        router.toDetailsScreen(context, data[index]['url']);
                      },
                      child: ListWheelScrollView.useDelegate(
                        controller: _scrollController,
                        itemExtent: _itemHeight,
                        physics: FixedExtentScrollPhysics(),
                        overAndUnderCenterOpacity: 0.5,
                        perspective: 0.002,
                    
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) =>
                             
                         Container(padding:const EdgeInsets.all(12),
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                         color: Colors.green
                         ),
                         child: Column(

                           children: [
                             Text(data[index]['name'],
                             style:const TextStyle(color: Colors.white, fontSize:18),
                             ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                             const  Text('heigth:',
                                 style:const TextStyle(color: Colors.white, fontSize:18),
                                 ),

                                Text('${data[index]['height']} cm',
                             style:const TextStyle(color: Colors.white, fontSize:18),
                             ),
                             ],
                           ),
                           ],
                         ),
                         ),
                          childCount: data.length,
                        ),
)
                      ));
            }

          
            ));
  }
}
