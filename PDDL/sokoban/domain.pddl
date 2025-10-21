(define (domain sokoban)
    (:requirements :adl)
    (:predicates
        (poziomo ?x ?y)
        (pionowo ?x ?y)
        (paczka ?x)
        (robot ?x)
        (cel ?x)
    )
    (:action idz
        :parameters (?x ?y)
        :precondition (and
            (robot ?x)
            (not (paczka ?y))
            (or
                (pionowo ?x ?y)
                (poziomo ?x ?y)
            )
        )
        :effect (and
            (not (robot ?x))
            (robot ?y)
        )
    )
    (:action pchaj
        :parameters (?x ?y ?z)
        :precondition (and
            (robot ?x)
            (paczka ?y)
            (not (= ?x ?z))
            (or
                (and
                    (poziomo ?x ?y)
                    (poziomo ?y ?z)
                )
                (and
                    (pionowo ?x ?y)
                    (pionowo ?y ?z)
                )
            )
        )
        :effect (and
            (not (robot ?x))
            (robot ?y)
            (not (paczka ?y))
            (paczka ?z)
        )
    )
)
