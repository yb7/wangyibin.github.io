## 一般性关键字
### 元数据
JSON Schema包含少量的用于Schema元数据描述的关键字如 `title`、`description`和`default`，它们并非用于数据校验。

`title`、`description`的值必须是字符串。都非必填项。

`default`关键字用于提供默认值，大多数JSON Schema校验工具可能会忽略该属性。

```json
{
  "title" : "Match anything",
  "description" : "This is a schema that matches anything.",
  "default" : "Default value"
}
```

### 枚举值
关键字`enum`用于属性的取值必须限制在一个固定的范围内。
`enum`的值必须是一个数组，并至少包含一个值，每个值都必须是唯一的。

```json
{
  "type": "string",
  "enum": ["red", "amber", "green"]
}
```
* `"red"` 通过验证
* `"blue"` 验证失败

你甚至可以在不定义`type`值，这样`enum`中放入不同类型的数据，如下
```json
{
  "type": "string",
  "enum": ["red", "amber", "green", null, 42]
}
```
* `"red"` 通过验证
* `null` 通过验证
* `42` 通过验证
* `0` 验证失败

但在大多数情况下`enum`应该定义在一个封闭的规范中
```json
{
  "type": "string",
  "enum": ["red", "amber", "green", null]
}
```
* `"red"` 通过验证
* `null`，虽然`null`在`enum`的定义中，但是它不符合`type`的定义，所以验证失败
