// 基本模板
#import "@preview/rubber-article:0.1.0": *
#show: article.with()
#import "@preview/mitex:0.2.4": * // latex 兼容包
#import "@preview/cmarker:0.1.1" //  md兼容包
#import "@preview/codly:1.0.0": * // 设置代码块
#import "@preview/note-me:0.3.0": * //提示
// #show: codly-init.with()
#import "@preview/showybox:2.0.3": showybox // 彩色盒子
#import "@preview/i-figured:0.2.4"
#show math.equation: i-figured.show-equation.with(only-labeled: true) // 只有引用的公式才会显示编号
#show figure: i-figured.show-figure // 图1.x
#import "@preview/physica:0.9.3":* // 数学公式简写
#import "@preview/lovelace:0.3.0": * // 伪代码算法
#set text(font:("Times New Roman","Source Han Serif SC"), size: 12pt) // 设置中英语文字体 小四宋体 英语新罗马 
// #import "@preview/cuti:0.2.1": show-cn-fakebold  // 中文伪粗体 像我们使用的Source Han Serif SC是粗体字体不用开启
// #show: show-cn-fakebold
#import "@preview/dashy-todo:0.0.1": todo
#let 行间距转换(正文字体,行间距) = ((行间距)/(正文字体)-0.75)*1em
#set par(leading: 行间距转换(12,20),justify: true,first-line-indent: 2em)
#import "@preview/indenta:0.0.3": fix-indent
#show: fix-indent() // 修复第一段的问题
#show heading: it =>  {it;par()[#let level=(-0.3em,0.2em,0.2em);#for i in (1, 2, 3) {if it.level==i{v(level.at(int(i)-1))}};#text()[#h(0.0em)];#v(-1em);]} // 修复标题下首行 以及微调标题间距
#show ref: it => {
  let eq = math.equation;let el = it.element;
  if el != none and el.func() == eq {link(el.location(),"式"+numbering(el.numbering,..counter(eq).at(el.location())))} else {it}
} // 设置引用公式为式
#show figure.where(kind:image): set figure(supplement: [图]) // 设置图
#show figure.where(kind:"tablex"): set figure(supplement: [表]) // 设置表
#import "@preview/mannot:0.1.0": * // 公式突出
// #import "@preview/oasis-align:0.1.0" // 自动布局
// ------------定理 证明----------------
// 默认可间断了，可调
#import "@preview/ctheorems:1.1.3": *
#show: thmrules
#let theorem = thmbox("theorem", "Theorem", stroke: rgb("#ada693a1") + 1pt,breakable: true) //定理环境
#let definition = thmbox("definition", "Definition", inset: (x: 0.5em, top: -0.25em,bottom:-0.25em),stroke: rgb("#ada693a1") + 0pt,breakable: false) // 定义环境
#let proof = thmproof("proof", "Proof",breakable: true) //证明环境
// ----------------------------

// #import "@preview/grayness:0.2.0": * // 基本图片编辑功能
#import "@preview/glossarium:0.5.1": make-glossary, register-glossary, print-glossary, gls, glspl
#show: make-glossary
#let entry-list = (
  // minimal term
  (
    key: "lanbda",
    short: $lambda$,
    long: "特征值",
    description: [
      对于矩阵A,如果满足
      $ A x=lambda x $ 
      $lambda$就是A的特征值，x是特征向量

    ]
  ),
  // a term with a long form and a group
  (
    key: "tr",
    short: $Tr$,
    long: "迹",
    // group: "Matrix",
    description: [
Tr表示矩阵的迹，是用于求矩阵对角元素之和的算子
$ Tr[X]= sum_i X_(i i) $
    ],
  ),
  // a term with a markup description
  (
    key: "linear space",
    short: "linear space",
    long: "线性空间",
    // group: "Acronyms",
  ),
  // a term with a short plural
  // *外参*(Camera Extrinsics)
  (
    key: "ct",
    short: "外参数矩阵",
    // "plural" will be used when "short" should be pluralized
    long: "Camera Extrinsics",
    description: [一个$3*4$的矩阵$T$,$ T=mat(1,0,0,0;0,1,0,0;0,0,1,0)T' $],
  ),
  // a term with a long plural
  (
    key: "ck",
    short: "内参数矩阵",
    // "plural" will be used when "short" should be pluralized
    long: "Camera Intrinsics",
    // description: [一个$3*4$的矩阵$T$,$ T=mat(1,0,0,0;0,1,0,0;0,0,1,0)T' $],
  ),
)
#let image1(img,name)={
  // return 
  figure(
  img,
  caption: [
    #name
  ],
  kind: image
)
}

// 有关可断开和不可断开块的更多信息，请参阅块文档。
#let publish=0

#register-glossary(entry-list)
#set math.mat(delim: "[")
#set page(columns: 2)
#place([#align(center,[
  #text(size:1.3em)[*术语表*]
])],dx: 90%,dy: -5%)
1. 矩阵统一用大写字母表示，如$A,X$标量用小写字母表示，如$x,y$；
  - 对于返回值是矩阵的函数，同理应该为$F(X)$,标量函数就记作$f(x)$
  - 另外，对于不混淆意思的$x*1$维度矩阵，也就是*向量，允许用小写字母表示*，如$x,y,x_i$
2. 对于矩阵的行列数，统一用${m,n}$下标表示，如$display(A_{m,n})$
#print-glossary(entry-list)
// Some Matrix Function
#let Mabij(MatrixName1,MatrixName2)={
  return $sum_k #MatrixName1 _(i k)#MatrixName2 _(k i) $
}
#let matrix_(a,m,n)={
  return [$mat(#a _(11),#a _(12),...,#a _(1 #n);#a _(21),#a _(22),...,#a _(2#n);dots,dots,dots,dots;#a _(#m 1),#a _(#m 2),...,#a _(#m#n))$]
}
#let vecs(a)={
// return [$mat(#a _1;#a _2;...;#a _n)$]
return [$(#a _1,#a _2,...,#a _n)$]

}
// -----------------------------
#set page(columns: 1)

#align(center,[
  #text(size:1.5em)[*数学知识杂烩*]
])
#align(center,[
= 矩阵论
])
== 线性空间与线性变换
=== 线性空间
在矩阵论中，将在线性代数的基础上，推广向量空间$R^n$,一般地定义线性空间的概念。这里参考杨明教授的《矩阵论》@杨明2003矩阵论 和Strang, Gilbert的 《Linear Algebra and Its Applications》@strang2012linear。
#definition([#gls("linear space")])[
  $V$是一个非空集合，$F$是一个数域，在其中定义两种运算，加法($forall alpha,beta in V ,alpha+beta in V$)和数乘($forall k in F,alpha in V,k alpha in V$)，如果满足若干运算法则，就称$V$是数域$F$上的线性空间。
]
比如$F_{n,1}={(x_1,x_2,...,x_n)^T} | x_i in F$ 是F上的${m,1}$维线性空间。

$F_{n,m}={A=(a_(i j))_{m  times n}|a_(i j )in F}$是F上的${m,n}$维矩阵空间 记作$R_{2,2}$ #footnote()[这里与教课书上$R^(2 times 2)$的写法不同，读者注意。]

$P_n (x)={sum_(i=0)^(n-1)a_i x_i|a_i in R}$称为多项式空间$P_n[x]$
#definition[
  如果对于线性空间$V$ 存在一组*线性无关*的向量#vecs($alpha$)，使得空间中任意一个向量可以由它表示，#vecs($alpha$)张成了向量空间,此时有$V$的维度$ dim(V)=n $
]
#definition("矩阵的逆")[
  如果对于向量$A$，如果存在B 使得$A B=I$ ,则称B是A的逆矩阵，记作$A^(-1)$，并且说A是可逆的，有时候也叫做非奇异矩阵#footnote([在数值运算中，我们很少求解矩阵的逆，计算他的计算量是行变换解方程的三倍 @strang2012linear])。并且
  1. $(A B)^(-1)=B^(-1)A^(-1)$
  2. A的各列线性无关，$dim(A)=n$
]
=== 内积空间
==== 欧氏空间和酉空间
#definition[
  对数域$F$上的线性空间$V_n (F)$,定义一个从$V_n (F)$到$F$的二元运算$(alpha,beta)$，记作$(alpha,beta):V_n (F)->F$，满足以下条件
  1. $(alpha,beta)=(beta,alpha)$
  2. $(k alpha,beta)=k(alpha,beta)$
  3. $(alpha,alpha)>=0,& quad (alpha,alpha)=0"仅当" alpha=0$
  我们就称这个二元运算是线性空间的一个内积，并且定义了内积的线性空间称作内积空间$[V_n(F);(alpha,beta)]$。如果$F=R$（实数域）就称作欧氏空间；如果$F=C$（复数域）就称作酉空间。
]
下面举几个欧氏空间的例子
1. $[RR^n;(alpha,beta)=alpha^T beta]$,习惯上，我们直接将$RR^n$记作欧氏空间。
2. $[R_{n,n};(A,B)=Tr[A B^T]]$
3. $[P _(n )lr(\[ x \] )\;lr(\( f lr(\( x \) )\,g lr(\( x \) )\) )= integral _(0 )^(1 )f lr(\( x \) )dot  g lr(\( x \) )upright(d )x ).] $

#definition($norm(alpha)$)[
  在内积空间，称$ norm(alpha)=sqrt((alpha,alpha)) $ 为向量$alpha$的长度。在欧式空间中，也称作*欧几里得范数*。下面给出几条它的性质
1. (*Cauchy 不等式*) $abs((alpha,beta))^2<=norm(alpha)norm(beta)$
2. $norm(alpha+beta)<=norm(alpha)+norm(beta)$
3. 定义$alpha,beta$夹角$display(theta=arccos ((alpha,beta))/(norm(alpha)norm(beta)))$
]
==== 标准正交基
#let ji_(use)={
  return ${#use _1 ,#use _2 , ... , #use _n}$
}
#let sum_(use)={
  return $#use _1 + #use _2 + ... + #use _n$
  } 
#let xl_(use)={
  return $mat(#use _1 , #use _2 , ... , #use _n)$
  } 
#let sum__(use1,use2)={
  return $#use1 _1 #use2 _1 + #use1 _2 #use2 _2 + ... + #use1 _n #use2 _n$
  } 
#definition[
  在$V_n$中一组基${epsilon_1,epsilon_2,...,epsilon_n}$满足$ (epsilon_i,epsilon_i)=0,(epsilon_i,epsilon_j)!=0 & quad 0<=i,j<=n,i!=j $
  就称作其为标准正交基。
]
从一组基${alpha_1,alpha_2,...,alpha_n}$转换到标准正交基#ji_($beta$)有
$ beta_i= alpha_i-sum_(i=1)^(k-1)((a_k,beta_i))/((beta_i.beta_i))beta_i  $

证明方法参考@杨明2003矩阵论 [p.~18],这里略去。用矩阵的方式表示为$ (alpha_1,alpha_2,...,alpha_n)=(beta_1,beta_2,...,beta_n)mat((beta_1,beta_1),(alpha_2,beta_1),...,(alpha_n,beta_1);,(beta_2,beta_2),...,(alpha_n,beta_2);,,...,...;,,,(beta_n,beta_n) ) $ 
==== 线性变换 
#definition([*线性变换*])[
  如果存在一个单射$T:V_n (F)->V_n (F)$,满足
  1. $T(alpha+beta)=T(alpha)+T(beta)$
  2. $T(k alpha)=k T(alpha)$
  就称$T$是一个$V_n (F)$上的线性变换。
]
#definition([*线性变换的矩阵*])[
  $forall alpha in V_n (F)$,取一组基#ji_($alpha$)
  $ alpha&= #sum__($x$,$alpha$) $ 
  $ mat(T(alpha_1),T(alpha_2),...,T(alpha_n))^T=A^T mat(alpha_1,alpha_2,...,alpha_n)^T $
  称$A$为基#ji_($alpha$)下的*矩阵*。 
  //  \ T(alpha)&=x_1 T(alpha_1)+x_2T(alpha_2)+...+x_n T(alpha_n) 
  // 令$a=a_1,a_2,...,a_n$,@eqt:suma
]
#theorem()[
  如果 #ji_($alpha$)到#ji_($beta$)有过渡矩阵$C$
  $ "其中   "#xl_($alpha$)=#xl_($beta$)C $,同时在两组基下的矩阵分为为$A,B$，则有$ B=C^(-1) A C $
]

#definition([*不变子空间*])[
  如果$T$是$V_n (F)$上的线性变换，$W$是$V_n (F)$的一个子空间，如果$T(W) in W$，就称$W$是$T$的不变子空间。
]
#definition([*正交变换*])[
  如果$T$是$V_n (F)$上的线性变换，且满足$forall alpha,beta in V_n (F),(T(alpha),T(beta))=(alpha,beta)$，就称$T$是正交变换。
  当空间是欧式空间就叫做正交变换，其对应矩阵我们叫做正交矩阵$C$,酉空间就叫做酉变换,其矩阵叫做酉矩阵$U$。 
]

== Jordan标准形
=== Jordan标准形及其求解
// 关于特征值，不再赘述，我们直接给出Jordan标准形的定义。

形如$display( J lr(\( lambda \) )= mat(lambda zws ,1 zws ,zws ,zws ;zws ,lambda zws ,1 zws ,zws ;zws ,zws ,dots.down zws ,1 zws ;zws ,zws ,zws ,lambda )) $的矩阵叫做$r$阶Jordan块，若干个Jordan块组成的矩阵叫做Jordan矩阵，如下
$ J = mat(J _(1 )\(lambda _(1 )\)zws ,zws ,zws ,zws ,zws ;zws ,J _(2 )\(lambda _(2 )\)zws ,zws ,zws ,zws ;zws ,zws ,dots.down zws ,zws ,zws ;zws ,zws ,zws ,J _(m )\(lambda _(n )\)) $
// 比如$ J = mat(5 zws ,1 zws ,0 zws ,0 zws ,0 zws ;0 zws ,5 zws ,0 zws ,0 zws ,0 zws ;0 zws ,0 zws ,2 zws ,0 zws ,0 zws ;0 zws ,0 zws ,0 zws ,2 zws ,1 zws ;0 zws ,0 zws ,0 zws ,0 zws ,2 )= mat(J _(1 )\(5 \)zws ;zws ,J _(2 )\(2 \)zws ;zws ,zws ,J _(3 )\(2 \)) $

#h(2em)在复数域上，每个方阵矩阵都可以相似于Jordan矩阵，并且唯一（若不计较Jordan的排列次序），即$A=S^(-1) J S$，其中$S$是可逆矩阵，$J$是Jordan矩阵。
#definition([*特征值和特征向量*])[
  对于定义在$E$ 上的变换 $T$, 如果 $exists lambda$ $ T(mu)=lambda mu $
  这里的$lambda$就是$T$的特征值，$mu$是特征向量。
]
#definition([*直和* $plus.circle$])[
  $ A plus.circle B=mat(A,0;0,B)=diag(A,B) $
]
#definition([*矩阵的核* $"Null"(A)$])[
  $ upright(N u l l )\(A \)= \{v in  V : A v= 0\} . $
]
#theorem([*秩-零化度定理*])[
  $rank A+ "nullity" A("A的特征值空间维度") =n $
  #proof[

  ]
]
首先我们可以求解出其所有特征值及其代数重数。 $ display(abs(lambda I-A)=sum_(i=0)^k (lambda-lambda_i)^mark((a_i),tag:#<dscs>)#annot(<dscs>,pos:top)[代数重数$"gm"$]) $

#h(2em) 然后对于每一个特征向量，求解$(lambda_i I-A)$的秩, 叫做其几何重数$"am"$, 它决定这个Jordan矩阵中有多少个Jordan块。
#theorem()[
  如果$A="Diag"(B,C)$ 那么 $A$ 的代数重数和几何重数也是$B,C$的和。]


== 计算机视觉中的应用
我们会用到的向量$in RR^2 RR^3  #h(0.2em)#footnote[$RR^n$表示n维向量空间]$。
=== $RR^3$中的变换（相机相关）
#definition("齐次坐标")[
 对于$n$维度向量$x=#vecs($x$)$，其在$n+1$维向量空间中的齐次向量（坐标）为$(x_1,x_2,...,x_n,1)^T $,称为$n$维齐次坐标，记作$tilde(x)$。他对于$RR^2 RR^3$中的变换非常有用，它统一了旋转、平移和缩放。（但是注意齐次坐标并不能相加或者相乘，只能乘以$T_{n+1,n+1}$来做变换）。
]
#h(2em) 比如对于一个向量$p$,一个混合变换$p'=A p+t$,使用分块矩阵的知识，也可以看作是$ p'=mat(A_{n,n},t_{1,1};B_{1,n},s_{1,1})mat(p;1)=T "Hm"(p) #h(1em) "&"(t=0,B=0_{1,n}) $
这里的$T$,我们称作透视矩阵(Transform Matrix)。$T$的第一行代表的是以$(x,y,z)^T$为基的坐标系下的变化，$T_21$一般直接以$0$,$T_22$也可以表示缩放性质。

#align(center,[
  #table(
  columns: 3,
  table.header(
    [变换],
    [条件],
    [自由度],
  ),
  [欧几里得变换],
  [$A=R #h(0.5em)"&"#h(0.5em) s=1 #h(0.5em)"&"#h(0.5em) B=0_{1,3}$], [6],
  [缩放变换],
  [$A=c R #h(0.5em)"&"#h(0.5em) s=1 #h(0.5em)"&"#h(0.5em) B=0_{1,3}$], [7],
    [纯缩放变换],
  [$A=c E #h(0.5em)"&"#h(0.5em) s=1 #h(0.5em)"&"#h(0.5em) B=0_{1,3},t=0_{3,1}$],[1],
  [仿射变换],
  [$s=1 #h(0.5em)"&"#h(0.5em) B=0_{1,3}$],[15], 
  [射影变换],
  [$"None"$],[12]
)
])

==== *欧几里得变换*、缩放变换

欧几里得变换包括绕原点旋转，平移，轴对称，中心对称（正交变换），在欧几里得变换中的$T_A$是正交矩阵，只有三个自由度（之后三维空间刚体变换会讲到）。
#definition("正交矩阵",numbering:none)[
 @wiki:正交矩阵 正交矩阵(Orthogonal Matrix)是指矩阵的转置等于逆矩阵的矩阵，也就是说$A^(-1)=A^T$，并且可以推证$|A|=1$。
 其中，$det(A)=1$的时候叫做*旋转矩阵*，$det(A)=-1$的时候叫做*瑕旋转矩阵*（瑕旋转是旋转加上镜射。镜射也是一种瑕旋转）。所有$A_{n,n}$构成一个*正交群*。
]
#h(2em)至于缩放变换呢,略去介绍。
// 其实它对应笛卡尔坐标系中几种变化，如欧几里得变换、仿射变换、透视变换等，他们得到
==== 小孔成像模型

我们直接俄导一下基于小孔成像的相机模型，也就是三维物体在二维计算机屏幕上的表示。
#import "img/ctez1.typ" : PinCanModel
#figure(
PinCanModel()
  , caption: [相机模型示意图]
)<cammodel>

#h(2em)如@cammodel 中所示，
对于任意一点，相当于关于原点的一个对称。对于大部分教程，都教大家用相似三角形求解,你可以在上图中寻找对应的三角形。诚然，这就是一个*纯缩放变换*，只需要求出缩放系数$c$可。
$ c=-f/z_i $

在现代相机中，我们对像做了预处理，使得原本成倒像的小孔成像可以正确成像，成像平面于$A'^((x y ))$平面（*实际像平面*），所以实际上$c_a=-c=display(f/z_i)$。
// 观察得知，一个坐标经过纯缩放变换后对应相机平面点不会改变。并且其实

同时我们定义像素坐标系如图中所示，以$O_c=(x_0,y_0,z_0=f)^T$为原点，$x,y$轴如图所示的坐标系（实际上它应该定义在实际像平面上）。假设$alpha=c_a k_x,beta=c_a k_y，gamma=c_a k_z$,($k_x,k_y$为两个尺度因子，表示从米变换为像素)从$P_i$到$P'_i$有变换

$ tilde(P'_i)_mark(a,tag:#<a>)=mat(alpha,0,0,x_0;0,beta,
0,y_0;0,0,gamma,0;0,0,0,1)tilde(P_i) 
#annot(<a>)[实际像平面]
$

定义$u=tilde(P'_i)_a (0),v=tilde(P'_i)_a (1)$
$ mat(u;v;1)

=mat(alpha/z_i,0,x_0;0,beta/z_i,y_0;0,0,1)mat(x_i;y_i;1)=mat(alpha/z_i,0,x_0/z_i;0,beta/z_i,y_0/z_i;0,0,1/z_i)mat(x_i;y_i;z_i)=1/z_i mark(mat(alpha,mark(0,tag:#<s>),x_0;0,beta,y_0;0,0,1), color: #rgb("#4160eb"),tag:#<neican>)mat(x_i;y_i;z_i) #annot(<neican>)[ #gls("ck")]=1/z_i K p_i 
#annot(<s>,pos:top, yshift: 0.7em)[$c$ 缩放因子#footnote()[*【缩放因子$c$】*代表图像轴$u,v$的的非垂直性,表示$u,v$的夹角偏离 90° 的情况。理想情况下，图像平面上的 x 轴和 y 轴是垂直的$c=0$，但在某些特殊情况下，可能由于镜头设计或制造偏差，它们并非严格垂直。一般来说它等于0，Opencv中也是将其设置为0进行的标定。]]
$

同时我们的相机平面并不一定这么理想，它可能是各种姿态，我们需要先将初始的$p_i^("s")$ 转换到可以求解

$ p_i=mat(1,0,0,0;0,1,0,0;0,0,1,0)tilde(p_i)=mat(1,0,0,0;0,1,0,0;0,0,1,0)T' tilde(p_i^("s"))=T_{3,4}tilde(p_i^("s")) $

我们将这里的$T_{3,4}$称作相机的#gls("ct")。综上所述有
$ mat(u;v;1)=1/z_i K T tilde(p_i^("s"))= K T mark(mat(x_i/z_i;y_i/z_i;1),tag:#<qczb>) #annot(<qczb>)[位于归一化平面] $

==== 畸变模型
我们先来简单介绍一下几何光学中的成像模型以及像差理论。@李湘宁2022工程光学

实际的光学系统总是与理想的光学系统存在很大差异（如不同的孔径和视场），一个物点发出的光线经过实际光线汇聚后，其实不再汇聚于一点，而是一个*弥散斑*。对于单色光而言，从几何光学的角度分析，常见的像差有球差，惠差，场曲，畸变，像散。

其中，只有畸变影响几何形状，其他像差影响成像的清晰度（这个我们无能为力，选择好的镜头，合适的焦距，孔径，使用距离）。

畸变分为径向畸变（由透镜形状引起的畸变）和切向畸变（透镜和CCD不共面导致的畸变）

#image1(image("img/1.png", height: 4cm),"径向畸变的几种类型(b)枕形畸变 (c)桶形畸变")
#image1(image("img/2.png", height: 5cm),"切向畸变产生原因")


我们将$(u,v)^T$表示成极坐标形式，即$(r,theta)^T$。

对于径向畸变而言，主要是随着$r$的增大，畸变程度增大，其矫正公式如下(使用$k_1$就足够)
$ x _(c o r r e c t e d )= x \(1 + k _(1 )r ^(2 )+ k _(2 )r ^(4 )+ k _(3 )r ^(6 )\)\ y _(c o r r e c t e d )= y \(1 + k _(1 )r ^(2 )+ k _(2 )r ^(4 )+ k _(3 )r ^(6 )\) $

#h(2em)对于切向畸变,引入$p_1,p_2$
$ x _(c o r r e c t e d )= x + 2 p _(1 )x y + p _(2 )\(r ^(2 )+ 2 x ^(2 )\)\ y _(c o r r e c t e d )= y + p _(1 )\(r ^(2 )+ 2 y ^(2 )\)+ 2 p _(2 )x y  $

然后通过相机标定标定相机内参和畸变系数即可。
// ==== 相机到相机
// 假设有两个相机$"CAM"_1,"CAM"_2$ ,
==== 双目相机
单个相机是无法确定$z$的，通常我们采用双目相机或者RGBD相机来解决这个问题。双目相机的原理是显然的，对于单个相机，我们能确定图像上一点在相机坐标系下一条直线上，只要两个直线有交点，物点可知。
#image1(image("img/3.png", height: 6cm),"双目相机原理")
双目相机一般由左眼和右眼两个水平放置的相机组成，如上图所示。
根据相似三角形原理，
$ (z-f)/z=(b-U_L+U_R)/b=> z = frac(f b ,d )\,quad  d = u _(L )- u _(R ).  $
这里 d 为左右图的横坐标之差,称为视差(Disparity)，求解它需要知道左边相机像素在右边相机上对应哪一个位置。
=== 李群和李代数
#definition("群")[
  一个集合$G$和一个二元运算$*$，如果满足以下条件，就称$G$是一个群。
  1. 封闭性：对于任意$a,b in G$，有$a*b in G$
  2. 结合律：对于任意$a,b,c in G$，有$(a*b)*c=a*(b*c)$
  3. 单位元：存在一个元素$e in G$，使得对于任意$a in G$，有$e*a=a*e=a$
  4. 逆元：对于任意$a in G$，存在一个元素$b in G$，使得$a*b=b*a=e$
]
=== 三维空间刚体变换
==== 旋转矩阵
上一章节有详细的讲解，掠过。
==== 旋转向量
旋转矩阵有九个量，但实际上作为正交矩阵，它只有三个自由度，并且还被约束为正交矩阵，有时会使求解变得困难。我们可以用旋转向量来表示旋转矩阵。
==== 欧拉角
==== 四元数
#align(center,[
= 矩阵导数
])
== 基本介绍

从一个最基本的函数$f(x)=a x$ 开始，显然
$ pdv(,x)f(x)=a $

拓展 $display(f(x)=sum_i a_i x_i)=a^T x quad "&" quad A=[a_1,a_2,...,a_n]^T quad X=[x_1,x_2,...,x_n] $
$ pdv(,mark(x, tag: #<x>),color: #red )mark(f(x),tag:#<fx>,color: #blue)=mat(pdv(,x_1)f(x);pdv(,x_2)f(x);...;pdv(,x_n)f(x))=mat(a_1;a_2;...;a_n)=a 
#annot(<x>)[$n$维向量]
#annot(<fx>, pos: top)[标量$display(sum_i^n a_i x_i)$]
$ <1.1>
#h(2em)注意到这里$display(pdv(,x)f(x))$的维度等于$display(x)$的维度。那如果我们继续拓展呢？$x$是任意维度矩阵的时候，结果又会怎么样呢？
// #import "@preview/great-theorems:0.1.1": *
// #import "@preview/rich-counters:0.2.1": *
// #let mathcounter = rich-counter(
//   identifier: "mathblocks",
//   inherited_levels: 1
// )

// #let theorem = mathblock(
//   blocktitle: "Theorem",
//   counter: mathcounter,
// )

// #let lemma = mathblock(
//   blocktitle: "Lemma",
//   counter: mathcounter,
// )

// #let remark = mathblock(
//   blocktitle: "Remark",
//   prefix: [_Remark._],
//   inset: 5pt,
//   fill: lime,
//   radius: 5pt,
// )

// #let proof = proofblock()
// #show: great-theorems-init

#theorem[
  $pdv(,X)f(x)$应和$display(X)$的行列数相同（$f(x)$是标量的时候），并且
$ [pdv(,X)f(x)]_(i j)=pdv(,X_(i j))f(x)  $
] <the1>
#h(2em)
$ pdv(f,X^T)=pdv(f,X)^T $ <pdvt>
#h(2em)
并且我们继续分析@eqt:1.1 它表明，至少对于我们给出的例子 有$display(pdv(a^T x,x)=a)$，那对于所有呢？显然它也成立

#theorem[
  // $pdv(,X)f(x)$应和$display(X)$的行列数相同，并且
  如果存在一个多元标量函数$f(x)=#gls("tr")\[A_T X\]$，那么
$ [pdv(f,X)]=A  $
] <the2>

#theorem("Tr性质")[
  我们给出一些关于迹的性质，其中矩阵 #mi("\(A\)") 和 #mi("\(B\)") 的大小适当，且 #mi("\(c\)") 是一个标量值。
  1. $ Tr[A+B]=Tr[A]+Tr[B]$
  2. $Tr[c A]=c Tr[A]$ 
  3. $Tr[A B]=Tr[B A]=sum_(i=1)^n sum_(k=1)^n A_(i k) B_(k i)$
  4. $Tr[A^T]=Tr[A]$
  5. $Tr[A_1A_2...A_n]=Tr[A_n A_(n-1)...A_1]$
  6. $Tr[A^T B]=sum A_(i j)B_(i j )$
  7. $Tr[A]=sum #gls("lanbda")$
  8. $f(x)=Tr[f(x)]=Tr[f(x)^T]#h(1em) \& #h(0.5em) "When" #h(0.5em) f(x)_{1,1} $ <ddd>
  // #v(-1.5em)
#proof([of @the3(3) $Tr[A B]=Tr[B A]$])[    
  $ display(A B_(i j )=sum_(k=1)^n A_(i k)  B_(k j) =>A B_(i i )=sum_(k=1)^n A_(i k)  B_(k i)) $
  $ sum_(i=1)^n sum_(k=1)^n A_(i k)  B_(k i)=sum_(i=1)^n sum_(k=1)^n B_(i k)  A_(k i) $<proof3.1>
  $i k " "k i$的情况都会出现，所以显然@eqt:proof3.1 成立，证毕。
]

] <the3>
// #theorem[111]<the4>
== 标量矩阵导数$f(x)$
=== 矩阵微分

#definition[
  $ "d" X = #matrix_($"d"X$,1,$n$) $ <dx定义>
  矩阵里面的每一个如$d X_(11)$,其实
  ]

#theorem[
  // #footnote[这里比较常用的还有$f(x)=Tr[f(x)]=Tr[f(x)^T]$]
  $ d Tr[A]=Tr[d A] $
  #v(-1.5em)
  #proof[
    $ display(Tr[d A]=sum_i d A_(i i)=sum_i d A_(i i)=d sum_i A_(i i)=d Tr[A]) $
  ]
]
标量形式的微分和导数可以用下式表示
$ d f= pdv(f,x)d x $
对于矩阵，有如下定理
#theorem[
  $ d f(X)=Tr[pdv(f,X)^T d X] #footnote[这里的$f(X),f$小写，应该为标量函数] $ <dftr>
  $ f(x)=Tr[f(x)]=Tr[f(x)^T] $ <ftr>
  #v(-1.5em)
  #proof[
    For @eqt:dftr
    $ d f(X)=& sum_(i j ) pdv(f,X_(i j))d X_(i j) $
    使用@eqt:proof3.1
    $ Tr [pdv(f,X)^T d X]&=sum_i sum_k [(pdv(f,X)^T)_(i k)(d X)_(k i ) ] \ 
    &=sum_i sum_k [(pdv(f,X))_(k i)(d X)_(k i ) ]
    $
    For @eqt:ftr,只需要意识到$f(x)_{1,1}$即可。证毕。
  ]
]

#theorem[
  对于矩阵微分，有如下几个性质及延伸性质
1. $d(A+B)=d(A)+d(B)$
2. $d(c A)=c d(A)$
3. $d(A B)=d(A)B+A d(B)$
4. $d(X^T)=d(X)^T$
5. $pdv(x^T A x,x)=A x+A^T x #h(1em)$
6. #mi("\mathrm{d}(X^{-1})=-X^{-1}\mathrm{d}XX^{-1}") #h(0em) (if $X^(-1)$exists)
#proof([of *3 $d(A B)=d(A)B+A d(B)$*])[
$ "LEFT"=d f(A B)&= d #Mabij($A$,$B$)
   \ 
   & = sum_k d (A_(i k))B_(k i)+ A_(i k) d(B_(k i))
  // d f(A B)_(i j)&= pdv(f,A B_(i j))d (sum_k A_(i k)B_(k i))
  $
   $ "RIGHT="[d(A)B+A d(B)]_(i j )&= #Mabij($d(A)$,$B$)+#Mabij($d(B)$,$A$)="LEFT"
    $
]
#proof([of *4: $d(X^T)=d(X)^T$*])[
使用@eqt:dx定义
]

#proof([of *5: $pdv(x^T A x,x)=A x+A^T x #h(1em)$*])[
$ d(x^T A x)&= d Tr[x^T A x] \
&=Tr[d(x^T)A x+x^T d(A x)]  \ 
& =Tr [d(x)^T A x+x^T mark( d(A), tag: #<da>, color: #blue) x+x^T A d(x)] \
// & =Tr [d(x)^T A x+0+x^T A d(x)] \ 
(Tr[A+B]=Tr[A]+Tr[B])&  = Tr [d(x)^T A x]+Tr[x^T A d(x)] \
(Tr(A^T)=Tr[A])&=Tr [x^T A^T d(x)]+Tr[x^T A d(x)] \
"Then" => pdv(x^T A x,x)&=(x^T A^T+x^T A)^T \ 
 & =A x + A x^T 
#annot(<da>)[0]
$

]

#proof([of 6 $d X^(-1)=-X^(-1) d X X^(-1)$])[
  $ d(I)=0=d(X X^(-1))&=d(X) X^(-1) +X d(X^(-1)) \ 
  d(X^(-1))&=-X^(-1)d(X)X^(-1) $
]
]
=== 标量对矩阵求导的求解过程
从上面的例子中，我们可以得到对于一个$f(x)$求解$display(pdv(f(x),x))$的固定步骤
#pseudocode-list[
1.  $d f(x)=d Tr[f(x)]= Tr[ d f(x)]$ or $d f(x)=d Tr[f(x)^T]= Tr[ d f(x)^T]$   
  - 见@eqt:ftr
2. 使用@the3 中关于trace的各种性质，化简成$sum_i Tr[U_i d(x)]$的形式
3. 如@eqt:dftr，所以$display(pdv(f(x),x)=sum_i (U_i)^T)$
]

// $ d f(x) =Tr[]$
// 对于$display(d (X^T A X))$
== 行列式
#definition([行列式])[
  我们把行列式定义为一个关于矩阵A的标量函数，记作$display(det(A))"或"|A|$
]

#definition([矩阵范数])[
  我们把行列式定义为一个关于矩阵A的标量函数，记作$display(det(A))"或"|A|$
]
#align(center,[
  = 矩阵求导和多元微分
])
// #gls("potato")是我们都喜欢吃的一种菜肴
$
mark(1, tag: #<num>) / mark(x + 1, tag: #<den>, color: #blue)
+ mark(2, tag: #<quo>, color: #red)
#annot(<num>, pos: top)[Numerator]
#annot(<den>)[Denominator]
#annot(<quo>, pos: right, yshift: 1em)[Quotient]
$

A todo on the left #todo[On the left].
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
高斯-牛顿法（Gauss-Newton method）是一种非线性最小二乘问题的优化方法，通常用于拟合非线性模型。它通过将非线性问题线性化来简化求解，常用于机器学习、计算机视觉等领域中的优化问题。

下面是高斯-牛顿法的详细推导过程。

// === 1. 问题定义

假设我们有一个非线性最小二乘问题，其目标是找到 $x$ 使得以下目标函数$F(x)$ 最小化：

#mitex("
F(x) = \frac{1}{2} \| f(x) \|^2 = \frac{1}{2} \sum_{i=1}^m (f_i(x))^2
")

其中，#mitex("f(x) = [f_1(x), f_2(x), \dots, f_m(x)]^T") 是一个由 #mi("$m$") 个实值函数组成的向量函数，代表误差项或残差（residual），而 #mi("x") 是我们希望优化的 #mi("n") 维变量。

目标是最小化 #mi("\| f(x) \|^2") 的平方和，找到一个 #mi("x") 使得 #mi("f(x) \approx 0")。

// === 2. 泰勒展开线性化

假设我们已经有一个当前解 #mi("x_k")，我们希望找到一个小的增量 #mi("\Delta x")，使得更新后的 #mi("x_{k+1} = x_k + \Delta x") 更接近最优解。

在 #mi("x_k") 附近，我们对 #mi("f(x)") 进行一阶泰勒展开：

#mitex("
f(x_k + \Delta x) \approx f(x_k) + J(x_k) \Delta x
")

其中 #mi("J(x_k)") 是 #mi("f(x)") 在 #mi("x_k") 处的雅可比矩阵，其第 #mi("i") 行、第 #mi("j") 列的元素为 #mitex("J_{ij} = \frac{\partial f_i}{\partial x_j}")
因此，我们的目标函数可以近似为：
#mitex("
F(x_k + \Delta x) \approx \frac{1}{2} \| f(x_k) + J(x_k)^T \Delta x \|^2
")

// === 3. 构造近似的二次目标函数

现在，我们将近似的目标函数展开：

// $  min 1/2||f(x+Delta x)||_2^2 $
/init1
$ M(Delta X)=1/2 f(x+Delta X)^2&=1/2 (f(x)+J^T Delta X)^T ( f(x)+J^T Delta X) \ 
&= 1/2 [mark( f(x)^T+Delta X ^T J,tag: #<E>) ][mark(f(x)+J^T Delta X, tag: #<F>)] \
&= 1/2 [ mark(||f(x)||^2, tag: #<A>)+mark(f(x)^T J^T Delta X, tag: #<B>) +mark(Delta X ^T J f(x), tag: #<C>)+mark(Delta X ^T J J^T Delta X, tag: #<D>) ] \
// &= 1/2 [ ||f(x)||^2+2Delta x ^T J f(x) +Delta x ^T J J^T Delta x ] \
#annot(<A>)[A]
#annot(<B>)[B]
#annot(<C>)[C]
#annot(<D>)[D]
#annot(<E>)[E]
#annot(<F>)[F]

$<mdeltax>
 $ d C &= d Tr[F(X)^T J^T Delta X]=Tr[d(F(X)^T J^T Delta X)] \ 
 & = Tr[F(X)^T J^T d Delta X] => pdv(C,Delta X)=F(x)^T J^T
 $

$ pdv(M (Delta X),Delta X)& = 1/2(0+F(X)^T J^T+ F(X)^T J^T+ mark(2(J J^T Delta X ), color: #blue,tag:#<jjdeltax>)) \ & =F(X)^T J^T+J J^T Delta X
#annot(<jjdeltax>, pos: top)[@the3(8)]

$

但是 如果@eqt:mdeltax 中的第二步不做展开，我们直接求解也是可以的
$ d M(Delta X)= 1/2 d Tr []  $

= 卡尔曼滤波

// #gls("potato")是我们都喜欢吃的一种菜肴
// Plural: #glspl("potato")

// #gls("海森矩阵", display: "whatever you want")
#outline(title: "TODOs", target: figure.where(kind: "todo"))
= 一些其他概率论知识
#set page(columns: 1)
#bibliography("use.bib", title: [
参考文献#v(1em)
],style: "nature")
 