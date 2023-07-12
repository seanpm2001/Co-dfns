:Require file://t0043.dyalog
:Namespace t0043_tests

 tn←'t0043' ⋄ cn←'c0043'
 cd←⎕NS⍬ ⋄ dy←#.⍎tn

 ∆00_TEST←{#.UT.expect←0
  _←#.⎕EX cn ⋄ 0⊣cd∘←#.c0043←tn #.codfns.Fix ⎕SRC dy}

 MK∆T1←{##.UT.expect←(⍎'dy.',⍺⍺)⍵⍵ ⋄ (⍎'cd.',⍺⍺)⍵⍵}
 MK∆T2←{##.UT.expect←⊃(⍎'dy.',⍺⍺)/⍵⍵ ⋄ ⊃(⍎'cd.',⍺⍺)/⍵⍵}
 MK∆T3←{fn tl←⍺⍺ ⋄ nv←⊃(⍎'dy.',fn)/⍵⍵ ⋄ cv←⊃(⍎'cd.',fn)/⍵⍵
  ##.UT.expect←(≢,nv)⍴1 ⋄ ,tl>|nv-cv}

 X←⍉⍪¯35.5 ¯41.5 ¯29.5 7.5 34.5 ¯11.5 31.5 ¯0.5 32.5 12.5
 I←{⍬≡⍴⍵:⍵ ⋄ ⊃((⎕DR ⍵)323)⎕DR ⍵}¯5000+?100⍴10000
 F←100÷⍨?100⍴10000
 B←?100⍴2

∆redfirst∆01_TEST←'redfirst∆R1' MK∆T1 (⍬⍴1)
∆redfirst∆02_TEST←'redfirst∆R1' MK∆T1 (5⍴⍳5)
∆redfirst∆03_TEST←'redfirst∆R1' MK∆T1 (3 3⍴⍳9)
∆redfirst∆04_TEST←'redfirst∆R2' MK∆T1 (⍬⍴3)
∆redfirst∆05_TEST←'redfirst∆R2' MK∆T1 (⍬)
∆redfirst∆06_TEST←'redfirst∆R1' MK∆T1 (⍬)
∆redfirst∆07_TEST←'redfirst∆R3' MK∆T1 (⍬⍴1)
∆redfirst∆08_TEST←'redfirst∆R3' MK∆T1 (5⍴⍳5)
∆redfirst∆09_TEST←'redfirst∆R3' MK∆T1 (3 3⍴⍳9)
∆redfirst∆10_TEST←'redfirst∆R1' MK∆T1 (?15⍴2)
∆redfirst∆11_TEST←'redfirst∆R1' MK∆T1 (?128⍴2)
∆redfirst∆12_TEST←'redfirst∆R1' MK∆T1 (?100⍴2)
∆redfirst∆13_TEST←'redfirst∆R1' MK∆T1 (?3 3⍴2)
∆redfirst∆14_TEST←'redfirst∆R1' MK∆T1 (?10 10⍴2)
∆redfirst∆15_TEST←'redfirst∆R1' MK∆T1 (?32 32⍴2)
∆redfirst∆16_TEST←'redfirst∆R1' MK∆T1 (?128 128⍴2)
∆redfirst∆17_TEST←'redfirst∆R1' MK∆T1 (?100 100⍴2)
∆redfirst∆18_TEST←'redfirst∆R1' MK∆T1 (?500 500⍴2)
∆redfirst∆19_TEST←'redfirst∆R1' MK∆T1 (?512 512⍴2)
∆redfirst∆20_TEST←'redfirst∆R1' MK∆T1 (?512⍴2)
∆redfirst∆21_TEST←'redfirst∆R4' MK∆T1 (1⍴1)
∆redfirst∆22_TEST←'redfirst∆R4' MK∆T1 (1 5⍴⍳5)
∆redfirst∆23_TEST←'redfirst∆R4' MK∆T1 (1 3 3⍴⍳9)

∆∆∆_TEST←{#.UT.expect←,¨0 0 ⋄ _←#.⎕EX¨cn tn ⋄ #.⎕NC¨cn tn}

:EndNamespace