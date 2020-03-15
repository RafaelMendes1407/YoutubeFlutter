import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube/model/Video.dart';

const YouTube_Key = "AIzaSyBQBodFoUT6phm_9nBgTk4hlayFEd4KmC8"; //Inative Key
const URL_base = "https://www.googleapis.com/youtube/v3";
const Chanel_id = "UCwXdFgeE9KYzlDdR7TG9cMw";

class Api {

  Future <List<Video>> search(String search) async {
    http.Response resp = await http.get(URL_base+"/search"
      "?part=snippet"
      "&type=video"
      "&maxResults=20"
      "&order=date"
      "&key=$YouTube_Key"
      "&channelId=$Chanel_id"
      "&q=$search"
    );
    if(resp.statusCode == 200){
      Map<String, dynamic> dados = json.decode(resp.body);
      List<Video> videos = dados["items"].map<Video>(
        (map){
          return Video.fromJson(map);
        }
      ).toList();


      return videos;
    }else{

    }
  }


}