// Automatic FlutterFlow imports
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> insert(
  String? name,
  String? email,
  String? phone,
  String? subject,
  String? message,
) async {
  try {
    // Get the Supabase client instance
    final supabase = SupaFlow.client;

    // Insert the record into the contact table
    await supabase.from('contact').insert({
      'name': name,
      'email': email,
      'phone': phone,
      'subject': subject,
      'message': message,
    });

    // Return true if successful
    return true;
  } catch (e) {
    // Log the error and return false
    print('Error inserting contact: $e');
    return false;
  }
}
