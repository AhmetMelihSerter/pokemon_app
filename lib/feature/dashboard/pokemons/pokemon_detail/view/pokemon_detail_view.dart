import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:pokemon/core/base/view/base_view.dart';
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/model/pokemon_list_model.dart';
import 'package:pokemon/feature/dashboard/pokemons/pokemon_detail/view_model/pokemon_detail_view_model.dart';
import 'package:pokemon/product/components/app_bar/custom_app_bar.dart';
import 'package:pokemon/product/components/jumping_dots/custom_jumping_dots.dart';
import 'package:pokemon/product/components/network_image/custom_image_network.dart';
import 'package:pokemon/product/constants/extensions/ui_extensions.dart';
import 'package:pokemon/product/constants/locale/local_keys.g.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PokemonDetailView extends StatelessWidget {
  const PokemonDetailView({
    super.key,
    required PokemonListModel pokemonModel,
  }) : _pokemonModel = pokemonModel;

  final PokemonListModel _pokemonModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<PokemonDetailViewModel>(
      onModelReady: (viewModel) {
        viewModel
          ..setContext(context)
          ..setArgs(_pokemonModel)
          ..init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(),
        );
      },
    );
  }

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      title: Consumer<PokemonDetailViewModel>(
        builder: (context, viewModel, child) => Text(
          viewModel.response?.name?.ext.toCapitalized() ?? '',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        Consumer<PokemonDetailViewModel>(
          builder: (context, viewModel, child) => IconButton(
            icon: Icon(
              viewModel.isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: viewModel.onTapFavorites,
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Consumer<PokemonDetailViewModel>(
      builder: (context, viewModel, child) => Padding(
        padding: context.padding.low,
        child: viewModel.response == null
            ? const CustomJumpingDots()
            : _buildPokemonDetail(viewModel),
      ),
    );
  }

  Widget _buildPokemonDetail(PokemonDetailViewModel viewModel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildPokemonImage(viewModel),
          buildSpacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(
                LocaleKeys
                    .dashboard_pokemons_pokemon_detail_view_stats_stats_table_name,
              ),
              _buildDivider(),
              _buildStats(viewModel),
              buildSpacer(),
              _buildTitle(
                LocaleKeys
                    .dashboard_pokemons_pokemon_detail_view_abilities_abilities_table_name,
              ),
              _buildDivider(),
              _buildAbility(viewModel),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      thickness: 2,
    );
  }

  Widget _buildPokemonImage(PokemonDetailViewModel viewModel) {
    return CustomImageNetwork(
      imageUrl: viewModel.imageUrl,
      scale: .5,
    );
  }

  Widget _buildStats(PokemonDetailViewModel viewModel) {
    return Table(
      children: [
        _buildTableRow(
          rows: [
            _buildSubTitle(
              LocaleKeys
                  .dashboard_pokemons_pokemon_detail_view_stats_stats_table_name,
            ),
            _buildSubTitle(
              LocaleKeys
                  .dashboard_pokemons_pokemon_detail_view_stats_stats_subtitle_slot,
            ),
            _buildSubTitle(
              LocaleKeys
                  .dashboard_pokemons_pokemon_detail_view_stats_stats_subtitle_hidden,
            ),
          ],
        ),
        for (final item in viewModel.response!.abilities)
          _buildTableRow(
            rows: [
              _buildText(item.ability?.name.ext.toCapitalized()),
              _buildText('${item.slot}'),
              _buildText(item.hiddenText.tr()),
            ],
          ),
      ],
    );
  }

  TableRow _buildTableRow({required List<Widget> rows}) {
    return TableRow(
      children: [...rows],
    );
  }

  Widget _buildTitle(String? title) {
    return Text(
      title ?? '',
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ).tr();
  }

  Widget _buildSubTitle(String? title) {
    return Text(
      title ?? '',
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ).tr();
  }

  Widget _buildText(String? text) {
    return Text(
      text ?? '',
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }

  Widget _buildAbility(PokemonDetailViewModel viewModel) {
    return Table(
      children: [
        _buildTableRow(
          rows: [
            _buildSubTitle(
              LocaleKeys
                  .dashboard_pokemons_pokemon_detail_view_abilities_abilities_subtitle_name,
            ),
            _buildSubTitle(
              LocaleKeys
                  .dashboard_pokemons_pokemon_detail_view_abilities_abilities_subtitle_stats,
            ),
            _buildSubTitle(
              LocaleKeys
                  .dashboard_pokemons_pokemon_detail_view_abilities_abilities_subtitle_effort,
            ),
          ],
        ),
        for (final item in viewModel.response!.stats)
          _buildTableRow(
            rows: [
              _buildText(item.stat?.name.ext.toCapitalized()),
              _buildText('${item.baseStat}'),
              _buildText('${item.effort}'),
            ],
          ),
      ],
    );
  }
}
