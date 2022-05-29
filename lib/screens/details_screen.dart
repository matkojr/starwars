import 'package:flutter/material.dart';
import 'package:starwars/http.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments! as dynamic;
    String url = arguments[0];
    return Scaffold(
        appBar: AppBar(
          title: Text('details'),
        ),
        body: FutureBuilder<dynamic>(
            future: http.getDetails(url.substring(url.length - 9)),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Center(child: const Text('error'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('loading');
              }
              dynamic data = snapshot.data;

              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data['name'],
                          style:
                              const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(height:12),
                        Text(
                          'heigth: ${data['height']} cm',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(height:12),

                        Text(
                          'mass: ${data['mass']} kg',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(height:12),

                        Text(
                          'eye color: ${data['eye_color']}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(height:12),

                        Text(
                          'skin color: ${data['skin_color']}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        
                      ],
                    ),
                  ));
            }));
  }
}
