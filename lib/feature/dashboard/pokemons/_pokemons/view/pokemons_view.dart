import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:kartal/kartal.dart';
import 'package:pokemon/core/base/view/base_view.dart';
import 'package:pokemon/core/constants/app/application_constants.dart';
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/view_model/pokemons_view_model.dart';
import 'package:pokemon/product/components/app_bar/custom_app_bar.dart';
import 'package:pokemon/product/components/network_image/custom_image_network.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PokemonsView extends StatelessWidget {
  const PokemonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PokemonsViewModel>(
      onModelReady: (viewModel) {
        viewModel
          ..setContext(context)
          ..init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(context, viewModel),
        );
      },
    );
  }

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      title: const Text(
        ApplicationConstants.APP_NAME,
      ),
      actions: [
        Consumer<PokemonsViewModel>(
          builder: (context, viewModel, child) => Padding(
            padding: context.padding.normal,
            child: badges.Badge(
              badgeContent: Text(
                '${viewModel.favoritePokemonCount}',
              ),
              child: const Icon(Icons.favorite),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, PokemonsViewModel viewModel) {
    return Padding(
      padding: context.padding.low,
      child: Column(
        children: [
          _buildPokemonList(),
        ],
      ),
    );
  }

  Widget _buildPokemonList() {
    return Expanded(
      child: FadeInUp(
        child: Consumer<PokemonsViewModel>(
          builder: (context, viewModel, child) =>
              NotificationListener<ScrollEndNotification>(
            onNotification: viewModel.onScrollEndNotification,
            child: ListView.builder(
              itemCount: viewModel.pokemonList.length,
              itemBuilder: (_, index) {
                return _buildListItem(context, viewModel, index);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(
    BuildContext context,
    PokemonsViewModel viewModel,
    int index,
  ) {
    final model = viewModel.pokemonList[index];
    return ListTile(
      onTap: () => viewModel.onPokemonDetail(model),
      leading: CustomImageNetwork(
        width: .1,
        height: .1,
        imageUrl: model.imageUrl,
      ),
      title: Text(model.name.ext.toCapitalized()),
      trailing: const Icon(Icons.keyboard_arrow_right),
    );
  }
}
