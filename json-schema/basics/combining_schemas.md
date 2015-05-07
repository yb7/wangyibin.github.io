## 模式组合
JSON Schema包含一些可以用来组合schema的关键字。
这些关键字不是用来将分布在多个文件或者JSON树中的schema进行组合，
而是用于定义复杂的schema结构。模式组合被用于允许数据值同时通过多种条件进行验证。

比如说，如下的例子
```json
{
  "anyOf": [
    { "type": "string", "maxLength": 5 },
    { "type": "number", "minimum": 0 }
  ]
}
```
`anyOf`关键字代表数据值可以被任何一个子schema(模式)验证。
* 第一个子模式定义了数据值可以是一个长度不超过5个字符的字符串。
* 第二个子模式顶一个数据值可以是一个大于0的数字。
任何一个数据值满足以上两个条件即被认为合法。

* `"short"` 合规
* `"too long"` 不合规
* `12` 合规
* `-5` 不合规

可被用于进行模式组合的关键字有如下几种
* `allOf`: 必须满足所有的子模式
* `anyOf`: 满足任何一个子模式即为合规
* `oneOf`: 仅可以满足一个子模式
以上关键字的值必须是一个数组，数组中的数据必须是一个子模式

另外，关键字`not` 用于验证数据值不符合一个给定的子模式。

### allOf
```json
{
  "allOf": [
    { "type": "string" },
    { "maxLength": 5 }
  ]
}
```

* `"short"` 合规
* `"too long"` 不合规

如下的模式组合是存在逻辑错误的，任何数据值都无法合规
```json
{
  "allOf": [
    { "type": "string" },
    { "type": "number" }
  ]
}
```
* `"No way"` 不合规
* `-1` 不合规

### oneOf
```json
{
  "oneOf": [
    { "type": "number", "multipleOf": 5 },
    { "type": "number", "multipleOf": 3 }
  ]
}
```

* `10` 5的倍数，合规
* `9` 3的倍数，合规
* `2` 既不是5也不是3的倍数，不合规
* `15` 既是5也是3的倍数，不合规

我们可以通过提取公共约束来简化，如我们可以把`"type": "number"`这个约束提取出来：
```json
{
  "type": "number",
  "oneOf": [
    { "multipleOf": 5 },
    { "multipleOf": 3 }
  ]
}
```

### not
严格来说 `not` 不属于模式组合。
```json
{ "not": { "type": "string" } }
```
* `42` 合规
* `{ "key": "value" }` 合规
* `"I am a string"` 不合规
