import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../models/store_model.dart';

class StoreMapView extends StatefulWidget {
  final List<StoreModel> stores;

  const StoreMapView({super.key, required this.stores});

  @override
  State<StoreMapView> createState() => StoreMapViewState();
}

class StoreMapViewState extends State<StoreMapView> {
  GoogleMapController? _controller;

  @override
  Widget build(BuildContext context) {
    final Set<Marker> markers = widget.stores.map((store) {
      return Marker(
        markerId: MarkerId(store.code),
        position: LatLng(store.latitude, store.longitude),
        infoWindow: InfoWindow(title: store.storeLocation),
      );
    }).toSet();

    return GoogleMap(
      onMapCreated: (controller) => _controller = controller,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.stores.first.latitude, widget.stores.first.longitude),
        zoom: 12,
      ),
      markers: markers,
      zoomControlsEnabled: true,
      gestureRecognizers: {},
      myLocationButtonEnabled: false,
    );
  }

  void moveToStore(StoreModel store) {
    _controller?.animateCamera(CameraUpdate.newLatLng(
      LatLng(store.latitude, store.longitude),
    ));
  }
}
