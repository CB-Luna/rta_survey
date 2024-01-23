import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const String supabaseUrl = 'https://supa42.rtatel.com/';
const String anonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICAgInJvbGUiOiAiYW5vbiIsCiAgICAiaXNzIjogInN1cGFiYXNlIiwKICAgICJpYXQiOiAxNjg0ODI1MjAwLAogICAgImV4cCI6IDE4NDI2NzgwMDAKfQ.Atj9wTNbdEEVPOjstsO14DtxbY2SEpnr50elVXBgAmM';
// const String supabaseUrl = 'https://supa41.rtatel.com/';
// const String anonKey =
//     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICAgInJvbGUiOiAiYW5vbiIsCiAgICAiaXNzIjogInN1cGFiYXNlIiwKICAgICJpYXQiOiAxNjg0ODI1MjAwLAogICAgImV4cCI6IDE4NDI2NzgwMDAKfQ.Atj9wTNbdEEVPOjstsO14DtxbY2SEpnr50elVXBgAmM';

SupabaseClient supabase = Supabase.instance.client;

// D e s k t o p
const double minWidth = 800.0;
const double maxWidth = 1400.0;
const double maxRangeValue = maxWidth - minWidth;

screenSize(context) {
  var screenSize = MediaQuery.of(context).size;
  return screenSize;
}

mobile(context) {
  bool mobile = screenSize(context).width < minWidth ? true : false;

  return mobile;
}
