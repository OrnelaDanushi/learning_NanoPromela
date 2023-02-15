int x = 0;

// process Inc = while true do if x<200 then x:=x+1 od
proctype Inc(){
  do :: true -> atomic{ if :: (x < 200) -> x = x + 1 fi} od
}

// process Dec = while true do if x>0 then x:=x-1 od
proctype Dec(){
  do :: true -> atomic{ if :: (x > 0) -> x = x - 1 fi} od
}

// process Reset = while true do if x=200 then x:=0 od
proctype Reset(){
  do :: true -> atomic{ if :: (x == 200) -> x = 0 fi} od
}

init {
  atomic{ run Inc(); run Dec(); run Reset() }
}
