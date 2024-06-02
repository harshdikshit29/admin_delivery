import 'package:mysql1/mysql1.dart';

class apiUrl {
  void connection() async {
   final ConnectionSettings settings = ConnectionSettings(
      host: 'srv665.hstgr.io',
      port: 3306,
      user: 'u332079037_iwashhubonline', //u332079037_iwashhubonline
      password: 'Iwashhub@123', //'Iwashhub@123
      db: 'u332079037_iwashhubapp',
    );
    // Connect to the Hostinger database
    final MySqlConnection conn = await MySqlConnection.connect(settings);
  }
}
