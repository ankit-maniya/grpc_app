//
//  Generated code. Do not modify.
//  source: helloword.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class e_usertype extends $pb.ProtobufEnum {
  static const e_usertype OPERATOR = e_usertype._(0, _omitEnumNames ? '' : 'OPERATOR');
  static const e_usertype MANAGER = e_usertype._(1, _omitEnumNames ? '' : 'MANAGER');
  static const e_usertype DEVELOPER = e_usertype._(2, _omitEnumNames ? '' : 'DEVELOPER');

  static const $core.List<e_usertype> values = <e_usertype> [
    OPERATOR,
    MANAGER,
    DEVELOPER,
  ];

  static final $core.Map<$core.int, e_usertype> _byValue = $pb.ProtobufEnum.initByValue(values);
  static e_usertype? valueOf($core.int value) => _byValue[value];

  const e_usertype._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
