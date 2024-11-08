#import "@preview/rubber-article:0.1.0": *
#import "@preview/mitex:0.2.4": *
#import "@preview/cmarker:0.1.1"
// #import "@preview/quick-maths:0.1.0": shorthands

// 设置公式标号 
#import "@preview/i-figured:0.2.4"
#show math.equation: i-figured.show-equation.with(only-labeled: true)
// 设置代码块
#import "@preview/codly:1.0.0": *
#codly(
   languages: (
   python: (
    name: "Python",
    // icon: [#tabler-icon("brand-github-filled")]
   )
   )
)
#import "@preview/showybox:2.0.3": showybox

#show: codly-init.with()

#show: article.with()
#import "@preview/physica:0.9.3":*

#set text(font:("Times New Roman","Source Han Serif SC"), size: 12pt) 
// #import "@preview/cuti:0.2.1": show-cn-fakebold
// #show: show-cn-fakebold
#let 行间距转换(正文字体,行间距) = ((行间距)/(正文字体)-0.75)*1em
// // #show par: set block(spacing: 行间距转换(12,20))
#set par(leading: 行间距转换(12,20),justify: true,first-line-indent: 2em)
#show heading: it =>  {
    // set text(font: ("Times New Roman","Source Han Serif SC"), size: 12pt)
    it
    par()[
      #if it.level==1{
        v(-0.3em)
      }
      #if it.level==2{
        v(0.2em)
      }
      #if it.level==3{
        v(0.2em)
      }
      #text()[#h(0.0em)]
      #v(-1em)
      ]
      }
       

#align(center,[
  #text(size:1.5em)[*半径识别*]
])
// #set math.equation(numbering: "(1)")
// #set math.equation(numbering: "(1.1)")
// #show math.equation.where(block: true): it => {
//  if not it.has("label") {
//    let fields = it.fields()
//    fields.remove("body")
//    fields.numbering = none
//    return [#counter(math.equation).update(v => v - 1)#math.equation(..fields, it.body)<math-equation-without-label>]
//  }
//  return it
// }
// 

= 点云图预览
```matlab
cd("WorkDir");
ptCloud = pcread('./1.ply');

% Visualize the point cloud
pcshow(ptCloud);
title('Point Cloud Visualization');
xlabel('X');
ylabel('Y');
zlabel('Z');
```

= 点云处理
首先对整体点云进行去噪，然后分割出我们需要识别的元件上的点。

使用PointNet++进行点云分割，分割出我们要识别的弧线的点。对所有点，使用以弧长和曲率为特征的曲面进行梯度下降，使用不同的损失函数比较效果。

= 拟合圆柱面
@shakarji1998least 中对常见的数值拟合都有涉及，开始综述。


定义参数：
/ $x$: —圆筒轴上的一个点；
/ $A$: —圆筒轴的方向数；
/ $r$: —圆筒的半径。
$ "距离函数" f(x)=d(x_i)=f_i-r $
$ "损失函数" J(X,A,r)=sum d(x_i)^2 $


= 最小二乘的几种解法
$ "min"F(x)=||f(x)||_2^2=||b-A hat(x)|| $
#v(1em)
== 牛顿法
$ f(x) &=f(x_0)(x-x_0)^0+f'(x_0)(x-x_0)+((f''(x_0))/2!)(x-x_0)^2+...\ 
       &approx f(x_0)(x-x_0)^0+f'(x_0)(x-x_0)+(f''(x_0)(x-x_0)^2)/2
 $<1>

$ dv(,x)f(x)=f'(x_0)+f''(x_0)(x-x_0) =g(x) $

$g(x)=0,x=x_1$的时候是极值，
$ x_1-x_0=(f'(x))/(f''(x)) => x_1= x_0 -  (f'(x))/(f''(x)) $

矩阵的梯度为一阶导的转置，函数的梯度为一阶导,雅可比矩阵$J$ 二阶导数矩阵$H$。
$ Delta x =-J/H $<2>
这便是我们熟知的牛顿法。

== 梯度下降法

$ theta_(i+1)(j)=theta_i (j)-alpha pdv(,x_j)f(x) $ <梯度下降>

== 牛顿法
对$f(x+Delta x)$一阶泰勒展开 在$x$ 处
$ f(x+Delta x)&= f(x)+f'(x)(x+Delta x-x)+o(Delta x) \
&=f(x)+f'(x)Delta x+o(Delta x) \ 
&=f(x)+J^T Delta x+o(Delta x) \
$

#set page(columns: 1)
#bibliography("use.bib", title: [
参考文献#v(1em)
],style: "nature")
 