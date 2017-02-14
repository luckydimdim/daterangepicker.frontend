import 'dart:core';

import 'package:angular2/platform/browser.dart';
import 'package:angular2/core.dart';
import 'package:angular2/src/core/reflection/reflection.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/common.dart';

import 'package:resources_loader/resources_loader.dart';
import 'package:master_layout/master_layout_component.dart';

import 'package:daterangepicker/daterangepicker.dart';

bool get isDebug =>
  (const String.fromEnvironment('PRODUCTION', defaultValue: 'false')) != 'true';

@Component(selector: 'app')
@View(
  template: '''
    <master-layout>
      <drp></drp>
    </master-layout>''',
  directives: const [MasterLayoutComponent, DrpComponent])
class AppComponent {}

@Component(selector: 'drp')
@View(
  template: '''
      <div>
        <input date-range-picker="" id="daterangepicker"
          placeholder="Период"
          class="form-control date-picker ng-pristine ng-valid ng-isolate-scope ng-not-empty ng-touched"
          type="text" ng-model="date" options="opts"
          style=""/>
      </div>''')
class DrpComponent implements AfterViewInit {
  @override
  void ngAfterViewInit(){
    ResourcesLoaderService resourcesLoader = new ResourcesLoaderService();

    var options = new DateRangePickerOptions()
      ..startDate = '01/21/2017';

    new DateRangePicker(resourcesLoader, "#daterangepicker", options);
  }
}

main() async {
  if (isDebug) {
    reflector.trackUsage();
  }

  ComponentRef ref = await bootstrap(AppComponent, [
    ROUTER_PROVIDERS,
    const Provider(LocationStrategy, useClass: HashLocationStrategy),
    const Provider(ResourcesLoaderService)]);

  if (isDebug) {
    print('Application in DebugMode');
    enableDebugTools(ref);
    print('Unused keys: ${reflector.listUnusedKeys()}');
  }
}