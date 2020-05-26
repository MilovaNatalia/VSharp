(set-option :produce-models true)
(set-option :finite-model-find true)
(set-option :tlimit-per 20000)
(declare-sort Type 0)
(declare-fun ia33554436 (Type)Type)
(declare-const i33554465 Type)
(declare-const a33554459 Type)
(declare-const b33554460 Type)
(declare-const ik33554445 Type)
(declare-const if33554441 Type)
(declare-const ie33554440 Type)
(declare-const c33554461 Type)
(declare-const d33554462 Type)
(declare-const iq33554451 Type)
(declare-const im33554447 Type)
(declare-const il33554446 Type)
(declare-const l33554467 Type)
(declare-const e33554463 Type)
(declare-const ih33554443 Type)
(declare-const ig33554442 Type)
(declare-const h33554464 Type)
(declare-const k33554466 Type)
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
(assert(default_constructor d33554462))
(assert(default_constructor e33554463))
(assert(default_constructor h33554464))
(assert(default_constructor i33554465))
(assert(default_constructor k33554466))
(assert(default_constructor l33554467))
(assert(default_constructor object33554493))
(assert(forall((a Type) (b Type)) (=> (and (= a b) (is_valuetype a)) (covariant_subtype a b))))
(assert(forall((a Type) (b Type)) (=> (and (is_reference a) (not(subtype a b))) (not(covariant_subtype a b)))))
(assert(forall((a Type) (b Type)) (=> (and (is_reference a) (subtype a b)) (covariant_subtype a b))))
(assert(forall((a Type) (b Type)) (=> (and (not(= a b)) (is_valuetype a)) (not(covariant_subtype a b)))))
(assert(forall((a Type) (b Type)) (=> (covariant_subtype a b) (subtype (ia33554436 a) (ia33554436 b)))))
(assert(forall((a Type) (b Type)) (=> (not(covariant_subtype a b)) (not(subtype (ia33554436 a) (ia33554436 b))))))
(assert(forall((a Type)) (=> (not(subtype (ia33554436 k33554466) (ia33554436 a))) (not(subtype h33554464 (ia33554436 a))))))
(assert(forall((a Type)) (=> (not(subtype (ia33554436 l33554467) (ia33554436 a))) (not(subtype i33554465 (ia33554436 a))))))
(assert(forall((a Type)) (=> (subtype (ia33554436 k33554466) (ia33554436 a)) (subtype h33554464 (ia33554436 a)))))
(assert(forall((a Type)) (=> (subtype (ia33554436 l33554467) (ia33554436 a)) (subtype i33554465 (ia33554436 a)))))
(assert(forall((a Type)) (=> false (is_unmanaged a))))
(assert(forall((a Type)) (=> false (is_valuetype a))))
(assert(forall((a Type)) (is_reference (ia33554436 a))))
(assert(forall((a Type)) (not(subtype (ia33554436 a) a33554459))))
(assert(forall((a Type)) (not(subtype (ia33554436 a) b33554460))))
(assert(forall((a Type)) (not(subtype (ia33554436 a) c33554461))))
(assert(forall((a Type)) (not(subtype (ia33554436 a) d33554462))))
(assert(forall((a Type)) (not(subtype (ia33554436 a) e33554463))))
(assert(forall((a Type)) (not(subtype (ia33554436 a) h33554464))))
(assert(forall((a Type)) (not(subtype (ia33554436 a) i33554465))))
(assert(forall((a Type)) (not(subtype (ia33554436 a) ie33554440))))
(assert(forall((a Type)) (not(subtype (ia33554436 a) if33554441))))
(assert(forall((a Type)) (not(subtype (ia33554436 a) ig33554442))))
(assert(forall((a Type)) (not(subtype (ia33554436 a) ih33554443))))
(assert(forall((a Type)) (not(subtype (ia33554436 a) ik33554445))))
(assert(forall((a Type)) (not(subtype (ia33554436 a) il33554446))))
(assert(forall((a Type)) (not(subtype (ia33554436 a) im33554447))))
(assert(forall((a Type)) (not(subtype (ia33554436 a) iq33554451))))
(assert(forall((a Type)) (not(subtype (ia33554436 a) k33554466))))
(assert(forall((a Type)) (not(subtype (ia33554436 a) l33554467))))
(assert(forall((a Type)) (not(subtype a33554459 (ia33554436 a)))))
(assert(forall((a Type)) (not(subtype b33554460 (ia33554436 a)))))
(assert(forall((a Type)) (not(subtype c33554461 (ia33554436 a)))))
(assert(forall((a Type)) (not(subtype d33554462 (ia33554436 a)))))
(assert(forall((a Type)) (not(subtype e33554463 (ia33554436 a)))))
(assert(forall((a Type)) (not(subtype ie33554440 (ia33554436 a)))))
(assert(forall((a Type)) (not(subtype if33554441 (ia33554436 a)))))
(assert(forall((a Type)) (not(subtype ig33554442 (ia33554436 a)))))
(assert(forall((a Type)) (not(subtype ih33554443 (ia33554436 a)))))
(assert(forall((a Type)) (not(subtype ik33554445 (ia33554436 a)))))
(assert(forall((a Type)) (not(subtype il33554446 (ia33554436 a)))))
(assert(forall((a Type)) (not(subtype im33554447 (ia33554436 a)))))
(assert(forall((a Type)) (not(subtype iq33554451 (ia33554436 a)))))
(assert(forall((a Type)) (not(subtype k33554466 (ia33554436 a)))))
(assert(forall((a Type)) (not(subtype l33554467 (ia33554436 a)))))
(assert(forall((a Type)) (not(subtype object33554493 (ia33554436 a)))))
(assert(forall((a Type)) (subtype (ia33554436 a) object33554493)))
(assert(forall((b Type) (a Type)) (=> (and (= b a) (is_valuetype b)) (contravariant_subtype a b))))
(assert(forall((b Type) (a Type)) (=> (and (is_reference b) (not(subtype b a))) (not(contravariant_subtype a b)))))
(assert(forall((b Type) (a Type)) (=> (and (is_reference b) (subtype b a)) (contravariant_subtype a b))))
(assert(forall((b Type) (a Type)) (=> (and (not(= b a)) (is_valuetype b)) (not(contravariant_subtype a b)))))
(assert(is_reference a33554459))
(assert(is_reference b33554460))
(assert(is_reference c33554461))
(assert(is_reference d33554462))
(assert(is_reference e33554463))
(assert(is_reference h33554464))
(assert(is_reference i33554465))
(assert(is_reference ie33554440))
(assert(is_reference if33554441))
(assert(is_reference ig33554442))
(assert(is_reference ih33554443))
(assert(is_reference ik33554445))
(assert(is_reference il33554446))
(assert(is_reference im33554447))
(assert(is_reference iq33554451))
(assert(is_reference k33554466))
(assert(is_reference l33554467))
(assert(is_reference object33554493))
(assert(not(subtype a33554459 b33554460)))
(assert(not(subtype a33554459 c33554461)))
(assert(not(subtype a33554459 d33554462)))
(assert(not(subtype a33554459 e33554463)))
(assert(not(subtype a33554459 h33554464)))
(assert(not(subtype a33554459 i33554465)))
(assert(not(subtype a33554459 ie33554440)))
(assert(not(subtype a33554459 if33554441)))
(assert(not(subtype a33554459 ig33554442)))
(assert(not(subtype a33554459 ih33554443)))
(assert(not(subtype a33554459 ik33554445)))
(assert(not(subtype a33554459 il33554446)))
(assert(not(subtype a33554459 im33554447)))
(assert(not(subtype a33554459 iq33554451)))
(assert(not(subtype a33554459 k33554466)))
(assert(not(subtype a33554459 l33554467)))
(assert(not(subtype b33554460 c33554461)))
(assert(not(subtype b33554460 d33554462)))
(assert(not(subtype b33554460 e33554463)))
(assert(not(subtype b33554460 h33554464)))
(assert(not(subtype b33554460 i33554465)))
(assert(not(subtype b33554460 ig33554442)))
(assert(not(subtype b33554460 ih33554443)))
(assert(not(subtype b33554460 il33554446)))
(assert(not(subtype b33554460 im33554447)))
(assert(not(subtype b33554460 iq33554451)))
(assert(not(subtype b33554460 k33554466)))
(assert(not(subtype b33554460 l33554467)))
(assert(not(subtype c33554461 d33554462)))
(assert(not(subtype c33554461 e33554463)))
(assert(not(subtype c33554461 h33554464)))
(assert(not(subtype c33554461 i33554465)))
(assert(not(subtype c33554461 ig33554442)))
(assert(not(subtype c33554461 ih33554443)))
(assert(not(subtype c33554461 il33554446)))
(assert(not(subtype c33554461 im33554447)))
(assert(not(subtype c33554461 iq33554451)))
(assert(not(subtype c33554461 k33554466)))
(assert(not(subtype c33554461 l33554467)))
(assert(not(subtype d33554462 e33554463)))
(assert(not(subtype d33554462 h33554464)))
(assert(not(subtype d33554462 i33554465)))
(assert(not(subtype d33554462 ig33554442)))
(assert(not(subtype d33554462 ih33554443)))
(assert(not(subtype d33554462 k33554466)))
(assert(not(subtype d33554462 l33554467)))
(assert(not(subtype e33554463 d33554462)))
(assert(not(subtype e33554463 h33554464)))
(assert(not(subtype e33554463 i33554465)))
(assert(not(subtype e33554463 il33554446)))
(assert(not(subtype e33554463 im33554447)))
(assert(not(subtype e33554463 k33554466)))
(assert(not(subtype e33554463 l33554467)))
(assert(not(subtype h33554464 e33554463)))
(assert(not(subtype h33554464 i33554465)))
(assert(not(subtype h33554464 ig33554442)))
(assert(not(subtype h33554464 ih33554443)))
(assert(not(subtype h33554464 k33554466)))
(assert(not(subtype h33554464 l33554467)))
(assert(not(subtype i33554465 e33554463)))
(assert(not(subtype i33554465 h33554464)))
(assert(not(subtype i33554465 ig33554442)))
(assert(not(subtype i33554465 ih33554443)))
(assert(not(subtype i33554465 k33554466)))
(assert(not(subtype i33554465 l33554467)))
(assert(not(subtype ie33554440 a33554459)))
(assert(not(subtype ie33554440 b33554460)))
(assert(not(subtype ie33554440 c33554461)))
(assert(not(subtype ie33554440 d33554462)))
(assert(not(subtype ie33554440 e33554463)))
(assert(not(subtype ie33554440 h33554464)))
(assert(not(subtype ie33554440 i33554465)))
(assert(not(subtype ie33554440 if33554441)))
(assert(not(subtype ie33554440 ig33554442)))
(assert(not(subtype ie33554440 ih33554443)))
(assert(not(subtype ie33554440 ik33554445)))
(assert(not(subtype ie33554440 il33554446)))
(assert(not(subtype ie33554440 im33554447)))
(assert(not(subtype ie33554440 iq33554451)))
(assert(not(subtype ie33554440 k33554466)))
(assert(not(subtype ie33554440 l33554467)))
(assert(not(subtype if33554441 a33554459)))
(assert(not(subtype if33554441 b33554460)))
(assert(not(subtype if33554441 c33554461)))
(assert(not(subtype if33554441 d33554462)))
(assert(not(subtype if33554441 e33554463)))
(assert(not(subtype if33554441 h33554464)))
(assert(not(subtype if33554441 i33554465)))
(assert(not(subtype if33554441 ie33554440)))
(assert(not(subtype if33554441 ig33554442)))
(assert(not(subtype if33554441 ih33554443)))
(assert(not(subtype if33554441 ik33554445)))
(assert(not(subtype if33554441 il33554446)))
(assert(not(subtype if33554441 im33554447)))
(assert(not(subtype if33554441 iq33554451)))
(assert(not(subtype if33554441 k33554466)))
(assert(not(subtype if33554441 l33554467)))
(assert(not(subtype ig33554442 a33554459)))
(assert(not(subtype ig33554442 b33554460)))
(assert(not(subtype ig33554442 c33554461)))
(assert(not(subtype ig33554442 d33554462)))
(assert(not(subtype ig33554442 e33554463)))
(assert(not(subtype ig33554442 h33554464)))
(assert(not(subtype ig33554442 i33554465)))
(assert(not(subtype ig33554442 ie33554440)))
(assert(not(subtype ig33554442 if33554441)))
(assert(not(subtype ig33554442 ih33554443)))
(assert(not(subtype ig33554442 ik33554445)))
(assert(not(subtype ig33554442 il33554446)))
(assert(not(subtype ig33554442 im33554447)))
(assert(not(subtype ig33554442 iq33554451)))
(assert(not(subtype ig33554442 k33554466)))
(assert(not(subtype ig33554442 l33554467)))
(assert(not(subtype ih33554443 a33554459)))
(assert(not(subtype ih33554443 b33554460)))
(assert(not(subtype ih33554443 c33554461)))
(assert(not(subtype ih33554443 d33554462)))
(assert(not(subtype ih33554443 e33554463)))
(assert(not(subtype ih33554443 h33554464)))
(assert(not(subtype ih33554443 i33554465)))
(assert(not(subtype ih33554443 ie33554440)))
(assert(not(subtype ih33554443 if33554441)))
(assert(not(subtype ih33554443 ig33554442)))
(assert(not(subtype ih33554443 ik33554445)))
(assert(not(subtype ih33554443 il33554446)))
(assert(not(subtype ih33554443 im33554447)))
(assert(not(subtype ih33554443 iq33554451)))
(assert(not(subtype ih33554443 k33554466)))
(assert(not(subtype ih33554443 l33554467)))
(assert(not(subtype ik33554445 a33554459)))
(assert(not(subtype ik33554445 b33554460)))
(assert(not(subtype ik33554445 c33554461)))
(assert(not(subtype ik33554445 d33554462)))
(assert(not(subtype ik33554445 e33554463)))
(assert(not(subtype ik33554445 h33554464)))
(assert(not(subtype ik33554445 i33554465)))
(assert(not(subtype ik33554445 ie33554440)))
(assert(not(subtype ik33554445 if33554441)))
(assert(not(subtype ik33554445 ig33554442)))
(assert(not(subtype ik33554445 ih33554443)))
(assert(not(subtype ik33554445 il33554446)))
(assert(not(subtype ik33554445 im33554447)))
(assert(not(subtype ik33554445 iq33554451)))
(assert(not(subtype ik33554445 k33554466)))
(assert(not(subtype ik33554445 l33554467)))
(assert(not(subtype il33554446 a33554459)))
(assert(not(subtype il33554446 b33554460)))
(assert(not(subtype il33554446 c33554461)))
(assert(not(subtype il33554446 d33554462)))
(assert(not(subtype il33554446 e33554463)))
(assert(not(subtype il33554446 h33554464)))
(assert(not(subtype il33554446 i33554465)))
(assert(not(subtype il33554446 ie33554440)))
(assert(not(subtype il33554446 if33554441)))
(assert(not(subtype il33554446 ig33554442)))
(assert(not(subtype il33554446 ih33554443)))
(assert(not(subtype il33554446 ik33554445)))
(assert(not(subtype il33554446 im33554447)))
(assert(not(subtype il33554446 iq33554451)))
(assert(not(subtype il33554446 k33554466)))
(assert(not(subtype il33554446 l33554467)))
(assert(not(subtype im33554447 a33554459)))
(assert(not(subtype im33554447 b33554460)))
(assert(not(subtype im33554447 c33554461)))
(assert(not(subtype im33554447 d33554462)))
(assert(not(subtype im33554447 e33554463)))
(assert(not(subtype im33554447 h33554464)))
(assert(not(subtype im33554447 i33554465)))
(assert(not(subtype im33554447 ie33554440)))
(assert(not(subtype im33554447 if33554441)))
(assert(not(subtype im33554447 ig33554442)))
(assert(not(subtype im33554447 ih33554443)))
(assert(not(subtype im33554447 ik33554445)))
(assert(not(subtype im33554447 il33554446)))
(assert(not(subtype im33554447 iq33554451)))
(assert(not(subtype im33554447 k33554466)))
(assert(not(subtype im33554447 l33554467)))
(assert(not(subtype iq33554451 a33554459)))
(assert(not(subtype iq33554451 b33554460)))
(assert(not(subtype iq33554451 c33554461)))
(assert(not(subtype iq33554451 d33554462)))
(assert(not(subtype iq33554451 e33554463)))
(assert(not(subtype iq33554451 h33554464)))
(assert(not(subtype iq33554451 i33554465)))
(assert(not(subtype iq33554451 ie33554440)))
(assert(not(subtype iq33554451 if33554441)))
(assert(not(subtype iq33554451 ig33554442)))
(assert(not(subtype iq33554451 ih33554443)))
(assert(not(subtype iq33554451 ik33554445)))
(assert(not(subtype iq33554451 il33554446)))
(assert(not(subtype iq33554451 im33554447)))
(assert(not(subtype iq33554451 k33554466)))
(assert(not(subtype iq33554451 l33554467)))
(assert(not(subtype k33554466 d33554462)))
(assert(not(subtype k33554466 h33554464)))
(assert(not(subtype k33554466 i33554465)))
(assert(not(subtype k33554466 il33554446)))
(assert(not(subtype k33554466 im33554447)))
(assert(not(subtype k33554466 l33554467)))
(assert(not(subtype l33554467 d33554462)))
(assert(not(subtype l33554467 h33554464)))
(assert(not(subtype l33554467 i33554465)))
(assert(not(subtype l33554467 il33554446)))
(assert(not(subtype l33554467 im33554447)))
(assert(not(subtype l33554467 k33554466)))
(assert(not(subtype object33554493 a33554459)))
(assert(not(subtype object33554493 b33554460)))
(assert(not(subtype object33554493 c33554461)))
(assert(not(subtype object33554493 d33554462)))
(assert(not(subtype object33554493 e33554463)))
(assert(not(subtype object33554493 h33554464)))
(assert(not(subtype object33554493 i33554465)))
(assert(not(subtype object33554493 ie33554440)))
(assert(not(subtype object33554493 if33554441)))
(assert(not(subtype object33554493 ig33554442)))
(assert(not(subtype object33554493 ih33554443)))
(assert(not(subtype object33554493 ik33554445)))
(assert(not(subtype object33554493 il33554446)))
(assert(not(subtype object33554493 im33554447)))
(assert(not(subtype object33554493 iq33554451)))
(assert(not(subtype object33554493 k33554466)))
(assert(not(subtype object33554493 l33554467)))
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
(assert(subtype d33554462 a33554459))
(assert(subtype d33554462 b33554460))
(assert(subtype d33554462 c33554461))
(assert(subtype d33554462 d33554462))
(assert(subtype d33554462 ie33554440))
(assert(subtype d33554462 if33554441))
(assert(subtype d33554462 ik33554445))
(assert(subtype d33554462 il33554446))
(assert(subtype d33554462 im33554447))
(assert(subtype d33554462 iq33554451))
(assert(subtype d33554462 object33554493))
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
(assert(subtype h33554464 a33554459))
(assert(subtype h33554464 b33554460))
(assert(subtype h33554464 c33554461))
(assert(subtype h33554464 d33554462))
(assert(subtype h33554464 h33554464))
(assert(subtype h33554464 ie33554440))
(assert(subtype h33554464 if33554441))
(assert(subtype h33554464 ik33554445))
(assert(subtype h33554464 il33554446))
(assert(subtype h33554464 im33554447))
(assert(subtype h33554464 iq33554451))
(assert(subtype h33554464 object33554493))
(assert(subtype i33554465 a33554459))
(assert(subtype i33554465 b33554460))
(assert(subtype i33554465 c33554461))
(assert(subtype i33554465 d33554462))
(assert(subtype i33554465 i33554465))
(assert(subtype i33554465 ie33554440))
(assert(subtype i33554465 if33554441))
(assert(subtype i33554465 ik33554445))
(assert(subtype i33554465 il33554446))
(assert(subtype i33554465 im33554447))
(assert(subtype i33554465 iq33554451))
(assert(subtype i33554465 object33554493))
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
(assert(subtype il33554446 il33554446))
(assert(subtype il33554446 object33554493))
(assert(subtype im33554447 im33554447))
(assert(subtype im33554447 object33554493))
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
(assert(subtype l33554467 a33554459))
(assert(subtype l33554467 b33554460))
(assert(subtype l33554467 c33554461))
(assert(subtype l33554467 e33554463))
(assert(subtype l33554467 ie33554440))
(assert(subtype l33554467 if33554441))
(assert(subtype l33554467 ig33554442))
(assert(subtype l33554467 ih33554443))
(assert(subtype l33554467 ik33554445))
(assert(subtype l33554467 iq33554451))
(assert(subtype l33554467 l33554467))
(assert(subtype l33554467 object33554493))
(assert(subtype object33554493 object33554493))
(assert(forall((a Type) (b Type) (c Type) (d Type)) (not (and (not(subtype a (ia33554436 b))) (not(subtype c (ia33554436 b))) (not(subtype a (ia33554436 h33554464))) (not(subtype d (ia33554436 i33554465)))))))
(check-sat)
(get-model)
