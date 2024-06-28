import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_rent/core/helper/shared_pref.dart';
import 'package:house_rent/services/http_services.dart';

class TestHomePage extends StatefulWidget {
  const TestHomePage({super.key});

  @override
  State<TestHomePage> createState() => _TestHomePageState();
}

class _TestHomePageState extends State<TestHomePage> {
  late Future<Map<String, dynamic>> _futureResponse;
  @override
  void initState() {
    _futureResponse = _fetchData();
    super.initState();
  }

  Future<Map<String, dynamic>> _fetchData() async {
    final token = SharedPref().getAccessToken();
    final serviceRepo = Get.find<HttpService>();
    final response = await serviceRepo.getRequest('auth/profile', token);
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Center(
          child: FutureBuilder(
            future: _futureResponse,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (snapshot.hasData) {
                final data = snapshot.data!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      data['avatar'],
                      width: 200,
                      height: 200,
                    ),
                    Text(data['name']),
                    Text(data['email']),
                    TextButton(
                        onPressed: () {
                          SharedPref().clearTokens();
                        },
                        child: const Text('Logout',
                            style: TextStyle(fontSize: 20)))
                  ],
                );
              }

              if (snapshot.hasError) {
                return const Text('There is something wrong!');
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
