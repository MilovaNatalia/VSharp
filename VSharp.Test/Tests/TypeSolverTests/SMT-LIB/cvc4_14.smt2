(set-option :produce-models true)
(set-option :finite-model-find true)
(set-option :tlimit-per 20000)
(declare-sort Type 0)
(declare-const n33554471 Type)
(declare-fun ic33554438 (Type)Type)
(declare-const k33554466 Type)
(declare-const a33554459 Type)
(declare-const b33554460 Type)
(declare-const ik33554445 Type)
(declare-const if33554441 Type)
(declare-const ie33554440 Type)
(declare-const c33554461 Type)
(declare-const e33554463 Type)
(declare-const iq33554451 Type)
(declare-const ih33554443 Type)
(declare-const ig33554442 Type)
(declare-const m33554470 Type)
(declare-const object33554493 Type)
(declare-fun covariant_subtype (Type Type) Bool)
(declare-fun contravariant_subtype (Type Type) Bool)
(declare-fun subtype (Type Type) Bool)
(declare-fun is_reference (Type) Bool)
(declare-fun is_valuetype (Type) Bool)
(declare-fun is_unmanaged (Type) Bool)
(declare-fun default_constructor (Type) Bool)
(assert(default_constructor a33554459))
(assert(default_constructor b33554460))
(assert(default_constructor c33554461))
(assert(default_constructor e33554463))
(assert(default_constructor k33554466))
(assert(default_constructor m33554470))
(assert(default_constructor n33554471))
(assert(default_constructor object33554493))
(assert(forall((a Type) (b Type)) (=> (= a b) (subtype (ic33554438 a) (ic33554438 b)))))
(assert(forall((a Type) (b Type)) (=> (and (= a b) (is_valuetype a)) (covariant_subtype a b))))
(assert(forall((a Type) (b Type)) (=> (and (is_reference a) (not(subtype a b))) (not(covariant_subtype a b)))))
(assert(forall((a Type) (b Type)) (=> (and (is_reference a) (subtype a b)) (covariant_subtype a b))))
(assert(forall((a Type) (b Type)) (=> (and (not(= a b)) (is_valuetype a)) (not(covariant_subtype a b)))))
(assert(forall((a Type) (b Type)) (=> (not(= a b)) (not(subtype (ic33554438 a) (ic33554438 b))))))
(assert(forall((a Type)) (=> (not(subtype (ic33554438 b33554460) (ic33554438 a))) (not(subtype m33554470 (ic33554438 a))))))
(assert(forall((a Type)) (=> (not(subtype (ic33554438 k33554466) (ic33554438 a))) (not(subtype n33554471 (ic33554438 a))))))
(assert(forall((a Type)) (=> (subtype (ic33554438 b33554460) (ic33554438 a)) (subtype m33554470 (ic33554438 a)))))
(assert(forall((a Type)) (=> (subtype (ic33554438 k33554466) (ic33554438 a)) (subtype n33554471 (ic33554438 a)))))
(assert(forall((a Type)) (=> false (is_unmanaged a))))
(assert(forall((a Type)) (=> false (is_valuetype a))))
(assert(forall((a Type)) (is_reference (ic33554438 a))))
(assert(forall((a Type)) (not(subtype (ic33554438 a) a33554459))))
(assert(forall((a Type)) (not(subtype (ic33554438 a) b33554460))))
(assert(forall((a Type)) (not(subtype (ic33554438 a) c33554461))))
(assert(forall((a Type)) (not(subtype (ic33554438 a) e33554463))))
(assert(forall((a Type)) (not(subtype (ic33554438 a) ie33554440))))
(assert(forall((a Type)) (not(subtype (ic33554438 a) if33554441))))
(assert(forall((a Type)) (not(subtype (ic33554438 a) ig33554442))))
(assert(forall((a Type)) (not(subtype (ic33554438 a) ih33554443))))
(assert(forall((a Type)) (not(subtype (ic33554438 a) ik33554445))))
(assert(forall((a Type)) (not(subtype (ic33554438 a) iq33554451))))
(assert(forall((a Type)) (not(subtype (ic33554438 a) k33554466))))
(assert(forall((a Type)) (not(subtype (ic33554438 a) m33554470))))
(assert(forall((a Type)) (not(subtype (ic33554438 a) n33554471))))
(assert(forall((a Type)) (not(subtype a33554459 (ic33554438 a)))))
(assert(forall((a Type)) (not(subtype b33554460 (ic33554438 a)))))
(assert(forall((a Type)) (not(subtype c33554461 (ic33554438 a)))))
(assert(forall((a Type)) (not(subtype e33554463 (ic33554438 a)))))
(assert(forall((a Type)) (not(subtype ie33554440 (ic33554438 a)))))
(assert(forall((a Type)) (not(subtype if33554441 (ic33554438 a)))))
(assert(forall((a Type)) (not(subtype ig33554442 (ic33554438 a)))))
(assert(forall((a Type)) (not(subtype ih33554443 (ic33554438 a)))))
(assert(forall((a Type)) (not(subtype ik33554445 (ic33554438 a)))))
(assert(forall((a Type)) (not(subtype iq33554451 (ic33554438 a)))))
(assert(forall((a Type)) (not(subtype k33554466 (ic33554438 a)))))
(assert(forall((a Type)) (not(subtype object33554493 (ic33554438 a)))))
(assert(forall((a Type)) (subtype (ic33554438 a) object33554493)))
(assert(forall((b Type) (a Type)) (=> (and (= b a) (is_valuetype b)) (contravariant_subtype a b))))
(assert(forall((b Type) (a Type)) (=> (and (is_reference b) (not(subtype b a))) (not(contravariant_subtype a b)))))
(assert(forall((b Type) (a Type)) (=> (and (is_reference b) (subtype b a)) (contravariant_subtype a b))))
(assert(forall((b Type) (a Type)) (=> (and (not(= b a)) (is_valuetype b)) (not(contravariant_subtype a b)))))
(assert(is_reference a33554459))
(assert(is_reference b33554460))
(assert(is_reference c33554461))
(assert(is_reference e33554463))
(assert(is_reference ie33554440))
(assert(is_reference if33554441))
(assert(is_reference ig33554442))
(assert(is_reference ih33554443))
(assert(is_reference ik33554445))
(assert(is_reference iq33554451))
(assert(is_reference k33554466))
(assert(is_reference m33554470))
(assert(is_reference n33554471))
(assert(is_reference object33554493))
(assert(not(subtype a33554459 b33554460)))
(assert(not(subtype a33554459 c33554461)))
(assert(not(subtype a33554459 e33554463)))
(assert(not(subtype a33554459 ie33554440)))
(assert(not(subtype a33554459 if33554441)))
(assert(not(subtype a33554459 ig33554442)))
(assert(not(subtype a33554459 ih33554443)))
(assert(not(subtype a33554459 ik33554445)))
(assert(not(subtype a33554459 iq33554451)))
(assert(not(subtype a33554459 k33554466)))
(assert(not(subtype a33554459 m33554470)))
(assert(not(subtype a33554459 n33554471)))
(assert(not(subtype b33554460 c33554461)))
(assert(not(subtype b33554460 e33554463)))
(assert(not(subtype b33554460 ig33554442)))
(assert(not(subtype b33554460 ih33554443)))
(assert(not(subtype b33554460 iq33554451)))
(assert(not(subtype b33554460 k33554466)))
(assert(not(subtype b33554460 m33554470)))
(assert(not(subtype b33554460 n33554471)))
(assert(not(subtype c33554461 e33554463)))
(assert(not(subtype c33554461 ig33554442)))
(assert(not(subtype c33554461 ih33554443)))
(assert(not(subtype c33554461 iq33554451)))
(assert(not(subtype c33554461 k33554466)))
(assert(not(subtype c33554461 m33554470)))
(assert(not(subtype c33554461 n33554471)))
(assert(not(subtype e33554463 k33554466)))
(assert(not(subtype e33554463 m33554470)))
(assert(not(subtype e33554463 n33554471)))
(assert(not(subtype ie33554440 a33554459)))
(assert(not(subtype ie33554440 b33554460)))
(assert(not(subtype ie33554440 c33554461)))
(assert(not(subtype ie33554440 e33554463)))
(assert(not(subtype ie33554440 if33554441)))
(assert(not(subtype ie33554440 ig33554442)))
(assert(not(subtype ie33554440 ih33554443)))
(assert(not(subtype ie33554440 ik33554445)))
(assert(not(subtype ie33554440 iq33554451)))
(assert(not(subtype ie33554440 k33554466)))
(assert(not(subtype ie33554440 m33554470)))
(assert(not(subtype ie33554440 n33554471)))
(assert(not(subtype if33554441 a33554459)))
(assert(not(subtype if33554441 b33554460)))
(assert(not(subtype if33554441 c33554461)))
(assert(not(subtype if33554441 e33554463)))
(assert(not(subtype if33554441 ie33554440)))
(assert(not(subtype if33554441 ig33554442)))
(assert(not(subtype if33554441 ih33554443)))
(assert(not(subtype if33554441 ik33554445)))
(assert(not(subtype if33554441 iq33554451)))
(assert(not(subtype if33554441 k33554466)))
(assert(not(subtype if33554441 m33554470)))
(assert(not(subtype if33554441 n33554471)))
(assert(not(subtype ig33554442 a33554459)))
(assert(not(subtype ig33554442 b33554460)))
(assert(not(subtype ig33554442 c33554461)))
(assert(not(subtype ig33554442 e33554463)))
(assert(not(subtype ig33554442 ie33554440)))
(assert(not(subtype ig33554442 if33554441)))
(assert(not(subtype ig33554442 ih33554443)))
(assert(not(subtype ig33554442 ik33554445)))
(assert(not(subtype ig33554442 iq33554451)))
(assert(not(subtype ig33554442 k33554466)))
(assert(not(subtype ig33554442 m33554470)))
(assert(not(subtype ig33554442 n33554471)))
(assert(not(subtype ih33554443 a33554459)))
(assert(not(subtype ih33554443 b33554460)))
(assert(not(subtype ih33554443 c33554461)))
(assert(not(subtype ih33554443 e33554463)))
(assert(not(subtype ih33554443 ie33554440)))
(assert(not(subtype ih33554443 if33554441)))
(assert(not(subtype ih33554443 ig33554442)))
(assert(not(subtype ih33554443 ik33554445)))
(assert(not(subtype ih33554443 iq33554451)))
(assert(not(subtype ih33554443 k33554466)))
(assert(not(subtype ih33554443 m33554470)))
(assert(not(subtype ih33554443 n33554471)))
(assert(not(subtype ik33554445 a33554459)))
(assert(not(subtype ik33554445 b33554460)))
(assert(not(subtype ik33554445 c33554461)))
(assert(not(subtype ik33554445 e33554463)))
(assert(not(subtype ik33554445 ie33554440)))
(assert(not(subtype ik33554445 if33554441)))
(assert(not(subtype ik33554445 ig33554442)))
(assert(not(subtype ik33554445 ih33554443)))
(assert(not(subtype ik33554445 iq33554451)))
(assert(not(subtype ik33554445 k33554466)))
(assert(not(subtype ik33554445 m33554470)))
(assert(not(subtype ik33554445 n33554471)))
(assert(not(subtype iq33554451 a33554459)))
(assert(not(subtype iq33554451 b33554460)))
(assert(not(subtype iq33554451 c33554461)))
(assert(not(subtype iq33554451 e33554463)))
(assert(not(subtype iq33554451 ie33554440)))
(assert(not(subtype iq33554451 if33554441)))
(assert(not(subtype iq33554451 ig33554442)))
(assert(not(subtype iq33554451 ih33554443)))
(assert(not(subtype iq33554451 ik33554445)))
(assert(not(subtype iq33554451 k33554466)))
(assert(not(subtype iq33554451 m33554470)))
(assert(not(subtype iq33554451 n33554471)))
(assert(not(subtype k33554466 m33554470)))
(assert(not(subtype k33554466 n33554471)))
(assert(not(subtype m33554470 a33554459)))
(assert(not(subtype m33554470 b33554460)))
(assert(not(subtype m33554470 c33554461)))
(assert(not(subtype m33554470 e33554463)))
(assert(not(subtype m33554470 ie33554440)))
(assert(not(subtype m33554470 if33554441)))
(assert(not(subtype m33554470 ig33554442)))
(assert(not(subtype m33554470 ih33554443)))
(assert(not(subtype m33554470 ik33554445)))
(assert(not(subtype m33554470 iq33554451)))
(assert(not(subtype m33554470 k33554466)))
(assert(not(subtype m33554470 n33554471)))
(assert(not(subtype n33554471 a33554459)))
(assert(not(subtype n33554471 b33554460)))
(assert(not(subtype n33554471 c33554461)))
(assert(not(subtype n33554471 e33554463)))
(assert(not(subtype n33554471 ie33554440)))
(assert(not(subtype n33554471 if33554441)))
(assert(not(subtype n33554471 ig33554442)))
(assert(not(subtype n33554471 ih33554443)))
(assert(not(subtype n33554471 ik33554445)))
(assert(not(subtype n33554471 iq33554451)))
(assert(not(subtype n33554471 k33554466)))
(assert(not(subtype n33554471 m33554470)))
(assert(not(subtype object33554493 a33554459)))
(assert(not(subtype object33554493 b33554460)))
(assert(not(subtype object33554493 c33554461)))
(assert(not(subtype object33554493 e33554463)))
(assert(not(subtype object33554493 ie33554440)))
(assert(not(subtype object33554493 if33554441)))
(assert(not(subtype object33554493 ig33554442)))
(assert(not(subtype object33554493 ih33554443)))
(assert(not(subtype object33554493 ik33554445)))
(assert(not(subtype object33554493 iq33554451)))
(assert(not(subtype object33554493 k33554466)))
(assert(not(subtype object33554493 m33554470)))
(assert(not(subtype object33554493 n33554471)))
(assert(subtype a33554459 a33554459))
(assert(subtype a33554459 object33554493))
(assert(subtype b33554460 a33554459))
(assert(subtype b33554460 b33554460))
(assert(subtype b33554460 ie33554440))
(assert(subtype b33554460 if33554441))
(assert(subtype b33554460 ik33554445))
(assert(subtype b33554460 object33554493))
(assert(subtype c33554461 a33554459))
(assert(subtype c33554461 b33554460))
(assert(subtype c33554461 c33554461))
(assert(subtype c33554461 ie33554440))
(assert(subtype c33554461 if33554441))
(assert(subtype c33554461 ik33554445))
(assert(subtype c33554461 object33554493))
(assert(subtype e33554463 a33554459))
(assert(subtype e33554463 b33554460))
(assert(subtype e33554463 c33554461))
(assert(subtype e33554463 e33554463))
(assert(subtype e33554463 ie33554440))
(assert(subtype e33554463 if33554441))
(assert(subtype e33554463 ig33554442))
(assert(subtype e33554463 ih33554443))
(assert(subtype e33554463 ik33554445))
(assert(subtype e33554463 iq33554451))
(assert(subtype e33554463 object33554493))
(assert(subtype ie33554440 ie33554440))
(assert(subtype ie33554440 object33554493))
(assert(subtype if33554441 if33554441))
(assert(subtype if33554441 object33554493))
(assert(subtype ig33554442 ig33554442))
(assert(subtype ig33554442 object33554493))
(assert(subtype ih33554443 ih33554443))
(assert(subtype ih33554443 object33554493))
(assert(subtype ik33554445 ik33554445))
(assert(subtype ik33554445 object33554493))
(assert(subtype iq33554451 iq33554451))
(assert(subtype iq33554451 object33554493))
(assert(subtype k33554466 a33554459))
(assert(subtype k33554466 b33554460))
(assert(subtype k33554466 c33554461))
(assert(subtype k33554466 e33554463))
(assert(subtype k33554466 ie33554440))
(assert(subtype k33554466 if33554441))
(assert(subtype k33554466 ig33554442))
(assert(subtype k33554466 ih33554443))
(assert(subtype k33554466 ik33554445))
(assert(subtype k33554466 iq33554451))
(assert(subtype k33554466 k33554466))
(assert(subtype k33554466 object33554493))
(assert(subtype m33554470 m33554470))
(assert(subtype m33554470 object33554493))
(assert(subtype n33554471 n33554471))
(assert(subtype n33554471 object33554493))
(assert(subtype object33554493 object33554493))
(assert(forall((a Type) (b Type)) (not (and (not(subtype a m33554470)) (not(subtype b n33554471))))))
(check-sat)
(get-model)
