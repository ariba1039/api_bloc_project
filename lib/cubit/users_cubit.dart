import 'package:api_bloc_project/models/users_model.dart';
import 'package:api_bloc_project/repo/users_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersRepo usersRepo;
  UsersCubit(this.usersRepo) : super(UsersLoadingState());
  onLoadProducts() async {
    try {
      emit(UsersLoadingState());

      var data = await usersRepo.getProducts();

      emit(UsersLoadedState( data, ));
    } catch (e) {
      emit(UsersErrorState(e.toString(), errorMessage: ''));
    }
  }
}
