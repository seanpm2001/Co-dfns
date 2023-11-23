CC←{
	data header←⍵
	ostype←opsys 'win' 'linux' 'mac'
	_←header ⎕NPUT (⍺,'.h')1
	_←data ⎕NPUT (⍺,'.c')1
	'win'≡ostype:⍺{
		vsbat←#.codfns.VS∆PATH
		vsbat,←'\VC\Auxiliary\Build\vcvarsall.bat'
		~⎕NEXISTS vsbat:'MISSING VISUAL C'⎕SIGNAL 99
		
		vsc←'%comspec% /C ""',vsbat,'" amd64'
		vsc,←'	&& cd "',(⊃⎕CMD'echo %CD%'),'"'
		vsc,←'  && cl /Zc:preprocessor /MP /W3 /wd4102 /wd4275'
		vsc,←'    /DEBUG /Od /Zc:inline /Zi /FS'
		vsc,←'    /Fo".\\" /Fd"',⍺,'.pdb"'
		vsc,←'    /WX /MD /EHsc /nologo'
		vsc,←'    /I"%AF_PATH%\include"'
		vsc,←'    /D"NOMINMAX" /D"AF_DEBUG" '
		vsc,←'    "',⍺,'.c" /link /DLL /OPT:REF'
		vsc,←'    /INCREMENTAL:NO /SUBSYSTEM:WINDOWS'
		vsc,←'    /LIBPATH:"%AF_PATH%\lib"'
		vsc,←'    /DYNAMICBASE "af',AF∆LIB,'.lib" "codfns.lib"'
		vsc,←'    /OPT:ICF /ERRORREPORT:PROMPT'
		vsc,←'    /TLBID:1 /OUT:"',⍺,'.dll" > "',⍺,'.log""'
		
		⎕←⍪⊃⎕NGET(⍺,'.log')1⊣⎕CMD vsc
		⎕NEXISTS f←⍺,'.dll':f
		'COMPILE ERROR' ⎕SIGNAL 22
	}⍵
	'linux'≡ostype:⍺{
		gcc ←'gcc -std=c99 -Ofast -g -Wall -fPIC -shared'
		gcc,←' -Wno-parentheses -Wno-misleading-indentation -Wno-unused-variable'
		gcc,←' -Wno-incompatible-pointer-types -Wno-missing-braces'
		gcc,←' -Wno-unused-but-set-variable'
		gcc,←' -I''',AF∆PREFIX,'/include'' -L''',AF∆PREFIX,'/lib64'' -L.'
		gcc,←' -o ''',⍺,'.so'' ''',⍺,'.c'' -lcodfns -laf',AF∆LIB
		gcc,←' > ''',⍺,'.log'' 2>&1'
		
		⎕←⍪⊃⎕NGET(⍺,'.log')1⊣⎕CMD gcc
		⎕NEXISTS f←⍺,'.so':f
		'COMPILE ERROR' ⎕SIGNAL 22		
	}⍵
	'mac'≡ostype:⍺{
		clang ←'clang -arch x86_64 -std=c99 -Ofast -g -Wall -fPIC -shared'
		clang,←' -Wno-parentheses -Wno-misleading-indentation -Wno-unused-variable'
		clang,←' -Wno-incompatible-pointer-types -Wno-missing-braces'
		clang,←' -Wno-unused-but-set-variable'
		clang,←' -isystem /opt/arrayfire/include'
		clang,←' -o ''',⍺,'.dylib'' ''',⍺,'.c'''
		clang,←' -Wl,-rpath,. ./libcodfns.dylib'
		clang,←' -Wl,-rpath,/opt/arrayfire/lib /opt/arrayfire/lib/libaf',AF∆LIB,'.dylib'
		clang,←' > ''',⍺,'.log'' 2>&1'
		
		⎕←⍪⊃⎕NGET(⍺,'.log')1⊣⎕CMD clang
		⎕NEXISTS f←⍺,'.so':f
		'COMPILE ERROR' ⎕SIGNAL 22		
	}⍵
}