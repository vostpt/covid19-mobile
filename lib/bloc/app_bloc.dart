import 'package:covid19_mobile_triage/model/api_response_model.dart';
import 'package:covid19_mobile_triage/services/api_service.dart';

import 'package:covid19_mobile_triage/ui/app.dart';
import 'package:covid19_mobile_triage/bloc/base_bloc.dart';

class AppBloc implements Bloc {
  static const String _tag = '.AppBloc';

  void foo() async {
    final APIResponse response = await APIService.api.getFoo(null);
    if (response.isOk) {
      logger.i('[$_tag] everything went ok!');
      // do something
    } else {
      logger.e('[$_tag] oops...');
      // throw some error
    }
  }

  @override
  void dispose() {
    // Dispose streams here
  }
}
