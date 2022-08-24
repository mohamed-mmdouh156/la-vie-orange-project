import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/presentation/resources/value_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanScreen extends StatelessWidget {
  const QrScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
    Barcode? result;
    QRViewController? controller;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: true ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  color: ColorManager.white,
                ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SNAKE PLANT',
                              style: GoogleFonts.roboto(
                                fontSize: AppSize.s16,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.black,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Description',
                              style: GoogleFonts.roboto(
                                fontSize: AppSize.s14,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        ),
                        MaterialButton(
                          onPressed: (){},
                          shape: const StadiumBorder(),
                          color: ColorManager.primary,
                          child: Icon(
                            Icons.arrow_forward,
                            color: ColorManager.white,
                          ),
                        ),
                      ],
                    ),
                  ),
            )
                : const Center(
                  child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {}

}
