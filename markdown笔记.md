# 文档标题

作者

摘要

目录

## 标题1

### 标题1.1

## 标题2

### 标题2.1

### 标题2.2

**加粗内容**

__加粗内容,不推荐__

*斜体内容*

_斜体内容，不推荐_

# 有序列表

1. 我有一个梦想

2. 我有两个梦想

3. 我有三个梦想

   

# 无序列表

## 使用星号

* 使用【*】标识无序列表

## 使用加号
+ 使用【+】标识无序列表

## 使用减号

- 使用【-】标识无序列表



## 嵌套列表

+ 我是第一层列表
  + 我是第二层列表
    + 我是第三层列表
      + 我是第四层列表

## 有序列表和无序列表相互嵌套

1. 我是第一层列表
   + 我是第二层列表
     1. 我是第三层列表
     2. 我也是第三层列表

建议使用-标识



## 分割线

### 星号

***

### 减号

---

### 下划线

___



## 图片

![图片替代文字](链接地址)

### 文字链接

[链接文字]（链接地址）

### 网址链接

<URL或邮箱地址>

### 行内代码

使用`cd ..`命令切换到上一级目录

使用`mkdir 文件夹`命令创建文件夹

### 代码块

以Tab键或者4个空格开头

以Tab键开头

​	def  test_print();

或者以4个空格开头

​    def  test_print();

### 围栏代码块

代码超过1行，使用围栏代码块，便于阅读，支持语法高亮

用```开头，后跟语言类型

```shell
$echo "test"
test
```

```python
def test_printf():
    pass
```



### 引用

用>引用内容

> 在此处引用

### 转义

\特殊字符

### 删除线

~~被删除的文字~~

### 表情符号

：表情符号：

[更多表情符号见：]（www.webpagefx.com/tools/emoji-cheat-sheet/）

### 表格

| 表头1 | 表头2 | 表头3 |
| :----- | :-----: | -----: |
| 内容1 | 内容2 | 内容3|

### 任务列表

- [ ] 未勾选

- [x] 已勾选

### 锚点

[锚点描述](#锚点名)



## 数学表达式

1. 分数 $\frac{分子}{分母}$ or $分子\over 分母$ 
2. 开方 $\sqrt[9]{3}$ or $\sqrt{3}$
3. 省略号 $\ldots$ or $\cdots$ 
4. 矢量 $\vec{a} \cdot \vec{b} = 0$ 
5. 积分 $\int _0^1 x^2{\rm d}x$ 
6. 极限 $\lim_{n\rightarrow+\infty}\frac{1}{n(n+1)}$  $\lim\limits_{n\rightarrow+\infty}\frac{1}{n(n+1)}$
7. 累加 累乘 $\sum_1^n\frac{1}{x^2}$  $\prod_{i=0}^n\frac{1}{x^2}$ $\sum\limits_1^n\frac{1}{x^2}$ $\prod\limits_{i=0}^n\frac{1}{x^2}$
8. 希腊字母 $\alpha$ $\Alpha$ $\beta$ $\Beta$ $\gamma$ $\Gamma$ $\delta$ $\Delta$ $\epsilon$ $\Epsilon$ $\zeta$ $\Zeta$ $\theta$ $\Theta$ $\iota$ $\Iota$ $\kappa$ $\Kappa$ $\lambda$ $\Lambda$$\mu$ $\Mu$ $\nu$ $\Nu$ $\xi$ $\Xi$ $\omicron$ $\Omicron$ $\pi$ $\Pi$ $\rho$ $\Rho$ $\sigma$ $\Sigma$ $\tau$ $\Tau$ $\upsilon$ $\Upsilon$ $\phi$ $\Phi$ $\chi$ $\Chi$ $\psi$ $\Psi$ $\omega$ $\Omega$ 
9. 数学符号 $\pm$ $\mp$ $\times$ $\div$ $\mid$ $\cdot$ $\circ$ $\ast$ $\bigodot$ $\bigotimes$ $\bigoplus$ $\leq$ $\geq$ $\neq$ $\approx$ $\equiv$ $\sum$ $\prod$ $\coprod$ 
10. 集合运算符 $\emptyset$ $\in$ $\notin$ $\subset$ $\supset$ $\subseteq$ $\supseteq$ $\bigcap$ $\bigcup$ $\bigvee$ $\bigwedge$ $\biguplus$ $\bigsqcup$ 
11. 对数运算符 $\log$ $\lg$ $\ln$ 
12. 三角运算符 $\bot$ $\angle$ $30^\circ$ $\sin$ $\cos$ $\tan$ $\cot$ $\sec$ $\csc$ 
13. 微积分运算符  $\prime $  $\int$ $\iint$ $\iiint$ $\oint$ $\lim$ $\infty$ $\nabla$ 
14. 逻辑运算符 $\because$ $\therefore$ $\forall$ $\exists$ $\not=$ $\not>$ $\not\subset$ 
15. 戴帽符号 $\hat{y}$ $\check{y}$ $\breve{y}$ 
16. 箭头符号 $\uparrow$ $\downarrow$ $\Uparrow$ $\Downarrow$ $\rightarrow$ $\leftarrow$ $\Rightarrow$ $\Leftarrow$ $\longrightarrow$ $\longleftarrow$ $\Longrightarrow$ $\Longleftarrow$ 
17. 字体 ${\rm 罗马体}$  ${\bf 黑体}$ ${\mit 数学斜体}$   $\it 意大利体$ $\cal 花体$ $\sf 等线体$ $\tt 打字机字体$ 
18. 连线符号 $\overline{a+b+c+d}$ $\underline{a+b+c+d}$

ex:$r=\frac{\sum_{i=1}^{n}(x_i-\bar{x})(y_i-\bar{y})}{\sqrt{\sum_{i=1}^{n}(x_i-\bar{x})^2\sum_{i=1}^{n}(y_i-\bar{y})^2}}$ $r=\frac{\sum\limits_{i=1}^{n}(x_i-\bar{x})(y_i-\bar{y})}{\sqrt{\sum\limits_{i=1}^{n}(x_i-\bar{x})^2\sum\limits_{i=1}^{n}(y_i-\bar{y})^2}}$ 

 
