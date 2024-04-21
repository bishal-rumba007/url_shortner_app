import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vrit_app/src/main/data/url_repository_impl.dart';
import 'package:vrit_app/src/main/presentation/provider/short_url_provider.dart';
import 'package:vrit_app/src/main/presentation/short_url_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController destinationUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    destinationUrlController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("SHORTIFY"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Enter or Paste the URL to shorten',
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter URL';
                    }
                    if (!Uri.parse(value).isAbsolute) {
                      return 'Please enter a valid URL';
                    }
                    return null;
                  },
                  controller: destinationUrlController,
                  decoration: InputDecoration(
                    hintText: 'Enter URL',
                    border: const OutlineInputBorder(),
                    suffixIcon: destinationUrlController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              destinationUrlController.clear();
                            },
                            icon: const Icon(Icons.close),
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (!context.mounted) return;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ShortUrlScreen(longUrl: destinationUrlController.text),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50.h),
                  ),
                  child: const Text('Shorten'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    destinationUrlController.dispose();
  }
}
