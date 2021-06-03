This is the layout of my keyboard!
```
┌───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────────────┐
│       │       │       │       │       │       │       │       │       │       │       │       │       │               │
│ `~    │ 1!    │ 2@    │ 3#    │ 4$    │ 5%    │ 6^    │ 7&    │ 8*    │ 9(    │ 0)    │ -_    │ =+    │     Backspace │
├───────┴───┬───┴───┬───┴───┬───┴───┬───┴───┬───┴───┬───┴───┬───┴───┬───┴───┬───┴───┬───┴───┬───┴───┬───┴───┬───────────┤
│           │       │       │    ε  │       │       │       │       │       │       │       │       │       │           │
│ Tab       │ qQ    │ wW    │ eE ϵΕ │ rR ρΡ │ tT τΤ │ yY υΥ │ uU θΘ │ iI ιΙ │ oO οΟ │ pP πΠ │ [{    │ ]}    │ \|        │
├───────────┴─┬─────┴─┬─────┴─┬─────┴─┬─────┴─┬─────┴─┬─────┴─┬─────┴─┬─────┴─┬─────┴─┬─────┴─┬─────┴─┬─────┴───────────┤
│             │       │    ς  │       │    φ  │       │       │       │       │       │       │       │                 │
│ Control     │ aA αΑ │ sS σΣ │ dD δΔ │ fF ϕΦ │ gG γΓ │ hH ηΗ │ jJ ξΞ │ kK κΚ │ lL λΛ │ ;:    │ '"    │          Return │
├─────────────┴───┬───┴───┬───┴───┬───┴───┬───┴───┬───┴───┬───┴───┬───┴───┬───┴───┬───┴───┬───┴───┬───┴─────────────────┤
│                 │       │       │       │       │       │       │       │       │       │       │                     │
│ Shift           │ zZ ζΖ │ xX χΧ │ cC ψΨ │ vV ωΩ │ bB βΒ │ nN νΝ │ mM μΜ │ ,<    │ .>    │ /?    │             Level 3 │
├─────────┬───────┴─┬─────┴───┬───┴───────┴───────┴───────┴───────┴───────┴─────┬─┴───────┼───────┴─┬─────────┬─────────┤
│         │         │         │                                                 │         │         │         │         │
│ Escape  │ Alt     │ Super   │                      Space                      │ Level 5 │         │         │         │
└─────────┴─────────┴─────────┴─────────────────────────────────────────────────┴─────────┴─────────┴─────────┴─────────┘
```

In order for this keyboard layout to appear in some system lists I will have to
add the following into `/usr/share/X11/xkb/rules/evdev.xml`:
```xml
<!--</layout>-->
    <layout>
      <configItem>
        <name>tt</name>
        <!-- Thomas Truman's Custom Keyboard Layout -->
        <shortDescription>tt</shortDescription>
        <description>English (TT)</description>
        <languageList>
          <iso639Id>eng</iso639Id>
        </languageList>
      </configItem>
      <variantList>
       <variant>
         <configItem>
           <name>modded</name>
           <description>English (TT, Modded)</description>
         </configItem>
       </variant>
      </variantList>
    </layout>
<!--</layoutList>-->
```
(The comment parts are not needed, but provide a good indicator of where to put
this.)

Additionally, I will need to add `symbols/tt` into `/usr/share/X11/xkb/symbols`,
this is probably easiest with a symlink:
```sh
sudo ln -s ~/dotfiles/xkb/symbols/tt /usr/share/X11/xkb/symbols/tt
```
