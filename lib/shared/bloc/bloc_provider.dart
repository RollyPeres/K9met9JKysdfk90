import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/auth/auth.dart';
// import '../../modules/home/bloc/bloc.dart';

class BlocProviders {
  List<BlocProvider> getProviders() {
    return [
      // BlocProvider<BottomNavBloc>(
      //   create: (context) => BottomNavBloc(),
      // ),
      BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
      ),
    ];
  }
}
