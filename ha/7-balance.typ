#import "../libs/template.typ": *
= Balancing $Ext$ and $Tor$
== Defining $Ext$ and $Tor$ 

#definition[
  Let $cA$ be an abelian category. Let $A, B in cA$ and let $B -> I_cx$ be an injective resolution.
Recall that $Hom(A)(A, -): cA -> Ab$ is left exact by @hom-left-exact.
  If $cA$ has enough injectives, we define the right derived functor $Ext_cA^i (A, -)$ of $Hom(A)(A, -)$ as
  // #footnote[While $Ext_cA^i (A, -)(B)$ (as well as $Ext_cA^i (-, B)(A)$ defined below) is not a common way of writing, it emphasizes the asymmetry of the construction.]
  $ Ext_cA^i (A, B) = Ext_cA^i (A, -)(B) := R^i Hom(A)(A, -)(B) = H^i (Hom(A) (A, I^cx)) $
  In particular, $Ext_cA^0 (A, B) = Hom(A) (A, B)$.
]

Notice that the contravariant functor $Hom(A)(-, B): cA^op -> Ab$ is also left exact by @hom-left-exact-2. Assume that $cA$ has enough projectives, so $A^op$ has enough injectives. Let $P_cx -> A$ be an projective resolution in $cA$, which can be seen as an injective resolution in $cA^op$. We can thus define another right derived functor $Ext_cA^i (-, B)$, given by
$
  Ext_cA^i (-, B)(A) := R^i Hom(A)(-, B) (A) = H^i (Hom(A)(P_cx, A))
$

The above two constructions are in fact isomorphic, i.e., $Ext_cA^i (A, -)(B) iso Ext_cA^i (-, B)(A)$. In other words,
$
  Ext_cA^i (A, B) := R^i Hom(A)(A, -)(B) iso R^i Hom(A)(-, B) (A)
$
This isomorphism is called the *balancing of $Ext$*. Before proving the balancing of $Ext$, we present some properties of $Ext$ that the balancing gives.

#proposition[
  Let $ses(K, L, M)$ be a short exact sequence in $cA$ and let $A, B in cA$. Then we have the induced long exact sequences
  $
    0 -> Hom(A) (A, K) ->  Hom(A) (A, L) ->  Hom(A) (A, M) -> \ Ext_cA^1 (A, K) ->  Ext_cA^1 (A, L) ->  Ext_cA^1 (A, M) -> ...
  $
  and 
  $
    0 -> Hom(A) (K, B) ->  Hom(A) (L, B) ->  Hom(A) (M, B) -> \ Ext_cA^1 (K, B) ->  Ext_cA^1 (L, B) ->  Ext_cA^1 (M, B) -> ...
  $
]
#proof[
  Simply notice that ${Ext_cA^i (A, -)}_(i>=0)$ and ${Ext_cA^i (-, B)}_(i>=0)$ form two cohomological $delta$-functors.
]

#proposition[
  The followings are equivalent:
  + $B$ is injective;
  + $Hom(A)(-, B)$ is exact;
  + $Ext_cA^i (A, B) = 0$ for $i !=0$ and all $A$;
  + $Ext_cA^1 (A, B) = 0$ for all $A$.]

#proof[
  (1) $<=>$ (2) by the definition of injective objects.

  (1) $=>$ (3) by applying the dual of @projective-left-zero to $Ext_cA^i (A, -)$. 

  (3) $=>$ (4) is trivial.

  (4) $=>$ (2). Let $ses(A', A, A'')$ be a short exact sequence in $cA$, which induces the #lest 
  $
    0 -> Hom(A) (A', B) -> Hom(A) (A, B) -> Hom(A) (A'', B) -> Ext^1_cA (A', B) -> ...
  $
  Since $Ext^1_cA (A', B) = 0$ by assumption,  $Hom(A) (-, B)$ is an exact functor.
]
#proposition[
  The followings are equivalent:
  + $A$ is projective;
  + $Hom(A)(A, -)$ is exact;
  + $Ext_cA^i (A, B) = 0$ for $i !=0$ and all $B$;
  + $Ext_cA^1 (A, B) = 0$ for all $B$.
]
#proof[
  Similar as above.
]

#definition[
  Let $R$ be a ring and $B$ be a left $R$-module. Since $(- tpr B) : ModR -> Ab$ is right exact by @tensor-right-exact and $RMod$ has enough projectives, we can define the left derived functor $Tor_i^R (-, B)$:
  $ Tor_i^R (A, B) = Tor_i^R (-, B)(A) := L_i (- tpr B) (A) $
]

Similarly, let $A$ be a right $R$-module, and $(A tpr - ): RMod -> Ab$ is right exact by @tensor-right-exact-2. We can thus define the left derived functor $Tor_i^R (A, -)$: 
$
  Tor_i^R (A, -)(B) := L_i (A tpr -) (B)
$

The two constructions are again isomorphic, i.e., 

$ Tor_i^R (A, B) := L_i (- tpr B) (A) iso L_i (A tpr -) (B) $

This isomorphism is called *the balancing of $Tor$*, which gives the following property.

#proposition[
  Let $ses(K, L, M)$ be a #sest in $ModR$ and let $B in RMod$. Then we have the induced long exact sequence 
  $
    ... -> Tor_1^R (K, B) -> Tor_1^R (L, B) ->  Tor_1^R (M, B) -> K tpr B -> L tpr B -> M tpr B -> 0
  $
  
  If $ses(K, L, M)$ is instead a #sest in $RMod$ and let $A in ModR$, then we have the induced #lest 
  $
    ... -> Tor_1^R (A, K) -> Tor_1^R (A, L) ->  Tor_1^R (A, M) -> A tpr K -> A tpr L -> A tpr M -> 0
  $
  
]

In order to prove the balancing of $Ext$ and $Tor$, we need two new tools: mapping cones and double complexes, introduced in the following sections.

// #TODO #lest induced by $Tor$ and $Ext$

== Mapping Cones and Mapping Cylinders
#remark[
In topology,  let $f: X-> Y  $ be a continuous map between two topological spaces. 

  The *topological mapping cylinder* $M_f$ of $f : X-> Y$ is the quotient
  $ ((X times I) product.co Y) over tilde $
  where the equivalence relation $tilde$ is generated by $ (x, 1) tilde f(x)$ for all $x in X$. That is, the mapping cylinder is obtained by gluing one end of $X times I$ to $Y$ via the map $f$. It is often denoted as $(X times I) union.sq_f Y$.

  The *topological mapping cone* $C_f$ of $f : X-> Y$ is the quotient space of the mapping cylinder $(X times I) union.sq_f Y$ with respect to the equivalence relation $(x, 0) tilde (x', 0)$ for all $x, x' in X$. That is, the end of $X times I$ that is not glued to $Y$ is identified as a point.
  #align(center,image("../imgs/Mapping_cone.svg",width:30%))
]

On the level of chain complexes, let $f : B_cx -> Ccx$ be a chain map.
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
  $f: B_cx -> C_cx$ is a quasi-isomorphism if and only if $cone(f)$ is exact.
]
   <cone-qi>

#definition[
  The *mapping cylinder* of $f$ is defined as the chain complex $cyl(f)_n = B_n xor B_(n-1) xor C_n$. The differential can be represented by the matrix 
  $
    mat(d_B, id_B, 0;0, -d_B, 0; 0, -f, d_C)
  $
]
#remark[
Let $0->B->^f C->^g D-> 0$ be a #sest of complexes. Then $phi: cone(f) -> D$ has $phi(b, c)-> g(c)$.#align(center,image("../imgs/2023-11-10-12-30-40.png",width:50%)) You can prove $cyl(f)-> C$ is a quasi-isomorphism and also $phi$ is quasi-isomorphism. (This is non-examinable.)
]
== Double Complexes and Total Complexes
Recall that $Ch(cA)$ is also an abelian category. Then we may look at $Ch(Ch(cA))$. But what we define next is slightly different from that.
#definition[
  A *double complex* (or *bicomplex*) $C = C_(cx cx)$ in an abelian category $cA$ is a family ${C_(p, q)}$ of objects in $cA$ with maps $d^h : C_(p, q) -> C_(p-1, q)$ and $d^v : C_(p, q) -> C_(p, q-1)$ such that $ (d^h)^2 = (d^v)^2 = 0 $ and $ d^v d^h + d^h d^v = 0 $ (anti-commute!).
]
#align(center,image("../imgs/2023-11-12-16-01-47.png",width:50%))
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
#align(center,image("../imgs/2023-11-12-16-04-08.png",width:50%))

#endlec(10)

#lemma("Acyclic Assembly Lemma")[
  Let $C = {C_(p, q)}$ be a double complex. If
  + $C$ is an upper half-plane complex with exact columns, or
  + $C$ is a right half-plane complex with exact rows,
  then $Tot^Pi (C)$ is acyclic.
  If 
  3. $C$ is an upper half-plane complex with exact rows, or
  4. $C$ is a right half-lane complex with exact columns,

  then $Tot^xor (C)$ is acyclic.
]
  <aal>
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
  #align(center,image("../imgs/2023-11-23-03-00-04.png",width:80%))
  Choose a projective resolution $P_cx rgt(epsilon) A$ in $ModR$ and a project resolution $Q_cx rgt(eta) B$ in $RMod$. 
  We can view $A, B$ as complexes concentrated in degree $0$. Look at the double complexes $P_cx tpr Q_cx$, $A_cx tpr Q_cx$ and $P_cx tpr B_cx$, and we get morphisms of bicomplexes $epsilon tp Q: P tpr Q -> A tpr Q$ and $Q tp eta: P tpr Q -> P tpr B$. Now we want to show that maps
  $ epsilon tp Q : Tot^xor (P tpr Q) -> Tot^xor (A tpr Q) = A tpr Q $ and
  $ P tp eta: Tot^xor (P tpr Q) -> Tot^xor (P tpr B) = P tpr B $
  are quasi-isomoprhisms, which would give isomorphisms on homology and thus prove the result, i.e.

  $ H_ast (Tot^xor (P tpr Q)) iso H_ast (A tpr Q) = L_ast (A tpr - ) (B) $ 
  $ H_ast (Tot^xor (P tpr Q)) iso H_ast (P tpr B) = L_ast (- tpr B ) (A) $  

  If we look at the double complex $C$ obtained from $P tpr Q$ by adding $A tpr Q[-1]$ in the column $p = -1$ using the augmentation, we get that $Tot(C)[1]$ is the mapping cone of $ epsilon tp Q : Tot(P tpr Q) -> A tpr Q $

  To show that $epsilon tp Q$ is a quasi-isomorphism, we need to show $cone(epsilon tp Q) = Tot(C)[1]$ is acyclic by @cone-qi. Note that $- tpr Q_p$ is exact as $Q_p$ are projective. So every row of $C$ is exact and so $Tot^xor (C)$ is exact by @aal. So $epsilon tp Q$ is a quasi-isomorphism. 
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
  #align(center,image("../imgs/2023-11-23-03-27-44.png",width:80%))
  Take projective resolution $P_cx -> A$ and injective resolution $B -> I^cx$. We can view $A$ and $B$ as complexes concentracted at degree $0$. We can form double cochain complexes $hom(P, I)$, $hom(A, I)$ and $hom(P, B)$. Then we need to show 
  $ hom(A, I) -> Tot^Pi hom(P, I) $ and 
  $ hom(P, B) -> Tot^Pi hom(P, I) $ are quasi-isomorphisms. This is equivalent to the cones of the maps being acyclic. 

  We observe that $cone(hom (A, I) -> Tot^Pi hom (P, I))$ is the total complex of the double complex $hom(P, I)$ with $hom(A, I)[-1]$ added.  For this augumented double complex, we see that $Tot^Pi$ is exact by @aal since $hom(P_p, -)$ is exact and $hom(-, I^q)$ is exact. Then 

  $ R^ast hom(A, -) (B) = H^ast hom (A, I) = H^ast Tot^Pi ( hom(P, I))  \ iso H^ast hom(P, B) = R^ast hom(-, B) (A) $
  #TODO review
]
