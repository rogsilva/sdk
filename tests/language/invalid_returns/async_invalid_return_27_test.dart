// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

/* `return exp;` where `exp` has static type `S` is an error if the future
 * value type of the function is neither `void` nor `dynamic`,
 * and `flatten(S)` is `void` or `void*`.
 *
 * With null-safety, this is an error because of the downcast.
 */

Future<void> v = Future.value(null);

Future<int> test() async {
  return v;
  //     ^
  // [analyzer] STATIC_TYPE_WARNING.RETURN_OF_INVALID_TYPE
  // [cfe] This expression has type 'void' and can't be used.
}

void main() {
  test();
}