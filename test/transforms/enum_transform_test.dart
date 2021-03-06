import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pt_flutter_object_mapper/pt_flutter_object_mapper.dart';

class TestEnum extends Enumerable<int> {
  @override
  late final int rawValue;
  TestEnum({required this.rawValue});

  static final a = TestEnum(rawValue: 0);
  static final b = TestEnum(rawValue: 1);
}

void main() {
  setUp(() {
    Mappable.factories = {TestEnum: (v) => TestEnum(rawValue: v)};
  });

  test('fromJson', () {
    final transform = EnumTransform<TestEnum, int>();

    // null
    var value = transform.fromJson(null);
    expect(value, null);

    // a
    value = transform.fromJson(0);
    expect(value, TestEnum.a);

    // empty string
    value = transform.fromJson('');
    expect(value, null);

    // a in string
    value = transform.fromJson('0');
    expect(value, null);
  });

  test('toJson', () {
    final transform = EnumTransform<TestEnum, int>();

    // null
    expect(transform.toJson(null), isNull);

    // a
    expect(transform.toJson(TestEnum.a), TestEnum.a.rawValue);
  });
}
