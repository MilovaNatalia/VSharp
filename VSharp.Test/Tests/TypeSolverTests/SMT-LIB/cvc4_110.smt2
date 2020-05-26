(set-option :produce-models true)
(set-option :finite-model-find true)
(set-option :tlimit-per 20000)
(declare-sort Type 0)
(declare-fun dogsdelegate33554494 (Type Type)Type)
(declare-const delegate33554565 Type)
(declare-const iserializable33556234 Type)
(declare-const icloneable33554495 Type)
(declare-const multicastdelegate33554567 Type)
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
(assert(forall((a Type) (b Type)) (is_reference (dogsdelegate33554494 a b))))
(assert(forall((a Type) (b Type)) (not(subtype delegate33554565 (dogsdelegate33554494 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype icloneable33554495 (dogsdelegate33554494 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype iserializable33556234 (dogsdelegate33554494 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype multicastdelegate33554567 (dogsdelegate33554494 a b)))))
(assert(forall((a Type) (b Type)) (not(subtype object33554493 (dogsdelegate33554494 a b)))))
(assert(forall((a Type) (b Type)) (subtype (dogsdelegate33554494 a b) delegate33554565)))
(assert(forall((a Type) (b Type)) (subtype (dogsdelegate33554494 a b) icloneable33554495)))
(assert(forall((a Type) (b Type)) (subtype (dogsdelegate33554494 a b) iserializable33556234)))
(assert(forall((a Type) (b Type)) (subtype (dogsdelegate33554494 a b) multicastdelegate33554567)))
(assert(forall((a Type) (b Type)) (subtype (dogsdelegate33554494 a b) object33554493)))
(assert(forall((a Type) (c Type) (b Type) (d Type)) (=> (and (= a c) (= b d)) (subtype (dogsdelegate33554494 a b) (dogsdelegate33554494 c d)))))
(assert(forall((a Type) (c Type) (b Type) (d Type)) (=> (not(= a c)) (not(subtype (dogsdelegate33554494 a b) (dogsdelegate33554494 c d))))))
(assert(forall((a Type)) (=> false (is_unmanaged a))))
(assert(forall((a Type)) (=> false (is_valuetype a))))
(assert(forall((b Type) (a Type)) (=> (and (= b a) (is_valuetype b)) (contravariant_subtype a b))))
(assert(forall((b Type) (a Type)) (=> (and (is_reference b) (not(subtype b a))) (not(contravariant_subtype a b)))))
(assert(forall((b Type) (a Type)) (=> (and (is_reference b) (subtype b a)) (contravariant_subtype a b))))
(assert(forall((b Type) (a Type)) (=> (and (not(= b a)) (is_valuetype b)) (not(contravariant_subtype a b)))))
(assert(forall((b Type) (d Type) (a Type) (c Type)) (=> (not(= b d)) (not(subtype (dogsdelegate33554494 a b) (dogsdelegate33554494 c d))))))
(assert(is_reference delegate33554565))
(assert(is_reference icloneable33554495))
(assert(is_reference iserializable33556234))
(assert(is_reference multicastdelegate33554567))
(assert(is_reference object33554493))
(assert(not(subtype delegate33554565 multicastdelegate33554567)))
(assert(not(subtype icloneable33554495 delegate33554565)))
(assert(not(subtype icloneable33554495 iserializable33556234)))
(assert(not(subtype icloneable33554495 multicastdelegate33554567)))
(assert(not(subtype iserializable33556234 delegate33554565)))
(assert(not(subtype iserializable33556234 icloneable33554495)))
(assert(not(subtype iserializable33556234 multicastdelegate33554567)))
(assert(not(subtype object33554493 delegate33554565)))
(assert(not(subtype object33554493 icloneable33554495)))
(assert(not(subtype object33554493 iserializable33556234)))
(assert(not(subtype object33554493 multicastdelegate33554567)))
(assert(subtype delegate33554565 delegate33554565))
(assert(subtype delegate33554565 icloneable33554495))
(assert(subtype delegate33554565 iserializable33556234))
(assert(subtype delegate33554565 object33554493))
(assert(subtype icloneable33554495 icloneable33554495))
(assert(subtype icloneable33554495 object33554493))
(assert(subtype iserializable33556234 iserializable33556234))
(assert(subtype iserializable33556234 object33554493))
(assert(subtype multicastdelegate33554567 delegate33554565))
(assert(subtype multicastdelegate33554567 icloneable33554495))
(assert(subtype multicastdelegate33554567 iserializable33556234))
(assert(subtype multicastdelegate33554567 multicastdelegate33554567))
(assert(subtype multicastdelegate33554567 object33554493))
(assert(subtype object33554493 object33554493))
(assert(forall((a Type) (b Type) (c Type)) (not (not(subtype a (dogsdelegate33554494 b c))))))
(check-sat)
(get-model)
