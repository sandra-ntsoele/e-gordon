import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:e_gordon/services/auth_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseHelper {
  /* FIELDS */
  final String _supabaseUrl = "https://igzvyjvoqclpdwvokngt.supabase.co";
  final String _anonKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlnenZ5anZvcWNscGR3dm9rbmd0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTAyOTE5NjQsImV4cCI6MTk2NTg2Nzk2NH0.ogT2qbFL-4RxbzVWA_Ab2kTLOcGOcXRGOITjGCebHPA";
  final AuthService _authService = AuthService();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  /* PROPERTIES */

  /* METHODS*/
  Future<SupabaseClient> getSupabase(String supabaseToken) async {
    SupabaseClient supabase = SupabaseClient(_supabaseUrl, _anonKey);
    supabase.auth.setAuth(supabaseToken);

    return supabase;
  }

  Future<String> signSupabaseToken(String firebaseToken) async {
    // Decode to get payload
    Map<String, dynamic> payload = JwtDecoder.decode(firebaseToken);

    // Sign new token with Supabase secret
    String supabaseToken = JWT(payload).sign(
      SecretKey('7a6ce120-ffb6-4132-a02b-7602eba8f7a2'),
    );

    return supabaseToken;
  }

  Future<PostgrestResponse<dynamic>?> syncUser(user) async {
    if (user != null) {
      String firebaseToken = await user.getIdToken(true);
      // Create a Supabase token
      String supabaseToken = await signSupabaseToken(firebaseToken);
      // Write token to secure-storage
      await _secureStorage.write(
        key: "supabase-token",
        value: supabaseToken,
      );

      // Create supabase client
      SupabaseClient supabase = await getSupabase(supabaseToken);
      // Then sync user to Supabase
      PostgrestResponse response = await supabase.from("users").insert({
        "user_id": user.uid,
        "email": user.email,
      }).execute();
      return response;
    } else {
      return null;
    }
  }
}
