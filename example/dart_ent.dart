// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library dart_ent.example;

import 'package:dart_ent/dart_ent.dart';
import 'package:react/react_client.dart' as reactClient;
import 'package:react/react.dart' as React;
import 'dart:html';

import 'package:dart_ent/src/v1/react/components.dart' as Components;


import 'example_app/component.dart';

main() {
  reactClient.setClientConfiguration();

  React.render(ExampleApp({}, null), querySelector('#harness'));


  // Test 1
  // Given a simple consumer supplied tree of data that looks like the following:
  var data = {
    'label': 'Root',
    'children': [
      {
        'label' : 'Child 1',
      },
      {
        'label' : 'Child 2',
      },
      {
        'label' : 'Child 3'
      }
    ]
  };

  React.render(Components.TreeRenderer({'node': data}, null), querySelector('#test1'));

  // Test 2
  // Given a simple consumer supplied tree of data that looks like the following:
  var data2 = {
    'label': 'Root',
    'children': [
      {
        'label' : 'Child 1',
      },
      {
        'label' : 'Child 2',
        'children': [
          {
            'label': 'Child 2 - Child 1'
          },
          {
            'label': 'Child 2 - Child 2',
            'children': [
              {
                'label': 'Child 2 - Child 2 - Child 1'
              },
            ]
          },
        ]
      },
      {
        'label' : 'Child 3',
        'children': [
          {
            'label': 'Child 3 - Child 1'
          }
        ]
      }
    ]
  };

  React.render(Components.TreeRenderer({'node': data2}, null), querySelector('#test2'));
}
