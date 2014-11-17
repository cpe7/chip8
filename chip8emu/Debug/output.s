ADDRESS (WORD)     ADDRESS (BYTE)    OPCODE     MNEMONIC
0100               200               a21e       LD I, 21e
0101               202               c201       RND V2, 1
0102               204               3201       SE V2, 1
0103               206               a21a       LD I, 21a
0104               208               d014       DRW V0, V1, 4
0105               20a               7004       ADD V0, 4
0106               20c               3040       SE V0, 40
0107               20e               1200       JP 200
0108               210               6000       LD V0, 0
0109               212               7104       ADD V1, 4
010a               214               3120       SE V1, 20
010b               216               1200       JP 200
010c               218               1218       JP 218
010d               21a               8040       LD V0, V4
010e               21c               2010       CALL 010
010f               21e               2040       CALL 040
