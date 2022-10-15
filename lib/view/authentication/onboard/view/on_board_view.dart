import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/text/locale_text.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../_product/_widgets/avatar/on_board_circle_widget.dart';
import '../model/on_board_model.dart';
import '../view_model/on_board_view_model.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (OnBoardViewModel viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, OnBoardViewModel viewModel) {
        return Scaffold(
          body: Padding(
            padding: context.paddingNormalHorizontal,
            child: Column(
              children: [
                const Spacer(flex: 1),
                Expanded(
                  flex: 5,
                  child: buildPageView(viewModel),
                ),
                Expanded(flex: 2, child: buildRowFooter(context, viewModel)),
              ],
            ),
          ),
        );
      },
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
      itemCount: viewModel.onBoardItems.length,
      onPageChanged: (value) {
        viewModel.changeCurrentIndex(value);
      },
      itemBuilder: (context, index) =>
          buildColumnBody(context, viewModel.onBoardItems[index]),
    );
  }

  //
  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 5, child: buildImagePicture(model.imagePath)),
        buildColumnDescription(context, model),
      ],
    );
  }

  Image buildImagePicture(String path) => Image.asset(path);

  Column buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Padding(
          padding: context.paddingLow,
          child: localTextTitle(model, context),
        ),
        Padding(
          padding: context.paddingLowHorizontal,
          child: localTextDescription(model, context),
        )
      ],
    );
  }

  LocaleText localTextTitle(OnBoardModel model, BuildContext context) {
    return LocaleText(
        text: model.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline4!.copyWith(
            fontWeight: FontWeight.bold, color: context.colors.onSurface));
  }

  LocaleText localTextDescription(OnBoardModel model, BuildContext context) {
    return LocaleText(
        text: model.description,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.w300, height: 2));
  }
  //

  ///
  Row buildRowFooter(BuildContext context, OnBoardViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 2, child: buildListViewCircles(viewModel)),
        Expanded(
          child: Center(
            child: Observer(
              builder: (context) {
                return Visibility(
                    visible: viewModel.isLoading,
                    child: const CircularProgressIndicator());
              },
            ),
          ),
        ),
        buildFloatActionButtonSkip(viewModel),
      ],
    );
  }

  ListView buildListViewCircles(OnBoardViewModel viewModel) {
    return ListView.builder(
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Observer(builder: (_) {
          return OnBoardCircle(isSelected: viewModel.currentIndex == index);
        });
      },
    );
  }

  FloatingActionButton buildFloatActionButtonSkip(OnBoardViewModel viewModel) {
    return FloatingActionButton(
      onPressed: () async {
        await viewModel.completeToOnBoard();
      },
      child: const Icon(Icons.navigate_next_sharp),
    );
  }

  ///
}
