(set-option :produce-models true)
(set-option :finite-model-find true)
(set-option :tlimit-per 20000)
(declare-sort Type 0)
(declare-fun tuple33554529 (Type Type)Type)
(declare-const ituple33556673 Type)
(declare-const itupleinternal33554526 Type)
(declare-const icomparable33554520 Type)
(declare-const istructuralcomparable33555577 Type)
(declare-const istructuralequatable33555576 Type)
(declare-fun tuple33554528 (Type)Type)
(declare-const object33554493 Type)
(declare-fun covariant_subtype (Type Type) Bool)
(declare-fun contravariant_subtype (Type Type) Bool)
(declare-fun subtype (Type Type) Bool)
(declare-fun is_reference (Type) Bool)
(declare-fun is_valuetype (Type) Bool)
(declare-fun is_unmanaged (Type) Bool)
(declare-fun default_constructor (Type) Bool)
(assert(default_constructor object33554493))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (tuple33554528 a) (tuple33554529 b c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (tuple33554529 a b) (tuple33554528 c)))))
(assert(forall((a Type) (b Type)) (=> (= a b) (subtype (tuple33554528 a) (tuple33554528 b)))))
(assert(forall((a Type) (b Type)) (=> (and (= a b) (is_valuetype a)) (covariant_subtype a b))))
(assert(forall((a Type) (b Type)) (=> (and (is_reference a) (not(subtype a b))) (not(covariant_subtype a b)))))
(assert(forall((a Type) (b Type)) (=> (and (is_reference a) (subtype a b)) (covariant_subtype a b))))
(assert(forall((a Type) (b Type)) (=> (and (not(= a b)) (is_valuetype a)) (not(covariant_subtype a b)))))
(assert(forall((a Type) (b Type)) (=> (not(= a b)) (not(subtype (tuple33554528 a) (tuple33554528 b))))))
(assert(forall((a Type) (b Type)) (is_reference (tuple33554529 a b))))
(assert(forall((a Type) (b Type)) (not(subtype icomparable33554520 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype istructuralcomparable33555577 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype istructuralequatable33555576 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype ituple33556673 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype itupleinternal33554526 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype object33554493 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (subtype (tuple33554529 a b) icomparable33554520)))
(assert(forall((a Type) (b Type)) (subtype (tuple33554529 a b) istructuralcomparable33555577)))
(assert(forall((a Type) (b Type)) (subtype (tuple33554529 a b) istructuralequatable33555576)))
(assert(forall((a Type) (b Type)) (subtype (tuple33554529 a b) ituple33556673)))
(assert(forall((a Type) (b Type)) (subtype (tuple33554529 a b) itupleinternal33554526)))
(assert(forall((a Type) (b Type)) (subtype (tuple33554529 a b) object33554493)))
(assert(forall((a Type) (c Type) (b Type) (d Type)) (=> (and (= a c) (= b d)) (subtype (tuple33554529 a b) (tuple33554529 c d)))))
(assert(forall((a Type) (c Type) (b Type) (d Type)) (=> (not(= a c)) (not(subtype (tuple33554529 a b) (tuple33554529 c d))))))
(assert(forall((a Type)) (=> false (is_unmanaged a))))
(assert(forall((a Type)) (=> false (is_valuetype a))))
(assert(forall((a Type)) (is_reference (tuple33554528 a))))
(assert(forall((a Type)) (not(subtype icomparable33554520 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype istructuralcomparable33555577 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype istructuralequatable33555576 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype ituple33556673 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype itupleinternal33554526 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype object33554493 (tuple33554528 a)))))
(assert(forall((a Type)) (subtype (tuple33554528 a) icomparable33554520)))
(assert(forall((a Type)) (subtype (tuple33554528 a) istructuralcomparable33555577)))
(assert(forall((a Type)) (subtype (tuple33554528 a) istructuralequatable33555576)))
(assert(forall((a Type)) (subtype (tuple33554528 a) ituple33556673)))
(assert(forall((a Type)) (subtype (tuple33554528 a) itupleinternal33554526)))
(assert(forall((a Type)) (subtype (tuple33554528 a) object33554493)))
(assert(forall((b Type) (a Type)) (=> (and (= b a) (is_valuetype b)) (contravariant_subtype a b))))
(assert(forall((b Type) (a Type)) (=> (and (is_reference b) (not(subtype b a))) (not(contravariant_subtype a b)))))
(assert(forall((b Type) (a Type)) (=> (and (is_reference b) (subtype b a)) (contravariant_subtype a b))))
(assert(forall((b Type) (a Type)) (=> (and (not(= b a)) (is_valuetype b)) (not(contravariant_subtype a b)))))
(assert(forall((b Type) (d Type) (a Type) (c Type)) (=> (not(= b d)) (not(subtype (tuple33554529 a b) (tuple33554529 c d))))))
(assert(is_reference icomparable33554520))
(assert(is_reference istructuralcomparable33555577))
(assert(is_reference istructuralequatable33555576))
(assert(is_reference ituple33556673))
(assert(is_reference itupleinternal33554526))
(assert(is_reference object33554493))
(assert(not(subtype icomparable33554520 istructuralcomparable33555577)))
(assert(not(subtype icomparable33554520 istructuralequatable33555576)))
(assert(not(subtype icomparable33554520 ituple33556673)))
(assert(not(subtype icomparable33554520 itupleinternal33554526)))
(assert(not(subtype istructuralcomparable33555577 icomparable33554520)))
(assert(not(subtype istructuralcomparable33555577 istructuralequatable33555576)))
(assert(not(subtype istructuralcomparable33555577 ituple33556673)))
(assert(not(subtype istructuralcomparable33555577 itupleinternal33554526)))
(assert(not(subtype istructuralequatable33555576 icomparable33554520)))
(assert(not(subtype istructuralequatable33555576 istructuralcomparable33555577)))
(assert(not(subtype istructuralequatable33555576 ituple33556673)))
(assert(not(subtype istructuralequatable33555576 itupleinternal33554526)))
(assert(not(subtype ituple33556673 icomparable33554520)))
(assert(not(subtype ituple33556673 istructuralcomparable33555577)))
(assert(not(subtype ituple33556673 istructuralequatable33555576)))
(assert(not(subtype ituple33556673 itupleinternal33554526)))
(assert(not(subtype itupleinternal33554526 icomparable33554520)))
(assert(not(subtype itupleinternal33554526 istructuralcomparable33555577)))
(assert(not(subtype itupleinternal33554526 istructuralequatable33555576)))
(assert(not(subtype object33554493 icomparable33554520)))
(assert(not(subtype object33554493 istructuralcomparable33555577)))
(assert(not(subtype object33554493 istructuralequatable33555576)))
(assert(not(subtype object33554493 ituple33556673)))
(assert(not(subtype object33554493 itupleinternal33554526)))
(assert(subtype icomparable33554520 icomparable33554520))
(assert(subtype icomparable33554520 object33554493))
(assert(subtype istructuralcomparable33555577 istructuralcomparable33555577))
(assert(subtype istructuralcomparable33555577 object33554493))
(assert(subtype istructuralequatable33555576 istructuralequatable33555576))
(assert(subtype istructuralequatable33555576 object33554493))
(assert(subtype ituple33556673 ituple33556673))
(assert(subtype ituple33556673 object33554493))
(assert(subtype itupleinternal33554526 ituple33556673))
(assert(subtype itupleinternal33554526 itupleinternal33554526))
(assert(subtype itupleinternal33554526 object33554493))
(assert(subtype object33554493 object33554493))
(assert(forall((a Type) (b Type) (c Type)) (not (and (not(subtype a (tuple33554529 (tuple33554528 a) a))) (not(subtype b (tuple33554529 (tuple33554528 a) a))) (not(subtype a (tuple33554529 a c))) (not(subtype b (tuple33554529 a c)))))))
(check-sat)
(get-model)
