# Task: Implement unfavorite fix and configure button in FavoriteItem

## Steps to Complete

1. [ ] Update lib/widgets/favorite_item.dart:
   - Add new callback: VoidCallback? onConfigure
   - Fix existing IconButton: Set onPressed to onUnfavorite(), remove broken code, keep Icons.favorite (filled) with deepOrange color and size 30.
   - Replace single IconButton with a Row of two IconButtons: Unfavorite (left) and Configure (right, Icons.edit, deepOrange, size 30, onPressed: onConfigure).
   - Adjust layout to fit both buttons at the end of the Row.

2. [ ] Update lib/pages/favorites_page.dart:
   - In the FavoriteItem instantiation, add onConfigure: () { ... } callback.
   - Implement onConfigure: Show an AlertDialog or showModalBottomSheet with TextFields for editing name and price (use TextEditingController with initial values).
   - On save: Find global index in food list, update with copyWith(new name, new price), call setState(() {}).
   - On cancel: Dismiss dialog.
   - Validate price as double > 0.

3. [ ] Test the implementation:
   - Run `flutter run` to start the app.
   - Navigate to Favorites page (assume some items are favorited; if not, favorite one from home).
   - Verify unfavorite button removes item from list and updates isfavorite globally.
   - Verify configure button opens edit dialog, allows changes to name/price, saves and updates UI/list.
   - Navigate back to home to confirm changes persist in grid.

4. [ ] Mark as complete and attempt_completion.
