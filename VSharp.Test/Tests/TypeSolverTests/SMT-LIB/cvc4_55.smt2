(set-option :produce-models true)
(set-option :finite-model-find true)
(set-option :tlimit-per 20000)
(declare-sort Type 0)
(declare-fun array233554434 (Type)Type)
(declare-const array33554517 Type)
(declare-const istructuralequatable33555576 Type)
(declare-const istructuralcomparable33555577 Type)
(declare-const ienumerable33555569 Type)
(declare-const icollection33555565 Type)
(declare-const ilist33555573 Type)
(declare-const icloneable33554495 Type)
(declare-const int3233554683 Type)
(declare-const valuetype33554777 Type)
(declare-fun iequatable33554522 (Type)Type)
(declare-fun icomparable33554521 (Type)Type)
(declare-const iconvertible33554691 Type)
(declare-const iformattable33554672 Type)
(declare-const icomparable33554520 Type)
(declare-fun tuple33554529 (Type Type)Type)
(declare-const ituple33556673 Type)
(declare-const itupleinternal33554526 Type)
(declare-fun tuple33554528 (Type)Type)
(declare-const object33554493 Type)
(declare-fun covariant_subtype (Type Type) Bool)
(declare-fun contravariant_subtype (Type Type) Bool)
(declare-fun subtype (Type Type) Bool)
(declare-fun is_reference (Type) Bool)
(declare-fun is_valuetype (Type) Bool)
(declare-fun is_unmanaged (Type) Bool)
(declare-fun default_constructor (Type) Bool)
(assert(default_constructor int3233554683))
(assert(default_constructor object33554493))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (array233554434 a) (tuple33554529 b c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (icomparable33554521 a) (tuple33554529 b c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (iequatable33554522 a) (tuple33554529 b c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (tuple33554528 a) (tuple33554529 b c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (tuple33554529 a b) (array233554434 c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (tuple33554529 a b) (icomparable33554521 c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (tuple33554529 a b) (iequatable33554522 c)))))
(assert(forall((a Type) (b Type) (c Type)) (not(subtype (tuple33554529 a b) (tuple33554528 c)))))
(assert(forall((a Type) (b Type)) (=> (= a b) (subtype (iequatable33554522 a) (iequatable33554522 b)))))
(assert(forall((a Type) (b Type)) (=> (= a b) (subtype (tuple33554528 a) (tuple33554528 b)))))
(assert(forall((a Type) (b Type)) (=> (and (= a b) (is_valuetype a)) (covariant_subtype a b))))
(assert(forall((a Type) (b Type)) (=> (and (is_reference a) (not(subtype a b))) (not(covariant_subtype a b)))))
(assert(forall((a Type) (b Type)) (=> (and (is_reference a) (subtype a b)) (covariant_subtype a b))))
(assert(forall((a Type) (b Type)) (=> (and (not(= a b)) (is_valuetype a)) (not(covariant_subtype a b)))))
(assert(forall((a Type) (b Type)) (=> (contravariant_subtype a b) (subtype (icomparable33554521 a) (icomparable33554521 b)))))
(assert(forall((a Type) (b Type)) (=> (covariant_subtype a b) (subtype (array233554434 a) (array233554434 b)))))
(assert(forall((a Type) (b Type)) (=> (not(= a b)) (not(subtype (iequatable33554522 a) (iequatable33554522 b))))))
(assert(forall((a Type) (b Type)) (=> (not(= a b)) (not(subtype (tuple33554528 a) (tuple33554528 b))))))
(assert(forall((a Type) (b Type)) (=> (not(contravariant_subtype a b)) (not(subtype (icomparable33554521 a) (icomparable33554521 b))))))
(assert(forall((a Type) (b Type)) (=> (not(covariant_subtype a b)) (not(subtype (array233554434 a) (array233554434 b))))))
(assert(forall((a Type) (b Type)) (is_reference (tuple33554529 a b))))
(assert(forall((a Type) (b Type)) (not(subtype (array233554434 a) (icomparable33554521 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (array233554434 a) (iequatable33554522 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (array233554434 a) (tuple33554528 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (icomparable33554521 a) (array233554434 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (icomparable33554521 a) (iequatable33554522 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (icomparable33554521 a) (tuple33554528 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (iequatable33554522 a) (array233554434 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (iequatable33554522 a) (icomparable33554521 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (iequatable33554522 a) (tuple33554528 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (tuple33554528 a) (array233554434 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (tuple33554528 a) (icomparable33554521 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (tuple33554528 a) (iequatable33554522 b)))))
(assert(forall((a Type) (b Type)) (not(subtype (tuple33554529 a b) array33554517))))
(assert(forall((a Type) (b Type)) (not(subtype (tuple33554529 a b) icloneable33554495))))
(assert(forall((a Type) (b Type)) (not(subtype (tuple33554529 a b) icollection33555565))))
(assert(forall((a Type) (b Type)) (not(subtype (tuple33554529 a b) iconvertible33554691))))
(assert(forall((a Type) (b Type)) (not(subtype (tuple33554529 a b) ienumerable33555569))))
(assert(forall((a Type) (b Type)) (not(subtype (tuple33554529 a b) iformattable33554672))))
(assert(forall((a Type) (b Type)) (not(subtype (tuple33554529 a b) ilist33555573))))
(assert(forall((a Type) (b Type)) (not(subtype (tuple33554529 a b) int3233554683))))
(assert(forall((a Type) (b Type)) (not(subtype (tuple33554529 a b) valuetype33554777))))
(assert(forall((a Type) (b Type)) (not(subtype array33554517 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype icloneable33554495 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype icollection33555565 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype icomparable33554520 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype iconvertible33554691 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype ienumerable33555569 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype iformattable33554672 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype ilist33555573 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype int3233554683 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype istructuralcomparable33555577 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype istructuralequatable33555576 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype ituple33556673 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype itupleinternal33554526 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype object33554493 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype valuetype33554777 (tuple33554529 a b)))))
(assert(forall((a Type) (b Type)) (subtype (tuple33554529 a b) icomparable33554520)))
(assert(forall((a Type) (b Type)) (subtype (tuple33554529 a b) istructuralcomparable33555577)))
(assert(forall((a Type) (b Type)) (subtype (tuple33554529 a b) istructuralequatable33555576)))
(assert(forall((a Type) (b Type)) (subtype (tuple33554529 a b) ituple33556673)))
(assert(forall((a Type) (b Type)) (subtype (tuple33554529 a b) itupleinternal33554526)))
(assert(forall((a Type) (b Type)) (subtype (tuple33554529 a b) object33554493)))
(assert(forall((a Type) (c Type) (b Type) (d Type)) (=> (and (= a c) (= b d)) (subtype (tuple33554529 a b) (tuple33554529 c d)))))
(assert(forall((a Type) (c Type) (b Type) (d Type)) (=> (not(= a c)) (not(subtype (tuple33554529 a b) (tuple33554529 c d))))))
(assert(forall((a Type)) (=> (not(subtype (icomparable33554521 int3233554683) (icomparable33554521 a))) (not(subtype int3233554683 (icomparable33554521 a))))))
(assert(forall((a Type)) (=> (not(subtype (iequatable33554522 int3233554683) (iequatable33554522 a))) (not(subtype int3233554683 (iequatable33554522 a))))))
(assert(forall((a Type)) (=> (subtype (icomparable33554521 int3233554683) (icomparable33554521 a)) (subtype int3233554683 (icomparable33554521 a)))))
(assert(forall((a Type)) (=> (subtype (iequatable33554522 int3233554683) (iequatable33554522 a)) (subtype int3233554683 (iequatable33554522 a)))))
(assert(forall((a Type)) (is_reference (array233554434 a))))
(assert(forall((a Type)) (is_reference (icomparable33554521 a))))
(assert(forall((a Type)) (is_reference (iequatable33554522 a))))
(assert(forall((a Type)) (is_reference (tuple33554528 a))))
(assert(forall((a Type)) (not(subtype (array233554434 a) icomparable33554520))))
(assert(forall((a Type)) (not(subtype (array233554434 a) iconvertible33554691))))
(assert(forall((a Type)) (not(subtype (array233554434 a) iformattable33554672))))
(assert(forall((a Type)) (not(subtype (array233554434 a) int3233554683))))
(assert(forall((a Type)) (not(subtype (array233554434 a) ituple33556673))))
(assert(forall((a Type)) (not(subtype (array233554434 a) itupleinternal33554526))))
(assert(forall((a Type)) (not(subtype (array233554434 a) valuetype33554777))))
(assert(forall((a Type)) (not(subtype (icomparable33554521 a) array33554517))))
(assert(forall((a Type)) (not(subtype (icomparable33554521 a) icloneable33554495))))
(assert(forall((a Type)) (not(subtype (icomparable33554521 a) icollection33555565))))
(assert(forall((a Type)) (not(subtype (icomparable33554521 a) icomparable33554520))))
(assert(forall((a Type)) (not(subtype (icomparable33554521 a) iconvertible33554691))))
(assert(forall((a Type)) (not(subtype (icomparable33554521 a) ienumerable33555569))))
(assert(forall((a Type)) (not(subtype (icomparable33554521 a) iformattable33554672))))
(assert(forall((a Type)) (not(subtype (icomparable33554521 a) ilist33555573))))
(assert(forall((a Type)) (not(subtype (icomparable33554521 a) int3233554683))))
(assert(forall((a Type)) (not(subtype (icomparable33554521 a) istructuralcomparable33555577))))
(assert(forall((a Type)) (not(subtype (icomparable33554521 a) istructuralequatable33555576))))
(assert(forall((a Type)) (not(subtype (icomparable33554521 a) ituple33556673))))
(assert(forall((a Type)) (not(subtype (icomparable33554521 a) itupleinternal33554526))))
(assert(forall((a Type)) (not(subtype (icomparable33554521 a) valuetype33554777))))
(assert(forall((a Type)) (not(subtype (iequatable33554522 a) array33554517))))
(assert(forall((a Type)) (not(subtype (iequatable33554522 a) icloneable33554495))))
(assert(forall((a Type)) (not(subtype (iequatable33554522 a) icollection33555565))))
(assert(forall((a Type)) (not(subtype (iequatable33554522 a) icomparable33554520))))
(assert(forall((a Type)) (not(subtype (iequatable33554522 a) iconvertible33554691))))
(assert(forall((a Type)) (not(subtype (iequatable33554522 a) ienumerable33555569))))
(assert(forall((a Type)) (not(subtype (iequatable33554522 a) iformattable33554672))))
(assert(forall((a Type)) (not(subtype (iequatable33554522 a) ilist33555573))))
(assert(forall((a Type)) (not(subtype (iequatable33554522 a) int3233554683))))
(assert(forall((a Type)) (not(subtype (iequatable33554522 a) istructuralcomparable33555577))))
(assert(forall((a Type)) (not(subtype (iequatable33554522 a) istructuralequatable33555576))))
(assert(forall((a Type)) (not(subtype (iequatable33554522 a) ituple33556673))))
(assert(forall((a Type)) (not(subtype (iequatable33554522 a) itupleinternal33554526))))
(assert(forall((a Type)) (not(subtype (iequatable33554522 a) valuetype33554777))))
(assert(forall((a Type)) (not(subtype (tuple33554528 a) array33554517))))
(assert(forall((a Type)) (not(subtype (tuple33554528 a) icloneable33554495))))
(assert(forall((a Type)) (not(subtype (tuple33554528 a) icollection33555565))))
(assert(forall((a Type)) (not(subtype (tuple33554528 a) iconvertible33554691))))
(assert(forall((a Type)) (not(subtype (tuple33554528 a) ienumerable33555569))))
(assert(forall((a Type)) (not(subtype (tuple33554528 a) iformattable33554672))))
(assert(forall((a Type)) (not(subtype (tuple33554528 a) ilist33555573))))
(assert(forall((a Type)) (not(subtype (tuple33554528 a) int3233554683))))
(assert(forall((a Type)) (not(subtype (tuple33554528 a) valuetype33554777))))
(assert(forall((a Type)) (not(subtype array33554517 (array233554434 a)))))
(assert(forall((a Type)) (not(subtype array33554517 (icomparable33554521 a)))))
(assert(forall((a Type)) (not(subtype array33554517 (iequatable33554522 a)))))
(assert(forall((a Type)) (not(subtype array33554517 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype icloneable33554495 (array233554434 a)))))
(assert(forall((a Type)) (not(subtype icloneable33554495 (icomparable33554521 a)))))
(assert(forall((a Type)) (not(subtype icloneable33554495 (iequatable33554522 a)))))
(assert(forall((a Type)) (not(subtype icloneable33554495 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype icollection33555565 (array233554434 a)))))
(assert(forall((a Type)) (not(subtype icollection33555565 (icomparable33554521 a)))))
(assert(forall((a Type)) (not(subtype icollection33555565 (iequatable33554522 a)))))
(assert(forall((a Type)) (not(subtype icollection33555565 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype icomparable33554520 (array233554434 a)))))
(assert(forall((a Type)) (not(subtype icomparable33554520 (icomparable33554521 a)))))
(assert(forall((a Type)) (not(subtype icomparable33554520 (iequatable33554522 a)))))
(assert(forall((a Type)) (not(subtype icomparable33554520 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype iconvertible33554691 (array233554434 a)))))
(assert(forall((a Type)) (not(subtype iconvertible33554691 (icomparable33554521 a)))))
(assert(forall((a Type)) (not(subtype iconvertible33554691 (iequatable33554522 a)))))
(assert(forall((a Type)) (not(subtype iconvertible33554691 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype ienumerable33555569 (array233554434 a)))))
(assert(forall((a Type)) (not(subtype ienumerable33555569 (icomparable33554521 a)))))
(assert(forall((a Type)) (not(subtype ienumerable33555569 (iequatable33554522 a)))))
(assert(forall((a Type)) (not(subtype ienumerable33555569 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype iformattable33554672 (array233554434 a)))))
(assert(forall((a Type)) (not(subtype iformattable33554672 (icomparable33554521 a)))))
(assert(forall((a Type)) (not(subtype iformattable33554672 (iequatable33554522 a)))))
(assert(forall((a Type)) (not(subtype iformattable33554672 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype ilist33555573 (array233554434 a)))))
(assert(forall((a Type)) (not(subtype ilist33555573 (icomparable33554521 a)))))
(assert(forall((a Type)) (not(subtype ilist33555573 (iequatable33554522 a)))))
(assert(forall((a Type)) (not(subtype ilist33555573 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype int3233554683 (array233554434 a)))))
(assert(forall((a Type)) (not(subtype int3233554683 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype istructuralcomparable33555577 (array233554434 a)))))
(assert(forall((a Type)) (not(subtype istructuralcomparable33555577 (icomparable33554521 a)))))
(assert(forall((a Type)) (not(subtype istructuralcomparable33555577 (iequatable33554522 a)))))
(assert(forall((a Type)) (not(subtype istructuralcomparable33555577 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype istructuralequatable33555576 (array233554434 a)))))
(assert(forall((a Type)) (not(subtype istructuralequatable33555576 (icomparable33554521 a)))))
(assert(forall((a Type)) (not(subtype istructuralequatable33555576 (iequatable33554522 a)))))
(assert(forall((a Type)) (not(subtype istructuralequatable33555576 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype ituple33556673 (array233554434 a)))))
(assert(forall((a Type)) (not(subtype ituple33556673 (icomparable33554521 a)))))
(assert(forall((a Type)) (not(subtype ituple33556673 (iequatable33554522 a)))))
(assert(forall((a Type)) (not(subtype ituple33556673 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype itupleinternal33554526 (array233554434 a)))))
(assert(forall((a Type)) (not(subtype itupleinternal33554526 (icomparable33554521 a)))))
(assert(forall((a Type)) (not(subtype itupleinternal33554526 (iequatable33554522 a)))))
(assert(forall((a Type)) (not(subtype itupleinternal33554526 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype object33554493 (array233554434 a)))))
(assert(forall((a Type)) (not(subtype object33554493 (icomparable33554521 a)))))
(assert(forall((a Type)) (not(subtype object33554493 (iequatable33554522 a)))))
(assert(forall((a Type)) (not(subtype object33554493 (tuple33554528 a)))))
(assert(forall((a Type)) (not(subtype valuetype33554777 (array233554434 a)))))
(assert(forall((a Type)) (not(subtype valuetype33554777 (icomparable33554521 a)))))
(assert(forall((a Type)) (not(subtype valuetype33554777 (iequatable33554522 a)))))
(assert(forall((a Type)) (not(subtype valuetype33554777 (tuple33554528 a)))))
(assert(forall((a Type)) (subtype (array233554434 a) array33554517)))
(assert(forall((a Type)) (subtype (array233554434 a) icloneable33554495)))
(assert(forall((a Type)) (subtype (array233554434 a) icollection33555565)))
(assert(forall((a Type)) (subtype (array233554434 a) ienumerable33555569)))
(assert(forall((a Type)) (subtype (array233554434 a) ilist33555573)))
(assert(forall((a Type)) (subtype (array233554434 a) istructuralcomparable33555577)))
(assert(forall((a Type)) (subtype (array233554434 a) istructuralequatable33555576)))
(assert(forall((a Type)) (subtype (array233554434 a) object33554493)))
(assert(forall((a Type)) (subtype (icomparable33554521 a) object33554493)))
(assert(forall((a Type)) (subtype (iequatable33554522 a) object33554493)))
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
(assert(is_reference array33554517))
(assert(is_reference icloneable33554495))
(assert(is_reference icollection33555565))
(assert(is_reference icomparable33554520))
(assert(is_reference iconvertible33554691))
(assert(is_reference ienumerable33555569))
(assert(is_reference iformattable33554672))
(assert(is_reference ilist33555573))
(assert(is_reference istructuralcomparable33555577))
(assert(is_reference istructuralequatable33555576))
(assert(is_reference ituple33556673))
(assert(is_reference itupleinternal33554526))
(assert(is_reference object33554493))
(assert(is_reference valuetype33554777))
(assert(is_unmanaged int3233554683))
(assert(is_valuetype int3233554683))
(assert(not(subtype array33554517 icomparable33554520)))
(assert(not(subtype array33554517 iconvertible33554691)))
(assert(not(subtype array33554517 iformattable33554672)))
(assert(not(subtype array33554517 int3233554683)))
(assert(not(subtype array33554517 ituple33556673)))
(assert(not(subtype array33554517 itupleinternal33554526)))
(assert(not(subtype array33554517 valuetype33554777)))
(assert(not(subtype icloneable33554495 array33554517)))
(assert(not(subtype icloneable33554495 icollection33555565)))
(assert(not(subtype icloneable33554495 icomparable33554520)))
(assert(not(subtype icloneable33554495 iconvertible33554691)))
(assert(not(subtype icloneable33554495 ienumerable33555569)))
(assert(not(subtype icloneable33554495 iformattable33554672)))
(assert(not(subtype icloneable33554495 ilist33555573)))
(assert(not(subtype icloneable33554495 int3233554683)))
(assert(not(subtype icloneable33554495 istructuralcomparable33555577)))
(assert(not(subtype icloneable33554495 istructuralequatable33555576)))
(assert(not(subtype icloneable33554495 ituple33556673)))
(assert(not(subtype icloneable33554495 itupleinternal33554526)))
(assert(not(subtype icloneable33554495 valuetype33554777)))
(assert(not(subtype icollection33555565 array33554517)))
(assert(not(subtype icollection33555565 icloneable33554495)))
(assert(not(subtype icollection33555565 icomparable33554520)))
(assert(not(subtype icollection33555565 iconvertible33554691)))
(assert(not(subtype icollection33555565 iformattable33554672)))
(assert(not(subtype icollection33555565 ilist33555573)))
(assert(not(subtype icollection33555565 int3233554683)))
(assert(not(subtype icollection33555565 istructuralcomparable33555577)))
(assert(not(subtype icollection33555565 istructuralequatable33555576)))
(assert(not(subtype icollection33555565 ituple33556673)))
(assert(not(subtype icollection33555565 itupleinternal33554526)))
(assert(not(subtype icollection33555565 valuetype33554777)))
(assert(not(subtype icomparable33554520 array33554517)))
(assert(not(subtype icomparable33554520 icloneable33554495)))
(assert(not(subtype icomparable33554520 icollection33555565)))
(assert(not(subtype icomparable33554520 iconvertible33554691)))
(assert(not(subtype icomparable33554520 ienumerable33555569)))
(assert(not(subtype icomparable33554520 iformattable33554672)))
(assert(not(subtype icomparable33554520 ilist33555573)))
(assert(not(subtype icomparable33554520 int3233554683)))
(assert(not(subtype icomparable33554520 istructuralcomparable33555577)))
(assert(not(subtype icomparable33554520 istructuralequatable33555576)))
(assert(not(subtype icomparable33554520 ituple33556673)))
(assert(not(subtype icomparable33554520 itupleinternal33554526)))
(assert(not(subtype icomparable33554520 valuetype33554777)))
(assert(not(subtype iconvertible33554691 array33554517)))
(assert(not(subtype iconvertible33554691 icloneable33554495)))
(assert(not(subtype iconvertible33554691 icollection33555565)))
(assert(not(subtype iconvertible33554691 icomparable33554520)))
(assert(not(subtype iconvertible33554691 ienumerable33555569)))
(assert(not(subtype iconvertible33554691 iformattable33554672)))
(assert(not(subtype iconvertible33554691 ilist33555573)))
(assert(not(subtype iconvertible33554691 int3233554683)))
(assert(not(subtype iconvertible33554691 istructuralcomparable33555577)))
(assert(not(subtype iconvertible33554691 istructuralequatable33555576)))
(assert(not(subtype iconvertible33554691 ituple33556673)))
(assert(not(subtype iconvertible33554691 itupleinternal33554526)))
(assert(not(subtype iconvertible33554691 valuetype33554777)))
(assert(not(subtype ienumerable33555569 array33554517)))
(assert(not(subtype ienumerable33555569 icloneable33554495)))
(assert(not(subtype ienumerable33555569 icollection33555565)))
(assert(not(subtype ienumerable33555569 icomparable33554520)))
(assert(not(subtype ienumerable33555569 iconvertible33554691)))
(assert(not(subtype ienumerable33555569 iformattable33554672)))
(assert(not(subtype ienumerable33555569 ilist33555573)))
(assert(not(subtype ienumerable33555569 int3233554683)))
(assert(not(subtype ienumerable33555569 istructuralcomparable33555577)))
(assert(not(subtype ienumerable33555569 istructuralequatable33555576)))
(assert(not(subtype ienumerable33555569 ituple33556673)))
(assert(not(subtype ienumerable33555569 itupleinternal33554526)))
(assert(not(subtype ienumerable33555569 valuetype33554777)))
(assert(not(subtype iformattable33554672 array33554517)))
(assert(not(subtype iformattable33554672 icloneable33554495)))
(assert(not(subtype iformattable33554672 icollection33555565)))
(assert(not(subtype iformattable33554672 icomparable33554520)))
(assert(not(subtype iformattable33554672 iconvertible33554691)))
(assert(not(subtype iformattable33554672 ienumerable33555569)))
(assert(not(subtype iformattable33554672 ilist33555573)))
(assert(not(subtype iformattable33554672 int3233554683)))
(assert(not(subtype iformattable33554672 istructuralcomparable33555577)))
(assert(not(subtype iformattable33554672 istructuralequatable33555576)))
(assert(not(subtype iformattable33554672 ituple33556673)))
(assert(not(subtype iformattable33554672 itupleinternal33554526)))
(assert(not(subtype iformattable33554672 valuetype33554777)))
(assert(not(subtype ilist33555573 array33554517)))
(assert(not(subtype ilist33555573 icloneable33554495)))
(assert(not(subtype ilist33555573 icomparable33554520)))
(assert(not(subtype ilist33555573 iconvertible33554691)))
(assert(not(subtype ilist33555573 iformattable33554672)))
(assert(not(subtype ilist33555573 int3233554683)))
(assert(not(subtype ilist33555573 istructuralcomparable33555577)))
(assert(not(subtype ilist33555573 istructuralequatable33555576)))
(assert(not(subtype ilist33555573 ituple33556673)))
(assert(not(subtype ilist33555573 itupleinternal33554526)))
(assert(not(subtype ilist33555573 valuetype33554777)))
(assert(not(subtype int3233554683 array33554517)))
(assert(not(subtype int3233554683 icloneable33554495)))
(assert(not(subtype int3233554683 icollection33555565)))
(assert(not(subtype int3233554683 ienumerable33555569)))
(assert(not(subtype int3233554683 ilist33555573)))
(assert(not(subtype int3233554683 istructuralcomparable33555577)))
(assert(not(subtype int3233554683 istructuralequatable33555576)))
(assert(not(subtype int3233554683 ituple33556673)))
(assert(not(subtype int3233554683 itupleinternal33554526)))
(assert(not(subtype istructuralcomparable33555577 array33554517)))
(assert(not(subtype istructuralcomparable33555577 icloneable33554495)))
(assert(not(subtype istructuralcomparable33555577 icollection33555565)))
(assert(not(subtype istructuralcomparable33555577 icomparable33554520)))
(assert(not(subtype istructuralcomparable33555577 iconvertible33554691)))
(assert(not(subtype istructuralcomparable33555577 ienumerable33555569)))
(assert(not(subtype istructuralcomparable33555577 iformattable33554672)))
(assert(not(subtype istructuralcomparable33555577 ilist33555573)))
(assert(not(subtype istructuralcomparable33555577 int3233554683)))
(assert(not(subtype istructuralcomparable33555577 istructuralequatable33555576)))
(assert(not(subtype istructuralcomparable33555577 ituple33556673)))
(assert(not(subtype istructuralcomparable33555577 itupleinternal33554526)))
(assert(not(subtype istructuralcomparable33555577 valuetype33554777)))
(assert(not(subtype istructuralequatable33555576 array33554517)))
(assert(not(subtype istructuralequatable33555576 icloneable33554495)))
(assert(not(subtype istructuralequatable33555576 icollection33555565)))
(assert(not(subtype istructuralequatable33555576 icomparable33554520)))
(assert(not(subtype istructuralequatable33555576 iconvertible33554691)))
(assert(not(subtype istructuralequatable33555576 ienumerable33555569)))
(assert(not(subtype istructuralequatable33555576 iformattable33554672)))
(assert(not(subtype istructuralequatable33555576 ilist33555573)))
(assert(not(subtype istructuralequatable33555576 int3233554683)))
(assert(not(subtype istructuralequatable33555576 istructuralcomparable33555577)))
(assert(not(subtype istructuralequatable33555576 ituple33556673)))
(assert(not(subtype istructuralequatable33555576 itupleinternal33554526)))
(assert(not(subtype istructuralequatable33555576 valuetype33554777)))
(assert(not(subtype ituple33556673 array33554517)))
(assert(not(subtype ituple33556673 icloneable33554495)))
(assert(not(subtype ituple33556673 icollection33555565)))
(assert(not(subtype ituple33556673 icomparable33554520)))
(assert(not(subtype ituple33556673 iconvertible33554691)))
(assert(not(subtype ituple33556673 ienumerable33555569)))
(assert(not(subtype ituple33556673 iformattable33554672)))
(assert(not(subtype ituple33556673 ilist33555573)))
(assert(not(subtype ituple33556673 int3233554683)))
(assert(not(subtype ituple33556673 istructuralcomparable33555577)))
(assert(not(subtype ituple33556673 istructuralequatable33555576)))
(assert(not(subtype ituple33556673 itupleinternal33554526)))
(assert(not(subtype ituple33556673 valuetype33554777)))
(assert(not(subtype itupleinternal33554526 array33554517)))
(assert(not(subtype itupleinternal33554526 icloneable33554495)))
(assert(not(subtype itupleinternal33554526 icollection33555565)))
(assert(not(subtype itupleinternal33554526 icomparable33554520)))
(assert(not(subtype itupleinternal33554526 iconvertible33554691)))
(assert(not(subtype itupleinternal33554526 ienumerable33555569)))
(assert(not(subtype itupleinternal33554526 iformattable33554672)))
(assert(not(subtype itupleinternal33554526 ilist33555573)))
(assert(not(subtype itupleinternal33554526 int3233554683)))
(assert(not(subtype itupleinternal33554526 istructuralcomparable33555577)))
(assert(not(subtype itupleinternal33554526 istructuralequatable33555576)))
(assert(not(subtype itupleinternal33554526 valuetype33554777)))
(assert(not(subtype object33554493 array33554517)))
(assert(not(subtype object33554493 icloneable33554495)))
(assert(not(subtype object33554493 icollection33555565)))
(assert(not(subtype object33554493 icomparable33554520)))
(assert(not(subtype object33554493 iconvertible33554691)))
(assert(not(subtype object33554493 ienumerable33555569)))
(assert(not(subtype object33554493 iformattable33554672)))
(assert(not(subtype object33554493 ilist33555573)))
(assert(not(subtype object33554493 int3233554683)))
(assert(not(subtype object33554493 istructuralcomparable33555577)))
(assert(not(subtype object33554493 istructuralequatable33555576)))
(assert(not(subtype object33554493 ituple33556673)))
(assert(not(subtype object33554493 itupleinternal33554526)))
(assert(not(subtype object33554493 valuetype33554777)))
(assert(not(subtype valuetype33554777 array33554517)))
(assert(not(subtype valuetype33554777 icloneable33554495)))
(assert(not(subtype valuetype33554777 icollection33555565)))
(assert(not(subtype valuetype33554777 icomparable33554520)))
(assert(not(subtype valuetype33554777 iconvertible33554691)))
(assert(not(subtype valuetype33554777 ienumerable33555569)))
(assert(not(subtype valuetype33554777 iformattable33554672)))
(assert(not(subtype valuetype33554777 ilist33555573)))
(assert(not(subtype valuetype33554777 int3233554683)))
(assert(not(subtype valuetype33554777 istructuralcomparable33555577)))
(assert(not(subtype valuetype33554777 istructuralequatable33555576)))
(assert(not(subtype valuetype33554777 ituple33556673)))
(assert(not(subtype valuetype33554777 itupleinternal33554526)))
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
(assert(subtype icomparable33554520 icomparable33554520))
(assert(subtype icomparable33554520 object33554493))
(assert(subtype iconvertible33554691 iconvertible33554691))
(assert(subtype iconvertible33554691 object33554493))
(assert(subtype ienumerable33555569 ienumerable33555569))
(assert(subtype ienumerable33555569 object33554493))
(assert(subtype iformattable33554672 iformattable33554672))
(assert(subtype iformattable33554672 object33554493))
(assert(subtype ilist33555573 icollection33555565))
(assert(subtype ilist33555573 ienumerable33555569))
(assert(subtype ilist33555573 ilist33555573))
(assert(subtype ilist33555573 object33554493))
(assert(subtype int3233554683 icomparable33554520))
(assert(subtype int3233554683 iconvertible33554691))
(assert(subtype int3233554683 iformattable33554672))
(assert(subtype int3233554683 int3233554683))
(assert(subtype int3233554683 object33554493))
(assert(subtype int3233554683 valuetype33554777))
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
(assert(subtype valuetype33554777 object33554493))
(assert(subtype valuetype33554777 valuetype33554777))
(assert(forall((d Type) (a Type) (b Type) (c Type)) (not (and (subtype (array233554434 int3233554683) d) (not(subtype a (tuple33554529 (tuple33554528 a) a))) (not(subtype b (tuple33554529 (tuple33554528 a) a))) (not(subtype a (tuple33554529 a c))) (not(subtype b (tuple33554529 a c))) (not(subtype (array233554434 int3233554683) d))))))
(check-sat)
(get-model)
