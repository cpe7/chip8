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
0142               284               630d       LD V3, d
0143               286               0a80       
0144               288               7080       ADD V0, 80
0145               28a               d53f       DRW V5, V3, f
0146               28c               0112       
0147               28e               a261       LD I, 261
0148               290               0280       
0149               292               153f       JP 53f
014a               294               0112       
014b               296               ba80       JP V0, a80
014c               298               153f       JP 53f
014d               29a               0112       
014e               29c               c880       RND V8, 80
014f               29e               153f       JP 53f
0150               2a0               0112       
0151               2a2               c260       RND V2, 60
0152               2a4               20f0       CALL 0f0
0153               2a6               1822       JP 822
0154               2a8               d48e       DRW V4, V8, e
0155               2aa               3422       SE V4, 22
0156               2ac               d466       DRW V4, V6, 6
0157               2ae               3e33       SE Ve, 33
0158               2b0               0166       
0159               2b2               0368       
015a               2b4               fe33       LD B, Ve
015b               2b6               0168       
015c               2b8               0212       
015d               2ba               1679       JP 679
015e               2bc               ff49       
015f               2be               fe69       
0160               2c0               ff12       
0161               2c2               c879       RND V8, 79
0162               2c4               0149       
0163               2c6               0269       
0164               2c8               0160       
0165               2ca               04f0       
0166               2cc               1876       JP 876
0167               2ce               0146       
0168               2d0               4076       SNE V0, 76
0169               2d2               fe12       
016a               2d4               6ca2       LD Vc, a2
016b               2d6               f2fe       
016c               2d8               33f2       SE V3, f2
016d               2da               65f1       LD V5, f1
016e               2dc               2964       CALL 964
016f               2de               1465       JP 465
0170               2e0               00d4       
0171               2e2               5574       SE V5, V7
0172               2e4               15f2       JP 5f2
0173               2e6               29d4       CALL 9d4
0174               2e8               5500       SE V5, V0
0175               2ea               ee80       
0176               2ec               8080       LD V0, V8
0177               2ee               8080       LD V0, V8
0178               2f0               8080       LD V0, V8
0179               2f2               0000       
017a               2f4               0000       
