# LubanL10nLanguageKeyCollector

## 功能说明

本工具用于将Luban配置表中的多语言Key自动收集并导出为一个C#静态类，方便在代码中直接引用多语言Key，避免硬编码字符串，提高代码可维护性。

## 使用方法

### 1. 安装模板文件

将本项目下的文件复制到Luban源码对应目录下：
#### **注意：** 代码模板文件 `l10n-keys.sbn` 的属性请在IDE中设置为 **"始终复制"**。参考Luban文档：[https://www.datable.cn/docs/manual/template](https://www.datable.cn/docs/manual/template)
```
1.1 Luban.CSharp\Templates\cs-l10n-key 文件夹复制到 => Luban/src/Luban.CSharp/Templates
1.2 Luban.CSharp\CodeTarget\CsharpL10NKeyCodeTarget.cs 文件复制到 => Luban/src/Luban.CSharp/CodeTarget
1.3 Luban.CSharp\TemplateExtensions\CsharpL10NKeyTemplateExtension.cs 文件复制到 => Luban/src/Luban.CSharp/TemplateExtensions
```

### 2. 编译Luban

使用Luban编译工具build-luban.bat进行编译，生成最新的Luban.dll。

### 3. 配置导出命令

在导出配置的命令行中加入以下参数：

```batch
-c cs-l10n-key ^
-x cs-l10n-key.outputCodeDir=自己工程配置表导出目录的上一级目录/LanguageKey ^
```

完整示例：

```batch
dotnet ./Tools/Luban/Luban.dll ^
    -t client ^
    -d bin ^
    -c cs-bin ^
    -c cs-l10n-key ^
    -x outputDataDir=../Unity/Assets/Bundles/Config ^
    -x cs-bin.outputCodeDir=../Unity/Assets/Scripts/Hotfix/Config/Generate ^
    -x cs-l10n-key.outputCodeDir=../Unity/Assets/Scripts/Hotfix/Config/LanguageKey ^
    --conf ./Luban.conf
```
#### **注意：** 多语言Key静态类输出目录 `cs-l10n-key.outputCodeDir` **不可**在配置表导出的目录之下，否则会覆盖导出的配置表代码，建议和配置表导出目录同级即可。

## 生成的代码示例

工具会生成类似以下的C#静态类：

```csharp
namespace YourNamespace
{
    /// <summary>
    /// 本地化多语言Key列表
    /// </summary>
    public static class LanguageKey
    {
        /// <summary>
        /// 欢迎文本
        /// </summary>
        public const string WELCOME_TEXT = "welcome_text";

        /// <summary>
        /// 提交
        /// </summary>
        public const string BTN_CONFIRM = "btn_confirm";

        // ... 更多Key
    }
}
```

## 依赖要求

- Luban版本：支持 `cs-l10n-key` 代码生成目标
- .NET SDK：用于编译Luban工具

## 相关链接

- [Luban官方文档](https://www.datable.cn/)
- [Luban GitHub](https://github.com/focus-creative-games/luban)
