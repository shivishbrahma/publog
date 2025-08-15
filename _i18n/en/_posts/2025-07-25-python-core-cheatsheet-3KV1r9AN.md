---
layout: post
title: "Python Core Cheatsheet"
date: '2025-07-25 10:28:40 +05:30'
tags: python cheatsheet
---

## Date and Time

### Date Directives

| Format | Meaning                           | Example    |
| ------ | --------------------------------- | ---------- |
| `%Y`   | Year (4 digits)                   | `2025`     |
| `%y`   | Year (2 digits)                   | `25`       |
| `%m`   | Month (01-12)                     | `07`       |
| `%B`   | Full month name                   | `July`     |
| `%b`   | Abbreviated month name            | `Jul`      |
| `%d`   | Day of the month (01–31)          | `17`       |
| `%j`   | Day of year (001–366)             | `198`      |
| `%A`   | Full weekday name                 | `Thursday` |
| `%a`   | Abbreviated weekday name          | `Thu`      |
| `%w`   | Weekday as decimal (0=Sunday)     | `4`        |
| `%U`   | Week number (Sunday as first day) | `28`       |
| `%W`   | Week number (Monday as first day) | `28`       |

### Time Directives

| Format | Meaning                     | Example  |
| ------ | --------------------------- | -------- |
| `%H`   | Hour (24-hour clock, 00–23) | `18`     |
| `%I`   | Hour (12-hour clock, 01–12) | `06`     |
| `%p`   | AM or PM                    | `PM`     |
| `%M`   | Minute (00–59)              | `45`     |
| `%S`   | Second (00–59)              | `30`     |
| `%f`   | Microsecond (000000–999999) | `123456` |
| `%z`   | UTC offset                  | `+0530`  |
| `%Z`   | Time zone name              | `IST`    |

## Data Types and Structures

### String

|Syntax|Purpose|Example|
|------|-------|-------|
|`str.upper()`|Convert to uppercase|`"hello".upper()` → `"HELLO"`|
|`str.lower()`|Convert to lowercase|`"HELLO".lower()` → `"hello"`|
|`str.title()`|Convert to title case|`"hello world".title()` → `"Hello World"`|
|`str.capitalize()`|Capitalize first letter|`"hello".capitalize()` → `"Hello"`|
|`str.strip()`|Remove whitespace from both ends|`"  hello  ".strip()` → `"hello"`|
|`str.split(sep)`|Split string into list|`"a,b,c".split(",")` → `["a", "b", "c"]`|
|`str.join(iterable)`|Join iterable into string|`",".join(["a", "b", "c"])` → `"a,b,c"`|
|`str.replace(old, new)`|Replace substring|`"hello world".replace("world", "Python")` → `"hello Python"`|
|`str.find(sub)`|Find substring index|`"hello".find("e")` → `1`|
|`str.count(sub)`|Count occurrences of substring|`"hello".count("l")` → `2`|
|`str.startswith(prefix)`|Check if string starts with prefix|`"hello".startswith("he")` → `True`|
|`str.endswith(suffix)`|Check if string ends with suffix|`"hello".endswith("lo")` → `True`|
|`str.isdigit()`|Check if string is a digit|`"123".isdigit()` → `True`|
|`str.isalpha()`|Check if string is alphabetic|`"abc".isalpha()` → `True`|
|`str.isalnum()`|Check if string is alphanumeric|`"abc123".isalnum()` → `True`|
|`str.islower()`|Check if string is lowercase|`"hello".islower()` → `True`|
|`str.isupper()`|Check if string is uppercase|`"HELLO".isupper()` → `True`|
|`str.isprintable()`|Check if string is printable|`"hello".isprintable()` → `True`|
|`str.swapcase()`|Swap case of all characters|`"Hello World".swapcase()` → `"hELLO wORLD"`|
|`str.zfill(width)`|Pad string with zeros on the left|`"42".zfill(5)` → `"00042"`|

### List

|Syntax|Purpose|Example|
|------|-------|-------|
|`list.append(item)`|Add item to end of list|`[1, 2].append(3)` → `[1, 2, 3]`|
|`list.extend(iterable)`|Extend list with iterable|`[1, 2].extend([3, 4])` → `[1, 2, 3, 4]`|
|`list.insert(index, item)`|Insert item at index|`[1, 2].insert(1, 1.5)` → `[1, 1.5, 2]`|
|`list.remove(item)`|Remove first occurrence of item|`[1, 2, 3].remove(2)` → `[1, 3]`|
|`list.pop(index)`|Remove and return item at index|`[1, 2, 3].pop(1)` → `2`|
|`list.clear()`|Remove all items from list|`[1, 2, 3].clear()` → `[]`|
|`list.index(item)`|Return index of first occurrence|`[1, 2, 3].index(2)` → `1`|
|`list.count(item)`|Count occurrences of item|`[1, 2, 3].count(2)` → `1`|
|`list.sort()`|Sort list in place|`[3, 1, 2].sort()` → `[1, 2, 3]`|
|`list.reverse()`|Reverse list in place|`[1, 2, 3].reverse()` → `[3, 2, 1]`|
|`list.copy()`|Return shallow copy of list|`[1, 2, 3].copy()` → `[1, 2, 3]`|
|`list.index(item, start, end)`|Return index of item in range|`[1, 2, 3].index(2, 0, 3)` → `1`|
|`list.sort(key=None, reverse=False)`|Sort list with optional key and reverse|`[3, 1, 2].sort(key=lambda x: -x)` → `[3, 2, 1]`|
|a_list[0] | Access first element of list | `[1, 2, 3][0]` → `1` |
|`a_list[-1]` | Access last element of list | `[1, 2, 3][-1]` → `3` |
|`a_list[1:3]` | Slice list from index 1 to 2 | `[1, 2, 3][1:3]` → `[2, 3]` |
|`a_list[:2]` | Slice list from start to index 1 | `[1, 2, 3][:2]` → `[1, 2]` |
|`a_list[1:]` | Slice list from index 1 to end | `[1, 2, 3][1:]` → `[2, 3]` |
|`a_list[::2]` | Slice list with step 2 | `[1, 2, 3, 4][::2]` → `[1, 3]` |
|`a_list[::-1]` | Reverse list | `[1, 2, 3][::-1]` → `[3, 2, 1]` |
|`a_list * 2` | Repeat list | `[1, 2] * 2` → `[1, 2, 1, 2]` |
|`a_list + b_list` | Concatenate lists | `[1, 2] + [3, 4]` → `[1, 2, 3, 4]` |
|`len(a_list)` | Get length of list | `len([1, 2, 3])` → `3` |

## Dictionary

|Syntax|Purpose|Example|
|------|-------|-------|
|`dict[key]`|Access value by key|`{"a": 1, "b": 2}["a"]` → `1`|
|`dict[key] = value`|Set value for key|`{"a": 1, "b": 2}["c"] = 3` → `{"a": 1, "b": 2, "c": 3}`|
|`dict.get(key, default)`|Get value by key with default|`{"a": 1}.get("b", 0)` → `0`|
|`dict.keys()`|Get all keys|`{"a": 1, "b": 2}.keys()` → `dict_keys(['a', 'b'])`|
|`dict.values()`|Get all values|`{"a": 1, "b": 2}.values()` → `dict_values([1, 2])`|
|`dict.items()`|Get all key-value pairs|`{"a": 1, "b": 2}.items()` → `dict_items([('a', 1), ('b', 2)])`|
|`dict.pop(key)`|Remove and return value by key|`{"a": 1, "b": 2}.pop("a")` → `1`|
|`dict.popitem()`|Remove and return last key-value pair|`{"a": 1, "b": 2}.popitem()` → `('b', 2)`|
|`dict.clear()`|Clear dictionary|`{"a": 1, "b": 2}.clear()` → `{}`|
|`dict.update(other_dict)`|Update with another dictionary|`{"a": 1}.update({"b": 2})` → `{"a": 1, "b": 2}`|
|`dict.copy()`|Return shallow copy of dictionary|`{"a": 1, "b": 2}.copy()` → `{"a": 1, "b": 2}`|
|`dict.fromkeys(keys, value)`|Create dictionary with keys and value|`dict.fromkeys(["a", "b"], 0)` → `{"a": 0, "b": 0}`|
|`key in dict`|Check if key exists|`"a" in {"a": 1, "b": 2}` → `True`|
|`dict.setdefault(key, default)`|Get value or set default if key not exists|`{"a": 1}.setdefault("b", 2)` → `2`|
|`dict1 \| dict2` | Merge two dictionaries | `{"a": 1} \| {"b": 2}` → `{"a": 1, "b": 2}` |

## Set

|Syntax|Purpose|Example|
|------|-------|-------|
|`set([1, 2, 3])`|Create set from list|`set([1, 2, 3])` → `{1, 2, 3}`|
|`set.add(item)`|Add item to set|`{1, 2}.add(3)` → `{1, 2, 3}`|
|`set.remove(item)`|Remove item from set|`{1, 2, 3}.remove(2)` → `{1, 3}`|
|`set.discard(item)`|Remove item if exists|`{1, 2, 3}.discard(2)` → `{1, 3}`|
|`set.pop()`|Remove and return arbitrary item|`{1, 2, 3}.pop()` → `1` (or `2` or `3`)|
|`set.clear()`|Remove all items from set|`{1, 2, 3}.clear()` → `set()`|
|`set.union(other_set)`|Union of two sets|`{1, 2}.union({3, 4})` → `{1, 2, 3, 4}`|
|`set.intersection(other_set)`|Intersection of two sets|`{1, 2}.intersection({2, 3})` → `{2}`|
|`set.difference(other_set)`|Difference of two sets|`{1, 2}.difference({2, 3})` → `{1}`|
|`set.symmetric_difference(other_set)`|Symmetric difference of two sets|`{1, 2}.symmetric_difference({2, 3})` → `{1, 3}`|
|`set.issubset(other_set)`|Check if set is subset|`{1}.issubset({1, 2})` → `True`|
|`set.issuperset(other_set)`|Check if set is superset|`{1, 2}.issuperset({1})` → `True`|
|`set.copy()`|Return shallow copy of set|`{1, 2}.copy()` → `{1, 2}`|
|`set.update(other_set)`|Update set with another set|`{1, 2}.update({3, 4})` → `{1, 2, 3, 4}`|
|`set.intersection_update(other_set)`|Update set with intersection|`{1, 2}.intersection_update({2, 3})` → `{2}`|
|`set.difference_update(other_set)`|Update set with difference|`{1, 2}.difference_update({2, 3})` → `{1}`|
|`set.symmetric_difference_update(other_set)`|Update set with symmetric difference|`{1, 2}.symmetric_difference_update({2, 3})` → `{1, 3}`|
|`len(set)`|Get number of items in set|`len({1, 2, 3})` → `3`|
|`item in set`|Check if item exists in set|`1 in {1, 2, 3}` → `True`|
|`set1 \| set2`|Union of two sets|`{1, 2} \| {3, 4}` → `{1, 2, 3, 4}`|
|`set1 & set2`|Intersection of two sets|`{1, 2} & {2, 3}` → `{2}`|
|`set1 - set2`|Difference of two sets|`{1, 2} - {2, 3}` → `{1}`|
|`set1 ^ set2`|Symmetric difference of two sets|`{1, 2} ^ {2, 3}` → `{1, 3}`|

## Tuple

|Syntax|Purpose|Example|
|------|-------|-------|
|`tuple([1, 2, 3])`|Create tuple from list|`tuple([1, 2, 3])` → `(1, 2, 3)`|
|`tuple.count(item)`|Count occurrences of item|`(1, 2, 3).count(2)` → `1`|
|`tuple.index(item)`|Return index of first occurrence|`(1, 2, 3).index(2)` → `1`|
|`len(tuple)`|Get length of tuple|`len((1, 2, 3))` → `3`|
|`item in tuple`|Check if item exists in tuple|`1 in (1, 2, 3)` → `True`|
|`tuple1 + tuple2`|Concatenate two tuples|`(1, 2) + (3, 4)` → `(1, 2, 3, 4)`|
|`tuple1 * n`|Repeat tuple n times|`(1, 2) * 2` → `(1, 2, 1, 2)`|
|`tuple[0]`|Access first element of tuple|`(1, 2, 3)[0]` → `1`|
|`tuple[-1]`|Access last element of tuple|`(1, 2, 3)[-1]` → `3`|
|`tuple[1:3]`|Slice tuple from index 1 to 2|`(1, 2, 3)[1:3]` → `(2, 3)`|
|`tuple[:2]`|Slice tuple from start to index 1|`(1, 2, 3)[:2]` → `(1, 2)`|
|`tuple[1:]`|Slice tuple from index 1 to end|`(1, 2, 3)[1:]` → `(2, 3)`|
|`tuple[::2]`|Slice tuple with step 2|`(1, 2, 3, 4)[::2]` → `(1, 3)`|
|`tuple[::-1]`|Reverse tuple|`(1, 2, 3)[::-1]` → `(3, 2, 1)`|
|`tuple.index(item, start, end)`|Return index of item in range|`(1, 2, 3).index(2, 0, 3)` → `1`|

### Utility Functions

| Function   | Use               |
| ---------- | ----------------- |
| `print()`  | Display output    |
| `max()`    | Largest value     |
| `min()`    | Smallest value    |
| `sum()`    | Sum of values     |
| `round()`  | Round to decimals |
| `len()`    | Count elements    |
| `sorted()` | Sort values       |
| `help()`   | Documentation     |
| `type()`   | Get type          |
| `dir()`    | List attributes   |
| `id()`     | Get object ID     |
