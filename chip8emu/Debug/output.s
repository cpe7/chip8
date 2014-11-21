ADDRESS (WORD)     ADDRESS (BYTE)    OPCODE     MNEMONIC
0100               200               6a02       LD Va, 2
0101               202               6b0c       LD Vb, c
0102               204               6c3f       LD Vc, 3f
0103               206               6d0c       LD Vd, c
0104               208               a2ea       LD I, 2ea
0105               20a               dab6       DRW Va, Vb, 6
0106               20c               dcd6       DRW Vc, Vd, 6
0107               20e               6e00       LD Ve, 0
0108               210               22d4       CALL 2d4
0109               212               6603       LD V6, 3
010a               214               6802       LD V8, 2
010b               216               6060       LD V0, 60
010c               218               f015       LD DT, V0
010d               21a               f007       LD V0, DT
010e               21c               3000       SE V0, 0
010f               21e               121a       JP 21a
0110               220               c717       RND V7, 17
0111               222               7708       ADD V7, 8
0112               224               69ff       LD V9, ff
0113               226               a2f0       LD I, 2f0
0114               228               d671       DRW V6, V7, 1
0115               22a               a2ea       LD I, 2ea
0116               22c               dab6       DRW Va, Vb, 6
0117               22e               dcd6       DRW Vc, Vd, 6
0118               230               6001       LD V0, 1
0119               232               e0a1       SKNP V0
011a               234               7bfe       ADD Vb, fe
011b               236               6004       LD V0, 4
011c               238               e0a1       SKNP V0
011d               23a               7b02       ADD Vb, 2
011e               23c               601f       LD V0, 1f
011f               23e               8b02       AND Vb, V0
0120               240               dab6       DRW Va, Vb, 6
0121               242               600c       LD V0, c
0122               244               e0a1       SKNP V0
0123               246               7dfe       ADD Vd, fe
0124               248               600d       LD V0, d
0125               24a               e0a1       SKNP V0
0126               24c               7d02       ADD Vd, 2
0127               24e               601f       LD V0, 1f
0128               250               8d02       AND Vd, V0
0129               252               dcd6       DRW Vc, Vd, 6
012a               254               a2f0       LD I, 2f0
012b               256               d671       DRW V6, V7, 1
012c               258               8684       ADD V6, V8
012d               25a               8794       ADD V7, V9
012e               25c               603f       LD V0, 3f
012f               25e               8602       AND V6, V0
0130               260               611f       LD V1, 1f
0131               262               8712       AND V7, V1
0132               264               4602       SNE V6, 2
0133               266               1278       JP 278
0134               268               463f       SNE V6, 3f
0135               26a               1282       JP 282
0136               26c               471f       SNE V7, 1f
0137               26e               69ff       LD V9, ff
0138               270               4700       SNE V7, 0
0139               272               6901       LD V9, 1
013a               274               d671       DRW V6, V7, 1
013b               276               122a       JP 22a
013c               278               6802       LD V8, 2
013d               27a               6301       LD V3, 1
013e               27c               8070       LD V0, V7
013f               27e               80b5       SUB V0, Vb
0140               280               128a       JP 28a
0141               282               68fe       LD V8, fe
0142               284               630a       LD V3, a
0143               286               8070       LD V0, V7
0144               288               80d5       SUB V0, Vd
0145               28a               3f01       SE Vf, 1
0146               28c               12a2       JP 2a2
0147               28e               6102       LD V1, 2
0148               290               8015       SUB V0, V1
0149               292               3f01       SE Vf, 1
014a               294               12ba       JP 2ba
014b               296               8015       SUB V0, V1
014c               298               3f01       SE Vf, 1
014d               29a               12c8       JP 2c8
014e               29c               8015       SUB V0, V1
014f               29e               3f01       SE Vf, 1
0150               2a0               12c2       JP 2c2
0151               2a2               6020       LD V0, 20
0152               2a4               f018       LD ST, V0
0153               2a6               22d4       CALL 2d4
0154               2a8               8e34       ADD Ve, V3
0155               2aa               22d4       CALL 2d4
0156               2ac               663e       LD V6, 3e
0157               2ae               3301       SE V3, 1
0158               2b0               6603       LD V6, 3
0159               2b2               68fe       LD V8, fe
015a               2b4               3301       SE V3, 1
015b               2b6               6802       LD V8, 2
015c               2b8               1216       JP 216
015d               2ba               79ff       ADD V9, ff
015e               2bc               49fe       SNE V9, fe
015f               2be               69ff       LD V9, ff
0160               2c0               12c8       JP 2c8
0161               2c2               7901       ADD V9, 1
0162               2c4               4902       SNE V9, 2
0163               2c6               6901       LD V9, 1
0164               2c8               6004       LD V0, 4
0165               2ca               f018       LD ST, V0
0166               2cc               7601       ADD V6, 1
0167               2ce               4640       SNE V6, 40
0168               2d0               76fe       ADD V6, fe
0169               2d2               126c       JP 26c
016a               2d4               a2f2       LD I, 2f2
016b               2d6               fe33       LD B, Ve
016c               2d8               f265       LD V2, [I]
016d               2da               f129       LD F, V1
016e               2dc               6414       LD V4, 14
016f               2de               6500       LD V5, 0
0170               2e0               d455       DRW V4, V5, 5
0171               2e2               7415       ADD V4, 15
0172               2e4               f229       LD F, V2
0173               2e6               d455       DRW V4, V5, 5
0174               2e8               00ee       RET

0175               2ea               8080       LD V0, V8
0176               2ec               8080       LD V0, V8
0177               2ee               8080       LD V0, V8
0178               2f0               8000       LD V0, V0
0179               2f2               0000       
