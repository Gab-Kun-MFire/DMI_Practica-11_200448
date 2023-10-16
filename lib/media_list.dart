import 'package:flutter/material.dart';
import 'package:dmi_practica10_200448/common/HttpHandler.dart';
import 'package:dmi_practica10_200448/media_detail.dart';
import 'package:dmi_practica10_200448/model/Media.dart';
import 'package:dmi_practica10_200448/media_list_item.dart';
import 'package:dmi_practica10_200448/media_detail.dart';
import 'package:dmi_practica10_200448/common/MediaProvider.dart';

class MediaList extends StatefulWidget {
  final MediaProvider provider;
  MediaList(this.provider);
  @override
  _MediaListState createState() =>
      new _MediaListState(); // Define una clase que extiende StatefulWidget y proporciona un método para crear su estado interno.
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = [];
  @override
  void initState() {
    super.initState();
    loadMedia();
  }
  @override
  void didUpdateWidget(MediaList oldWidget){
    if(oldWidget.provider.runtimeType != widget.provider.runtimeType){
      _media = [];
      loadMedia();
    }
    super.didUpdateWidget(oldWidget);
  }

  void loadMedia() async {
    var media =await widget.provider.fetchMedia();
    setState(() {
      _media.addAll(media);
    });
  }

  // Define una clase que extiende State y representa el estado interno de MediaList.
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return new ElevatedButton(
            child: new MediaListItem(_media[index]),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new MediaDetail(_media[index]);
              }));
            },
          );
          // return new MediaListItem(_media[index]);
        },
      ),
    );
  }
}