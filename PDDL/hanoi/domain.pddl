(define
        (domain hanoi1)
        (:requirements :adl)
        (:types krag palik)
        (:predicates
                (wiekszy ?k ?l)
                (krazek ?k ?x)
                (palik ?x)
        )

        (:action przesun
            :parameters (?x  ?y  ?k ) ;przekladamy z X na Y
            :precondition 
            (and
                (palik ?x)
                (palik ?y)
                (not (exists (?a)(and(wiekszy ?k ?a)(krazek ?a ?y)))) ;nie istnieje na Y mniejszy krazek bo nie mozemy klasc na mniejszy
                (not (exists (?a)(and(wiekszy ?k ?a)(krazek ?a ?x)))) ; nie istnieje tez na X bo mozemy tylko z gory brac 
                (not(krazek ?k ?y))
                (krazek ?k ?x)           
            )
            :effect (and 
                (krazek ?k ?y)
                (not(krazek ?k ?x))
            )
        )              
)
