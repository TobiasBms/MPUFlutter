import "dart:core";
import 'package:flutter/material.dart';

class UserRequest{
 late UniqueKey guid;
 late String username;
 late String hashedPassword;
 late DateTime created;

 UserRequest(this.username, this.hashedPassword){
     guid = UniqueKey();
     created = DateTime.now();
 }

}