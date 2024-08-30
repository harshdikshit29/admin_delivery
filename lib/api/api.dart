import 'package:mysql1/mysql1.dart';

class DatabaseManager {
  static Future<MySqlConnection> connect() async {
    final ConnectionSettings settings = ConnectionSettings(
      host: 'srv1495.hstgr.io',
      port: 3306,
      user: 'u801886947_friendsdigital',
      password: 'Friends_Digital@123@',
      db: 'u801886947_friendsdigital',
    );
    // Connect to the Hostinger database
    return await MySqlConnection.connect(settings);
  }
}
