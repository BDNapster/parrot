# THIS IS A GENERATED FILE! DO NOT EDIT!
# Begin generated code

.namespace [ 'Winxed'; 'Compiler' ]

.sub 'isspace' :subid('WSubId_18')
        .param string __ARG_1
# Body
# {
.annotate 'file', 'winxedst1.winxed'
.annotate 'line', 18
    iseq $I1, __ARG_1, ' '
    if $I1 goto __label_2
    iseq $I1, __ARG_1, "\n"
  __label_2:
    if $I1 goto __label_1
    iseq $I1, __ARG_1, "\t"
  __label_1:
    .return($I1)
# }
.annotate 'line', 19

.end # isspace


.sub 'isdigit' :subid('WSubId_9')
        .param string __ARG_1
# Body
# {
.annotate 'line', 23
# predefined indexof
.annotate 'line', 22
    index $I2, '0123456789', __ARG_1
.annotate 'line', 23
    isgt $I1, $I2, -1
    .return($I1)
# }
.annotate 'line', 24

.end # isdigit


.sub 'hexdigit' :subid('WSubId_10')
        .param string __ARG_1
# Body
# {
.annotate 'line', 28
# i: $I1
# predefined indexof
    index $I1, '0123456789abcdef0123456789ABCDEF', __ARG_1
.annotate 'line', 29
    lt $I1, 0, __label_1
    mod $I1, $I1, 16
  __label_1: # endif
.annotate 'line', 30
    .return($I1)
# }
.annotate 'line', 31

.end # hexdigit


.sub 'isidentstart' :subid('WSubId_19')
        .param string __ARG_1
# Body
# {
.annotate 'line', 38
# predefined indexof
.annotate 'line', 34
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_', __ARG_1
.annotate 'line', 38
    isgt $I1, $I2, -1
.annotate 'line', 35
    .return($I1)
# }
.annotate 'line', 39

.end # isidentstart


.sub 'isident' :subid('WSubId_8')
        .param string __ARG_1
# Body
# {
.annotate 'line', 47
# predefined indexof
.annotate 'line', 42
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_$0123456789', __ARG_1
.annotate 'line', 47
    isgt $I1, $I2, -1
.annotate 'line', 43
    .return($I1)
# }
.annotate 'line', 48

.end # isident

# Constant WINXED_ERROR evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]

.sub 'WinxedCompilerError' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
        .param int __ARG_4 :optional
# Body
# {
.annotate 'line', 71
    box $P1, __ARG_1
    setattribute self, 'type', $P1
.annotate 'line', 72
    box $P1, __ARG_2
    setattribute self, 'message', $P1
.annotate 'line', 73
    box $P1, __ARG_3
    setattribute self, 'filename', $P1
.annotate 'line', 74
    box $P1, __ARG_4
    setattribute self, 'line', $P1
# }
.annotate 'line', 75

.end # WinxedCompilerError

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
.annotate 'line', 60
    addattribute $P0, 'type'
.annotate 'line', 61
    addattribute $P0, 'filename'
.annotate 'line', 62
    addattribute $P0, 'line'
.annotate 'line', 63
    addattribute $P0, 'message'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'Warn' :subid('WSubId_67')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
.annotate 'line', 80
# var stderr: $P1
# predefined getstderr
    getstderr $P1
.annotate 'line', 81
    $P1.'print'('WARNING: ')
.annotate 'line', 82
    $P1.'print'(__ARG_1)
.annotate 'line', 83
    unless __ARG_3 goto __label_1
# {
.annotate 'line', 84
    $P1.'print'(' near ')
.annotate 'line', 85
    $P2 = __ARG_2.'show'()
    $P1.'print'($P2)
# }
  __label_1: # endif
.annotate 'line', 87
    $P1.'print'("\n")
# }
.annotate 'line', 88

.end # Warn


.sub 'InternalError' :subid('WSubId_6')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
.annotate 'line', 92
    unless __ARG_3 goto __label_1
# {
.annotate 'line', 93
# desc: $S1
    $P2 = __ARG_2.'show'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 94
    concat $S0, __ARG_1, ' near '
    concat $S0, $S0, $S1
    set __ARG_1, $S0
# }
  __label_1: # endif
.annotate 'line', 96
# var payload: $P1
    unless __ARG_3 goto __label_4
.annotate 'line', 97
    new $P2, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    $P2.'WinxedCompilerError'('internal', __ARG_1)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 98
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    $P4 = __ARG_2.'filename'()
    $P5 = __ARG_2.'linenum'()
    $P3.'WinxedCompilerError'('internal', __ARG_1, $P4, $P5)
    set $P1, $P3
  __label_3:
.annotate 'line', 99
# predefined Error
    root_new $P2, ['parrot';'Exception']
    $P2['message'] = __ARG_1
    $P2['severity'] = 2
    $P2['type'] = 567
    $P2['payload'] = $P1
    throw $P2
# }
.annotate 'line', 100

.end # InternalError


.sub 'TokenError' :subid('WSubId_7')
        .param string __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 104
# predefined string
    getattribute $P2, __ARG_2, 'filename'
    set $S1, $P2
# predefined string
    set $S2, __ARG_3
    concat $S3, __ARG_1, ' in '
    concat $S3, $S3, $S1
    concat $S3, $S3, ' line '
    concat $S3, $S3, $S2
.annotate 'line', 106
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    getattribute $P5, __ARG_2, 'filename'
    $P4.'WinxedCompilerError'('tokenizer', __ARG_1, $P5, __ARG_3)
    set $P3, $P4
# predefined Error
.annotate 'line', 104
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S3
    $P1['severity'] = 2
    $P1['type'] = 567
    $P1['payload'] = $P3
    throw $P1
# }
.annotate 'line', 107

.end # TokenError


.sub 'SyntaxError' :subid('WSubId_1')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 111
# line: $I1
    $P1 = __ARG_2.'linenum'()
    set $I1, $P1
.annotate 'line', 112
# file: $S1
    $P1 = __ARG_2.'filename'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 113
# desc: $S2
# predefined string
    $P1 = __ARG_2.'viewable'()
    set $S3, $P1
    concat $S2, ' near ', $S3
.annotate 'line', 114
# predefined string
    set $S3, $I1
    concat $S4, __ARG_1, ' in '
    concat $S4, $S4, $S1
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    concat $S4, $S4, $S2
.annotate 'line', 116
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    concat $S5, __ARG_1, $S2
.annotate 'line', 117
    $P3.'WinxedCompilerError'('parser', $S5, $S1, $I1)
    set $P2, $P3
# predefined Error
.annotate 'line', 114
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S4
    $P1['severity'] = 2
    $P1['type'] = 567
    $P1['payload'] = $P2
    throw $P1
# }
.annotate 'line', 118

.end # SyntaxError


.sub 'Expected' :subid('WSubId_40')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 122
    concat $S1, "Expected ", __ARG_1
    WSubId_1($S1, __ARG_2)
# }
.annotate 'line', 123

.end # Expected


.sub 'Unexpected' :subid('WSubId_41')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 127
    concat $S1, "Unexpected ", __ARG_1
    WSubId_1($S1, __ARG_2)
# }
.annotate 'line', 128

.end # Unexpected


.sub 'ExpectedIdentifier' :subid('WSubId_3')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 132
    WSubId_1("Expected identifier", __ARG_1)
# }
.annotate 'line', 133

.end # ExpectedIdentifier


.sub 'ExpectedOp' :subid('WSubId_2')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 137
    concat $S1, "Expected '", __ARG_1
    concat $S1, $S1, "'"
    WSubId_1($S1, __ARG_2)
# }
.annotate 'line', 138

.end # ExpectedOp


.sub 'RequireOp' :subid('WSubId_4')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 142
    $P1 = __ARG_2.'isop'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 143
    WSubId_2(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 144

.end # RequireOp


.sub 'RequireKeyword' :subid('WSubId_5')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 148
    $P1 = __ARG_2.'iskeyword'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 149
    WSubId_2(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 150

.end # RequireKeyword


.sub 'RequireIdentifier' :subid('WSubId_92')
        .param pmc __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 154
    $P1 = __ARG_1.'isidentifier'()
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 155
    WSubId_3(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 156

.end # RequireIdentifier


.sub 'ExpectOp' :subid('WSubId_54')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 160
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 161
    WSubId_4(__ARG_1, $P1)
# }
.annotate 'line', 162

.end # ExpectOp


.sub 'ExpectKeyword' :subid('WSubId_94')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_5 = "WSubId_5"
# Body
# {
.annotate 'line', 166
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 167
    WSubId_5(__ARG_1, $P1)
# }
.annotate 'line', 168

.end # ExpectKeyword


.sub 'UndefinedVariable' :subid('WSubId_59')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 172
# predefined string
    set $S1, __ARG_1
    concat $S2, "Variable '", $S1
    concat $S2, $S2, "' is not defined"
    WSubId_1($S2, __ARG_1)
# }
.annotate 'line', 173

.end # UndefinedVariable

.namespace [ 'Winxed'; 'Compiler'; 'Token' ]

.sub 'Token' :method
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 185
    box $P1, __ARG_1
    setattribute self, 'file', $P1
.annotate 'line', 186
    box $P1, __ARG_2
    setattribute self, 'line', $P1
# }
.annotate 'line', 187

.end # Token


.sub 'iseof' :method
# Body
# {
.annotate 'line', 189
    .return(0)
# }

.end # iseof


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 190
    .return(0)
# }

.end # iscomment


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 191
    .return(0)
# }

.end # isidentifier


.sub 'isint' :method
# Body
# {
.annotate 'line', 192
    .return(0)
# }

.end # isint


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 193
    .return(0)
# }

.end # isfloat


.sub 'isstring' :method
# Body
# {
.annotate 'line', 194
    .return(0)
# }

.end # isstring


.sub 'rawstring' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 198
    WSubId_6('Not a literal string', self)
# }
.annotate 'line', 199

.end # rawstring


.sub 'getidentifier' :method
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 202
    WSubId_3(self)
# }
.annotate 'line', 203

.end # getidentifier


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 204
    .return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method
# Body
# {
.annotate 'line', 205
    .return(0)
# }

.end # checkkeyword


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 206
    .return(0)
# }

.end # isop


.sub 'checkop' :method
# Body
# {
.annotate 'line', 207
    .return('')
# }

.end # checkop


.sub 'viewable' :method
# Body
# {
.annotate 'line', 208
    .return('(unknown)')
# }

.end # viewable


.sub 'filename' :method
# Body
# {
.annotate 'line', 209
    getattribute $P1, self, 'file'
    .return($P1)
# }

.end # filename


.sub 'linenum' :method
# Body
# {
.annotate 'line', 210
    getattribute $P1, self, 'line'
    .return($P1)
# }

.end # linenum


.sub 'show' :method
# Body
# {
.annotate 'line', 213
# r: $S1
    $P1 = self.'viewable'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 214
# predefined string
    getattribute $P1, self, 'file'
.annotate 'line', 212
    set $S2, $P1
# predefined string
.annotate 'line', 214
    getattribute $P2, self, 'line'
.annotate 'line', 212
    set $S3, $P2
.annotate 'line', 214
    concat $S4, $S1, ' at '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    .return($S4)
# }
.annotate 'line', 215

.end # show

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Token' ]
.annotate 'line', 181
    addattribute $P0, 'file'
.annotate 'line', 182
    addattribute $P0, 'line'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenEof' ]

.sub 'TokenEof' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 222
    self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 223

.end # TokenEof


.sub 'iseof' :method
# Body
# {
.annotate 'line', 224
    .return(1)
# }

.end # iseof


.sub 'viewable' :method
# Body
# {
.annotate 'line', 225
    .return('(End of file)')
# }

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
.annotate 'line', 218
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]

.sub 'TokenWithVal' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 233
    self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 234
    box $P1, __ARG_3
    setattribute self, 'str', $P1
# }
.annotate 'line', 235

.end # TokenWithVal


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 236
    getattribute $P1, self, 'str'
    .return($P1)
# }

.end # get_string


.sub 'viewable' :method
# Body
# {
.annotate 'line', 239
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 240

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
.annotate 'line', 228
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    addparent $P0, $P1
.annotate 'line', 230
    addattribute $P0, 'str'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenComment' ]

.sub 'TokenComment' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 247
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 248

.end # TokenComment


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 249
    .return(1)
# }

.end # iscomment

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
.annotate 'line', 243
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenOp' ]

.sub 'TokenOp' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 256
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 257

.end # TokenOp


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 260
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 261

.end # isop


.sub 'checkop' :method
# Body
# {
# predefined string
.annotate 'line', 264
    getattribute $P1, self, 'str'
.annotate 'line', 263
    set $S1, $P1
.annotate 'line', 264
    .return($S1)
# }
.annotate 'line', 265

.end # checkop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
.annotate 'line', 252
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]

.sub 'TokenIdentifier' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 272
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 273

.end # TokenIdentifier


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 274
    .return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method
# Body
# {
.annotate 'line', 277
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 278

.end # getidentifier


.sub 'checkkeyword' :method
# Body
# {
# predefined string
.annotate 'line', 281
    getattribute $P1, self, 'str'
.annotate 'line', 280
    set $S1, $P1
.annotate 'line', 281
    .return($S1)
# }
.annotate 'line', 282

.end # checkkeyword


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 285
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 286

.end # iskeyword

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 268
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenString' ]

.sub 'isstring' :method
# Body
# {
.annotate 'line', 291
    .return(1)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.annotate 'line', 294
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 295

.end # rawstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenString' ]
.annotate 'line', 289
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]

.sub 'TokenQuoted' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 302
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 303

.end # TokenQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 306
    getattribute $P1, self, 'str'
.annotate 'line', 305
    set $S1, $P1
.annotate 'line', 306
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 307

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 310
    getattribute $P1, self, 'str'
.annotate 'line', 309
    set $S1, $P1
.annotate 'line', 310
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 311

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 314
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 315

.end # getasquoted


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 318
# str: $S1
    getattribute $P2, self, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 319
# var s: $P1
    box $P1, $S1
.annotate 'line', 320
# strunesc: $S2
    $P2 = $P1.'unescape'('utf8')
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 321
# need_encoding: $I1
    null $I1
.annotate 'line', 322
    box $P2, $S2
    iter $P3, $P2
    set $P3, 0
  __label_3: # for iteration
    unless $P3 goto __label_4
    shift $I2, $P3
# {
.annotate 'line', 323
    le $I2, 127, __label_5
# {
.annotate 'line', 324
    set $I1, 1
    goto __label_4 # break
.annotate 'line', 325
# }
  __label_5: # endif
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 328
# pirop escape
    escape $S1, $S2
.annotate 'line', 329
# encoding: $S3
    unless $I1 goto __label_7
    set $S3, "utf8:"
    goto __label_6
  __label_7:
    set $S3, ""
  __label_6:
.annotate 'line', 330
    concat $S4, $S3, '"'
    concat $S4, $S4, $S1
    concat $S4, $S4, '"'
    .return($S4)
# }
.annotate 'line', 331

.end # getPirString

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
.annotate 'line', 298
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]

.sub 'TokenSingleQuoted' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 338
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 339

.end # TokenSingleQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 342
    getattribute $P1, self, 'str'
.annotate 'line', 341
    set $S1, $P1
.annotate 'line', 342
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 343

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 346
    getattribute $P1, self, 'str'
.annotate 'line', 345
    set $S1, $P1
.annotate 'line', 346
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 347

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 350
# s: $S1
    set $S1, ''
.annotate 'line', 351
    getattribute $P1, self, 'str'
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S2, $P2
# {
# switch
.annotate 'line', 352
    set $S3, $S2
    set $S4, '"'
    if $S3 == $S4 goto __label_5
    set $S4, '\'
    if $S3 == $S4 goto __label_6
    set $S4, "'"
    if $S3 == $S4 goto __label_7
    goto __label_4
  __label_5: # case
  __label_6: # case
  __label_7: # case
.annotate 'line', 356
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_3 # break
  __label_4: # default
  __label_3: # switch end
.annotate 'line', 359
    concat $S1, $S1, $S2
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 361
    .return($S1)
# }
.annotate 'line', 362

.end # getasquoted


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 365
# str: $S1
    getattribute $P1, self, 'str'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 366
# quote: $S2
    set $S2, "'"
.annotate 'line', 367
# need_escape: $I1
    null $I1
.annotate 'line', 368
    box $P1, $S1
    iter $P2, $P1
    set $P2, 0
  __label_2: # for iteration
    unless $P2 goto __label_3
    shift $I2, $P2
# {
.annotate 'line', 369
    islt $I5, $I2, 32
    if $I5 goto __label_5
    isgt $I5, $I2, 127
  __label_5:
    unless $I5 goto __label_4
# {
.annotate 'line', 370
    set $I1, 1
    goto __label_3 # break
.annotate 'line', 371
# }
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 374
# need_encoding: $I3
    null $I3
.annotate 'line', 375
    unless $I1 goto __label_6
# {
.annotate 'line', 376
    set $S2, '"'
.annotate 'line', 377
# result: $S3
    set $S3, ''
.annotate 'line', 378
    box $P1, $S1
    iter $P3, $P1
    set $P3, 0
  __label_7: # for iteration
    unless $P3 goto __label_8
    shift $S4, $P3
# {
.annotate 'line', 379
    ne $S4, '\', __label_9
.annotate 'line', 380
    concat $S3, $S3, '\\'
    goto __label_10
  __label_9: # else
# {
.annotate 'line', 383
# n: $I4
# predefined ord
    ord $I4, $S4
.annotate 'line', 384
    islt $I5, $I4, 32
    if $I5 goto __label_13
    isgt $I5, $I4, 127
  __label_13:
    unless $I5 goto __label_11
# {
.annotate 'line', 385
    le $I4, 127, __label_14
.annotate 'line', 386
    set $I3, 1
  __label_14: # endif
.annotate 'line', 387
# h: $S5
    box $P4, $I4
    $P1 = $P4.'get_as_base'(16)
    null $S5
    if_null $P1, __label_15
    set $S5, $P1
  __label_15:
.annotate 'line', 388
    concat $S3, $S3, '\x{'
    concat $S3, $S3, $S5
    concat $S3, $S3, '}'
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 391
    concat $S3, $S3, $S4
  __label_12: # endif
# }
  __label_10: # endif
# }
    goto __label_7
  __label_8: # endfor
.annotate 'line', 394
    set $S1, $S3
# }
  __label_6: # endif
.annotate 'line', 396
    concat $S0, $S2, $S1
    concat $S0, $S0, $S2
    set $S1, $S0
.annotate 'line', 397
    unless $I3 goto __label_16
.annotate 'line', 398
    concat $S0, 'utf8:', $S1
    set $S1, $S0
  __label_16: # endif
.annotate 'line', 399
    .return($S1)
# }
.annotate 'line', 400

.end # getPirString

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
.annotate 'line', 334
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenInteger' ]

.sub 'TokenInteger' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 407
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 408

.end # TokenInteger


.sub 'isint' :method
# Body
# {
.annotate 'line', 409
    .return(1)
# }

.end # isint

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
.annotate 'line', 403
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenFloat' ]

.sub 'TokenFloat' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 416
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 417

.end # TokenFloat


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 418
    .return(1)
# }

.end # isfloat

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
.annotate 'line', 412
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getquoted' :subid('WSubId_13')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 428
# s: $S1
    set $S1, ''
.annotate 'line', 429
# c: $S2
    null $S2
# for loop
.annotate 'line', 430
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, '"', __label_2
# {
# switch
.annotate 'line', 431
    set $S4, $S2
    set $S5, ""
    if $S4 == $S5 goto __label_6
    set $S5, "\n"
    if $S4 == $S5 goto __label_7
    set $S5, '\'
    if $S4 == $S5 goto __label_8
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 434
    WSubId_7('Unterminated string', __ARG_1, __ARG_3)
  __label_8: # case
.annotate 'line', 437
# c2: $S3
    $P2 = __ARG_1.'getchar'()
    null $S3
    if_null $P2, __label_9
    set $S3, $P2
  __label_9:
.annotate 'line', 438
    iseq $I1, $S3, ''
    if $I1 goto __label_11
    iseq $I1, $S3, "\n"
  __label_11:
    unless $I1 goto __label_10
.annotate 'line', 439
    WSubId_7('Unterminated string', __ARG_1, __ARG_3)
  __label_10: # endif
.annotate 'line', 440
    concat $S1, $S1, $S2
    concat $S1, $S1, $S3
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 443
    concat $S1, $S1, $S2
  __label_4: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 430
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 446
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 447

.end # getquoted


.sub 'getsinglequoted' :subid('WSubId_14')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 451
# s: $S1
    set $S1, ''
.annotate 'line', 452
# c: $S2
    null $S2
# for loop
.annotate 'line', 453
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "'", __label_2
# {
.annotate 'line', 454
    iseq $I1, $S2, ""
    if $I1 goto __label_5
    iseq $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 455
    WSubId_7('Unterminated string', __ARG_1, __ARG_3)
  __label_4: # endif
.annotate 'line', 456
    concat $S1, $S1, $S2
# }
  __label_1: # for iteration
.annotate 'line', 453
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 458
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenSingleQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 459

.end # getsinglequoted


.sub 'getheredoc' :subid('WSubId_15')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 463
# mark: $S1
    set $S1, ''
.annotate 'line', 464
# c: $S2
    null $S2
# for loop
.annotate 'line', 465
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "\n", __label_2
# {
# switch
.annotate 'line', 466
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_6
    set $S6, '"'
    if $S5 == $S6 goto __label_7
    set $S6, '\'
    if $S5 == $S6 goto __label_8
    goto __label_5
  __label_6: # case
.annotate 'line', 468
    WSubId_7('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_7: # case
  __label_8: # case
.annotate 'line', 473
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_4 # break
  __label_5: # default
  __label_4: # switch end
.annotate 'line', 476
    concat $S0, $S1, $S2
    set $S1, $S0
# }
  __label_1: # for iteration
.annotate 'line', 465
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 478
    concat $S0, $S1, ':>>'
    set $S1, $S0
.annotate 'line', 480
# content: $S3
    set $S3, ''
.annotate 'line', 481
# line: $S4
    null $S4
  __label_9: # do
.annotate 'line', 482
# {
.annotate 'line', 483
    set $S4, ''
# for loop
.annotate 'line', 484
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_14: # for condition
    eq $S2, "\n", __label_13
# {
# switch
.annotate 'line', 485
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_17
    set $S6, '"'
    if $S5 == $S6 goto __label_18
    set $S6, '\'
    if $S5 == $S6 goto __label_19
    goto __label_16
  __label_17: # case
.annotate 'line', 487
    WSubId_7('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_18: # case
  __label_19: # case
.annotate 'line', 490
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_15 # break
  __label_16: # default
  __label_15: # switch end
.annotate 'line', 493
    concat $S4, $S4, $S2
# }
  __label_12: # for iteration
.annotate 'line', 484
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_14
  __label_13: # for end
.annotate 'line', 495
    eq $S4, $S1, __label_20
.annotate 'line', 496
    concat $S3, $S3, $S4
    concat $S3, $S3, '\n'
  __label_20: # endif
# }
  __label_11: # continue
.annotate 'line', 497
    ne $S4, $S1, __label_9
  __label_10: # enddo
.annotate 'line', 498
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 499

.end # getheredoc


.sub 'getident' :subid('WSubId_11')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_8 = "WSubId_8"
# Body
# {
.annotate 'line', 503
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 504
# c: $S2
    null $S2
# for loop
.annotate 'line', 505
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    $P2 = WSubId_8($S2)
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 506
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 505
    $P3 = __ARG_1.'getchar'()
    set $S2, $P3
    goto __label_3
  __label_2: # for end
.annotate 'line', 507
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 508
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenIdentifier'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 509

.end # getident


.sub 'getnumber' :subid('WSubId_20')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_9 = "WSubId_9"
.const 'Sub' WSubId_10 = "WSubId_10"
# Body
# {
.annotate 'line', 513
# s: $S1
    null $S1
.annotate 'line', 514
# c: $S2
    set $S2, __ARG_2
  __label_1: # do
.annotate 'line', 515
# {
.annotate 'line', 516
    concat $S1, $S1, $S2
.annotate 'line', 517
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_3: # continue
.annotate 'line', 518
    $P1 = WSubId_9($S2)
    if_null $P1, __label_2
    if $P1 goto __label_1
  __label_2: # enddo
.annotate 'line', 519
    iseq $I3, $S1, '0'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'x'
    if $I3 goto __label_6
    iseq $I3, $S2, 'X'
  __label_6:
  __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 520
# hexval: $I1
    null $I1
# h: $I2
    null $I2
# for loop
.annotate 'line', 521
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_9: # for condition
    $P2 = WSubId_10($S2)
    set $I2, $P2
    lt $I2, 0, __label_8
# {
.annotate 'line', 522
    mul $I3, $I1, 16
    add $I1, $I3, $I2
.annotate 'line', 523
    concat $S1, $S1, $S2
# }
  __label_7: # for iteration
.annotate 'line', 521
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_9
  __label_8: # for end
.annotate 'line', 525
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 526
    set $S1, $I1
.annotate 'line', 527
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
  __label_4: # endif
.annotate 'line', 529
    ne $S2, '.', __label_10
# {
  __label_12: # do
.annotate 'line', 530
# {
.annotate 'line', 531
    concat $S1, $S1, $S2
.annotate 'line', 532
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_14: # continue
.annotate 'line', 533
    $P1 = WSubId_9($S2)
    if_null $P1, __label_13
    if $P1 goto __label_12
  __label_13: # enddo
.annotate 'line', 534
    iseq $I3, $S2, 'e'
    if $I3 goto __label_16
    iseq $I3, $S2, 'E'
  __label_16:
    unless $I3 goto __label_15
# {
.annotate 'line', 535
    concat $S1, $S1, 'E'
.annotate 'line', 536
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_18
    iseq $I3, $S2, '-'
  __label_18:
    unless $I3 goto __label_17
# {
.annotate 'line', 537
    concat $S1, $S1, $S2
.annotate 'line', 538
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_17: # endif
# for loop
  __label_21: # for condition
.annotate 'line', 540
    $P1 = WSubId_9($S2)
    if_null $P1, __label_20
    unless $P1 goto __label_20
.annotate 'line', 541
    concat $S1, $S1, $S2
  __label_19: # for iteration
.annotate 'line', 540
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_21
  __label_20: # for end
# }
  __label_15: # endif
.annotate 'line', 543
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 544
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 547
    iseq $I3, $S2, 'e'
    if $I3 goto __label_24
    iseq $I3, $S2, 'E'
  __label_24:
    unless $I3 goto __label_22
# {
.annotate 'line', 548
    concat $S1, $S1, 'E'
.annotate 'line', 549
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_26
    iseq $I3, $S2, '-'
  __label_26:
    unless $I3 goto __label_25
# {
.annotate 'line', 550
    concat $S1, $S1, $S2
.annotate 'line', 551
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_25: # endif
# for loop
  __label_29: # for condition
.annotate 'line', 553
    $P1 = WSubId_9($S2)
    if_null $P1, __label_28
    unless $P1 goto __label_28
.annotate 'line', 554
    concat $S1, $S1, $S2
  __label_27: # for iteration
.annotate 'line', 553
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_29
  __label_28: # for end
.annotate 'line', 555
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 556
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_23
  __label_22: # else
# {
.annotate 'line', 559
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 560
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
  __label_23: # endif
# }
  __label_11: # endif
# }
.annotate 'line', 563

.end # getnumber


.sub 'getlinecomment' :subid('WSubId_16')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 567
# s: $S1
    set $S1, __ARG_2
# for loop
.annotate 'line', 568
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
  __label_3: # for condition
    isne $I1, $S2, ''
    unless $I1 goto __label_5
    isne $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_2
.annotate 'line', 569
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 568
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_3
  __label_2: # for end
.annotate 'line', 570
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 571

.end # getlinecomment


.sub 'getcomment' :subid('WSubId_17')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 575
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 576
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
  __label_2: # do
.annotate 'line', 577
# {
# for loop
  __label_7: # for condition
.annotate 'line', 578
    isne $I1, $S2, ''
    unless $I1 goto __label_8
    isne $I1, $S2, '*'
  __label_8:
    unless $I1 goto __label_6
.annotate 'line', 579
    concat $S1, $S1, $S2
  __label_5: # for iteration
.annotate 'line', 578
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_7
  __label_6: # for end
.annotate 'line', 580
    ne $S2, '', __label_9
.annotate 'line', 581
    WSubId_7("Unclosed comment", __ARG_1, __ARG_3)
  __label_9: # endif
.annotate 'line', 582
    concat $S1, $S1, $S2
.annotate 'line', 583
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 584
    ne $S2, '', __label_10
.annotate 'line', 585
    WSubId_7("Unclosed comment", __ARG_1, __ARG_3)
  __label_10: # endif
# }
  __label_4: # continue
.annotate 'line', 586
    ne $S2, '/', __label_2
  __label_3: # enddo
.annotate 'line', 587
    concat $S1, $S1, '/'
.annotate 'line', 588
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 589

.end # getcomment


.sub 'getop' :subid('WSubId_12')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 593
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 594
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 595

.end # getop

.namespace [ 'Winxed'; 'Compiler'; 'Tokenizer' ]

.sub 'Tokenizer' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_11 = "WSubId_11"
.const 'Sub' WSubId_12 = "WSubId_12"
.const 'Sub' WSubId_13 = "WSubId_13"
.const 'Sub' WSubId_14 = "WSubId_14"
.const 'Sub' WSubId_15 = "WSubId_15"
.const 'Sub' WSubId_16 = "WSubId_16"
.const 'Sub' WSubId_17 = "WSubId_17"
# Body
# {
.annotate 'line', 611
    setattribute self, 'h', __ARG_1
.annotate 'line', 612
    box $P2, ''
    setattribute self, 'pending', $P2
.annotate 'line', 613
    root_new $P3, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P3
.annotate 'line', 614
    box $P2, __ARG_2
    setattribute self, 'filename', $P2
.annotate 'line', 615
    box $P2, 1
    setattribute self, 'line', $P2
.annotate 'line', 616
# var select: $P1
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 617
    root_new $P3, ['parrot';'Hash']
    $P3[''] = WSubId_11
    $P3['{'] = WSubId_12
    $P1['$'] = $P3
.annotate 'line', 618
    $P1['"'] = WSubId_13
.annotate 'line', 619
    $P1["'"] = WSubId_14
.annotate 'line', 620
    root_new $P9, ['parrot';'Hash']
.annotate 'line', 621
    root_new $P11, ['parrot';'Hash']
    $P11[''] = WSubId_12
    $P11['='] = WSubId_12
    $P9['='] = $P11
.annotate 'line', 622
    $P9[':'] = WSubId_12
    $P1['='] = $P9
.annotate 'line', 624
    root_new $P16, ['parrot';'Hash']
    $P16['+'] = WSubId_12
    $P16['='] = WSubId_12
    $P1['+'] = $P16
.annotate 'line', 625
    root_new $P20, ['parrot';'Hash']
    $P20['-'] = WSubId_12
    $P20['='] = WSubId_12
    $P1['-'] = $P20
.annotate 'line', 626
    root_new $P24, ['parrot';'Hash']
    $P24['='] = WSubId_12
    $P1['*'] = $P24
.annotate 'line', 627
    root_new $P27, ['parrot';'Hash']
    $P27['|'] = WSubId_12
    $P1['|'] = $P27
.annotate 'line', 628
    root_new $P30, ['parrot';'Hash']
    $P30['&'] = WSubId_12
    $P1['&'] = $P30
.annotate 'line', 629
    root_new $P33, ['parrot';'Hash']
.annotate 'line', 630
    root_new $P35, ['parrot';'Hash']
    $P35[''] = WSubId_12
    $P35[':'] = WSubId_15
    $P33['<'] = $P35
.annotate 'line', 631
    $P33['='] = WSubId_12
    $P1['<'] = $P33
.annotate 'line', 633
    root_new $P40, ['parrot';'Hash']
    $P40['>'] = WSubId_12
    $P40['='] = WSubId_12
    $P1['>'] = $P40
.annotate 'line', 634
    root_new $P44, ['parrot';'Hash']
.annotate 'line', 635
    root_new $P46, ['parrot';'Hash']
    $P46[''] = WSubId_12
    $P46['='] = WSubId_12
    $P44['='] = $P46
    $P1['!'] = $P44
.annotate 'line', 637
    root_new $P50, ['parrot';'Hash']
    $P50['%'] = WSubId_12
    $P50['='] = WSubId_12
    $P1['%'] = $P50
.annotate 'line', 638
    root_new $P54, ['parrot';'Hash']
    $P54['='] = WSubId_12
    $P54['/'] = WSubId_16
    $P54['*'] = WSubId_17
    $P1['/'] = $P54
.annotate 'line', 639
    $P1['#'] = WSubId_16
.annotate 'line', 641
    setattribute self, 'select', $P1
# }
.annotate 'line', 642

.end # Tokenizer


.sub 'getchar' :method
# Body
# {
.annotate 'line', 645
# var pending: $P1
    getattribute $P1, self, 'pending'
.annotate 'line', 646
# c: $S1
    set $P3, $P1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 647
    eq $S1, '', __label_2
.annotate 'line', 648
    assign $P1, ''
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 650
# var h: $P2
    getattribute $P2, self, 'h'
.annotate 'line', 651
    $P3 = $P2.'read'(1)
    set $S1, $P3
.annotate 'line', 652
    ne $S1, "\n", __label_4
.annotate 'line', 653
    getattribute $P3, self, 'line'
    inc $P3
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 655
    .return($S1)
# }
.annotate 'line', 656

.end # getchar


.sub 'ungetchar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 659
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
# }
.annotate 'line', 660

.end # ungetchar


.sub 'get_token' :method
.const 'Sub' WSubId_18 = "WSubId_18"
.const 'Sub' WSubId_19 = "WSubId_19"
.const 'Sub' WSubId_11 = "WSubId_11"
.const 'Sub' WSubId_9 = "WSubId_9"
.const 'Sub' WSubId_20 = "WSubId_20"
.const 'Sub' WSubId_12 = "WSubId_12"
# Body
# {
.annotate 'line', 663
    getattribute $P3, self, 'stacked'
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 664
    getattribute $P4, self, 'stacked'
    .tailcall $P4.'pop'()
  __label_1: # endif
.annotate 'line', 666
# c: $S1
    $P3 = self.'getchar'()
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
  __label_4: # while
.annotate 'line', 667
    $P3 = WSubId_18($S1)
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 668
    $P4 = self.'getchar'()
    set $S1, $P4
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 669
# line: $I1
    getattribute $P3, self, 'line'
    set $I1, $P3
.annotate 'line', 670
    ne $S1, '', __label_5
.annotate 'line', 671
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    getattribute $P5, self, 'filename'
    $P4.'TokenEof'($P5)
    set $P3, $P4
    .return($P3)
  __label_5: # endif
.annotate 'line', 672
    $P3 = WSubId_19($S1)
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 673
    .tailcall WSubId_11(self, $S1, $I1)
  __label_6: # endif
.annotate 'line', 674
    $P3 = WSubId_9($S1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 675
    .tailcall WSubId_20(self, $S1, $I1)
  __label_7: # endif
.annotate 'line', 677
# op: $S2
    set $S2, $S1
.annotate 'line', 678
# var select: $P1
    getattribute $P1, self, 'select'
.annotate 'line', 679
# var current: $P2
    $P2 = $P1[$S1]
  __label_9: # while
.annotate 'line', 681
    isnull $I2, $P2
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P2, 'Hash'
  __label_10:
    unless $I2 goto __label_8
# {
.annotate 'line', 682
    $P3 = self.'getchar'()
    set $S1, $P3
.annotate 'line', 683
    set $P1, $P2
.annotate 'line', 684
    $P2 = $P1[$S1]
.annotate 'line', 685
    unless_null $P2, __label_11
# {
.annotate 'line', 686
    self.'ungetchar'($S1)
.annotate 'line', 687
    $P2 = $P1['']
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 690
    concat $S2, $S2, $S1
  __label_12: # endif
# }
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 692
    if_null $P2, __label_13
    unless $P2 goto __label_13
.annotate 'line', 693
    .tailcall $P2(self, $S2, $I1)
  __label_13: # endif
.annotate 'line', 694
    .tailcall WSubId_12(self, $S2, $I1)
# }
.annotate 'line', 695

.end # get_token


.sub 'get' :method
        .param int __ARG_1 :optional
# Body
# {
.annotate 'line', 698
# var t: $P1
    $P1 = self.'get_token'()
  __label_2: # while
.annotate 'line', 699
    $P2 = $P1.'iseof'()
    isfalse $I1, $P2
    unless $I1 goto __label_4
    not $I1, __ARG_1
  __label_4:
    unless $I1 goto __label_3
    $I1 = $P1.'iscomment'()
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 700
    $P1 = self.'get_token'()
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 701
    .return($P1)
# }
.annotate 'line', 702

.end # get


.sub 'unget' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 705
    getattribute $P1, self, 'stacked'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 706

.end # unget

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
.annotate 'line', 603
    addattribute $P0, 'h'
.annotate 'line', 604
    addattribute $P0, 'pending'
.annotate 'line', 605
    addattribute $P0, 'select'
.annotate 'line', 606
    addattribute $P0, 'stacked'
.annotate 'line', 607
    addattribute $P0, 'filename'
.annotate 'line', 608
    addattribute $P0, 'line'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant REGint evaluated at compile time
# Constant REGfloat evaluated at compile time
# Constant REGstring evaluated at compile time
# Constant REGvar evaluated at compile time
# Constant REGarglist evaluated at compile time
# Constant REGany evaluated at compile time
# Constant REGraw1 evaluated at compile time
# Constant REGnone evaluated at compile time

.sub 'typetoregcheck' :subid('WSubId_95')
        .param string __ARG_1
# Body
# {
# switch
.annotate 'line', 727
    set $S1, __ARG_1
    set $S2, 'int'
    if $S1 == $S2 goto __label_3
    set $S2, 'float'
    if $S1 == $S2 goto __label_4
    set $S2, 'string'
    if $S1 == $S2 goto __label_5
    set $S2, 'var'
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 728
    .return('I')
  __label_4: # case
.annotate 'line', 729
    .return('N')
  __label_5: # case
.annotate 'line', 730
    .return('S')
  __label_6: # case
.annotate 'line', 731
    .return('P')
  __label_2: # default
.annotate 'line', 732
    .return('')
  __label_1: # switch end
# }
.annotate 'line', 734

.end # typetoregcheck


.sub 'typetopirname' :subid('WSubId_104')
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
# switch
.annotate 'line', 738
    set $S1, __ARG_1
    set $S2, 'I'
    if $S1 == $S2 goto __label_3
    set $S2, 'N'
    if $S1 == $S2 goto __label_4
    set $S2, 'S'
    if $S1 == $S2 goto __label_5
    set $S2, 'P'
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 739
    .return('int')
  __label_4: # case
.annotate 'line', 740
    .return('num')
  __label_5: # case
.annotate 'line', 741
    .return('string')
  __label_6: # case
.annotate 'line', 742
    .return('pmc')
  __label_2: # default
.annotate 'line', 743
    WSubId_6('Invalid reg type')
  __label_1: # switch end
# }
.annotate 'line', 745

.end # typetopirname

# Constant INDENT evaluated at compile time
# Constant INDENTLABEL evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 765
    setattribute self, 'handle', __ARG_1
.annotate 'line', 766
    box $P1, ''
    setattribute self, 'file', $P1
.annotate 'line', 767
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 768
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 769
    box $P1, 0
    setattribute self, 'pendingl', $P1
# }
.annotate 'line', 770

.end # Emit


.sub 'disable_annotations' :method
# Body
# {
.annotate 'line', 773
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 774

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 777
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 778

.end # close


.sub 'updateannot' :method
# Body
# {
.annotate 'line', 781
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 782
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'file', '"
    push $P3, $P4
.annotate 'line', 784
    getattribute $P5, self, 'file'
.annotate 'line', 782
    push $P3, $P5
    box $P4, "'\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 787
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
  __label_1: # endif
.annotate 'line', 789
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_2
    unless $P1 goto __label_2
# {
.annotate 'line', 790
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'line', "
    push $P3, $P4
.annotate 'line', 792
    getattribute $P5, self, 'line'
.annotate 'line', 790
    push $P3, $P5
    box $P4, "\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 795
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
  __label_2: # endif
# }
.annotate 'line', 797

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 800
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 801
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 802

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 805
    self.'updateannot'()
.annotate 'line', 806
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 807

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 810
    self.'updateannot'()
.annotate 'line', 811
    self.'vprint'(__ARG_1)
.annotate 'line', 812
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 813

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 816
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_1
# {
.annotate 'line', 818
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 819
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 820
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 821
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 822
    set $S2, $P1
    eq $S2, $S1, __label_3
# {
.annotate 'line', 823
    assign $P1, $S1
.annotate 'line', 824
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 825
    assign $P2, 0
# }
  __label_3: # endif
.annotate 'line', 827
    set $I2, $P2
    eq $I2, $I1, __label_4
# {
.annotate 'line', 828
    assign $P2, $I1
.annotate 'line', 829
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 832

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 835
    self.'updateannot'()
.annotate 'line', 836
    getattribute $P1, self, 'handle'
    concat $S1, '# ', __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 837

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 840
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 841
    $P1.'print'('  ')
.annotate 'line', 842
    $P1.'print'(__ARG_1)
.annotate 'line', 843
    $P1.'print'(':')
.annotate 'line', 844
    if_null __ARG_2, __label_1
.annotate 'line', 845
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 846
    $P1.'print'("\n")
# }
.annotate 'line', 847

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 850
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 851
    $P1.'print'('    goto ')
.annotate 'line', 852
    $P1.'print'(__ARG_1)
.annotate 'line', 853
    if_null __ARG_2, __label_1
.annotate 'line', 854
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 855
    $P1.'print'("\n")
# }
.annotate 'line', 856

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 860
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    self.'say'($S1)
# }
.annotate 'line', 861

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 864
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    self.'say'($S1)
# }
.annotate 'line', 865

.end # emitarg2


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 868
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 869

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 872
    self.'say'('    if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 873

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 876
    self.'say'('    unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 877

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 880
    self.'say'('    if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 881

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 884
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 885

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 889
    self.'say'('    inc ', __ARG_1)
# }
.annotate 'line', 890

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 893
    self.'say'('    dec ', __ARG_1)
# }
.annotate 'line', 894

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 897
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 898

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 901
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 902

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 905
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 906

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 909
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 910

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 913
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 914

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 917
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 918

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 921
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 922

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 925
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 926

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 929
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 930

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 933
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 934

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 937
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 938

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 941
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 942

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 945
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 946

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 949
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 950

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 953
    self.'say'('    print ', __ARG_1)
# }
.annotate 'line', 954

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 957
    self.'say'('    say ', __ARG_1)
# }
.annotate 'line', 958

.end # emitsay


.sub 'emitget_hll_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
# Body
# {
.annotate 'line', 961
    concat $S1, "    get_hll_global ", __ARG_1
    self.'print'($S1)
.annotate 'line', 962
    if_null __ARG_3, __label_1
.annotate 'line', 963
    concat $S1, ", ", __ARG_3
    self.'print'($S1)
  __label_1: # endif
.annotate 'line', 964
    concat $S1, ", '", __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 965

.end # emitget_hll_global


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 968
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 969

.end # emitfind_lex


.sub 'emitstore_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 972
    self.'say'("store_lex '", __ARG_1, "', ", __ARG_2)
# }
.annotate 'line', 973

.end # emitstore_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Emit' ]
.annotate 'line', 756
    addattribute $P0, 'handle'
.annotate 'line', 757
    addattribute $P0, 'file'
.annotate 'line', 758
    addattribute $P0, 'line'
.annotate 'line', 759
    addattribute $P0, 'pendingf'
.annotate 'line', 760
    addattribute $P0, 'pendingl'
.annotate 'line', 761
    addattribute $P0, 'noan'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'integerValue' :subid('WSubId_21')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 982
    new $P2, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 983

.end # integerValue


.sub 'floatValue' :subid('WSubId_61')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 987
# var t: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 988
    new $P3, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 989

.end # floatValue


.sub 'floatresult' :subid('WSubId_62')
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 997
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_3
    iseq $I1, __ARG_2, 'I'
  __label_3:
  __label_2:
    if $I1 goto __label_1
.annotate 'line', 998
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_4
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_5
    iseq $I1, __ARG_1, 'I'
  __label_5:
  __label_4:
  __label_1:
.annotate 'line', 999
    .return($I1)
# }
.annotate 'line', 1000

.end # floatresult

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
# Constant VAR_is_volatile evaluated at compile time
# Constant VAR_is_lexical evaluated at compile time
# Constant VAR_is_extern evaluated at compile time
# Constant __DEBUG_PREDEFS evaluated at compile time
# Constant PREDEF_arglist evaluated at compile time
# Constant PREDEF_raw1 evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]

.sub 'Predef_frombody' :method
        .param string __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1037
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 1038
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 1039
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 1040
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat $S0, '    ', $S1
    set __ARG_2, $S0
.annotate 'line', 1041
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 1042
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 1043

.end # Predef_frombody


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1046
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1048
    ne $S1, 'v', __label_2
# {
.annotate 'line', 1049
    isnull $I1, __ARG_3
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_3, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 1050
    WSubId_1('using return value from void predef')
  __label_4: # endif
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 1053
    isnull $I1, __ARG_3
    if $I1 goto __label_7
    iseq $I1, __ARG_3, ''
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 1054
    WSubId_6('Bad result in non void predef')
  __label_6: # endif
# }
  __label_3: # endif
.annotate 'line', 1057
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 1058
    getattribute $P2, self, 'body'
    $P1.'append_format'($P2, __ARG_3, __ARG_4 :flat)
.annotate 'line', 1059
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1060
# predefined string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 1061

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]
.annotate 'line', 1023
    addattribute $P0, 'body'
.annotate 'line', 1024
    addattribute $P0, 'typeresult'
.end
.namespace [ 'Winxed'; 'Compiler'; 'PredefBase' ]

.sub 'PredefBase' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4
        .param string __ARG_5
        .param string __ARG_6
        .param string __ARG_7
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1082
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1083
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1084
    new $P3, [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1086
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1087
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1088
# n: $I1
    null $I1
.annotate 'line', 1089
    if_null __ARG_4, __label_3
# {
.annotate 'line', 1090
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
# switch
.annotate 'line', 1091
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_6
    set $S2, '!'
    if $S1 == $S2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 1093
    set $I1, -1
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 1096
    set $I1, -2
.annotate 'line', 1097
    if_null __ARG_5, __label_8
.annotate 'line', 1098
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    WSubId_6($S3)
  __label_8: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1101
    set $I1, 1
.annotate 'line', 1102
    if_null __ARG_5, __label_9
# {
.annotate 'line', 1103
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1104
    inc $I1
# }
  __label_9: # endif
.annotate 'line', 1106
    if_null __ARG_6, __label_10
# {
.annotate 'line', 1107
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1108
    inc $I1
# }
  __label_10: # endif
.annotate 'line', 1110
    if_null __ARG_7, __label_11
# {
.annotate 'line', 1111
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1112
    inc $I1
# }
  __label_11: # endif
  __label_4: # switch end
# }
  __label_3: # endif
.annotate 'line', 1116
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1117

.end # PredefBase


.sub 'name' :method
# Body
# {
.annotate 'line', 1120
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1121
    .return($S1)
# }
.annotate 'line', 1122

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1125
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1126

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1127
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1130
# type: $S1
    null $S1
# switch
.annotate 'line', 1131
    set $I1, __ARG_1
    null $I2
    if $I1 == $I2 goto __label_3
    set $I2, 1
    if $I1 == $I2 goto __label_4
    set $I2, 2
    if $I1 == $I2 goto __label_5
    set $I2, 3
    if $I1 == $I2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 1132
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1133
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1134
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 1135
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1137
    WSubId_6('Invalid predef arg')
  __label_1: # switch end
.annotate 'line', 1139
    .return($S1)
# }
.annotate 'line', 1140

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1143
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1144
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1145
    isne $I1, $S1, 'v'
    unless $I1 goto __label_3
    iseq $I1, __ARG_4, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 1146
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
  __label_2: # endif
.annotate 'line', 1147
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1148
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1149

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
.annotate 'line', 1066
    addattribute $P0, 'name'
.annotate 'line', 1067
    addattribute $P0, 'body'
.annotate 'line', 1068
    addattribute $P0, 'typeresult'
.annotate 'line', 1069
    addattribute $P0, 'type0'
.annotate 'line', 1070
    addattribute $P0, 'type1'
.annotate 'line', 1071
    addattribute $P0, 'type2'
.annotate 'line', 1072
    addattribute $P0, 'type3'
.annotate 'line', 1073
    addattribute $P0, 'nparams'
.end
.namespace [ 'Winxed'; 'Compiler'; 'PredefFunction' ]

.sub 'PredefFunction' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4 :optional
        .param string __ARG_5 :optional
        .param string __ARG_6 :optional
        .param string __ARG_7 :optional
# Body
# {
.annotate 'line', 1161
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1162

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1152
    get_class $P1, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]

.sub 'PredefFunctionEval' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5 :optional
        .param string __ARG_6 :optional
        .param string __ARG_7 :optional
        .param string __ARG_8 :optional
# Body
# {
.annotate 'line', 1175
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1176
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1177

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1165
    get_class $P1, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1167
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1185
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1186

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1189
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1190
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_2
.annotate 'line', 1191
    WSubId_6("Invalid Predef_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1192
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1193
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
# switch-case
.annotate 'line', 1195
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1196
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1197
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1200
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1201
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1203
    ne $S3, 'null', __label_9
.annotate 'line', 1204
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_10
  __label_9: # else
.annotate 'line', 1206
    __ARG_1.'emitset'(__ARG_3, $S3)
  __label_10: # endif
  __label_4: # switch end
# }
.annotate 'line', 1208

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
.annotate 'line', 1182
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'Predef_say' :subid('WSubId_32')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1213
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1214
# n: $I1
# predefined elements
    elements $I3, __ARG_4
    sub $I1, $I3, 1
.annotate 'line', 1215
    lt $I1, 0, __label_1
# {
# for loop
.annotate 'line', 1216
# i: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1217
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1216
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1218
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 1221
    __ARG_1.'emitsay'("''")
  __label_2: # endif
# }
.annotate 'line', 1222

.end # Predef_say


.sub 'Predef_cry' :subid('WSubId_33')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1226
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1227
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1228
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1229
    __ARG_1.'say'('    ', "print $P0, ", $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1230
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1231

.end # Predef_cry


.sub 'Predef_print' :subid('WSubId_31')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1235
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1236
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1237
    __ARG_1.'emitprint'($S1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1238

.end # Predef_print


.sub 'Predef_invoke' :subid('WSubId_34')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1244
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1245
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 1246
    WSubId_1("invoke argument must be callable", __ARG_2)
  __label_1: # endif
.annotate 'line', 1247
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1248

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_22')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1252
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1253
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1254
# predefined length
.annotate 'line', 1251
    length $I1, $S1
.annotate 'line', 1254
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1255

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_23')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1259
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1260
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1261
# predefined bytelength
.annotate 'line', 1258
    bytelength $I1, $S1
.annotate 'line', 1261
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1262

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_25')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1266
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1267
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1268
# predefined ord
.annotate 'line', 1265
    ord $I1, $S1
.annotate 'line', 1268
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1269

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_26')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1273
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1274
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1275
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1276
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1277
# predefined ord
.annotate 'line', 1272
    ord $I2, $S1, $I1
.annotate 'line', 1277
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1278

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_24')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1282
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1284
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1285
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1287
# var t: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1288
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1289

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_27')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1293
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1294
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1295
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1296
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1298
# var t: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1299
    new $P5, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1300

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_28')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1304
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1305
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1306
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1307
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 1308
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1309
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1311
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1312
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1313

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_29')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1317
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1318
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1319
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1320
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1321
# predefined indexof
.annotate 'line', 1316
    index $I1, $S1, $S2
.annotate 'line', 1321
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1322

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_30')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1326
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1327
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1328
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1329
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1330
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1331
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1332
# predefined indexof
.annotate 'line', 1325
    index $I2, $S1, $S2, $I1
.annotate 'line', 1332
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1333

.end # predefeval_indexof_pos


.sub 'getpredefs' :subid('WSubId_35')
.const 'Sub' WSubId_22 = "WSubId_22"
.const 'Sub' WSubId_23 = "WSubId_23"
.const 'Sub' WSubId_24 = "WSubId_24"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_26 = "WSubId_26"
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_29 = "WSubId_29"
.const 'Sub' WSubId_30 = "WSubId_30"
.const 'Sub' WSubId_31 = "WSubId_31"
.const 'Sub' WSubId_32 = "WSubId_32"
.const 'Sub' WSubId_33 = "WSubId_33"
.const 'Sub' WSubId_34 = "WSubId_34"
# Body
# {
.annotate 'line', 1337
# var predefs: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1338
    new $P4, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1339
    new $P6, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P6.'Predef_typecast'('I')
    set $P5, $P6
    $P4.'PredefFunction'('int', $P5, 'I', '!')
    set $P3, $P4
.annotate 'line', 1337
    push $P1, $P3
.annotate 'line', 1342
    new $P8, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1343
    new $P10, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P10.'Predef_typecast'('N')
    set $P9, $P10
    $P8.'PredefFunction'('float', $P9, 'N', '!')
    set $P7, $P8
.annotate 'line', 1337
    push $P1, $P7
.annotate 'line', 1346
    new $P12, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1347
    new $P14, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P14.'Predef_typecast'('S')
    set $P13, $P14
    $P12.'PredefFunction'('string', $P13, 'S', '!')
    set $P11, $P12
.annotate 'line', 1337
    push $P1, $P11
.annotate 'line', 1350
    new $P16, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P16.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P15, $P16
.annotate 'line', 1337
    push $P1, $P15
.annotate 'line', 1354
    new $P18, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P18.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P17, $P18
.annotate 'line', 1337
    push $P1, $P17
.annotate 'line', 1358
    new $P20, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P20.'PredefFunction'('time', 'time %0', 'I')
    set $P19, $P20
.annotate 'line', 1337
    push $P1, $P19
.annotate 'line', 1362
    new $P22, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P22.'PredefFunction'('floattime', 'time %0', 'N')
    set $P21, $P22
.annotate 'line', 1337
    push $P1, $P21
.annotate 'line', 1366
    new $P24, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P24.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P23, $P24
.annotate 'line', 1337
    push $P1, $P23
.annotate 'line', 1370
    new $P26, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P26.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P25, $P26
.annotate 'line', 1337
    push $P1, $P25
.annotate 'line', 1374
    new $P28, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P28.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P27, $P28
.annotate 'line', 1337
    push $P1, $P27
.annotate 'line', 1378
    new $P30, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P30.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P29, $P30
.annotate 'line', 1337
    push $P1, $P29
.annotate 'line', 1382
    new $P32, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P32.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P31, $P32
.annotate 'line', 1337
    push $P1, $P31
.annotate 'line', 1389
    new $P34, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P34.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P33, $P34
.annotate 'line', 1337
    push $P1, $P33
.annotate 'line', 1396
    new $P36, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P36.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P35, $P36
.annotate 'line', 1337
    push $P1, $P35
.annotate 'line', 1403
    new $P38, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P38.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P37, $P38
.annotate 'line', 1337
    push $P1, $P37
.annotate 'line', 1411
    new $P40, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P40.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P39, $P40
.annotate 'line', 1337
    push $P1, $P39
.annotate 'line', 1420
    new $P42, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P42.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n%0['payload'] = %4\n", 'P', 'S', 'I', 'I', 'P')
    set $P41, $P42
.annotate 'line', 1337
    push $P1, $P41
.annotate 'line', 1430
    new $P44, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P44.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P43, $P44
.annotate 'line', 1337
    push $P1, $P43
.annotate 'line', 1434
    new $P46, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1435
    $P46.'PredefFunctionEval'('length', WSubId_22, 'length %0, %1', 'I', 'S')
    set $P45, $P46
.annotate 'line', 1337
    push $P1, $P45
.annotate 'line', 1439
    new $P48, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1440
    $P48.'PredefFunctionEval'('bytelength', WSubId_23, 'bytelength %0, %1', 'I', 'S')
    set $P47, $P48
.annotate 'line', 1337
    push $P1, $P47
.annotate 'line', 1444
    new $P50, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1445
    $P50.'PredefFunctionEval'('chr', WSubId_24, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P49, $P50
.annotate 'line', 1337
    push $P1, $P49
.annotate 'line', 1453
    new $P52, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1454
    $P52.'PredefFunctionEval'('ord', WSubId_25, 'ord %0, %1', 'I', 'S')
    set $P51, $P52
.annotate 'line', 1337
    push $P1, $P51
.annotate 'line', 1458
    new $P54, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1459
    $P54.'PredefFunctionEval'('ord', WSubId_26, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P53, $P54
.annotate 'line', 1337
    push $P1, $P53
.annotate 'line', 1463
    new $P56, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1464
    $P56.'PredefFunctionEval'('substr', WSubId_27, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P55, $P56
.annotate 'line', 1337
    push $P1, $P55
.annotate 'line', 1468
    new $P58, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1469
    $P58.'PredefFunctionEval'('substr', WSubId_28, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P57, $P58
.annotate 'line', 1337
    push $P1, $P57
.annotate 'line', 1473
    new $P60, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P60.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P59, $P60
.annotate 'line', 1337
    push $P1, $P59
.annotate 'line', 1477
    new $P62, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1478
    $P62.'PredefFunctionEval'('indexof', WSubId_29, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P61, $P62
.annotate 'line', 1337
    push $P1, $P61
.annotate 'line', 1482
    new $P64, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1483
    $P64.'PredefFunctionEval'('indexof', WSubId_30, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P63, $P64
.annotate 'line', 1337
    push $P1, $P63
.annotate 'line', 1487
    new $P66, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P66.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P65, $P66
.annotate 'line', 1337
    push $P1, $P65
.annotate 'line', 1491
    new $P68, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P68.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P67, $P68
.annotate 'line', 1337
    push $P1, $P67
.annotate 'line', 1495
    new $P70, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P70.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P69, $P70
.annotate 'line', 1337
    push $P1, $P69
.annotate 'line', 1499
    new $P72, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P72.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P71, $P72
.annotate 'line', 1337
    push $P1, $P71
.annotate 'line', 1503
    new $P74, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P74.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P73, $P74
.annotate 'line', 1337
    push $P1, $P73
.annotate 'line', 1507
    new $P76, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P76.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P75, $P76
.annotate 'line', 1337
    push $P1, $P75
.annotate 'line', 1514
    new $P78, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P78.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P77, $P78
.annotate 'line', 1337
    push $P1, $P77
.annotate 'line', 1521
    new $P80, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P80.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P79, $P80
.annotate 'line', 1337
    push $P1, $P79
.annotate 'line', 1525
    new $P82, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P82.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P81, $P82
.annotate 'line', 1337
    push $P1, $P81
.annotate 'line', 1529
    new $P84, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P84.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P83, $P84
.annotate 'line', 1337
    push $P1, $P83
.annotate 'line', 1533
    new $P86, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P86.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P85, $P86
.annotate 'line', 1337
    push $P1, $P85
.annotate 'line', 1537
    new $P88, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P88.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P87, $P88
.annotate 'line', 1337
    push $P1, $P87
.annotate 'line', 1541
    new $P90, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P90.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P89, $P90
.annotate 'line', 1337
    push $P1, $P89
.annotate 'line', 1545
    new $P92, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P92.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P91, $P92
.annotate 'line', 1337
    push $P1, $P91
.annotate 'line', 1549
    new $P94, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P94.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P93, $P94
.annotate 'line', 1337
    push $P1, $P93
.annotate 'line', 1553
    new $P96, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P96.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P95, $P96
.annotate 'line', 1337
    push $P1, $P95
.annotate 'line', 1557
    new $P98, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P98.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P97, $P98
.annotate 'line', 1337
    push $P1, $P97
.annotate 'line', 1561
    new $P100, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P100.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P99, $P100
.annotate 'line', 1337
    push $P1, $P99
.annotate 'line', 1565
    new $P102, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P102.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P101, $P102
.annotate 'line', 1337
    push $P1, $P101
.annotate 'line', 1569
    new $P104, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P104.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P103, $P104
.annotate 'line', 1337
    push $P1, $P103
.annotate 'line', 1573
    new $P106, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P106.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'S')
    set $P105, $P106
.annotate 'line', 1337
    push $P1, $P105
.annotate 'line', 1577
    new $P108, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P108.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P107, $P108
.annotate 'line', 1337
    push $P1, $P107
.annotate 'line', 1581
    new $P110, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P110.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P109, $P110
.annotate 'line', 1337
    push $P1, $P109
.annotate 'line', 1585
    new $P112, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P112.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P111, $P112
.annotate 'line', 1337
    push $P1, $P111
.annotate 'line', 1589
    new $P114, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P114.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P113, $P114
.annotate 'line', 1337
    push $P1, $P113
.annotate 'line', 1593
    new $P116, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P116.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P115, $P116
.annotate 'line', 1337
    push $P1, $P115
.annotate 'line', 1597
    new $P118, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P118.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P117, $P118
.annotate 'line', 1337
    push $P1, $P117
.annotate 'line', 1601
    new $P120, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P120.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P119, $P120
.annotate 'line', 1337
    push $P1, $P119
.annotate 'line', 1605
    new $P122, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P122.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P121, $P122
.annotate 'line', 1337
    push $P1, $P121
.annotate 'line', 1612
    new $P124, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P124.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P123, $P124
.annotate 'line', 1337
    push $P1, $P123
.annotate 'line', 1619
    new $P126, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P126.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P125, $P126
.annotate 'line', 1337
    push $P1, $P125
.annotate 'line', 1623
    new $P128, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P128.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P127, $P128
.annotate 'line', 1337
    push $P1, $P127
.annotate 'line', 1627
    new $P130, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P130.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P129, $P130
.annotate 'line', 1337
    push $P1, $P129
.annotate 'line', 1631
    new $P132, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P132.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P131, $P132
.annotate 'line', 1337
    push $P1, $P131
.annotate 'line', 1635
    new $P134, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P134.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'P', 'P', 'P')
    set $P133, $P134
.annotate 'line', 1337
    push $P1, $P133
.annotate 'line', 1639
    new $P136, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1640
    $P136.'PredefFunction'('print', WSubId_31, 'v', '*')
    set $P135, $P136
.annotate 'line', 1337
    push $P1, $P135
.annotate 'line', 1643
    new $P138, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1644
    $P138.'PredefFunction'('say', WSubId_32, 'v', '*')
    set $P137, $P138
.annotate 'line', 1337
    push $P1, $P137
.annotate 'line', 1647
    new $P140, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1648
    $P140.'PredefFunction'('cry', WSubId_33, 'v', '*')
    set $P139, $P140
.annotate 'line', 1337
    push $P1, $P139
.annotate 'line', 1651
    new $P142, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1652
    $P142.'PredefFunction'('invoke', WSubId_34, 'P', '!')
    set $P141, $P142
.annotate 'line', 1337
    push $P1, $P141
  __label_2: # Infinite loop
.annotate 'line', 1657
    .yield($P1)
    goto __label_2
  __label_1: # Infinite loop end
# }
.annotate 'line', 1658

.end # getpredefs


.sub 'findpredef' :subid('WSubId_65')
        .param string __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_35 = "WSubId_35"
# Body
# {
.annotate 'line', 1662
    $P2 = WSubId_35()
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 1663
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1664
# pargs: $I1
    getattribute $P5, $P1, 'nparams'
    set $I1, $P5
.annotate 'line', 1665
    iseq $I2, $I1, __ARG_2
    if $I2 goto __label_6
.annotate 'line', 1666
    iseq $I2, $I1, -1
  __label_6:
    if $I2 goto __label_5
.annotate 'line', 1667
    iseq $I2, $I1, -2
    unless $I2 goto __label_7
    iseq $I2, __ARG_2, 1
  __label_7:
  __label_5:
    unless $I2 goto __label_4
.annotate 'line', 1668
    .return($P1)
  __label_4: # endif
# }
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 1670
    .return($P2)
# }
.annotate 'line', 1671

.end # findpredef


.sub 'optimize_array' :subid('WSubId_38')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1679
    if_null __ARG_1, __label_1
# {
.annotate 'line', 1680
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1681
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1682
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_2: # for iteration
.annotate 'line', 1681
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 1684

.end # optimize_array


.sub 'emit_array' :subid('WSubId_52')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1688
    if_null __ARG_2, __label_1
# {
.annotate 'line', 1689
    iter $P2, __ARG_2
    set $P2, 0
  __label_2: # for iteration
    unless $P2 goto __label_3
    shift $P1, $P2
.annotate 'line', 1690
    $P1.'emit'(__ARG_1)
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
# }
.annotate 'line', 1692

.end # emit_array


.sub 'parseDotted' :subid('WSubId_55')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1696
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1697
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1698
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1699
# predefined push
    push $P1, $P2
  __label_3: # while
.annotate 'line', 1700
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 1701
    $P2 = __ARG_1.'get'()
.annotate 'line', 1702
# predefined push
    push $P1, $P2
# }
    goto __label_3
  __label_2: # endwhile
# }
  __label_1: # endif
.annotate 'line', 1705
    __ARG_1.'unget'($P2)
.annotate 'line', 1706
    .return($P1)
# }
.annotate 'line', 1707

.end # parseDotted


.sub 'parseList' :subid('WSubId_36')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1715
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1716
# var t: $P2
    null $P2
  __label_1: # do
.annotate 'line', 1717
# {
.annotate 'line', 1718
# var value: $P3
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 1719
# predefined push
    push $P1, $P3
# }
  __label_3: # continue
.annotate 'line', 1720
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 1721
    unless_null __ARG_4, __label_4
.annotate 'line', 1722
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 1724
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.annotate 'line', 1725
    WSubId_1("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 1726
    .return($P1)
# }
.annotate 'line', 1727

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_57')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 1732
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1733
    $P2 = $P1.'isidentifier'()
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 1734
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 1735
    .return($P1)
# }
.annotate 'line', 1736

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_56')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1740
    new $P1, ['ResizableStringArray']
.annotate 'line', 1741
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 1742
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1743
    .return($P1)
# }
.annotate 'line', 1744

.end # toIdentifierList

.namespace [ 'Winxed'; 'Compiler'; 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1757
    setattribute self, 'start', __ARG_1
.annotate 'line', 1758
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1759

.end # initbase


.sub 'filename' :method
# Body
# {
.annotate 'line', 1762
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1763
    getattribute $P2, self, 'start'
    .tailcall $P2.'filename'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1765
    .return("unknown")
  __label_2: # endif
# }
.annotate 'line', 1766

.end # filename


.sub 'linenum' :method
# Body
# {
.annotate 'line', 1769
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1770
    getattribute $P2, self, 'start'
    .tailcall $P2.'linenum'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1772
    .return(0)
  __label_2: # endif
# }
.annotate 'line', 1773

.end # linenum


.sub 'viewable' :method
# Body
# {
.annotate 'line', 1776
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1777
    getattribute $P2, self, 'start'
    .tailcall $P2.'viewable'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1779
    .return("")
  __label_2: # endif
# }
.annotate 'line', 1780

.end # viewable


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1783
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1784

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1787
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1788

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 1791
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1792

.end # generatesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1795
    getattribute $P1, self, 'owner'
    $P1.'usesubid'(__ARG_1)
# }
.annotate 'line', 1796

.end # usesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1799
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1800

.end # addlocalfunction


.sub 'findns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1803
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findns'(__ARG_1)
# }
.annotate 'line', 1804

.end # findns


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1807
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1808

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1811
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1812

.end # findclasskey


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1815
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1816

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
.annotate 'line', 1752
    addattribute $P0, 'start'
.annotate 'line', 1753
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 1831
    $P2 = WSubId_36(__ARG_1, __ARG_2, WSubId_37, __ARG_3)
    setattribute self, 'args', $P2
# }
.annotate 'line', 1832

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1836
    getattribute $P1, self, 'args'
# predefined elements
.annotate 'line', 1835
    elements $I1, $P1
.annotate 'line', 1836
    .return($I1)
# }
.annotate 'line', 1837

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1840
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1841
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1842

.end # getarg


.sub 'optimizeargs' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 1846
    getattribute $P1, self, 'args'
    WSubId_38($P1)
# }
.annotate 'line', 1847

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1850
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1851
    getattribute $P3, self, 'args'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 1852
    $P5 = $P2.'emit_get'(__ARG_1)
# predefined push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1853
    .return($P1)
# }
.annotate 'line', 1854

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1857
    $P1 = self.'getargvalues'(__ARG_1)
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1858

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 1827
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 1870
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1873
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1874
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 1875
    .return($I1)
# }
.annotate 'line', 1876

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1879
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1880
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 1881
    WSubId_6('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 1882
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 1883

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1886
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1887
    if_null __ARG_2, __label_1
.annotate 'line', 1888
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 1889

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1892
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 1893
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 1894
    .return(self)
# }
.annotate 'line', 1895

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 1867
    addattribute $P0, 'name'
.annotate 'line', 1868
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_39')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1900
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1901
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1902
    $P1 = __ARG_1.'get'()
.annotate 'line', 1903
# var args: $P2
    null $P2
.annotate 'line', 1904
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 1905
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 1907
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 1908
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1909

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 1918
    $P2 = WSubId_36(__ARG_1, __ARG_2, WSubId_39, ']')
    setattribute self, 'list', $P2
# }
.annotate 'line', 1919

.end # ModifierList


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 1922
    getattribute $P1, self, 'list'
    WSubId_38($P1)
# }
.annotate 'line', 1923

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 1924
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1927
    getattribute $P2, self, 'list'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 1928
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 1929
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 1931
    .return($P2)
# }
.annotate 'line', 1932

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 1914
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getparrotkey' :subid('WSubId_58')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1941
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1942
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 1943

.end # getparrotkey


.sub 'getparrotnamespacekey' :subid('WSubId_107')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1947
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_1
.annotate 'line', 1948
    .return(".namespace [ ]")
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 1950
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1951
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
  __label_2: # endif
# }
.annotate 'line', 1953

.end # getparrotnamespacekey


.sub 'parseUsing' :subid('WSubId_43')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1957
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 1959
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 1961
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 1963
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1960
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 1962
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 1964
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 1966
    __ARG_2.'unget'($P1)
.annotate 'line', 1967
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
# }
.annotate 'line', 1969

.end # parseUsing


.sub 'parseSig' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 1973
# var params: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 1974
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 1975
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 1976
    WSubId_40("'='", $P2)
  __label_1: # endif
.annotate 'line', 1977
# var expr: $P3
    $P3 = WSubId_37(__ARG_2, __ARG_3)
.annotate 'line', 1978
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1979

.end # parseSig


.sub 'parseStatement' :subid('WSubId_93')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_42 = "WSubId_42"
.const 'Sub' WSubId_43 = "WSubId_43"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_46 = "WSubId_46"
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_49 = "WSubId_49"
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1983
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1984
    $P4 = $P1.'isop'(';')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 1985
    new $P5, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P5)
  __label_1: # endif
.annotate 'line', 1986
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 1987
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
.annotate 'line', 1988
    $P4 = $P1.'isop'('${')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 1989
    new $P6, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 1990
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 1991
# var open: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1992
    $P4 = $P2.'isop'('(')
    isfalse $I1, $P4
    unless $I1 goto __label_5
.annotate 'line', 1993
    WSubId_41("':'", $P1)
  __label_5: # endif
.annotate 'line', 1994
    .tailcall WSubId_42($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 1997
    $P4 = $P1.'checkkeyword'()
    set $S1, $P4
    set $S2, 'using'
    if $S1 == $S2 goto __label_8
    set $S2, 'const'
    if $S1 == $S2 goto __label_9
    set $S2, 'volatile'
    if $S1 == $S2 goto __label_10
    set $S2, 'var'
    if $S1 == $S2 goto __label_11
    set $S2, 'string'
    if $S1 == $S2 goto __label_12
    set $S2, 'int'
    if $S1 == $S2 goto __label_13
    set $S2, 'float'
    if $S1 == $S2 goto __label_14
    set $S2, 'return'
    if $S1 == $S2 goto __label_15
    set $S2, 'yield'
    if $S1 == $S2 goto __label_16
    set $S2, 'goto'
    if $S1 == $S2 goto __label_17
    set $S2, 'if'
    if $S1 == $S2 goto __label_18
    set $S2, 'while'
    if $S1 == $S2 goto __label_19
    set $S2, 'do'
    if $S1 == $S2 goto __label_20
    set $S2, 'continue'
    if $S1 == $S2 goto __label_21
    set $S2, 'break'
    if $S1 == $S2 goto __label_22
    set $S2, 'switch'
    if $S1 == $S2 goto __label_23
    set $S2, 'for'
    if $S1 == $S2 goto __label_24
    set $S2, 'throw'
    if $S1 == $S2 goto __label_25
    set $S2, 'try'
    if $S1 == $S2 goto __label_26
    goto __label_7
  __label_8: # case
.annotate 'line', 1999
    .tailcall WSubId_43($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 2001
    .tailcall WSubId_44($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 2004
    .tailcall WSubId_45($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 2007
    .tailcall WSubId_46($P1, __ARG_1, __ARG_2)
  __label_12: # case
.annotate 'line', 2009
    .tailcall WSubId_47($P1, __ARG_1, __ARG_2)
  __label_13: # case
.annotate 'line', 2011
    .tailcall WSubId_48($P1, __ARG_1, __ARG_2)
  __label_14: # case
.annotate 'line', 2013
    .tailcall WSubId_49($P1, __ARG_1, __ARG_2)
  __label_15: # case
.annotate 'line', 2015
    new $P6, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P6.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_16: # case
.annotate 'line', 2017
    new $P8, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P8.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P7, $P8
    .return($P7)
  __label_17: # case
.annotate 'line', 2019
    new $P10, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P10.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P9, $P10
    .return($P9)
  __label_18: # case
.annotate 'line', 2021
    new $P12, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P12.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P11, $P12
    .return($P11)
  __label_19: # case
.annotate 'line', 2023
    new $P14, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P14.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P13, $P14
    .return($P13)
  __label_20: # case
.annotate 'line', 2025
    new $P16, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P16.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P15, $P16
    .return($P15)
  __label_21: # case
.annotate 'line', 2027
    new $P18, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P18.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P17, $P18
    .return($P17)
  __label_22: # case
.annotate 'line', 2029
    new $P20, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P20.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P19, $P20
    .return($P19)
  __label_23: # case
.annotate 'line', 2031
    .tailcall WSubId_50($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 2033
    .tailcall WSubId_51($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 2035
    new $P22, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P22.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P21, $P22
    .return($P21)
  __label_26: # case
.annotate 'line', 2037
    new $P24, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P24.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P23, $P24
    .return($P23)
  __label_7: # default
.annotate 'line', 2039
    $P25 = $P1.'isidentifier'()
    if_null $P25, __label_27
    unless $P25 goto __label_27
# {
.annotate 'line', 2040
# var t2: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 2041
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_28
    unless $P4 goto __label_28
.annotate 'line', 2042
    new $P6, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P6.'LabelStatement'($P1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_28: # endif
.annotate 'line', 2043
    __ARG_1.'unget'($P3)
# }
  __label_27: # endif
.annotate 'line', 2045
    __ARG_1.'unget'($P1)
.annotate 'line', 2046
    new $P5, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
  __label_6: # switch end
.annotate 'line', 2048
    WSubId_6('parseStatement failure', $P1)
# }
.annotate 'line', 2049

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2059
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2060

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2061
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2064
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 2065

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2068
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2069

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 2072
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 2073

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2076
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2077

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2080
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 2081

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2084
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 2085

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2088
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2089

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2092
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2093

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2096
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2097

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2100
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2101

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2104
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 2105

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2108
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 2109

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2112
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
# }
.annotate 'line', 2113

.end # usenamespace


.sub 'getouter' :method
# Body
# {
.annotate 'line', 2120
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 2121

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2124
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2125

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2128
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2129

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2132
    getattribute $P1, self, 'start'
    WSubId_6('**checking**', $P1)
.annotate 'line', 2134
    .return(self)
# }
.annotate 'line', 2135

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2055
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2140
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2143
    WSubId_6('Attempt to annotate empty statement')
# }
.annotate 'line', 2144

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2145
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2138
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2158
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2159
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2160
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2161
# i: $I3
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2162
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2163
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2164
    null $I2
  __label_4: # endif
.annotate 'line', 2165
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2161
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2167
    unless $I2 goto __label_6
.annotate 'line', 2168
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 2170
    .return(self)
  __label_7: # endif
# }
.annotate 'line', 2171

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2154
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2178
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 2179
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2180

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2181
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2184
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2185
    .return(self)
# }
.annotate 'line', 2186

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 2189
    getattribute $P1, self, 'statements'
    WSubId_52(__ARG_1, $P1)
# }
.annotate 'line', 2190

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2174
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'addtomulti' :subid('WSubId_96')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2195
    unless_null __ARG_1, __label_1
.annotate 'line', 2196
    .return(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 2197
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 2198
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_4
  __label_3: # else
.annotate 'line', 2200
    new $P2, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_4: # endif
  __label_2: # endif
# }
.annotate 'line', 2201

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 2209
# var arg: $P1
    null $P1
.annotate 'line', 2210
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2211
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2212
    $P2 = __ARG_1.'get'()
.annotate 'line', 2213
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2214
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2217
    __ARG_1.'unget'($P2)
.annotate 'line', 2218
    $P1 = WSubId_37(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2220
    .return($P1)
# }
.annotate 'line', 2221

.end # parsePiropArg

.namespace [ 'Winxed'; 'Compiler'; 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 2230
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2231
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2232
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2233
    unless $I1 goto __label_1
.annotate 'line', 2234
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2235
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2236
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2237
    $P1 = __ARG_2.'get'()
.annotate 'line', 2238
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2239
    __ARG_2.'unget'($P1)
.annotate 'line', 2240
    $P3 = WSubId_36(__ARG_2, __ARG_3, WSubId_53, '}')
    setattribute self, 'args', $P3
# }
  __label_5: # endif
.annotate 'line', 2242
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 2243

.end # PiropStatement


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 2246
    getattribute $P1, self, 'args'
    WSubId_38($P1)
.annotate 'line', 2247
    .return(self)
# }
.annotate 'line', 2248

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2251
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2252
    self.'annotate'(__ARG_1)
.annotate 'line', 2253
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2254
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2255
    __ARG_1.'print'('    ')
.annotate 'line', 2256
    unless_null $P1, __label_2
.annotate 'line', 2257
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2259
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2260
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2261
    $P4 = $P3.'emit_get'(__ARG_1)
# predefined push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2262
# predefined join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2264

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2223
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2225
    addattribute $P0, 'opname'
.annotate 'line', 2226
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_56 = "WSubId_56"
# Body
# {
.annotate 'line', 2276
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2277
# var path: $P1
    $P1 = WSubId_55(__ARG_2)
.annotate 'line', 2278
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.annotate 'line', 2279
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2280
    WSubId_54(';', __ARG_2)
.annotate 'line', 2281
    $P3 = WSubId_56($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2282
    .return(self)
# }
.annotate 'line', 2283

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2284
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2287
    self.'annotate'(__ARG_1)
.annotate 'line', 2288
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2289

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2271
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2273
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 2301
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2302
# var names: $P1
    null $P3
    $P1 = WSubId_36(__ARG_2, $P3, WSubId_57, ';')
.annotate 'line', 2303
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2304
# id: $S1
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2305
    self.'createvarnamed'($P2, 'P', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2307
    setattribute self, 'names', $P1
# }
.annotate 'line', 2308

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2311
    .return(self)
# }
.annotate 'line', 2312

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2315
    self.'annotate'(__ARG_1)
.annotate 'line', 2316
    getattribute $P3, self, 'names'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 2317
# var v: $P2
    $P2 = self.'getvar'($P1)
.annotate 'line', 2318
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, " = '", $P1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2320

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2296
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2298
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 2334
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2335
# var path: $P1
    $P1 = WSubId_55(__ARG_2)
.annotate 'line', 2336
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.annotate 'line', 2337
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2338
    WSubId_54(';', __ARG_2)
.annotate 'line', 2339
    setattribute self, 'path', $P1
# }
.annotate 'line', 2340

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2343
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2344
# var name: $P2
    $P2 = $P1[-1]
.annotate 'line', 2346
# var symbol: $P3
    $P3 = self.'findsymbol'($P1)
# switch-case
.annotate 'line', 2348
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2362
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2349
# predefined elements
    elements $I2, $P1
    le $I2, 0, __label_5
# {
.annotate 'line', 2350
# var p: $P4
# predefined clone
    clone $P4, $P1
.annotate 'line', 2351
    $P4.'pop'()
.annotate 'line', 2352
# var ns: $P5
    $P5 = self.'findns'($P4)
.annotate 'line', 2353
    if_null $P5, __label_6
# {
.annotate 'line', 2354
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2355
    if_null $P3, __label_7
# {
.annotate 'line', 2356
    self.'createvarused'($P2, $P3)
.annotate 'line', 2357
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
# }
  __label_7: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 2363
# subid: $S1
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2364
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2365
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2366
    self.'usesubid'($S1)
.annotate 'line', 2367
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2369
    self.'createvar'($P2, 'P')
.annotate 'line', 2370
    .return(self)
# }
.annotate 'line', 2371

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 2374
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2375
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2376
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2377
    getattribute $P3, self, 'subid'
    unless_null $P3, __label_1
# {
.annotate 'line', 2378
    self.'annotate'(__ARG_1)
.annotate 'line', 2379
# key: $S2
    null $S2
.annotate 'line', 2380
# predefined elements
    elements $I1, $P1
    le $I1, 1, __label_2
# {
.annotate 'line', 2381
    $P1.'pop'()
.annotate 'line', 2382
    $P3 = WSubId_58($P1)
    set $S2, $P3
# }
  __label_2: # endif
.annotate 'line', 2384
    $P3 = $P2.'getreg'()
    __ARG_1.'emitget_hll_global'($P3, $S1, $S2)
# }
  __label_1: # endif
# }
.annotate 'line', 2386

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2327
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2329
    addattribute $P0, 'path'
.annotate 'line', 2330
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_56 = "WSubId_56"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 2397
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2398
# var nskey: $P1
    $P1 = WSubId_55(__ARG_2)
.annotate 'line', 2399
# nlems: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2400
    ge $I1, 1, __label_1
.annotate 'line', 2401
    WSubId_40('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2402
# var nssym: $P2
    $P3 = WSubId_56($P1)
    $P2 = __ARG_3.'findns'($P3)
.annotate 'line', 2404
    unless_null $P2, __label_2
.annotate 'line', 2405
    WSubId_1('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2406
    __ARG_3.'usenamespace'($P2)
.annotate 'line', 2408
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 2409

.end # UsingNamespaceStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2412
    .return(self)
# }
.annotate 'line', 2413

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2393
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 2428
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2429
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2430
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 2431

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2434
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2435
    .return(self)
# }
.annotate 'line', 2436

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2439
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2440

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 2423
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2425
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarData' ]

.sub 'VarData' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
# Body
# {
.annotate 'line', 2457
    setattribute self, 'type', __ARG_1
.annotate 'line', 2458
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2459
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2460
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
# }
.annotate 'line', 2461

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2464
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2465

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2466
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2467
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2468
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2469
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2470
    .return(0)
# }

.end # isconst


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2471
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2472
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 2449
    addattribute $P0, 'type'
.annotate 'line', 2450
    addattribute $P0, 'reg'
.annotate 'line', 2451
    addattribute $P0, 'scope'
.annotate 'line', 2452
    addattribute $P0, 'flags'
.annotate 'line', 2453
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2480
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2481

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2484
    getattribute $P1, self, 'name'
    WSubId_6('Attempt to use unexpanded constant!!!', $P1)
# }
.annotate 'line', 2485

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 2477
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarData_const' ]

.sub 'VarData_const' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 2494
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
# }
.annotate 'line', 2495

.end # VarData_const


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2496
    .return(1)
# }

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2499
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 2500
    WSubId_6('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2501
    setattribute self, 'value', __ARG_1
# }
.annotate 'line', 2502

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 2488
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2490
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2513
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2514

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2517
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2518
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2519
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2520
    if_null $P2, __label_2
.annotate 'line', 2521
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_1($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2522
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2523
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2524
    $P1[$S1] = $P3
.annotate 'line', 2525
    .return($P3)
# }
.annotate 'line', 2526

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2529
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2530
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2531
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2532
    if_null $P2, __label_2
.annotate 'line', 2533
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2534
    $P1[$S1] = __ARG_2
# }
.annotate 'line', 2535

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2538
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2539
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2540
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2541
    if_null $P2, __label_2
.annotate 'line', 2542
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2543
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2544

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2547
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2548
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2549
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2550
    if_null $P2, __label_2
.annotate 'line', 2551
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2552
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 2553
    $P1[$S1] = $P3
.annotate 'line', 2554
    .return($P3)
# }
.annotate 'line', 2555

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2558
# var locals: $P1
    getattribute $P1, self, 'locals'
# predefined string
.annotate 'line', 2557
    set $S1, __ARG_1
.annotate 'line', 2559
    $P2 = $P1[$S1]
    .return($P2)
# }
.annotate 'line', 2560

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2563
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 2564
    if_null $P1, __label_1
# {
.annotate 'line', 2565
# var sym: $P2
    null $P2
.annotate 'line', 2566
    iter $P4, $P1
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P3, $P4
# {
.annotate 'line', 2567
    $P2 = $P3.'getlocalvar'(__ARG_1)
    if_null $P2, __label_4
.annotate 'line', 2568
    .return($P2)
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
    null $P5
.annotate 'line', 2571
    .return($P5)
# }
.annotate 'line', 2572

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2575
# var sym: $P1
    null $P1
.annotate 'line', 2576
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 2577
    .return($P1)
  __label_1: # endif
.annotate 'line', 2578
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 2579
    .return($P1)
  __label_2: # endif
.annotate 'line', 2580
# var owner: $P2
    getattribute $P2, self, 'owner'
.annotate 'line', 2581
    if_null $P2, __label_3
.annotate 'line', 2582
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 2583
    .return($P3)
# }
.annotate 'line', 2584

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2587
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2588
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2589
    .return($S1)
# }
.annotate 'line', 2590

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2593
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2595
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2596
    .return('__WLEX_self')
# }
.annotate 'line', 2597

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 2508
    addattribute $P0, 'locals'
.annotate 'line', 2509
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 2606
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'Expr' ]

.sub 'Expr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2618
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2619

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2620
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2621
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2622
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2623
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2624
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2625
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2626
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2627
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2628
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2631
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2632

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2636
    .return(self)
# }
.annotate 'line', 2637

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2638
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2641
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2642
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $S2 = self.'tempreg'($S1)
  __label_2:
.annotate 'line', 2643
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2644
    .return($S2)
# }
.annotate 'line', 2645

.end # emit_get


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2648
# reg: $S1
    null $S1
.annotate 'line', 2649
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_1
.annotate 'line', 2650
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2652
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2653
    self.'emit'(__ARG_1, $S1)
# }
  __label_2: # endif
.annotate 'line', 2655
    .return($S1)
# }
.annotate 'line', 2656

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2659
    WSubId_1('Not a left-side expression', self)
# }
.annotate 'line', 2660

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 2614
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2665
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 2663
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 2675
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2676
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2677
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2678
    WSubId_40('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 2679
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2680

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2681
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2684
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2685
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 2686
    .return(self)
# }
.annotate 'line', 2687

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2690
    self.'annotate'(__ARG_1)
.annotate 'line', 2691
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2692
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 2693
# subid: $S1
    $P2 = $P1.'getsubid'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2694
    $P2 = $P1.'needclosure'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 2695
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 2697
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2699

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 2670
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2672
    addattribute $P0, 'fn'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'Condition' ]

.sub 'set' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2714
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2715
    .return(self)
# }
.annotate 'line', 2716

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2719
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2720

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2723
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2724
    .return(self)
# }
.annotate 'line', 2725

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2728
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2729
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
# switch
.annotate 'line', 2730
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 2732
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2733
    ne $I1, 0, __label_5
.annotate 'line', 2734
    .return(2)
    goto __label_6
  __label_5: # else
.annotate 'line', 2736
    .return(1)
  __label_6: # endif
  __label_3: # default
  __label_2: # switch end
# }
  __label_1: # endif
.annotate 'line', 2739
    .return(0)
# }
.annotate 'line', 2740

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2743
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2745
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2746
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2747
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2749
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2750
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'S'
    if $S2 == $S3 goto __label_7
    set $S3, 'P'
    if $S2 == $S3 goto __label_8
    set $S3, 'I'
    if $S2 == $S3 goto __label_9
    set $S3, 'N'
    if $S2 == $S3 goto __label_10
    goto __label_6
  __label_7: # case
  __label_8: # case
.annotate 'line', 2753
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2756
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2759
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2762

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2765
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2767
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2768
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2769
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2771
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2772
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'S'
    if $S2 == $S3 goto __label_7
    set $S3, 'P'
    if $S2 == $S3 goto __label_8
    set $S3, 'I'
    if $S2 == $S3 goto __label_9
    set $S3, 'N'
    if $S2 == $S3 goto __label_10
    goto __label_6
  __label_7: # case
  __label_8: # case
.annotate 'line', 2775
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2778
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2781
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2784

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 2711
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2791
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2792
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 2789
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2802
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2803
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2804

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2805
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2806
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 2809
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2810
# str: $S1
    $P2 = $P1.'getPirString'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2811
    .return($S1)
# }
.annotate 'line', 2812

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 2815
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2816
# str: $S1
    getattribute $P3, $P1, 'str'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2817
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 2818
# var s: $P2
    box $P2, $S1
.annotate 'line', 2819
    $P3 = $P2.'unescape'('utf8')
    set $S1, $P3
# }
  __label_2: # endif
.annotate 'line', 2821
    .return($S1)
# }
.annotate 'line', 2822

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2825
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 2826
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 2827

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2830
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2831

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 2797
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2799
    addattribute $P0, 'strval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3 :optional
        .param int __ARG_4 :opt_flag
# Body
# {
.annotate 'line', 2843
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2844
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2845
# n: $I1
    null $I1
.annotate 'line', 2846
    unless __ARG_4 goto __label_1
.annotate 'line', 2847
    set $I1, __ARG_3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2849
# aux: $S1
    set $P1, __ARG_2
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 2850
    set $I1, $S1
# }
  __label_2: # endif
.annotate 'line', 2852
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2853

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2854
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2855
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 2858
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
# predefined int
.annotate 'line', 2857
    set $I1, $S1
.annotate 'line', 2859
    .return($I1)
# }
.annotate 'line', 2860

.end # getIntegerValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2863
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2864
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2865
    ne $I1, 0, __label_2
.annotate 'line', 2866
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 2868
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2870

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2873
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2874

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 2836
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2838
    addattribute $P0, 'pos'
.annotate 'line', 2839
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2884
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2885
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2886

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2887
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2888
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2891
# aux: $S1
    getattribute $P2, self, 'numval'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2892
# var n: $P1
    new $P1, [ 'Float' ]
.annotate 'line', 2893
    assign $P1, $S1
.annotate 'line', 2894
    .return($P1)
# }
.annotate 'line', 2895

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2898
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2899
# var n: $P1
    $P1 = self.'getFloatValue'()
.annotate 'line', 2900
    __ARG_1.'emitset'(__ARG_2, $P1)
# }
  __label_1: # endif
# }
.annotate 'line', 2902

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2907
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2908
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_2
.annotate 'line', 2909
    concat $S1, $S1, '.0'
  __label_2: # endif
.annotate 'line', 2910
    .return($S1)
# }
.annotate 'line', 2911

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 2879
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2881
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2920
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2923
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2924
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2925

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2928
    getattribute $P1, self, 'name'
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2929

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2932
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2933
    if_null $P1, __label_1
.annotate 'line', 2934
    .tailcall $P1.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 2936
    getattribute $P2, self, 'name'
    set $S1, $P2
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 2939
    .return('P')
  __label_4: # default
.annotate 'line', 2941
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2944

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 2947
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2948
    .return($S1)
# }
.annotate 'line', 2949

.end # getName


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2952
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2953
    unless_null $P1, __label_1
.annotate 'line', 2954
    WSubId_6('Bad thing')
  __label_1: # endif
.annotate 'line', 2955
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2956
# s: $S1
    null $S1
.annotate 'line', 2957
    unless_null $P2, __label_2
# {
.annotate 'line', 2958
# sname: $S2
    set $P3, $P1
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
# switch
.annotate 'line', 2959
    set $S3, $S2
    set $S4, 'self'
    if $S3 == $S4 goto __label_7
    set $S4, 'null'
    if $S3 == $S4 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 2961
    set $S1, 'self'
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 2963
    set $S1, 'null'
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2965
    set $S1, ''
  __label_5: # switch end
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 2969
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 2970
    .return($S1)
# }
.annotate 'line', 2971

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 2974
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 2975
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 2976
    getattribute $P2, self, 'name'
    WSubId_59($P2)
  __label_1: # endif
.annotate 'line', 2977
    .return($P1)
# }
.annotate 'line', 2978

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2981
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2982
# var desc: $P2
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 2983
    if_null $P2, __label_1
# {
.annotate 'line', 2984
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 2985
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 2986
# flags: $I1
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 2987
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 2988
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 2989
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 2996
# var reg: $P3
    $P3 = $P2.'getreg'()
.annotate 'line', 2997
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
# predefined substr
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 2998
# predefined string
    set $S4, $P3
    box $P5, $S4
    setattribute self, 'subid', $P5
  __label_7: # endif
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3002
# var sym: $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    push $P5, $P1
    $P4 = self.'findsymbol'($P5)
.annotate 'line', 3003
    isnull $I2, $P4
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_10:
    unless $I2 goto __label_9
# {
.annotate 'line', 3004
# id: $S1
    $P5 = $P4.'makesubid'()
    null $S1
    if_null $P5, __label_11
    set $S1, $P5
  __label_11:
.annotate 'line', 3005
    box $P5, $S1
    setattribute self, 'subid', $P5
.annotate 'line', 3006
    self.'usesubid'($S1)
.annotate 'line', 3007
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
# }
  __label_9: # endif
# }
  __label_2: # endif
.annotate 'line', 3010
    .return(self)
# }
.annotate 'line', 3011

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3014
# id: $S1
    null $S1
.annotate 'line', 3015
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
.annotate 'line', 3016
    getattribute $P3, self, 'subid'
    set $S1, $P3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3018
    $P4 = self.'getIdentifier'()
    set $S1, $P4
.annotate 'line', 3019
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3020
# flags: $I1
    unless_null $P1, __label_4
    null $I1
    goto __label_3
  __label_4:
    $I1 = $P1.'getflags'()
  __label_3:
.annotate 'line', 3021
    band $I2, $I1, 1
    unless $I2 goto __label_5
# {
.annotate 'line', 3022
    band $I3, $I1, 2
    unless $I3 goto __label_6
# {
.annotate 'line', 3023
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_7
    set $S2, $P2
  __label_7:
.annotate 'line', 3024
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_9
    isne $I2, $S2, ''
  __label_9:
    unless $I2 goto __label_8
.annotate 'line', 3025
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 3029
    .return($S1)
# }
.annotate 'line', 3030

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3033
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3034
    self.'annotate'(__ARG_1)
.annotate 'line', 3035
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3036
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3038

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3041
    self.'annotate'(__ARG_1)
.annotate 'line', 3042
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 3043

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3046
    self.'annotate'(__ARG_1)
.annotate 'line', 3047
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# predefined die
.annotate 'line', 3048
    die "NO"
  __label_1: # endif
.annotate 'line', 3049
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3050
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3051
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 3052
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3055
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3058
    WSubId_1("Can't assign null to that type", self)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3061
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3062
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 3064
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3065
    ne $S3, 'v', __label_13
.annotate 'line', 3066
    WSubId_1("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3067
    ne $S1, $S3, __label_14
# {
.annotate 'line', 3068
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 3071
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3072
    self.'annotate'(__ARG_1)
.annotate 'line', 3073
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3074
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3076
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3079
    .return($S2)
# }
.annotate 'line', 3080

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 2916
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 2918
    addattribute $P0, 'name'
.annotate 'line', 2919
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3090
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3091
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 3092

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3095
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()
# }
.annotate 'line', 3096

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3099
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3100
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3101
# reg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3102
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3103
    .return($S2)
# }
.annotate 'line', 3104

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3107
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3108
    self.'annotate'(__ARG_1)
.annotate 'line', 3109
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3110
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3112

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3115
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3116
# typelex: $S1
    $P2 = $P1.'gettype'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3117
# lreg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
# switch-case
.annotate 'line', 3119
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_5
.annotate 'line', 3122
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 3120
    __ARG_1.'emitnull'($S2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 3123
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 3126
# typeright: $S3
    $P2 = __ARG_2.'checkresult'()
    null $S3
    if_null $P2, __label_7
    set $S3, $P2
  __label_7:
.annotate 'line', 3127
    iseq $I2, $S1, $S3
    if $I2 goto __label_10
    isne $I2, $S1, 'P'
  __label_10:
    unless $I2 goto __label_8
.annotate 'line', 3128
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 3130
# rreg: $S4
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_11
    set $S4, $P3
  __label_11:
.annotate 'line', 3131
    self.'annotate'(__ARG_1)
.annotate 'line', 3132
    __ARG_1.'emitbox'($S2, $S4)
# }
  __label_9: # endif
  __label_3: # switch end
.annotate 'line', 3136
    $P2 = $P1.'getlex'()
    __ARG_1.'emitstore_lex'($P2, $S2)
# }
.annotate 'line', 3137

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3140
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)
# }
.annotate 'line', 3141

.end # emit_store

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3085
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3087
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3150
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3151

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3146
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
.annotate 'line', 3162
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3163
    $P2 = WSubId_60(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 3164

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3165
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3168
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 3171
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 3172
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
  __label_1: # endif
.annotate 'line', 3173
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3174
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 3175
    __ARG_1.'say'()
# }
.annotate 'line', 3176

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3156
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3158
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3186
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3187
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3188

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3191
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3192

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3195
    self.'optimizearg'()
.annotate 'line', 3196
    .return(self)
# }
.annotate 'line', 3197

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3181
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3183
    addattribute $P0, 'subexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]

.sub 'initbinary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3208
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3209
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3210
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3211

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3214
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3215
    .return(self)
# }
.annotate 'line', 3216

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3219
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3220

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3223
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3224
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3225

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3228
    self.'optimizearg'()
.annotate 'line', 3229
    .return(self)
# }
.annotate 'line', 3230

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3233
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3234

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3237
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3238

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3202
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3204
    addattribute $P0, 'lexpr'
.annotate 'line', 3205
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3247
    .return('I')
# }
.annotate 'line', 3248

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3251
    self.'optimizearg'()
.annotate 'line', 3252
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3253
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3254
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3255
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3256
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3257
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3259
    .return(self)
# }
.annotate 'line', 3260

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 3243
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3269
    .return('I')
# }
.annotate 'line', 3270

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 3265
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]

.sub 'OpDeleteExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3278
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3279

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3282
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3283
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3284
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3285
    self.'annotate'(__ARG_1)
.annotate 'line', 3286
    __ARG_1.'print'('    delete ')
.annotate 'line', 3287
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3288
    __ARG_1.'say'()
.annotate 'line', 3289
    set $S1, __ARG_2
    eq $S1, '', __label_4
.annotate 'line', 3290
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 3293
    WSubId_1("delete with invalid operator", self)
  __label_2: # endif
# }
.annotate 'line', 3294

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 3274
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]

.sub 'OpExistsExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3301
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3302

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3305
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3306
# reg: $S1
    set $S2, __ARG_2
    eq $S2, '', __label_2
    set $P2, __ARG_2
    goto __label_1
  __label_2:
    $P2 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
  __label_3:
.annotate 'line', 3307
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3308
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3309
    self.'annotate'(__ARG_1)
.annotate 'line', 3310
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3311
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3312
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3315
    WSubId_1("exists with invalid operator", self)
  __label_5: # endif
# }
.annotate 'line', 3316

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 3297
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]

.sub 'OpUnaryMinusExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3325
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3326

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3329
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3330

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3333
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3334
    .return(self)
# }
.annotate 'line', 3335

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 3338
    self.'optimizearg'()
.annotate 'line', 3339
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isintegerliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3340
# var numval: $P1
    getattribute $P5, self, 'subexpr'
    getattribute $P1, $P5, 'numval'
.annotate 'line', 3341
# i: $I1
    set $P3, $P1
    set $I1, $P3
.annotate 'line', 3342
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'subexpr'
    getattribute $P4, $P5, 'start'
    neg $I2, $I1
    .tailcall WSubId_21($P3, $P4, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3345
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isfloatliteral'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 3346
# var numval: $P2
    getattribute $P5, self, 'subexpr'
    getattribute $P2, $P5, 'numval'
.annotate 'line', 3347
# n: $N1
# predefined string
    set $S1, $P2
    set $N1, $S1
.annotate 'line', 3348
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'subexpr'
    getattribute $P4, $P5, 'start'
    neg $N2, $N1
    .tailcall WSubId_61($P3, $P4, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3351
    .return(self)
# }
.annotate 'line', 3352

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3355
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3356
    self.'annotate'(__ARG_1)
.annotate 'line', 3357
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3358

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 3321
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]

.sub 'OpNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3367
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3368

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3369
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3372
    .return('I')
# }
.annotate 'line', 3373

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3376
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3377
    .return(self)
# }
.annotate 'line', 3378

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3381
    self.'optimizearg'()
.annotate 'line', 3382
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3383
    $P3 = $P1.'isintegerliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3384
# var numval: $P2
    getattribute $P2, $P1, 'numval'
.annotate 'line', 3385
# n: $I1
    set $P3, $P2
    set $I1, $P3
.annotate 'line', 3386
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_21($P3, $P4, $I2)
# }
  __label_1: # endif
.annotate 'line', 3388
    $P3 = $P1.'isnegable'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 3389
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3390
    .return(self)
# }
.annotate 'line', 3391

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3394
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3395

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3398
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3399
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3400
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3401
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3403
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3406
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3409
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3411

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 3363
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3420
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3421

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3424
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3425
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 3426
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 3427

.end # iflexical

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 3416
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3436
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3437
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3438
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3439

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 3432
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]

.sub 'OpPreIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3446
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3447

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3450
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3451
    self.'annotate'(__ARG_1)
.annotate 'line', 3452
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3453
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3454
    .return($S1)
# }
.annotate 'line', 3455

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 3442
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]

.sub 'OpPreDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3462
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3463

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3466
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3467
    self.'annotate'(__ARG_1)
.annotate 'line', 3468
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3469
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3470
    .return($S1)
# }
.annotate 'line', 3471

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 3458
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]

.sub 'OpPostIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3480
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3481

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3484
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3485
    self.'annotate'(__ARG_1)
.annotate 'line', 3486
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3487
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3488
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3489
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3490
    .return($S1)
# }
.annotate 'line', 3491

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 3476
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]

.sub 'OpPostDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3498
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3499

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3502
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3503
    self.'annotate'(__ARG_1)
.annotate 'line', 3504
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3505
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3506
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3507
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3508
    .return($S1)
# }
.annotate 'line', 3509

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 3494
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]

.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3520
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3521
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3522
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3523
    .return(self)
# }
.annotate 'line', 3524

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3527
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3528

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3531
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3532
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3533
    .return(self)
# }
.annotate 'line', 3534

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3537
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3538

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3541
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3542
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3543
    self.'annotate'(__ARG_1)
.annotate 'line', 3544
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 3546

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 3514
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3516
    addattribute $P0, 'lexpr'
.annotate 'line', 3517
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3555
    self.'annotate'(__ARG_1)
.annotate 'line', 3556
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3557
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3558

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 3551
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3567
    self.'annotate'(__ARG_1)
.annotate 'line', 3568
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3569
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 3570
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3571

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3574
    self.'annotate'(__ARG_1)
.annotate 'line', 3575
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3576
# reg2: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3577
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3578
    .return($S1)
# }
.annotate 'line', 3579

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 3563
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3588
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3589
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3590
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3591
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3592
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3593
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 3594
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3596
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 3597
# aux: $S5
    null $S5
.annotate 'line', 3598
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3599
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_10
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 3601
    eq $S2, 'S', __label_13
# {
.annotate 'line', 3602
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3603
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3604
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 3606
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 3610
    eq $S1, $S2, __label_14
# {
.annotate 'line', 3611
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3612
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3613
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 3615
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 3618
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
# }
  __label_5: # endif
.annotate 'line', 3621
    .return($S3)
# }
.annotate 'line', 3622

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 3584
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3631
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3632
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3633
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3634
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3635
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3636
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 3637
# aux: $S5
    null $S5
.annotate 'line', 3638
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3639
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_7
    set $S7, 'I'
    if $S6 == $S7 goto __label_8
    set $S7, 'N'
    if $S6 == $S7 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 3641
    WSubId_1("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 3644
    eq $S1, $S2, __label_10
# {
.annotate 'line', 3645
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3646
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3647
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 3649
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3652
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 3654
    .return($S3)
# }
.annotate 'line', 3655

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 3627
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3664
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3665
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3666
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3667
# rreg: $S4
    null $S4
# switch
.annotate 'line', 3668
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 3670
    ne $S2, 'I', __label_7
.annotate 'line', 3671
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3673
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3674
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
  __label_8: # endif
.annotate 'line', 3676
    self.'annotate'(__ARG_1)
.annotate 'line', 3677
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3680
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3681
    self.'annotate'(__ARG_1)
.annotate 'line', 3682
    __ARG_1.'emitarg2'('mul', $S3, $S4)
  __label_4: # switch end
.annotate 'line', 3684
    .return($S3)
# }
.annotate 'line', 3685

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 3660
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3694
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3695
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3696
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3697
    self.'annotate'(__ARG_1)
.annotate 'line', 3698
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3699
    .return($S2)
# }
.annotate 'line', 3700

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 3690
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3709
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3710
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3711
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3712
    self.'annotate'(__ARG_1)
.annotate 'line', 3713
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3714
    .return($S2)
# }
.annotate 'line', 3715

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 3705
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3722
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3725
    self.'optimizearg'()
.annotate 'line', 3726
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3727
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3728
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3729
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3730
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3731
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3733
    .return(self)
# }
.annotate 'line', 3734

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3737
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3738
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3739
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3740
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 3741
    self.'annotate'(__ARG_1)
.annotate 'line', 3742
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 3744
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 3749
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 3754
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 3759
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 3764
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 3769
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 3745
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3746
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3747
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 3750
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 3751
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3752
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 3755
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 3756
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3757
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 3760
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 3761
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3762
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 3765
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 3766
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3767
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 3770
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 3771
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3772
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 3773
# switch
.annotate 'line', 3776
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_21
    set $I2, 1
    if $I1 == $I2 goto __label_22
    set $I2, 2
    if $I1 == $I2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 3778
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 3781
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 3784
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 3785
# }
.annotate 'line', 3787

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3790
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3791

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3794
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3795

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3798
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3799

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 3720
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 3814
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3815
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3816
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3817

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3818
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3819
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3822
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3823
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3824
    .return(self)
# }
.annotate 'line', 3825

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3828
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3829
    self.'annotate'(__ARG_1)
.annotate 'line', 3830
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3831
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 3832
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 3833

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3836
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3837
    self.'annotate'(__ARG_1)
.annotate 'line', 3838
    getattribute $P1, self, 'checknull'
    if_null $P1, __label_3
    unless $P1 goto __label_3
    set $S2, 'unless'
    goto __label_2
  __label_3:
    set $S2, 'if'
  __label_2:
    __ARG_1.'say'('    ', $S2, '_null ', $S1, ', ', __ARG_2)
# }
.annotate 'line', 3839

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 3807
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3809
    addattribute $P0, 'expr'
.annotate 'line', 3810
    addattribute $P0, 'checknull'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3846
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3849
    new $P1, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3850

.end # negated


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3853
    self.'optimizearg'()
.annotate 'line', 3854
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3855
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3856
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3857
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3858
    unless $I1 goto __label_1
# {
.annotate 'line', 3859
    unless $I2 goto __label_2
.annotate 'line', 3860
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 1)
    goto __label_3
  __label_2: # else
.annotate 'line', 3862
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3864
    unless $I2 goto __label_4
.annotate 'line', 3865
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 1)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 3866
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3867
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3868
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3869
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3870
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3872
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3873
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3874
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I5)
  __label_13: # case
.annotate 'line', 3876
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 3877
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 3878
    getattribute $P11, self, 'owner'
    getattribute $P12, self, 'start'
    iseq $I6, $S3, $S4
    .tailcall WSubId_21($P11, $P12, $I6)
  __label_11: # default
  __label_10: # switch end
# }
  __label_9: # endif
# }
  __label_5: # endif
.annotate 'line', 3882
    .return(self)
# }
.annotate 'line', 3883

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3886
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3887

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3890
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3891

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3894
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3895

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3898
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3899

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 3844
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3906
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3909
    new $P1, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3910

.end # negated


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3913
    self.'optimizearg'()
.annotate 'line', 3914
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3915
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3916
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3917
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3918
    unless $I1 goto __label_1
# {
.annotate 'line', 3919
    unless $I2 goto __label_2
.annotate 'line', 3920
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 3922
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 0)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3924
    unless $I2 goto __label_4
.annotate 'line', 3925
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 0)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 3926
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3927
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3928
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3929
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3930
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3932
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3933
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3934
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    isne $I5, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I5)
  __label_13: # case
.annotate 'line', 3936
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 3937
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 3938
    getattribute $P11, self, 'owner'
    getattribute $P12, self, 'start'
    isne $I6, $S3, $S4
    .tailcall WSubId_21($P11, $P12, $I6)
  __label_11: # default
  __label_10: # switch end
# }
  __label_9: # endif
# }
  __label_5: # endif
.annotate 'line', 3942
    .return(self)
# }
.annotate 'line', 3943

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3946
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3947

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3950
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3951

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3954
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3955

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3958
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3959

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
.annotate 'line', 3904
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]

.sub 'OpSameExpr' :method
        .param int __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 3969
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3970
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 3971

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3972
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3975
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3976
    new $P2, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    not $I2, $I1
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    getattribute $P5, self, 'lexpr'
    getattribute $P6, self, 'rexpr'
    $P2.'OpSameExpr'($I2, $P3, $P4, $P5, $P6)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 3977

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3980
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    iseq $I1, __ARG_1, __ARG_2
    goto __label_1
  __label_2:
    isne $I1, __ARG_1, __ARG_2
  __label_1:
    .return($I1)
# }
.annotate 'line', 3981

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3984
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3985
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 3986
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3987

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3990
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3991

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3994
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3995
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 3996
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3997

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4000
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4001
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 4002
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4003

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 3964
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 3966
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4010
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4013
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4014

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4017
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4018

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4021
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4022

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4025
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4026

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4029
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4030

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 4008
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4037
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4040
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4041

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4044
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4045

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4048
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4049

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4052
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4053

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4056
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4057

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 4035
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4064
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4067
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4068

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4071
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4072

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4075
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4076

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4079
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4080

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4083
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4084

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 4062
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4091
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4094
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4095

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4098
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4099

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4102
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4103

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4106
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4107

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4110
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4111

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 4089
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4120
    .return('I')
# }
.annotate 'line', 4121

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 4116
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]

.sub 'OpBoolAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4130
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4131

.end # OpBoolAndExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4134
    self.'optimizearg'()
.annotate 'line', 4135
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 4136
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4137
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4138
    eq $I1, 0, __label_2
.annotate 'line', 4139
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4141
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4143
    .return(self)
# }
.annotate 'line', 4144

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4147
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4148
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_6
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 4149
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 4150
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 4151
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4154
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_9
    set $S4, $P1
  __label_9:
.annotate 'line', 4155
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4156
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4157
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4158
    __ARG_1.'emitlabel'($S4)
# }
  __label_5: # endif
# }
.annotate 'line', 4160

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 4126
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]

.sub 'OpBoolOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4169
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4170

.end # OpBoolOrExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4173
    self.'optimizearg'()
.annotate 'line', 4174
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 4175
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4176
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4177
    ne $I1, 0, __label_2
.annotate 'line', 4178
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4180
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4182
    .return(self)
# }
.annotate 'line', 4183

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4186
# res: $S1
    null $S1
.annotate 'line', 4187
    if_null __ARG_2, __label_1
.annotate 'line', 4188
    set $S1, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 4190
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 4191
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4192
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4193
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 4194
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 4197
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4198
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4199
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4200
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4201
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4203

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 4165
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 4208
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]

.sub 'OpBinAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4218
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4219

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4222
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4223
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4224
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4225
    self.'annotate'(__ARG_1)
.annotate 'line', 4226
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4227

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4230
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4231

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 4214
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]

.sub 'OpBinOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4240
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4241

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4244
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4245
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4246
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4247
    self.'annotate'(__ARG_1)
.annotate 'line', 4248
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4249

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4252
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4253

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 4236
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]

.sub 'OpBinXorExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4262
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4263

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4266
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4267
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4268
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4269
    self.'annotate'(__ARG_1)
.annotate 'line', 4270
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4271

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4274
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4275

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 4258
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConcatString' ]

.sub 'ConcatString' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4285
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4287
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4294
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4288
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4289
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4290
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_6
  __label_5: # else
.annotate 'line', 4292
    getattribute $P5, self, 'values'
# predefined push
    push $P5, __ARG_4
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4295
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4296
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4299
    root_new $P10, ['parrot';'ResizablePMCArray']
    push $P10, __ARG_3
    push $P10, __ARG_4
    setattribute self, 'values', $P10
  __label_1: # switch end
# }
.annotate 'line', 4301

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4302
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4305
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4306
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4307
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4308
# i: $I2
    null $I2
# for loop
.annotate 'line', 4309
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4310
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4309
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4311
    .return($P2)
# }
.annotate 'line', 4312

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4315
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4316
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4317
# auxreg: $S1
    set $S1, '$S0'
.annotate 'line', 4318
    self.'annotate'(__ARG_1)
.annotate 'line', 4319
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4320
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4321
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_1: # for iteration
.annotate 'line', 4320
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4322
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4323

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4326
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4327
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4328
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4329
    self.'annotate'(__ARG_1)
.annotate 'line', 4330
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4331
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4332
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4331
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4333
    .return($S1)
# }
.annotate 'line', 4334

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4337
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4338
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4339
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4340
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4341
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4340
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4342

.end # emit_concat_to


.sub 'emit_concat_set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4345
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4346
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4347
    self.'annotate'(__ARG_1)
.annotate 'line', 4348
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4349
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4350
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4349
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4351

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 4280
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4282
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]

.sub 'OpAddExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4360
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4361

.end # OpAddExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 4364
    self.'optimizearg'()
.annotate 'line', 4365
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4366
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4367
# ltype: $S1
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
  __label_1:
.annotate 'line', 4368
# rtype: $S2
    $P10 = $P2.'checkresult'()
    null $S2
    if_null $P10, __label_2
    set $S2, $P10
  __label_2:
.annotate 'line', 4369
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4370
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'S'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4375
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4376
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4377
# var t: $P5
    isa $I3, $P3, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    unless $I3 goto __label_9
.annotate 'line', 4378
    isa $I3, $P4, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 4380
    new $P10, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P11, $P3, 'file'
    getattribute $P12, $P3, 'line'
# predefined string
.annotate 'line', 4381
    getattribute $P13, $P3, 'str'
.annotate 'line', 4377
    set $S3, $P13
# predefined string
.annotate 'line', 4381
    getattribute $P14, $P4, 'str'
.annotate 'line', 4377
    set $S4, $P14
.annotate 'line', 4381
    concat $S5, $S3, $S4
    $P10.'TokenSingleQuoted'($P11, $P12, $S5)
    set $P5, $P10
    goto __label_7
  __label_8:
.annotate 'line', 4383
    new $P15, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P16, $P3, 'file'
    getattribute $P17, $P3, 'line'
# predefined string
.annotate 'line', 4384
    $P18 = $P3.'getasquoted'()
.annotate 'line', 4377
    set $S6, $P18
# predefined string
.annotate 'line', 4384
    $P19 = $P4.'getasquoted'()
.annotate 'line', 4377
    set $S7, $P19
.annotate 'line', 4384
    concat $S8, $S6, $S7
    $P15.'TokenQuoted'($P16, $P17, $S8)
    set $P5, $P15
  __label_7:
.annotate 'line', 4385
    new $P11, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P12, self, 'owner'
    $P11.'StringLiteral'($P12, $P5)
    set $P10, $P11
    .return($P10)
# }
  __label_5: # endif
.annotate 'line', 4387
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'I'
  __label_11:
    unless $I3 goto __label_10
# {
.annotate 'line', 4388
# var lval: $P6
    getattribute $P6, $P1, 'numval'
.annotate 'line', 4389
# ln: $I1
    set $P10, $P6
    set $I1, $P10
.annotate 'line', 4390
# var rval: $P7
    getattribute $P7, $P2, 'numval'
.annotate 'line', 4391
# rn: $I2
    set $P10, $P7
    set $I2, $P10
.annotate 'line', 4392
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_21($P10, $P11, $I3)
# }
  __label_10: # endif
# {
.annotate 'line', 4395
    $P10 = WSubId_62($S1, $S2)
    if_null $P10, __label_12
    unless $P10 goto __label_12
# {
.annotate 'line', 4396
# var lvalf: $P8
    getattribute $P8, $P1, 'numval'
.annotate 'line', 4397
# lf: $N1
# predefined string
    set $S3, $P8
    set $N1, $S3
.annotate 'line', 4398
# var rvalf: $P9
    getattribute $P9, $P2, 'numval'
.annotate 'line', 4399
# rf: $N2
# predefined string
    set $S3, $P9
    set $N2, $S3
.annotate 'line', 4400
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_61($P10, $P11, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4404
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_14
    iseq $I3, $S2, 'S'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 4405
    new $P11, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P12, self, 'owner'
    getattribute $P13, self, 'start'
    $P11.'ConcatString'($P12, $P13, $P1, $P2)
    set $P10, $P11
    .return($P10)
# }
  __label_13: # endif
.annotate 'line', 4407
    .return(self)
# }
.annotate 'line', 4408

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 4411
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4412
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4413
    ne $S1, $S2, __label_3
.annotate 'line', 4414
    .return($S1)
  __label_3: # endif
.annotate 'line', 4415
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4416
    .return('S')
  __label_4: # endif
.annotate 'line', 4417
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4418
    .return('S')
  __label_6: # endif
.annotate 'line', 4419
    $P1 = WSubId_62($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 4420
    .return('N')
  __label_8: # endif
.annotate 'line', 4421
    .return('I')
# }
.annotate 'line', 4422

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4425
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4426
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4427
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4428
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4429
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4431
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4432
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4433
    ne $S1, 'S', __label_6
# {
.annotate 'line', 4434
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 4435
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 4436
    eq $S2, 'S', __label_11
# {
.annotate 'line', 4437
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4438
    set $S4, $S6
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 4441
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4442
    set $S5, $S6
# }
  __label_12: # endif
# }
  __label_8: # endif
.annotate 'line', 4445
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 4448
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 4449
# l: $S7
    null $S7
.annotate 'line', 4450
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4452
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4453
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_18: # endif
.annotate 'line', 4455
# r: $S8
    null $S8
.annotate 'line', 4456
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 4458
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4459
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_20: # endif
.annotate 'line', 4461
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 4464
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 4466

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 4356
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]

.sub 'OpSubExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4475
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4476

.end # OpSubExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4479
    self.'optimizearg'()
.annotate 'line', 4480
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4481
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4482
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4483
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4484
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4485
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4486
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4487
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4488
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4489
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4490
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_21($P5, $P6, $I3)
# }
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 4493
    .return(self)
# }
.annotate 'line', 4494

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4497
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4498
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4499
    ne $S1, $S2, __label_3
.annotate 'line', 4500
    .return($S1)
  __label_3: # endif
.annotate 'line', 4501
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'N'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4502
    .return('N')
  __label_4: # endif
.annotate 'line', 4503
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4504
    .return('N')
  __label_6: # endif
.annotate 'line', 4505
    .return('I')
# }
.annotate 'line', 4506

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4509
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4510
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4511
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4512

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 4471
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]

.sub 'OpMulExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4521
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4522

.end # OpMulExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 4525
    self.'optimizearg'()
.annotate 'line', 4526
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4527
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4528
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4529
# ltype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 4530
# rtype: $S2
    $P7 = $P2.'checkresult'()
    null $S2
    if_null $P7, __label_4
    set $S2, $P7
  __label_4:
.annotate 'line', 4531
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4532
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4533
# ln: $I1
    set $P7, $P3
    set $I1, $P7
.annotate 'line', 4534
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4535
# rn: $I2
    set $P7, $P4
    set $I2, $P7
.annotate 'line', 4536
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_21($P7, $P8, $I3)
# }
  __label_5: # endif
# {
.annotate 'line', 4539
    $P7 = WSubId_62($S1, $S2)
    if_null $P7, __label_7
    unless $P7 goto __label_7
# {
.annotate 'line', 4540
# var lvalf: $P5
    getattribute $P5, $P1, 'numval'
.annotate 'line', 4541
# lf: $N1
# predefined string
    set $S3, $P5
    set $N1, $S3
.annotate 'line', 4542
# var rvalf: $P6
    getattribute $P6, $P2, 'numval'
.annotate 'line', 4543
# rf: $N2
# predefined string
    set $S3, $P6
    set $N2, $S3
.annotate 'line', 4544
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_61($P7, $P8, $N3)
# }
  __label_7: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 4548
    .return(self)
# }
.annotate 'line', 4549

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4552
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4553
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4554
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4555
    ne $S1, $S2, __label_3
.annotate 'line', 4556
    .return($S1)
  __label_3: # endif
.annotate 'line', 4557
    ne $S1, 'S', __label_4
.annotate 'line', 4558
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 4560
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 4561

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4564
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4565
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4566
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4567
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4568
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4569
    ne $S1, 'S', __label_3
# {
.annotate 'line', 4570
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4571
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4572
# rval: $S5
    null $S5
# switch
.annotate 'line', 4573
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 4575
    set $S5, $S4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 4578
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4579
    __ARG_1.'emitset'($S5, $S4)
  __label_4: # switch end
.annotate 'line', 4581
    self.'annotate'(__ARG_1)
.annotate 'line', 4582
    __ARG_1.'emitrepeat'(__ARG_2, $S3, $S5)
.annotate 'line', 4583
    .return()
# }
  __label_3: # endif
.annotate 'line', 4585
    iseq $I3, $S1, $S2
    unless $I3 goto __label_8
    iseq $I3, $S1, 'I'
    if $I3 goto __label_10
    iseq $I3, $S1, 'N'
  __label_10:
    if $I3 goto __label_9
    iseq $I3, $S1, 'P'
  __label_9:
  __label_8:
    unless $I3 goto __label_7
# {
.annotate 'line', 4586
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4587
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4588
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4589
    .return()
# }
  __label_7: # endif
.annotate 'line', 4594
    ne $S1, 'N', __label_11
# {
.annotate 'line', 4595
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4596
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4597
# rval: $S6
    null $S6
# switch
.annotate 'line', 4598
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_14
    set $S8, 'N'
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 4600
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4601
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4602
    set $S6, $S4
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4605
    set $S6, $S4
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 4608
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4609
    __ARG_1.'emitset'($S6, $S4)
  __label_12: # switch end
.annotate 'line', 4611
    set $S7, __ARG_2
    eq $S7, '', __label_16
# {
.annotate 'line', 4612
    self.'annotate'(__ARG_1)
.annotate 'line', 4613
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
  __label_16: # endif
.annotate 'line', 4615
    .return()
# }
  __label_11: # endif
.annotate 'line', 4618
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4619
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_19
    $I3 = $P1.'isidentifier'()
  __label_19:
    unless $I3 goto __label_17
# {
.annotate 'line', 4620
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4621
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4624
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4625
    set $S3, $I1
# }
  __label_18: # endif
.annotate 'line', 4627
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_22
    $I3 = $P2.'isidentifier'()
  __label_22:
    unless $I3 goto __label_20
# {
.annotate 'line', 4628
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4629
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_21
  __label_20: # else
# {
# switch
.annotate 'line', 4632
    set $S7, $S2
    set $S8, 'S'
    if $S7 == $S8 goto __label_25
    set $S8, 'N'
    if $S7 == $S8 goto __label_26
    set $S8, 'I'
    if $S7 == $S8 goto __label_27
    goto __label_24
  __label_25: # case
.annotate 'line', 4634
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4635
    $P2.'emit'(__ARG_1, $S4)
    goto __label_23 # break
  __label_26: # case
.annotate 'line', 4638
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_23 # break
  __label_27: # case
  __label_24: # default
.annotate 'line', 4642
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4643
    set $S4, $I2
    goto __label_23 # break
  __label_23: # switch end
.annotate 'line', 4644
# }
  __label_21: # endif
.annotate 'line', 4647
    self.'annotate'(__ARG_1)
.annotate 'line', 4648
    set $S7, __ARG_2
    ne $S7, '', __label_28
.annotate 'line', 4649
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_28: # endif
.annotate 'line', 4650
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4651

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 4517
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]

.sub 'OpDivExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4660
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4661

.end # OpDivExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 4664
    self.'optimizearg'()
.annotate 'line', 4665
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4666
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4667
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4668
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4669
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4670
# var lval: $P3
    null $P3
.annotate 'line', 4671
# var rval: $P4
    null $P4
.annotate 'line', 4672
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4673
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4674
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4675
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4676
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4677
    eq $I2, 0, __label_7
.annotate 'line', 4678
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    set $N4, $I1
    set $N5, $I2
    div $N3, $N4, $N5
    .tailcall WSubId_21($P5, $P6, $N3)
  __label_7: # endif
# }
  __label_5: # endif
# {
.annotate 'line', 4681
    $P5 = WSubId_62($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 4682
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4683
# lf: $N1
# predefined string
    set $S3, $P3
    set $N1, $S3
.annotate 'line', 4684
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4685
# rf: $N2
# predefined string
    set $S3, $P4
    set $N2, $S3
.annotate 'line', 4686
    set $N3, 0
    eq $N2, $N3, __label_9
.annotate 'line', 4687
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    div $N4, $N1, $N2
    .tailcall WSubId_61($P5, $P6, $N4)
  __label_9: # endif
# }
  __label_8: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 4691
    .return(self)
# }
.annotate 'line', 4692

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4695
    .return('N')
# }
.annotate 'line', 4696

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4699
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4700
# var aux: $P2
    null $P2
.annotate 'line', 4701
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4702
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4703
    $P2 = self.'tempreg'('N')
.annotate 'line', 4704
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4705
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 4707
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4708
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4709
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 4710
    $P2 = self.'tempreg'('N')
.annotate 'line', 4711
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4712
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 4714
    self.'annotate'(__ARG_1)
.annotate 'line', 4715
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4716

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 4656
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModExpr' ]

.sub 'OpModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4725
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4726

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4729
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4730
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4731
    self.'annotate'(__ARG_1)
.annotate 'line', 4732
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4733

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4736
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4737

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 4721
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]

.sub 'OpCModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4746
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4747

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4750
    .return('I')
# }
.annotate 'line', 4751

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4754
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4755
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4756
    self.'annotate'(__ARG_1)
.annotate 'line', 4761
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4762

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 4742
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]

.sub 'OpShiftleftExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4771
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4772

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4775
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4776
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4777
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4778
    self.'annotate'(__ARG_1)
.annotate 'line', 4779
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4780

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4783
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4784

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 4767
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]

.sub 'OpShiftrightExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4793
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4794

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4797
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4798
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4799
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4800
    self.'annotate'(__ARG_1)
.annotate 'line', 4801
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4802

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4805
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4806

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 4789
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4815
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4816

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 4819
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 4820
# setname: $S1
    set $S1, ''
.annotate 'line', 4821
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 4822
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 4824
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 4827
    set $I2, 1
# switch
.annotate 'line', 4828
    $P6 = $P1.'numargs'()
    set $I3, $P6
    null $I4
    if $I3 == $I4 goto __label_9
    set $I4, 1
    if $I3 == $I4 goto __label_10
    goto __label_8
  __label_9: # case
    goto __label_7 # break
  __label_10: # case
.annotate 'line', 4832
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 4833
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 4834
    WSubId_1('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 4835
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 4838
    WSubId_1('Invalid modifier', self)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 4843
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 4846
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 4849
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 4844
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4847
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 4850
    __ARG_1.'print'(' :named')
.annotate 'line', 4851
    eq $S1, '', __label_17
.annotate 'line', 4852
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 4853
# }
.annotate 'line', 4855

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 4811
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4864
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4865
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4866

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4869
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4870
    .return(self)
# }
.annotate 'line', 4871

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4874
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4875

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 4860
    addattribute $P0, 'arg'
.annotate 'line', 4861
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseArgument' :subid('WSubId_63')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 4880
# var modifier: $P1
    null $P1
.annotate 'line', 4881
# var expr: $P2
    $P2 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 4882
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 4883
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 4884
    $P3 = __ARG_1.'get'()
.annotate 'line', 4885
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 4886
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 4889
    WSubId_40('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 4892
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 4893
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 4894

.end # parseArgument

.namespace [ 'Winxed'; 'Compiler'; 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
.annotate 'line', 4905
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4906
    setattribute self, 'start', __ARG_2
.annotate 'line', 4907
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 4908
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 4909
    __ARG_3.'unget'($P1)
.annotate 'line', 4910
    $P3 = WSubId_36(__ARG_3, __ARG_1, WSubId_63, __ARG_4)
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 4912

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 4915
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4916
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
.annotate 'line', 4914
    elements $I1, $P1
  __label_1:
.annotate 'line', 4916
    .return($I1)
# }
.annotate 'line', 4917

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 4920
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4921

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4924
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4925
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4926

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4929
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4930
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 4931

.end # getfreearg


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 4934
    getattribute $P1, self, 'args'
    WSubId_38($P1)
.annotate 'line', 4935
    .return(self)
# }
.annotate 'line', 4936

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4939
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 4940
    unless_null $P1, __label_1
# {
.annotate 'line', 4941
    new $P2, ['ResizableStringArray']
.annotate 'line', 4942
# pnull: $S1
    set $S1, ''
.annotate 'line', 4943
# var args: $P3
    getattribute $P3, self, 'args'
.annotate 'line', 4944
    if_null $P3, __label_2
# {
.annotate 'line', 4945
    iter $P6, $P3
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P4, $P6
# {
.annotate 'line', 4946
# var arg: $P5
    getattribute $P5, $P4, 'arg'
.annotate 'line', 4947
# reg: $S2
    null $S2
.annotate 'line', 4948
    $P7 = $P5.'isnull'()
    if_null $P7, __label_5
    unless $P7 goto __label_5
# {
.annotate 'line', 4949
    ne $S1, '', __label_7
# {
.annotate 'line', 4950
    getattribute $P9, self, 'owner'
    $P8 = $P9.'tempreg'('P')
    set $S1, $P8
.annotate 'line', 4951
    __ARG_1.'emitnull'($S1)
# }
  __label_7: # endif
.annotate 'line', 4953
    set $S2, $S1
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 4956
    $P7 = $P5.'emit_get'(__ARG_1)
    set $S2, $P7
  __label_6: # endif
.annotate 'line', 4957
# predefined push
    push $P2, $S2
# }
    goto __label_3
  __label_4: # endfor
# }
  __label_2: # endif
.annotate 'line', 4960
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 4962
    .return($P1)
# }
.annotate 'line', 4963

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4966
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4967
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4969
# sep: $S1
    set $S1, ''
.annotate 'line', 4970
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 4971
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 4972
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 4973
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 4974
    if_null $P3, __label_4
.annotate 'line', 4975
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 4976
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 4971
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4978

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 4898
    addattribute $P0, 'owner'
.annotate 'line', 4899
    addattribute $P0, 'start'
.annotate 'line', 4900
    addattribute $P0, 'args'
.annotate 'line', 4901
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_64')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4983
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 4984
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 4985
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 4986
    .return(1)
# }
.annotate 'line', 4987

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4998
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4999
    setattribute self, 'predef', __ARG_3
.annotate 'line', 5000
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 5001

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5004
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 5005

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5008
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 5009
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5010
    new $P3, ['ResizableStringArray']
.annotate 'line', 5011
# var arg: $P4
    null $P4
.annotate 'line', 5012
# pnull: $S1
    set $S1, ''
# switch
.annotate 'line', 5013
    $P6 = $P1.'params'()
    set $I3, $P6
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5015
    iter $P7, $P2
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P4, $P7
# {
.annotate 'line', 5016
# reg: $S2
    getattribute $P9, $P4, 'arg'
    $P8 = $P9.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_7
    set $S2, $P8
  __label_7:
.annotate 'line', 5018
    ne $S2, 'null', __label_8
# {
.annotate 'line', 5019
    ne $S1, '', __label_9
# {
.annotate 'line', 5020
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 5021
    __ARG_1.'emitnull'($S1)
# }
  __label_9: # endif
.annotate 'line', 5023
    set $S2, $S1
# }
  __label_8: # endif
.annotate 'line', 5025
# predefined push
    push $P3, $S2
# }
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 5029
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 5030
    iter $P10, $P2
    set $P10, 0
  __label_10: # for iteration
    unless $P10 goto __label_11
    shift $P4, $P10
.annotate 'line', 5031
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_10
  __label_11: # endfor
.annotate 'line', 5032
    getattribute $P9, self, 'predef'
    getattribute $P11, self, 'start'
    $P9.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 5033
    .return()
  __label_2: # default
.annotate 'line', 5035
# n: $I1
    getattribute $P12, self, 'args'
    set $I1, $P12
# for loop
.annotate 'line', 5036
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 5037
    $P13 = $P2[$I2]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 5038
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_15
    set $S3, $P6
  __label_15:
.annotate 'line', 5039
# paramtype: $S4
    $P6 = $P1.'paramtype'($I2)
    null $S4
    if_null $P6, __label_16
    set $S4, $P6
  __label_16:
.annotate 'line', 5040
# argr: $S5
    null $S5
.annotate 'line', 5041
    $P6 = $P4.'isnull'()
    if_null $P6, __label_17
    unless $P6 goto __label_17
# {
# switch
.annotate 'line', 5042
    set $S7, $S4
    set $S8, 'I'
    if $S7 == $S8 goto __label_21
    set $S8, 'N'
    if $S7 == $S8 goto __label_22
    set $S8, 'S'
    if $S7 == $S8 goto __label_23
    goto __label_20
  __label_21: # case
  __label_22: # case
  __label_23: # case
.annotate 'line', 5046
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 5047
    __ARG_1.'emitnull'($S5)
    goto __label_19 # break
  __label_20: # default
.annotate 'line', 5050
    ne $S1, '', __label_24
# {
.annotate 'line', 5051
    $P9 = self.'tempreg'('P')
    set $S1, $P9
.annotate 'line', 5052
    __ARG_1.'emitnull'($S1)
# }
  __label_24: # endif
.annotate 'line', 5054
    set $S5, $S1
  __label_19: # switch end
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 5058
    iseq $I3, $S3, $S4
    if $I3 goto __label_27
    iseq $I3, $S4, '?'
  __label_27:
    unless $I3 goto __label_25
.annotate 'line', 5059
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 5061
# aux: $S6
    null $S6
.annotate 'line', 5062
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
# switch
.annotate 'line', 5063
    set $S7, $S4
    set $S8, 'P'
    if $S7 == $S8 goto __label_30
    set $S8, 'I'
    if $S7 == $S8 goto __label_31
    set $S8, 'N'
    if $S7 == $S8 goto __label_32
    set $S8, 'S'
    if $S7 == $S8 goto __label_33
    goto __label_29
  __label_30: # case
# switch
.annotate 'line', 5065
    set $S9, $S3
    set $S10, 'I'
    if $S9 == $S10 goto __label_36
    set $S10, 'N'
    if $S9 == $S10 goto __label_37
    set $S10, 'S'
    if $S9 == $S10 goto __label_38
    goto __label_35
  __label_36: # case
  __label_37: # case
  __label_38: # case
.annotate 'line', 5069
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 5070
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_34 # break
  __label_35: # default
.annotate 'line', 5073
    $P4.'emit'(__ARG_1, $S5)
  __label_34: # switch end
    goto __label_28 # break
  __label_31: # case
  __label_32: # case
  __label_33: # case
.annotate 'line', 5079
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 5080
    __ARG_1.'emitset'($S5, $S6)
    goto __label_28 # break
  __label_29: # default
.annotate 'line', 5083
    $P4.'emit'(__ARG_1, $S5)
  __label_28: # switch end
# }
  __label_26: # endif
# }
  __label_18: # endif
.annotate 'line', 5087
# predefined push
    push $P3, $S5
# }
  __label_12: # for iteration
.annotate 'line', 5036
    inc $I2
    goto __label_14
  __label_13: # for end
  __label_1: # switch end
.annotate 'line', 5090
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 5091

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
.annotate 'line', 4991
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4993
    addattribute $P0, 'predef'
.annotate 'line', 4994
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'genpredefcallexpr' :subid('WSubId_66')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
.annotate 'line', 5098
# callname: $S1
    $P3 = __ARG_2.'name'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5099
    __ARG_1.'use_predef'($S1)
.annotate 'line', 5100
# nargs: $I1
    unless_null __ARG_3, __label_3
    null $I1
    goto __label_2
  __label_3:
    $I1 = __ARG_3.'numargs'()
  __label_2:
.annotate 'line', 5101
# var rawargs: $P1
    ne $I1, 0, __label_5
    root_new $P3, ['parrot';'ResizablePMCArray']
    set $P1, $P3
    goto __label_4
  __label_5:
    $P1 = __ARG_3.'getrawargs'()
  __label_4:
.annotate 'line', 5104
    isa $I2, __ARG_2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
    unless $I2 goto __label_6
# {
.annotate 'line', 5105
    $P3 = WSubId_64($P1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 5106
# var evalfun: $P2
    getattribute $P2, __ARG_2, 'evalfun'
.annotate 'line', 5107
    getattribute $P3, __ARG_1, 'owner'
    getattribute $P4, __ARG_1, 'start'
    .tailcall $P2($P3, $P4, $P1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 5111
    new $P4, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
    getattribute $P5, __ARG_1, 'owner'
    getattribute $P6, __ARG_1, 'start'
    $P4.'CallPredefExpr'($P5, $P6, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 5112

.end # genpredefcallexpr

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5121
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5122
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5123
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5124
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5125
    __ARG_1.'unget'($P1)
.annotate 'line', 5126
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5128

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5129
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_65 = "WSubId_65"
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
.annotate 'line', 5132
# var funref: $P1
    getattribute $P4, self, 'funref'
    $P1 = $P4.'optimize'()
.annotate 'line', 5133
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5134
# nargs: $I1
    null $I1
.annotate 'line', 5135
    if_null $P2, __label_1
# {
.annotate 'line', 5136
    $P2 = $P2.'optimize'()
.annotate 'line', 5137
    $P4 = $P2.'numargs'()
    set $I1, $P4
# }
  __label_1: # endif
.annotate 'line', 5140
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I2 goto __label_2
.annotate 'line', 5141
    new $P5, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P5.'CallMemberExpr'(self, $P1, $P2)
    set $P4, $P5
    .return($P4)
  __label_2: # endif
.annotate 'line', 5142
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I2 goto __label_3
.annotate 'line', 5143
    new $P5, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P5.'CallMemberRefExpr'(self, $P1, $P2)
    set $P4, $P5
    .return($P4)
  __label_3: # endif
.annotate 'line', 5146
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 5147
# callname: $S1
    $P5 = $P1.'getName'()
    null $S1
    if_null $P5, __label_5
    set $S1, $P5
  __label_5:
.annotate 'line', 5148
# var predef: $P3
    $P3 = WSubId_65($S1, $I1)
.annotate 'line', 5149
    if_null $P3, __label_6
.annotate 'line', 5150
    getattribute $P4, self, 'owner'
    .tailcall WSubId_66($P4, $P3, $P2)
  __label_6: # endif
# }
  __label_4: # endif
.annotate 'line', 5153
    setattribute self, 'funref', $P1
.annotate 'line', 5154
    setattribute self, 'args', $P2
.annotate 'line', 5155
    .return(self)
# }
.annotate 'line', 5156

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5159
    .return(1)
# }
.annotate 'line', 5160

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5163
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5164
# call: $S1
    null $S1
.annotate 'line', 5166
    $I1 = $P1.'isidentifier'()
    unless $I1 goto __label_3
    getattribute $P3, $P1, 'subid'
    isnull $I1, $P3
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 5167
    $P4 = $P1.'checkIdentifier'()
    set $S1, $P4
.annotate 'line', 5168
    ne $S1, '', __label_4
# {
.annotate 'line', 5169
# var sym: $P2
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P5 = $P1.'getName'()
    push $P3, $P5
    $P2 = self.'findsymbol'($P3)
.annotate 'line', 5170
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_7
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
  __label_7:
    unless $I1 goto __label_5
.annotate 'line', 5171
    $P3 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P3
    goto __label_6
  __label_5: # else
.annotate 'line', 5173
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "'"
    push $P4, $P5
    $P6 = $P1.'getName'()
    push $P4, $P6
    box $P5, "'"
    push $P4, $P5
# predefined join
    join $S1, "", $P4
  __label_6: # endif
# }
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5177
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 5178
    .return($S1)
# }
.annotate 'line', 5179

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5182
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5183
    if_null $P1, __label_1
.annotate 'line', 5184
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 5185

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5188
    __ARG_1.'print'('(')
.annotate 'line', 5189
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5190
    if_null $P1, __label_1
.annotate 'line', 5191
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5192
    __ARG_1.'say'(')')
# }
.annotate 'line', 5193

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5196
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5197
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5199
    self.'annotate'(__ARG_1)
.annotate 'line', 5201
    __ARG_1.'print'('    ')
.annotate 'line', 5202
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5203
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5204
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5206
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5209
    __ARG_1.'print'($S1)
.annotate 'line', 5210
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5211

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5114
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5116
    addattribute $P0, 'funref'
.annotate 'line', 5117
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5225
    getattribute $P5, __ARG_1, 'owner'
    getattribute $P6, __ARG_1, 'start'
    self.'Expr'($P5, $P6)
.annotate 'line', 5226
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5227
    setattribute self, 'args', __ARG_3
.annotate 'line', 5232
# var first: $P1
    getattribute $P1, __ARG_2, 'left'
  __label_2: # while
.annotate 'line', 5233
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5234
    getattribute $P1, $P1, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 5235
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_3
# {
.annotate 'line', 5236
# var idfirst: $P2
    $P2 = $P1.'checkIdentifier'()
.annotate 'line', 5237
    isnull $I1, $P2
    if $I1 goto __label_5
    set $S1, $P2
    iseq $I1, $S1, ''
  __label_5:
    unless $I1 goto __label_4
# {
.annotate 'line', 5238
# var key: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5239
    __ARG_2.'buildkey'($P3)
.annotate 'line', 5240
# var sym: $P4
    $P4 = self.'findsymbol'($P3)
.annotate 'line', 5241
    if_null $P4, __label_6
# {
.annotate 'line', 5242
    setattribute self, 'sym', $P4
.annotate 'line', 5243
    isa $I1, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_7
# {
.annotate 'line', 5244
    $P6 = $P4.'makesubid'()
    setattribute self, 'subid', $P6
.annotate 'line', 5245
    getattribute $P5, self, 'subid'
    self.'usesubid'($P5)
# }
  __label_7: # endif
# }
  __label_6: # endif
# }
  __label_4: # endif
# }
  __label_3: # endif
# }
.annotate 'line', 5250

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5253
    getattribute $P3, self, 'sym'
    if_null $P3, __label_1
# {
.annotate 'line', 5254
    getattribute $P4, self, 'subid'
    if_null $P4, __label_2
.annotate 'line', 5255
    getattribute $P5, self, 'subid'
    .return($P5)
  __label_2: # endif
.annotate 'line', 5256
# var sym: $P1
    getattribute $P1, self, 'sym'
.annotate 'line', 5257
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    unless $I1 goto __label_3
.annotate 'line', 5258
    .tailcall $P1.'emit_get'(__ARG_1, self)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5260
# var funref: $P2
    getattribute $P2, self, 'funref'
.annotate 'line', 5261
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P5 = $P2.'emit_left_get'(__ARG_1)
    push $P3, $P5
    box $P4, ".'"
    push $P3, $P4
.annotate 'line', 5262
    $P6 = $P2.'get_member'()
.annotate 'line', 5261
    push $P3, $P6
    box $P4, "'"
    push $P3, $P4
# predefined join
.annotate 'line', 5252
    join $S1, "", $P3
.annotate 'line', 5261
    .return($S1)
# }
.annotate 'line', 5263

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 5219
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 5221
    addattribute $P0, 'sym'
.annotate 'line', 5222
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5273
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5274
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5275
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5276

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5279
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5280
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5281
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5282
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5283
    WSubId_1("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 5286
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5287
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 5288
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5289

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 5269
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]

.sub 'MemberExprBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5299
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5300
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5301

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5304
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5305
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5306
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5307
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5308
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5309
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5310
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5312
    .return($S2)
# }
.annotate 'line', 5313

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 5294
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5296
    addattribute $P0, 'left'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberExpr' ]

.sub 'MemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5322
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5323
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5324

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5325
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5328
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5329
    .return(self)
# }
.annotate 'line', 5330

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5333
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5334
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5335
    $P2 = $P1.'getName'()
# predefined push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5337
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5338
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# predefined push
    push __ARG_1, $P2
# }
.annotate 'line', 5339

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5342
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5343

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5346
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5347
    self.'annotate'(__ARG_1)
.annotate 'line', 5348
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5349

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5352
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5353
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5354
    .return($S1)
# }
.annotate 'line', 5355

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5358
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5359
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5360
    self.'annotate'(__ARG_1)
.annotate 'line', 5361
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5362

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5365
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5366

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5369
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5370
# value: $S2
    null $S2
.annotate 'line', 5371
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5373
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5374
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5375
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5377
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5380
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 5381
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5383
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 5384

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5387
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5388
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5389
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5390
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5392
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 5393
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 5394
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 5396
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5398
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 5399
    .return($S2)
# }
.annotate 'line', 5400

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 5316
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5318
    addattribute $P0, 'right'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]

.sub 'MemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5410
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5411
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5412

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5413
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5416
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5417
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5418
    .return(self)
# }
.annotate 'line', 5419

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5422
    WSubId_1('Member reference can be used only for method calls', self)
# }
.annotate 'line', 5424

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 5405
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5407
    addattribute $P0, 'right'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IndexExpr' ]

.sub 'IndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5438
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5439
    setattribute self, 'left', __ARG_4
.annotate 'line', 5440
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5441

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5444
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_1
.annotate 'line', 5445
    .return('S')
    goto __label_2
  __label_1: # else
.annotate 'line', 5447
    .return('P')
  __label_2: # endif
# }
.annotate 'line', 5448

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5451
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5452
    setattribute self, 'left', $P1
.annotate 'line', 5453
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5454
    $P2.'optimizeargs'()
.annotate 'line', 5458
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_2
    $P5 = $P2.'numargs'()
    set $I3, $P5
    iseq $I2, $I3, 1
  __label_2:
    unless $I2 goto __label_1
# {
.annotate 'line', 5459
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 5460
    $P5 = $P3.'isintegerliteral'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 5461
# ival: $I1
    $P6 = $P3.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 5462
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_4
    set $S1, $P5
  __label_4:
.annotate 'line', 5463
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P6, self, 'start'
    getattribute $P5, $P6, 'file'
    getattribute $P8, self, 'start'
    getattribute $P7, $P8, 'line'
.annotate 'line', 5464
# predefined substr
.annotate 'line', 5463
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5465
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5468
    .return(self)
# }
.annotate 'line', 5469

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5472
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5473
    getattribute $P4, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 5474
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5475
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 5476
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 5477
    $P3 = $P1.'emit_get'(__ARG_1)
  __label_3:
.annotate 'line', 5475
    setattribute self, 'regleft', $P3
.annotate 'line', 5478
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 5479

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5482
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5483
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5484
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5485
    getattribute $P3, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 5486
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5487
# predefined join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 5488
    __ARG_1.'print'(']')
# }
.annotate 'line', 5489

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5492
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5493
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5494
    ne $S1, 'S', __label_2
# {
.annotate 'line', 5495
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5496
# nargs: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 5497
    eq $I1, 1, __label_4
.annotate 'line', 5498
    WSubId_1('Bad string index', self)
  __label_4: # endif
.annotate 'line', 5499
    set $S2, __ARG_2
    ne $S2, '', __label_5
.annotate 'line', 5500
    __ARG_2 = self.'tempreg'('S')
  __label_5: # endif
.annotate 'line', 5501
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5504
    self.'annotate'(__ARG_1)
.annotate 'line', 5505
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5506
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5507
    __ARG_1.'say'('')
# }
  __label_3: # endif
# }
.annotate 'line', 5509

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5512
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5513
    self.'annotate'(__ARG_1)
.annotate 'line', 5514
    __ARG_1.'print'('    ')
.annotate 'line', 5515
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5516
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5517

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5520
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5521
# rreg: $S1
    null $S1
.annotate 'line', 5522
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 5523
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5524
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5527
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 5528
    self.'annotate'(__ARG_1)
.annotate 'line', 5529
    __ARG_1.'print'('    ')
.annotate 'line', 5530
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5531
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5532
    .return($S1)
# }
.annotate 'line', 5533

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 5429
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5431
    addattribute $P0, 'left'
.annotate 'line', 5432
    addattribute $P0, 'regleft'
.annotate 'line', 5433
    addattribute $P0, 'args'
.annotate 'line', 5434
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 5544
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5545
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5546
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5547
    __ARG_1.'unget'($P1)
.annotate 'line', 5548
    $P3 = WSubId_36(__ARG_1, __ARG_2, WSubId_37, ']')
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5550

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5551
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 5554
    getattribute $P1, self, 'values'
    WSubId_38($P1)
.annotate 'line', 5555
    .return(self)
# }
.annotate 'line', 5556

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5559
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 5560
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 5561
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 5567
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
# }
.annotate 'line', 5569

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5572
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5573
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5574
    .return($S1)
# }
.annotate 'line', 5575

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5578
    self.'annotate'(__ARG_1)
.annotate 'line', 5579
# itemreg: $S1
    null $S1
.annotate 'line', 5580
# it_p: $S2
    null $S2
.annotate 'line', 5581
    eq __ARG_2, '', __label_1
# {
.annotate 'line', 5582
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5583
    $P3 = self.'tempreg'('P')
    set $S2, $P3
# }
  __label_1: # endif
.annotate 'line', 5585
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 5586
    if_null $P1, __label_2
# {
.annotate 'line', 5587
    iter $P4, $P1
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P2, $P4
# {
# switch
.annotate 'line', 5588
    $P3 = $P2.'checkresult'()
    set $S4, $P3
    set $S5, 'I'
    if $S4 == $S5 goto __label_7
    set $S5, 'N'
    if $S4 == $S5 goto __label_8
    set $S5, 'S'
    if $S4 == $S5 goto __label_9
    goto __label_6
  __label_7: # case
  __label_8: # case
  __label_9: # case
.annotate 'line', 5590
# aux: $S3
    $P5 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_10
    set $S3, $P5
  __label_10:
.annotate 'line', 5591
    eq __ARG_2, '', __label_11
# {
.annotate 'line', 5592
    __ARG_1.'emitbox'($S2, $S3)
.annotate 'line', 5593
    set $S1, $S2
# }
  __label_11: # endif
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 5597
    $P3 = $P2.'isnull'()
    if_null $P3, __label_12
    unless $P3 goto __label_12
# {
.annotate 'line', 5598
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5599
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5600
    __ARG_1.'emitnull'($S1)
# }
  __label_14: # endif
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 5604
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_13: # endif
  __label_5: # switch end
.annotate 'line', 5606
    eq __ARG_2, '', __label_15
# {
.annotate 'line', 5607
    self.'annotate'(__ARG_1)
.annotate 'line', 5608
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
  __label_15: # endif
# }
    goto __label_3
  __label_4: # endfor
# }
  __label_2: # endif
# }
.annotate 'line', 5612

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 5538
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5540
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 5624
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5625
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5626
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5627
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5628
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 5629
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 5630
# {
.annotate 'line', 5631
# var key: $P4
    $P4 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 5632
    WSubId_54(':', __ARG_1)
.annotate 'line', 5633
# var value: $P5
    $P5 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 5634
# predefined push
    push $P2, $P4
.annotate 'line', 5635
# predefined push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 5637
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 5638
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 5639
    WSubId_40("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 5641
    setattribute self, 'keys', $P2
.annotate 'line', 5642
    setattribute self, 'values', $P3
# }
.annotate 'line', 5643

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5644
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 5647
    getattribute $P1, self, 'keys'
    WSubId_38($P1)
.annotate 'line', 5648
    getattribute $P1, self, 'values'
    WSubId_38($P1)
.annotate 'line', 5649
    .return(self)
# }
.annotate 'line', 5650

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5653
    self.'annotate'(__ARG_1)
.annotate 'line', 5658
    set $S6, __ARG_2
    eq $S6, '', __label_1
.annotate 'line', 5659
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 5661
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5662
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5663
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5664
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 5665
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5666
# item: $S1
    null $S1
.annotate 'line', 5667
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 5668
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5669
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5670
    __ARG_1.'emitget_hll_global'($S1, $S2)
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 5673
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 5675
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5676
# itemreg: $S3
    null $S3
.annotate 'line', 5677
# it_p: $S4
    null $S4
.annotate 'line', 5678
    set $S6, __ARG_2
    eq $S6, '', __label_8
.annotate 'line', 5679
    $P5 = self.'tempreg'('P')
    set $S4, $P5
  __label_8: # endif
.annotate 'line', 5680
# aux: $S5
    null $S5
# switch
.annotate 'line', 5681
    $P5 = $P4.'checkresult'()
    set $S6, $P5
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    set $S7, 'S'
    if $S6 == $S7 goto __label_13
    goto __label_10
  __label_11: # case
  __label_12: # case
  __label_13: # case
.annotate 'line', 5683
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
.annotate 'line', 5684
    set $S8, __ARG_2
    eq $S8, '', __label_14
# {
.annotate 'line', 5685
    __ARG_1.'emitbox'($S4, $S5)
.annotate 'line', 5686
    set $S3, $S4
# }
  __label_14: # endif
    goto __label_9 # break
  __label_10: # default
.annotate 'line', 5690
    $P5 = $P4.'isnull'()
    if_null $P5, __label_15
    unless $P5 goto __label_15
# {
.annotate 'line', 5691
    set $S6, __ARG_2
    eq $S6, '', __label_17
# {
.annotate 'line', 5692
    $P6 = self.'tempreg'('P')
    set $S3, $P6
.annotate 'line', 5693
    __ARG_1.'emitnull'($S3)
# }
  __label_17: # endif
# }
    goto __label_16
  __label_15: # else
.annotate 'line', 5697
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_16: # endif
  __label_9: # switch end
.annotate 'line', 5699
    set $S6, __ARG_2
    eq $S6, '', __label_18
.annotate 'line', 5700
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_18: # endif
# }
  __label_2: # for iteration
.annotate 'line', 5664
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 5702

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5705
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5706
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5707
    .return($S1)
# }
.annotate 'line', 5708

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 5617
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5619
    addattribute $P0, 'keys'
.annotate 'line', 5620
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5721
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5726
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 5727

.end # parseinitializer


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 5730
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5731
    if_null $P1, __label_1
.annotate 'line', 5732
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 5733

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5736
    self.'optimize_initializer'()
.annotate 'line', 5737
    .return(self)
# }
.annotate 'line', 5738

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5741
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5742
    if_null $P1, __label_1
.annotate 'line', 5743
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5744
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 5745
    if_null $P1, __label_2
.annotate 'line', 5746
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5747
    __ARG_1.'say'(")")
# }
.annotate 'line', 5748

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 5713
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5715
    addattribute $P0, 'initializer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewExpr' ]

.sub 'NewExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5759
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5761
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_2
    $I2 = __ARG_4.'isidentifier'()
  __label_2:
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 5762
    WSubId_1("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 5763
    setattribute self, 'value', __ARG_4
.annotate 'line', 5764
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5766
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 5767
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 5769
    __ARG_1.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 5770

.end # NewExpr


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5773
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5774
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    unless $I1 goto __label_2
    $I1 = $P1.'isidentifier'()
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 5777
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'getidentifier'()
    $P2 = $P3.'getvar'($P4)
.annotate 'line', 5778
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    $I1 = $P2.'isconst'()
  __label_4:
    unless $I1 goto __label_3
# {
.annotate 'line', 5779
    $P1 = $P2.'getvalue'()
.annotate 'line', 5780
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_5
.annotate 'line', 5781
    WSubId_1('Constant value must evaluate to a string', $P1)
  __label_5: # endif
.annotate 'line', 5782
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5785
    self.'optimize_initializer'()
.annotate 'line', 5786
    .return(self)
# }
.annotate 'line', 5787

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5790
    self.'annotate'(__ARG_1)
.annotate 'line', 5792
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5793
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 5796
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
    null $I2
    goto __label_3
  __label_4:
.annotate 'line', 5797
    getattribute $P9, self, 'value'
    $P8 = $P9.'isidentifier'()
    if_null $P8, __label_6
    unless $P8 goto __label_6
    set $I2, 1
    goto __label_5
  __label_6:
    set $I2, -1
  __label_5:
  __label_3:
.annotate 'line', 5799
# reginit: $S1
    set $S1, ''
.annotate 'line', 5800
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5801
# constructor: $S3
    null $S3
# switch
.annotate 'line', 5802
    set $I3, $I1
    set $I4, -1
    if $I3 == $I4 goto __label_10
    null $I4
    if $I3 == $I4 goto __label_11
    set $I4, 1
    if $I3 == $I4 goto __label_12
    goto __label_9
  __label_10: # case
  __label_11: # case
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 5807
    ne $I2, 1, __label_13
# {
.annotate 'line', 5808
    not $I5, __ARG_3
    unless $I5 goto __label_15
.annotate 'line', 5809
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_15: # endif
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 5812
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5813
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 5814
    concat $S0, ', ', $S1
    set $S1, $S0
# }
  __label_14: # endif
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5818
    eq $I2, 1, __label_16
.annotate 'line', 5819
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_16: # endif
.annotate 'line', 5820
    not $I3, __ARG_3
    unless $I3 goto __label_17
.annotate 'line', 5821
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_17: # endif
  __label_8: # switch end
# switch
.annotate 'line', 5824
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_20
    set $I4, 1
    if $I3 == $I4 goto __label_21
    goto __label_19
  __label_20: # case
.annotate 'line', 5827
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_22
    set $S4, $P6
  __label_22:
.annotate 'line', 5828
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5829
    isnull $I5, $P3
    unless $I5 goto __label_24
    $I5 = self.'dowarnings'()
  __label_24:
    unless $I5 goto __label_23
.annotate 'line', 5830
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    WSubId_67($S5, $P8)
  __label_23: # endif
.annotate 'line', 5834
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 5835
    le $I1, 1, __label_25
# {
.annotate 'line', 5836
    getattribute $P10, self, 'value'
    __ARG_1.'say'($S2, ".'", $P10, "'()")
# }
  __label_25: # endif
    goto __label_18 # break
  __label_21: # case
.annotate 'line', 5840
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 5841
    unless_null $P4, __label_26
# {
.annotate 'line', 5843
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 5844
    if_null $P5, __label_28
# {
.annotate 'line', 5845
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_29
  __label_28: # else
# {
.annotate 'line', 5848
    $P6 = self.'dowarnings'()
    if_null $P6, __label_30
    unless $P6 goto __label_30
.annotate 'line', 5849
    WSubId_67('Checking: new unknown type')
  __label_30: # endif
.annotate 'line', 5850
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
  __label_29: # endif
.annotate 'line', 5852
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_27
  __label_26: # else
# {
.annotate 'line', 5856
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
  __label_27: # endif
    goto __label_18 # break
  __label_19: # default
.annotate 'line', 5860
    WSubId_6('Unexpected type in new')
  __label_18: # switch end
.annotate 'line', 5862
    isgt $I3, $I1, 1
    if $I3 goto __label_32
    isge $I3, $I1, 0
    unless $I3 goto __label_33
    iseq $I3, $I2, 1
  __label_33:
  __label_32:
    unless $I3 goto __label_31
# {
.annotate 'line', 5863
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5864
    not $I3, __ARG_3
    unless $I3 goto __label_34
.annotate 'line', 5865
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_34: # endif
# }
  __label_31: # endif
# }
.annotate 'line', 5867

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5870
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5871

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 5753
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5755
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5882
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5883
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5884
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5885
    setattribute self, 'nskey', $P1
.annotate 'line', 5886
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5887
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5888
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 5890
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 5891

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5894
# reginit: $S1
    null $S1
.annotate 'line', 5895
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5896
# numinits: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# switch
.annotate 'line', 5897
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_5
    set $I3, 1
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 5901
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5902
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 5905
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_3: # switch end
.annotate 'line', 5907
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 5908
    __ARG_1.'print'('    ')
.annotate 'line', 5909
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_7
    unless $P4 goto __label_7
.annotate 'line', 5910
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 5911
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5912
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5913
    if_null $S1, __label_8
.annotate 'line', 5914
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 5915
    __ARG_1.'say'()
# }
.annotate 'line', 5916

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 5876
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5878
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5927
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5928
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5929
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5930
    setattribute self, 'nskey', $P1
.annotate 'line', 5931
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5932
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5933
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 5935
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 5936

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5939
# reginit: $S1
    null $S1
.annotate 'line', 5940
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5942
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 5943
# regnew: $S2
    set $P3, __ARG_2
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5944
    le $I1, 0, __label_4
.annotate 'line', 5945
    $P3 = self.'tempreg'('P')
    set $S2, $P3
  __label_4: # endif
.annotate 'line', 5946
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 5947
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 5948
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5949
    __ARG_1.'say'()
.annotate 'line', 5951
    lt $I1, 0, __label_5
# {
.annotate 'line', 5952
# constructor: $S3
    $P3 = $P2.'last'()
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 5953
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5954
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
  __label_5: # endif
# }
.annotate 'line', 5956

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 5921
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5923
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_68')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5963
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 5966
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 5970
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 5973
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 5968
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5969
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 5968
    .return($P3)
  __label_4: # case
.annotate 'line', 5972
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 5976
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5977
    __ARG_1.'unget'($P2)
.annotate 'line', 5978
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 5980
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 5985
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 5987

.end # parseNew

.namespace [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
.annotate 'line', 5998
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5999
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 6000
    $P2 = WSubId_60(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 6001

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6004
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 6005
    .return(self)
# }
.annotate 'line', 6006

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6007
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6010
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 6011
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6012
    eq $S1, 'P', __label_2
.annotate 'line', 6013
    WSubId_1('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 6014
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 6016
# r: $S2
    set $S4, __ARG_2
    ne $S4, '', __label_4
    $P3 = self.'tempreg'('I')
    goto __label_3
  __label_4:
    set $P3, __ARG_2
  __label_3:
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 6017
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 6018
    self.'annotate'(__ARG_1)
.annotate 'line', 6019
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 6020
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6021
    __ARG_1.'say'()
# }
.annotate 'line', 6022

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 5991
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5993
    addattribute $P0, 'lexpr'
.annotate 'line', 5994
    addattribute $P0, 'checked'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]

.sub 'OpConditionalExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 6039
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6040
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 6041
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 6042
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 6043
    .return(self)
# }
.annotate 'line', 6044

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6047
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 6048
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6050
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 6052
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 6054
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 6055
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 6056
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 6058

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6061
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6062
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6063
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 6065
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 6066

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6069
# cond_end: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6070
# cond_false: $S2
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6071
    getattribute $P3, self, 'condition'
    $P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 6072
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6073
# tres: $S3
    $P3 = self.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 6074
    $P3 = $P1.'isnull'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
.annotate 'line', 6075
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 6077
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 6078
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 6079
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 6080
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 6081
    $P3 = $P2.'isnull'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 6082
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 6084
# tfalse: $S4
    $P4 = $P2.'checkresult'()
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 6085
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 6086
# r: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_12
    set $S5, $P3
  __label_12:
.annotate 'line', 6087
    __ARG_1.'emitbox'(__ARG_2, $S5)
# }
    goto __label_10
  __label_9: # else
.annotate 'line', 6090
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 6092
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 6093

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 6027
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6033
    addattribute $P0, 'condition'
.annotate 'line', 6034
    addattribute $P0, 'etrue'
.annotate 'line', 6035
    addattribute $P0, 'efalse'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant Code_none evaluated at compile time
# Constant Code_paren evaluated at compile time
# Constant Code_bracket evaluated at compile time
# Constant Code_dot evaluated at compile time
# Constant Code_assign evaluated at compile time
# Constant Code_assign_to evaluated at compile time
# Constant Code_add_assign evaluated at compile time
# Constant Code_add evaluated at compile time
# Constant Code_minus evaluated at compile time
# Constant Code_inc evaluated at compile time
# Constant Code_dec evaluated at compile time
# Constant Code_not evaluated at compile time
# Constant Code_equal evaluated at compile time
# Constant Code_not_equal evaluated at compile time
# Constant Code_less evaluated at compile time
# Constant Code_less_equal evaluated at compile time
# Constant Code_greater evaluated at compile time
# Constant Code_greater_equal evaluated at compile time
# Constant Code_sub_assign evaluated at compile time
# Constant Code_mul evaluated at compile time
# Constant Code_div evaluated at compile time
# Constant Code_mod evaluated at compile time
# Constant Code_cmod evaluated at compile time
# Constant Code_mul_assign evaluated at compile time
# Constant Code_div_assign evaluated at compile time
# Constant Code_same evaluated at compile time
# Constant Code_not_same evaluated at compile time
# Constant Code_instanceof evaluated at compile time
# Constant Code_shiftleft evaluated at compile time
# Constant Code_shiftright evaluated at compile time
# Constant Code_mod_assign evaluated at compile time
# Constant Code_delete evaluated at compile time
# Constant Code_exists evaluated at compile time

.sub 'getOpCode_2' :subid('WSubId_70')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6137
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '('
    if $S1 == $S2 goto __label_3
    set $S2, '['
    if $S1 == $S2 goto __label_4
    set $S2, '.'
    if $S1 == $S2 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6138
    .return(1)
  __label_4: # case
.annotate 'line', 6139
    .return(2)
  __label_5: # case
.annotate 'line', 6140
    .return(3)
  __label_2: # default
.annotate 'line', 6141
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6143

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_72')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6147
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '-'
    if $S1 == $S2 goto __label_3
    set $S2, '!'
    if $S1 == $S2 goto __label_4
    set $S2, '++'
    if $S1 == $S2 goto __label_5
    set $S2, '--'
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 6148
    .return(8)
  __label_4: # case
.annotate 'line', 6149
    .return(11)
  __label_5: # case
.annotate 'line', 6150
    .return(9)
  __label_6: # case
.annotate 'line', 6151
    .return(10)
  __label_2: # default
.annotate 'line', 6153
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(31)
    goto __label_8
  __label_7: # else
.annotate 'line', 6154
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_9
    unless $P3 goto __label_9
    .return(32)
    goto __label_10
  __label_9: # else
.annotate 'line', 6155
    .return(0)
  __label_10: # endif
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6157

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_75')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6161
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '*'
    if $S1 == $S2 goto __label_3
    set $S2, '/'
    if $S1 == $S2 goto __label_4
    set $S2, '%'
    if $S1 == $S2 goto __label_5
    set $S2, '%%'
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 6162
    .return(19)
  __label_4: # case
.annotate 'line', 6163
    .return(20)
  __label_5: # case
.annotate 'line', 6164
    .return(21)
  __label_6: # case
.annotate 'line', 6165
    .return(22)
  __label_2: # default
.annotate 'line', 6166
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6168

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_78')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6172
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6173
    .return(28)
  __label_4: # case
.annotate 'line', 6174
    .return(29)
  __label_2: # default
.annotate 'line', 6175
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6177

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_80')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6181
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<'
    if $S1 == $S2 goto __label_3
    set $S2, '>'
    if $S1 == $S2 goto __label_4
    set $S2, '<='
    if $S1 == $S2 goto __label_5
    set $S2, '>='
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 6182
    .return(14)
  __label_4: # case
.annotate 'line', 6183
    .return(16)
  __label_5: # case
.annotate 'line', 6184
    .return(15)
  __label_6: # case
.annotate 'line', 6185
    .return(17)
  __label_2: # default
.annotate 'line', 6187
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 6188
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6190

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_82')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6194
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '=='
    if $S1 == $S2 goto __label_3
    set $S2, '!='
    if $S1 == $S2 goto __label_4
    set $S2, '==='
    if $S1 == $S2 goto __label_5
    set $S2, '!=='
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 6195
    .return(12)
  __label_4: # case
.annotate 'line', 6196
    .return(13)
  __label_5: # case
.annotate 'line', 6197
    .return(25)
  __label_6: # case
.annotate 'line', 6198
    .return(26)
  __label_2: # default
.annotate 'line', 6199
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6201

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_91')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6205
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '='
    if $S1 == $S2 goto __label_3
    set $S2, '=:'
    if $S1 == $S2 goto __label_4
    set $S2, '+='
    if $S1 == $S2 goto __label_5
    set $S2, '-='
    if $S1 == $S2 goto __label_6
    set $S2, '*='
    if $S1 == $S2 goto __label_7
    set $S2, '/='
    if $S1 == $S2 goto __label_8
    set $S2, '%='
    if $S1 == $S2 goto __label_9
    goto __label_2
  __label_3: # case
.annotate 'line', 6206
    .return(4)
  __label_4: # case
.annotate 'line', 6207
    .return(5)
  __label_5: # case
.annotate 'line', 6208
    .return(6)
  __label_6: # case
.annotate 'line', 6209
    .return(18)
  __label_7: # case
.annotate 'line', 6210
    .return(23)
  __label_8: # case
.annotate 'line', 6211
    .return(24)
  __label_9: # case
.annotate 'line', 6212
    .return(30)
  __label_2: # default
.annotate 'line', 6213
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6215

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_69')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 6219
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6220
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6223
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6227
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6229
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6231
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6233
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6235
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6237
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6239
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6241
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6243
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_12
    goto __label_2
  __label_3: # case
.annotate 'line', 6224
    $P2 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 6225
    WSubId_54(')', __ARG_1)
.annotate 'line', 6226
    .return($P2)
  __label_4: # case
.annotate 'line', 6228
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 6230
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 6232
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 6234
    new $P10, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P10.'IntegerLiteral'(__ARG_2, $P1)
    set $P9, $P10
    .return($P9)
  __label_8: # case
.annotate 'line', 6236
    new $P12, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P12.'FloatLiteral'(__ARG_2, $P1)
    set $P11, $P12
    .return($P11)
  __label_9: # case
.annotate 'line', 6238
    .tailcall WSubId_68(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6240
    new $P14, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P14.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P13, $P14
    .return($P13)
  __label_11: # case
.annotate 'line', 6242
    new $P16, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P16.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P15, $P16
    .return($P15)
  __label_12: # case
.annotate 'line', 6244
    new $P18, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P18.'IdentifierExpr'(__ARG_2, $P1)
    set $P17, $P18
    .return($P17)
  __label_2: # default
.annotate 'line', 6246
    WSubId_40('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6248

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_71')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6252
# var subexp: $P1
    $P1 = WSubId_69(__ARG_1, __ARG_2)
.annotate 'line', 6253
# var t: $P2
    null $P2
.annotate 'line', 6254
# var start: $P3
    null $P3
.annotate 'line', 6255
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6256
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_70($P2)
    set $I1, $P5
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6257
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6259
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6262
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6265
    set $P3, $P2
.annotate 'line', 6266
    $P2 = __ARG_1.'get'()
.annotate 'line', 6267
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
# {
.annotate 'line', 6268
# var right: $P4
    $P4 = WSubId_69(__ARG_1, __ARG_2)
.annotate 'line', 6269
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6272
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6275
    WSubId_6('Unexpected code in parseExpr_2')
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6278
    __ARG_1.'unget'($P2)
.annotate 'line', 6279
    .return($P1)
# }
.annotate 'line', 6280

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_74')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_71 = "WSubId_71"
# Body
# {
.annotate 'line', 6284
# var subexp: $P1
    $P1 = WSubId_71(__ARG_1, __ARG_2)
.annotate 'line', 6285
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6287
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6289
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6288
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 6290
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 6292
    __ARG_1.'unget'($P2)
.annotate 'line', 6293
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6295

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_73')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_72 = "WSubId_72"
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_74 = "WSubId_74"
# Body
# {
.annotate 'line', 6299
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6300
# code: $I1
    $P3 = WSubId_72($P1)
    set $I1, $P3
.annotate 'line', 6301
    eq $I1, 0, __label_1
# {
.annotate 'line', 6302
# var subexpr: $P2
    $P2 = WSubId_73(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6303
    set $I2, $I1
    set $I3, 8
    if $I2 == $I3 goto __label_5
    set $I3, 11
    if $I2 == $I3 goto __label_6
    set $I3, 9
    if $I2 == $I3 goto __label_7
    set $I3, 10
    if $I2 == $I3 goto __label_8
    set $I3, 31
    if $I2 == $I3 goto __label_9
    set $I3, 32
    if $I2 == $I3 goto __label_10
    goto __label_4
  __label_5: # case
.annotate 'line', 6305
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 6307
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 6309
    new $P8, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P8.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 6311
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P10.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 6313
    new $P12, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P12.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 6315
    new $P14, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P14.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_4: # default
.annotate 'line', 6317
    WSubId_6('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6321
    __ARG_1.'unget'($P1)
.annotate 'line', 6322
    .tailcall WSubId_74(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6324

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_75 = "WSubId_75"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6328
# var lexpr: $P1
    $P1 = WSubId_73(__ARG_1, __ARG_2)
.annotate 'line', 6329
# var t: $P2
    null $P2
.annotate 'line', 6330
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6331
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_75($P2)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
.annotate 'line', 6332
# var rexpr: $P3
    $P3 = WSubId_73(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6333
    set $I2, $I1
    set $I3, 19
    if $I2 == $I3 goto __label_5
    set $I3, 20
    if $I2 == $I3 goto __label_6
    set $I3, 21
    if $I2 == $I3 goto __label_7
    set $I3, 22
    if $I2 == $I3 goto __label_8
    goto __label_4
  __label_5: # case
.annotate 'line', 6335
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6338
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6341
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6344
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6347
    WSubId_6('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6350
    __ARG_1.'unget'($P2)
.annotate 'line', 6351
    .return($P1)
# }
.annotate 'line', 6352

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_76 = "WSubId_76"
# Body
# {
.annotate 'line', 6356
# var lexpr: $P1
    $P1 = WSubId_76(__ARG_1, __ARG_2)
.annotate 'line', 6357
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6358
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('-')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6359
# var rexpr: $P3
    $P3 = WSubId_76(__ARG_1, __ARG_2)
.annotate 'line', 6360
# var expr: $P4
    null $P4
.annotate 'line', 6361
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 6362
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 6364
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 6365
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6367
    __ARG_1.'unget'($P2)
.annotate 'line', 6368
    .return($P1)
# }
.annotate 'line', 6369

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_79')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_77 = "WSubId_77"
.const 'Sub' WSubId_78 = "WSubId_78"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6373
# var lexpr: $P1
    $P1 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6374
# var rexpr: $P2
    null $P2
.annotate 'line', 6375
# var t: $P3
    null $P3
.annotate 'line', 6376
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6377
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_78($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6378
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 6380
    $P2 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6381
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6384
    $P2 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6385
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6388
    WSubId_6('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6391
    __ARG_1.'unget'($P3)
.annotate 'line', 6392
    .return($P1)
# }
.annotate 'line', 6393

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_81')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_80 = "WSubId_80"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6397
# var lexpr: $P1
    $P1 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6398
# var rexpr: $P2
    null $P2
.annotate 'line', 6399
# var t: $P3
    null $P3
.annotate 'line', 6400
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6401
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_80($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6402
    set $I2, $I1
    set $I3, 14
    if $I2 == $I3 goto __label_5
    set $I3, 16
    if $I2 == $I3 goto __label_6
    set $I3, 15
    if $I2 == $I3 goto __label_7
    set $I3, 17
    if $I2 == $I3 goto __label_8
    set $I3, 27
    if $I2 == $I3 goto __label_9
    goto __label_4
  __label_5: # case
.annotate 'line', 6404
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6405
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6408
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6409
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6412
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6413
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6416
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6417
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6420
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6423
    WSubId_6('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6426
    __ARG_1.'unget'($P3)
.annotate 'line', 6427
    .return($P1)
# }
.annotate 'line', 6428

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_83')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_81 = "WSubId_81"
.const 'Sub' WSubId_82 = "WSubId_82"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6432
# var lexpr: $P1
    $P1 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6433
# var rexpr: $P2
    null $P2
.annotate 'line', 6434
# var t: $P3
    null $P3
.annotate 'line', 6435
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6436
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_82($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6437
    set $I2, $I1
    set $I3, 12
    if $I2 == $I3 goto __label_5
    set $I3, 13
    if $I2 == $I3 goto __label_6
    set $I3, 25
    if $I2 == $I3 goto __label_7
    set $I3, 26
    if $I2 == $I3 goto __label_8
    goto __label_4
  __label_5: # case
.annotate 'line', 6439
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6440
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6443
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6444
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6447
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6448
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6451
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6452
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P8
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6455
    WSubId_6('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6458
    __ARG_1.'unget'($P3)
.annotate 'line', 6459
    .return($P1)
# }
.annotate 'line', 6460

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_84')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_83 = "WSubId_83"
# Body
# {
.annotate 'line', 6464
# var lexpr: $P1
    $P1 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6465
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6466
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6467
# var rexpr: $P3
    $P3 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6468
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6470
    __ARG_1.'unget'($P2)
.annotate 'line', 6471
    .return($P1)
# }
.annotate 'line', 6472

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_85')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_84 = "WSubId_84"
# Body
# {
.annotate 'line', 6476
# var lexpr: $P1
    $P1 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6477
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6478
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6479
# var rexpr: $P3
    $P3 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6480
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6482
    __ARG_1.'unget'($P2)
.annotate 'line', 6483
    .return($P1)
# }
.annotate 'line', 6484

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_86')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_85 = "WSubId_85"
# Body
# {
.annotate 'line', 6488
# var lexpr: $P1
    $P1 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6489
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6490
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6491
# var rexpr: $P3
    $P3 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6492
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6494
    __ARG_1.'unget'($P2)
.annotate 'line', 6495
    .return($P1)
# }
.annotate 'line', 6496

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_86 = "WSubId_86"
# Body
# {
.annotate 'line', 6500
# var lexpr: $P1
    $P1 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6501
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6502
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6503
# var rexpr: $P3
    $P3 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6504
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6506
    __ARG_1.'unget'($P2)
.annotate 'line', 6507
    .return($P1)
# }
.annotate 'line', 6508

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_88')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_87 = "WSubId_87"
.const 'Sub' WSubId_86 = "WSubId_86"
# Body
# {
.annotate 'line', 6512
# var lexpr: $P1
    $P1 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6513
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6514
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6515
# var rexpr: $P3
    $P3 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6516
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6518
    __ARG_1.'unget'($P2)
.annotate 'line', 6519
    .return($P1)
# }
.annotate 'line', 6520

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_88 = "WSubId_88"
.const 'Sub' WSubId_89 = "WSubId_89"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 6524
# var econd: $P1
    $P1 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6525
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6526
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 6527
# var etrue: $P3
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6528
    WSubId_54(':', __ARG_1)
.annotate 'line', 6529
# var efalse: $P4
    $P4 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6530
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6533
    __ARG_1.'unget'($P2)
.annotate 'line', 6534
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6536

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_90 = "WSubId_90"
.const 'Sub' WSubId_91 = "WSubId_91"
.const 'Sub' WSubId_89 = "WSubId_89"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6540
# var lexpr: $P1
    $P1 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 6541
# var t: $P2
    null $P2
.annotate 'line', 6542
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6543
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_91($P2)
    set $I1, $P5
    eq $I1, 0, __label_1
# {
.annotate 'line', 6544
# var rexpr: $P3
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6545
# var expr: $P4
    null $P4
# switch
.annotate 'line', 6546
    set $I2, $I1
    set $I3, 4
    if $I2 == $I3 goto __label_5
    set $I3, 5
    if $I2 == $I3 goto __label_6
    set $I3, 6
    if $I2 == $I3 goto __label_7
    set $I3, 18
    if $I2 == $I3 goto __label_8
    set $I3, 23
    if $I2 == $I3 goto __label_9
    set $I3, 24
    if $I2 == $I3 goto __label_10
    set $I3, 30
    if $I2 == $I3 goto __label_11
    goto __label_4
  __label_5: # case
.annotate 'line', 6548
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6551
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6554
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6557
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6560
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 6563
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 6566
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6569
    WSubId_6('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 6571
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6572
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6574
    __ARG_1.'unget'($P2)
.annotate 'line', 6575
    .return($P1)
# }
.annotate 'line', 6576

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_37')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
# Body
# {
.annotate 'line', 6580
    .tailcall WSubId_89(__ARG_1, __ARG_2)
# }
.annotate 'line', 6581

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6596
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 6597
    WSubId_6('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 6598
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6599
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6600
    .return($S1)
# }
.annotate 'line', 6601

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6604
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6605
    unless_null $P1, __label_1
.annotate 'line', 6606
    WSubId_6('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 6607
    .return($P1)
# }
.annotate 'line', 6608

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 6592
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6617
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 6618
    WSubId_6('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 6619
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6620
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6621
    .return($S1)
# }
.annotate 'line', 6622

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6625
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6626
    unless_null $P1, __label_1
.annotate 'line', 6627
    WSubId_6('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 6628
    .return($P1)
# }
.annotate 'line', 6629

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 6611
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6613
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6645
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6646
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6647
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6648
    __ARG_2.'unget'($P1)
.annotate 'line', 6649
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 6651

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6654
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6655
    if_null $P1, __label_1
.annotate 'line', 6656
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 6657
    .return(self)
# }
.annotate 'line', 6658

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6662
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6663
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 6666
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 6667
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6668
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 6669
    self.'annotate'(__ARG_1)
.annotate 'line', 6670
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 6674
    le $I1, 0, __label_6
.annotate 'line', 6675
    $P1.'getargvalues'(__ARG_1)
  __label_6: # endif
.annotate 'line', 6677
    self.'annotate'(__ARG_1)
.annotate 'line', 6678
    self.'emitret'(__ARG_1)
.annotate 'line', 6679
    le $I1, 0, __label_7
.annotate 'line', 6680
    $P1.'emitargs'(__ARG_1)
  __label_7: # endif
.annotate 'line', 6681
    __ARG_1.'say'(')')
# }
.annotate 'line', 6682

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 6639
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6641
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6689
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6690

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6693
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6694

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 6685
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'YieldStatement' ]

.sub 'YieldStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6701
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6702

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6705
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6706

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 6697
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6719
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6720
    setattribute self, 'name', __ARG_1
.annotate 'line', 6721
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 6722

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6723
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6726
    self.'annotate'(__ARG_1)
.annotate 'line', 6727
    getattribute $P1, self, 'value'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6728

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 6713
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6715
    addattribute $P0, 'name'
.annotate 'line', 6716
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6742
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6743
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6744

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6745
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6748
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6749
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6750
    .return($S2)
# }
.annotate 'line', 6751

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 6737
    addattribute $P0, 'owner'
.annotate 'line', 6738
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_92 = "WSubId_92"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 6764
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6765
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6766
    WSubId_92($P1)
.annotate 'line', 6767
    setattribute self, 'label', $P1
.annotate 'line', 6768
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 6769

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6770
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6773
    self.'annotate'(__ARG_1)
.annotate 'line', 6774
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6775
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6776
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6777

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 6758
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6760
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 6788
    $P1 = WSubId_37(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6789

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 6792
    WSubId_54('(', __ARG_1)
.annotate 'line', 6793
    $P1 = WSubId_37(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 6794
    WSubId_54(')', __ARG_1)
# }
.annotate 'line', 6795

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 6784
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Condition' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'IfStatement' ]

.sub 'IfStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_93 = "WSubId_93"
# Body
# {
.annotate 'line', 6808
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6809
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6810
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6811
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6812
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6813
    $P4 = WSubId_93(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6815
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 6816
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6818

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6821
    self.'optimize_condition'()
.annotate 'line', 6822
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6823
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 6824
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6826
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 6828
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 6830
    .return(self)
# }
.annotate 'line', 6831

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6834
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6835
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6836
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6837
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6838
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6839
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 6840
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 6841
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6842
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 6843
    self.'annotate'(__ARG_1)
.annotate 'line', 6844
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6845
    $P1.'emit'(__ARG_1)
.annotate 'line', 6847
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 6848
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6849
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6850
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 6852
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6853

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 6802
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6804
    addattribute $P0, 'truebranch'
.annotate 'line', 6805
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_93 = "WSubId_93"
# Body
# {
.annotate 'line', 6865
    $P2 = WSubId_93(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6866

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6869
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6870
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6872
    self.'annotate'(__ARG_1)
.annotate 'line', 6873
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6874
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6875
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6876
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6877

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 6860
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6862
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6888
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6889
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6890
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6891

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6894
    self.'optimize_condition'()
.annotate 'line', 6895
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6896
    .return(self)
# }
.annotate 'line', 6897

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6900
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6902
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 6905
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6908
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 6909
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 6911
    self.'annotate'(__ARG_1)
.annotate 'line', 6912
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6913
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6914
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 6915
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6916
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 6918

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 6884
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'DoStatement' ]

.sub 'DoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_94 = "WSubId_94"
# Body
# {
.annotate 'line', 6929
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6930
    self.'parsebody'(__ARG_2)
.annotate 'line', 6931
    WSubId_94('while', __ARG_2)
.annotate 'line', 6932
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6933

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6936
    self.'optimize_condition'()
.annotate 'line', 6937
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 6938
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_2
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6939
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 6940
    setattribute self, 'body', $P1
.annotate 'line', 6941
    .return(self)
# }
.annotate 'line', 6942

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6945
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 6946
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 6947
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 6949
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6952
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 6953
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 6954
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 6956
    self.'annotate'(__ARG_1)
.annotate 'line', 6957
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6959
    $P1.'emit'(__ARG_1)
.annotate 'line', 6960
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6961
    eq $I1, 2, __label_7
.annotate 'line', 6962
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 6963
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 6965

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 6925
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]

.sub 'ContinueStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 6976
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6977
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 6978

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6979
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6982
    self.'annotate'(__ARG_1)
.annotate 'line', 6983
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6984
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6985

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 6972
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 6996
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6997
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 6998

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6999
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7002
    self.'annotate'(__ARG_1)
.annotate 'line', 7003
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7004
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 7005

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 6992
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7020
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7021
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 7022
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 7023
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 7024

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_93 = "WSubId_93"
# Body
# {
.annotate 'line', 7027
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 7028
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_3
    $I1 = $P1.'iskeyword'('default')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 7029
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 7030
    getattribute $P4, self, 'case_value'
    $P5 = WSubId_37(__ARG_1, self)
# predefined push
    push $P4, $P5
.annotate 'line', 7031
    $P1 = __ARG_1.'get'()
.annotate 'line', 7032
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 7033
    WSubId_40("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 7034
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 7035
    $P1 = __ARG_1.'get'()
    $I2 = $P1.'isop'('}')
    if $I2 goto __label_10
    $I2 = $P1.'iskeyword'('case')
  __label_10:
    if $I2 goto __label_9
    $I2 = $P1.'iskeyword'('default')
  __label_9:
    not $I1, $I2
    unless $I1 goto __label_7
# {
.annotate 'line', 7036
    __ARG_1.'unget'($P1)
.annotate 'line', 7037
    $P3 = WSubId_93(__ARG_1, self)
# predefined push
    push $P2, $P3
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 7039
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 7040
    __ARG_1.'unget'($P1)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7043
    $P1 = __ARG_1.'get'()
.annotate 'line', 7044
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 7045
    WSubId_40("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 7046
    $P1 = __ARG_1.'get'()
    $I2 = $P1.'isop'('}')
    if $I2 goto __label_15
    $I2 = $P1.'iskeyword'('case')
  __label_15:
    if $I2 goto __label_14
    $I2 = $P1.'iskeyword'('default')
  __label_14:
    not $I1, $I2
    unless $I1 goto __label_12
# {
.annotate 'line', 7047
    __ARG_1.'unget'($P1)
.annotate 'line', 7048
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_93(__ARG_1, self)
# predefined push
    push $P3, $P4
# }
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 7050
    __ARG_1.'unget'($P1)
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7053
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 7054
    WSubId_40("'}' in switch", $P1)
  __label_16: # endif
# }
.annotate 'line', 7055

.end # parse_cases


.sub 'optimize_cases' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 7058
    getattribute $P2, self, 'case_value'
    WSubId_38($P2)
.annotate 'line', 7059
    getattribute $P2, self, 'case_st'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 7060
    WSubId_38($P1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7061
    getattribute $P2, self, 'default_st'
    WSubId_38($P2)
# }
.annotate 'line', 7062

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 7012
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 7014
    addattribute $P0, 'case_value'
.annotate 'line', 7015
    addattribute $P0, 'case_st'
.annotate 'line', 7016
    addattribute $P0, 'default_st'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 7075
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7076
    $P3 = WSubId_37(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7077
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7078
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7079
    WSubId_40("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7080
    $P1 = __ARG_2.'get'()
.annotate 'line', 7081
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7082
    WSubId_40("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7083
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7084

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7087
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7088
    self.'optimize_cases'()
.annotate 'line', 7089
    .return(self)
# }
.annotate 'line', 7090

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 7094
# type: $S1
    set $S1, ''
.annotate 'line', 7095
    getattribute $P7, self, 'case_value'
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 7096
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7097
    ne $S2, 'N', __label_4
.annotate 'line', 7098
    WSubId_1("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 7099
    ne $S1, '', __label_5
.annotate 'line', 7100
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7101
    eq $S1, $S2, __label_7
.annotate 'line', 7102
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7105
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 7106
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 7110
    ne $S1, '', __label_8
.annotate 'line', 7111
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7113
    __ARG_1.'comment'('switch')
.annotate 'line', 7114
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 7115
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 7116
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7118
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7119
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 7123
    self.'genbreaklabel'()
.annotate 'line', 7124
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7125
    new $P4, ['ResizableStringArray']
.annotate 'line', 7126
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7127
    getattribute $P7, self, 'case_value'
    iter $P10, $P7
    set $P10, 0
  __label_15: # for iteration
    unless $P10 goto __label_16
    shift $P5, $P10
# {
.annotate 'line', 7128
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7129
# predefined push
    push $P4, $S7
.annotate 'line', 7130
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7131
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7133
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7136
    self.'annotate'(__ARG_1)
.annotate 'line', 7137
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 7138
# n: $I1
    set $P7, $P6
    set $I1, $P7
# for loop
.annotate 'line', 7139
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 7140
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.annotate 'line', 7141
    $P7 = $P6[$I2]
    WSubId_52(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 7139
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 7144
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 7145
    getattribute $P7, self, 'default_st'
    WSubId_52(__ARG_1, $P7)
.annotate 'line', 7147
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7148

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 7069
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7071
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7160
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7161
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7162

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7165
    self.'optimize_cases'()
.annotate 'line', 7166
    .return(self)
# }
.annotate 'line', 7167

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 7171
    self.'genbreaklabel'()
.annotate 'line', 7172
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7173
    new $P1, ['ResizableStringArray']
.annotate 'line', 7175
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7176
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7177
    getattribute $P4, self, 'case_value'
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7178
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7179
# predefined push
    push $P1, $S3
.annotate 'line', 7180
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7181
    __ARG_1.'say'('    ', 'if ', $S2, ' goto ', $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7183
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7186
    self.'annotate'(__ARG_1)
.annotate 'line', 7187
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7188
# n: $I1
    set $P4, $P3
    set $I1, $P4
# for loop
.annotate 'line', 7189
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7190
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.annotate 'line', 7191
    $P4 = $P3[$I2]
    WSubId_52(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7189
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7194
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 7195
    getattribute $P4, self, 'default_st'
    WSubId_52(__ARG_1, $P4)
.annotate 'line', 7197
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7198

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 7155
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSwitch' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 7205
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7206
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7207
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7208
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7209
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 7210
    WSubId_40("'(' in switch", $P1)
# }
.annotate 'line', 7211

.end # parseSwitch

.namespace [ 'Winxed'; 'Compiler'; 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 7224
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7225
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7226
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7227
    __ARG_2.'unget'($P1)
.annotate 'line', 7228
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7230
    $P1 = __ARG_2.'get'()
.annotate 'line', 7231
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7232
    __ARG_2.'unget'($P1)
.annotate 'line', 7233
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 7234
    WSubId_54(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7236
    $P1 = __ARG_2.'get'()
.annotate 'line', 7237
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7238
    __ARG_2.'unget'($P1)
.annotate 'line', 7239
    $P3 = WSubId_37(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 7240
    WSubId_54(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7242
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7243

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7246
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_1
.annotate 'line', 7247
    getattribute $P4, self, 'initializer'
    $P3 = $P4.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
.annotate 'line', 7248
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_2
.annotate 'line', 7249
    self.'optimize_condition'()
  __label_2: # endif
.annotate 'line', 7250
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_3
.annotate 'line', 7251
    getattribute $P4, self, 'iteration'
    $P3 = $P4.'optimize'()
    setattribute self, 'iteration', $P3
  __label_3: # endif
.annotate 'line', 7252
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7253
    .return(self)
# }
.annotate 'line', 7254

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7257
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 7258
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7259
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 7260
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7261
    .return()
# }
  __label_1: # endif
.annotate 'line', 7263
    __ARG_1.'comment'('for loop')
.annotate 'line', 7264
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_4
    set $S1, $P1
  __label_4:
.annotate 'line', 7265
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_5
    set $S2, $P1
  __label_5:
.annotate 'line', 7266
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 7267
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_7
.annotate 'line', 7268
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7270
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7271
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_8
.annotate 'line', 7272
    self.'emit_else'(__ARG_1, $S2)
  __label_8: # endif
.annotate 'line', 7274
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7275
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7276
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_9
.annotate 'line', 7277
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
  __label_9: # endif
.annotate 'line', 7278
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7280
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7281

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 7217
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7219
    addattribute $P0, 'initializer'
.annotate 'line', 7220
    addattribute $P0, 'iteration'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]

.sub 'ForeachStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param string __ARG_5
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 7296
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7297
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7298
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7299
# deftype: $S2
    $P1 = WSubId_95(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7300
    self.'createvar'($S1, $S2)
.annotate 'line', 7301
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7303
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7304
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7305
    WSubId_54(')', __ARG_2)
.annotate 'line', 7306
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7307

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7310
    getattribute $P3, self, 'container'
    $P2 = $P3.'optimize'()
    setattribute self, 'container', $P2
.annotate 'line', 7311
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7312
    .return(self)
# }
.annotate 'line', 7313

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 7316
    self.'annotate'(__ARG_1)
.annotate 'line', 7317
# regcont: $S1
    null $S1
.annotate 'line', 7318
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 7319
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 7320
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7321
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7324
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7326
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7327
    unless_null $P1, __label_4
.annotate 'line', 7328
    getattribute $P2, self, 'varname'
    WSubId_59($P2)
  __label_4: # endif
.annotate 'line', 7330
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 7331
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 7332
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 7333
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7334
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7335
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7336
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7337
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7338
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7339
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7340
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7341

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 7288
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7290
    addattribute $P0, 'deftype'
.annotate 'line', 7291
    addattribute $P0, 'varname'
.annotate 'line', 7292
    addattribute $P0, 'container'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseFor' :subid('WSubId_51')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 7348
    WSubId_54('(', __ARG_2)
.annotate 'line', 7349
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7350
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7351
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7352
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7354
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7355
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 7356
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 7357
    __ARG_2.'unget'($P3)
.annotate 'line', 7358
    __ARG_2.'unget'($P2)
.annotate 'line', 7359
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 7361
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7362

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 7374
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7375
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7376

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7379
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7380
    .return(self)
# }
.annotate 'line', 7381

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7384
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7385
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7386
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7387
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 7389
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 7392
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 7395
    WSubId_1("Invalid throw argument", self)
  __label_2: # switch end
# }
.annotate 'line', 7397

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 7368
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7370
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7409
    setattribute self, 'start', __ARG_1
.annotate 'line', 7410
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7411

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7414
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7415
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 7416
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 7417
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7418
    set $S3, $S1
    set $S4, 'min_severity'
    if $S3 == $S4 goto __label_6
    set $S4, 'max_severity'
    if $S3 == $S4 goto __label_7
    set $S4, 'handle_types'
    if $S3 == $S4 goto __label_8
    set $S4, 'handle_types_except'
    if $S3 == $S4 goto __label_9
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 7421
    eq $I1, 1, __label_10
.annotate 'line', 7422
    WSubId_1('Wrong modifier args', self)
  __label_10: # endif
.annotate 'line', 7423
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7424
# argreg: $S2
    $P7 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P7, __label_11
    set $S2, $P7
  __label_11:
.annotate 'line', 7425
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 7429
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7430
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 7431
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7432
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
  __label_12: # for iteration
.annotate 'line', 7430
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 7435
# predefined join
.annotate 'line', 7434
    join $S3, ', ', $P4
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 7438
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    WSubId_1($S4, self)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 7441

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 7404
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7406
    addattribute $P0, 'start'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_2 = "WSubId_2"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 7453
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7454
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7455
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7456
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7458
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7460
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7461
    $P1 = __ARG_2.'get'()
.annotate 'line', 7462
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7463
    WSubId_2('catch', $P1)
  __label_3: # endif
.annotate 'line', 7464
    $P1 = __ARG_2.'get'()
.annotate 'line', 7465
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 7466
    WSubId_40("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 7467
    $P1 = __ARG_2.'get'()
.annotate 'line', 7468
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 7469
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7470
    setattribute self, 'exname', $P1
.annotate 'line', 7471
    self.'createvar'($S1, 'P')
.annotate 'line', 7472
    $P1 = __ARG_2.'get'()
.annotate 'line', 7473
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 7474
    WSubId_40("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 7476
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7477

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7480
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 7481
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 7482
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7483
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7484
    .return(self)
# }
.annotate 'line', 7485

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7488
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7489
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7490
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 7491
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 7492
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 7493
    $P1 = self.'tempreg'('P')
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 7495
    self.'annotate'(__ARG_1)
.annotate 'line', 7496
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7498
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7499
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7501
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 7502
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 7504
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7505
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7506
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7507
    __ARG_1.'comment'('try: end')
.annotate 'line', 7508
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7510
    self.'annotate'(__ARG_1)
.annotate 'line', 7511
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7513
    __ARG_1.'comment'('catch')
.annotate 'line', 7514
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7515
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7516
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7517
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7518
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7520
    __ARG_1.'comment'('catch end')
.annotate 'line', 7521
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7522

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 7444
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7446
    addattribute $P0, 'stry'
.annotate 'line', 7447
    addattribute $P0, 'modifiers'
.annotate 'line', 7448
    addattribute $P0, 'exname'
.annotate 'line', 7449
    addattribute $P0, 'scatch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]

.sub 'initvarbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
# Body
# {
.annotate 'line', 7535
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7536
    setattribute self, 'name', __ARG_3
.annotate 'line', 7537
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7538
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7539

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 7529
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7531
    addattribute $P0, 'name'
.annotate 'line', 7532
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareBase' ]

.sub 'DeclareBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 7554
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7555
    setattribute self, 'name', __ARG_3
.annotate 'line', 7556
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7557

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 7546
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7548
    addattribute $P0, 'name'
.annotate 'line', 7549
    addattribute $P0, 'basetype'
.annotate 'line', 7550
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 7568
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7569
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7570
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7571
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7572
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 7574
    $P5 = WSubId_37(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7577
    __ARG_5.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 7578

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7581
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7582
    if_null $P1, __label_1
.annotate 'line', 7583
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7584
    .return(self)
# }
.annotate 'line', 7585

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7588
    self.'annotate'(__ARG_1)
.annotate 'line', 7589
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7590
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7591
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 7592
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7593
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7595
    isnull $I1, $P1
    if $I1 goto __label_6
    $I1 = $P1.'isnull'()
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 7596
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7598
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_7
    set $S4, $P2
  __label_7:
.annotate 'line', 7599
    ne $S4, $S3, __label_8
# {
.annotate 'line', 7600
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_12
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_12:
    unless $I1 goto __label_10
.annotate 'line', 7601
    $P1.'emit_concat_set'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
.annotate 'line', 7603
    $P1.'emit'(__ARG_1, $S2)
  __label_11: # endif
# }
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 7606
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_13
# {
.annotate 'line', 7608
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 7611
# ireg: $S5
    null $S5
# switch
.annotate 'line', 7612
    set $S7, $S4
    set $S8, 'v'
    if $S7 == $S8 goto __label_17
    set $S8, ''
    if $S7 == $S8 goto __label_18
    goto __label_16
  __label_17: # case
.annotate 'line', 7614
    WSubId_1('Invalid initialization from void value', self)
  __label_18: # case
.annotate 'line', 7616
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_15 # break
  __label_16: # default
.annotate 'line', 7619
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 7620
    $P1.'emit'(__ARG_1, $S5)
  __label_15: # switch end
.annotate 'line', 7622
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_21
    iseq $I1, $S4, 'P'
  __label_21:
    unless $I1 goto __label_19
# {
.annotate 'line', 7623
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_22
    set $S6, $P2
  __label_22:
.annotate 'line', 7624
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7625
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7626
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7627
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_20
  __label_19: # else
.annotate 'line', 7630
    __ARG_1.'emitset'($S2, $S5)
  __label_20: # endif
# }
  __label_14: # endif
# }
  __label_9: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 7634

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 7562
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7564
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]

.sub 'DeclareArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5
        .param pmc __ARG_6
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 7649
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7650
    box $P3, __ARG_5
    setattribute self, 'arraytype', $P3
.annotate 'line', 7651
# var vdata: $P1
    getattribute $P3, self, 'name'
    $P1 = self.'createvar'($P3, 'P')
.annotate 'line', 7652
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7653
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7654
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7656
    __ARG_6.'unget'($P2)
.annotate 'line', 7657
    $P4 = WSubId_37(__ARG_6, self)
    setattribute self, 'size', $P4
.annotate 'line', 7658
    WSubId_54(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 7660
    $P2 = __ARG_6.'get'()
.annotate 'line', 7661
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 7662
    $P2 = __ARG_6.'get'()
.annotate 'line', 7663
    $P3 = $P2.'isop'('[')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 7664
    WSubId_40("array initializer", $P2)
  __label_4: # endif
.annotate 'line', 7665
    $P2 = __ARG_6.'get'()
.annotate 'line', 7666
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_5
# {
.annotate 'line', 7667
    __ARG_6.'unget'($P2)
.annotate 'line', 7668
    $P4 = WSubId_36(__ARG_6, self, WSubId_37, ']')
    setattribute self, 'initarray', $P4
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 7672
    __ARG_6.'unget'($P2)
  __label_3: # endif
# }
.annotate 'line', 7673

.end # DeclareArrayStatement


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 7676
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 7677
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.annotate 'line', 7678
    getattribute $P1, self, 'initarray'
    WSubId_38($P1)
.annotate 'line', 7679
    .return(self)
# }
.annotate 'line', 7680

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7683
    self.'annotate'(__ARG_1)
.annotate 'line', 7685
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7686
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7687
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7688
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7689
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7690
    if_null $P2, __label_1
# {
.annotate 'line', 7692
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 7693
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7697
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 7699
    if_null $P3, __label_4
# {
.annotate 'line', 7700
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7701
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7702
    unless_null $P2, __label_6
# {
.annotate 'line', 7703
    le $I1, 0, __label_7
# {
.annotate 'line', 7705
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 7708
# i: $I2
    null $I2
.annotate 'line', 7709
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 7710
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7711
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7712
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 7715

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 7639
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7641
    addattribute $P0, 'size'
.annotate 'line', 7642
    addattribute $P0, 'initarray'
.annotate 'line', 7643
    addattribute $P0, 'arraytype'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseDeclareHelper' :subid('WSubId_97')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_92 = "WSubId_92"
.const 'Sub' WSubId_96 = "WSubId_96"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 7722
# var next: $P1
    null $P1
.annotate 'line', 7723
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 7724
# {
.annotate 'line', 7725
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 7726
    WSubId_92($P3)
.annotate 'line', 7727
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7728
# var item: $P5
    null $P5
.annotate 'line', 7729
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 7730
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7732
    __ARG_4.'unget'($P4)
.annotate 'line', 7733
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 7735
    $P2 = WSubId_96($P2, $P5)
.annotate 'line', 7736
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 7737
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 7738
    WSubId_4(';', $P1)
.annotate 'line', 7739
    .return($P2)
# }
.annotate 'line', 7740

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7748
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7749

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 7744
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]

.sub 'IntArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7756
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7757

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 7752
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newIntSingle' :subid('WSubId_98')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7763
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7764

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_99')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7768
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7769

.end # newIntArray


.sub 'parseInt' :subid('WSubId_48')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_99 = "WSubId_99"
# Body
# {
.annotate 'line', 7773
    .tailcall WSubId_97(WSubId_98, WSubId_99, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7774

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7782
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7783

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 7778
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]

.sub 'FloatArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7790
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7791

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 7786
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newFloatSingle' :subid('WSubId_100')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7797
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7798

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_101')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7802
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7803

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_100 = "WSubId_100"
.const 'Sub' WSubId_101 = "WSubId_101"
# Body
# {
.annotate 'line', 7807
    .tailcall WSubId_97(WSubId_100, WSubId_101, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7808

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7816
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7817

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 7812
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]

.sub 'StringArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7824
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7825

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 7820
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newStringSingle' :subid('WSubId_102')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7831
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7832

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7836
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7837

.end # newStringArray


.sub 'parseString' :subid('WSubId_47')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_102 = "WSubId_102"
.const 'Sub' WSubId_103 = "WSubId_103"
# Body
# {
.annotate 'line', 7841
    .tailcall WSubId_97(WSubId_102, WSubId_103, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7842

.end # parseString

.namespace [ 'Winxed'; 'Compiler'; 'ConstStatement' ]

.sub 'ConstStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 7858
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7859
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7860
    setattribute self, 'name', __ARG_4
.annotate 'line', 7861
    setattribute self, 'value', __ARG_5
.annotate 'line', 7862
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
# }
.annotate 'line', 7863

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7866
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7867
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7868
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 7869
    $P1 = $P1.'optimize'()
.annotate 'line', 7870
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.annotate 'line', 7871
    WSubId_1('Value for const is not evaluable at compile time', self)
# }
  __label_2: # endif
.annotate 'line', 7874
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 7875
    .return(self)
# }
.annotate 'line', 7876

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7879
    getattribute $P1, self, 'start'
    WSubId_6('Direct use of const', $P1)
# }
.annotate 'line', 7880

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7883
# predefined string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7884

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 7848
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7850
    addattribute $P0, 'type'
.annotate 'line', 7851
    addattribute $P0, 'name'
.annotate 'line', 7852
    addattribute $P0, 'data'
.annotate 'line', 7853
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseConst' :subid('WSubId_44')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_96 = "WSubId_96"
# Body
# {
.annotate 'line', 7889
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7890
# type: $S1
    $P5 = WSubId_95($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 7891
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7892
    WSubId_1('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 7894
# var multi: $P2
    null $P2
  __label_5: # do
.annotate 'line', 7895
# {
.annotate 'line', 7896
    $P1 = __ARG_2.'get'()
.annotate 'line', 7897
# var name: $P3
    set $P3, $P1
.annotate 'line', 7898
    WSubId_54('=', __ARG_2)
.annotate 'line', 7899
# var value: $P4
    $P4 = WSubId_37(__ARG_2, __ARG_3)
.annotate 'line', 7901
    new $P6, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 7900
    $P2 = WSubId_96($P2, $P5)
# }
  __label_7: # continue
.annotate 'line', 7902
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 7903
    .return($P2)
# }
.annotate 'line', 7904

.end # parseConst

.namespace [ 'Winxed'; 'Compiler'; 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 7915
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7916
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7917
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 7918
    $P4 = WSubId_37(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 7919
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.annotate 'line', 7921
    WSubId_4(';', $P1)
# }
.annotate 'line', 7922

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 7925
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 7926
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7927
    .return(self)
# }
.annotate 'line', 7928

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7931
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7932

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7935
    self.'annotate'(__ARG_1)
.annotate 'line', 7936
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7937
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7938
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7939
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 7940
    if_null $P1, __label_3
.annotate 'line', 7941
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 7942
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 7943
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 7944
    $P2 = $P1.'checkresult'()
    set $S4, $P2
    set $S5, 'P'
    if $S4 == $S5 goto __label_9
    set $S5, 'S'
    if $S4 == $S5 goto __label_10
    set $S5, 'I'
    if $S4 == $S5 goto __label_11
    set $S5, 'N'
    if $S4 == $S5 goto __label_12
    set $S5, 'v'
    if $S4 == $S5 goto __label_13
    goto __label_8
  __label_9: # case
.annotate 'line', 7946
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 7947
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 7949
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 7954
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_18
    set $S3, $P3
  __label_18:
.annotate 'line', 7955
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 7958
    getattribute $P4, self, 'name'
    WSubId_1("Can't use void function as initializer", $P4)
  __label_8: # default
.annotate 'line', 7960
    getattribute $P5, self, 'name'
    WSubId_1("Invalid var initializer", $P5)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 7964
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 7965

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 7910
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7912
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 7972
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7973
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 7974

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7977
    self.'annotate'(__ARG_1)
.annotate 'line', 7978
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7979
# predefined string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 7980
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7981

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 7968
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 7990
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7991
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 7992
    WSubId_54(']', __ARG_2)
.annotate 'line', 7993
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 7994

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7997
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 7998
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7999

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8002
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8003
    self.'annotate'(__ARG_1)
.annotate 'line', 8004
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8005
# predefined string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8006
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 8007

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 7984
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 7986
    addattribute $P0, 'exprsize'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseVar' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.const 'Sub' WSubId_92 = "WSubId_92"
# Body
# {
.annotate 'line', 8012
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8013
    WSubId_92($P1)
.annotate 'line', 8014
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8015
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8016
    $P2 = __ARG_2.'get'()
.annotate 'line', 8017
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 8018
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 8020
    __ARG_2.'unget'($P2)
.annotate 'line', 8021
    new $P4, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
    $P4.'FixedVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
# }
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8025
    __ARG_2.'unget'($P2)
.annotate 'line', 8026
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 8028

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_45')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_46 = "WSubId_46"
# Body
# {
.annotate 'line', 8032
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8033
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8034
    WSubId_1("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 8035
    .tailcall WSubId_46(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 8036

.end # parseVolatile

.namespace [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8049
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8050
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 8051
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 8052
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 8053
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8054
    __ARG_2.'unget'($P1)
.annotate 'line', 8055
# var c: $P2
    $P2 = WSubId_93(__ARG_2, self)
.annotate 'line', 8056
    unless_null $P2, __label_3
.annotate 'line', 8057
    WSubId_6('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 8058
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8060
    setattribute self, 'end', $P1
# }
.annotate 'line', 8061

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8064
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8065
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8066
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8067
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8068
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 8069
    .return($S2)
# }
.annotate 'line', 8070

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8073
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8074
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8075
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8076
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8077
    WSubId_1('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 8078
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 8079
    $P1[$S1] = $S3
.annotate 'line', 8080
    .return($S3)
# }
.annotate 'line', 8081

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 8082
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8085
    __ARG_1.'comment'('{')
.annotate 'line', 8086
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8087
    $P1.'emit'(__ARG_1)
.annotate 'line', 8088
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8090
    __ARG_1.'comment'('}')
# }
.annotate 'line', 8091

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 8042
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8044
    addattribute $P0, 'end'
.annotate 'line', 8045
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8106
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 8108
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 8109
    new $P1, ['ResizableStringArray']
.annotate 'line', 8110
    new $P2, ['ResizableStringArray']
.annotate 'line', 8111
    setattribute self, 'tempreg', $P1
.annotate 'line', 8112
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 8113

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 8116
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 8117
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8118
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 8119
    assign $P1, $I1
# predefined string
.annotate 'line', 8120
    getattribute $P2, self, 'type'
.annotate 'line', 8115
    set $S2, $P2
.annotate 'line', 8120
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
# }
.annotate 'line', 8121

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 8124
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8125
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8126
# reg: $S1
    null $S1
.annotate 'line', 8127
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_1
.annotate 'line', 8128
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8130
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 8131
# predefined push
    push $P2, $S1
.annotate 'line', 8132
    .return($S1)
# }
.annotate 'line', 8133

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8136
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8137
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8138
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 8139
# i: $I2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 8140
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 8141
# predefined push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 8139
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 8143
    assign $P2, 0
# }
.annotate 'line', 8144

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 8100
    addattribute $P0, 'type'
.annotate 'line', 8101
    addattribute $P0, 'nreg'
.annotate 'line', 8102
    addattribute $P0, 'tempreg'
.annotate 'line', 8103
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8155
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8156

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8159
# var named: $P1
    null $P1
.annotate 'line', 8160
# var slurpy: $P2
    null $P2
.annotate 'line', 8161
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8162
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 8163
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 8164
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8166
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8169
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8172
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8176
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 8183
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 8200
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 8181
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 8184
# setname: $S2
    null $S2
# switch
.annotate 'line', 8185
    $P7 = $P1.'numargs'()
    set $I2, $P7
    null $I3
    if $I2 == $I3 goto __label_16
    set $I3, 1
    if $I2 == $I3 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 8187
    concat $S0, "'", __ARG_3
    concat $S0, $S0, "'"
    set $S2, $S0
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 8190
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8191
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 8192
    WSubId_1('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 8193
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 8196
    WSubId_1('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 8198
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8201
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8202
# }
.annotate 'line', 8204

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 8151
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_95 = "WSubId_95"
# Body
# {
.annotate 'line', 8214
    setattribute self, 'func', __ARG_1
.annotate 'line', 8215
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8216
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_95($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8217
    eq $S1, '', __label_2
.annotate 'line', 8218
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8220
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8221
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 8222
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8224
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8225
    $P1 = __ARG_2.'get'()
.annotate 'line', 8226
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8227
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 8229
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8230

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_104 = "WSubId_104"
# Body
# {
.annotate 'line', 8233
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8234
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8235
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8236
# ptype: $S2
    $P5 = $P2.'gettype'()
    $P4 = WSubId_104($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8237
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8238
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8239
    if_null $P3, __label_3
.annotate 'line', 8240
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8241
    __ARG_1.'say'('')
# }
.annotate 'line', 8242

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 8209
    addattribute $P0, 'func'
.annotate 'line', 8210
    addattribute $P0, 'name'
.annotate 'line', 8211
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8247
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8248

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8259
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 8260
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 8261

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 8264
# var ns: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 8265
# var path: $P2
    $P2 = $P1.'getpath'()
.annotate 'line', 8266
# key: $S1
    null $S1
.annotate 'line', 8267
# predefined elements
    elements $I1, $P2
    le $I1, 0, __label_1
.annotate 'line', 8268
    $P3 = WSubId_58($P2)
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 8269
# reg: $S2
    $P3 = __ARG_2.'tempreg'('P')
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 8270
    getattribute $P3, self, 'name'
    __ARG_1.'emitget_hll_global'($S2, $P3, $S1)
.annotate 'line', 8271
    .return($S2)
# }
.annotate 'line', 8272

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 8254
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8256
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8283
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8284

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8287
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 8288
# nargmods: $I1
    $P5 = $P1.'numargs'()
    set $I1, $P5
.annotate 'line', 8289
    $P3 = $P1.'getname'()
    __ARG_1.'print'(' :', $P3)
.annotate 'line', 8290
    le $I1, 0, __label_3
# {
.annotate 'line', 8291
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8292
# iargmod: $I2
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
# {
.annotate 'line', 8293
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8294
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_7
.annotate 'line', 8295
    WSubId_1('Invalid modifier', $P2)
  __label_7: # endif
.annotate 'line', 8296
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
# }
  __label_4: # for iteration
.annotate 'line', 8292
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 8298
    __ARG_1.'print'(')')
# }
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8301

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 8279
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8324
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8325
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8326
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8327
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8328
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8329
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8330

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8332
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8336
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8337
    unless_null $P1, __label_1
.annotate 'line', 8338
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 8339
    .return($P1)
# }
.annotate 'line', 8340

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8343
# var used: $P1
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 8344
    unless_null $P1, __label_1
.annotate 'line', 8345
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 8346
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8347

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8351
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8352
    .return($I1)
# }
.annotate 'line', 8353

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_105 = "WSubId_105"
# Body
# {
.annotate 'line', 8356
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8357
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8358
    __ARG_1.'unget'($P1)
.annotate 'line', 8359
    $P3 = WSubId_36(__ARG_1, self, WSubId_105, ')')
    setattribute self, 'params', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 8361

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8365
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8366
    unless_null $P1, __label_1
.annotate 'line', 8367
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8369
# predefined push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 8370

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8373
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8374
    unless_null $P1, __label_1
# {
.annotate 'line', 8376
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, __ARG_1
    setattribute self, 'usednamespaces', $P4
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8379
    iter $P6, $P1
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P2, $P6
.annotate 'line', 8380
    ne_addr __ARG_1, $P2, __label_5
.annotate 'line', 8381
    .return()
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8382
# predefined push
    push $P1, __ARG_1
# }
  __label_2: # endif
# }
.annotate 'line', 8384

.end # usenamespace


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8387
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8388
    if_null $P1, __label_1
# {
.annotate 'line', 8389
# var found: $P2
    null $P2
.annotate 'line', 8390
    iter $P4, $P1
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P3, $P4
# {
.annotate 'line', 8391
    $P2 = $P3.'findsymbol'(__ARG_1)
.annotate 'line', 8392
    if_null $P2, __label_4
.annotate 'line', 8393
    .return($P2)
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8396
    getattribute $P5, self, 'owner'
    .tailcall $P5.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8397

.end # findsymbol


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8401
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8402
    if_null $P1, __label_1
# {
.annotate 'line', 8403
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 8404
    $P2.'fixnamespaces'()
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8406
    getattribute $P6, self, 'body'
    $P5 = $P6.'optimize'()
    setattribute self, 'body', $P5
.annotate 'line', 8407
    .return(self)
# }
.annotate 'line', 8408

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8412
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8413
    unless_null $P1, __label_1
.annotate 'line', 8414
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 8415
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8416

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8419
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8420
    unless_null $P1, __label_1
.annotate 'line', 8421
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 8422
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8423

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8428
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8429
# lexname: $S1
    null $S1
.annotate 'line', 8430
    if_null $P1, __label_1
.annotate 'line', 8431
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8433
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 8434
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8435
# predefined string
    set $S3, $I1
    concat $S0, '__WLEX_', $S3
    set $S1, $S0
.annotate 'line', 8436
    self.'setlex'($S1, $S2)
.annotate 'line', 8437
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 8439
    .return($S1)
# }
.annotate 'line', 8440

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8444
# var store: $P1
    null $P1
# switch
.annotate 'line', 8445
    set $S2, __ARG_1
    set $S3, 'I'
    if $S2 == $S3 goto __label_3
    set $S3, 'N'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    set $S3, 'P'
    if $S2 == $S3 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 8447
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8449
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8451
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8453
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8455
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8457
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8458
    .return($S1)
# }
.annotate 'line', 8459

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8462
# var store: $P1
    null $P1
# switch
.annotate 'line', 8463
    set $S2, __ARG_1
    set $S3, 'I'
    if $S2 == $S3 goto __label_3
    set $S3, 'N'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    set $S3, 'P'
    if $S2 == $S3 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 8465
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8467
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8469
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8471
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8473
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8475
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8476
    .return($S1)
# }
.annotate 'line', 8477

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8480
    root_new $P2, ['parrot';'ResizablePMCArray']
    getattribute $P4, self, 'regstI'
    push $P2, $P4
    getattribute $P5, self, 'regstN'
    push $P2, $P5
    getattribute $P6, self, 'regstS'
    push $P2, $P6
    getattribute $P7, self, 'regstP'
    push $P2, $P7
    iter $P8, $P2
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
.annotate 'line', 8481
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8482

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8485
# n: $I1
    getattribute $P2, self, 'nlabel'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 8484
    set $S1, $I1
.annotate 'line', 8486
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 8487

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8490
    WSubId_1('break not allowed here', __ARG_1)
# }
.annotate 'line', 8491

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8494
    WSubId_1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8495

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 8499
# name: $S1
    getattribute $P10, self, 'name'
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
  __label_1:
.annotate 'line', 8500
    __ARG_1.'say'()
.annotate 'line', 8501
    __ARG_1.'print'(".sub ")
.annotate 'line', 8502
    $P10 = self.'isanonymous'()
    if_null $P10, __label_2
    unless $P10 goto __label_2
.annotate 'line', 8503
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 8505
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 8506
    getattribute $P10, self, 'subid'
    if_null $P10, __label_4
.annotate 'line', 8507
    getattribute $P11, self, 'subid'
    __ARG_1.'print'(" :subid('", $P11, "')")
  __label_4: # endif
.annotate 'line', 8508
    getattribute $P10, self, 'outer'
    if_null $P10, __label_5
# {
.annotate 'line', 8509
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8510
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8511
    if_null $P2, __label_6
.annotate 'line', 8512
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 8516
    $P10 = self.'ismethod'()
    if_null $P10, __label_7
    unless $P10 goto __label_7
.annotate 'line', 8517
    __ARG_1.'print'(' :method')
  __label_7: # endif
.annotate 'line', 8518
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8519
    if_null $P3, __label_8
.annotate 'line', 8520
    $P3.'emit'(__ARG_1)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8522
    ne $S1, 'main', __label_10
.annotate 'line', 8523
    __ARG_1.'print'(' :main')
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 8525
    __ARG_1.'say'()
.annotate 'line', 8528
    getattribute $P10, self, 'params'
    WSubId_52(__ARG_1, $P10)
.annotate 'line', 8530
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 8531
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 8532
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P5
    not $I1
  __label_12:
    unless $I1 goto __label_11
# {
.annotate 'line', 8533
    getattribute $P10, self, 'start'
    __ARG_1.'annotate'($P10)
.annotate 'line', 8535
    if_null $P4, __label_13
# {
.annotate 'line', 8536
    iter $P12, $P4
    set $P12, 0
  __label_14: # for iteration
    unless $P12 goto __label_15
    shift $S2, $P12
.annotate 'line', 8537
    $P10 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P10, "', ", $S2)
    goto __label_14
  __label_15: # endfor
# }
  __label_13: # endif
.annotate 'line', 8540
    if_null $P5, __label_16
# {
.annotate 'line', 8541
    iter $P13, $P5
    set $P13, 0
  __label_17: # for iteration
    unless $P13 goto __label_18
    shift $S3, $P13
# {
.annotate 'line', 8542
# predefined substr
    substr $S5, $S3, 0, 1
    eq $S5, '$', __label_19
.annotate 'line', 8543
    concat $S6, "    .local pmc ", $S3
    __ARG_1.'say'($S6)
  __label_19: # endif
.annotate 'line', 8544
    $P10 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P10)
# }
    goto __label_17
  __label_18: # endfor
# }
  __label_16: # endif
# }
  __label_11: # endif
.annotate 'line', 8549
# var usedsubids: $P6
    getattribute $P6, self, 'usedsubids'
.annotate 'line', 8550
    if_null $P6, __label_20
# {
.annotate 'line', 8551
    iter $P14, $P6
    set $P14, 0
  __label_21: # for iteration
    unless $P14 goto __label_22
    shift $S4, $P14
# {
.annotate 'line', 8553
    __ARG_1.'say'(".const 'Sub' ", $S4, ' = "', $S4, '"')
# }
    goto __label_21
  __label_22: # endfor
# }
  __label_20: # endif
.annotate 'line', 8557
# var body: $P7
    getattribute $P7, self, 'body'
.annotate 'line', 8558
    $P10 = $P7.'isempty'()
    if_null $P10, __label_23
    unless $P10 goto __label_23
.annotate 'line', 8559
    __ARG_1.'comment'('Empty body')
    goto __label_24
  __label_23: # else
# {
.annotate 'line', 8561
    __ARG_1.'comment'('Body')
.annotate 'line', 8562
    $P7.'emit'(__ARG_1)
.annotate 'line', 8563
    $P10 = $P7.'getend'()
    __ARG_1.'annotate'($P10)
# }
  __label_24: # endif
.annotate 'line', 8565
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8568
# var localfun: $P8
    getattribute $P8, self, 'localfun'
.annotate 'line', 8569
    if_null $P8, __label_25
# {
.annotate 'line', 8570
    iter $P15, $P8
    set $P15, 0
  __label_26: # for iteration
    unless $P15 goto __label_27
    shift $P9, $P15
.annotate 'line', 8571
    $P9.'emit'(__ARG_1)
    goto __label_26
  __label_27: # endfor
# }
  __label_25: # endif
# }
.annotate 'line', 8573

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 8304
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8306
    addattribute $P0, 'name'
.annotate 'line', 8307
    addattribute $P0, 'subid'
.annotate 'line', 8308
    addattribute $P0, 'modifiers'
.annotate 'line', 8309
    addattribute $P0, 'params'
.annotate 'line', 8310
    addattribute $P0, 'body'
.annotate 'line', 8311
    addattribute $P0, 'regstI'
.annotate 'line', 8312
    addattribute $P0, 'regstN'
.annotate 'line', 8313
    addattribute $P0, 'regstS'
.annotate 'line', 8314
    addattribute $P0, 'regstP'
.annotate 'line', 8315
    addattribute $P0, 'nlabel'
.annotate 'line', 8316
    addattribute $P0, 'localfun'
.annotate 'line', 8317
    addattribute $P0, 'lexicals'
.annotate 'line', 8318
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8319
    addattribute $P0, 'usedsubids'
.annotate 'line', 8320
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8587
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8588
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8589
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8590
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8591

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8593
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# predefined int
.annotate 'line', 8597
    getattribute $P1, self, 'paramnum'
    inc $P1
.annotate 'line', 8595
    set $I1, $P1
.annotate 'line', 8597
    .return($I1)
# }
.annotate 'line', 8598

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# predefined int
.annotate 'line', 8602
    getattribute $P1, self, 'lexnum'
    inc $P1
.annotate 'line', 8600
    set $I1, $P1
.annotate 'line', 8602
    .return($I1)
# }
.annotate 'line', 8603

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8604
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 8608
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8609
    setattribute self, 'name', $P1
.annotate 'line', 8610
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8611
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 8612
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P9, self, 'owner'
    $P8.'FunctionModifierList'(__ARG_1, $P9)
    set $P7, $P8
    setattribute self, 'modifiers', $P7
.annotate 'line', 8613
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.annotate 'line', 8615
    WSubId_4('(', $P2)
.annotate 'line', 8616
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8618
# var fullname: $P3
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getpath'()
# predefined clone
    clone $P3, $P5
.annotate 'line', 8619
    $P5 = $P1.'getidentifier'()
# predefined push
    push $P3, $P5
.annotate 'line', 8620
# var cfunction: $P4
    $P4 = self.'createconst'('__FUNCTION__', 'S')
.annotate 'line', 8621
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 8622
    new $P8, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P9, $P1, 'file'
    getattribute $P10, $P1, 'line'
.annotate 'line', 8623
# predefined join
.annotate 'line', 8621
    join $S1, '.', $P3
    $P8.'TokenQuoted'($P9, $P10, $S1)
    set $P7, $P8
    $P6.'StringLiteral'(self, $P7)
    set $P5, $P6
    $P4.'setvalue'($P5)
.annotate 'line', 8625
    $P2 = __ARG_1.'get'()
.annotate 'line', 8626
    $P5 = $P2.'isop'('{')
    isfalse $I1, $P5
    unless $I1 goto __label_2
.annotate 'line', 8627
    WSubId_2('{', $P2)
  __label_2: # endif
.annotate 'line', 8628
    new $P7, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P7.'CompoundStatement'($P2, __ARG_1, self)
    set $P6, $P7
    setattribute self, 'body', $P6
.annotate 'line', 8629
    .return(self)
# }
.annotate 'line', 8630

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 8580
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8582
    addattribute $P0, 'paramnum'
.annotate 'line', 8583
    addattribute $P0, 'lexnum'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 8641
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8642
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8643
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8644
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8645
    setattribute self, 'name', $P1
.annotate 'line', 8646
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8647
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8648
    WSubId_4('{', $P2)
.annotate 'line', 8649
    new $P5, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 8650
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8651

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8652
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8653
    .return(0)
# }

.end # ismethod


.sub 'needclosure' :method
# Body
# {
.annotate 'line', 8656
    getattribute $P3, self, 'lexicals'
    isnull $I1, $P3
    not $I1
    if $I1 goto __label_2
    getattribute $P4, self, 'usedlexicals'
    isnull $I1, $P4
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 8657
    .return(1)
  __label_1: # endif
.annotate 'line', 8658
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8659
    if_null $P1, __label_3
# {
.annotate 'line', 8660
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P2, $P5
.annotate 'line', 8661
    $P3 = $P2.'needclosure'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 8662
    .return(1)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
# }
  __label_3: # endif
.annotate 'line', 8664
    .return(0)
# }
.annotate 'line', 8665

.end # needclosure


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8668
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8669

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8673
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8674

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8678
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8679

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8682
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 8683
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 8684
# reg: $S1
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 8686
# predefined substr
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 8687
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 8688
# var scope: $P1
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 8689
# var ownerscope: $P2
    $P2 = $P1.'getouter'()
.annotate 'line', 8690
# var outer: $P3
    getattribute $P3, self, 'outer'
.annotate 'line', 8691
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
# {
.annotate 'line', 8692
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 8693
# lexname: $S2
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 8694
# flags: $I1
    $I2 = __ARG_2.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8695
# type: $S3
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 8696
    eq $S3, 'P', __label_8
.annotate 'line', 8697
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 8698
# var lexused: $P4
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 8699
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 8700
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 8701
    .return($P4)
# }
  __label_5: # endif
# }
  __label_4: # endif
.annotate 'line', 8704
    .return(__ARG_2)
# }
.annotate 'line', 8705

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8708
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8709
    unless_null $P1, __label_1
.annotate 'line', 8710
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 8711
    unless_null $P1, __label_2
# {
.annotate 'line', 8714
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 8715
    unless_null $P1, __label_3
# {
.annotate 'line', 8717
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
# {
.annotate 'line', 8718
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8719
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 8720
# lexself: $S1
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 8721
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8722
# reg: $S2
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 8723
    self.'setusedlex'($S1, $S2)
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 8727
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 8729
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 8730
    WSubId_6('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 8731
    .return($P1)
# }
.annotate 'line', 8732

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 8637
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MethodStatement' ]

.sub 'MethodStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8743
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8744

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8745
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 8739
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_95 = "WSubId_95"
# Body
# {
.annotate 'line', 8759
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8760
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 8761
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 8762
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8763
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 8764
# type: $S1
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_95($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 8765
    set $P1, $P2
.annotate 'line', 8766
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 8767
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 8769
    setattribute self, 'name', $P1
.annotate 'line', 8770
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 8771
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 8772
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 8773
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 8775
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 8776

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8779
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 8780
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 8781
    if_null $P1, __label_1
# {
.annotate 'line', 8782
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8783
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 8785

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 8754
    addattribute $P0, 'name'
.annotate 'line', 8755
    addattribute $P0, 'modifiers'
.annotate 'line', 8756
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_106')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8790
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8791

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_106 = "WSubId_106"
# Body
# {
.annotate 'line', 8798
    $P2 = WSubId_36(__ARG_1, __ARG_2, WSubId_106, ')')
    setattribute self, 'params', $P2
# }
.annotate 'line', 8799

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8802
    __ARG_1.'print'('(')
.annotate 'line', 8803
# sep: $S1
    set $S1, ''
.annotate 'line', 8804
    getattribute $P2, self, 'params'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8805
    __ARG_1.'print'($S1)
.annotate 'line', 8806
    $P1.'emit'(__ARG_1)
.annotate 'line', 8807
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8809
    __ARG_1.'print'(')')
# }
.annotate 'line', 8810

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 8795
    addattribute $P0, 'params'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]

.sub 'MultiAssignStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8819
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8820
    setattribute self, 'params', __ARG_3
.annotate 'line', 8821
    setattribute self, 'expr', __ARG_4
# }
.annotate 'line', 8822

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8825
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 8826
    .return(self)
# }
.annotate 'line', 8827

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8830
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 8831
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 8832
    WSubId_1('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 8833
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 8834
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 8835
    __ARG_1.'print'('    ')
.annotate 'line', 8836
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8837
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 8838
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 8839
    __ARG_1.'say'()
# }
.annotate 'line', 8840

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 8813
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8815
    addattribute $P0, 'params'
.annotate 'line', 8816
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant CLASSSPECIFIER_invalid evaluated at compile time
# Constant CLASSSPECIFIER_str evaluated at compile time
# Constant CLASSSPECIFIER_parrotkey evaluated at compile time
# Constant CLASSSPECIFIER_id evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]

.sub 'ClassSpecifier' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8857
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8858

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8859
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8863
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8864

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 8853
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8872
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8873
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8874

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8875
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8879
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8880
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8881

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 8867
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8869
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 8890
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8891
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8892
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8893
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 8894
    WSubId_40('literal string', $P2)
  __label_1: # endif
.annotate 'line', 8895
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8896
    $P2 = __ARG_1.'get'()
.annotate 'line', 8897
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 8898
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 8900
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 8904
    WSubId_41('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 8906
# {
.annotate 'line', 8907
    $P2 = __ARG_1.'get'()
.annotate 'line', 8908
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 8909
    WSubId_40('literal string', $P2)
  __label_10: # endif
.annotate 'line', 8910
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 8911
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 8912
    WSubId_4(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 8914
    setattribute self, 'key', $P1
# }
.annotate 'line', 8915

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8916
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 8919
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8920

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 8924
    getattribute $P2, self, 'key'
    $P1 = WSubId_58($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 8925

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 8884
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8886
    addattribute $P0, 'key'
.annotate 'line', 8887
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8933
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8934
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 8935
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 8936
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8937
    $P2 = __ARG_1.'get'()
.annotate 'line', 8938
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8940
    __ARG_1.'unget'($P2)
.annotate 'line', 8941
    setattribute self, 'key', $P1
# }
.annotate 'line', 8942

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8943
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 8947
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 8948
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 8949

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 8953
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8954
    unless_null $P1, __label_1
# {
.annotate 'line', 8955
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 8956
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    WSubId_67($S2)
  __label_3: # endif
.annotate 'line', 8957
    getattribute $P3, self, 'key'
    $P2 = WSubId_58($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 8959
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 8960

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 8928
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8930
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClassSpecifier' :subid('WSubId_60')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8965
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8966
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8967
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 8968
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8969
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 8970
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 8971
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 8972
    WSubId_1('Invalid class', $P1)
# }
.annotate 'line', 8973

.end # parseClassSpecifier

.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8985
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8986
    setattribute self, 'name', __ARG_2
.annotate 'line', 8987
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 8988
    getattribute $P2, self, 'name'
# predefined push
    push $P1, $P2
.annotate 'line', 8989
    setattribute self, 'classns', $P1
# }
.annotate 'line', 8990

.end # ClassBase


.sub 'getclasskey' :method
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 8993
    getattribute $P1, self, 'classns'
    .tailcall WSubId_58($P1)
# }
.annotate 'line', 8994

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 8979
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8981
    addattribute $P0, 'name'
.annotate 'line', 8982
    addattribute $P0, 'classns'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_60 = "WSubId_60"
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 9007
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9008
    setattribute self, 'parent', __ARG_3
.annotate 'line', 9009
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9010
    setattribute self, 'functions', $P1
.annotate 'line', 9011
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 9012
    setattribute self, 'members', $P2
.annotate 'line', 9013
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9014
    setattribute self, 'constants', $P3
.annotate 'line', 9016
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 9017
    $P8 = $P4.'isop'(':')
    if_null $P8, __label_1
    unless $P8 goto __label_1
# {
.annotate 'line', 9018
    $P10 = WSubId_36(__ARG_4, self, WSubId_60)
    setattribute self, 'bases', $P10
.annotate 'line', 9019
    $P4 = __ARG_4.'get'()
# }
  __label_1: # endif
.annotate 'line', 9021
    WSubId_4('{', $P4)
# for loop
.annotate 'line', 9022
    $P4 = __ARG_4.'get'()
  __label_4: # for condition
    $P8 = $P4.'isop'('}')
    isfalse $I1, $P8
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 9023
    $P9 = $P4.'checkkeyword'()
    set $S1, $P9
    set $S2, 'function'
    if $S1 == $S2 goto __label_7
    set $S2, 'var'
    if $S1 == $S2 goto __label_8
    set $S2, 'const'
    if $S1 == $S2 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 9025
# var f: $P5
    new $P5, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P5.'MethodStatement'($P4, __ARG_4, self)
.annotate 'line', 9026
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9029
# var name: $P6
    $P6 = __ARG_4.'get'()
.annotate 'line', 9030
    $P10 = $P6.'isidentifier'()
    isfalse $I2, $P10
    unless $I2 goto __label_10
.annotate 'line', 9031
    WSubId_40("member identifier", $P6)
  __label_10: # endif
.annotate 'line', 9032
# predefined push
    push $P2, $P6
.annotate 'line', 9033
    $P4 = __ARG_4.'get'()
.annotate 'line', 9034
    $P11 = $P4.'isop'(';')
    isfalse $I3, $P11
    unless $I3 goto __label_11
.annotate 'line', 9035
    WSubId_40("';' in member declaration", $P4)
  __label_11: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9038
# var cst: $P7
    $P7 = WSubId_44($P4, __ARG_4, self)
.annotate 'line', 9039
# predefined push
    push $P3, $P7
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9042
    WSubId_41("item in class", $P4)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 9022
    $P4 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 9045

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9048
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 9049

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9052
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9053

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9056
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 9057

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9060
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 9061

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9064
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 9065

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9068
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9069

.end # use_predef


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 9072
    getattribute $P1, self, 'constants'
    WSubId_38($P1)
.annotate 'line', 9073
    getattribute $P1, self, 'functions'
    WSubId_38($P1)
.annotate 'line', 9074
    .return(self)
# }
.annotate 'line', 9075

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 9078
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 9079
    $P5 = WSubId_107($P1)
    __ARG_1.'say'($P5)
.annotate 'line', 9080
    getattribute $P5, self, 'functions'
    WSubId_52(__ARG_1, $P5)
.annotate 'line', 9082
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 9084
    $P5 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P5)
.annotate 'line', 9085
# n: $I1
    set $I1, 1
.annotate 'line', 9086
# var bases: $P2
    getattribute $P2, self, 'bases'
.annotate 'line', 9087
    if_null $P2, __label_1
# {
.annotate 'line', 9088
    getattribute $P5, self, 'bases'
    iter $P6, $P5
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P3, $P6
# {
.annotate 'line', 9089
    $P3.'annotate'(__ARG_1)
.annotate 'line', 9090
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 9091
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 9092
    getattribute $P5, self, 'parent'
    $P3.'emit'(__ARG_1, $P5)
.annotate 'line', 9093
    __ARG_1.'say'()
.annotate 'line', 9094
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 9097
    getattribute $P5, self, 'members'
    iter $P7, $P5
    set $P7, 0
  __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 9098
    __ARG_1.'annotate'($P4)
.annotate 'line', 9099
    __ARG_1.'say'('    ', "addattribute $P0, '", $P4, "'")
# }
    goto __label_4
  __label_5: # endfor
.annotate 'line', 9102
    __ARG_1.'say'('.end')
# }
.annotate 'line', 9103

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 8997
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 8999
    addattribute $P0, 'parent'
.annotate 'line', 9000
    addattribute $P0, 'bases'
.annotate 'line', 9001
    addattribute $P0, 'constants'
.annotate 'line', 9002
    addattribute $P0, 'functions'
.annotate 'line', 9003
    addattribute $P0, 'members'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9110
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9111

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9114
    .return(self)
# }
.annotate 'line', 9115

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 9106
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClass' :subid('WSubId_108')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9123
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9124
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9125
    $I1 = $P2.'isop'(';')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('.')
  __label_3:
    unless $I1 goto __label_1
# {
# for loop
  __label_6: # for condition
.annotate 'line', 9126
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 9127
# predefined string
    set $S1, $P1
    __ARG_3 = __ARG_3.'declarenamespace'($P1, $S1)
.annotate 'line', 9128
    $P1 = __ARG_2.'get'()
# }
  __label_4: # for iteration
.annotate 'line', 9126
    $P2 = __ARG_2.'get'()
    goto __label_6
  __label_5: # for end
.annotate 'line', 9130
    WSubId_4(';', $P2)
.annotate 'line', 9131
    new $P4, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P4.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P3, $P4
    __ARG_3.'declareclass'($P3)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9134
    __ARG_2.'unget'($P2)
.annotate 'line', 9135
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P4.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P3, $P4
    __ARG_3.'addclass'($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 9137

.end # parseClass


.sub 'include_parrot' :subid('WSubId_110')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 9145
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9146
    $P7 = $P1.'isstring'()
    isfalse $I4, $P7
    unless $I4 goto __label_1
.annotate 'line', 9147
    WSubId_40('literal string', $P1)
  __label_1: # endif
.annotate 'line', 9148
    WSubId_54(';', __ARG_2)
.annotate 'line', 9149
# filename: $S1
    $P7 = $P1.'rawstring'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 9150
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 9155
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 9156
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 9157
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 9158
    iter $P8, $P4
    set $P8, 0
  __label_3: # for iteration
    unless $P8 goto __label_4
    shift $S2, $P8
# {
.annotate 'line', 9159
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 9160
# try: create handler
    new $P7, 'ExceptionHandler'
    set_label $P7, __label_5
    push_eh $P7
# try: begin
# {
.annotate 'line', 9161
    $P5.'open'($S3, 'r')
    goto __label_4 # break
.annotate 'line', 9162
# }
# try: end
    pop_eh
    goto __label_6
.annotate 'line', 9160
# catch
  __label_5:
    .get_results($P9)
    finalize $P9
    pop_eh
# catch end
  __label_6:
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9167
    $P7 = $P5.'is_closed'()
    if_null $P7, __label_7
    unless $P7 goto __label_7
.annotate 'line', 9168
    WSubId_1('File not found', $P1)
  __label_7: # endif
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 9173
# line: $S4
    $P7 = $P5.'readline'()
    null $S4
    if_null $P7, __label_11
    set $S4, $P7
  __label_11:
  __label_10: # for condition
    $P9 = $P5.'eof'()
    isfalse $I4, $P9
    unless $I4 goto __label_9
# {
.annotate 'line', 9174
# predefined substr
    substr $S8, $S4, 0, 12
    ne $S8, '.macro_const', __label_12
# {
.annotate 'line', 9175
# pos: $I1
    set $I1, 12
.annotate 'line', 9176
# c: $S5
    null $S5
  __label_14: # while
.annotate 'line', 9177
# predefined substr
    substr $S5, $S4, $I1, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_15
    iseq $I4, $S5, "\t"
  __label_15:
    unless $I4 goto __label_13
.annotate 'line', 9178
    inc $I1
    goto __label_14
  __label_13: # endwhile
.annotate 'line', 9179
# pos2: $I2
    set $I2, $I1
  __label_17: # while
.annotate 'line', 9180
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_21
    isne $I4, $S5, "\t"
  __label_21:
    unless $I4 goto __label_20
.annotate 'line', 9181
    isne $I4, $S5, "\n"
  __label_20:
    unless $I4 goto __label_19
    isne $I4, $S5, "\r"
  __label_19:
    unless $I4 goto __label_18
    isne $I4, $S5, ""
  __label_18:
    unless $I4 goto __label_16
.annotate 'line', 9182
    inc $I2
    goto __label_17
  __label_16: # endwhile
.annotate 'line', 9183
    ne $I2, $I1, __label_22
    goto __label_8 # continue
  __label_22: # endif
.annotate 'line', 9185
# name: $S6
    sub $I4, $I2, $I1
# predefined substr
    substr $S6, $S4, $I1, $I4
  __label_24: # while
.annotate 'line', 9186
# predefined substr
    substr $S5, $S4, $I2, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_25
    iseq $I4, $S5, "\t"
  __label_25:
    unless $I4 goto __label_23
.annotate 'line', 9187
    inc $I2
    goto __label_24
  __label_23: # endwhile
.annotate 'line', 9188
    set $I1, $I2
  __label_27: # while
.annotate 'line', 9189
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_31
    isne $I4, $S5, "\t"
  __label_31:
    unless $I4 goto __label_30
.annotate 'line', 9190
    isne $I4, $S5, "\n"
  __label_30:
    unless $I4 goto __label_29
    isne $I4, $S5, "\r"
  __label_29:
    unless $I4 goto __label_28
    isne $I4, $S5, ""
  __label_28:
    unless $I4 goto __label_26
.annotate 'line', 9191
    inc $I2
    goto __label_27
  __label_26: # endwhile
.annotate 'line', 9192
    ne $I2, $I1, __label_32
    goto __label_8 # continue
  __label_32: # endif
.annotate 'line', 9194
# value: $S7
    sub $I4, $I2, $I1
# predefined substr
    substr $S7, $S4, $I1, $I4
.annotate 'line', 9196
# ivalue: $I3
    null $I3
.annotate 'line', 9197
# predefined substr
    substr $S8, $S7, 0, 2
    iseq $I4, $S8, '0x'
    if $I4 goto __label_35
# predefined substr
    substr $S9, $S7, 0, 2
    iseq $I4, $S9, '0X'
  __label_35:
    unless $I4 goto __label_33
.annotate 'line', 9198
# predefined substr
    substr $S10, $S7, 2
    box $P9, $S10
    $P7 = $P9.'to_int'(16)
    set $I3, $P7
    goto __label_34
  __label_33: # else
.annotate 'line', 9200
    set $I3, $S7
  __label_34: # endif
.annotate 'line', 9201
# var cst: $P6
    $P6 = __ARG_3.'createconst'($S6, 'I', 4)
.annotate 'line', 9203
    new $P10, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P11, __ARG_1, 'file'
    getattribute $P12, __ARG_1, 'line'
    $P10.'TokenInteger'($P11, $P12, $S6)
    set $P9, $P10
.annotate 'line', 9202
    $P7 = WSubId_21(__ARG_3, $P9, $I3)
    $P6.'setvalue'($P7)
# }
  __label_12: # endif
# }
  __label_8: # for iteration
.annotate 'line', 9173
    $P7 = $P5.'readline'()
    set $S4, $P7
    goto __label_10
  __label_9: # for end
.annotate 'line', 9207
    $P5.'close'()
# }
.annotate 'line', 9208

.end # include_parrot


.sub 'parsensUsing' :subid('WSubId_109')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_57 = "WSubId_57"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 9214
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9215
    $P7 = $P1.'iskeyword'('namespace')
    if_null $P7, __label_1
    unless $P7 goto __label_1
# {
.annotate 'line', 9216
# var nskey: $P2
    $P2 = WSubId_55(__ARG_2)
.annotate 'line', 9217
# nelems: $I1
# predefined elements
    elements $I1, $P2
.annotate 'line', 9218
    ge $I1, 1, __label_2
.annotate 'line', 9219
    WSubId_1('Unsupported', $P1)
  __label_2: # endif
.annotate 'line', 9220
    WSubId_54(';', __ARG_2)
.annotate 'line', 9221
# var nssym: $P3
    $P3 = __ARG_3.'findns'($P2)
.annotate 'line', 9222
    unless_null $P3, __label_3
.annotate 'line', 9223
    WSubId_1('unknown namespace', $P1)
  __label_3: # endif
.annotate 'line', 9224
    __ARG_3.'usenamespace'($P3)
.annotate 'line', 9225
    .return()
# }
  __label_1: # endif
.annotate 'line', 9227
    $P7 = $P1.'iskeyword'('extern')
    isfalse $I3, $P7
    unless $I3 goto __label_4
# {
.annotate 'line', 9228
    __ARG_2.'unget'($P1)
.annotate 'line', 9229
# var key: $P4
    $P4 = WSubId_55(__ARG_2)
.annotate 'line', 9230
# nelems: $I2
# predefined elements
    elements $I2, $P4
.annotate 'line', 9231
    ge $I2, 1, __label_5
.annotate 'line', 9232
    WSubId_1('Unsupported at namespace level', $P1)
  __label_5: # endif
.annotate 'line', 9233
    WSubId_54(';', __ARG_2)
.annotate 'line', 9234
    __ARG_3.'use'($P4)
.annotate 'line', 9235
    .return()
# }
  __label_4: # endif
.annotate 'line', 9237
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 9239
    $I3 = $P1.'isstring'()
    if $I3 goto __label_8
.annotate 'line', 9245
    $I3 = $P1.'isidentifier'()
    if $I3 goto __label_9
    goto __label_7
  __label_8: # case
.annotate 'line', 9241
# reqlib: $S1
    set $P7, $P1
    null $S1
    if_null $P7, __label_10
    set $S1, $P7
  __label_10:
.annotate 'line', 9242
    __ARG_3.'addlib'($S1)
.annotate 'line', 9243
    WSubId_54(';', __ARG_2)
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 9246
    __ARG_2.'unget'($P1)
.annotate 'line', 9247
# var module: $P5
    $P5 = WSubId_55(__ARG_2)
.annotate 'line', 9248
    $P1 = __ARG_2.'get'()
.annotate 'line', 9249
    $P8 = $P1.'isop'(';')
    isfalse $I4, $P8
    unless $I4 goto __label_11
# {
.annotate 'line', 9250
    __ARG_2.'unget'($P1)
.annotate 'line', 9251
# var names: $P6
    null $P7
    $P6 = WSubId_36(__ARG_2, $P7, WSubId_57, ';')
.annotate 'line', 9252
    __ARG_3.'addextern'($P5, $P6)
# }
  __label_11: # endif
.annotate 'line', 9254
# reqmodule: $S2
# predefined join
    join $S3, '/', $P5
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
.annotate 'line', 9255
    __ARG_3.'addload'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 9258
    WSubId_40('string literal or identifier', $P1)
  __label_6: # switch end
# }
.annotate 'line', 9260

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9270
    setattribute self, 'module', __ARG_1
.annotate 'line', 9271
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 9272

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9277
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 9285
    __ARG_1.'print'("    srcns = get_root_namespace ['parrot'; '")
.annotate 'line', 9286
    getattribute $P1, self, 'module'
# predefined join
    join $S2, "'; '", $P1
    __ARG_1.'print'($S2)
.annotate 'line', 9287
    __ARG_1.'say'("']")
.annotate 'line', 9288
    getattribute $P1, self, 'names'
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 9289
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9290
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 9296

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 9266
    addattribute $P0, 'module'
.annotate 'line', 9267
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9315
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 9316
    unless_null __ARG_2, __label_1
# {
.annotate 'line', 9317
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 9318
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9319
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 9320
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9323
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 9324
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 9325
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9326
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 9327
    getattribute $P2, __ARG_2, 'functions'
    setattribute self, 'functions', $P2
# }
  __label_2: # endif
.annotate 'line', 9329
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 9330

.end # NamespaceBase


.sub 'fixnamespaces' :method
# Body
# {
.annotate 'line', 9333
# var ns: $P1
    null $P1
.annotate 'line', 9334
    getattribute $P3, self, 'namespaces'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9335
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9336
    getattribute $P3, self, 'usednamespaces'
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 9337
    getattribute $P6, $P1, 'usednamespaces'
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 9338
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9339

.end # fixnamespaces


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9342
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 9343

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9346
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 9347
    .return()
  __label_1: # endif
.annotate 'line', 9348
# var usednamespaces: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 9349
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 9350
    ne_addr $P2, __ARG_1, __label_4
.annotate 'line', 9351
    .return()
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9352
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9353

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9356
# var sym: $P1
    $P1 = self.'findsymbol'(__ARG_1)
.annotate 'line', 9357
    if_null $P1, __label_1
# {
.annotate 'line', 9358
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 9359
    getattribute $P3, self, 'functions'
# predefined push
    push $P3, $P1
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9362
# name: $S1
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 9363
# var ns: $P2
    $P2 = self.'findns'(__ARG_1)
.annotate 'line', 9364
    if_null $P2, __label_5
# {
.annotate 'line', 9365
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 9366
    if_null $P1, __label_6
.annotate 'line', 9367
    self.'createvarused'($S1, $P1)
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 9370

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9373
    getattribute $P2, self, 'usednamespaces'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9374
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9375
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 9376
    .return($P2)
# }
.annotate 'line', 9377

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9380
    getattribute $P2, self, 'namespaces'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9381
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9382
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9383
    .tailcall self.'getusedns'(__ARG_1)
# }
.annotate 'line', 9384

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9388
# var ext: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 9389
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9390
    unless_null $P2, __label_1
.annotate 'line', 9391
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 9393
# predefined push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 9394

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9398
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 9399
# var cl: $P2
    null $P2
.annotate 'line', 9400
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 9401
    getattribute $P5, $P2, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9402
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9403
    getattribute $P5, self, 'usednamespaces'
    iter $P6, $P5
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P3, $P6
.annotate 'line', 9404
    $P2 = $P3.'checkclass_base'(__ARG_1)
    if_null $P2, __label_6
.annotate 'line', 9405
    .return($P2)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P5
.annotate 'line', 9406
    .return($P5)
# }
.annotate 'line', 9407

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9412
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9413
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9415
    .return($P3)
  __label_4: # case
.annotate 'line', 9418
    sub $I4, $I1, 1
    $P4 = __ARG_1[$I4]
    .tailcall self.'checkclass_base'($P4)
  __label_2: # default
.annotate 'line', 9423
# basename: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9424
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9425
    if_null $P1, __label_5
# {
.annotate 'line', 9426
# var found: $P2
    add $I5, __ARG_2, 1
    $P2 = $P1.'findclasskey'(__ARG_1, $I5)
.annotate 'line', 9427
    if_null $P2, __label_6
.annotate 'line', 9428
    .return($P2)
  __label_6: # endif
# }
  __label_5: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9431
    .return($P3)
# }
.annotate 'line', 9432

.end # findclasskey_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9435
# var sym: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9436
    if_null $P1, __label_1
.annotate 'line', 9437
    .return($P1)
  __label_1: # endif
.annotate 'line', 9438
    getattribute $P2, self, 'functions'
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9439
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_4
.annotate 'line', 9440
    .return($P1)
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P2
.annotate 'line', 9441
    .return($P2)
# }
.annotate 'line', 9442

.end # findsymbolbyname


.sub 'findlocalsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9447
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
.annotate 'line', 9448
# name: $S1
    null $S1
.annotate 'line', 9449
# var sym: $P1
    null $P1
.annotate 'line', 9450
# var ns: $P2
    null $P2
# switch
.annotate 'line', 9451
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9453
    .return($P3)
  __label_4: # case
.annotate 'line', 9455
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
.annotate 'line', 9457
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_5
.annotate 'line', 9458
    .return($P1)
  __label_5: # endif
.annotate 'line', 9459
    getattribute $P4, self, 'usednamespaces'
    iter $P5, $P4
    set $P5, 0
  __label_6: # for iteration
    unless $P5 goto __label_7
    shift $P2, $P5
.annotate 'line', 9460
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_8
.annotate 'line', 9461
    .return($P1)
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9467
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9468
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 9469
    isnull $I5, $P2
    not $I5
    unless $I5 goto __label_10
.annotate 'line', 9470
    add $I6, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I6)
    isnull $I5, $P1
    not $I5
  __label_10:
    unless $I5 goto __label_9
.annotate 'line', 9471
    .return($P1)
  __label_9: # endif
.annotate 'line', 9472
    $P2 = self.'getusedns'($S1)
.annotate 'line', 9473
    isnull $I7, $P2
    not $I7
    unless $I7 goto __label_12
.annotate 'line', 9474
    add $I8, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I8)
    isnull $I7, $P1
    not $I7
  __label_12:
    unless $I7 goto __label_11
.annotate 'line', 9475
    .return($P1)
  __label_11: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9477
    .return($P3)
# }
.annotate 'line', 9478

.end # findlocalsymbol


.sub 'findlocalns' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9481
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9482
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
    null $P2
.annotate 'line', 9484
    .return($P2)
  __label_2: # default
.annotate 'line', 9486
# name: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9487
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9488
    if_null $P1, __label_4
# {
.annotate 'line', 9489
    sub $I4, $I1, __ARG_2
    ne $I4, 1, __label_5
.annotate 'line', 9490
    .return($P1)
    goto __label_6
  __label_5: # else
.annotate 'line', 9492
    add $I5, __ARG_2, 1
    .tailcall $P1.'findlocalns'(__ARG_1, $I5)
  __label_6: # endif
# }
  __label_4: # endif
  __label_1: # switch end
    null $P2
.annotate 'line', 9495
    .return($P2)
# }
.annotate 'line', 9496

.end # findlocalns


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9499
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 9500
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9501
    .return($P1)
# }
.annotate 'line', 9502

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9505
# var existns: $P1
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 9506
# var child: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 9507
    getattribute $P3, self, 'namespaces'
# predefined push
    push $P3, $P2
.annotate 'line', 9508
    getattribute $P3, self, 'items'
# predefined push
    push $P3, $P2
.annotate 'line', 9509
    .return($P2)
# }
.annotate 'line', 9510

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9513
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9514

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9517
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 9518
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9519

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9522
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9523
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9524
    $P1 = __ARG_2.'get'()
.annotate 'line', 9526
# var modifier: $P2
    null $P2
.annotate 'line', 9527
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9528
    new $P5, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 9529
    $P1 = __ARG_2.'get'()
# }
  __label_2: # endif
.annotate 'line', 9532
    WSubId_4('{', $P1)
.annotate 'line', 9533
# var child: $P3
    $P3 = self.'childnamespace'(__ARG_1, $S1, $P2)
.annotate 'line', 9534
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 9535

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_92 = "WSubId_92"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_110 = "WSubId_110"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 9538
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 9539
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 9540
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 9541
# var t: $P4
    null $P4
# for loop
.annotate 'line', 9542
    $P4 = __ARG_1.'get'()
  __label_3: # for condition
    $I2 = $P4.'iseof'()
    if $I2 goto __label_4
    $I2 = $P4.'isop'('}')
  __label_4:
    not $I1, $I2
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 9544
    $P9 = $P4.'checkkeyword'()
    set $S1, $P9
    set $S2, 'namespace'
    if $S1 == $S2 goto __label_7
    set $S2, 'const'
    if $S1 == $S2 goto __label_8
    set $S2, 'function'
    if $S1 == $S2 goto __label_9
    set $S2, 'class'
    if $S1 == $S2 goto __label_10
    set $S2, 'extern'
    if $S1 == $S2 goto __label_11
    set $S2, 'using'
    if $S1 == $S2 goto __label_12
    set $S2, '$include_const'
    if $S1 == $S2 goto __label_13
    set $S2, '$load'
    if $S1 == $S2 goto __label_14
    set $S2, '$loadlib'
    if $S1 == $S2 goto __label_15
    goto __label_6
  __label_7: # case
.annotate 'line', 9546
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9549
# var cst: $P5
    $P5 = WSubId_44($P4, __ARG_1, self)
.annotate 'line', 9550
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9553
# var f: $P6
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 9554
# predefined push
    push $P2, $P6
.annotate 'line', 9555
# predefined push
    push $P1, $P6
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 9558
    WSubId_108($P4, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 9561
# var t1: $P7
    $P7 = __ARG_1.'get'()
.annotate 'line', 9562
    $P10 = $P7.'iskeyword'('function')
    isfalse $I3, $P10
    unless $I3 goto __label_16
.annotate 'line', 9563
    WSubId_1('Unsupported extern', $P7)
  __label_16: # endif
.annotate 'line', 9564
    $P7 = __ARG_1.'get'()
.annotate 'line', 9565
    WSubId_92($P7)
.annotate 'line', 9566
    WSubId_54(';', __ARG_1)
.annotate 'line', 9567
# var fex: $P8
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P8.'FunctionExtern'($P7, self)
.annotate 'line', 9568
# predefined push
    push $P2, $P8
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 9571
    WSubId_109($P4, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 9574
    WSubId_110($P4, __ARG_1, self)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 9577
    $P4 = __ARG_1.'get'()
.annotate 'line', 9578
    $P11 = $P4.'isstring'()
    isfalse $I4, $P11
    unless $I4 goto __label_17
.annotate 'line', 9579
    WSubId_40('string literal', $P4)
  __label_17: # endif
.annotate 'line', 9580
    WSubId_54(';', __ARG_1)
.annotate 'line', 9581
    new $P14, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P14.'StringLiteral'(self, $P4)
    set $P13, $P14
    $P12 = $P13.'getPirString'()
    self.'addload'($P12)
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 9584
    $P4 = __ARG_1.'get'()
.annotate 'line', 9585
    $P15 = $P4.'isstring'()
    isfalse $I5, $P15
    unless $I5 goto __label_18
.annotate 'line', 9586
    WSubId_40('string literal', $P4)
  __label_18: # endif
.annotate 'line', 9587
    WSubId_54(';', __ARG_1)
.annotate 'line', 9588
    new $P18, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P18.'StringLiteral'(self, $P4)
    set $P17, $P18
    $P16 = $P17.'getPirString'()
    self.'addlib'($P16)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9591
    WSubId_41("token", $P4)
  __label_5: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 9542
    $P4 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9594
    $P9 = $P4.'iseof'()
    if_null $P9, __label_19
    unless $P9 goto __label_19
.annotate 'line', 9595
    self.'unclosed_ns'()
    goto __label_20
  __label_19: # else
.annotate 'line', 9597
    self.'close_ns'($P4)
  __label_20: # endif
# }
.annotate 'line', 9598

.end # parse


.sub 'optimize_base' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 9601
    getattribute $P1, self, 'items'
    WSubId_38($P1)
# }
.annotate 'line', 9602

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 9605
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 9606
# s: $S1
    $P4 = WSubId_107($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9608
# activate: $I1
    set $I1, 1
.annotate 'line', 9610
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9611
    if_null $P2, __label_2
# {
.annotate 'line', 9612
    __ARG_1.'say'($S1)
.annotate 'line', 9613
    null $I1
.annotate 'line', 9614
    WSubId_52(__ARG_1, $P2)
# }
  __label_2: # endif
.annotate 'line', 9617
    getattribute $P4, self, 'items'
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P3, $P5
# {
.annotate 'line', 9618
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_7
.annotate 'line', 9619
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_7:
    unless $I2 goto __label_5
.annotate 'line', 9620
    set $I1, 1
    goto __label_6
  __label_5: # else
.annotate 'line', 9622
    unless $I1 goto __label_8
# {
.annotate 'line', 9623
    __ARG_1.'say'($S1)
.annotate 'line', 9624
    null $I1
# }
  __label_8: # endif
  __label_6: # endif
.annotate 'line', 9626
    $P3.'emit'(__ARG_1)
# }
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9628

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 9303
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 9305
    addattribute $P0, 'nspath'
.annotate 'line', 9306
    addattribute $P0, 'externals'
.annotate 'line', 9307
    addattribute $P0, 'namespaces'
.annotate 'line', 9308
    addattribute $P0, 'classes'
.annotate 'line', 9309
    addattribute $P0, 'functions'
.annotate 'line', 9310
    addattribute $P0, 'items'
.annotate 'line', 9311
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 9646
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9647
# predefined push
    push $P1, __ARG_4
.annotate 'line', 9648
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 9650
    setattribute self, 'parent', __ARG_1
.annotate 'line', 9651
    setattribute self, 'start', __ARG_2
.annotate 'line', 9652
    setattribute self, 'owner', __ARG_1
.annotate 'line', 9653
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 9654
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 9655
    if_null __ARG_5, __label_1
# {
.annotate 'line', 9656
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 9657
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
  __label_2: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 9659

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9662
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9663

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9666
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9667

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9670
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9671

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9674
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 9675

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9678
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 9679

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9682
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9683
    unless_null $P1, __label_1
.annotate 'line', 9684
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9685
    .return($P1)
# }
.annotate 'line', 9686

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9691
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1, __ARG_2)
.annotate 'line', 9692
    isnull $I1, $P1
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9693
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findclasskey'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9694
    .return($P1)
# }
.annotate 'line', 9695

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9698
# var sym: $P1
    $P1 = self.'findlocalsymbol'(__ARG_1, __ARG_2)
.annotate 'line', 9699
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9700
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findsymbol'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9701
    .return($P1)
# }
.annotate 'line', 9702

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9705
# var ns: $P1
    $P1 = self.'findlocalns'(__ARG_1, __ARG_2)
.annotate 'line', 9706
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9707
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findns'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9708
    .return($P1)
# }
.annotate 'line', 9709

.end # findns


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9712
    getattribute $P1, self, 'start'
    WSubId_1('unclosed namespace', $P1)
# }
.annotate 'line', 9713

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9720
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 9721
    if_null $P1, __label_1
.annotate 'line', 9722
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 9723
    self.'optimize_base'()
.annotate 'line', 9724
    .return(self)
# }
.annotate 'line', 9725

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9728
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 9729
    if_null $P1, __label_1
.annotate 'line', 9730
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 9732
    self.'emit_base'(__ARG_1)
.annotate 'line', 9734
    if_null $P1, __label_2
.annotate 'line', 9735
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 9736

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 9635
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9637
    addattribute $P0, 'parent'
.annotate 'line', 9638
    addattribute $P0, 'start'
.annotate 'line', 9639
    addattribute $P0, 'name'
.annotate 'line', 9640
    addattribute $P0, 'modifier'
.annotate 'line', 9641
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9753
    new $P1, ['ResizableStringArray']
.annotate 'line', 9754
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 9755
    setattribute self, 'unit', __ARG_1
.annotate 'line', 9756
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 9757
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 9758

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9761
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9762
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9763

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9766
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9767
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_2
    null $I1
    goto __label_1
  __label_2:
    set $I1, 1
  __label_1:
    .return($I1)
# }
.annotate 'line', 9768

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9772
# idgen: $I1
    getattribute $P2, self, 'subidgen'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 9771
    set $S1, $I1
.annotate 'line', 9773
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 9774

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9778
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 9779
    unless_null $P1, __label_1
.annotate 'line', 9780
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 9781
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9782

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9785
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 9786
    unless_null $P1, __label_1
.annotate 'line', 9787
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 9788
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9789

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9792
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 9793

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9797
    .tailcall self.'findclasskey_base'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9798

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9801
    .tailcall self.'findlocalsymbol'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9802

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9805
    .tailcall self.'findlocalns'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9806

.end # findns


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9813
    WSubId_1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 9814

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9817
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9818

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9821
    self.'optimize_base'()
.annotate 'line', 9822
    .return(self)
# }
.annotate 'line', 9823

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9826
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9829
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 9830
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 9833
    new $P2, ['ResizableStringArray']
    set $P2, 9
    set $S4, 'acos'
    $P2[0] = $S4
    set $S4, 'asin'
    $P2[1] = $S4
    set $S4, 'atan'
    $P2[2] = $S4
    set $S4, 'cos'
    $P2[3] = $S4
    set $S4, 'exp'
    $P2[4] = $S4
    set $S4, 'ln'
    $P2[5] = $S4
    set $S4, 'sin'
    $P2[6] = $S4
    set $S4, 'tan'
    $P2[7] = $S4
    set $S4, 'pow'
    $P2[8] = $S4
.annotate 'line', 9836
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 9837
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 9838
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 9839
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9842
# somelib: $I1
    null $I1
.annotate 'line', 9843
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 9844
    if_null $P3, __label_5
# {
.annotate 'line', 9845
    set $I1, 1
.annotate 'line', 9846
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 9847
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 9850
# someload: $I2
    null $I2
.annotate 'line', 9851
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 9852
    if_null $P4, __label_8
# {
.annotate 'line', 9853
    set $I2, 1
.annotate 'line', 9854
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 9855
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 9856
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 9857
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 9859
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 9860
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 9862
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 9863

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9866
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 9867
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 9868
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 9869
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 9870
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 9871
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 9873
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 9874
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 9876

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 9743
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9745
    addattribute $P0, 'unit'
.annotate 'line', 9746
    addattribute $P0, 'predefs_used'
.annotate 'line', 9747
    addattribute $P0, 'libs'
.annotate 'line', 9748
    addattribute $P0, 'loads'
.annotate 'line', 9749
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'init' :method :vtable
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 9892
    box $P7, 1
    setattribute self, 'warnings', $P7
.annotate 'line', 9893
# var rootns: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 9896
# var taux: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    $P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 9898
# var cfalse: $P3
    $P3 = $P1.'createconst'('false', 'I', 4)
.annotate 'line', 9900
    new $P9, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, 'false')
    set $P8, $P9
.annotate 'line', 9899
    $P7 = WSubId_21($P1, $P8, 0)
    $P3.'setvalue'($P7)
.annotate 'line', 9901
# var ctrue: $P4
    $P4 = $P1.'createconst'('true', 'I', 4)
.annotate 'line', 9903
    new $P9, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, 'false')
    set $P8, $P9
.annotate 'line', 9902
    $P7 = WSubId_21($P1, $P8, 1)
    $P4.'setvalue'($P7)
.annotate 'line', 9907
# var cstage: $P5
    $P5 = $P1.'createconst'('__STAGE__', 'S', 4)
.annotate 'line', 9908
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 9909
    new $P10, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P11, $P2, 'file'
    getattribute $P12, $P2, 'line'
# predefined string
# predefined int
.annotate 'line', 9908
    set $I2, "2"
    add $I1, $I2, 1
    set $S1, $I1
    $P10.'TokenQuoted'($P11, $P12, $S1)
    set $P9, $P10
    $P8.'StringLiteral'($P1, $P9)
    set $P7, $P8
    $P5.'setvalue'($P7)
.annotate 'line', 9911
# var cerrtype: $P6
    $P6 = $P1.'createconst'('__WINXED_ERROR__', 'S', 4)
.annotate 'line', 9913
    new $P9, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, '__WINXED_ERROR__')
    set $P8, $P9
.annotate 'line', 9912
    $P7 = WSubId_21($P1, $P8, 567)
    $P6.'setvalue'($P7)
.annotate 'line', 9915
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 9916

.end # init


.sub 'setwarnmode' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 9919
    getattribute $P1, self, 'warnings'
    assign $P1, __ARG_1
# }
.annotate 'line', 9920

.end # setwarnmode


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 9923
    getattribute $P1, self, 'warnings'
.annotate 'line', 9922
    set $I1, $P1
.annotate 'line', 9923
    .return($I1)
# }
.annotate 'line', 9924

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9927
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 9928
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
# }
.annotate 'line', 9929

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9932
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 9933

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9936
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 9937
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 9938
    __ARG_1.'say'('')
.annotate 'line', 9940
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9942
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 9943

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9946
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 9947
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 9949
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 9951
    __ARG_1.'comment'('End')
# }
.annotate 'line', 9952

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 9887
    addattribute $P0, 'rootns'
.annotate 'line', 9888
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]

.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 9961
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 9962
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 9963
# var handleout: $P1
    null $P1
.annotate 'line', 9964
    unless_null __ARG_3, __label_2
# {
.annotate 'line', 9965
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9966
    $P1.'open'('__eval__', 'w')
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 9969
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 9970
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9971
    if_null __ARG_4, __label_4
    unless __ARG_4 goto __label_4
.annotate 'line', 9972
    $P2.'disable_annotations'()
  __label_4: # endif
.annotate 'line', 9973
    __ARG_1.'emit'($P2)
.annotate 'line', 9974
    $P2.'close'()
.annotate 'line', 9975
    if_null __ARG_3, __label_5
.annotate 'line', 9976
    .return(__ARG_3)
    goto __label_6
  __label_5: # else
# {
.annotate 'line', 9978
    $P1.'close'()
.annotate 'line', 9979
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 9980
# var object: $P3
    null $P3
# switch
.annotate 'line', 9981
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_10
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_11
    set $S3, ''
    if $S2 == $S3 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 9983
    new $P3, [ 'String' ]
.annotate 'line', 9984
    assign $P3, $S1
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 9988
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 9989
    $P3 = $P4($S1)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 9990
# predefined string
.annotate 'line', 9992
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# predefined die
    die $S5
  __label_8: # switch end
.annotate 'line', 9994
    .return($P3)
# }
  __label_6: # endif
# }
.annotate 'line', 9996

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9999
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10000
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10001
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10002
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 10003
    $P2.'close'()
.annotate 'line', 10004
    $P1.'close'()
.annotate 'line', 10005
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 10006

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('noan')
        .param int __ARG_5 :optional :named('nowarn')
# Body
# {
.annotate 'line', 10013
    unless_null __ARG_2, __label_1
.annotate 'line', 10014
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10015
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10016
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10017
    $P1.'puts'(__ARG_1)
.annotate 'line', 10018
    $P1.'close'()
.annotate 'line', 10019
    $P1.'open'('__eval__', 'r')
.annotate 'line', 10020
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 10021
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 10022
    unless __ARG_5 goto __label_2
.annotate 'line', 10023
    $P3.'setwarnmode'(0)
  __label_2: # endif
.annotate 'line', 10024
    $P3.'parse'($P2)
.annotate 'line', 10025
    $P1.'close'()
.annotate 'line', 10026
    $P3.'optimize'()
.annotate 'line', 10027
    ne __ARG_2, 'include', __label_3
.annotate 'line', 10028
    .tailcall self.'__private_geninclude'($P3)
    goto __label_4
  __label_3: # else
.annotate 'line', 10030
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4)
  __label_4: # endif
# }
.annotate 'line', 10031

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('noan')
        .param int __ARG_5 :optional :named('nowarn')
# Body
# {
.annotate 'line', 10039
    unless_null __ARG_2, __label_1
.annotate 'line', 10040
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10041
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 10042
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 10043
    $P1.'encoding'('utf8')
.annotate 'line', 10044
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 10045
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 10046
    unless __ARG_5 goto __label_2
.annotate 'line', 10047
    $P3.'setwarnmode'(0)
  __label_2: # endif
.annotate 'line', 10048
    $P3.'parse'($P2)
.annotate 'line', 10049
    $P1.'close'()
.annotate 'line', 10050
    $P3.'optimize'()
.annotate 'line', 10051
    ne __ARG_2, 'include', __label_3
.annotate 'line', 10052
    .tailcall self.'__private_geninclude'($P3)
    goto __label_4
  __label_3: # else
.annotate 'line', 10054
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4)
  __label_4: # endif
# }
.annotate 'line', 10055

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 10064
# var comp: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 10065
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 10066

.end # initializer

# End generated code