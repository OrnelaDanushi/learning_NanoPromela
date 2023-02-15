int x = 0;

// process Inc = while true do if x<200 then x:=x+1 od
proctype Inc(){
  do :: true -> atomic{ if :: (x < 100) -> x = x + 1 fi od
}

// process Dec = while true do if x>0 then x:=x-1 od
proctype Dec(){
  do :: true -> if :: (x > 0) -> x = x - 1 fi od
}

// process Reset = while true do if x=200 then x:=0 od
proctype Reset(){
  do :: true -> if :: (x == 200) -> x = 0 fi od
}

/*
// warning: is x always between (and including) 0 and 200?
// no, there is not warranty that the if is atomic

init {

  // allows to avoid race condition among the different procedures calls
  atomic{ run Inc(); run Dec(); run Reset() }
}
*/

// how to check the values assumed by x?
// extend the model with a 'monitor' process that checks 0 <= x <= 200

proctype Check(){
  assert (x >= 0 && x <= 200)
}

init {
  atomic{ run Inc(); run Dec(); run Reset(); run Check() }
}

// till now the execution generates failed assertion
