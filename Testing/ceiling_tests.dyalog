﻿:Namespace ceiling

I←{⍬≡⍴⍵:⍵ ⋄ ⊃((⎕DR ⍵)323)⎕DR ⍵}¯5000+?100⍴10000
F←100÷⍨?100⍴10000

S←':Namespace' 'Run←{⌈⍵}' ':EndNamespace'

'i'('ceiling' S 'Run' #.GEN∆T1 ⎕THIS) I
'f'('ceiling' S 'Run' #.GEN∆T1 ⎕THIS) F

:EndNamespace
