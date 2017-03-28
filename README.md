# LevelDB-Swift

使用swift对google开源的leveldb进行轻度封装，更加方便快捷的存储键值对信息。

```
此项目没有使用OC桥接文件，直接使用C包装C++接口，swift与C语言交互更加安全，效率更高
```
## 安装方法
#### 支持CocoaPods方式：
```
pod 'LevelDBForSwift'
```
## 使用方法
```swift
//打开数据库
db = LevelDB(name: "test")

//写入数据
db["key"] = "value"
db["emoji"] = "表情😄🎁"
db["中文"] = "chinese表情😄🎁"

//读取数据
let string1 = db["key"]
let emoji = db["emoji"]
let chinese = db["中文"]
            
//关闭数据库
db.close()
```

### License
The MIT License (MIT)

Copyright (c) 2015 Hemanta Sapkota

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
