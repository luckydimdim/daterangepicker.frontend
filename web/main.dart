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
class DrpComponent
  implements AfterViewInit {
  @override
  void ngAfterViewInit() {
    ResourcesLoaderService resourcesLoader = new ResourcesLoaderService();

    var locale = new DateRangePickerLocale()
      ..format = 'DD.MM.YYYY'
      ..separator = ' - '
      ..applyLabel = 'Применить'
      ..cancelLabel = 'Отменить'
      ..fromLabel = 'С'
      ..toLabel = 'По'
      ..customRangeLabel = 'Custom'
      ..weekLabel = 'W'
      ..daysOfWeek = ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб']
      ..monthNames = [
        'Январь',
        'Февраль',
        'Март',
        'Апрель',
        'Май',
        'Июнь',
        'Июль',
        'Август',
        'Сентябрь',
        'Октябрь',
        'Ноябрь',
        'Декабрь'
      ]
      ..firstDay = 1;

    var options = new DateRangePickerOptions()
      ..startDate = '02.03.2017'
      ..locale = locale;

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
    const Provider(ResourcesLoaderService)
  ]);

  if (isDebug) {
    print('Application in DebugMode');
    enableDebugTools(ref);
    print('Unused keys: ${reflector.listUnusedKeys()}');
  }
}