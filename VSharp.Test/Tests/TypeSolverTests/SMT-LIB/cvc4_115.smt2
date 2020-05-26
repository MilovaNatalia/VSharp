(set-option :produce-models true)
(set-option :finite-model-find true)
(set-option :tlimit-per 20000)
(declare-sort Type 0)
(declare-fun rec33554487 (Type)Type)
(declare-fun mutualrec33554488 (Type Type)Type)
(declare-fun vector33554435 (Type)Type)
(declare-const array33554517 Type)
(declare-const istructuralequatable33555576 Type)
(declare-const istructuralcomparable33555577 Type)
(declare-const ienumerable33555569 Type)
(declare-const icollection33555565 Type)
(declare-const ilist33555573 Type)
(declare-const icloneable33554495 Type)
(declare-fun ireadonlycollection33555626 (Type)Type)
(declare-fun ienumerable33555622 (Type)Type)
(declare-fun ireadonlylist33555627 (Type)Type)
(declare-fun icollection33555619 (Type)Type)
(declare-fun ilist33555625 (Type)Type)
(declare-const object33554493 Type)
(declare-fun covariant_subtype (Type Type) Bool)
(declare-fun contravariant_subtype (Type Type) Bool)
(declare-fun subtype (Type Type) Bool)
(declare-fun is_reference (Type) Bool)
(declare-fun is_valuetype (Type) Bool)
(declare-fun is_unmanaged (Type) Bool)
(declare-fun default_constructor (Type) Bool)
(assert(default_constructor object33554493))
(assert(forall((a Type) (b Type) (c Type) (d Type)) (=> (and (subtype a (rec33554487 b)) (subtype b (rec33554487 a)) (not(= a c))) (not(subtype (mutualrec33554488 a b) (mutualrec33554488 c d))))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (icollection33555619 a) (mutualrec33554488 b c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (ienumerable33555622 a) (mutualrec33554488 b c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (ilist33555625 a) (mutualrec33554488 b c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (ireadonlycollection33555626 a) (mutualrec33554488 b c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (ireadonlylist33555627 a) (mutualrec33554488 b c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (mutualrec33554488 a b) (icollection33555619 c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (mutualrec33554488 a b) (ienumerable33555622 c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (mutualrec33554488 a b) (ilist33555625 c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (mutualrec33554488 a b) (ireadonlycollection33555626 c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (mutualrec33554488 a b) (ireadonlylist33555627 c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (mutualrec33554488 a b) (rec33554487 c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (mutualrec33554488 a b) (vector33554435 c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (rec33554487 a) (mutualrec33554488 b c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (vector33554435 a) (mutualrec33554488 b c)))))
(assert(forall((a Type) (b Type) (d Type) (c Type)) (=> (and (subtype a (rec33554487 b)) (subtype b (rec33554487 a)) (not(= b d))) (not(subtype (mutualrec33554488 a b) (mutualrec33554488 c d))))))
(assert(forall((a Type) (b Type)) (=> (= a b) (subtype (icollection33555619 a) (icollection33555619 b)))))
(assert(forall((a Type) (b Type)) (=> (= a b) (subtype (ilist33555625 a) (ilist33555625 b)))))
(assert(forall((a Type) (b Type)) (=> (= a b) (subtype (rec33554487 a) (rec33554487 b)))))
(assert(forall((a Type) (b Type)) (=> (and (= a b) (is_valuetype a)) (covariant_subtype a b))))
(assert(forall((a Type) (b Type)) (=> (and (is_reference a) (not(subtype a b))) (not(covariant_subtype a b)))))
(assert(forall((a Type) (b Type)) (=> (and (is_reference a) (subtype a b)) (covariant_subtype a b))))
(assert(forall((a Type) (b Type)) (=> (and (not(= a b)) (is_valuetype a)) (not(covariant_subtype a b)))))
(assert(forall((a Type) (b Type)) (=> (covariant_subtype a b) (subtype (ienumerable33555622 a) (ienumerable33555622 b)))))
(assert(forall((a Type) (b Type)) (=> (covariant_subtype a b) (subtype (ireadonlycollection33555626 a) (ireadonlycollection33555626 b)))))
(assert(forall((a Type) (b Type)) (=> (covariant_subtype a b) (subtype (ireadonlylist33555627 a) (ireadonlylist33555627 b)))))
(assert(forall((a Type) (b Type)) (=> (covariant_subtype a b) (subtype (vector33554435 a) (vector33554435 b)))))
(assert(forall((a Type) (b Type)) (=> (not(= a b)) (not(subtype (icollection33555619 a) (icollection33555619 b))))))
(assert(forall((a Type) (b Type)) (=> (not(= a b)) (not(subtype (ilist33555625 a) (ilist33555625 b))))))
(assert(forall((a Type) (b Type)) (=> (not(= a b)) (not(subtype (rec33554487 a) (rec33554487 b))))))
(assert(forall((a Type) (b Type)) (=> (not(covariant_subtype a b)) (not(subtype (ienumerable33555622 a) (ienumerable33555622 b))))))
(assert(forall((a Type) (b Type)) (=> (not(covariant_subtype a b)) (not(subtype (ireadonlycollection33555626 a) (ireadonlycollection33555626 b))))))
(assert(forall((a Type) (b Type)) (=> (not(covariant_subtype a b)) (not(subtype (ireadonlylist33555627 a) (ireadonlylist33555627 b))))))
(assert(forall((a Type) (b Type)) (=> (not(covariant_subtype a b)) (not(subtype (vector33554435 a) (vector33554435 b))))))
(assert(forall((a Type) (b Type)) (=> (not(subtype (icollection33555619 a) (icollection33555619 b))) (not(subtype (ilist33555625 a) (icollection33555619 b))))))
(assert(forall((a Type) (b Type)) (=> (not(subtype (icollection33555619 a) (icollection33555619 b))) (not(subtype (vector33554435 a) (icollection33555619 b))))))
(assert(forall((a Type) (b Type)) (=> (not(subtype (ienumerable33555622 a) (ienumerable33555622 b))) (not(subtype (icollection33555619 a) (ienumerable33555622 b))))))
(assert(forall((a Type) (b Type)) (=> (not(subtype (ienumerable33555622 a) (ienumerable33555622 b))) (not(subtype (ilist33555625 a) (ienumerable33555622 b))))))
(assert(forall((a Type) (b Type)) (=> (not(subtype (ienumerable33555622 a) (ienumerable33555622 b))) (not(subtype (ireadonlycollection33555626 a) (ienumerable33555622 b))))))
(assert(forall((a Type) (b Type)) (=> (not(subtype (ienumerable33555622 a) (ienumerable33555622 b))) (not(subtype (ireadonlylist33555627 a) (ienumerable33555622 b))))))
(assert(forall((a Type) (b Type)) (=> (not(subtype (ienumerable33555622 a) (ienumerable33555622 b))) (not(subtype (vector33554435 a) (ienumerable33555622 b))))))
(assert(forall((a Type) (b Type)) (=> (not(subtype (ilist33555625 a) (ilist33555625 b))) (not(subtype (vector33554435 a) (ilist33555625 b))))))
(assert(forall((a Type) (b Type)) (=> (not(subtype (ireadonlycollection33555626 a) (ireadonlycollection33555626 b))) (not(subtype (ireadonlylist33555627 a) (ireadonlycollection33555626 b))))))
(assert(forall((a Type) (b Type)) (=> (not(subtype (ireadonlycollection33555626 a) (ireadonlycollection33555626 b))) (not(subtype (vector33554435 a) (ireadonlycollection33555626 b))))))
(assert(forall((a Type) (b Type)) (=> (not(subtype (ireadonlylist33555627 a) (ireadonlylist33555627 b))) (not(subtype (vector33554435 a) (ireadonlylist33555627 b))))))
(assert(forall((a Type) (b Type)) (=> (subtype (icollection33555619 a) (icollection33555619 b)) (subtype (ilist33555625 a) (icollection33555619 b)))))
(assert(forall((a Type) (b Type)) (=> (subtype (icollection33555619 a) (icollection33555619 b)) (subtype (vector33554435 a) (icollection33555619 b)))))
(assert(forall((a Type) (b Type)) (=> (subtype (ienumerable33555622 a) (ienumerable33555622 b)) (subtype (icollection33555619 a) (ienumerable33555622 b)))))
(assert(forall((a Type) (b Type)) (=> (subtype (ienumerable33555622 a) (ienumerable33555622 b)) (subtype (ilist33555625 a) (ienumerable33555622 b)))))
(assert(forall((a Type) (b Type)) (=> (subtype (ienumerable33555622 a) (ienumerable33555622 b)) (subtype (ireadonlycollection33555626 a) (ienumerable33555622 b)))))
(assert(forall((a Type) (b Type)) (=> (subtype (ienumerable33555622 a) (ienumerable33555622 b)) (subtype (ireadonlylist33555627 a) (ienumerable33555622 b)))))
(assert(forall((a Type) (b Type)) (=> (subtype (ienumerable33555622 a) (ienumerable33555622 b)) (subtype (vector33554435 a) (ienumerable33555622 b)))))
(assert(forall((a Type) (b Type)) (=> (subtype (ilist33555625 a) (ilist33555625 b)) (subtype (vector33554435 a) (ilist33555625 b)))))
(assert(forall((a Type) (b Type)) (=> (subtype (ireadonlycollection33555626 a) (ireadonlycollection33555626 b)) (subtype (ireadonlylist33555627 a) (ireadonlycollection33555626 b)))))
(assert(forall((a Type) (b Type)) (=> (subtype (ireadonlycollection33555626 a) (ireadonlycollection33555626 b)) (subtype (vector33554435 a) (ireadonlycollection33555626 b)))))
(assert(forall((a Type) (b Type)) (=> (subtype (ireadonlylist33555627 a) (ireadonlylist33555627 b)) (subtype (vector33554435 a) (ireadonlylist33555627 b)))))
(assert(forall((a Type) (b Type)) (default_constructor (mutualrec33554488 a b))))
(assert(forall((a Type) (b Type)) (is_reference (mutualrec33554488 a b))))
(assert(forall((a Type) (b Type)) (not(subtype (icollection33555619 a) (ilist33555625 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (icollection33555619 a) (ireadonlycollection33555626 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (icollection33555619 a) (ireadonlylist33555627 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (icollection33555619 a) (rec33554487 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (icollection33555619 a) (vector33554435 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ienumerable33555622 a) (icollection33555619 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ienumerable33555622 a) (ilist33555625 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ienumerable33555622 a) (ireadonlycollection33555626 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ienumerable33555622 a) (ireadonlylist33555627 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ienumerable33555622 a) (rec33554487 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ienumerable33555622 a) (vector33554435 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ilist33555625 a) (ireadonlycollection33555626 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ilist33555625 a) (ireadonlylist33555627 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ilist33555625 a) (rec33554487 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ilist33555625 a) (vector33554435 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ireadonlycollection33555626 a) (icollection33555619 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ireadonlycollection33555626 a) (ilist33555625 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ireadonlycollection33555626 a) (ireadonlylist33555627 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ireadonlycollection33555626 a) (rec33554487 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ireadonlycollection33555626 a) (vector33554435 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ireadonlylist33555627 a) (icollection33555619 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ireadonlylist33555627 a) (ilist33555625 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ireadonlylist33555627 a) (rec33554487 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (ireadonlylist33555627 a) (vector33554435 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (mutualrec33554488 a b) array33554517))))
(assert(forall((a Type) (b Type)) (not(subtype (mutualrec33554488 a b) icloneable33554495))))
(assert(forall((a Type) (b Type)) (not(subtype (mutualrec33554488 a b) icollection33555565))))
(assert(forall((a Type) (b Type)) (not(subtype (mutualrec33554488 a b) ienumerable33555569))))
(assert(forall((a Type) (b Type)) (not(subtype (mutualrec33554488 a b) ilist33555573))))
(assert(forall((a Type) (b Type)) (not(subtype (mutualrec33554488 a b) istructuralcomparable33555577))))
(assert(forall((a Type) (b Type)) (not(subtype (mutualrec33554488 a b) istructuralequatable33555576))))
(assert(forall((a Type) (b Type)) (not(subtype (rec33554487 a) (icollection33555619 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (rec33554487 a) (ienumerable33555622 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (rec33554487 a) (ilist33555625 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (rec33554487 a) (ireadonlycollection33555626 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (rec33554487 a) (ireadonlylist33555627 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (rec33554487 a) (vector33554435 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (vector33554435 a) (rec33554487 b)))))
(assert(forall((a Type) (b Type)) (not(subtype array33554517 (mutualrec33554488 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype icloneable33554495 (mutualrec33554488 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype icollection33555565 (mutualrec33554488 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype ienumerable33555569 (mutualrec33554488 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype ilist33555573 (mutualrec33554488 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype istructuralcomparable33555577 (mutualrec33554488 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype istructuralequatable33555576 (mutualrec33554488 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype object33554493 (mutualrec33554488 a b)))))
(assert(forall((a Type) (b Type)) (subtype (mutualrec33554488 a b) object33554493)))
(assert(forall((a Type) (c Type) (b Type) (d Type)) (=> (and (= a c) (= b d) (subtype a (rec33554487 b)) (subtype b (rec33554487 a))) (subtype (mutualrec33554488 a b) (mutualrec33554488 c d)))))
(assert(forall((a Type)) (=> false (is_unmanaged a))))
(assert(forall((a Type)) (=> false (is_valuetype a))))
(assert(forall((a Type)) (default_constructor (rec33554487 a))))
(assert(forall((a Type)) (is_reference (icollection33555619 a))))
(assert(forall((a Type)) (is_reference (ienumerable33555622 a))))
(assert(forall((a Type)) (is_reference (ilist33555625 a))))
(assert(forall((a Type)) (is_reference (ireadonlycollection33555626 a))))
(assert(forall((a Type)) (is_reference (ireadonlylist33555627 a))))
(assert(forall((a Type)) (is_reference (rec33554487 a))))
(assert(forall((a Type)) (is_reference (vector33554435 a))))
(assert(forall((a Type)) (not(subtype (icollection33555619 a) array33554517))))
(assert(forall((a Type)) (not(subtype (icollection33555619 a) icloneable33554495))))
(assert(forall((a Type)) (not(subtype (icollection33555619 a) icollection33555565))))
(assert(forall((a Type)) (not(subtype (icollection33555619 a) ilist33555573))))
(assert(forall((a Type)) (not(subtype (icollection33555619 a) istructuralcomparable33555577))))
(assert(forall((a Type)) (not(subtype (icollection33555619 a) istructuralequatable33555576))))
(assert(forall((a Type)) (not(subtype (ienumerable33555622 a) array33554517))))
(assert(forall((a Type)) (not(subtype (ienumerable33555622 a) icloneable33554495))))
(assert(forall((a Type)) (not(subtype (ienumerable33555622 a) icollection33555565))))
(assert(forall((a Type)) (not(subtype (ienumerable33555622 a) ilist33555573))))
(assert(forall((a Type)) (not(subtype (ienumerable33555622 a) istructuralcomparable33555577))))
(assert(forall((a Type)) (not(subtype (ienumerable33555622 a) istructuralequatable33555576))))
(assert(forall((a Type)) (not(subtype (ilist33555625 a) array33554517))))
(assert(forall((a Type)) (not(subtype (ilist33555625 a) icloneable33554495))))
(assert(forall((a Type)) (not(subtype (ilist33555625 a) icollection33555565))))
(assert(forall((a Type)) (not(subtype (ilist33555625 a) ilist33555573))))
(assert(forall((a Type)) (not(subtype (ilist33555625 a) istructuralcomparable33555577))))
(assert(forall((a Type)) (not(subtype (ilist33555625 a) istructuralequatable33555576))))
(assert(forall((a Type)) (not(subtype (ireadonlycollection33555626 a) array33554517))))
(assert(forall((a Type)) (not(subtype (ireadonlycollection33555626 a) icloneable33554495))))
(assert(forall((a Type)) (not(subtype (ireadonlycollection33555626 a) icollection33555565))))
(assert(forall((a Type)) (not(subtype (ireadonlycollection33555626 a) ilist33555573))))
(assert(forall((a Type)) (not(subtype (ireadonlycollection33555626 a) istructuralcomparable33555577))))
(assert(forall((a Type)) (not(subtype (ireadonlycollection33555626 a) istructuralequatable33555576))))
(assert(forall((a Type)) (not(subtype (ireadonlylist33555627 a) array33554517))))
(assert(forall((a Type)) (not(subtype (ireadonlylist33555627 a) icloneable33554495))))
(assert(forall((a Type)) (not(subtype (ireadonlylist33555627 a) icollection33555565))))
(assert(forall((a Type)) (not(subtype (ireadonlylist33555627 a) ilist33555573))))
(assert(forall((a Type)) (not(subtype (ireadonlylist33555627 a) istructuralcomparable33555577))))
(assert(forall((a Type)) (not(subtype (ireadonlylist33555627 a) istructuralequatable33555576))))
(assert(forall((a Type)) (not(subtype (rec33554487 a) array33554517))))
(assert(forall((a Type)) (not(subtype (rec33554487 a) icloneable33554495))))
(assert(forall((a Type)) (not(subtype (rec33554487 a) icollection33555565))))
(assert(forall((a Type)) (not(subtype (rec33554487 a) ienumerable33555569))))
(assert(forall((a Type)) (not(subtype (rec33554487 a) ilist33555573))))
(assert(forall((a Type)) (not(subtype (rec33554487 a) istructuralcomparable33555577))))
(assert(forall((a Type)) (not(subtype (rec33554487 a) istructuralequatable33555576))))
(assert(forall((a Type)) (not(subtype array33554517 (icollection33555619 a)))))
(assert(forall((a Type)) (not(subtype array33554517 (ienumerable33555622 a)))))
(assert(forall((a Type)) (not(subtype array33554517 (ilist33555625 a)))))
(assert(forall((a Type)) (not(subtype array33554517 (ireadonlycollection33555626 a)))))
(assert(forall((a Type)) (not(subtype array33554517 (ireadonlylist33555627 a)))))
(assert(forall((a Type)) (not(subtype array33554517 (rec33554487 a)))))
(assert(forall((a Type)) (not(subtype array33554517 (vector33554435 a)))))
(assert(forall((a Type)) (not(subtype icloneable33554495 (icollection33555619 a)))))
(assert(forall((a Type)) (not(subtype icloneable33554495 (ienumerable33555622 a)))))
(assert(forall((a Type)) (not(subtype icloneable33554495 (ilist33555625 a)))))
(assert(forall((a Type)) (not(subtype icloneable33554495 (ireadonlycollection33555626 a)))))
(assert(forall((a Type)) (not(subtype icloneable33554495 (ireadonlylist33555627 a)))))
(assert(forall((a Type)) (not(subtype icloneable33554495 (rec33554487 a)))))
(assert(forall((a Type)) (not(subtype icloneable33554495 (vector33554435 a)))))
(assert(forall((a Type)) (not(subtype icollection33555565 (icollection33555619 a)))))
(assert(forall((a Type)) (not(subtype icollection33555565 (ienumerable33555622 a)))))
(assert(forall((a Type)) (not(subtype icollection33555565 (ilist33555625 a)))))
(assert(forall((a Type)) (not(subtype icollection33555565 (ireadonlycollection33555626 a)))))
(assert(forall((a Type)) (not(subtype icollection33555565 (ireadonlylist33555627 a)))))
(assert(forall((a Type)) (not(subtype icollection33555565 (rec33554487 a)))))
(assert(forall((a Type)) (not(subtype icollection33555565 (vector33554435 a)))))
(assert(forall((a Type)) (not(subtype ienumerable33555569 (icollection33555619 a)))))
(assert(forall((a Type)) (not(subtype ienumerable33555569 (ienumerable33555622 a)))))
(assert(forall((a Type)) (not(subtype ienumerable33555569 (ilist33555625 a)))))
(assert(forall((a Type)) (not(subtype ienumerable33555569 (ireadonlycollection33555626 a)))))
(assert(forall((a Type)) (not(subtype ienumerable33555569 (ireadonlylist33555627 a)))))
(assert(forall((a Type)) (not(subtype ienumerable33555569 (rec33554487 a)))))
(assert(forall((a Type)) (not(subtype ienumerable33555569 (vector33554435 a)))))
(assert(forall((a Type)) (not(subtype ilist33555573 (icollection33555619 a)))))
(assert(forall((a Type)) (not(subtype ilist33555573 (ienumerable33555622 a)))))
(assert(forall((a Type)) (not(subtype ilist33555573 (ilist33555625 a)))))
(assert(forall((a Type)) (not(subtype ilist33555573 (ireadonlycollection33555626 a)))))
(assert(forall((a Type)) (not(subtype ilist33555573 (ireadonlylist33555627 a)))))
(assert(forall((a Type)) (not(subtype ilist33555573 (rec33554487 a)))))
(assert(forall((a Type)) (not(subtype ilist33555573 (vector33554435 a)))))
(assert(forall((a Type)) (not(subtype istructuralcomparable33555577 (icollection33555619 a)))))
(assert(forall((a Type)) (not(subtype istructuralcomparable33555577 (ienumerable33555622 a)))))
(assert(forall((a Type)) (not(subtype istructuralcomparable33555577 (ilist33555625 a)))))
(assert(forall((a Type)) (not(subtype istructuralcomparable33555577 (ireadonlycollection33555626 a)))))
(assert(forall((a Type)) (not(subtype istructuralcomparable33555577 (ireadonlylist33555627 a)))))
(assert(forall((a Type)) (not(subtype istructuralcomparable33555577 (rec33554487 a)))))
(assert(forall((a Type)) (not(subtype istructuralcomparable33555577 (vector33554435 a)))))
(assert(forall((a Type)) (not(subtype istructuralequatable33555576 (icollection33555619 a)))))
(assert(forall((a Type)) (not(subtype istructuralequatable33555576 (ienumerable33555622 a)))))
(assert(forall((a Type)) (not(subtype istructuralequatable33555576 (ilist33555625 a)))))
(assert(forall((a Type)) (not(subtype istructuralequatable33555576 (ireadonlycollection33555626 a)))))
(assert(forall((a Type)) (not(subtype istructuralequatable33555576 (ireadonlylist33555627 a)))))
(assert(forall((a Type)) (not(subtype istructuralequatable33555576 (rec33554487 a)))))
(assert(forall((a Type)) (not(subtype istructuralequatable33555576 (vector33554435 a)))))
(assert(forall((a Type)) (not(subtype object33554493 (icollection33555619 a)))))
(assert(forall((a Type)) (not(subtype object33554493 (ienumerable33555622 a)))))
(assert(forall((a Type)) (not(subtype object33554493 (ilist33555625 a)))))
(assert(forall((a Type)) (not(subtype object33554493 (ireadonlycollection33555626 a)))))
(assert(forall((a Type)) (not(subtype object33554493 (ireadonlylist33555627 a)))))
(assert(forall((a Type)) (not(subtype object33554493 (rec33554487 a)))))
(assert(forall((a Type)) (not(subtype object33554493 (vector33554435 a)))))
(assert(forall((a Type)) (subtype (icollection33555619 a) ienumerable33555569)))
(assert(forall((a Type)) (subtype (icollection33555619 a) object33554493)))
(assert(forall((a Type)) (subtype (ienumerable33555622 a) ienumerable33555569)))
(assert(forall((a Type)) (subtype (ienumerable33555622 a) object33554493)))
(assert(forall((a Type)) (subtype (ilist33555625 a) ienumerable33555569)))
(assert(forall((a Type)) (subtype (ilist33555625 a) object33554493)))
(assert(forall((a Type)) (subtype (ireadonlycollection33555626 a) ienumerable33555569)))
(assert(forall((a Type)) (subtype (ireadonlycollection33555626 a) object33554493)))
(assert(forall((a Type)) (subtype (ireadonlylist33555627 a) ienumerable33555569)))
(assert(forall((a Type)) (subtype (ireadonlylist33555627 a) object33554493)))
(assert(forall((a Type)) (subtype (rec33554487 a) object33554493)))
(assert(forall((a Type)) (subtype (vector33554435 a) array33554517)))
(assert(forall((a Type)) (subtype (vector33554435 a) icloneable33554495)))
(assert(forall((a Type)) (subtype (vector33554435 a) icollection33555565)))
(assert(forall((a Type)) (subtype (vector33554435 a) ienumerable33555569)))
(assert(forall((a Type)) (subtype (vector33554435 a) ilist33555573)))
(assert(forall((a Type)) (subtype (vector33554435 a) istructuralcomparable33555577)))
(assert(forall((a Type)) (subtype (vector33554435 a) istructuralequatable33555576)))
(assert(forall((a Type)) (subtype (vector33554435 a) object33554493)))
(assert(forall((b Type) (a Type)) (=> (and (= b a) (is_valuetype b)) (contravariant_subtype a b))))
(assert(forall((b Type) (a Type)) (=> (and (is_reference b) (not(subtype b a))) (not(contravariant_subtype a b)))))
(assert(forall((b Type) (a Type)) (=> (and (is_reference b) (subtype b a)) (contravariant_subtype a b))))
(assert(forall((b Type) (a Type)) (=> (and (not(= b a)) (is_valuetype b)) (not(contravariant_subtype a b)))))
(assert(is_reference array33554517))
(assert(is_reference icloneable33554495))
(assert(is_reference icollection33555565))
(assert(is_reference ienumerable33555569))
(assert(is_reference ilist33555573))
(assert(is_reference istructuralcomparable33555577))
(assert(is_reference istructuralequatable33555576))
(assert(is_reference object33554493))
(assert(not(subtype icloneable33554495 array33554517)))
(assert(not(subtype icloneable33554495 icollection33555565)))
(assert(not(subtype icloneable33554495 ienumerable33555569)))
(assert(not(subtype icloneable33554495 ilist33555573)))
(assert(not(subtype icloneable33554495 istructuralcomparable33555577)))
(assert(not(subtype icloneable33554495 istructuralequatable33555576)))
(assert(not(subtype icollection33555565 array33554517)))
(assert(not(subtype icollection33555565 icloneable33554495)))
(assert(not(subtype icollection33555565 ilist33555573)))
(assert(not(subtype icollection33555565 istructuralcomparable33555577)))
(assert(not(subtype icollection33555565 istructuralequatable33555576)))
(assert(not(subtype ienumerable33555569 array33554517)))
(assert(not(subtype ienumerable33555569 icloneable33554495)))
(assert(not(subtype ienumerable33555569 icollection33555565)))
(assert(not(subtype ienumerable33555569 ilist33555573)))
(assert(not(subtype ienumerable33555569 istructuralcomparable33555577)))
(assert(not(subtype ienumerable33555569 istructuralequatable33555576)))
(assert(not(subtype ilist33555573 array33554517)))
(assert(not(subtype ilist33555573 icloneable33554495)))
(assert(not(subtype ilist33555573 istructuralcomparable33555577)))
(assert(not(subtype ilist33555573 istructuralequatable33555576)))
(assert(not(subtype istructuralcomparable33555577 array33554517)))
(assert(not(subtype istructuralcomparable33555577 icloneable33554495)))
(assert(not(subtype istructuralcomparable33555577 icollection33555565)))
(assert(not(subtype istructuralcomparable33555577 ienumerable33555569)))
(assert(not(subtype istructuralcomparable33555577 ilist33555573)))
(assert(not(subtype istructuralcomparable33555577 istructuralequatable33555576)))
(assert(not(subtype istructuralequatable33555576 array33554517)))
(assert(not(subtype istructuralequatable33555576 icloneable33554495)))
(assert(not(subtype istructuralequatable33555576 icollection33555565)))
(assert(not(subtype istructuralequatable33555576 ienumerable33555569)))
(assert(not(subtype istructuralequatable33555576 ilist33555573)))
(assert(not(subtype istructuralequatable33555576 istructuralcomparable33555577)))
(assert(not(subtype object33554493 array33554517)))
(assert(not(subtype object33554493 icloneable33554495)))
(assert(not(subtype object33554493 icollection33555565)))
(assert(not(subtype object33554493 ienumerable33555569)))
(assert(not(subtype object33554493 ilist33555573)))
(assert(not(subtype object33554493 istructuralcomparable33555577)))
(assert(not(subtype object33554493 istructuralequatable33555576)))
(assert(subtype array33554517 array33554517))
(assert(subtype array33554517 icloneable33554495))
(assert(subtype array33554517 icollection33555565))
(assert(subtype array33554517 ienumerable33555569))
(assert(subtype array33554517 ilist33555573))
(assert(subtype array33554517 istructuralcomparable33555577))
(assert(subtype array33554517 istructuralequatable33555576))
(assert(subtype array33554517 object33554493))
(assert(subtype icloneable33554495 icloneable33554495))
(assert(subtype icloneable33554495 object33554493))
(assert(subtype icollection33555565 icollection33555565))
(assert(subtype icollection33555565 ienumerable33555569))
(assert(subtype icollection33555565 object33554493))
(assert(subtype ienumerable33555569 ienumerable33555569))
(assert(subtype ienumerable33555569 object33554493))
(assert(subtype ilist33555573 icollection33555565))
(assert(subtype ilist33555573 ienumerable33555569))
(assert(subtype ilist33555573 ilist33555573))
(assert(subtype ilist33555573 object33554493))
(assert(subtype istructuralcomparable33555577 istructuralcomparable33555577))
(assert(subtype istructuralcomparable33555577 object33554493))
(assert(subtype istructuralequatable33555576 istructuralequatable33555576))
(assert(subtype istructuralequatable33555576 object33554493))
(assert(subtype object33554493 object33554493))
(assert(forall((b Type) (c Type) (d Type) (e Type) (a Type)) (not (and (subtype b (mutualrec33554488 c d)) (subtype e (mutualrec33554488 c d)) (subtype c (rec33554487 d)) (subtype d (rec33554487 c)) (not(subtype (vector33554435 a) a)) (not(subtype b (mutualrec33554488 c d))) (not(subtype e (mutualrec33554488 c d)))))))
(check-sat)
(get-model)
