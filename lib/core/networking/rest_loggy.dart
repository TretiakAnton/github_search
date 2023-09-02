import 'package:loggy/loggy.dart';

mixin RestLoggy implements LoggyType {
  @override
  Loggy<RestLoggy> get loggy => Loggy<RestLoggy>('Rest Loggy - $runtimeType');
}
