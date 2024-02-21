import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterguard/models/colors.dart' as custom_color;
import 'package:waterguard/models/flood_model.dart';
import 'package:waterguard/providers/flood_provider.dart';
import 'package:waterguard/widgets/details_card.dart';

class menuCard extends StatefulWidget {
  @override
  State<menuCard> createState() => _menuCardState();
}

class _menuCardState extends State<menuCard> {
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    var _floodprovider = Provider.of<FloodProvider>(context, listen: false);
    if (_floodprovider.floodIdList.isEmpty) {
      _floodprovider.fetchFloodId().then(
        (_) {
          print('Successfuly fetched ${_floodprovider.floodIdList.length} ids');
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
    var _floodprovider = Provider.of<FloodProvider>(context, listen: false);

    return DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        builder: (_, scrollController) => Container(
              decoration: BoxDecoration(
                  color: custom_color.primaryBlue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              padding: EdgeInsets.all(13.0),
              child: ListView.builder(
                controller: scrollController,
                itemCount: _floodprovider.floodIdList.length,
                itemBuilder: (context, index) {
                  final flood = _floodprovider.loadedFloodList[index];
                  return ListTile(
                    leading: Text(
                      flood.time,
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
                      'Water Depth : ${flood.waterlevel} cm',
                      style: TextStyle(
                          fontSize: 20,
                          color: custom_color.secondaryYellow,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () => {
                      showModalBottomSheet(
                          isDismissible: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => detailsCard(flood: flood)),
                    },
                  );
                },
              ),
            ));
  }
}
