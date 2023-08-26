import 'package:intl/intl.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String get toDate {
    if (isNotEmpty) {
      try {
        final date = DateTime.parse(this).toLocal();
        final now = DateTime.now();
        final diff = now.difference(date);
        if (diff.inHours == 0) {
          return "${diff.inMinutes} mins ago";
        } else if (diff.inHours == 1) {
          return "${diff.inHours} hr ago";
        } else if (diff.inHours < 24) {
          return "${diff.inHours} hrs ago";
        } else {
          final DateFormat formatter = DateFormat('dd MMM yyyy');
          return formatter.format(date);
        }
      } catch (e) {
        return "";
      }
    } else {
      return "";
    }
  }
}
