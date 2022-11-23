import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarCubit extends Cubit<double>{
  AppBarCubit() : super(0);


  static AppBarCubit get(context) => BlocProvider.of(context);
  void setOffset(double offset) => emit(offset);
}