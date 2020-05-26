(set-option :produce-models true)
(set-option :finite-model-find true)
(set-option :tlimit-per 20000)
(declare-sort Type 0)
(declare-fun ia33554436 (Type)Type)
(declare-const valuetype33554777 Type)
(declare-const object33554493 Type)
(declare-fun covariant_subtype (Type Type) Bool)
(declare-fun contravariant_subtype (Type Type) Bool)
(declare-fun subtype (Type Type) Bool)
(declare-fun is_reference (Type) Bool)
(declare-fun is_valuetype (Type) Bool)
(declare-fun is_unmanaged (Type) Bool)
(declare-fun default_constructor (Type) Bool)
(assert(default_constructor object33554493))
(assert(forall((a Type) (b Type)) (=> (and (= a b) (is_valuetype a)) (covariant_subtype a b))))
(assert(forall((a Type) (b Type)) (=> (and (is_reference a) (not(subtype a b))) (not(covariant_subtype a b)))))
(assert(forall((a Type) (b Type)) (=> (and (is_reference a) (subtype a b)) (covariant_subtype a b))))
(assert(forall((a Type) (b Type)) (=> (and (not(= a b)) (is_valuetype a)) (not(covariant_subtype a b)))))
(assert(forall((a Type) (b Type)) (=> (covariant_subtype a b) (subtype (ia33554436 a) (ia33554436 b)))))
(assert(forall((a Type) (b Type)) (=> (not(covariant_subtype a b)) (not(subtype (ia33554436 a) (ia33554436 b))))))
(assert(forall((a Type)) (=> false (is_unmanaged a))))
(assert(forall((a Type)) (=> false (is_valuetype a))))
(assert(forall((a Type)) (is_reference (ia33554436 a))))
(assert(forall((a Type)) (not(subtype (ia33554436 a) valuetype33554777))))
(assert(forall((a Type)) (not(subtype object33554493 (ia33554436 a)))))
(assert(forall((a Type)) (not(subtype valuetype33554777 (ia33554436 a)))))
(assert(forall((a Type)) (subtype (ia33554436 a) object33554493)))
(assert(forall((b Type) (a Type)) (=> (and (= b a) (is_valuetype b)) (contravariant_subtype a b))))
(assert(forall((b Type) (a Type)) (=> (and (is_reference b) (not(subtype b a))) (not(contravariant_subtype a b)))))
(assert(forall((b Type) (a Type)) (=> (and (is_reference b) (subtype b a)) (contravariant_subtype a b))))
(assert(forall((b Type) (a Type)) (=> (and (not(= b a)) (is_valuetype b)) (not(contravariant_subtype a b)))))
(assert(is_reference object33554493))
(assert(is_reference valuetype33554777))
(assert(not(subtype object33554493 valuetype33554777)))
(assert(subtype object33554493 object33554493))
(assert(subtype valuetype33554777 object33554493))
(assert(subtype valuetype33554777 valuetype33554777))
(assert(forall((a Type) (b Type) (c Type) (d Type) (e Type) (f Type) (g Type) (h Type) (i Type) (j Type) (k Type)) (not (and (subtype a (ia33554436 a)) (subtype b (ia33554436 a)) (subtype valuetype33554777 c) (subtype d (ia33554436 d)) (subtype e (ia33554436 d)) (subtype f a) (subtype g a) (subtype f h) (subtype g h) (subtype c h) (subtype i h) (subtype j h) (subtype k h) (subtype a (ia33554436 d)) (subtype d (ia33554436 a)) (subtype a (ia33554436 d)) (subtype d (ia33554436 a)) (default_constructor c) (is_reference j)))))
(check-sat)
(get-model)
