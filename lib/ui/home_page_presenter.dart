import 'dart:async';
import 'package:flutter_mvp_app/data/AppDataManager.dart';
import 'package:flutter_mvp_app/ui/base/base_presenter.dart';
import 'package:flutter_mvp_app/ui/home_page_view.dart';
import 'package:flutter_mvp_app/utils/network_utils.dart';

class HomePagePresenter extends BasePresenter<HomePageView> {
  Future getText() async {
    checkViewAttached();
    var response = await appDataManager.apiHelper.fetchtext();
    if (NetworkUtils.isReqSuccess(response)) {
      String text = response.body;
      isViewAttached ? getView().onLoadText(text) : null;
    } else {
      isViewAttached ? getView().onFailLoadText() : null;
    }
  }
}
