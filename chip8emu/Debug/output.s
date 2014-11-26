ADDRESS (WORD)     ADDRESS (BYTE)    OPCODE     MNEMONIC
0100               200               a2b4       LD I, 2b4
0101               202               23e6       CALL 3e6
0102               204               22b6       CALL 2b6
0103               206               7001       ADD V0, 1
0104               208               d011       DRW V0, V1, 1
0105               20a               3025       SE V0, 25
0106               20c               1206       JP 206
0107               20e               71ff       ADD V1, ff
0108               210               d011       DRW V0, V1, 1
0109               212               601a       LD V0, 1a
010a               214               d011       DRW V0, V1, 1
010b               216               6025       LD V0, 25
010c               218               3100       SE V1, 0
010d               21a               120e       JP 20e
010e               21c               c470       RND V4, 70
010f               21e               4470       SNE V4, 70
0110               220               121c       JP 21c
0111               222               c303       RND V3, 3
0112               224               601e       LD V0, 1e
0113               226               6103       LD V1, 3
0114               228               225c       CALL 25c
0115               22a               f515       LD DT, V5
0116               22c               d014       DRW V0, V1, 4
0117               22e               3f01       SE Vf, 1
0118               230               123c       JP 23c
0119               232               d014       DRW V0, V1, 4
011a               234               71ff       ADD V1, ff
011b               236               d014       DRW V0, V1, 4
011c               238               2340       CALL 340
011d               23a               121c       JP 21c
011e               23c               e7a1       SKNP V7
011f               23e               2272       CALL 272
0120               240               e8a1       SKNP V8
0121               242               2284       CALL 284
0122               244               e9a1       SKNP V9
0123               246               2296       CALL 296
0124               248               e29e       
0125               24a               1250       JP 250
0126               24c               6600       LD V6, 0
0127               24e               f615       LD DT, V6
0128               250               f607       LD V6, DT
0129               252               3600       SE V6, 0
012a               254               123c       JP 23c
012b               256               d014       DRW V0, V1, 4
012c               258               7101       ADD V1, 1
012d               25a               122a       JP 22a
012e               25c               a2c4       LD I, 2c4
012f               25e               f41e       ADD I, V4
0130               260               6600       LD V6, 0
0131               262               4301       SNE V3, 1
0132               264               6604       LD V6, 4
0133               266               4302       SNE V3, 2
0134               268               6608       LD V6, 8
0135               26a               4303       SNE V3, 3
0136               26c               660c       LD V6, c
0137               26e               f61e       ADD I, V6
0138               270               00ee       RET

0139               272               d014       DRW V0, V1, 4
013a               274               70ff       ADD V0, ff
013b               276               2334       CALL 334
013c               278               3f01       SE Vf, 1
013d               27a               00ee       RET

013e               27c               d014       DRW V0, V1, 4
013f               27e               7001       ADD V0, 1
0140               280               2334       CALL 334
0141               282               00ee       RET

0142               284               d014       DRW V0, V1, 4
0143               286               7001       ADD V0, 1
0144               288               2334       CALL 334
0145               28a               3f01       SE Vf, 1
0146               28c               00ee       RET

0147               28e               d014       DRW V0, V1, 4
0148               290               70ff       ADD V0, ff
0149               292               2334       CALL 334
014a               294               00ee       RET

014b               296               d014       DRW V0, V1, 4
014c               298               7301       ADD V3, 1
014d               29a               4304       SNE V3, 4
014e               29c               6300       LD V3, 0
014f               29e               225c       CALL 25c
0150               2a0               2334       CALL 334
0151               2a2               3f01       SE Vf, 1
0152               2a4               00ee       RET

0153               2a6               d014       DRW V0, V1, 4
0154               2a8               73ff       ADD V3, ff
0155               2aa               43ff       SNE V3, ff
0156               2ac               6303       LD V3, 3
0157               2ae               225c       CALL 25c
0158               2b0               2334       CALL 334
0159               2b2               00ee       RET

015a               2b4               8000       LD V0, V0
015b               2b6               6705       LD V7, 5
015c               2b8               6806       LD V8, 6
015d               2ba               6904       LD V9, 4
015e               2bc               611f       LD V1, 1f
015f               2be               6510       LD V5, 10
0160               2c0               6207       LD V2, 7
0161               2c2               00ee       RET

0162               2c4               40e0       SNE V0, e0
0163               2c6               0000       
0164               2c8               40c0       SNE V0, c0
0165               2ca               4000       SNE V0, 0
0166               2cc               00e0       CLS

0167               2ce               4000       SNE V0, 0
0168               2d0               4060       SNE V0, 60
0169               2d2               4000       SNE V0, 0
016a               2d4               4040       SNE V0, 40
016b               2d6               6000       LD V0, 0
016c               2d8               20e0       CALL 0e0
016d               2da               0000       
016e               2dc               c040       RND V0, 40
016f               2de               4000       SNE V0, 0
0170               2e0               00e0       CLS

0171               2e2               8000       LD V0, V0
0172               2e4               4040       SNE V0, 40
0173               2e6               c000       RND V0, 0
0174               2e8               00e0       CLS

0175               2ea               2000       CALL 000
0176               2ec               6040       LD V0, 40
0177               2ee               4000       SNE V0, 0
0178               2f0               80e0       LD V0, Ve
0179               2f2               0000       
017a               2f4               40c0       SNE V0, c0
017b               2f6               8000       LD V0, V0
017c               2f8               c060       RND V0, 60
017d               2fa               0000       
017e               2fc               40c0       SNE V0, c0
017f               2fe               8000       LD V0, V0
0180               300               c060       RND V0, 60
0181               302               0000       
0182               304               80c0       LD V0, Vc
0183               306               4000       SNE V0, 0
0184               308               0060       
0185               30a               c000       RND V0, 0
0186               30c               80c0       LD V0, Vc
0187               30e               4000       SNE V0, 0
0188               310               0060       
0189               312               c000       RND V0, 0
018a               314               c0c0       RND V0, c0
018b               316               0000       
018c               318               c0c0       RND V0, c0
018d               31a               0000       
018e               31c               c0c0       RND V0, c0
018f               31e               0000       
0190               320               c0c0       RND V0, c0
0191               322               0000       
0192               324               4040       SNE V0, 40
0193               326               4040       SNE V0, 40
0194               328               00f0       
0195               32a               0000       
0196               32c               4040       SNE V0, 40
0197               32e               4040       SNE V0, 40
0198               330               00f0       
0199               332               0000       
019a               334               d014       DRW V0, V1, 4
019b               336               6635       LD V6, 35
019c               338               76ff       ADD V6, ff
019d               33a               3600       SE V6, 0
019e               33c               1338       JP 338
019f               33e               00ee       RET

01a0               340               a2b4       LD I, 2b4
01a1               342               8c10       LD Vc, V1
01a2               344               3c1e       SE Vc, 1e
01a3               346               7c01       ADD Vc, 1
01a4               348               3c1e       SE Vc, 1e
01a5               34a               7c01       ADD Vc, 1
01a6               34c               3c1e       SE Vc, 1e
01a7               34e               7c01       ADD Vc, 1
01a8               350               235e       CALL 35e
01a9               352               4b0a       SNE Vb, a
01aa               354               2372       CALL 372
01ab               356               91c0       SNE V1, Vc
01ac               358               00ee       RET

01ad               35a               7101       ADD V1, 1
01ae               35c               1350       JP 350
01af               35e               601b       LD V0, 1b
01b0               360               6b00       LD Vb, 0
01b1               362               d011       DRW V0, V1, 1
01b2               364               3f00       SE Vf, 0
01b3               366               7b01       ADD Vb, 1
01b4               368               d011       DRW V0, V1, 1
01b5               36a               7001       ADD V0, 1
01b6               36c               3025       SE V0, 25
01b7               36e               1362       JP 362
01b8               370               00ee       RET

01b9               372               601b       LD V0, 1b
01ba               374               d011       DRW V0, V1, 1
01bb               376               7001       ADD V0, 1
01bc               378               3025       SE V0, 25
01bd               37a               1374       JP 374
01be               37c               8e10       LD Ve, V1
01bf               37e               8de0       LD Vd, Ve
01c0               380               7eff       ADD Ve, ff
01c1               382               601b       LD V0, 1b
01c2               384               6b00       LD Vb, 0
01c3               386               d0e1       DRW V0, Ve, 1
01c4               388               3f00       SE Vf, 0
01c5               38a               1390       JP 390
01c6               38c               d0e1       DRW V0, Ve, 1
01c7               38e               1394       JP 394
01c8               390               d0d1       DRW V0, Vd, 1
01c9               392               7b01       ADD Vb, 1
01ca               394               7001       ADD V0, 1
01cb               396               3025       SE V0, 25
01cc               398               1386       JP 386
01cd               39a               4b00       SNE Vb, 0
01ce               39c               13a6       JP 3a6
01cf               39e               7dff       ADD Vd, ff
01d0               3a0               7eff       ADD Ve, ff
01d1               3a2               3d01       SE Vd, 1
01d2               3a4               1382       JP 382
01d3               3a6               23c0       CALL 3c0
01d4               3a8               3f01       SE Vf, 1
01d5               3aa               23c0       CALL 3c0
01d6               3ac               7a01       ADD Va, 1
01d7               3ae               23c0       CALL 3c0
01d8               3b0               80a0       LD V0, Va
01d9               3b2               6d07       LD Vd, 7
01da               3b4               80d2       AND V0, Vd
01db               3b6               4004       SNE V0, 4
01dc               3b8               75fe       ADD V5, fe
01dd               3ba               4502       SNE V5, 2
01de               3bc               6504       LD V5, 4
01df               3be               00ee       RET

01e0               3c0               a700       LD I, 700
01e1               3c2               f255       LD[I], V2
01e2               3c4               a804       LD I, 804
01e3               3c6               fa33       LD B, Va
01e4               3c8               f265       LD V2, [I]
01e5               3ca               f029       LD F, V0
01e6               3cc               6d32       LD Vd, 32
01e7               3ce               6e00       LD Ve, 0
01e8               3d0               dde5       DRW Vd, Ve, 5
01e9               3d2               7d05       ADD Vd, 5
01ea               3d4               f129       LD F, V1
01eb               3d6               dde5       DRW Vd, Ve, 5
01ec               3d8               7d05       ADD Vd, 5
01ed               3da               f229       LD F, V2
01ee               3dc               dde5       DRW Vd, Ve, 5
01ef               3de               a700       LD I, 700
01f0               3e0               f265       LD V2, [I]
01f1               3e2               a2b4       LD I, 2b4
01f2               3e4               00ee       RET

01f3               3e6               6a00       LD Va, 0
01f4               3e8               6019       LD V0, 19
01f5               3ea               00ee       RET

