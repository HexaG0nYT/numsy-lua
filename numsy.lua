-- Lua Numeral System Converter by HexaG0n
-- 30th June 2021 | Updated 18th August 2021
-- Updates : removed bin,oct,dec,hex2str and executables, renewed code

-- You may ask why i removed the executables, ill probably be releasing
-- a bunch of executable encoders soon. ~ Hexa

-- Read README for more info.
-- String, Binary, Octal, Decimal, Hexadecimal

-----------------------------

function str2bin(str)
    return (str:gsub('.', function(c)
        f,c='',c:byte()
        for i=0,7 do
            f=math.floor(c%2)..f
            c=c/2
        end
        return f..' '
    end))
end

function str2oct(str)
    return (str:gsub('.',function (c)
        return string.format('%o, ', (c):byte())
    end)):sub(1, -3)
end

function str2dec(str)
	return (str:gsub('.',function(c)
	    return c:byte()..', '
	end)):sub(1, -3)
end

function str2hex(str)
    return (str:gsub('.',function(c)
        return string.format('%02X ',(c):byte())
    end))
end

-----------------------------

function bin2str(str)
    str=str:gsub(' ','')
    return (str:gsub(('%d'):rep(8),function(c)
        n,d=0,0
        for i=8,1,-1 do
            d=d+(c:sub(i,i)*(2^n))
            n=n+1
        end
        return string.char(d)
    end))
end

-----------------------------

function oct2str(str)
    local f=''
    for i in str:gmatch('[%d]+') do
        f=f..string.char(tonumber(i,8))
    end
    return f
end

-----------------------------

function dec2str(str)
    local f=''
    for i in str:gmatch('[%d]+') do
        f=f..string.char(i)
    end
    return f
end

-----------------------------

function hex2str(str)
    local f=''
    for i in str:gmatch('[%x]+') do
        f=f..string.char(tonumber(i,16))
    end
    return f
end

------------ END ------------
