-- Lua Numeral System Converter by HexaG0n
-- 30th June 2021
-- Read README for more info.
-- String [ASCII], Binary, Octal, Decimal, Hexadecimal + Some Executable

------------------------------------------------
-- Lua Executable \/\/

--Note : These are super easy to convert back to ASCII string.

function octEx(str)
    e = string.sub((str:gsub('.', function (c)
        return string.format('%o,', string.byte(c))
    end)), 1, -2)
    return [[local oct="" for i in string.gmatch("]]..e..[[", "([^,]+)") do oct=oct..string.char(tonumber(i, 8)) end load(oct)() ]]
end

--local oct="" for i in string.gmatch("160,162,151,156,164,50,42,110,145,154,154,157,41,42,51", "([^,]+)") do oct=oct..string.char(tonumber(i, 8)) end load(oct)() >> print("Hello!")

function decEx(str)
    byte=""
    for v=1,string.len(str) do
        byte=byte..'\\'..string.byte(str, v)
    end
    return "load('"..byte.."')()"
end

--load('\112\114\105\110\116\40\34\72\101\108\108\111\33\34\41')() >> print("Hello!")

function hexEx(str)
    e = string.sub(str:gsub('.', function (c)
        return string.format('0x%X, ', string.byte(c))
    end), 1, -3)
    return "load(string.char("..e.."))()"
end

--load(string.char(0x70, 0x72, 0x69, 0x6E, 0x74, 0x28, 0x22, 0x48, 0x65, 0x6C, 0x6C, 0x6F, 0x21, 0x22, 0x29))() >> print("Hello!")

function hexEx2(str)
    e = (str:gsub('.', function (c)
        return string.format('%X', string.byte(c))
    end))
    return "load(string.gsub('"..e.."','..',function(hex)return string.char(tonumber(hex,16))end))()"
end

--load(string.gsub('7072696E74282248656C6C6F212229','..',function(hex)return string.char(tonumber(hex,16))end))()  >> print("Hello!")

------------------------------------------------
-- STR [ASCII] \/\/

function str2bin(str)
    e = ""
    for char in string.gmatch(str, '.') do
      t = {}
      n = string.byte(char)
      for i=7,0,-1 do
          t[#t+1] = math.floor(n / 2^i) n = n % 2^i
      end
    e = e..table.concat(t)..' '
    end
    return e
end

function str2oct(str)
    return (str:gsub('.', function (c)
        return string.format('%o, ', string.byte(c))
    end)):sub(1, -3)
end

function str2dec(str)
	byte=""
	for v=1,string.len(str) do
		byte=byte..string.byte(str, v)..', '
	end
	return byte:sub(1, -3)
end

function str2hex(str)
    return (str:gsub('.', function (c)
        return string.format('%X ', string.byte(c))
    end))
end

------------------------------------------------
-- BIN \/\/

function bin2str(s)
    local b2s = {
        ["0000"] = "0",
        ["0001"] = "1",
        ["0010"] = "2",
        ["0011"] = "3",
        ["0100"] = "4",
        ["0101"] = "5",
        ["0110"] = "6",
        ["0111"] = "7",
        ["1000"] = "8",
        ["1001"] = "9",
        ["1010"] = "A",
        ["1011"] = "B",
        ["1100"] = "C",
        ["1101"] = "D",
        ["1110"] = "E",
        ["1111"] = "F"
    }
    b = ""
    h = ""
    if (string.len(string.gsub(s, ' ', '')) % 4 > 0) then
        s = string.rep("0", 4 - rem)..string.gsub(s, ' ', '')
    end
    for i = 1, string.len(string.gsub(s, ' ', '')), 4 do
        h = h..b2s[string.sub(string.gsub(s, ' ', ''), i, i+3)]
    end
    return (h:gsub('..', function (cc)
        return string.char(tonumber(cc, 16))
    end))
end

function bin2oct(s)
    local b2o = {
        ["0000"] = "0",
        ["0001"] = "1",
        ["0010"] = "2",
        ["0011"] = "3",
        ["0100"] = "4",
        ["0101"] = "5",
        ["0110"] = "6",
        ["0111"] = "7",
        ["1000"] = "8",
        ["1001"] = "9",
        ["1010"] = "A",
        ["1011"] = "B",
        ["1100"] = "C",
        ["1101"] = "D",
        ["1110"] = "E",
        ["1111"] = "F"
    }
    h = ""
    f = ""
    if (string.len(string.gsub(s, ' ', '')) % 4 > 0) then
        s = string.rep("0", 4 - rem)..string.gsub(s, ' ', '')
    end
    for i = 1, string.len(string.gsub(s, ' ', '')), 4 do
        h = h..b2o[string.sub(string.gsub(s, ' ', ''), i, i+3)]
    end
    for hex in h:gmatch('..') do
        f = f..string.format('%o, ', tonumber(hex, 16))
    end
    return f:sub(1, -3)
end

function bin2dec(s)
    local b2d = {
        ["0000"] = "0",
        ["0001"] = "1",
        ["0010"] = "2",
        ["0011"] = "3",
        ["0100"] = "4",
        ["0101"] = "5",
        ["0110"] = "6",
        ["0111"] = "7",
        ["1000"] = "8",
        ["1001"] = "9",
        ["1010"] = "A",
        ["1011"] = "B",
        ["1100"] = "C",
        ["1101"] = "D",
        ["1110"] = "E",
        ["1111"] = "F"
    }
    h = ""
	f = ""
    if (string.len(string.gsub(s, ' ', '')) % 4 > 0) then
        s = string.rep("0", 4 - rem)..string.gsub(s, ' ', '')
    end
    for i = 1, string.len(string.gsub(s, ' ', '')), 4 do
        h = h..b2d[string.sub(string.gsub(s, ' ', ''), i, i+3)]
    end
	for ch in h:gmatch('..') do
	    f = f..tonumber(ch, 16)..', '
	end
	return f:sub(1, -3)
end

function bin2hex(s)
    local b2h = {
        ["0000"] = "0",
        ["0001"] = "1",
        ["0010"] = "2",
        ["0011"] = "3",
        ["0100"] = "4",
        ["0101"] = "5",
        ["0110"] = "6",
        ["0111"] = "7",
        ["1000"] = "8",
        ["1001"] = "9",
        ["1010"] = "A",
        ["1011"] = "B",
        ["1100"] = "C",
        ["1101"] = "D",
        ["1110"] = "E",
        ["1111"] = "F"
    }
    h = ""
    f = ""
    if (string.len(string.gsub(s, ' ', '')) % 4 > 0) then
        s = string.rep("0", 4 - rem)..string.gsub(s, ' ', '')
    end
    for i = 1, string.len(string.gsub(s, ' ', '')), 4 do
        h = h..b2h[string.sub(string.gsub(s, ' ', ''), i, i+3)]
    end
    for he in h:gmatch('..') do
        f = f..he..' '
    end
    return f
end

------------------------------------------------
-- OCT \/\/

function oct2str(oct)
    e = ""
    for octs in string.gmatch(oct, '([^,]+)') do
        e = e..string.char(tonumber(octs, 8))
    end
	return e
end

function oct2bin(oct)
    e = ""
	e2 = ""
    for octs in string.gmatch(oct, '([^,]+)') do
        e = e..string.char(tonumber(octs, 8))
    end
	for char in e:gmatch('.') do
      t = {}
      n = char:byte()
      for i=7,0,-1 do
          t[#t+1] = math.floor(n / 2^i) n = n % 2^i
      end
    e2 = e2..table.concat(t)..' '
    end
	return e2
end

function oct2dec(oct)
    e = ""
	e2 = ""
    for octs in string.gmatch(oct, '([^,]+)') do
        e = e..string.char(tonumber(octs, 8))
    end
	for char in e:gmatch('.') do
	    e2 = e2..string.byte(char)..', '
	end
	return e2:sub(1, -3)
end

function oct2hex(oct)
    e = ""
    for octs in string.gmatch(oct, '([^,]+)') do
        e = e..string.char(tonumber(octs, 8))
    end
	return (e:gsub('.', function (c)
        return string.format('%X ', string.byte(c))
    end))
end

------------------------------------------------
-- DEC \/\/

function dec2str(dec)
    e = ""
    for decs in string.gmatch(dec, '([^,]+)') do
        e = e..string.char(decs)
    end
    return e
end

function dec2bin(dec)
    e = ""
    e2 = ""
    for decs in string.gmatch(dec, '([^,]+)') do
        e = e..string.char(decs)
    end
    for k in string.gmatch(e, '.') do
      t = {}
      n = string.byte(k)
      for i=7,0,-1 do
          t[#t+1] = math.floor(n / 2^i) n = n % 2^i
      end
    e2 = e2..table.concat(t)..' '
    end
    return e2
end

function dec2oct(dec)
    e = ""
    for decs in string.gmatch(dec, '([^,]+)') do
        e = e..string.char(decs)
    end
    return (e:gsub('.', function (c)
        return string.format('%o, ', string.byte(c))
    end)):sub(1, -3)
end

function dec2hex(dec)
    e = ""
    for decs in string.gmatch(dec, '([^,]+)') do
        e = e..string.char(decs)
    end
    return (e:gsub('.', function (c)
        return string.format('%X ', string.byte(c))
    end))
end

------------------------------------------------
-- HEX \/\/

function hex2str(hex)
    hexremsp = hex:gsub(' ', '')
    return (string.gsub(hexremsp, '..', function (cc)
        return string.char(tonumber(cc, 16))
    end))
end

function hex2bin(hex)
    e = ""
    htstr = (string.gsub(hex, ' ', ''):gsub('..', function (cc)
        return string.char(tonumber(cc, 16))
    end))
    for k in string.gmatch(htstr, '.') do
      t = {}
      n = string.byte(k)
      for i=7,0,-1 do
          t[#t+1] = math.floor(n / 2^i) n = n % 2^i
      end
    e = e..table.concat(t)..' '
    end
    return e
end

function hex2oct(hex)
    hexremsp = hex:gsub(' ', '')
    e = hexremsp:gsub('..', function (c)
        return string.format('%o, ', tonumber('0x'..c))
    end):sub(1, -3)
    return e
end

function hex2dec(hex)
    e = ""
    for i in string.gmatch(hex,'..') do
        e = e..tonumber(i, 16)..', '
    end
    return string.sub(e, 1, -3)
end

------------ END ------------