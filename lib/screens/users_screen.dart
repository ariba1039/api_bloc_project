import 'package:api_bloc_project/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    context.read<UsersCubit>().onLoadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UsersScreen'),
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UsersLoadedState) {
            return ListView.builder(
              itemCount: state.usersModel.length,
              itemBuilder: (context, index) {
                return Text(state.usersModel[index].email!);
              },
            );
          } else if (state is UsersErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
