" Define some new math zones. See `:help tex-math`.
call TexNewMathZone("M", "align", 1)
call TexNewMathZone("N", "gather", 1)

" Redefine some highlighting groups.
hi! link Delimiter Function
hi! link texBeginEndName Identifier
hi! link texDelimiter Special
hi! link texInputCurlies Delimiter
hi! link texInputFile PreCondit
hi! link texMath Identifier
hi! link texSection Type
hi! link texStatement Function
hi! link texSubscript texMath
