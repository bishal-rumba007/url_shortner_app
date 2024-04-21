import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vrit_app/src/main/presentation/result_screen.dart';

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

  void _pasteFromClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    destinationUrlController.text = data?.text ?? '';
    setState(() {});
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
                SizedBox(height: 100.h),
                Text(
                  'Enter or Paste the URL to shorten',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h),
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
                          ) :
                    IconButton(
                      onPressed: (){
                        _pasteFromClipboard();
                      },
                      icon: const Icon(Icons.content_paste,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60.h),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (!context.mounted) return;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ResultScreen(longUrl: destinationUrlController.text),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50.h),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Shorten'),
                      SizedBox(width: 10.w,),
                      Visibility(
                          visible: destinationUrlController.text.isNotEmpty,
                          child: const Icon(Icons.arrow_forward, size: 20,)),
                    ],
                  ),
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
