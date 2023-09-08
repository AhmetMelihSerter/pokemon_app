import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:kartal/kartal.dart';
import 'package:pokemon/core/base/view/base_view.dart';
import 'package:pokemon/feature/dashboard/favorites/view_model/favorites_view_model.dart';
import 'package:pokemon/product/components/app_bar/custom_app_bar.dart';
import 'package:pokemon/product/components/network_image/custom_image_network.dart';
import 'package:pokemon/product/constants/locale/local_keys.g.dart';
import 'package:provider/provider.dart';

@RoutePage()
class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<FavoritesViewModel>(
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
      title: Text(
        LocaleKeys.dashboard_favorites_view_app_bar_title.tr(),
      ),
    );
  }

  Widget _buildBody(BuildContext context, FavoritesViewModel viewModel) {
    return Padding(
      padding: context.padding.low,
      child: Column(
        children: [
          _buildFavoritesList(),
        ],
      ),
    );
  }

  Widget _buildFavoritesList() {
    return Expanded(
      child: FadeInUp(
        child: Consumer<FavoritesViewModel>(
          builder: (context, viewModel, child) => ListView.builder(
            itemCount: viewModel.favoritesList.length,
            itemBuilder: (_, index) {
              return _buildListItem(context, viewModel, index);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(
    BuildContext context,
    FavoritesViewModel viewModel,
    int index,
  ) {
    final model = viewModel.favoritesList[index];
    return Dismissible(
      key: Key('$index'),
      background: const ColoredBox(
        color: Colors.red,
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) async {
        final isConfirm = await viewModel.deleteFavorites(model);
        return isConfirm;
      },
      child: ListTile(
        onTap: () => viewModel.onPokemonDetail(model),
        leading: CustomImageNetwork(
          width: .1,
          height: .1,
          imageUrl: model.imageUrl,
        ),
        title: Text(model.name ?? ''),
        trailing: const Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
/*return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => viewModel.deleteFavorites(model),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Remove',
          ),
        ],
      ),
      child: ListTile(
        onTap: () => viewModel.onPokemonDetail(model),
        leading: CustomImageNetwork(
          width: .1,
          height: .1,
          imageUrl: model.imageUrl,
        ),
        title: Text(model.name ?? ''),
        trailing: const Icon(Icons.keyboard_arrow_right),
      ),
    );
  } */
