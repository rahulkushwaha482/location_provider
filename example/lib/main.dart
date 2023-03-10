import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:location_provider/location_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
    );
  }
}

class HomePage extends HookWidget {
  void _updateAddress({
    required ValueNotifier<TextEditingValue> latitudeController,
    required ValueNotifier<TextEditingValue> longitudeController,
    required ValueNotifier<String> address,
  }) async {
    final lat = double.tryParse(latitudeController.value.text);
    final lan = double.tryParse(longitudeController.value.text);
    if (lat != null && lan != null) {
      final addre = await LocationHelper.getLocationFullAddress(lat, lan);
      address.value = addre.toString();
    } else {
      address.value = 'address';
    }
  }

  void _updateLatLng({
    required ValueNotifier<TextEditingValue> addressController,
    required ValueNotifier<String> lat,
    required ValueNotifier<String> lang,
  }) async {
    final address = (addressController.value.text);

    if (address != null) {
      final addre = await LocationHelper.getLatitudeFromAddress(address);
      final lng = await LocationHelper.getLongitudeFromAddress(address);
      lat.value = addre.toString();
      lang.value = lng.toString();
    } else {
      lat.value = '';
      lang.value = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final address = useState('Address');
    final lat = useState('');
    final lan = useState('');

    final latitudeController = useTextEditingController();
    final longitudeController = useTextEditingController();
    final addressController = useTextEditingController();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text('Get Address form latlong'),
              TextField(
                  controller: latitudeController,
                  decoration: const InputDecoration(labelText: 'Latitude'),
                  keyboardType: TextInputType.number,
                  onChanged: (_) => _updateAddress(
                      latitudeController: latitudeController,
                      longitudeController: longitudeController,
                      address: address)),
              TextField(
                  controller: longitudeController,
                  decoration: const InputDecoration(labelText: 'Longitude'),
                  keyboardType: TextInputType.number,
                  onChanged: (_) => _updateAddress(
                      latitudeController: latitudeController,
                      longitudeController: longitudeController,
                      address: address)),
              Text(
                address.value.toString(),
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const Text('Get LatLong form Address'),
              TextField(
                  controller: addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                  keyboardType: TextInputType.text,
                  onChanged: (_) => _updateLatLng(
                      addressController: addressController,
                      lat: lat,
                      lang: lan)),
              Text('${lat.value.toString()},${lan.value.toString()}'),
            ],
          ),
        ),
      ),
    );
  }
}



