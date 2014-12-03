ADDRESS (WORD)     ADDRESS (BYTE)    OPCODE     MNEMONIC
0100               200               00e0       CLS

0101               202               6c00       LD Vc, 0
0102               204               4c00       SNE Vc, 0
0103               206               6e0f       LD Ve, f
0104               208               a203       LD I, 203
0105               20a               6020       LD V0, 20
0106               20c               f055       LD[I], V0
0107               20e               00e0       CLS

0108               210               22be       CALL 2be
0109               212               2276       CALL 276
010a               214               228e       CALL 28e
010b               216               225e       CALL 25e
010c               218               2246       CALL 246
010d               21a               1210       JP 210
010e               21c               6100       LD V1, 0
010f               21e               6217       LD V2, 17
0110               220               6304       LD V3, 4
0111               222               4110       SNE V1, 10
0112               224               00ee       RET

0113               226               a2e8       LD I, 2e8
0114               228               f11e       ADD I, V1
0115               22a               f065       LD V0, [I]
0116               22c               4000       SNE V0, 0
0117               22e               1234       JP 234
0118               230               f029       LD F, V0
0119               232               d235       DRW V2, V3, 5
011a               234               7101       ADD V1, 1
011b               236               7205       ADD V2, 5
011c               238               6403       LD V4, 3
011d               23a               8412       AND V4, V1
011e               23c               3400       SE V4, 0
011f               23e               1222       JP 222
0120               240               6217       LD V2, 17
0121               242               7306       ADD V3, 6
0122               244               1222       JP 222
0123               246               6403       LD V4, 3
0124               248               84e2       AND V4, Ve
0125               24a               6503       LD V5, 3
0126               24c               85d2       AND V5, Vd
0127               24e               9450       SNE V4, V5
0128               250               00ee       RET

0129               252               4403       SNE V4, 3
012a               254               00ee       RET

012b               256               6401       LD V4, 1
012c               258               84e4       ADD V4, Ve
012d               25a               22a6       CALL 2a6
012e               25c               1246       JP 246
012f               25e               6403       LD V4, 3
0130               260               84e2       AND V4, Ve
0131               262               6503       LD V5, 3
0132               264               85d2       AND V5, Vd
0133               266               9450       SNE V4, V5
0134               268               00ee       RET

0135               26a               4400       SNE V4, 0
0136               26c               00ee       RET

0137               26e               64ff       LD V4, ff
0138               270               84e4       ADD V4, Ve
0139               272               22a6       CALL 2a6
013a               274               125e       JP 25e
013b               276               640c       LD V4, c
013c               278               84e2       AND V4, Ve
013d               27a               650c       LD V5, c
013e               27c               85d2       AND V5, Vd
013f               27e               9450       SNE V4, V5
0140               280               00ee       RET

0141               282               4400       SNE V4, 0
0142               284               00ee       RET

0143               286               64fc       LD V4, fc
0144               288               84e4       ADD V4, Ve
0145               28a               22a6       CALL 2a6
0146               28c               1276       JP 276
0147               28e               640c       LD V4, c
0148               290               84e2       AND V4, Ve
0149               292               650c       LD V5, c
014a               294               85d2       AND V5, Vd
014b               296               9450       SNE V4, V5
014c               298               00ee       RET

014d               29a               440c       SNE V4, c
014e               29c               00ee       RET

014f               29e               6404       LD V4, 4
0150               2a0               84e4       ADD V4, Ve
0151               2a2               22a6       CALL 2a6
0152               2a4               128e       JP 28e
0153               2a6               a2e8       LD I, 2e8
0154               2a8               f41e       ADD I, V4
0155               2aa               f065       LD V0, [I]
0156               2ac               a2e8       LD I, 2e8
0157               2ae               fe1e       ADD I, Ve
0158               2b0               f055       LD[I], V0
0159               2b2               6000       LD V0, 0
015a               2b4               a2e8       LD I, 2e8
015b               2b6               f41e       ADD I, V4
015c               2b8               f055       LD[I], V0
015d               2ba               8e40       LD Ve, V4
015e               2bc               00ee       RET

015f               2be               3c00       SE Vc, 0
0160               2c0               12d2       JP 2d2
0161               2c2               221c       CALL 21c
0162               2c4               22d8       CALL 2d8
0163               2c6               221c       CALL 21c
0164               2c8               a2f8       LD I, 2f8
0165               2ca               fd1e       ADD I, Vd
0166               2cc               f065       LD V0, [I]
0167               2ce               8d00       LD Vd, V0
0168               2d0               00ee       RET

0169               2d2               7cff       ADD Vc, ff
016a               2d4               cd0f       RND Vd, f
016b               2d6               00ee       RET

016c               2d8               7d01       ADD Vd, 1
016d               2da               600f       LD V0, f
016e               2dc               8d02       AND Vd, V0
016f               2de               ed9e       
0170               2e0               12d8       JP 2d8
0171               2e2               eda1       SKNP Vd
0172               2e4               12e2       JP 2e2
0173               2e6               00ee       RET

0174               2e8               0102       
0175               2ea               0304       
0176               2ec               0506       
0177               2ee               0708       
0178               2f0               090a       
0179               2f2               0b0c       
017a               2f4               0d0e       
017b               2f6               0f00       
017c               2f8               0d00       
017d               2fa               0102       
017e               2fc               0405       
017f               2fe               0608       
0180               300               090a       
0181               302               0c0e       
0182               304               0307       
0183               306               0b0f       
0184               308               84e4       ADD V4, Ve
0185               30a               22a6       CALL 2a6
0186               30c               1276       JP 276
0187               30e               640c       LD V4, c
0188               310               84e2       AND V4, Ve
0189               312               650c       LD V5, c
018a               314               85d2       AND V5, Vd
018b               316               9450       SNE V4, V5
018c               318               00ee       RET

018d               31a               440c       SNE V4, c
018e               31c               00ee       RET

018f               31e               6404       LD V4, 4
0190               320               84e4       ADD V4, Ve
0191               322               22a6       CALL 2a6
0192               324               128e       JP 28e
0193               326               a2e8       LD I, 2e8
0194               328               f41e       ADD I, V4
0195               32a               f065       LD V0, [I]
0196               32c               a2e8       LD I, 2e8
0197               32e               fe1e       ADD I, Ve
0198               330               f055       LD[I], V0
0199               332               6000       LD V0, 0
019a               334               a2e8       LD I, 2e8
019b               336               f41e       ADD I, V4
019c               338               f055       LD[I], V0
019d               33a               8e40       LD Ve, V4
019e               33c               00ee       RET

019f               33e               3c00       SE Vc, 0
01a0               340               12d2       JP 2d2
01a1               342               221c       CALL 21c
01a2               344               22d8       CALL 2d8
01a3               346               221c       CALL 21c
01a4               348               a2f8       LD I, 2f8
01a5               34a               fd1e       ADD I, Vd
01a6               34c               f065       LD V0, [I]
01a7               34e               8d00       LD Vd, V0
01a8               350               00ee       RET

01a9               352               7cff       ADD Vc, ff
01aa               354               cd0f       RND Vd, f
01ab               356               00ee       RET

01ac               358               7d01       ADD Vd, 1
01ad               35a               600f       LD V0, f
01ae               35c               8d02       AND Vd, V0
01af               35e               ed9e       
01b0               360               12d8       JP 2d8
01b1               362               eda1       SKNP Vd
01b2               364               12e2       JP 2e2
01b3               366               00ee       RET

01b4               368               0102       
01b5               36a               0304       
01b6               36c               0506       
01b7               36e               0708       
01b8               370               090a       
01b9               372               0b0c       
01ba               374               0d0e       
01bb               376               0f00       
01bc               378               0d00       
01bd               37a               0102       
01be               37c               0405       
01bf               37e               0608       
