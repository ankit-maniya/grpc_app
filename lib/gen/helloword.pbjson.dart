//
//  Generated code. Do not modify.
//  source: helloword.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use e_usertypeDescriptor instead')
const e_usertype$json = {
  '1': 'e_usertype',
  '2': [
    {'1': 'OPERATOR', '2': 0},
    {'1': 'MANAGER', '2': 1},
    {'1': 'DEVELOPER', '2': 2},
  ],
};

/// Descriptor for `e_usertype`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List e_usertypeDescriptor = $convert.base64Decode(
    'CgplX3VzZXJ0eXBlEgwKCE9QRVJBVE9SEAASCwoHTUFOQUdFUhABEg0KCURFVkVMT1BFUhAC');

@$core.Deprecated('Use helloRequestDescriptor instead')
const HelloRequest$json = {
  '1': 'HelloRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `HelloRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloRequestDescriptor = $convert.base64Decode(
    'CgxIZWxsb1JlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZQ==');

@$core.Deprecated('Use helloResponseDescriptor instead')
const HelloResponse$json = {
  '1': 'HelloResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `HelloResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloResponseDescriptor = $convert.base64Decode(
    'Cg1IZWxsb1Jlc3BvbnNlEhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use userRequestDescriptor instead')
const UserRequest$json = {
  '1': 'UserRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'userId'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'email'},
    {'1': 'username', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'username'},
    {'1': 'user_type', '3': 4, '4': 1, '5': 14, '6': '.e_usertype', '10': 'userType'},
  ],
  '8': [
    {'1': 'request_type'},
  ],
};

/// Descriptor for `UserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userRequestDescriptor = $convert.base64Decode(
    'CgtVc2VyUmVxdWVzdBIZCgd1c2VyX2lkGAEgASgJSABSBnVzZXJJZBIWCgVlbWFpbBgCIAEoCU'
    'gAUgVlbWFpbBIcCgh1c2VybmFtZRgDIAEoCUgAUgh1c2VybmFtZRIoCgl1c2VyX3R5cGUYBCAB'
    'KA4yCy5lX3VzZXJ0eXBlUgh1c2VyVHlwZUIOCgxyZXF1ZXN0X3R5cGU=');

@$core.Deprecated('Use userResponseDescriptor instead')
const UserResponse$json = {
  '1': 'UserResponse',
  '2': [
    {'1': 'user_info', '3': 1, '4': 1, '5': 9, '10': 'userInfo'},
    {'1': 'user_type', '3': 2, '4': 1, '5': 14, '6': '.e_usertype', '10': 'userType'},
  ],
};

/// Descriptor for `UserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userResponseDescriptor = $convert.base64Decode(
    'CgxVc2VyUmVzcG9uc2USGwoJdXNlcl9pbmZvGAEgASgJUgh1c2VySW5mbxIoCgl1c2VyX3R5cG'
    'UYAiABKA4yCy5lX3VzZXJ0eXBlUgh1c2VyVHlwZQ==');

