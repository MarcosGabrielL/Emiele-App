import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../components/config/size_config.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key,}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  Completer<GoogleMapController> _controller = Completer(); // Controlador do Google Map
  LocationData? _currentPosition; // Dados de localização atual do usuário
  LatLng? _latLong; // Coordenadas (latitude e longitude) do mapa
  bool _locating = false; // Variável para rastrear o status de localização
  geocoding.Placemark? _placeMark; // Informações do endereço do usuário

  // Posição inicial do mapa (GooglePlex em Mountain View)
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    _getUserLocation(); // Obtém a localização atual do usuário
    //getUserAddress(); // Obtém o endereço do usuário
    super.initState();
  }

  // Método para obter as permissões de localização do usuário
  Future<LocationData> _getLocationPermission() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    // Verifica se os serviços de localização estão habilitados
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        print('Serviço de localização não habilitado');
      }
    }

    // Verifica e solicita permissões de localização
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return Future.error('Permissão negada');
      }
    }

    // Obtém os dados de localização atual
    _locationData = await location.getLocation();
    return _locationData;
  }

  // Método para obter a localização atual do usuário
  _getUserLocation() async {
    _currentPosition = await _getLocationPermission();
    _goToCurrentPosition(LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!));
  }

  // Método para obter o endereço do usuário
  getUserAddress() async {
    List<geocoding.Placemark> placemarks = await geocoding.placemarkFromCoordinates(_latLong!.latitude, _latLong!.longitude);
    setState(() {
      _placeMark = placemarks.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: getProportionateScreenHeight(400),
                  decoration: const BoxDecoration(
                    border: const Border(
                      bottom: BorderSide(color: Colors.grey),
                    ),
                  ),
                  child: Stack(
                    children: [
                      GoogleMap(
                        myLocationEnabled: true, // Habilita a exibição da localização do usuário no mapa
                        myLocationButtonEnabled: true, // Habilita o botão de localização
                        mapType: MapType.terrain, // Define o tipo do mapa
                        initialCameraPosition: _kGooglePlex, // Posição inicial da câmera no mapa
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller); // Define o controlador do Google Map
                        },
                        onCameraMove: (CameraPosition position) {
                          // Atualiza as coordenadas quando o usuário move o mapa
                          setState(() {
                            _locating = true; // Indica que o mapa está sendo movido
                            _latLong = position.target; // Obtém as novas coordenadas do mapa
                          });
                        },
                        onCameraIdle: () {
                          setState(() {
                            _locating = false; // Indica que o mapa parou de ser movido
                          });
                          getUserAddress(); // Obtém o endereço do usuário após a parada do mapa
                        },
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.location_on, size: 40,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      _placeMark != null ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Visibility(
                        visible: _locating,
                          child: Text(_locating ? 'Localizando...' : _placeMark!.locality == null ? _placeMark!.subLocality! : _placeMark!.locality!,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Text('${_placeMark!.street!}' ),
                              ],
                          ),
                          Row(
                            children: [
                              Text('${_placeMark!.subLocality!}'),
                             ],
                          ),
                          Row(
                            children: [
                              Text(_placeMark!.subAdministrativeArea != null ? '${_placeMark!.subAdministrativeArea!}, ' : ''),
                            ],
                          ),
                          Text('${_placeMark!.administrativeArea!}, ${_placeMark!.country!}, ${_placeMark!.postalCode!}')
                        ],
                      ) : Container(),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                print(_placeMark!.toJson()); // Imprime as informações do endereço em formato JSON
                              },
                              child: Text('Confirmar Localização'),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );

  }

  // Método para mover a câmera do mapa para a posição atual do usuário
  Future<void> _goToCurrentPosition(LatLng latlng) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(latlng.latitude, latlng.longitude),
        //tilt: 59.440717697143555,
        zoom: 14.4746,
      ),
    ));
  }
}
