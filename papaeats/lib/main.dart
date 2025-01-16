import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Picker',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _address = '미추홀구 인하로91번길 86';

  Future<void> _pickLocation() async {
    LocationPermission permission = await Geolocator.requestPermission(); //사용자한테 위치 사용 허가 물어봄
    // Navigate to Location Picker Screen and get the selected address
    final selectedAddress = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationPickerScreen(),
      ),
    );

    

    // Update the address if a location was selected
    if (selectedAddress != null) {
      setState(() {
        _address = selectedAddress;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: InkWell(
          onTap: _pickLocation,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                _address,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Icon(Icons.arrow_drop_down, color: Colors.black),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.tune, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Text('Main Content'),
      ),
    );
  }
}

class LocationPickerScreen extends StatefulWidget {
  @override
  _LocationPickerScreenState createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  GoogleMapController? _mapController;
  LatLng _selectedPosition = LatLng(37.5665, 126.9780); // Default to Seoul
  String _selectedAddress = 'Loading...';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _selectedPosition = LatLng(position.latitude, position.longitude);
    });

    await _getAddressFromLatLng(_selectedPosition);
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      setState(() {
        _selectedAddress = '${placemarks[0].locality} ${placemarks[0].street}';
      });
    }
  }

  void _onMapTap(LatLng position) async {
    setState(() {
      _selectedPosition = position;
    });

    await _getAddressFromLatLng(position);
  }

  void _onConfirm() {
    Navigator.pop(context, _selectedAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
        actions: [
          TextButton(
            onPressed: _onConfirm,
            child: Text(
              'Confirm',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: GoogleMap(
        onMapCreated: (controller) => _mapController = controller,
        initialCameraPosition: CameraPosition(
          target: _selectedPosition,
          zoom: 14,
        ),
        onTap: _onMapTap,
        markers: {
          Marker(
            markerId: MarkerId('selected_location'),
            position: _selectedPosition,
          ),
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Selected Address: $_selectedAddress',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
