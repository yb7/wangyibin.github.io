## 正则匹配

关键字`pattern`用于对数据值进行正则匹配。
正则表达式使用JavaScript [ECMA](http://www.ecma-international.org/publications/standards/Ecma-262.htm)中的定义。
但不完全支持。我们建议使用如下的[关键字列表](http://spacetelescope.github.io/understanding-json-schema/reference/regular_expressions.html)

案例如下
```json
{
   "type": "string",
   "pattern": "^(\\([0-9]{3}\\))?[0-9]{3}-[0-9]{4}$"
}
```

* `"555-1212"` 合规
* `"(888)555-1212"` 合规
* `"(888)555-1212 ext. 532"` 不合规
* `"(800)FLOWERS"` 不合规
