#import "libs/template.typ": *
#import "libs/var.typ": *
#import "libs/commute.typ": node, arr, commutative-diagram

#set heading(numbering: "1.a.")
#set enum(numbering: "(1)")


// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Homological Algebra",
  authors: (
    "Notes by Yuhang Wei",
    "Lectures by Kobi Kremnitzer"
  ), 
  date: "October 24, 2023",
)

#outline(indent: true)
#pagebreak()
#include "module.typ"



#pagebreak()
= Tensor products


Let $k$ be a field and let $veck$ denote the category of $k$-vector spaces. Let $V, W, L in veck$, denote by $"Bilin"(V, W; L)$ the set of bilinear transformations. Let $T in "Bilin"(V, W; L)$, then $T: V times W -> L$. Can we write $T$ in terms of linear algebra?

$"Hom"_veck (V, W) = "Hom"_k (V, W)$ is the set of linear transformations from $V$ to $W$, and it is a $k$-vector space (in a natural way). We denote the same set by $#underline("Hom") (V, W)$ to emphasise the vector space structure. 

$
"Bilin"(V, W; L) tilde.eq homk (V, homk (W, L)) tilde.eq homk(V, homk(V, L))
$

[This is currying in computer science.]

Question: Is $"Bilin"(V, W; -): veck -> bd("Set")$ representable? In other words, is there a $k$-vector space $V times.circle_k W$ with a natural isomorphism $ "Bilin"(V, W; -) tilde.eq homk (V times.circle_k W, -) $

What does natural mean? It means it is compatible with changes in $L$: if there is a linear map $T: L -> L'$ then this isomorphism should be compatible with $T$.

Also equivalent to: is there a vector space $V times.circle_k W$ with a bilinear map $V times W -> V times.circle_k W$ which is universal? We want to find bilinear map $V times W -> V times.circle_k W$ such that for any blinear map $V times W -> L$, there exists a unique linear map $V times.circle_k W -> L$ such that the diagram commutes:

// #image("imgs/1.png", width: 50%)

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQA1AAjwFt4uAdRABfUuky58hFOQrU6TVuwAyo8SAzY8BInOIKGLNok480AayGiFMKAHN4RUADMAThF5IyIHBCTkYq4eXog+fkgATEEg7p5RNBGIciCMWGAmIFD0cAAWdiA0RsqmMAAeWHA4cFwAhDYiQA
#align(center, commutative-diagram(
  node((1, 0), [$V times W$]),
  node((1, 1), [$L$]),
  node((0, 1), [$V tpk W$]),
  arr((1, 0), (1, 1), []),
  arr((1, 0), (0, 1), []),
  arr((0, 1), (1, 1), [$exists !$], "dashed"),
))


Remark: it is also equivalent to asking for an adjoint functor.

For any $(v, w) in V times W$ we want to find $v times.circle w in V tpk W$. This is a bilinear map, so for example:

$
(v+v') tp w = v tp w + v' tp w
$

#definition[
   For any set $X$, let $k[X]$ denote the vector space spanned by $X$: $ sum_(x in X) a_x x $ where $a_x = 0$ for almost all $x in X$.
]

Now we look at $k[V times W]$ (a free vector space). This is large: even if $V$ and $W$ have finite dimensions this vector space has infinite. We look at the subspace spanned by the relations $ M = "span"{(v + v', w) - (v, w) - (v', w) \ (v, w + w') - (v, w) - (v, w') \ c(v, w) - (c v, w) \ c(v, w) - (c w, v)} $ TODO

for all $v, v' in V$ and $w, w' in W$ and $c in k$. Then we have 
$
homk (k[V times W] \/ M, L) tilde.eq "Bilin"(V, W; L)
$
due to the first isomorphism theorem. We see that if $T in homk (k[V times W] \/ M, L)$ then $T$ is a linear transformation $k[V times W] -> L$ such that $T(M) = 0$. For any $(v, w) in V times W$:

$ V times W -> k[V times W] -> k[V times W] \/ M \
(v, w) |-> (v, w) |-> (v, w) + M $

We can thus define $V tpk W := k[V times W] \/ M$.

Note: $V tpk W$ is defined up to a unique isomorphism. This follows from the universal property (ref. category theory). 

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQA1AAjwFt4uAdRABfUuky58hFOVLFqdJq3bccaANZDR4kBmx4CROQCZFDFm0ScemgOTaRimFADm8IqABmAJwi8kMhAcCCRyMW8-AMQgkKQTCJBff3iaOMQ5EEYsMCsQKHo4AAsXEBoAIxgwKCQAZiCLFWsYAA8sOBw4LgBCHUiUjLTQxBMKqprEepps3PYC4tKaRrzW9s6e0UoRIA
#align(center, commutative-diagram(
  node((1, 0), [$V times W$]),
  node((0, 1), [$V tpk W$]),
  node((2, 1), [$V tpk' W$]),
  arr((1, 0), (0, 1), []),
  arr((1, 0), (2, 1), []),
  arr((2, 1), (0, 1), [$exists !$], curve: 30deg, "dashed"),
  arr((0, 1), (2, 1), [$exists !$], curve: 30deg, "dashed"),
))

// #image("imgs/2.png")

== Properties of tensor product

$"Bilin"(V, W; -) tilde.eq "Bilin"(W, V; -)$ in a canonical way and hence $V tpk W tilde.eq W tpk V$. Also $k tpk W tilde.eq W$.

$ "Trilin"(V_1, V_2, V_3; L) tilde.eq "Bilin"(V_1 tpk V_2, V_3; L)  tilde.eq  "Bilin"(V_1,  V_2 tpk V_3; L) $
and hence $ (V_1 tpk V_2) tpk V_3 tilde.eq V_1 tpk (V_2 tpk V_3) $

It is obviously hard to verify these properties using the definition directly (but good exercise?).

More generally, let $sigma in S_n$ (symmetric group),

$ ( ... (V_1 tpk V_2) tpk ... tpk V_n) tilde.eq ( ... (V_sigma(1) tpk V_sigma(2)) tpk ... tpk V_sigma(n)) $

Remark: in category theory, we think of things by their properties not their definition.

Remark: we now have $(veck, - tpk -)$ which also preserves liner maps. If we have $T: V-> V'$ and $S: W-> W'$ then $T tpk S: V tpk W -> V' tpk W$. (This is heavily used in quntum computing.) This is a symmetric monoidal category.

#definition[
  A $k$-algebra is a monoid object in $(veck, tpk)$; namely, $A in veck$ with multiplication $m: A tpk A -> A$ and a unit $i: k -> A$ which are associative and unital. Namely, $m$ is a multiplication that takes two elements in $A$ and is bilinear; $i$ just sends $1 in K$ to $i(1)$ which is the unit element in $A$. Associativity of $m$ is shown in commuting diagram:

  #image("imgs/3.png")
]

== Non-linear version

In the category of $bd("Set")$, 
$ hom(X times Y, Z) = hom(X, hom (Y, Z)) $ 
This is Cartesian category (?)

#endlec(1)

== More discussions

$ dim (V ds W) = dim V + dim W $
$ dim (V tp W) = dim V dot dim W $

An alternative definition of the tensor product: let $V$ be a vector space with basis ${v_i}_(i in I)$ and $W$ with ${w_j}_(j in J)$ and define $V tpk W$ to have basis ${v_i tp w_j}_(i in I, j in J)$. When we change basis this can be problematic.

Remark: Categorification. If we discuss a category $(C, ds, tp)$ then this is similar to categorifying some underlying structure of a ring. Active field of research.

We were discussing $V tpk W$ for $k$ a field. To generalise, for a ring $R$ and left $R$-modules $M, N$, we can define $M tpr N$.

Note: if $R$ is a non-commutative ring, $M$ is a right $R$-module and $N$ is a left $R$-module, then $M tpr N$ is (only) an abelian group. There would be a problem moving the scalars $r in R$ from side to side in the definition (using free modules), i.e. we can only have things like $m r tp n - m tp r n$.

= Crash course in category theory

== Basic definitions

#definition[
  A category $cal(C)$ consists of a set (or a class) of objects $ob cC$ and for every $x, y in ob cC$ a set $hom_cC (x, y)$, with composition maps which are associative and unit morphisms (ref. category theory).
]

#example[
  If $ob cC = {x}$ then $hom(x, x)$ is a monoid.
]

In general, a category is a "generalised" monoid because you can only compose morphisms in certain situations, not always.

#example[
  $veck, Set, $ left/right $R$-modules, bimodules, topolocial spaces, etc.
]

#definition[
  $f: B-> C$ or $f in hom_cA (B, C)$ is monic if for any $e_1, e_2 : A -> B$ such that $f compose e_1 = f compose e_2$ we have $e_1 = e_2$; $f$ is epic if for any $g_1, g_2 : C-> D$ such that $g_1 compose f = g_2 compose f$ we have $g_1 = g_2$.
]

#example[
  In $Set$, monic is 1-1 and epic is onto.
]
#example[
  In the category of commutative rings, $ZZ -> QQ$ is monic and epic. If we have $ ZZ -> QQ -> R $ and if two maps agree on $ZZ->R$ they must also agree on $QQ -> R$.
]
#example[
   In the category of commutative rings, for any ring $R$ and its ideal $I$, $R -> R\/I$ is epic.
]
[Any localisation in ring is epic?]

#definition[
  An initial object $I$ is such that for any $A in ob cC$ there exists a unique map $I -> A$.  A final object $T$ is such that for any $A in ob cC$ there exists a unique map $A -> T$.
]

#example[
  In $Set$ an initial object is an empty set, a final object in a one-element set.
]

#definition[
  A zero object $0$ is both initial and final (here $0$ is an object!).
]

#example[
  In $RMod$ the zero module is a zero object.
]

#proposition[
  If there is a zero object in the category, then for any $B, C in cC$ we have $0 in hom_cC (B, C)$ (now $0$ is a morphism!).

  // https://tikzcd-typst-editor.pages.dev/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRACEQBfU9TXfIRQAmclVqMWbAMLdeIDNjwEiARlKrx9Zq0Qhi3cTCgBzeEVAAzAE4QAtkjIgcEJKp5XbDxE5dJRIAxYYLogUHRwABbGcp72-tR+iOqBwaHhUTFcFFxAA
#align(center, commutative-diagram(
  node((0, 0), [$B$]),
  node((0, 2), [$C$]),
  node((1, 1), [$0$]),
  arr((0, 0), (0, 2), [$0$]),
  arr((0, 0), (1, 1), [$exists!$], "dashed"),
  arr((1, 1), (0, 2), [$exists!$], "dashed"),
))
// #image("imgs/4.png", width: 30%)
]

#definition[
  A kernel of $f: B->C$ is a map $i: A-> B$ such that $f compose i  = 0$ in a universal way:

  #v(20pt)
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAEEQBfU9TXfIRQBGclVqMWbAELdeIDNjwEiAJjHV6zVohABhOXyWCiZYeK1Td7AOTdxMKAHN4RUADMAThAC2SUSA4EEjqEtps7oYgXr5IZIHBiAGWOiBYUTF+iPFBIdQARjBgUEgALACcmpKpxBneWQDM1LnZ1AxYYKlQdHAAFo4gVeG6MAAeWHA4cAAEAIR1sYhNCf5DVml2PB71SMstoSlstVwUXEA
#align(center, commutative-diagram(
  node((0, 0), [$A$]),
  node((0, 1), [$B$]),
  node((0, 2), [$C$]),
  node((1, 0), [$A'$]),
  arr((0, 1), (0, 2), [$f$]),
  arr((0, 0), (0, 1), [$i$]),
  arr((0, 0), (0, 2), [$0$], curve: 35deg),
  arr((1, 0), (0, 0), [$exists !$], "dashed"),
  arr((1, 0), (0, 1), [$i'$]),
  arr((1, 0), (0, 2), [$0$], label-pos: -1em),
))
  // #image("imgs/5.png", width: 30%)
]

#example[
  In $veck$, kernels are kernels.
]
#theorem[
  Kernels are monic. 
]

(This indicates that $A$ is the "biggest" subobject (to be defined!) of $B$ to be mapped to zero by $f$.)

#definition[ A cokernel of $f: B->C$ is a map $j: C-> D$ such that $j compose f  = 0$ in a universal way.]

#theorem[
  Cokernels are epic.
]

#example[
  For vector spaces $T: V -> W$, the cokernel is $W \/ im T$.
]

#definition[
  Opposite category: $cC |-> cC^op$, where $ob cC^op = ob cC$ and $hom_(cC^op)(x, y) = hom_cC (y, x)$.
]

#proposition[$f: B->C$ is monic in $cC$ if and only if $f^op : C -> B$ is epic in $cC^op$.]

== Products and coproducts

#definition[
  Suppose we have a family of objects ${C_i | i in I}$, then the product $product_(i in I) C_i$ satisfies universally:
#image("imgs/6.png", width: 50%)

Products in $cC^op$ are coproducts $product.co_(i in I) C_i$:

#image("imgs/7.png", width: 50%)
]

#example[
  In $Set$,
$ product X_i = {(x_i)_(i in I) | x_i in X_i} $ and $product.co X_i$ is the disjoint union. 
]

#remark[
  We need to use tuples here for the ordering of elements; suppose we want to use sets only then it can be messy and arbitrary! This is an advatange of the language of category theory over that of set theory.
]

#proposition[
  $ Hom(C) (A, product C_i) bij product Hom(C) (A, C_i) $
]

#proof[
 For any $C_i$, there exists $pi_i : product C_i -> C_i$ satisfying the universal property. Define $phi: Hom(C) (A, product C_i) -> product Hom(C) (A, C_i)$ as 

 $ f |-> (pi_i compose f)_i = (pi_1 compose f, ..., pi_n compose f) $
  #align(center, commutative-diagram(
    node((0, 0), [$A$]),
    node((0, 1), [$product C_i$]),
    node((1, 1), [$C_i$]),
    arr((0, 0), (0, 1), [$f$]),
    arr((0, 0), (1, 1), [$g_i$]),
    arr((0, 1), (1, 1), [$pi_i$]),
  ))
Any $(g_i)_i in product Hom(C) (A, C_i)$ can be factorised as $(pi_i compose f')_i$ for some unique $f': A -> product C_i$ due to the universal property of the product. The existence of $f'$ ensures the surjectivity of $phi$ and uniqueness injectivity. Thus $phi$ is a bijection.
  // #image("imgs/8.png", width: 50%)
]

#proposition[
  $ Hom(C) (product.co C_i, A) bij product Hom(C) (C_i, A) $
]

#proof[ This is similar to the above case: we just reverse all the arrows.
  #align(center, commutative-diagram(
    node((0, 0), [$A$]),
    node((0, 1), [$product.co C_i$]),
    node((1, 1), [$C_i$]),
    arr((0, 1), (0, 0), [$f$]),
    arr((1, 1), (0, 0), [$g_i$]),
    arr((1, 1), (0, 1), [$i_i$]),
  ))
  Notice the asymmetry here! It's not coproduct on the right hand side because it's still a tuple of arrows.
]



== Functors

#definition[
  A functor $F: cC -> cD$ is such that it maps objects $F: ob cC -> ob cD$ and morphisms $F: Hom(C) (C_1, C_2) -> Hom(D) (F(C_1), F(C_2))$, while preserving composition and identity morphisms.]

#definition[
  Now we can define $bd("Cat")$, the category of all (small) categories, where $ob bd("Cat")$ are small categories and $hom_Cat (cC, cD)$ are functors between $cC$ and $cD$. 
]
#definition[
  Suppose $F, G: cC -> cD$, then a natural transformation $alpha: F => G$ is defined by a collection of morphisms in $cD$ indexed by $x in ob cC$: $ {alpha_x: F(x) -> G(x)}_(x in ob cC) $ where the diagram commutes:
  // https://tikzcd-typst-editor.pages.dev/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRADEAKADwEoQAvqXSZc+QigCM5KrUYs2AcR78hI7HgJEyk2fWatEHHgHJVwkBg3ii03dX0Kjy7mcGyYUAObwioAGYAThAAtkhkIDgQSJJqIEGhMdRRSADMDvKGIMr+5gHBYYgRKYgATBkGbFy5ghYJheWR0YipAhQCQA
#align(center, commutative-diagram(
  node((0, 0), [$F(x)$]),
  node((0, 1), [$G(x)$]),
  node((1, 0), [$F(x')$]),
  node((1, 1), [$G(x')$]),
  arr((0, 0), (0, 1), [$alpha_x$]),
  arr((0, 1), (1, 1), label-pos: 1.5em, [$G(f)$]),
  arr((0, 0), (1, 0), label-pos: 1.5em, [$F(f)$]),
  arr((1, 0), (1, 1), [$alpha_x'$]),
))
// #image("imgs/9.png", width: 50%)
]

Then we see that $"Fun"(cC, cD)$ is a category (functor category) where the objects are functors and the morphisms are natural transformations. 

Then we see that in $Cat$, the hom-sets are not only sets but also categories, which means that $Cat$ is a 2-category. 

#endlec(2)

== Adjoint functors 
#definition[
  Functors $L : cA arrows.rl cB : R$ are adjoint if for all $A in cA, B in cB$ there exists a bijection $ tau_(A B) : Hom(B)(L(A), B) bij Hom(A) (A, R(B)) $ such that for any $f: A-> A'$ and $g: B-> B'$, the diagram commutes:
 #image("imgs/10.png")
]

#remark[
  Recall in linear algebra we have $angle.l T v, w angle.r  = angle.l v, T^* w angle.r $ and that's where the name adjoint comes from.
]

Equivalently, $tau$ is a natural isomorphism between $Hom(B) (L(-), -)$ and $Hom(A) (-, R(-))$, both of which are functors $cA^op times cB -> Set$.

What's a product category? It's just pairs of objects and pairs of morphisms. 

Why $cA^op$ here? Because $Hom(A)(-, B)$ is a contravariant functor.

#example[
  (Free, Forget) adjunction. Forget: $ veck &-> Set \ (V, +, dot) &|-> V $ Free: $ Set &-> veck \ X &|-> k[X] $

$ hom_(veck)(k[X], W) &iso hom_(Set) (X, "Forget"(W))\
T &|-> T|_X \
"linearly extended" f &arrow.l.bar f
$

Free is the left adjoint of Forget. 

Forget: $Grp -> Set$. Free: $Set -> Grp$. Also happens. 
]




== Equivalence of categories

#definition[
  In a category $cC$, objects $X, Y$ are isomorphic if there exists $f: X-> Y$ and $g: Y -> X$ such that $f compose g = id_Y$ and $g compose f  = id_X$.
]


Consider $Cat$, then two small categories $cC$ and $cD$ are isomorphic if there are functors $F: cC-> cD$ and $G: cD-> cC$ such that $F compose G  = Id$ and $G compose F = Id$. However, this rarely happens.
#definition[
  Equivalence of categories. Two categories $cC$ and $cD$ are equivalent if there are functors $F: cC-> cD$ and $G: cD-> cC$ such that $F G => Id$ (natural isomorphism) and $G F => Id$. In this way $F(G(X)) iso X$ instead of $F(G(X))=X$.
]

#remark[
  Let $X, Y in Top$ and $f: X arrows.lr Y : g$ be continuous maps. If $f compose g tilde id $ and $g compose f tilde id$ then $X, Y$ are homotopy equivalent. Natural transformations are simiar to the notion of homotopy.
] 

== Limits and colimits

#definition[
Let $cal(I)$ be a small category and $F: cal(I) -> cA$ be a functor. Then $F$ is called a diagram. Denote $F(i)  = F_i$ for all $i in I$. The limit of $F$ is an object $L$ of $cA$ with morphisms $pi_i : L -> F_i$ such that for any $alpha : j -> i $  in $cal(I)$,

#image("imgs/11.png", width: 30%)

commutes and it is universal. (Any $L$ that makes the diagram commute is called a cone and being universal means that it's a final object in the category of cones.)

#image("imgs/12.png", width: 30%)

If such $L$ exists then we call it the limit of $F$ or $lim_cal(I) F$.
]

#definition[Dually, we define the colim of $F$. 

#image("imgs/13.png", width: 30%)]

#proposition[
  If any limit or colimit exists then it is unique up to a unique isomorphism. 
]

#example[
  If $cal(I)$ is a discrete category (to be defined), then $lim F = product F_i$ and $colim F = product.co F_i$.
]
#definition[Equalisers and coequalisers. Consider category $cal(I) = circle.filled arrows.rr circle.filled$.]

#proposition[
  Equalisers are always monomorphisms. 
]
Equalisers are the biggest subobject which when composed with $f$ or $g$ you can the same thing. 

// #image("imgs/14.png")

#image("imgs/15.png")

Coequaliser is just another direction. 

Note: $Eq(f, 0) = ker f $ and $Coeq (f, 0) = coker f$.

#proposition[
  Let $L : cA arrows.lr cB : R$ be an adjunction and $ L(colim A_i) iso colim L (A_i) \ R(lim B_i) iso lim R(B_i) $ 
]
#proof[
  

  $ Hom (L(colim A_i), X) = Hom (colim A_i R(X)) =  lim Hom (A_i, R(X)) \ = lim Hom (L (A_i),  X)  =  Hom (colim L (A_i), X) $

Move colimit out of Hom and it becomes limit: this is seen for products and coproducts. 

We then apply Yoneda Lemma to show $L(colim A_i) $ and $colim L(A_i)$ are isomorphic. 
]

Left adjunction preserves colimits and right adjunction preserves limits. In particular, left adjunction preserves cokernels and are right exact and right adjunction preserves kernels and are left exact. 

== Abelian categories 

#definition[
  We call a category $cC$ *Ab-enriched* if every $Hom(C)(x, y) in Ab$ (which means we can now add morphisms in $Hom(C)(x, y)$) and composition is bilinear, namely $(f + g) compose h  = f compose h + g compose h$ and $f compose (g + h) = f compose g + f compose h$.
]

Another way to put the bilinearity is the following: the composition mappings $ c_(x y z): Hom(C)(x, y) times Hom(C)(y, z) -> Hom(C)(x, z), quad (f, g) mapsto g oo f $
are group homomorphisms in each variable @borceux[Definition 1.2.1].

#endlec(3)

#definition[
  If $cC, cD$ are Ab-enriched, we call $F : cC -> cD$ an *additive functor* if $ Hom(C)(x, y) -> Hom(D)(F(x), F(y)) $ is a group homomorphism for any $x, y in cC$.
]

#definition[
  An Ab-enriched category $cC$ is *additive* if it admits finite coproducts.  
]

#proposition[
  If $cC$ is an Ab-enriched category, then so is $cC^op$.
]
#proof[
  The definition is self-dual. Namely, reversing all the arrows in $cC$ does not break the group structure on hom-sets or the bilinear composition. 
]

#proposition[Let $*$ be an object in an Ab-enriched category, then the followings are equivalent:
+ $*$ is a final object;
+ $*$ is an initial object;
+ $*$ is a zero object.]

#proof[
  (3) $=>$ (1) and (3) $=>$ (2) is obvious. We only prove (1) $=>$ (3), and (2) $=>$ (3) follows from duality.

  Suppose $*$ is a terminal object and let $id_* : * -> *$ be the unique morphism in the abelian group of $Hom(C)(*, *)$, and so $id_* = 0$. 
For any object $A$ and $f : * -> A$ (because $Hom(C)(*, A) $ contains at least the zero morphism), we have $ f = f compose id_* = f compose 0 = 0 in Hom(C)(*, A) $
So there is a unique morphism from $*$ to $A$ and therefore $*$ is also initial. 
]

// This also includes the case of the empty product and coprodut, namely any final object is initial and thus zero. 

A final object is an empty product and an initial object an empty coproduct, and therefore the next result is a generalisation of the previous one.

#proposition[
  In an Ab-enriched category $cC$, a binary product is also a coproduct. 
]

#proof[Let $X_1, X_2 in ob cC$. Suppose that $X_1$ and $X_2$ have a product $X_1 times X_2$ in $cal(C)$, with projections $p_k colon X_1 times X_2 arrow.r X_k$. By definition of products, there are unique morphisms $i_k colon X_k arrow.r X_1 times X_2$ such that the following diagrams commute.

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRAA0B9YgAjwFt4PLgCYQAX1LpMufIRQAGclVqMWbLsQlSQGbHgJERy6vWatEHTmMnT9cokoUqz6y5u13ZhlMZEu1CysbFRgoAHN4IlAAMwAnCH4kJRAcCCRiWxB4xOTqNKQRLJykxABmfPTEMlVzNiwoTgAKTQBKT2yE0orUquMQACMYMCgkMpTXIIUOkrHKvJAGLDAgqDo4AAswkFNAthgADyw4HDgAQhmupAAWecR+yfrGlut24qvEW96M6iGRsYme0s03euU+dxSSxWbDWm22uzqlkOx1OPAu4go4iAA
#align(center, commutative-diagram(
  node((1, 1), [$X_1 times X_2$]),
  node((1, 0), [$X_1$]),
  node((1, 2), [$X_2$]),
  node((0, 0), [$X_1$]),
  node((2, 2), [$X_2$]),
  arr((1, 1), (1, 0), [$p_1$]),
  arr((1, 1), (1, 2), [$p_2$]),
  arr((0, 0), (1, 0), [$id_(X_1)$]),
  arr((0, 0), (1, 2), [$0$], curve: 30deg),
  arr((0, 0), (1, 1), [$exists ! i_1$], "dashed"),
  arr((2, 2), (1, 2), [$id_(X_2)$]),
  arr((2, 2), (1, 0), [$0$], curve: 30deg),
  arr((2, 2), (1, 1), [$exists ! i_2$], "dashed"),
))

Explicitly, we have for $j, k in {1, 2}$, $ p_j oo i_k = cases(id_(X_j) quad &"if " j = k, 0 quad &"otherwise") $
// #image("imgs/16.png")

Then we have $ p_1 compose lr((i_1 p_1 plus i_2 p_2)) eq p_1 comma quad p_2 compose lr((i_1 p_1 plus i_2 p_2)) eq p_2 $

By defintion of products, $id_(X_1 times X_2) $ is the unique morphism $h : X_1 times X_2 -> X_1 times X_2$ with $p_k compose h eq p_k$ for each $k$, so $i_1 p_1 plus i_2 p_2 eq id_(X_1 times X_2)$. We claim that
$ X_1 rgt(i_1) X_1 times X_2 lft(i_2) X_2 $ is a universal cocone and thus a coproduct. Suppose 
$ X_1 rgt(f_1) A lft(f_2) X_2 $
is another cocone. Then we have a map
$ phi eq f_1 compose p_1 plus f_2 compose p_2 colon X_1 times X_2 arrow.r A $
such that for $k = 1, 2$, $ phi oo i_k = f_k $ 
This gives a commutative diagram
#align(center,image("imgs/2023-10-29-11-34-35.png",width:30%))

It remains to show that $phi$ is unique. To see this, note that for any
such $phi$ we have $ phi & eq phi compose id_(X_1 times X_2)\
 & eq phi compose lr((i_1 p_1 plus i_2 p_2))\
 & eq phi i_1 compose p_1 plus phi i_2 compose p_2\
 & eq f_1 compose p_1 plus f_2 compose p_2 dot.basic $

 See @notes[Proposition 3.7], @li[Theorem 3.4.9] and @borceux[Proposition 1.2.4].
]


We can show that $x union.sq y iso x times y$ and we use the notation of a biproduct $x ds y$ to denote both. 

This extends to all finite products and coproducts. 

#remark[
  This doesn't extend to infinite products or coproducts. In the case of abelian groups, 
$ union.sq.big _I M_i = plus.circle.big_I M_i = {(m_i) _(i in I) | m_i in M_i, m_i = 0 "for almost all" i} $
$ product _I M_i = {(m_i) _(i in I) | m_i in M_i} $
]

#definition[
  An additive category $cC$ is pre-abelian if any morphism has a kernel and a cokernel. 
]

Note: $Eq(f, q) = ker(f - g)$ and hence it has all equalisers and coequalisers, and thus it has all finite limits or colimits (by category theory, because it also has products and coproducts) @li[Corollary 2.8.4].

#definition[
  If $cC$ is pre-abelian we get: 

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAGsYAnAAgAoAZgEoQAX1LpMufIRQBGclVqMWbABpiJIDNjwEiAJkXV6zVohABNTZN0yiAZmPKzbAMYROXQSPG3p+vKkckqmqhYeXnxRwr5aOgGyyEYhJirmHNx8kVmxYkowUADm8ESgAlwQALZIZCA4EEhyfiAV1U3UDUhGLuGtNq2VNYg9XYgOLW3DCvWNiAAsk0NIAKydcwZL7Qvrq9QMWGAZUHRwABaFIGmuFjAAHlhwOHA8AIT5okA
#align(center, commutative-diagram(
  node((0, 0), [$ker (f)$]),
  node((0, 1), [$X$]),
  node((0, 2), [$Y$]),
  node((0, 3), [$coker(f)$]),
  node((1, 1), [$coker(ker(f))$]),
  node((1, 2), [$ker(coker(f))$]),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), [$f$]),
  arr((0, 2), (0, 3), []),
  arr((0, 1), (1, 1), []),
  arr((1, 2), (0, 2), []),
  arr((1, 1), (1, 2), [$exists !$], "dashed"),
))

where we define $coim (f) = coker(ker(f))$ and $im(f) = ker(coker(f))$.
// #image("imgs/17.png")
[See Definition 1.2.4, Li-2]

We call $f$ strict if the map $coim (f) -> im f$ is an isomorphism. 
]


#definition[
  A pre-ablian category is abelian if all morphisms are strict. 
]

Remark. This is equivalent to: every mono is a kernel and every epi is a cokernel. (The converses are always true in any category.) This is equivalent to every mono is the kernel of its cokernel and every epi is the cokernel of its kernel. (? TODO)

#example[ $Ab$ and R-modules are abelian categories. ]

#example[If $cA$ is an abliean category and $cC$ is any small category and then the category of functors $Fun(cC, cA)$ is abelian. [TODO]]

$Fun(cC^op, cA)$ are presheves from $cC$ to $cA$.

#example[
  Non-example. Banach spaces over $RR$. We have $V attach(arrow.r.hook, t: i) W$ which are open. Then $coker i = W \/ overline(V)$. Then $ker coker i = overline(V) != V$. (The closure of $V$.)
This is an example of quasi-abelian categories. 
]

#proposition[
In an abelian category every morphism has a factorisation (epi-mono factorisation):

#image("imgs/18.png", width: 30%)
]

= Exact sequences
#definition[
  A sequence of maps $A attach(->, t: f) B attach(->, t: g) C $ is called exact at $B$ if $ker g = im f$ (as subobjects of $B$). 
]

#definition[
  A short exact sequence $0 -> A attach(->, t: f) B attach(->, t: g) C -> 0$ is exact everywhere. This means that $f$ is mono, $g$ is epi, and $ker g = im f$ (which indicates that $f = ker g$ and $g  = coker f$). (?)
]

#definition[
  A split short exact sequence if $B$ is isomorphic to $A ds C$. ($ds$ is biproduct here.)
  #image("imgs/19.png")
]

Equivalently, exsistence of section or retract. 

#definition[
  An additive functor $F: cC -> cD$ is called right exact if for every s.e.s. $0-> A-> B-> C-> 0$ the sequence $ F(A) -> F(B) -> F(C) ->  0 $ is exact; it is called left exact if   $ 0 -> F(A) -> F(B) -> F(C) $ is exact.
]


Right exactness preserves cokernels: $C$ is the cokernel of the map $A -> B$ and $F(C)$ is the cokernel of the map $F(A) -> F(B)$. Left exactness preserves kernels. 

#lemma[
  Let $cA$ be an abelian category. Let $M in cA$. The functor $ Hom(A)(M, -): cA -> Ab $ is left exact. 
So if $ses(A, B, C)$ is a ses in $cA$ then 
$ 0 -> Hom(A)(M, A) -> Hom(A)(M, B) -> Hom(A)(M, C) $
is exact in $Ab$.
]

Proof. TODO

#corollary[Dually, $Hom(A) (-, M): cA^op -> Ab$ is also left exact. ]


#endlec(4)

#definition[
   Let $cA$ be an abelian category. An object $P$ is called *projective* if $Hom(A) (P, -)$ is exact. Dually, an object $I$ is called *injective* if $Hom(A) (-, I)$ is exact. 
]

So $P$ is projective if for any ses $ses(X, Y, Z)$ in $cA$ then $ ses(Hom(A)(P, X), Hom(A)(P, Y), Hom(A)(P, Z)) $

The only interesting part is that $Hom(A)(P, Y) -> Hom(A)(P, Z)$ is onto. 

#proposition[
  $P$ is *projective* if and only if for any epimorphism $h: Y->Z$ and any $f: P->Z$, there exists (not necessarily unique) $g: P->Y$ such that the following commutes (which we refer to as the *lifting property*): 
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQAFEAX1PU1z5CKAEyli1Ok1btyPPiAzY8BImQk0GLNohAAtef2VCi5cZK0zdATR6SYUAObwioAGYAnCAFskZkDgQSGJS2uxuhiCePsE0gUjEvO5evogAzHFBiCGWOiAAFpHRqf7x6TSMWGB5UPRw+Q4gmtJ5MAAeWHA4CNyU3EA
#align(center, commutative-diagram(
  node((0, 1), [$P$]),
  node((1, 2), [$0$]),
  node((1, 1), [$Z$]),
  node((1, 0), [$Y$]),
  arr((0, 1), (1, 1), [$f$]),
  arr((1, 1), (1, 2), []),
  arr((1, 0), (1, 1), [$h$]),
  arr((0, 1), (1, 0), [$exists g$], "dashed"),
))
// #image("imgs/20.png", width: 30%)
]

#proof[
  This is just a paraphrase of the definition. By definition, $P$ is projective iff for any epimorphism $h: Y->Z$, we have $ h oo - : Hom(A)(P, Y) -> Hom(A)(P, Z) $ is onto, which means for any $f : P->Z$, there exists $g: P-> Y$ such that $f = h oo g$.
]

#corollary[Dually, $I$ is injective iff for any monomorphism $h: X->Y$ and any $f: X->I$, there exists $g: Y->I$ such that the following commutes (which we refer to as the *extension property*):
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRAEkQBfU9TXfIRQAGUsKq1GLNsO68QGbHgJEy46vWatEIABpy+SwUQBMYiZuk6AmtwkwoAc3hFQAMwBOEALZIzIHAgkUUktNjcDEE8fJDIAoMQTHncvX0TqQKQAZg0pbRAAC0jotJz44OoGLDB8qDo4AocQXLCdGAAPLDgcOAACRzsuIA
#align(center, commutative-diagram(
  node((1, 1), [$I$]),
  node((0, 0), [$0$]),
  node((0, 1), [$X$]),
  node((0, 2), [$Y$]),
  arr((0, 1), (1, 1), [$f$]),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), [$h$]),
  arr((0, 2), (1, 1), [$exists g$], "dashed"),
))
]

#example[
  $R$ ring. In the category of $RMod$ 
  $ Hom_RMod (R, M) = M $ because any $phi $ is entirely determined by $phi(1_R)$. If $ses(M, M', M'')$ and we apply $Hom_RMod (R, -)$ to this we get the same ses $ses(M, M', M'')$ which is exact. 
  
  In a similar way, any free module $R^(ds I)$ is projective. 
]


Note: $ Hom_RMod (R, plus.circle.big_(i in I) M_i) = plus.circle.big M_i = plus.circle.big_(i in I) Hom_RMod (R, M_i) $

This does not follow from the universal property; this is because $R$ is special. 

#definition[
  Let $cA$ be an additive category. We call an object $C$ compact if $ product.co_(i in I) Hom(A) (C, G_i) -> Hom(A)(C, product.co_(i in I) G_i) $
  is an isomorphism for any family ${G_i}_(i in I)$ of objects in $cA$ such that $product.co_(i in I) G_i$ exists. 
]

Remark. You might find different definitions for an arbitrary category (not necessarily additive), but it is equivalent under the additive context. 

// #definition[
//   Generators
// ]

Note. For any $RMod$ $M$ we can find an epi $R^(ds I) -> M -> 0$. (Any module has some generators.) This is not unique. We call $R$ a generator of $M$.

#theorem[
  Let $cA$ be an abelian category. Assume $cA$ has (small)(?) coproducts. Assume that $P$ is a compact, projective generator. Then the functor $Hom(A)(P, -) : cA -> End_cA (P)^op hyph Mod$ (not only an abelian group because any $f: P->P$ can act on it which makes it a module) is an equivalence of categories. 
]

See @rotman[Theorem 5.55]. ?

Note. If $cA = RMod$ we observe that $R$ (as an $RMod$) is a compact, projective generator with arbitrary coproducts (direct sums). In this case $End_RMod (R) = R^op$ because any module homomorphism $phi: R -> R$ is determined by $phi(1)$ but the composition is opposite. Then $End_RMod (R)^op hyph Mod$ is just $RMod$ because $(R^op)^op = R$.

Idea of proof. Using the definition of equivalence you want to construct another functor in the opposite direction and show their composites are natural isomprphic to identity functors. Alternatively, you might also prove that the functor is fully faithful and essentially surjective, if you can.

Let $R$ denote the ring $End(A) (P)^op$. We need a functor $G: RMod -> cA$. Inspired by the special case we want to send $R |-> P$. This is right exact (?) so it must send $R^(ds I) |-> P^(ds I)$. 

For any $M in RMod$ we can find $ R^(ds J) -> R^(ds I) -> M -> 0 $ where $R^(ds J)$ represents the relations and $R^(ds I)$ the generators. 

#image("imgs/22.png", width: 50%)
[TODO]

Note: $cA$ can have more than one compact, projective generator. Then $A = End(A) (P_1)^op hyph Mod = End(A) (P_2)^op hyph Mod$ where $End(A) (P_1)$ and $End(A) (P_2)$ are not necessarily equivalent. This is Morita equivalence of rings. 

Note. Consider $veck$ for some field $k$. Then $k$ and $k^n$ are both compact, projective generators of $veck$. Then $k$ and $M_n (k)$ ($n times n$ matrices over $k$) both are equivalent to $veck$ as categories. 

#theorem(name: "Freyd-Mitchell Embedding Theorem")[
  If $cA$ is a small abelian category, there is a ring $R$ and an exact, fully faithful embedding $cA -> RMod$.
]


Remark. We can embed an abstract category in a concrete one. We can prove any reasonable statements for $RMod$ and they will also hold for abelian categories because of this theorem. 

Proof. Using Yoneda embeddings. $cA -> Fun(cA^op, Ab)$. (?)

#lemma(name: "Snake Lemma")[
 Suppose we have a commutative diagram of objects in an abelian category or $RMod$ 

 // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRAEEQBfU9TXfIRQAmclVqMWbAELdeIDNjwEiAZjHV6zVohABhOXyWCiZAAzitU3ewDkhhf2VDkoi5sk6Q0+zyMCVFHV3CW02PV95RQCXABZSEKsvMwdo5yIzDVDrEBSucRgoAHN4IlAAMwAnCABbJHUQHAgkTOyvcocq2qR4xubEMja2Is7qusQAVmompFEh3QALUe7EBpnEXqS2LEiKsZ7p-qn5hV2QLvHj9YA2P3P9xAB2Q5a7i5aXgY8w3Sxl8cG6zmW10aBA1AYWDAXjgEEhUG4FC4QA
#align(center, commutative-diagram(
  node((1, 1), [$A$]),
  node((1, 2), [$B$]),
  node((1, 3), [$C$]),
  node((0, 1), [$A'$]),
  node((0, 2), [$B'$]),
  node((0, 3), [$C'$]),
  node((0, 4), [$0$]),
  node((1, 0), [$0$]),
  arr((0, 1), (1, 1), [$f$]),
  arr((0, 2), (1, 2), [$g$]),
  arr((0, 3), (1, 3), [$h$]),
  arr((0, 1), (0, 2), [$i'$]),
  arr((0, 2), (0, 3), [$p'$]),
  arr((0, 3), (0, 4), []),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), [$i$]),
  arr((1, 2), (1, 3), [$p$]),
))
// #image("imgs/23.png")

such that the rows are exact, then there is an exact sequence 
$ ker f -> ker g -> ker h attach(->, t: diff)  coker f -> coker g -> coker h $

Further, if $A' -> B'$ is monic, so is $ker f -> ker g$.
If $B -> C$ is epic, so is $coker g -> coker h$.
]
#proof[
  [See https://faculty.etsu.edu/gardnerr/5410/notes/Snake-Lemma.pdf.]
We have the following commutative diagram: 
#v(20pt)
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAmAXVJADcBDAGwFcYkQBBEAX1PU1z5CKchWp0mrdgCEefEBmx4CRAMxiaDFm0QgAwnP5KhRMsXFapujgHJDCgcuHJR5zZJ0hpd3kcEqUdTcJbXY9H3lFf2cyAAYLD3YAaxgAJwACADN7KKciUXj3UN0UjIBzHMcTQNJCkKsQUvSAC0rjAJJSVQTikABjCCbs3wd251FuooaBpoqR3OrkdUn6zxm0lrboogAWUmDLT1itvJRYjVX2Y+5xGCgy+CJQTNSIAFskADYaHAgkVRGL3e-x+f0Q50uumG8iBH3BoKQAE5Aa84QB2BGIHYo4FYzFkSEgOYw1FIAm-MmxHFwgAcmIArNSkPTMaJCa0mYg2RTEMRiJz1CAeXtCVgIs9SXihWCWYS0OKQLDmfjyJziIKeVSSbiITyCYd2Fh7Ereaypp40CAaIwsGBPFB6HBmndjZK6dKkdbbfbHc6oFaQAAjGBgf2IAC0aP52rhiPxWoluOIurBfM53w9iDRnIxmZpN24QA
#align(center, commutative-diagram(
  node((2, 1), [$A$]),
  node((2, 2), [$B$]),
  node((2, 3), [$C$]),
  node((1, 1), [$A'$]),
  node((1, 2), [$B'$]),
  node((1, 3), [$C'$]),
  node((0, 1), [$ker f$]),
  node((0, 2), [$ker g$]),
  node((0, 3), [$ker h$]),
  node((3, 1), [$coker f$]),
  node((3, 2), [$coker g$]),
  node((3, 3), [$coker h$]),
  node((1, 4), [$0$]),
  node((2, 0), [$0$]),
  arr((0, 1), (1, 1), []),
  arr((1, 1), (2, 1), [$f$]),
  arr((2, 1), (3, 1), []),
  arr((0, 2), (1, 2), []),
  arr((1, 2), (2, 2), [$g$]),
  arr((2, 2), (3, 2), []),
  arr((0, 3), (1, 3), []),
  arr((1, 3), (2, 3), [$h$]),
  arr((2, 3), (3, 3), []),
  arr((1, 1), (1, 2), [$i'$]),
  arr((1, 2), (1, 3), [$p'$]),
  arr((1, 3), (1, 4), []),
  arr((2, 0), (2, 1), []),
  arr((2, 1), (2, 2), [$i$]),
  arr((2, 2), (2, 3), [$p$]),
  arr((0, 3), (3, 1), [$diff$], curve: -68deg, "dashed"),
  arr((3, 1), (3, 2), [$j$]),
  arr((3, 2), (3, 3), [$q$]),
  arr((0, 1), (0, 2), [$j'$]),
  arr((0, 2), (0, 3), [$q'$]),
))

  In the first row, consider map $j' := i'|_(ker f) : ker f -> B'$. We claim that $j' : ker f -> ker g$. Indeed, take any $a' in ker f subset.eq A'$, we have 
  $ g(j'(a')) = g(i'(a')) = i(f(a')) = i(0) = 0 $
  Then $j'(a') in ker g$ and thus $j' : ker f -> ker g$. Similarly, $q' := p'|_(ker g) : ker g -> ker h$. We then see the first row is exact because of the exactness of $A' -> B' -> C'$.

  In the last row, define $j : coker(f) -> coker(g)$ as $a + im(f) |-> i(a) + im(g)$ for any $a in A$. We claim that this map is well-defined. If $a_1, a_2 in A$ such that $a_1 + im(f) = a_2 + im(f)$, then $a_1 - a_2 in im(f)$, thus there exists $a' in A'$ so that $a_1 - a_2 = f(a')$. Then 

  $ i(a_1 - a_2) = i(f(a')) = g(i'(a')) in im(g) $

  Then 
  $ j(a_1 + im(f)) = i(a_1) + im(g) = i(a_2) + im(g) = j(a_2 + im(f)) $

  So $j$ is well-defined. Similarly, we can define $q : coker g -> coker h$ and show the exactness of the last row.

  Now all arrows except $diff$, which we call the *connecting homomorphism*, are clear. 
  Pick any $c' in ker h subset.eq C'$. 
  Since $p'$ is surjective, there exists $b' in B'$ so that $p'(b') = c'$. 
  Now $ 0 = h(c') = h(p'(b')) = p(g(b')) $ so $g(b') in ker p = im i$, and there exists unique $a in A$ such that $i(a) = g(b')$. 
  We thus define $diff: ker h -> coker f$ as $ diff(c') = a + im(f) $ 
  We claim this is a well-defined function. 
  Then it suffices to show for any two choices $b'_1, b'_2$ of $b'$ and corresponding choices $a_1, a_2$ of $a$, $diff (c')$ gives the same value. Since $p'(b'_1) = p'(b'_2) = c'$, we have $b'_1 - b'_2 in ker(p') = im(i')$. Thus we can write $b'_1 - b'_2 = i'(a')$ for some $a' in A'$. Then 
  $ i(a_1 - a_2) = g(b'_1 - b'_2) = g(i'(a')) = i (f (a'))  $
  but $i$ is injective, and hence $a_1 - a_2 = f(a') in im f$. In other words, we could define $ diff(c') = i^(-1) g p'^(-1) (c') + im(f) $
  where $p'^(-1)$ means finding some element $b' in B'$ such that $p'(b') = c'$ and so on. 

  We still need to verify this is exact. TODO
  
  See @li[Theorem 6.8.6].
]

= Tensor products

The functor $- tp_R M$ is left adjoint so it commutes with colimits. If we want to calcualte $N tp_R M$. Then we pick the relations and generators of $N$: 
$ R^(ds J) -> R^(ds I) -> N -> 0 $
Then we have
$ R^(ds J) tp_R M -> R^(ds I) tp_R M  -> N tp_R M  -> 0 $

Note that $ R^(ds J) tp_R M iso (R tp_R M)^(ds J) = M^(ds J) $ and so it becomes 
$ M^(ds J) -> M^(ds I) -> N tp_R M  -> 0 $

Consider $R^(ds J) -> R^(ds I)$, this homomorphism between free modules can be represented by a (possibly infinite?) matrix $a_(i j) in R$. Then the same matrix can also act as $M^(ds J) -> M^(ds I) $; and when you take the cokernel of it you get the tensor product $N tp_R M$.

#endlec(5)

Assume $R$ is a commutative ring. The functor $- tp_R M$ is left adjoint which implies that it is right exact and commutes with all colimits. Suppose we want to calculate $N tp_R M$, then we write $ N = coker(R^(ds J) rgt((a_(i j))) R^(ds I)) $ and then $ N tpr M = coker(R^(ds J) rgt((a_(i j))) R^(ds I)) tpr M iso coker(R^(ds J) tpr M rgt((a_(i j))) R^(ds I) tpr M) \ iso coker((R tpr M)^(ds J) rgt((a_(i j))) (R tpr M)^(ds I)) iso coker (M^(ds J) rgt((a_(i j))) M^(ds I)) $

#example[
  Suppose $I$ is an ideal of $R$ generated by ${x_i}_(i in J)$, then we have ses $ ses(I, R, R \/ I) $ but we also have $ R^(ds J) -> I -> 0 $ and thus 
  $ R^(ds J) rgt((x_j)) R -> R \/ I -> 0 $

  Thus if we want to calculate for some $M$ $ R over I tpr M iso coker (M^(ds J) rgt((x_j)) M) = M over I M$
]
[Check https://math.stackexchange.com/questions/175789/how-to-prove-that-r-i-otimes-r-m-cong-m-im]

#definition[
  A localisation of $R$ is defined by $R[t] over (t x - 1)$, denoted as $R[x^(-1)]$.
]

#example[
  $R[x^(-1)] tpr M iso M[x^(-1)]$.
]

#proof[
  Notice that $R[t] tpr M = M[t]$, because $R[t] iso plus.circle.big_(i=1)^(infinity) R$ in $RMod$.
]

#proposition[
  If $B$ is an $R-S$ bimodule and $C$ is a right $S$-module, then $hom_S (B, C)$ is a right $R$-module.
]

#proof[
  Take any $f in hom_S (B, C)$ and $r in R$, define $f r : B -> C$ as $ b |-> f(r b) $
]

Then this makes $Hom_S (B, -)$ a functor from $Mod hyph S$ to $Mod hyph R$, which is right adjoint to $ - tpr B : Mod hyph S -> Mod hyph R $, as we have cannoical isomorphism 
$ Hom_S (A tpr B, C) bij Hom_R (A, Hom_S (B, C)) $

#remark[
  We haven't really defined $ - tpr B $ when $R$ is not commutative but this can be a definition itself, as left adjoint of $Hom_S (B, -)$.
]

#remark[
  We can define $ M tpr N := Coeq (M tp_ZZ R tp_ZZ N arrows M tp_ZZ N ) $
  This coequaliser basically just makes sure $m r tp n = m tp r n$.
]

= Projective and Injective Modules

Recall $P$ is projective if $Hom(A)(P, -)$ is exact and $I$ is injective if $Hom(A)(-, I)$ is exact.

#lemma[
  $P$ is projective if and only if it has the lifting property (refer to earlier).

  $I$ is injective if and only if it has the extension property.
]

#definition[
  An abelian category $cA$ has enough projectives (injectives) if for any object $M$ there is an epi $P-> M -> 0$ where $P$ is projective ($0->M->I$ where $I$ is injective). 
]

For most of our homological algebra to work a category needs to have enough projectives and injectives. We show that $RMod$ has enough projectives and injectives.

== Projective Modules

#lemma[Free $R$-modules are projective.]

#proof[
Let $F eq plus.circle.big_(i in I) R x_i$ be a free $R$-module with basis
$lr({x_i colon i in I})$. Suppose that we have a diagram
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRACEQBfU9TXfIRQAmclVqMWbAAzdeIDNjwEi0sdXrNWiEAEE5fJYKJlp4zVJ0AxbuJhQA5vCKgAZgCcIAWyQBmajgQSGoSWmyuBiAe3sEBQYjEPG6ePoiiIIGxoZYKWJHRqf4Z8ekMWGDaIFB0cAAW9iAakpWMaLV0tlxAA
#align(center, commutative-diagram(
  node((1, 1), [$B$]),
  node((1, 2), [$0$]),
  node((1, 0), [$A$]),
  node((0, 1), [$F$]),
  arr((0, 1), (1, 1), [$f$]),
  arr((1, 1), (1, 2), []),
  arr((1, 0), (1, 1), [$pi$]),
  arr((0, 1), (1, 0), [$alpha$], label-pos:-1em, "dashed"),
))

Since $pi$ is surjective, for each $i$ there is some $a_i in A$ with
$pi lr((a_i)) eq f lr((e_i))$. Define map
$ alpha colon F arrow.r A$ by $alpha lr((x_i)) eq a_i$ and we have $f = pi oo alpha$.
]

#proposition[$P$ is a projective $R$-module iff $P$ is a direct summand of a free module.
]

#proof[
  Assume $P$ is a projective. Then we can always find a free module $F=R^(ds I)$ such that $g: F -> P$ is onto. Using the lifting property,

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQAxEAX1PU1z5CKchWp0mrdgAUefEBmx4CRAExiaDFm0Qhic-kqFFRxcVqm7Z3cTCgBzeEVAAzAE4QAtkjIgcEJHJeVw9vRFE-AMRVYJB3LyQAZhp-HxpGLDAdECh6OAALOxBNSWyYAA8sOBwEWPiw5MjAku12LCgeSm4gA
#align(center, commutative-diagram(
  node((1, 0), [$F$]),
  node((1, 1), [$P$]),
  node((1, 2), [$0$]),
  node((0, 1), [$P$]),
  arr((1, 0), (1, 1), [$g$]),
  arr((1, 1), (1, 2), []),
  arr((0, 1), (1, 0), [$exists$], "dashed"),
  arr((0, 1), (1, 1), [$id$]),
))

So there exists a section $P-> F$ in the ses $ ses(K, F, P) $
and hence $F iso K ds P$, where $K = ker(g)$. This shows that $P$ is a direct summand of a free module.

[This is equivalent to find some idempotent $p: R^(ds I) -> R^(ds I)$ such that $p^2= p$. ? ]

Now we show a direct summand of a free module is projective. 
Suppose that $P$ is a direct summand of a free module. Then there
exists some $R$-module $P^prime$ such that $P xor P^prime$ is free. Let
$pi colon A arrow.r B$ be a surjection and let $f colon P arrow.r B$ be
some map. Let $f^prime colon P xor P^prime arrow.r B$ be the map
$f^prime lr((p comma p^prime)) eq f lr((p))$. Since $P xor P^prime$ is
free, hence projective, $f^prime$ has a lift
$alpha^prime colon P xor P^prime arrow.r A$. Now define
$alpha colon P arrow.r A$ by
$alpha lr((p)) eq alpha^prime lr((p comma 0))$.

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAmAXVJADcBDAGwFcYkQAhEAX1PU1z5CKchWp0mrdgAYefEBmx4CRaWJoMWbRCACCc-kqFEyxcZqk6ACgAIocG1YDkBhQOXCSpaecnaQVjziMFAA5vBEoABmAE4QALZIoiA4EEjSvNFxiYhqKWmIxJkgsQlIACw0qekafuxRIDQARjBgUEgAzBnypTkdVQV5Fv5RLs2t7bnFvZ0DSTSMWGD+UPRwABYhjRJa7Exo6-RjIC1t6dPZFXOIyYvL7KsbW7W7OvuH26eTALRdF2WISr5TrcSjcIA
#align(center, commutative-diagram(
  node((2, 1), [$B$]),
  node((2, 2), [$0$]),
  node((2, 0), [$A$]),
  node((1, 1), [$P ds P'$]),
  node((0, 1), [$P$]),
  arr((2, 0), (2, 1), [$pi$], label-pos: -1em),
  arr((2, 1), (2, 2), []),
  arr((0, 1), (2, 1), [$f$], curve: 30deg),
  arr((1, 1), (2, 1), [$f'$], label-pos: -1em),
  arr((1, 1), (2, 0), [$alpha'$], "dashed"),
  arr((0, 1), (2, 0), [$alpha$], curve: -30deg, "dashed"),
  arr((0, 1), (1, 1), [$i$], label-pos: -1em),
))
]

#corollary[
    $RMod$ has enough projectives. 
]
#proof[
  For any module $M$ we can find a free (and thus projective) module $F$ with a surjection $ F-> M-> 0 $
]


== Injective Modules

#lemma(name: "Baer's criterion")[
  A right $R$-module $M$ is injective iff for every right ideal $I$ of $R$, every module homomorphism $I -> M$ can be extended to $R -> M$.
]

#proof[
  One direction easily follows from definition. We focus on the other.

  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAEEQBfU9TXfIRQBGclVqMWbdgHJuvEBmx4CRAExjq9Zq0QcZcnn2WCiAZk0SdbAELzjA1SjLDx2qXoCy3cTCgBzeCJQADMAJwgAWyQyEBwIJFE4uiwGNgALCAgAa3sQcKjE6nikDWTUjKzco3yI6MQyksQLcrS9TJy8gvrYpoAWLUldfK66oriExAGQBiwwYag6OHS-EEHrPUY0dLpDBW7S4snp92GtnYM1mbmFpZWoUcLmo6Rp2fm2ReXVrgouIA
#align(center, commutative-diagram(
  node((0, 0), [$A$]),
  node((0, 1), [$A'$]),
  node((0, 2), [$A''$]),
  node((0, 3), [$B$]),
  node((1, 0), [$M$]),
  arr((0, 0), (0, 1), [], "inj"),
  arr((0, 1), (0, 2), [], "inj"),
  arr((0, 2), (0, 3), [], "inj"),
  arr((0, 0), (1, 0), [$f$]),
  arr((0, 1), (1, 0), [$alpha'$], "dashed"),
  arr((0, 2), (1, 0), [$alpha''$], curve: 10deg, "dashed"),
  arr((0, 3), (1, 0), [], curve: 30deg, "dashed"),
))

  Fix some injection $i colon A arrow.r B$ of
$R$-modules, and some map $f colon A arrow.r M$. Without loss of
generality, assume that $A subset.eq B$ and $i$ is the inclusion. 


[Construction of $A'$ and $alpha' : A' -> M$.] Let
$Sigma$ be the set whose elements are $R$-module maps
$alpha^prime colon A^prime arrow.r M$, where
$A subset.eq A^prime subset.eq B$ and $alpha^prime$ extends $f$. We may give this set a partial order by
saying that $alpha^prime lt.eq alpha^(prime prime)$ when
$A^prime subset.eq A^(prime prime)$ and $alpha^(prime prime)$ extends
$alpha^prime$. Suppose that $alpha_1 lt.eq alpha_2 lt.eq dots.h$ is an
ascending chain in $Sigma$, with corresponding modules
$A_1 subset.eq A_2 subset.eq dots.h$. Let $A^prime eq union A_n$, and
define $alpha^prime colon A^prime arrow.r M$ by
$alpha^prime lr((a)) eq alpha_i lr((a))$ for $a in A_i$. It is easy to
check that $alpha^prime$ is a well-defined element of $Sigma$, and it is
an upper bound on the chain \(n.b. we are really just taking the colimit
of the chain).
Since $Sigma$ is a partially ordered set in which every ascending chain
has an upper bound, by Zorn’s Lemma it has a maximal element,
which we call $alpha^prime colon A^prime -> M$. 

To show that $M$
is injective, we need to show that $A^prime eq B$, since we then have an
extension $alpha$ of $f$ to $B$. 

[Construction of $phi : R-> M$.] Suppose that $A^prime eq.not B$. Let $b in B without A^prime$, and
define 
$ A^(prime prime) eq A^prime plus R b = {a + r b : a in A', r in R} subset.eq B $ Let
$I eq brace.l r in R$ : $b r in A^prime}$. Then $I$ is a right ideal of
$R$, and we have a map
$ I arrow.r M comma quad r arrow.r.bar alpha^prime lr((b r)) $

By assumption, this extends to a map $phi colon R arrow.r M$. 

[Construction of $alpha'' : A'' -> M$.] We
claim that there is a well-defined map
$ alpha^(prime prime) colon A^(prime prime) arrow.r M comma quad a plus b r arrow.r.bar alpha^prime lr((a)) plus phi lr((r)) comma $
where $a in A^prime$ and $r in R$. To see that this is well-defined,
suppose that $a plus b r eq a^prime plus b r^prime$
where $a, a' in A'$ and $r, r' in R$.
Then
$ a minus a^prime eq b lr((r^prime minus r)) in A^prime sect b R dot.basic $

From this we see $r - r' in I$, and then we have
$ phi lr((r^prime minus r))
 = alpha^prime lr((b lr((r^prime minus r)))) = alpha^prime lr((a minus a^prime)) $

Therefore, it follows that
$alpha^prime lr((a)) plus phi lr((r)) eq alpha^prime lr((a^prime)) plus phi lr((r^prime))$
so $alpha^(prime prime)$ is well-defined. But then $alpha^(prime prime)$
strictly extends $alpha^prime$, contradicting maximality of
$alpha^prime$. Hence $A^prime eq B$.

See @notes[Theorem 5.8] and @rotman[Theorem 3.30].]

#definition[
  Let $R$ be an integral domain. A $R$-module $M$ is called *divisible* if, for all $r in R without {0}$, every element $m$ of $M$ can be \"divided\"
by $r$, in the sense that there is an element $m^prime$ in $M$ such that
$m eq r m^prime$. 
]
This condition can be reformulated by saying that the
multiplication by $r$ defines a surjective map from $M$ to $M$.

#corollary[
  If $R$ is a PID, then an $R$-module $M$ is injective if
  and only if it is divisible.
]

That is, for all $m in M$ and
  $r in R without brace.l 0 brace.r$ there exists $m' in M$ such that
  $m eq r m'$. Also recall that a PID is an integral domain in which every ideal is principal, i.e., can be generated by a single element.

  // [Unfortunately the notations are confusing, because we use $I$ to represent an ideal in the last theorem but the same letter for an $R$-module here.]

// The details of the proof can get in the way of the intuitive idea, which
// is quite simple. Maybe try proving it yourself before reading on \(use
// Baer’s Criterion).

#proof[
Let $M$ be an injective $R$-module, and let $m in M$ and
$r in R without brace.l 0 brace.r$. Set $J eq r R$ (which is an ideal of $R$) and define
$f colon J arrow.r M$ by $f lr((r)) eq m$. By Baer’s Criterion, we may
extend $f$ to a homomorphism $tilde(f) colon R arrow.r M$. Then
$ m eq f lr((r)) = tilde(f)(r)eq tilde(f) lr((r dot.op 1)) eq r dot.op tilde(f) lr((1)) $
So taking $m' eq tilde(f) lr((1))$, we see that $M$ is divisible.

Suppose conversely that $M$ is a divisible $R$-module. Let $J$ be an
ideal of $R$ and let $f colon J arrow.r M$ be a module homomorphism. If
$J$ is the zero ideal, then trivially we may extend $f$ to the zero
homomorphism $R arrow.r M$. Assume that $J$ is nonzero.
Since $R$ is a PID, we have $J eq R r$ for some nonzero $r in J$. Let
$m eq f lr((r))$. Then since $M$ is divisible, there is some $m' in M$
such that $m eq r m'$. Define $tilde(f) colon R arrow.r M$ by
$tilde(f) lr((1)) eq m'$. Clearly $tilde(f)$ is an extension of $f$, so
$M$ is injective by Baer’s Criterion.

See @rotman[Corollary 3.35] and @notes[Corollary 5.9].]

#example[
  In $Ab = ZZ hyph Mod$, we have that $QQ, ZZ_(p^ infinity) = ZZ[1 / p] over ZZ, QQ over ZZ$ are injective.

  Every injective abelian group $I = I_"tor" ds I_"free"$, where $I_"free"$ is a $QQ$-vector space and $I_"tor"$ (torsion part) is a direct sum copies of $ZZ_(p^ infinity)$.
]

#lemma[
    Direct sums of projectives are projectives, and   products of injectives are injectives. 
]

#proof[
  The first half is easily seen from 
  $ Hom (ds P_i, -) = product Hom (P_i, -) $
  The second half is dual.
]
#proposition[
  $Ab$ has enough injectives. 
]

#proof[
  For any $A in Ab$, define a map $I : Ab -> Ab$ by $ I(A) := product_(Hom_Ab (A, QQ over ZZ)) QQ over ZZ $

  The RHS is injective as a product of injectives $QQ over ZZ$.

  Consider canonical map $e_A: A -> I(A)$, where (because $I(A)$ is a product) we need to define for each $phi  in hom_Ab (A, QQ over ZZ)$ the component $e_(a, phi) : A -> QQ  over ZZ$, which we just define to be $phi$ itself. Explicitly, for any $a in A$, 
  $ e_A (a) = (phi(a))_(phi in hom_Ab (A, QQ over ZZ)) $

  We claim that $e_A$ is injective. We need to show that for any $0 != a in A$ there exists $phi in Hom_Ab (A, QQ over ZZ)$ such that $phi(a) != 0$.
  //  (using that $QQ over ZZ$ is injective). 

  - If $a$ has an infinite order, then set $phi(a)$ as any nonzero element of $QQ over ZZ$ and we obtain a group homomorphism $phi$ such that $phi(a) != 0$;
  - If $a$ has order $m$ for some integer $m > 1$, then we set $phi(a) = 1/m + ZZ$ and this is a well defined group homomorphism. 

  [See https://math.stackexchange.com/questions/4071941/category-of-abelian-groups-has-enough-injectives.]
]

#endlec(6)

// = injective and projective and adjoints 

#proposition[
  If an additive functor $R: cB -> cA$ between abelian categories is right adjoint to an exact functor and $I$ is injective in $cB$, then $R(I)$ is injective in $cA$. 
  
  Dually, if an additive functor $L: cA -> cB$ is left adjoint to an exact functor and $P$ is projective in $cA$, then $L(P)$ is projective in $cB$. 
]
#proof[
  We want to show that 
  $ Hom(A)(-, R(I)) $ is exact. 
  We have
  $ Hom(A)(-, R(I)) iso Hom(B)(L(-), I ) $
  but $L$ is exact and $Hom(B)(-, I)$ is exact, so $Hom(B)(L(-), I )$ is a composition of exact functors and thus exact.

  See @notes[Lemma 5.25] and @weibel[Proposition 2.3.10].
]
With this proposition, we can construct adjunctions to prove if there is enough proj/inj.

#corollary[
  If $I$ is an injective abelian group, then $hom_Ab (R, I)$ is an injective #rrm.
]
#proof[
  // Notice that $hom_Ab (R, A)$ is a #lrm.
Assume $R$ is a ring and $M$ is a #rrm. $ hom_Ab ("Forget"(M), A) bij hom_Ab (M tpr R, A ) bij hom_ModR (M, hom_Ab (R, A)) $
using hom-tensor adjunction, where $"Forget": ModR -> Ab$ is the forgetful functor and we view $R$ as a left $R$-module here (instead of an $R, R$-bimodule). 

This shows that $"Forget"$ is left adjoint to $hom_Ab (R, -)$. The forgetful functor is clearly exact.
]

#example[
  $hom_Ab (R, QQ over ZZ)$ is injective.
]

#proposition[
  $RMod$ has enough injectives. 
]

#proof[
  Let $M$ be a left $R$-module. 
  We define
  $ I(M) = product_(homr(M, hom_Ab (R, QQ over ZZ))) hom_Ab (R, QQ over ZZ) $
  $I(M)$ is injective as a product of injectives, and there is a canonical morphism $e_M : M -> I(M)$. We only need to construct $ e_(M, phi) : ModR ->hom_Ab (R, QQ over ZZ), quad M mapsto phi(M) $ for all $phi in homr(M, hom_Ab (R, QQ over ZZ))$.

  // Exercise: $e_M$ is one-to-one (mono). (like what we did before.) [TODO]

  We only need to show that for any $0 != m in M$, there exists $phi : M -> hom_Ab (R, QQ over ZZ)$ such that $phi(m) != 0$. Notice that we have $ phi in homr(M, hom_Ab (R, QQ over ZZ)) iso hom_Ab (M, QQ over ZZ) $
  Hence we only need to find some $phi : M -> QQ over ZZ$ in $Ab$ so that $phi(m) != 0$. This is the same case as before.
]

= Chain Complexes

Let $cA$ be an abelian category. 

#definition[
  A *chain complex* $Ccx$ in $cA$ is a family ${C_n}_(n in ZZ)$ of objects in $cA$ with morphisms $d_n : C_n -> C_(n-1)$ such that $d_n oo d_(n-1) = 0$ (or $d^2 = 0$), where $d_n$ are called *differentials*. The *$n$-cycles* of $Ccx$ are $ Z_n := ker d_n $ and the *$n$-boundaries* are $ B_n := im d_(n+1) $
 
  We have $ B_n arrow.hook Z_n arrow.hook C_n $ (as subobjects) for all $n$.

  The *$n$-th homology* are defined as $ H_n (C_cx) := coker(B_n arrow.hook Z_n) $
]

#align(center,image("imgs/2023-11-03-12-27-08.png",width:80%))

#definition[
    We can form a category $"Ch"(cA)$ with objects as chain complexes and morphisms as *chain maps* $u_cx : C_cx -> D_cx$ which
  commutes with differentials, namely for all $n in ZZ$,
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAGEB9QgX1PUy58hFAEZyVWoxZsuACjABaUQEoQfAdjwEiZUZPrNWiEABFu6-iAxbhRcfuqGZJ8wuVqekmFADm8IlAAMwAnCABbJDIQHAgkcSkjNihLYLDIxAAmalikAGYnaWMQFI0QUIionLiswqSTJgsyioyE3MQCxJcQRvdVdQoeIA
#align(center, commutative-diagram(
  node-padding: (30pt, 50pt),
  padding: 0.5em,
  node((0, 0), [$C_n$]),
  node((0, 1), [$C_(n-1)$]),
  node((1, 0), [$D_n$]),
  node((1, 1), [$D_(n-1)$]),
  arr((0, 0), (0, 1), [$d$]),
  arr((1, 0), (1, 1), [$d$]),
  arr((0, 0), (1, 0), [$u_n$]),
  arr((0, 1), (1, 1), [$u_(n-1)$]),
)) commutes.
]
#example[
  Show that $u_cx : Ccx -> Dcx$ induces a morphism $H_n (u_cx) : H_n (Ccx) -> H_n (Dcx)$ and thus $H_n : "Ch"(cA) -> cA$ is a functor. 
]


#definition[
  A chain map  $C_cx -> D_cx$ is called a *quasi-isomorphism* if the induced maps $H_n (C_cx) -> H_n (D_cx)$ are all isomorphisms. 
]

// #remark[
// (Remark here, connection to topology)
//   Derived category of an abelien category $cA$ is $ D(A) = Ch(A) ["qiso"^(-1)]$. Compare to $R[s^(-1)]$ for some $s in R$ and non-commutative $R$. 
  
//   Non-linear version: homotopy types. $Top[W^(-1)]$

//   (TODO)
// ]

#proposition[
  Tfae: 
  - $C_cx$ is exact at every $C_n$;
  - $C_cx$ is *acyclic*, i.e. $H_n (C_cx) = 0$ for all $n$;
  - $0 -> C_cx$ is a quasi-isomorphism. 
]
#proof[Trivial.]

#definition[
  A cochain complex is given by ${C^n}_(n in ZZ)$ and $d^n : C^n -> C^(n+1)$ with $d^2 = 0$.

  ... Just dual. TODO
]

#definition[
  A *cochain complex* $Ccx$ in $cA$ is a family ${C^n}_(n in ZZ)$ of objects in $cA$ with morphisms $d^n : C^n -> C^(n+1)$ such that $d^n oo d^(n+1) = 0$, where $d^n$ are called *differentials*. The *$n$-cocycles* of $C^cx$ are $ Z^n := ker d^n $ and the *$n$-coboundaries* are $ B^n := im d^(n+1) $
 
  We have $ B^n arrow.hook Z^n arrow.hook C^n $ (as subobjects) for all $n$.

  The *$n$-th cohomology* are defined as $ H^n (C^cx) := coker(B^n arrow.hook Z^n) $
]

#example[
  Let $X$ be a topological
space, and let $S_k eq S_k lr((X))$ be the free $R$-module on the set of
continuous maps from the standard $k$-simplex $Delta_k$ to X. Restriction
to the $i$-th face of $Delta_k lr((0 lt.eq i lt.eq k))$ transforms a
map $Delta_k arrow.r X$ into a map
$Delta_(k minus 1) arrow.r X$, and induces an $R$-module
homomorphism $diff_i$ from $S_k$ to $S_(k minus 1)$. The alternating
sums $d eq sum lr((minus 1))^i diff_i$ (from $S_k$ to $S_(k minus 1)$) 
assemble to form a chain complex
$ dots.h.c arrow.r^d S_2 arrow.r^d S_1 arrow.r^d S_0 arrow.r 0 $ called the *singular chain complex* of $X$.
The $n$-th homology module of $S_cx (X)$ is called the
$n$-th singular homology of $X$ \(with
coefficients in $R$) and is written $H_n lr((X semi R))$. 

See @weibel[Application 1.1.4].
]
// #example[
//   Let $X$ be a topological space. Then $S_k = S_k (X)$ is the free $R$-module on the set of continuous maps $Delta_k -> X$, with restriction to the $i$-th face defines $S_k rgt(diff_i) S_(k-1)$, $d = sum (-1)^i diff_i$ gives a chain complex. 

//   The singular chain complex of $X$ 

//   $H_n^"singular"(X, R)$
// ]

// #remark[
//   If $cA$ is an abelian category, then we can define $S cA$ as the set of simplicial objects in $cA$. Then there is a functor $N: S cA -> Ch_(>= 0) (cA)$.

//   Dold-Kan
//   (?)
// ]

== Chain Homotopy

#definition[
  A chain map $f: Ccx -> Dcx$ is *null homotopic* if there are maps $s_n : C_n -> D_(n+1)$ such that $f = d s + s d$, or more rigrously,
  $ f_n = d_(n+1) s_n + s_(n+1) d_n $
  for all $n$.
  #align(center,image("imgs/2023-10-31-00-07-24.png",width:50%))
  (This is not a commutative diagram.) We denote $f tilde 0$ in this case.
]
#definition[
  Two chain maps $f$ and $g$ from $Ccx$ to $Dcx$ are *chain homotopic* if $f - g$ is null homotopic. We denote $f tilde g$.
]
#remark[
$f tilde g <=> f - g tilde 0 <=> f - g = s d + d s$.
]

#lemma[
  // If $f tilde g$, then $f_* = g_* :  H_* (C) -> H_* (D)$.
  Suppose that chain maps
$f comma g colon C_cx arrow.r D_cx$ are chain homotopic.
Then the induced maps
$f_* comma g_* colon H_n lr((C)) arrow.r H_n lr((D))$
are equal. In particular, if $f: Ccx-> Dcx$ is null homotopic, then $f_* = 0 : H_n (C) -> H_n (D)$. 
]

#proof[ Let $h$ be a chain homotopy from $f$ to $g$. We have

$ f_n minus g_n eq s_(n minus 1) compose d_n^(lr((C))) plus d_(n plus 1)^(lr((D))) compose s_n $

for each $n$. Let $x in H_n lr((C))$. Then $x eq lr([c])$ for some cycle
$c in Z_n C$. We have

$ f_* lr((x)) minus g_* lr((x)) & eq lr([f_n lr((c)) minus g_n lr((c))])\
 & eq lr([s_(n minus 1) compose d_n^(lr((C))) lr((c)) plus d_(n plus 1)^(lr((D))) compose s_n lr((c))])\
 & eq lr([d_(n plus 1)^(lr((D))) compose s_n lr((c))])\
 & eq 0 comma $

The third equality is because $c$ is an $n$-cycle  in $C$ and last equality is because $d_(n plus 1)^(lr((D))) compose s_n lr((c))$ is an $n$-boundary in $D$.

See @notes[Lemma 2.32] and @weibel[Lemma 1.4.5].]

#endlec(7)

#definition[
If $C = Ccx$
is a chain complex (resp. cochain complex) and $p$ an integer, we form a new complex $C lr([p])$ as
follows:
$ C lr([p])_n eq C_(n plus p) quad lr((upright("resp. ") C lr([p])^n eq C^(n minus p))) $
with differential $lr((minus 1))^p d$. We call
$C lr([p])$ the *$p$-th translate* of $C$. The way to remember
the shift is that the degree $0$ part of $C lr([p])$ is $C_p$. The
sign convention is designed to simplify notation later on. Note that
translation shifts homology:
$ H_n lr((C lr([p]))) eq H_(n plus p) lr((C)) quad lr((upright("resp. ") H^n lr((C lr([p]))) eq H^(n minus p) lr((C)))) $

We make translation into a functor $[p]: Ch(cA) -> Ch(cA)$ by shifting indices on chain maps.
That is, if $f colon C arrow.r D$ is a chain map, then
$f lr([p])$ is the chain map given by the formula
$ f lr([p])_n eq f_(n plus p) quad lr((upright("resp. ") f lr([p])^n eq f^(n minus p))) $

See @weibel[Translation 1.2.8].
]

// #definition[
// Translation $ (C[p])_n := C_(n+p) $

// $ (C[p])^n := C^(n-p) $

// differential is $(-1)^p d $

// ]

// $(C[p])_0 = C_p$

// $H_n (C[p]) = H_(n+p) (C)$

// $f: Ccx -> Dcx$ => $f[p]_n = f_(n+p)$ 

== Exact Sequences
#proposition[
$Ch(cA)$ is an abelian category if $cA$ is an abelian category.
]
#proof[
See @rotman[Proposition 5.100]. 
]


We can form short exact sequences with chain complexes, and they naturally induce long exact sequences in (co)homology.

#definition[ For chain complexes $A_cx, B_cx, Ccx$,
$ ses(A_cx, B_cx, Ccx) $ is a *short exact sequence (s.e.s.)* if $ses(A_n, B_n, C_n)$ is a short exact sequence for all $n$.
]

// Long exact sequence. 

#theorem[
  If $ 0 -> A_cx rgt(f) B_cx rgt(g) Ccx -> 0$ is a short exact sequence of chain complexes, there is a natural map (for each $n$) $ diff: H_n (C) -> H_(n-1) (A) $ (which we call the *connecting homomorphism*) making 
  $ ... -> H_n (B) -> H_n (C) rgt(diff_n) H_(n-1) (A) -> H_(n-1)(B) -> ... $
  a long exact sequence. 

  Same with cochain complexes, with the connecting homomorphism 
  $ diff : H^n\(C) -> H^(n+1)(A) $
]

#proof[
  This is an application of the Snake Lemma. 
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRGJAF9T1Nd9CKAIzkqtRizYBBAPqFuvbHgJEATKOr1mrRCABCcrjxAYlAogGYN47WwDChhSb7LByACzWtk3Ryen+FRQyITFvHXYjRUC3EVDNCQjZAAowAFohAEoo5zMg5HV4mx99GVSM7P8XcxQrIvD7MvSsnIDXIk96xLY-MRgoAHN4IlAAMwAnCABbJDIQHAgkIScJ6aXqBaRVFcmZxHV5xcQLHbXjjaP3U72RQ6QANgTbXSgc1b2DzcQAdieS1+uSCsd0QAA5qAw6AAjGAMAAK1SCIAYMFGOBAfwiAOM7yQAFYLg9AYhHiDvsTfiDQcTwSCAJycCicIA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$0$]),
  node((0, 1), [$A_n$]),
  node((0, 2), [$B_n$]),
  node((0, 3), [$C_n$]),
  node((0, 4), [$0$]),
  node((1, 0), [$0$]),
  node((1, 1), [$A_(n-1)$]),
  node((1, 2), [$B_(n-1)$]),
  node((1, 3), [$C_(n-1)$]),
  node((1, 4), [$0$]),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), []),
  arr((0, 2), (0, 3), []),
  arr((0, 3), (0, 4), []),
  arr((0, 1), (1, 1), [$d$]),
  arr((0, 2), (1, 2), [$d$]),
  arr((0, 3), (1, 3), [$d$], label-pos: left),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
  arr((1, 2), (1, 3), []),
  arr((1, 3), (1, 4), []),
))
  Using the Snake Lemma, if we write the cokernels (and shifting up the index by $1$), we get 
  $
    A_n / (d A_(n+1)) -> B_n / (d B_(n+1)) -> C_n / (d C_(n+1)) -> 0
  $
  is exact, where $d A_(n+1) = im d$; if we write the kernels, we get
  $
    0-> Z_(n-1)(A) -> Z_(n-1)(B) -> Z_(n-1)(C) 
  $
  is also exact. Notice $d A_n subset.eq Z_(n-1)(A)$ so we can use $d$ to connect the rows again:
  
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQBBAfTAAIB6XgAoovbkLABqYgEoZIAL6l0mXPkIoATBWp0mrdgCEeA4aOMTpcxcpAZseAkQDMOmgxZtEIAMInBIrx+lrLySioO6kQALG56nuzkNhFqTijkpMS6HgbeSeF2qo4aJJnZ+l4gAFpcEgC0skIcYbb2qSXaWe4V7DX1jYYtKcUuZd0J3n1gDTJCPmG6MFAA5vBEoABmAE4QALZIGSA4EEjEBdt7pzTHSJrnO-uI2kcniM73l4ixL0gArB+PX7XV4ANgBSBBwKQAHZwYhDjdEED4rkQFBkiALo8yD9EJCUZV0XDnojoeNUUTKAogA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 1), [$A_n / (d A_(n+1))$]),
  node((0, 2), [$B_n / (d B_(n+1))$]),
  node((0, 3), [$C_n / (d C_(n+1))$]),
  node((0, 4), [$0$]),
  node((1, 0), [$0$]),
  node((1, 1), [$Z_(n-1)(A)$]),
  node((1, 2), [$Z_(n-1)(B)$]),
  node((1, 3), [$Z_(n-1)(C)$]),
  arr((0, 1), (0, 2), []),
  arr((0, 2), (0, 3), []),
  arr((0, 3), (0, 4), []),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
  arr((1, 2), (1, 3), []),
  arr((0, 1), (1, 1), [$d$]),
  arr((0, 2), (1, 2), [$d$]),
  arr((0, 3), (1, 3), [$d$]),
))

  Notice $ ker ( A_n / (d A_(n+1)) rgt(d) Z_(n-1) (A)) = H_n\(A) $ and 
  $
    coker ( A_n / (d A_(n+1)) rgt(d) Z_(n-1) (A)) = H_(n-1) (A)
  $
  and the other two columns are similar.
  By the Snake Lemma again, we have the connecting map:
  $
    H_n (A) -> H_n (B) -> H_n (C) rgt(diff) H_(n-1) (A) ->  H_(n-1) (B) ->  H_(n-1) (C)
  $

  // #align(center,image("imgs/2023-11-03-11-53-54.png",width:80%))

  Putting all these exact sequences together, we get the desired long exact sequence.

  See https://web.northeastern.edu/suciu/MATH7221/les_homology.pdf.
]
#remark[
  The connecting morphism can be written as $diff = f^(-1) d_B g^(-1)$. This is well defined in the same way as in the proof of the Snake Lemma. 
]

#example[
  Show that there exists a functor 

  category of ses of complexes in $cA$
  $->$
  category of les in $cA$

  We just construct the object maps, still need to verify it works on the morphisms and thus it is a functor.
  #TODO
]

== Resolutions
#definition[
  Let $cA$ be an abelian category. Let $M$ be an object of $cA$. A *left resolution* of $M$ is a complex $P_cx$ with $P_i = 0$ for negative $i$, with morphism $epsilon : P_0 -> M$ such that 
  $ ... -> P_2 rgt(d) P_1 rgt(d) P_0 rgt(epsilon) M -> 0 $
  is exact.

  If each $P_i$ is projective, then we call it a *projective resolution*.

  If $cA$ is $RMod$ or $ModR$ and each $P_i$ is a free module, then we call it a *free resolution*.

  In the same way, we define *right resolutions* and *injective resolutions*, only reversing all the arrows. 
]

#proposition[
  $P_cx$ is a resolution if and only if the following chain map $f: P_cx -> M[0]$
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRADpOQBfU9TXPkIoAjOSq1GLNgAUA+gCYefEBmx4CRBeOr1mrRCHkjl-dUKIBmHZP2y5xU6oEbhyACw290w495nBTRRPEQlvAxA-FTVAt2tQ3SkIgFknGNctUgTbH0i0lwtRLLCktiiAjJQybPC2TnYeCRgoAHN4IlAAMwAnCABbJDIQHAgkMRyIqCce-rHqEaRtCbYp-xAZgcQlhcRrZcNVlQ2kPZ33NePEAE550cQADgvezfvbpAB2J9nEd7fEADYvpt-n8AKxAubDO6vfZ5CFbP6-WHldbPE5-EGwmBobAMTTwoY7G4gBhYMAROAQUlTRJ2Qz1RrcIA
#align(center, commutative-diagram(
  node((0, 0), [$...$]),
  node((0, 1), [$P_2$]),
  node((0, 2), [$P_1$]),
  node((0, 3), [$P_0$]),
  node((0, 4), [$0$]),
  node((1, 4), [$0$]),
  node((1, 3), [$M$]),
  node((1, 2), [$0$]),
  node((1, 1), [$0$]),
  node((1, 0), [$...$]),
  arr((0, 0), (0, 1), [$d$]),
  arr((0, 1), (0, 2), [$d$]),
  arr((0, 2), (0, 3), [$d$]),
  arr((0, 3), (0, 4), []),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
  arr((1, 2), (1, 3), []),
  arr((1, 3), (1, 4), []),
  arr((0, 1), (1, 1), [$0$]),
  arr((0, 2), (1, 2), [$0$]),
  arr((0, 3), (1, 3), [$epsilon$]),
  arr((0, 0), (1, 0), [$...$]),
))
is a quasi-isomorphism. 
]

#proof[
  By definition, $P_cx$ is a resolution if and only if 
  (a) $P_cx$ is exact at $P_n$ for $n>=1$ and 
  (b) $M = coker(P_1 rgt(d) P_0)$. 
  On the other hand, $f$ is quasi-isomorphism if and only if 
  (a') $H_n (P_cx) iso H_n\(M[0]) iso 0$ for $n>=1$ and 
  (b') $ H_0(P_cx) iso H_0(M[0]) iso M$. 
  (a) is obviously equivalent to (a'); (b') is equivalent to $M = P_0 over im(d) = coker(P_1 rgt(d) P_0)$ and thus  equivalent to (b).
]
// (Some more remark...?)

Instead of working with a complicated object $M$, we are working with a complex of "simple" objects.

#lemma[
  If $cA$ has enough projectives, then every object has a projective resolution.
]

#proof[
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZAdgBoAmAXVJADcBDAGwFcYkQBZEAX1PU1z5CKABwVqdJq3YAGHnxAZseAkQBs4mgxZtEIAAoB9Ob37KhRACybJO9kYCM8s4NUoArKQDME7dL0cxs6KAirCyBqWvlK6ICYKSq7h1lFaMbLBiWFEXqQO0XYBhk6mIeZuyOSkMgX+cZmhFihVVGmFBobkDeXJ1bWx8S7ZKA7e-eyBXaVZTcgypKm2dYNlSUSjrUuxAHS7PBIwUADm8ESgAGYAThAAtkjWIDgQSFVb7FhBpVe3SLmPz4gHn5YjA0NhGARisFvndATQnkh3F9rrC-gjEK9gewoFDkT8MfCAfM3npQeDISsYUhieiHHjYRp-vd6UgyEzEH8sXoPiUFFTEGJ2cQWYgAJyE1ltOpkrAQsCdaEopDi9mc9J6HFTPlKxBs2kyEUOUbslVckAfLUXHUOV60una-EONEA0XcSjcIA
#align(center, commutative-diagram(
  node-padding: (40pt, 40pt),
  node((2, 7), [$M$]),
  node((2, 8), [$0$]),
  node((2, 6), [$P_0$]),
  node((2, 4), [$P_1$]),
  node((3, 5), [$M_0$]),
  node((4, 6), [$0$]),
  node((4, 4), [$0$]),
  node((1, 3), [$M_1$]),
  node((0, 2), [$0$]),
  node((2, 2), [$P_2$]),
  node((0, 4), [$0$]),
  node((3, 1), [$M_2$]),
  node((4, 0), [$0$]),
  node((2, 1), [$...$]),
  arr((3, 5), (2, 6), [$i_0$], label-pos: -1em),
  arr((2, 4), (3, 5), [$epsilon_1$]),
  arr((3, 5), (4, 6), []),
  arr((2, 4), (2, 6), [$d_1$]),
  arr((2, 6), (2, 7), [$epsilon_0$]),
  arr((2, 7), (2, 8), []),
  arr((4, 4), (3, 5), []),
  arr((1, 3), (2, 4), [$i_1$]),
  arr((0, 2), (1, 3), []),
  arr((2, 2), (1, 3), [$epsilon_2$], label-pos: 1.5em),
  arr((2, 2), (2, 4), [$d_2$]),
  arr((1, 3), (0, 4), []),
  arr((3, 1), (2, 2), [$i_2$], label-pos: -1em),
  arr((4, 0), (3, 1), []),
  arr((2, 1), (2, 2), []),
))
  Let $M in cA$.
  By definition of having enough projectives, let $epsilon_0: P_0 -> M$ be an epimorphism where $P_0$ is projective.
  Let $M_0 := ker epsilon_0$, and we have short exact sequence

  $
    0 -> M_0 -> P_0 -> M -> 0
  $

  Now we can let $epsilon_1: P_1 -> M_0$ be an epimorphism and $M_1 := ker epsilon_1$, obtaining the short exact sequence
  $
    ses(M_1, P_1, M_0)
  $
  We define $d_1 = i_0 epsilon_1 : P_1 -> P_0$ and then 
  $
    d_1(P_1) = M_0 = ker epsilon_0
  $
  Thus the chain in exact at $P_0$. The precedure above can be then iterated for any $n >= 1$ and the resultant chain is infinitely long.
  // Set $d_0 = epsilon_0$.

  // Suppose we now have monomorphism $i_(n-1) : M_(n-1) -> P_(n-1)$ and $d_(n-1) : P_(n-1) -> P_(n-2)$ 
  
  // By induction, givenlet $epsilon_n: P_n -> M_(n-1)$ be an epimorphism, where $P_n$ is projective, and let $M_n = ker epsilon_n$. Thus we have
  // $ 0 -> M_n -> P_n -> M_(n-1) -> 0 $

  // Define $d_n = i_(n-1) epsilon_n$, which is the composite $P_n -> M_(n-1) -> P_(n-1)$. The image of $d_n$ is $ d_(n) (P_n) = M_(n-1) = ker d_(n-1) $ and hence exact.

  // (TODO A very nice commutative diagram!!)
  See @notes[Lemma 5.20].
]

// (Some remarks...)

Dually, we get the same construction for injective resolutions. 

// In the case of $RMod$, we can work with free resolutions instead of just projective ones. 

#theorem(name: "Comparison theorem")[
  Let $P_cx rgt(epsilon) M$ be a projective resolution of $M$ (enough to assume $P_cx$ is a complex with projective objects). Let $f': M->N$. Then for every resolution $eta: Q_cx -> N$, there is a chain map $f: P_cx -> Q_cx$ lifiting $f'$, i.e. $ eta oo f_0 = f' oo epsilon $
  which is unique up to a chain homotopy equivalence. (Any two choices of lifting are homotopic.)
]

#proof[// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAAUB9ACjAGoAjAEoQAX1LpMufIRQDyVWoxZsAWpzAACbuxHjJ2PASLyBi+s1aIQ6rdwCKeiSAyGZRAEykz1CyuvEYs6u0sYoZD5Klmz2PPzCYoowUADm8ESgAGYAThAAtkhkIDgQSPJR-iBQQVm5BYjlJUheFVYgmRo17XXN1E2IAMz63fmFfaWIACzUDFhgbVB0cAAWySC+ym0wAB5YcDgIwzmjU+O9rWzVohSiQA
#align(center, commutative-diagram(
  node((0, 0), [$P_(n+1)$]),
  node((0, 1), [$Z_n (P)$]),
  node((1, 1), [$Z_n (Q)$]),
  node((1, 2), [$0$]),
  node((1, 0), [$Q_(n+1)$]),
  arr((0, 0), (0, 1), [$d_(n+1)$]),
  arr((0, 1), (1, 1), [$f_n$]),
  arr((1, 1), (1, 2), []),
  arr((0, 0), (1, 0), [$exists f_(n+1)$], "dashed"),
  arr((1, 0), (1, 1), [$d'_(n+1)$]),
)) Set   $f_(-1) = f'$.
  Suppose $f_n$ has been constructed, we have
  $d_(n+1)$ mapping $P_(n+1)$ to $B_n (P)$ which is contained in $Z_n (P)$. 
  Take any $a in Z_n (P)$, then $ d'_n (f_n (a)) = f_(n-1) (d_n (a)) = f_(n-1) (0) = 0 $
  hence $f_n (a) in Z_n (Q)$, or $f_n$ sends $Z_n (P)$ to $Z_n (Q)$. Now due to the exactness of $Q_cx$, $d'_(n+1)
  : Q_(n+1) -> Z_n (Q)$ is an epimorphism. Since $P_(n+1)$ is an projective object,
  the morphism $f_(n+1) : P_(n+1) -> Q_(n+1)$ exists such that the above diagram commutes.

  For the uniqueness, let $h: P_cx -> Q_cx$ be another chain map lifting $f'$. We want to construct homotopy $s$ with terms $s_n: P_n -> Q_(n+1)$  such that 
  $ h_n - f_n = d'_(n+1) s_n + s_(n-1) d_n $
  for all $n >= -1$. 
  
  For the base case, set $f_(-1) = h_(-1) = f'$, $d_0 = epsilon, d_(-1) = 0, d'_0 = eta, d_(-1) = 0$. We construct $s_(-2) = s_(-1) = 0$, and the claim is trivially true for $n = -1$. 

  For the induction step, assume we have constructed $s_i$ for $i <= n$,

  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZAJgBoAGAXVJADcBDAGwFcYkQAFAfQAowBqAIwBKEAF9S6TLnyEUgitTpNW7bn37FREqdjwEiAZkU0GLNok5dCOkBj2yiAFhPLza3mAC0I8ZLvS+nLICoJKZqqWAIqemtr+9jIGKGRhpioWIDEavraJQUakaW6RWZ7xuknBLsURmdneuQmBjijkrnXsfpUFbUXhGV15LcnIAKwdg5bdAQ6jE7VTIOJKMFAA5vBEoABmAE4QALZILiA4EEgTJZlQAOSxWjP7R5c050gAbOnulnexTbsDsdEF8zhdEAB2b6lP58CogZ7AhRgpDta7sKAPeGI1FvcFkdG-f7YoFIAnvRDGQkgTFwp6kxBoilXTqWAAWxIABF5OTtiaIaIx6AAjGCMDgjOQgLBgbCwekvRDk8Gg1kgDlw7m88ogQUisUSuZSmVyti2HGUvFIKHUjWNYRavl8HwCkBC0XiyXsE1YeXmhnIimnNV2uKOrG6t36z1G72y31m-wWgAcVsQgn9ioAnGmnJngVSKYJyPnrWnBBmkwzla83TKbvQ4Gy1pG1XBrAqC2nVUt287fIL6xjG82oJ3cSjEKdGEPfiOW9DMn2BLlKGIgA
#align(center, commutative-diagram(
  node((0, 2), [$P_(n+1)$]),
  node((0, 1), [$P_(n+2)$]),
  node((0, 3), [$P_n$]),
  node((0, 4), [$P_(n-1)$]),
  node((1, 1), [$Q_(n+2)$]),
  node((1, 2), [$Q_(n+1)$]),
  node((1, 3), [$Q_(n)$]),
  node((1, 4), [$Q_(n-1)$]),
  node((0, 0), []),
  node((1, 0), []),
  node((0, 5), []),
  node((1, 5), []),
  arr((1, 1), (1, 2), [$d'_(n+2)$]),
  arr((1, 2), (1, 3), [$d'_(n+1)$]),
  arr((1, 3), (1, 4), [$d'_(n)$]),
  arr((0, 1), (0, 2), [$d_(n+2)$]),
  arr((0, 2), (0, 3), [$d_(n+1)$]),
  arr((0, 3), (0, 4), [$d_(n)$]),
  arr((0, 2), (1, 2), [$h_(n+1) - f_(n+1)$], label-pos: 0),
  arr((0, 3), (1, 3), [$h_(n) - f_(n)$], label-pos: 0),
  arr((0, 4), (1, 4), [$h_(n-1) - f_(n-1)$], label-pos: 0),
  arr((0, 1), (1, 1), [$h_(n+2) - f_(n+2)$], label-pos: 0),
  arr((0, 0), (0, 1), []),
  arr((1, 0), (1, 1), []),
  arr((0, 4), (0, 5), []),
  arr((1, 4), (1, 5), []),
  arr((0, 3), (1, 2), [$s_n$], label-pos: 0, "dashed"),
  arr((0, 4), (1, 3), [$s_(n-1)$], label-pos: 0, "dashed"),
  arr((0, 2), (1, 1), [$s_(n+1)$], label-pos: 0, "dashed"),
))

(Again, only the solid lines commute.)
We want to show the existence of $s_(n+1)$ which satisfies

$ d'_(n+2) s_(n+1) = h_(n+1) - f_(n+1) - s_n d_(n+1) $

We claim that $(h_(n+1) - f_(n+1) - s_n d_(n+1))$ sends $P_(n+1)$ to $Z_(n+1) (Q)$. First notice that this suffices to prove the existence of $s_(n+1)$, as we now have

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQAFAfQAowBqYgEoQAX1LpMufIRRli1Ok1bsAWrwHCABDwCKI8ZOx4CRcqQU0GLNohC6N-AEwGJIDMZlEnFxdZV25GKKMFAA5vBEoABmAE4QALZI5iA4EEg+IIxYYLYgUPRwABahIFbKeXCOwmVZ9ABGMIwcUiayIDnYsGJucYkZNGlIZEo27FAA5HzOrjHxSYgpQ4gj-nlF1UJaALRa0Zs7WlVgWlCbtYwNTS2epnaMMNE4PXP9K4PpiADMopSiQA
#align(center, commutative-diagram(
  node((0, 1), [$P_(n+1)$]),
  node((1, 1), [$Z_(n+1) (Q)$]),
  node((1, 0), [$Q_(n+2)$]),
  node((1, 2), [$0$]),
  arr((0, 1), (1, 0), [$s_(n+1)$], label-pos: 0, "dashed"),
  arr((1, 0), (1, 1), [$d'_(n+2)$]),
  arr((0, 1), (1, 1), [$h_(n+1) - f_(n+1) - s_n d_(n+1)$], label-pos: left),
  arr((1, 1), (1, 2), []),
))

where $P_(n+1)$ is projective and $d'_(n+2) : Q_(n+2) -> Z_(n+1) (Q)$ is an epimorphism. 

Now $ 
  d'_(n+1) (h_(n+1) - f_(n+1) - s_n d_(n+1)) &= d'_(n+1) (h_(n+1) - f_(n+1)) - d'_(n+1) s_n d_(n+1) \
  &= d'_(n+1) (h_(n+1) - f_(n+1)) - (h_n - f_n - s_(n-1) d_n) d_(n+1) 
  \ &= d'_(n+1) (h_(n+1) - f_(n+1)) - (h_n - f_n) d_(n+1)
  \ &= 0
$

  Hence $(h_(n+1) - f_(n+1) - s_n d_(n+1))$ sends $P_(n+1)$ to $Z_(n+1) (Q)$.

  // The uniqueness is an exercise. 
  See @weibel[Comparison Theorem 2.26], @rotman[Theorem 6.16].
]

#lemma(name: "Horseshoe Lemma")[Suppose given a commutative diagram
#align(center,image("imgs/2023-11-04-13-51-57.png",width:50%))
 where the
column is exact and the rows are projective resolutions. Set $P_n eq$
$P_n^prime xor P_n^(prime prime)$. Then the $P_n$ assemble to form a
projective resolution $P$ of $A$, and the right-hand column lijts to an
exact sequence of complexes
$ 0 arrow.r P' arrow.r^i P arrow.r^pi P'' arrow.r 0 comma $
where $i_n colon P_n^prime arrow.r P_n$ and
$pi_n colon P_n arrow.r P_n^(prime prime)$ are the natural inclusion and
projection, respectively.




  // Suppose $ses(A', A, A'')$ is a #sest, and $P'_cx rgt(epsilon') A'$ and $P''_cx rgt(epsilon'') A''$ are projective resolutions. Then there exists a projective resolution $P rgt(epsilon) A$ such that $P_n = P'_n ds P''_n$ such that 

  // $
  //   0 -> P' rgt(i) P rgt(pi) P'' -> 0
  // $
  // is a #sest of complexes where $i$ is the canonical inclusion (mono) and $pi$ is the canonical proj.
]
// (Some remark...)
#proof[
  Lift $epsilon.alt^(prime prime)$ to a map
$P_0^(prime prime) arrow.r A$; the direct sum of this with the map
$i_A epsilon.alt^prime colon P_0^prime arrow.r A$ gives a map
$epsilon.alt colon P_0 arrow.r A$. The diagram $lr((ast.basic))$ below
commutes.
#align(center,image("imgs/2023-11-04-13-59-23.png",width:80%))
The right two columns of $lr((ast.basic))$ are short exact sequences.
The Snake Lemma shows that the left column is exact and that
$"coker"lr((epsilon.alt)) eq 0$, so that $P_0$ maps onto $A$. This
finishes the initial step and brings us to the situation
#align(center,image("imgs/2023-11-04-13-56-51.png",width:40%))
The filling in of the \"horseshoe\" now proceeds by induction.

See @weibel[Horseshoe Lemma 2.2.8].
]
#endlec(8)

= $delta$-functors

See @weibel[Section 2.1].

#definition[
  Let $cA, cB$ be abelian categories. A *homological $delta$-functor* (resp. *cohomological $delta$-functor*) between $cA$ and $cB$ is a collection of of additive functors $T_n: cA -> cB$ (resp. $T^n : cA -> cB$)  for $n >= 0$ together with morphisms 
  $ delta_n : T_n (C)  -> T_(n-1)(A) $ 
  $ "(resp." quad delta^n : T^n (C)  -> T^(n+1)(A) ")" $
   defined for each #sest $ses(A, B, C)$ in $cA$, such that 
  #enum(block(width: 100%)[
    $ ... -> T_(n+1)(C) ->^delta T_n (A) -> T_n (B) -> T_n (C) rgt(delta) T_(n-1)(A) -> ... $
    $ "(resp." ... -> T^(n-1)(C) ->^delta T^n (A) -> T^n (B) -> T^n (C) rgt(delta) T^(n+1)(A) -> ... ")" $
    is a #lest and $T_0$ is right exact (resp. $T^0$ is left exact);
  ],
  [
    For each morphism of #sess from $ses(A', B', C')$ to $ses(A, B, C)$, the $delta$'s give a commutative diagram 
    #align(center,image("imgs/2023-11-06-21-12-16.png",width:80%))
  ])
]

#example[
  Homology gives a homological $delta$-functor
  $ 
    H_ast : Ch_(>= 0)(cA) -> cA
  $

  Cohomology gives a cohomologicla $delta$-functor $ H^ast : Ch^(>= 0) (cA) -> cA $
]

#example[
   If $p$ is an integer, the functors
$T_0 lr((A)) eq A slash p A$,
$ T_1 lr((A)) eq zws_p A equiv brace.l a in A colon p a eq 0 brace.r $
and $T_n = 0$ for $n >= 2$
fit together to form a homological $delta$-functor, or a cohomological
$delta$-functor \(with $T^0 eq T_1$ and $T^1 eq T_0$ ) from $Ab$
to $Ab$. To see this, apply the Snake Lemma to #align(center,image("imgs/2023-11-06-21-52-48.png",width:50%)) to get the exact
sequence
$ 0 arrow.r zws_p A arrow.r zws_p B arrow.r zws_p C arrow.r^delta A slash p A arrow.r B slash p B arrow.r C slash p C arrow.r 0 $


  // For any integer $p$, define $T_(0)(A) = A over p A$ and $T_1(A) = p A = {a in A | p a = 0}$ and $T_n = 0$ for $n >= 2$ gives a homological $delta$-functor from $Ab -> Ab$, by the Snake Lemma,
  // TODO
]

#let dftor = [$delta$-functor]

#definition[
  A *morphism* $S->T$ of $delta$-functors is a collection of natural transformations $S_n -> T_n$ (resp. $S^n -> T^n$) which commutes with $delta$.  This is equivalent to saying that there is a commutative ladder diagram connecting
the long exact sequences for $S$ and $T$ associated to any short exact
sequence in $cA$.]
#definition[
   A homological $delta$-functor $T = {T_n}$ is *universal* if, given any other $delta$-functor $S = {S_n}$ and a natural transformation $f_0: S_0 -> T_0$, there exists a unique morphism $ {f_n : S_n -> T_n} $ of #dftor extending $f_0$. 

  // A cohomological #dftor $T$ is *universal* if given $S$ and $f^0 : T^0 -> S^0$, there exists a unique extension $T->S$.

  A cohomological $delta$-functor $T$ is *universal* if, given $S$ and
$f^0 colon T^0 arrow.r S^0$, there exists a unique morphism
$T arrow.r S$ of $delta$-functors extending $f^0$.
]

#example[
  If $F : cA -> cB$ is exact, then $T_0 = F$ and $T_1 = 0$ for $n != 0$ defines a universal #dftor.
]

How to construct a universal #dftor? In categories with enough projectives or injectives, derived functors work.


== Derived Functors 

The main object of this section is to show that left derived functors, defined as follows, are homological $delta$-functors.
#definition[
Let $F : cA -> cB$ be a right exact functor between two abelian categories. Assume $cA$ has enough projectives. For any $A in ob cA$, pick a projective resolution $P_(cx) ^A -> A$. Define $ L_i F(A) := H_i (F(P_cx^A))  $ as the *$i$-th left derived functor*.

]

Since $F(P_1) -> F(P_0) arrow F(A) -> 0$ is exact, we always have $L_0 F(A) iso F(A)$.


#lemma[
  If $P_cx -> A$ and $Q_cx -> A$ are two projective resolutions, then there is a canonical isomorphism 
  $ H_i (F(P_cx)) bij H_i (F(Q_cx)) $
]
This means the choice in the definition does not matter.

#proof[
  By the comparison lemma, there is a chain map $f: P_cx -> Q_cx$ lifting the identity $id_A : A->A$, unique up to homotopy, giving $f_ast : H_i F(P_cx) -> H_i F(Q_cx)$. Any other lift $f' : P_cx -> Q_cx$ is chain homotopic to $f$ so $f_ast = f'_ast$.
  (TODO)
  So $f_ast$ is canonical. We can also lift the identity to a map $g: Q_cx -> P_cx$, so we get $g_ast : H_i F(Q) -> H_i F(P)$. Notice we can compose the two maps and $g oo f : P_cx -> P_cx$ and $id_P : P_cx -> P_cx$ are both lifts of the identity. Then we apply the comparison theorem to $P$ itself, so $ g_* f_* = (g f)_* = (id_P)_* $ and similarly 
  $ f_* g_* = (id_Q)_* $
]

#corollary[
  If $A$ is projective, then $L_i F (A) = 0$ for $i != 0$.
]

#lemma[
  If $f : A' -> A$ a morphism in $cA$, then there is a natural map $ L_i F(f) : L_i F(A') -> L_i F(A) $ 
]
#proof[
  Let $P'_cx -> A'$ and $P_cx -> A$ be chosen resolutions. So $f$ lifts to a map $tilde(f) : P'_cx -> P_cx$. This gives a map $tilde(f_ast) : H_i F(P'_cx) -> H_i F(P_cx)$ as any other lift is homotopic to $tilde(f)$, the map $tilde(f_ast)$ is independent of the lift. 
]

#proposition[
  $L_i F$ is an additive functor from $cA$ to $cB$. 
]
#proof[
  It is the same again. $id_P$ lifts $id_A$. So $L_i F(id_A) = id_(L_i F(A))$. Given $A' rgt(f) A rgt(g) A''$ and lifts $tilde(f), tilde(g)$, then $tilde(g) oo tilde(f )$ is a lift of $g oo f$, so $g_ast oo f_ast = (g f)_ast$.  So $L_i F$ is a functor. 
  
  If $f_1, f_2 : A' -> A$ with lifts $tilde(f_1), tilde(f_2)$, then $tilde(f_1) + tilde(f_2)$ lifts $f_1 -> f_2$, so $f_(1 ast) + f_(2 ast) = (f_1 + f_2)_ast$. So $L_i F$ is additive.
] 

#theorem[
  ${L_i F}$ form a homological #dftor. They form a universal homological #dftor.
]
We never use the fact that it is unviersal. Check the book for proof.
#proof[
  Given a #sest $ ses(A', A, A'') $ and projective resolutions $P' -> A'$ and $P'' -> A''$, there is a projective resolution $P-> A$ such that $ses(P', P, P'')$ is a #sest of resolutions and $ses(P'_n, P_n, P''_n)$ is split (being split is important!) by the Horseshoe Lemma. As $F$ is additive, $
    ses(F(P'_n), F(P_n), F(P''_n))
  $
  is still exact in $cB$. Hence 
  $
    ses(F(P'), F(P), F(P''))
  $
  is a #sest of complexes. Hence we have the connecting maps and it gives a #lest.
]
#endlec(9)
#definition[
  Let $F : cA  -> cB$ be a left exact functor between two abelian categories. Assume $cA$ has enough injectives and for any $A in cA$ we have injective resolution $A -> I^cx$. Then the *$i$-th right derived functor*  is
  $ R^i F (A) := H^i (F (I^cx)) $
]
// If $F : cA  -> cB$ is left exact, we can define the right derived functor $R^i F(A) = H^i F(I)$ for $A -> I^cx$.

Note: $R^i F(A) = (L_i F^op)^op (A)$.
== Defining $Ext$ and $Tor$ 

#definition[
  Let $cA$ be an abelian category.
Recall that $Hom(A)(A, -): cA -> Ab$ is left exact.
  If $cA$ has enough injectives, we can define 
  $ Ext_cA^i (A, B):= R^i Hom(A)(A, -)(B) = H^i (Hom(A) (A, I^cx)) $
  where $B -> I^cx$ is an injective resolution.
]
#proposition[
  We have the following equivalences:
  - $B$ is injective;
  - $Hom(A)(-, B)$ is exact;
  - $Ext_cA^i (A, B) = 0$ for $i !=0$ and all $A$;
  - $Ext_cA^1 (A, B) = 0$ for all $A$.

  Similarly,
  - $A$ is projective;
  - $Hom(A)(A, -)$ is exact;
  - $Ext_cA^i (A, B) = 0$ for $i !=0$ and all $B$;
  - $Ext_cA^1 (A, B) = 0$ for all $B$.
]
#proof[
  We need to prove $
    Ext^*_cA (A, B) iso R^ast Hom(A) (-, B)(A)
  $
]

#definition[
  Let $R$ be a ring and $B$ be a left $R$-module. $- tpr B : ModR -> Ab$ is right exact, so we can define  
  $ Tor_n^R (A, B) = L_n (- tpr B) (A) $
]


We will prove: 

$ L_n (- tpr B) (A) iso L_n (A tpr -) (B) $

This is called the balancing of $Tor$. We need two new tools to prove this: mapping cones and double complexes. 

#TODO #lest induced by $Tor$ and $Ext$

= Balancing $Ext$ and $Tor$
== Mapping Cones and Mapping Cylinders
#remark[
In topology,  let $f: X-> Y  $ be a continuous map between two topological spaces. 

  The *topological mapping cylinder* $M_f$ of $f : X-> Y$ is the quotient
  $ ((X times I) product.co Y) over tilde $
  where the equivalence relation $tilde$ is generated by $ (x, 1) tilde f(x)$ for all $x in X$. That is, the mapping cylinder is obtained by gluing one end of $X times I$ to $Y$ via the map $f$. It is often denoted as $(X times I) union.sq_f Y$.

  The *topological mapping cone* $C_f$ of $f : X-> Y$ is the quotient space of the mapping cylinder $(X times I) union.sq_f Y$ with respect to the equivalence relation $(x, 0) tilde (x', 0)$ for all $x, x' in X$. That is, the end of $X times I$ that is not glued to $Y$ is identified as a point.
  #align(center,image("imgs/Mapping_cone.svg",width:30%))
]

On the level of complexes, let $f : B_cx -> Ccx$ be a map of chain complexes.
#definition[
 Define the *mapping cone* of $f$ as the complex chain $ cone(f)_n = B_(n-1) plus.circle C_n $ 
 with differential given by $ d(b, c) = (-d(b), d(c) - f(b)) $ for $b in B_(n-1)$ and $c in C_n$.
We could also write in the form of a matrix:
$
mat(-d_b, 0; -f, d_c) : vec(B_(n-1), C_n) -> vec(B_(n-2), C_(n-1))
$
]

There is a #sest:
$ ses(C, cone(f), B[-1], f: i, g: delta) $
where the first map is $i: c mapsto (0, c)$ and the second map $delta : (b, c) |-> -b$. Recalling $H_(n+1)(B[-1]) = H_n (B)$, we get the corresponding #lest in homology:

$ 
 ... -> H_(n+1) (cone(f)) ->^(delta_ast)  H_n (B) ->^diff H_n (C) -> H_n (cone(f)) -> ...
$

#lemma[ The connecting morphism
  $diff = f_ast$.
]
#proof[
  We have $diff = i^(-1) d_(cone(f)) delta^(-1)$ due to the proof of the connecting homomorphism.
  Let $b in B_n$ be a cycle. We can lift it to $(-b, 0)$ in $cone(f)$. Apply the differential of $cone(f)$ to get $(d b, f b) = (0, f b)$. Thus $diff[b] = [f b] = f_ast b$.
]
#corollary[
  $f: B_cx -> C_cx$ is a quasi-isomorphism if and only if $cone(f)$ is exact. <cone-qi>
]

#definition[
  The *mapping cylinder* of $f$ is defined as the chain complex $cyl(f)_n = B_n xor B_(n-1) xor C_n$. The differential can be represented by the matrix 
  $
    mat(d_B, id_B, 0;0, -d_B, 0; 0, -f, d_C)
  $
]
#remark[
Let $0->B->^f C->^g D-> 0$ be a #sest of complexes. Then $phi: cone(f) -> D$ has $phi(b, c)-> g(c)$.#align(center,image("imgs/2023-11-10-12-30-40.png",width:50%)) You can prove $cyl(f)-> C$ is a quasi-isomorphism and also $phi$ is quasi-isomorphism. (This is non-examinable.)
]
== Double Complexes and Total Complexes
Recall that $Ch(cA)$ is also an abelian category. Then we may look at $Ch(Ch(cA))$. But what we define next is slightly different from that.
#definition[
  A *double complex* (or *bicomplex*) $C = C_(cx cx)$ in an abelian category $cA$ is a family ${C_(p, q)}$ of objects in $cA$ with maps $d^h : C_(p, q) -> C_(p-1, q)$ and $d^v : C_(p, q) -> C_(p, q-1)$ such that $ (d^h)^2 = (d^v)^2 = 0 $ and $ d^v d^h + d^h d^v = 0 $ (anti-commute!).
]
#align(center,image("imgs/2023-11-12-16-01-47.png",width:50%))
#remark[
  If you replace $d^v_(p, q)$ by $(-1)^p d^v_(p, q)$ we get that the square commute which gives an isomorphism of categories between bicomplexes and $Ch(Ch(cA))$.
]
#definition[
  Let $C_(bullet bullet)$ be a double complex. We say that
$C_(bullet bullet)$ is an *upper half-plane complex* if there is some
$q_0$ such that $C_(p q) eq 0$ for all $q lt q_0$. Similarly,
$C_(bullet bullet)$ is a *right half-plane complex* if there is some $p_0$
such that $C_(p q) eq 0$ for all $p lt p_0$.
]

#definition[
  Given $C = {C_(p, q)}$, we can define the *total complex*
  $ Tot^Pi (C)_n = product_(p + q = n) C_(p, q) $
  as well as the finite version 
  $ Tot^xor (C)_n = plus.circle.big _(p+q=n) C_(p, q) $
  with differential $ d= d^h + d^v $
We have that $d^2 = 0$. (which is why we define double complex in the anti-commuting way) @rotman[Lemma 10.5]
]

The total complex is illustrated by the colours in the following diagram; each “diagonal
slice” is given a different colour. For example, $Tot(C_(cx cx))_0$ is the direct sum of all the
red terms @notes[Definition 8.6]. This diagram also helps explain how the differential of the total complex works. For example, take $ c = (..., c_(-1, 1), c_(0, 0), c_(1, -1), ...) in product_p C_(-p, p) = Tot(C)_0 $
Then 
$ d (c) = ( ...,  
underbrace(d^v (c_(-1, 1)) + d^h (c_(0,0)), in C_(-1, 0)) , 
underbrace(d^v (c_(0, 0)) + d^h (c_(1, -1)), in C_(0, -1)), ... ) in Tot(C)_(-1) $
#align(center,image("imgs/2023-11-12-16-04-08.png",width:50%))

#endlec(10)

#lemma(name: "Acyclic Assembly Lemma")[
  Let $C = {C_(p, q)}$ be a double complex. If
  + $C$ is an upper half-plane complex with exact columns, or
  + $C$ is a right half-plane complex with exact rows,
  then $Tot^Pi (C)$ is acyclic.
  If 
  3. $C$ is an upper half-plane complex with exact rows, or
  4. $C$ is a right half-lane complex with exact columns,

  then $Tot^xor (C)$ is acyclic.
  <aal>
]
#proof[
  We only prove (1) here and the other conditions follow similarly.
  Let $C$ be an upper half-plane bicomplex with exact columns. We will show that 
  $ H_0 (Tot^Pi (C)) = 0 $
  and by translating $C$ left and right, this will indicate that $H_n (Tot^Pi (C)) = 0$ for all $n$ and hence prove the result.
  Let $ c = (..., c_(-2, 2), c_(-1, 1), c_(0, 0)) in product C_(-p, p) = Tot^Pi (C)_0 $ be a $0$-cycle (i.e. $d(c) = 0$).
  We will use indcution to find elements $b_(-p, p+1)$ such that $ d^v (b_(-p, p+1)) + d^h (b_(-p+1, p)) = c_(-p, p) $

  Let $b_(10) = 0$ for $p = -1$. Since the $0$-th column is exact, there is a $b_01 in C_01$ so that $d^v (b_01) = c_00$. 

  By induction, suppose we have found $b_(-p+1, p)$ and want to find $b_(-p, p+1)$. We compute that 
$ d^v lr((c_(minus p comma p) minus d^h lr((b_(minus p plus 1 comma p))))) & eq d^v lr((c_(minus p, p))) plus d^h d^v lr((b_(minus p plus 1 comma p)))\
 & eq d^v lr((c_(minus p, p))) plus d^h lr((c_(minus p plus 1 comma p minus 1))) minus d^h d^h \(b_(minus p plus 2 comma p minus 1 )) \
 & eq 0 dot.basic $

 where $d^v lr((c_(minus p, p))) plus d^h lr((c_(minus p plus 1 comma p minus 1))) = 0$ because $d(c) = 0$.

Since the $(minus p)$-th  column is exact, there is a
$b_(minus p comma p plus 1)$ so that
$ d^v lr((b_(minus p comma p plus 1))) eq c_(minus p comma p) minus d^h lr((b_(minus p plus 1 comma p))) $
as desired. Now assembling all $b_(-p, p+1)$ gives 

$ b = (..., b_(-1, 2), b_(0, 1), b_(1, 0)) in product C_(-p, p+1) = Tot^Pi (C)_(1) $ such that $d (b) =  c$, which proves that $H_0 (Tot^Pi (C)) = 0$. 

See @weibel[Lemma 2.7.3].
]

#remark[
  Spectral sequences. This lemma is a consequence of sepectral sequences. 
]


== Balancing $Tor$
#definition[
Suppose $P_cx$ and $Q_cx$ are complexes of right/left-$R$ modules. We can form a double complex of abelian groups which we call the *tensor product double complex*, denoted as $P_cx tpr Q_cx$, where the $(p, q)$ term is $P_p tpr Q_q$ and $d^h = d_P tp 1$ and $d^v = (-1)^p tp d_Q$. The sign trick is to make this anticommute. ]


#theorem[ For all $n$,
  $ L_n (A tpr -)(B) iso L_n (- tpr B)(A) = Tor_n^R (A, B) $ 
]
#proof[ @weibel[Theorem 2.7.2].
  #align(center,image("imgs/2023-11-23-03-00-04.png",width:80%))
  Choose a projective resolution $P_cx rgt(epsilon) A$ in $ModR$ and a project resolution $Q_cx rgt(eta) B$ in $RMod$. 
  We can view $A, B$ as complexes concentrated in degree $0$. Look at the double complexes $P_cx tpr Q_cx$, $A_cx tpr Q_cx$ and $P_cx tpr B_cx$, and we get morphisms of bicomplexes $epsilon tp Q: P tpr Q -> A tpr Q$ and $Q tp eta: P tpr Q -> P tpr B$. Now we want to show that maps
  $ epsilon tp Q : Tot^xor (P tpr Q) -> Tot^xor (A tpr Q) = A tpr Q $ and
  $ P tp eta: Tot^xor (P tpr Q) -> Tot^xor (P tpr B) = P tpr B $
  are quasi-isomoprhisms, which would give isomorphisms on homology and thus prove the result, i.e.

  $ H_ast (Tot^xor (P tpr Q)) iso H_ast (A tpr Q) = L_ast (A tpr - ) (B) $ 
  $ H_ast (Tot^xor (P tpr Q)) iso H_ast (P tpr B) = L_ast (- tpr B ) (A) $  

  If we look at the double complex $C$ obtained from $P tpr Q$ by adding $A tpr Q[-1]$ in the column $p = -1$ using the augmentation, we get that $Tot(C)[1]$ is the mapping cone of $ epsilon tp Q : Tot(P tpr Q) -> A tpr Q $

  To show that $epsilon tp Q$ is a quasi-isomorphism, we need to show $cone(epsilon tp Q) = Tot(C)[1]$ is acyclic by #thmref(<cone-qi>)[Corollary]. Note that $- tpr Q_p$ is exact as $Q_p$ are projective. So every row of $C$ is exact and so $Tot^xor (C)$ is exact by #thmref(<aal>)[Acyclic Assembly Lemma]. So $epsilon tp Q$ is a quasi-isomorphism. 
  Similarly, we can show that $P tp eta$ is also a quasi-isomorphism.
  // ($Q$ means $id_Q$ in proper places)
]

== Balancing $Ext$

#definition[
Given a chain complex $P$ and a cochain complex $I$, we can form a double complex $ hom(P, I) = {hom (P_p, I^q)} $

For $f : P_p -> I^q$, $a in P_p$ we have $(d^h f) (a) = f (d a)$ and $(d^v f)(a) = (-1)^(p+q+1) d f(a)$. 

Then we define

  $ Tot^Pi (hom(P, I)) $ as the *$hom$ cochain complex*.
]

#remark[If $C, D$ are chain complexes and we reindex $D$ to be a cochain complex. Then $H^n Tot^Pi hom (C, D)$ is the group of chain homotopy eq classes of morphisms $C -> D[-n]$.]

Check: #TODO

$ hom_Ab (Tot^xor (P tp Q), I) iso hom_R (P , Tot^Pi (hom_Ab (Q, I))) $
$I$ cochain complex of abelian groups and $P, Q$ are chain complexes of right/left $R$-modules.


#endlec(11)

#theorem[ For all $n$,
  $ Ext^n_R (A, B) = R^n hom_R (A, -) (B) iso R^n hom_R (-, B) (A) $
] 
#proof[
  #align(center,image("imgs/2023-11-23-03-27-44.png",width:80%))
  Take projective resolution $P_cx -> A$ and injective resolution $B -> I^cx$. We can view $A$ and $B$ as complexes concentracted at degree $0$. We can form double cochain complexes $hom(P, I)$, $hom(A, I)$ and $hom(P, B)$. Then we need to show 
  $ hom(A, I) -> Tot^Pi hom(P, I) $ and 
  $ hom(P, B) -> Tot^Pi hom(P, I) $ are quasi-isomorphisms. This is equivalent to the cones of the maps being acyclic. 

  We observe that $cone(hom (A, I) -> Tot^Pi hom (P, I))$ is the total complex of the double complex $hom(P, I)$ with $hom(A, I)[-1]$ added.  For this augumented double complex, we see that $Tot^Pi$ is exact by #thmref(<aal>)[the Acyclic Assmebly Lemma] since $hom(P_p, -)$ is exact and $hom(-, I^q)$ is exact. Then 

  $ R^ast hom(A, -) (B) = H^ast hom (A, I) = H^ast Tot^Pi ( hom(P, I))  \ iso H^ast hom(P, B) = R^ast hom(-, B) (A) $
  #TODO review
]

= Ring Structures on $Ext$
== Reinterpreting $Ext$
#lemma[.
  Let $P_cx -> M$ and $Q_cx -> N$ be projective resolutions, then
  $
    Ext^ast_R (M, N) = H^ast Tot^Pi (hom_R (P_cx, Q_cx))
  $
]
The proof is similar to above and can be seen @notes[Lemma 8.16]. A useful diagram is 
#align(center,image("imgs/2023-11-23-22-22-07.png",width:80%))

Note that the $n$-th term of the total _cochain_ complex can be written explicitly as 
$
  [Tot^Pi (hom_R (P_cx, Q_cx))]^n = product_(p >= max{0, n}) hom (P_p, Q_(p - n))
$
Applying cohomology to this total cochain complex yields $Ext^ast _R (M, N)$. 

#corollary[
  $Ext_R^n (M, N)$ is isomorphic to the chain homotopy classes of chain maps $P_cx -> Q_cx [-n]$, namely the 
   quotient of the module of chain maps $P_cx -> Q_cx [-n]$ by the submodule of null homotopic chain maps.
]
A detailed proof can be seen @notes[Section 9.1]. 
To see this intuitively, notice a chain map $P_cx -> Q_cx [-n]$ is a collection of 
$hom (P_p, Q_(p - n))
$ for all suitable index $p$, subject to being commutative with the differentials. 
Hence, it is an element of $[Tot^Pi (hom_R (P_cx, Q_cx))]^n =: T^n$.
One can show that the commutative condition for a chain map is equivalent to being a cycle in $T^n$. 
Further, the chain map is null homotopic if and only if it is a boundary in $T^n$.
Cohomology is cycles quotient by boundaries, which is now the same as "chain maps" quotient by "null homotopic chain maps".

== Yoneda Product


Given $R$-modules $A, B, C$ with projective resolutions $P_cx -> A$, $ Q_cx -> B$, $ T_cx-> C$, we see that $Ext^i_R\(A, B) $ is the chain homotopy classes of chain maps $P -> Q[-i]$, and $Ext^j_R\(B, C)$ is the chain homotopy classes of chain maps $Q -> T[-j]$. 

Note that $hom(Q, T[-j]) iso hom(Q[-i], T[-i - j])$, namely the translation (shifting) functor is an isomorphism on the category of chain complexes and it preserves chain homotopy. 
Also homotopy commutes with composition
of maps. 
Hence the composition $P -> Q[-i] ->T[-i-j]$ gives a map $ ⌣ :  Ext_R^i (A, B) times Ext_R^j (B, C) -> Ext^(i+j) (A, C) $ 

One can show that this is associative and biadditive. 

#remark[
We have shown $D^- (RMod) iso K^- ("Proj" RMod)$.
]

$Ext_R^ast (A, A) = plus.circle.big_i Ext_R^i (A, A)$ is a graded ring. For any $B$, $Ext_R^ast (A , B) = plus.circle.big_i Ext^i (A, B)$ is a graded module over the ring. 

#TODO what is even a graded ring 

#TODO alternative definition of Yoneda product, "gluing sequences"

= $Tor$ and Flatness

#definition[
  A #lrm $B$ is *flat* if $ - tpr B$ is exact. A #rrm $A$ is *flat* if $  A tpr -$ is exact. 
]

#remark[
  #TODO link to algebraic geometry, algebraic continunity
//   In some sense flatness gives "continuity". It appears in algebraic geometry.
// Assume $R$ is commutative, and let $M$ be an $R$-module. Then $tilde(M)$ quasi- ?? sheaf on $"Spec"(R)$.
]

// #proposition[
//   Free modules are flat.
// ]
// #proof[
//   Take free module $plus.circle.big _I R$ and any module $M$, then 
//   $
//     M tpr plus.circle.big _I R iso plus.circle.big_I M tpr R iso plus.circle.big_I M
//   $
//   The functor $plus.circle.big_I$ is exact.
// ]

// #proposition[
//   Projective modules are flat.
// ]
// #proof[
//   Let $P$ be a projective module, then there exists module $Q$ such that $P xor Q$ is free. #TODO @rotman[Propositin 3.46]
// ]

// #remark[
//   We already used that projective modules are flat. First we have free modules are flat. Second, if $P xor Q$ is free (i.e. $P$ is projective) then $- tpr P$ is exact. 
// ]

#proposition[
  Let $B$ a #lrm. 
  The followings are equivalent: 
  + $B$ is flat;
  + $Tor_n^R (A, B) = 0$ for all $n > 0$ and all $A$;
  + $Tor_1^R (A, B) = 0$ for all $A$.
  <flat-tor>
]
#proof[@notes[Lemma 6.26].
(1) $=>$ (2). Suppose that $B$ is flat. Let $F_cx arrow.r A$ be a free
resolution of $A$. Since $minus times.circle_R B$ is exact, the sequence
$ dots.h arrow.r F_2 times.circle_R B arrow.r F_1 times.circle_R B arrow.r F_0 times.circle_R B arrow.r A times.circle_R B arrow.r 0 $
is exact, so the homology of
$ dots.h arrow.r F_2 times.circle_R B arrow.r F_1 times.circle_R B arrow.r F_0 times.circle_R B arrow.r 0 $
vanishes in positive degree. 

The implication \(2) $arrow.r.double lr((3))$
is trivial.

Finally, \(3) $arrow.r.double$ \(1) follows from the long
exact sequence of $Tor$, since for any short exact sequence
$0 arrow.r X arrow.r Y arrow.r Z arrow.r 0$, we have that
$ 0 eq "Tor"_1^R lr((Z comma B)) arrow.r X times.circle B arrow.r Y times.circle B arrow.r Z times.circle B arrow.r 0 $
is exact. 
]

#corollary[Every projective module is flat. In particular, every free module is flat.]
#proof[
If $P$ is projective, then $0 arrow.r P$ is a projective
resolution, so $"Tor"_n^R lr((A comma P)) eq 0$ for all $A$ and all
$n gt.eq 1$.
]
Another way to prove the corollary is found @rotman[Propositin 3.46].

  Recall that since the tensor product is left adjoint, it commutes with all colimits. Thus $ (colim_I A_i) tpr B iso colim_I (A_i tpr B) $

  #remark[
    In case the notation seems confusing,
    notice that in cateogry theory we would usually write $colim_I F$, where $F : I -> RMod$ is a functor. Here by $colim_I A_i$ we indicate that $A_i = F(i)$ for all $i in I$.  
  ]



#proposition[
  // For any small category $I$ and any functor $I -> ModR$, we have 
  Let $I$ be a filtered poset (for any $i, j in I$ there exists $k$ such that $i <= k$ and $j <= k$). View $I$ as a small category. Then the functor $ colim_I: Fun(I, RMod) -> RMod $ is exact. 
]
#proof[#TODO Ref: category theory.]

#remark[
  $colim_I$ is not a exact functor in general.
]

#corollary[
  A filtered colimit of flat $R$-modules is flat. 
]
#proof[
  Let $A = colim_I A_i$ where $I$ is a filtered poset and $A_i$ are flat for all $i in I$. We want to show $A$ is flat. If we have #sest $ ses(B_1, B_2, B_3) $ then for all $i in I$, 
  $
    ses(A_i tpr B_1, A_i tpr B_2, A_i tpr B_3)
  $
  Taking $colim_I$, which is exact as $I$ is a filtered poset, yields 
  $
    ses(colim_I (A_i tpr B_1), colim_I (A_i tpr B_2), colim_I (A_i tpr B_3))
  $
  $colim_I$ commutes with tensor products, hence 
  $
    ses((colim_I A_i) tpr B_1, (colim_I A_i) tpr B_2, (colim_I A_i) tpr B_3)
  $
  which is just 
  $
    ses( A tpr B_1, A tpr B_2, A tpr B_3)
  $
  showing $A$ is flat.
]

#example[
  Let $A$ be a torsion free abelian group. Then $A = union A_i$ where $A_i$ are finitely generated subgroups of $A$, so $A_i$ is free and hence flat.  $ A = union A_i = colim A_i $  Hence torsion free abelian groups are flat. #TODO
]

#example[
  Let $s in R$ be a central element of $R$. We can localise $s$ to get $R[s^(-1)]$ (this is the universal ring where $s$ is invertible, which is $colim(R->^s R ->^s R-> ...)$), so this flat $R$-module.

  To generalise, for a set $S$, we form $R[S^(-1)]$, and this is flat as well. #TODO
]

#endlec(12)
#definition[
  $F_cx -> A$ is a *flat resolution* of $A$ if $F_n$ are flat modules for all $n$.
]

#lemma(name: "Flat Resolution Lemma")[
  Let $F_cx -> A$ be a flat resolution of $A$. Then 
  $
    Tor_ast^R (A, B) iso H_ast (F_cx tpr B )
  $
  Similarly, if $F'_cx -> B$ is a flat resolution, then 
  $
    Tor_ast^R (A, B) iso H_ast (A tpr F'_cx)
  $
  
]
#proof[
  By induction. As $- tpr B$ is right exact, we get the result for $n = 0$. Let 
  $
    ses(K, F_0, A)
  $ be a short exact sequence.   If we write $E_cx = (... -> F_2 -> F_1 -> 0)$, then $E_cx -> K$ is a flat resolution of $K$. 

  We can write the #lest induced by $Tor$: 
  $
    ... ->  Tor_n (F_0 , B) -> Tor_n (A , B) -> Tor_(n-1) (K , B) -> Tor_(n-1) (F_0 , B) -> ...
  $
  But $Tor_n (F_0, B) = 0$ for $n >= 1$ by (the dual of) #thmref(<flat-tor>)[Proposition]. 
  Thus, 
  $
    Tor_n (A, B) iso cases(ker (K tp B -> F_0 tp B) quad &n = 1, Tor_(n-1) (K, B) quad &n >= 2)
  $
  For $n=1$, 
  $
    Tor_1 (A, B) = ker (K tp B -> F_0 tp B) = ker ((F_1 tp B) / im(F_2 tp B) -> F_0 tp B) = H_1 (F tp B)
  $
  For $n >= 2$, 
  $
    Tor_n (A, B) iso Tor_(n-1) (K, B) iso H_(n-1) (E tp B) = H_n (F tp B)
  $
  by induction.
]

#remark[
  Why not define $Tor$ with flat resolutions in the first place? The problem is that we have to show it is well defined regardless of the choice of flat resolutions. This may not be as convenient as using projective resolutions. Nevertheless, now we are free to use flat resolutions, a larger class than projective resolutions, for calculations.
]

#definition[
If $F$ is a right exact functor, an object $Q$ is *$F$-acyclic* if $L_i F(Q) = 0$ for all $i != 0$.  
]
#proposition[
If $Q_cx -> A$ is a resolution where $Q_n$ is $F$-acyclic for all $n$, then $L_i F(A) = H_i (F (Q_cx))$. 
]
#proof[
  The proof is exactly the same as above.
]

#remark[#TODO Quillen model structures, fibrations and cofibrations.]

= Universal Coefficient Theorem

How is the homology of $P_cx$ related to the homology of $P_cx tp M$?

#theorem(name: "Künneth Formula")[
  Let $P$ be a chain complex of flat, right $R$-modules such that each submodule $d(P_n)$ of $P_(n-1)$ is also flat. Then for every $n$ and every left $R$-module $M$ there is a #sest 
  
  $
    ses(H_n (P) tpr M, H_n (P_cx tpr M), Tor_1^R (H_(n-1)(P), M))
  $
  
]
#proof[
  We have a #sest 
  $
    ses(Z_n, P_n, d(P_n))
  $
  The associated #lest in $Tor$ shows that $Z_n$ is also flat. Using that 
  $
    Tor_1^R (d(P_n), M) = 0
  $
  gives that 
  $
    ses(Z_n tp M, P_n tp M, d(P_n) tp M)
  $
  is a #sest for every $M$, so we get a #sest for complexes 
  $
    ses(Z_cx tp M , P_cx tp M, d(P)_cx tp M)
  $
  Note that the differential on the complexes  $Z_cx$ and $d(P)_cx$ are zero. We now look at the #lest... #TODO 
] 
#remark[
  These are the games you play with the machine.
]
#theorem(name: "Universal Coefficient Theorem")[
  Let $P$ be a chain complex of free abelian groups, then for every $n$ and every $M$, the Kunneth #sest splits, so $ H_n (P tp M) = H_n (P) tp M ds Tor_1^ZZ (H_(n-1) (P), M) $
]
#proof[
  #TODO

  Note: $P_n -> d(P_n)$ splits. 
]

Recall if $P_cx, Q_cx$ are complexes, we define $P_cx tpr Q_cx$.

Full Kunneth formula. #TODO can't figure out anything now, what an end of world... how can anyone follow these lectures??? 

Koszul resolution

Let $x in R$ be a central element. Let $K(x)$ be the chain complex 
$
  0->R->^x R ->0
$ 
in degrees $0,1$. We call the generator in degree $1$ $e_x$ so $d(e_x) = x$. If $underline(x) = (x_1, ..., x_n)$ is a finite sequence of central elements, define 
$
  K(underline(x)) = (((K(x_1) tpr K(x_2)) tpr) ... tpr K(x_n))
$



#pagebreak()

#bibliography("bib.yml", style: "chicago-author-date")