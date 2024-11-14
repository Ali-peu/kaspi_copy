import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kaspi_copy/app/app_widgets/qr_painter.dart';
import 'package:kaspi_copy/app/utils/circular_progress.dart';
import 'package:permission_handler/permission_handler.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
  }

  Future<void> _requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: availableCameras(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CameraApp(cameras: snapshot.data ?? []);
        } else {
          return const AppCircularProgress();
        }
      },
    );
  }
}

class CameraApp extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraApp({super.key, required this.cameras});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  bool isFlashModeAvalible = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    if (widget.cameras.isNotEmpty) {
      controller = CameraController(widget.cameras[0], ResolutionPreset.max);
      try {
        await controller.initialize();
        if (mounted) {
          setState(() {});
        }
      } catch (e) {
        // Handle errors here
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void setFlashMode() {
    if (isFlashModeAvalible) {
      controller.setFlashMode(FlashMode.off);
    } else {
      controller.setFlashMode(FlashMode.auto);
    }
    isFlashModeAvalible = !isFlashModeAvalible;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cameras.isEmpty) {
      return const Center(
        child: Text('widget cameras isEmpty'),
      );
    }
    if (!controller.value.isInitialized) {
      return const Center(
        child: Text('controller value is NotInitialized'),
      );
    }

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: CameraPreview(controller)),
                Align(
                    alignment: Alignment.topRight,
                    child: ColoredBox(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('KASPI QR'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.black54),
                                ),
                                child: GestureDetector(
                                    onTap: () {},
                                    child: const Icon(Icons.close))),
                          ),
                        ],
                      ),
                    )),
                Align(
                  alignment: Alignment(0, 0.4),
                  child: IconButton.outlined(
                      onPressed: setFlashMode,
                      icon: Icon(isFlashModeAvalible
                          ? Icons.flash_auto_outlined
                          : Icons.flash_off_outlined)),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomPaint(
                    painter: QrPainter(Rect.fromCenter(
                        center: const Offset(0, 0), width: 120, height: 120)),
                    // child: Container(),
                    // width: 200,
                    // height: 200,
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.white, width: 2.0),
                    //   borderRadius: BorderRadius.circular(8.0),
                    // ),
                  ),
                ),
              ],
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10))),
            child: Column(
              children: [
                ListTile(
                  leading: Text('data'),
                  title: Text('data'),
                ),
                ListTile(
                  leading: Text('data'),
                  title: Text('data'),
                ),
                ListTile(
                  leading: Text('data'),
                  title: Text('data'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
