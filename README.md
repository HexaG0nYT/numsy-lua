# Numsy
#### Numeral System Converter in Lua by HexaG0n.

What does it do?
--
##### It converts *ASCII String Text, Binary, Octal, Decimal and Hexadecimal codes* to any of those five.

How to use?
--
```lua
require('numsy')
--then you can do for example
print(str2hex('Hello'))
```

# Functions

Executable Functions
--

### octEx >> Converts your code into an executable octal code.
*Example :*
```lua
local oct="" for i in string.gmatch("160,162,151,156,164,50,42,110,145,154,154,157,41,42,51", "([^,]+)") do oct=oct..string.char(tonumber(i, 8)) end load(oct)() -->> print("Hello!")
```

### decEx >> Converts your code into an executable decimal code.
*Example :*
```lua
load('\112\114\105\110\116\40\34\72\101\108\108\111\33\34\41')() -->> print("Hello!")
```

### hexEx >> Converts your code into an executable hexadecimal code.
*Example :*
```lua
load(string.char(0x70, 0x72, 0x69, 0x6E, 0x74, 0x28, 0x22, 0x48, 0x65, 0x6C, 0x6C, 0x6F, 0x21, 0x22, 0x29))() -->> print("Hello!")
```

### hexEx2 >> Converts your code into an executable hexadecimal code. [ Similar to hexEx ]
*Example :*
```lua
load(string.gsub('7072696E74282248656C6C6F212229','..',function(hex)return string.char(tonumber(hex,16))end))() -->> print("Hello!")
```

String Functions
--

- str2bin >> Converts ASCII String text to Binary
- str2oct >> Converts ASCII String text to Octal
- str2dec >> Converts ASCII String text to Decimal
- str2hex >> Converts ASCII String text to Hexadecimal

Binary Functions
--

- bin2str >> Converts Binary code to ASCII String Text
- bin2oct >> Converts Binary code to Octal
- bin2dec >> Converts Binary code to Decimal
- bin2hex >> Converts Binary code to Hexadecimal

Octal Functions
--

- oct2str >> Converts Octal code to ASCII String Text
- oct2bin >> Converts Octal code to Binary
- oct2dec >> Converts Octal code to Decimal
- oct2hex >> Converts Octal code to Hexadecimal

Decimal Functions
--

- dec2str >> Converts Octal code to ASCII String Text
- dec2bin >> Converts Octal code to Binary
- dec2oct >> Converts Octal code to Octal
- dec2hex >> Converts Octal code to Hexadecimal

Hexadecimal Functions
--

- hex2str >> Converts Octal code to ASCII String Text
- hex2bin >> Converts Octal code to Binary
- hex2oct >> Converts Octal code to Octal
- hex2dec >> Converts Octal code to Decimal
