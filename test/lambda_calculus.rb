ZERO = -> p { -> x { x } }
ONE = -> p { -> x { p[x] } }
TWO = -> p { -> x { p[p[x]] } }
THREE = -> p { -> x { p[p[p[x]]] } }

TRUE = -> x { -> y { x } }
FALSE = -> x { -> y { y } }

IF = -> b {
      b
}
def to_integer(proc)
  proc[-> n {n  + 1}][0]
end

def to_boolean(proc)
  proc[true][false]
end

def zero?(proc)
  proc[ ->x { FALSE }][TRUE]
end

IS_ZERO = -> n { n[-> x {FALSE}][TRUE]}

p to_boolean(IS_ZERO[ZERO])
p to_boolean(IS_ZERO[ONE])

p to_integer(ZERO)
p to_integer(ONE)
p to_integer(TWO)
p to_integer(THREE)
p to_boolean(TRUE)
p to_boolean(FALSE)
p IF[TRUE]['HAPPY']['SAD']
p IF[FALSE]['HAPPY']['SAD']

PAIR = -> x { -> y { ->f {f[x][y]}}}

LEFT = -> p { p [ -> x { -> y { x }}]}
RIGHT = -> p { p [ -> x { -> y { y }}]}
p PAIR[1][2]
p LEFT[PAIR[1][2]]
p RIGHT[PAIR[1][2]]

INCREMENT = -> n { -> p { -> x { p[n[p][x]] } } }

p "Increment"
p to_integer(INCREMENT[ONE])
p INCREMENT[ONE][->n { n + 1}][0]

p "Decrement"
SLIDE = -> p { PAIR[RIGHT[p]][INCREMENT[RIGHT[p]]]}
DECREMENT = -> n { LEFT[n[SLIDE][PAIR[ZERO][ZERO]]] }
p "Slide"
p PAIR[1][2]
p SLIDE[PAIR[1][2]]
p "Decrement"
p to_integer(DECREMENT[THREE])

ADD = -> m { ->n {n[INCREMENT][m]}}
SUBSTRACT = -> m { ->n {n[DECREMENT][m]}}
MULTIPLY = -> m { ->n {n[ADD[m]][ZERO]}}
POWER = -> m { ->n {n[MULTIPLY[m]][ONE]}}
IS_LESS_OR_EQUAL = ->m { -> n {IS_ZERO[SUBSTRACT[m][n]]}}
p to_boolean(IS_LESS_OR_EQUAL[ONE][TWO])
p to_boolean(IS_LESS_OR_EQUAL[THREE][TWO])

p "Mod"
Z = ->f { -> x { f[-> y { x[x][y] }] }[-> x { f[-> y { x[x][y] }] }] }
MOD = Z[->f{->m { -> n {
  IF[IS_LESS_OR_EQUAL[n][m]][
    -> x { f[SUBSTRACT[m][n]][n][x] }
  ][
   m
  ]
}}}]
SOME = ->b {
  -> x {
    b[x]
  }
}
Y = -> f { -> x { f[x[x]] }[-> x { f[x[x]] }] }

p SOME[-> n{ n + 1}][100]
p to_integer(MOD[THREE][TWO])

p "Lists"

EMPTY = PAIR[TRUE][TRUE]
UNSHIFT = -> l { -> x {PAIR[FALSE][PAIR[x][l]]}}
IS_EMPTY = LEFT
FIRST = -> l {LEFT[RIGHT[l]]}
REST = -> l {RIGHT[RIGHT[l]]}
my_list = UNSHIFT[
            UNSHIFT[
            UNSHIFT[EMPTY][THREE]
            ][TWO]

][ONE]

p to_integer(FIRST[my_list])
p to_integer(FIRST[REST[my_list]])
p to_boolean(IS_EMPTY[my_list])










