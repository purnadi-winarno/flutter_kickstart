/* Notifiers:
*   - ValueNotifier           : hold the data
*   - ValueListenableBuilder  : listen to the data -> if change, it will refreshed (No need setState() method)
*     : wrap widget with ValueListenableBuilder() to consume the data -> don't forget to import the data too..
*/

import 'package:flutter/material.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
