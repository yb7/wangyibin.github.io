## 关键字`type`
关键字`type`是JSON Schema的根基。它定义了Schema的基本数据类型。

JSON Schema接受如下几种[原生类型](http://json-schema.org/latest/json-schema-core.html#anchor8)
* `array`: 代表JSON数组
* `boolean`: 布尔值
* `integer`: 不含小数点的JSON数字类型
* `number`: 任何数字类型，包括integer
* `null`: JSON null值
* `object`: 一个JSON对象
* `string`: 一个JSON的字符串

`type`关键字的值可以是一个字符串或者一个数组:
* 如果是一个字符串，那么它的值就必须是原生类型中的一个。
* 如果是一个数组，那么值必须是原生类型的组合。

如果下的Schema
```json
{"type": "string"}
```

当JSON值为
* `"I'm a string"`时验证通过，
* 为`42`时验证不通过。

如下的Schema
```json
{"type": ["number", "string"]}
```

当JSON值为
* `42`时验证通过，
* 为`"hello world"`时验证通过。
* 为`true`时验证不通过。
* 为`["hello", "world"]`时验证不通过。
