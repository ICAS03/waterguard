import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:waterguard/auth.dart';
import 'package:waterguard/models/colors.dart' as custom_color;
import 'package:waterguard/models/flood_model.dart';
import 'package:waterguard/providers/flood_provider.dart';
import 'package:waterguard/providers/realtimeflood_provider.dart';
import 'package:waterguard/providers/update_flood_provider.dart';
import 'package:waterguard/widgets/details_card.dart';

class menuCard extends StatefulWidget {
  final Position? position;

  const menuCard({Key? key, this.position}) : super(key: key);
  @override
  State<menuCard> createState() => _menuCardState();
}

class _menuCardState extends State<menuCard> {
  String _currentAddress = "";
  bool _isLoading = true;

  @override
  void initState() {
    var _floodprovider = Provider.of<UpdateFloodProvider>(context, listen: false);
    if (_floodprovider.floodList.isEmpty) {
      _floodprovider.fetchFloodId().then(
        (_) {
          print('Successfuly fetched ${_floodprovider.floodList.length} ids');
          _floodprovider.fetchAllFloodData().then(
            (_) {
              setState(
                () {
                  _isLoading = false;
                },
              );
            },
          );
        },
      );
    } else {
      setState(
        () {
          _isLoading = false;
        },
      );
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        builder: (_, scrollController) {
          return Consumer<realtimeflood_provider>(
            builder: (context, _realtimeflood_provider, _) {
              var _updateFloodProvider =
                  Provider.of<UpdateFloodProvider>(context, listen: false);
              var _waterlevel_provider =
                  Provider.of<realtimeflood_provider>(context, listen: false);
              _updateFloodProvider.updateWaterLvl(_waterlevel_provider.water_level);
              return Container(
                  decoration: BoxDecoration(
                      color: custom_color.primaryBlue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  padding: EdgeInsets.all(13.0),
                  child: ListView.builder(
                  controller: scrollController,
                  itemCount: _updateFloodProvider.floodList.length,
                  itemBuilder: (context, index) {
                    final flood = _updateFloodProvider.loadedFloodList[index];
                    return ListTile(
                      leading: Text(
                        DateFormat.jm().format(DateTime.now()),
                        style: TextStyle(
                            fontSize: 25,
                            color: custom_color.backgroundwhite,
                            fontWeight: FontWeight.w600),
                      ),
                      title: Text(
                        flood.location,
                        style: TextStyle(
                            fontSize: 20,
                            color: custom_color.backgroundwhite,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        'Water Depth : ${_realtimeflood_provider.water_level} cm',
                        style: TextStyle(
                            fontSize: 20,
                            color: custom_color.secondaryYellow,
                            fontWeight: FontWeight.w500),
                      ),
                      onTap: () => {
                        /*showModalBottomSheet(
                          isDismissible: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => detailsCard(flood: flood))*/
                      },
                    );
                  },
                ),
);
            },
          );
        });
  }
}
