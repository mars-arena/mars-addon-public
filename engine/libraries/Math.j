library Math
	globals
		constant real LN2 = 0.693147 // ln(2)
		constant real LN10 = 2.302585 // ln(10)
		constant real PI_NUM       = 3.14159265 // Pi number
		constant real EULER        = 2.7182818  // Euler number
		constant real FOURTH_EULER = 1.2840254  // (M_E)^(1/4)
		constant real SQRT2      = 1.4142136  // sqrt(2)
		constant real SQRT3      = 1.7320508  // sqrt(3)
	endglobals
	
	function SignInt takes integer z returns integer
		if z < 0 then
			return -1
		elseif z > 0 then
			return 1
		endif
		return 0
	endfunction
	
	function SignReal takes real z returns integer
		if z < 0. then
			return -1
		elseif z > 0. then
			return 1
		endif
		return 0
	endfunction
	
	function AbsInt takes integer z returns integer
		if z < 0 then
			return - z
		endif
		return z
	endfunction
	
	function AbsReal takes real z returns real
		if z < 0. then
			return - z
		endif
		return z
	endfunction
	
	function MaxInt takes integer z1, integer z2 returns integer
		if z1 > z2 then
			return z1
		endif
		return z2
	endfunction
	
	function MaxReal takes real z1, real z2 returns real
		if z1 > z2 then
			return z1
		endif
		return z2
	endfunction
	
	function MinInt takes integer z1, integer z2 returns integer
		if z1 < z2 then
			return z1
		endif
		return z2
	endfunction
	
	function MinReal takes real z1, real z2 returns real
		if z1 < z2 then
			return z1
		endif
		return z2
	endfunction

	function IsDifferenceMore takes real a, real b, real diff returns boolean
		if (a - b) > diff or (b - a) > diff then
			return true
		endif
		return false
	endfunction

	function IsEven takes integer a returns boolean
		return a / 2 * 2 == a
	endfunction
	
	function IsOdd takes integer a returns boolean
		return a / 2 * 2 != a
	endfunction
	
	function IsDivisibleByN takes integer a, integer n returns boolean
		return a / n * n == a
	endfunction
	
	function IsNotDivisibleByN takes integer a, integer n returns boolean
		return a / n * n != a
	endfunction
	
	function ModuloN takes integer a, integer n returns integer
		return a - a / n * n
	endfunction
	
	function ModuloNPos takes integer a, integer n returns integer
		if a < 0 then
			return a - a / n * n + n
		endif
		return a - a / n * n
	endfunction
	
	function Floor takes real r returns integer
		local integer i = R2I(r)
		if r > 0. or not (i != r) then
			return i
		endif
		return i - 1
	endfunction
	
	function Ceil takes real r returns integer
		local integer i = R2I(r)
		if r < 0. or not (i != r) then
			return i
		endif
		return i + 1
	endfunction
	
	function R2Idown takes real r returns integer
		local integer i = Floor(r)
		if r - i == 1. then  // operation '==' rounds real numbers, so it helps to reduce imprecision in multiplying
			return i + 1
		endif
		return i
	endfunction
	
	function R2Iup takes real r returns integer
		local integer i = Floor(r)
		if r == i then  // operation '==' rounds real numbers, so it helps to reduce imprecision in multiplying
			return i
		endif
		return i + 1
	endfunction
	
	function R2Ieven takes real r returns integer
		local integer i = Floor(r)
		local real mid = i + 0.5
		if (r == mid and IsEven(i)) or r < mid then
			return i
		endif
		return i + 1
	endfunction
	
	function B2I takes boolean b returns integer
		if b then
			return 1
		endif
		return 0
	endfunction
	
	function B2Ineg takes boolean b returns integer
		if b then
			return 1
		endif
		return -1
	endfunction
	
	function I2B takes integer i returns boolean
		return i != 0
	endfunction

	function IsSet takes integer i returns boolean
		return i != 0
	endfunction
	
	function PowerN takes integer i, integer n returns integer
		local integer c = i
		if i == 0 or n < 0 then
			return 0
		elseif i == 1 or n == 0 then
			return 1
		elseif i == -1 then
			if IsEven(n) then
				return 1
			endif
			return -1
		endif
		loop
			exitwhen n == 1
			set c = c * i
			set n = n - 1
		endloop
		return c
	endfunction
	
	function Ln takes real r returns real
		// Source https://www.hiveworkshop.com/threads/snippet-natural-logarithm.108059/
		local real sum = 0.
		local real sign = 1.
		if r < 1. then
			set r = 1. / r
			set sign = -1.
		endif
		loop
			exitwhen r < bj_E
			set r = r / bj_E
			set sum = sum + 1.
		endloop
		return sign * (sum + (r - 1.) * (1. + 9. / (2. + r) + 9. / (1. + r * 2.) + 1. / r) / 8.)
	endfunction
	
	function Log2 takes real r returns real
		return Ln(r) / LN2
	endfunction
	
	function Log10 takes real r returns real
		return Ln(r) / LN10
	endfunction
	
	function Log takes real r, real base returns real
		return Ln(r) / Ln(base)
	endfunction

	//Возвращает текст логического значения
	function GetBooleanValue takes boolean bool returns string
		if bool then
			return "Да"
		else
			return "Нет"
		endif
		return ""
	endfunction
	
endlibrary
