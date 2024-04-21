
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vrit_app/core/common/custom_snackbar.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vrit_app/src/main/presentation/provider/short_url_provider.dart';
import 'package:share_plus/share_plus.dart';


class ShortUrlScreen extends ConsumerWidget {
  final String longUrl;
  const ShortUrlScreen({super.key, required this.longUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(shortUrlProvider(longUrl));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: result.when(
            data: (data){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60.h,),
                  QrImageView(
                    data: data,
                    version: QrVersions.auto,
                    size: 220.w,
                  ),
                  SizedBox(height: 30.h,),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        padding: EdgeInsets.all(10.h),
                        width: 300.w,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Text(
                            data,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                            ),
                          ),
                        )
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: buildElevatedButton(
                            context,
                            Icons.share_outlined,
                            "Share",
                                () {
                              Share.share(data);
                            },
                          ),
                        ),
                        SizedBox(width: 15.w,),
                        Expanded(
                          child: buildElevatedButton(
                            context,
                            Icons.copy_rounded,
                            'Copy',
                                () {
                              Clipboard.setData(ClipboardData(text: data));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBarUtil.showSnackBar("Copied to clipboard"),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            error: (error, stackTrace) => Center(child: Text('$error'),),
            loading: () => const Center(child: CircularProgressIndicator.adaptive())
        )
      ),
    );
  }

  ElevatedButton buildElevatedButton(BuildContext context, IconData iconData, String label, VoidCallback onPressed) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50.h),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconData,
                size: 20.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                label,
                style: TextStyle(fontSize: 16.sp),
              ),
            ],
          ),
        ),
    );
  }
}