ADDRESS (WORD)     ADDRESS (BYTE)    OPCODE     MNEMONIC
0100               200               1225       JP 225
0101               202               5350       SE V3, V5
0102               204               4143       SNE V1, 43
0103               206               4520       SNE V5, 20
0104               208               494e       SNE V9, 4e
0105               20a               5641       SE V6, V4
0106               20c               4445       SNE V4, 45
0107               20e               5253       SE V2, V5
0108               210               2076       CALL 076
0109               212               302e       SE V0, 2e
010a               214               3920       SE V9, 20
010b               216               4279       SNE V2, 79
010c               218               2044       CALL 044
010d               21a               6176       LD V1, 76
010e               21c               6964       LD V9, 64
010f               21e               2057       CALL 057
0110               220               494e       SNE V9, 4e
0111               222               5445       SE V4, V4
0112               224               5260       SE V2, V6
0113               226               0061       
0114               228               0062       
0115               22a               08a3       
0116               22c               d3d0       DRW V3, Vd, 0
0117               22e               1871       JP 871
0118               230               08f2       
0119               232               1e31       JP e31
011a               234               2012       CALL 012
011b               236               2d70       CALL d70
011c               238               0861       
011d               23a               0030       
011e               23c               4012       SNE V0, 12
011f               23e               2d69       CALL d69
0120               240               056c       
0121               242               156e       JP 56e
0122               244               0023       
0123               246               8760       LD V7, V6
0124               248               0af0       
0125               24a               15f0       JP 5f0
0126               24c               0730       
0127               24e               0012       
0128               250               4b23       SNE Vb, 23
0129               252               877e       SHL V7{ , V7 }
012a               254               0112       
012b               256               4566       SNE V5, 66
012c               258               0068       
012d               25a               1c69       JP c69
012e               25c               006a       
012f               25e               046b       
0130               260               0a6c       
0131               262               046d       
0132               264               3c6e       SE Vc, 6e
0133               266               0f00       
0134               268               e023       
0135               26a               6b23       LD Vb, 23
0136               26c               47fd       SNE V7, fd
0137               26e               1560       JP 560
0138               270               04e0       
0139               272               9e12       SNE Ve, V1
013a               274               7d23       ADD Vd, 23
013b               276               6b38       LD Vb, 38
013c               278               0078       
013d               27a               ff23       
013e               27c               6b60       LD Vb, 60
013f               27e               06e0       
0140               280               9e12       SNE Ve, V1
0141               282               8b23       XOR Vb, V2
0142               284               6b38       LD Vb, 38
0143               286               3978       SE V9, 78
0144               288               0123       
0145               28a               6b36       LD Vb, 36
0146               28c               0012       
0147               28e               9f60       SNE Vf, V6
0148               290               05e0       
0149               292               9e12       SNE Ve, V1
014a               294               e966       
014b               296               0165       
014c               298               1b84       JP b84
014d               29a               80a3       XOR V0, Va
014e               29c               cfd4       RND Vf, d4
014f               29e               51a3       SE V1, Va
0150               2a0               cfd4       RND Vf, d4
0151               2a2               5175       SE V1, V7
0152               2a4               ff35       
0153               2a6               ff12       
0154               2a8               ad66       LD I, d66
0155               2aa               0012       
0156               2ac               e9d4       
0157               2ae               513f       SE V1, V3
0158               2b0               0112       
0159               2b2               e9d4       
015a               2b4               5166       SE V1, V6
015b               2b6               0083       
015c               2b8               4073       SNE V0, 73
015d               2ba               0383       
015e               2bc               b562       JP V0, 562
015f               2be               f883       
0160               2c0               2262       CALL 262
0161               2c2               0833       
0162               2c4               0012       
0163               2c6               c923       RND V9, 23
0164               2c8               7382       ADD V3, 82
0165               2ca               0643       
0166               2cc               0812       
0167               2ce               d333       DRW V3, V3, 3
0168               2d0               1012       JP 012
0169               2d2               d523       DRW V5, V2, 3
016a               2d4               7382       ADD V3, 82
016b               2d6               0633       
016c               2d8               1812       JP 812
016d               2da               dd23       DRW Vd, V2, 3
016e               2dc               7382       ADD V3, 82
016f               2de               0643       
0170               2e0               2012       CALL 012
0171               2e2               e733       
0172               2e4               2812       CALL 812
0173               2e6               e923       
0174               2e8               733e       ADD V3, 3e
0175               2ea               0013       
0176               2ec               0779       
0177               2ee               0649       
0178               2f0               1869       JP 869
0179               2f2               006a       
017a               2f4               046b       
017b               2f6               0a6c       
017c               2f8               047d       
017d               2fa               f46e       
017e               2fc               0f00       
017f               2fe               e023       
0180               300               4723       SNE V7, 23
0181               302               6bfd       LD Vb, fd
0182               304               1512       JP 512
0183               306               6ff7       LD Vf, f7
0184               308               0737       
0185               30a               0012       
0186               30c               6ffd       LD Vf, fd
0187               30e               1523       JP 523
0188               310               478b       SNE V7, 8b
0189               312               a43b       LD I, 43b
018a               314               1213       JP 213
018b               316               1b7c       JP b7c
018c               318               026a       
018d               31a               fc3b       
018e               31c               0213       
018f               31e               237c       CALL 37c
0190               320               026a       
0191               322               0423       
0192               324               473c       SNE V7, 3c
0193               326               1812       JP 812
0194               328               6f00       LD Vf, 0
0195               32a               e0a4       
0196               32c               d360       DRW V3, V6, 0
0197               32e               1461       JP 461
0198               330               0862       
0199               332               0fd0       
019a               334               1f70       JP f70
019b               336               08f2       
019c               338               1e30       JP e30
019d               33a               2c13       CALL c13
019e               33c               33f0       SE V3, f0
019f               33e               0a00       
01a0               340               e0a6       
01a1               342               f4fe       
01a2               344               6512       LD V5, 12
01a3               346               25a3       CALL 5a3
01a4               348               b7f9       JP V0, 7f9
01a5               34a               1e61       JP e61
01a6               34c               0823       
01a7               34e               5f81       SE Vf, V8
01a8               350               0623       
01a9               352               5f81       SE Vf, V8
01aa               354               0623       
01ab               356               5f81       SE Vf, V8
01ac               358               0623       
01ad               35a               5f7b       SE Vf, V7
01ae               35c               d000       DRW V0, V0, 0
01af               35e               ee80       
01b0               360               e080       
01b1               362               1230       JP 230
01b2               364               00db       
01b3               366               c67b       RND V6, 7b
01b4               368               0c00       
01b5               36a               eea3       
01b6               36c               cf60       RND Vf, 60
01b7               36e               1cd8       JP cd8
01b8               370               0400       
01b9               372               ee23       
01ba               374               478e       SNE V7, 8e
01bb               376               2323       CALL 323
01bc               378               4760       SNE V7, 60
01bd               37a               05f0       
01be               37c               18f0       JP 8f0
01bf               37e               15f0       JP 5f0
01c0               380               0730       
01c1               382               0013       
01c2               384               7f00       ADD Vf, 0
01c3               386               ee6a       
01c4               388               008d       
01c5               38a               e06b       
01c6               38c               04e9       
01c7               38e               a112       LD I, 112
01c8               390               57a6       SE V7, Va
01c9               392               02fd       
01ca               394               1ef0       JP ef0
01cb               396               6530       LD V5, 30
01cc               398               ff13       
01cd               39a               a56a       LD I, 56a
01ce               39c               006b       
01cf               39e               046d       
01d0               3a0               016e       
01d1               3a2               0113       
01d2               3a4               8da5       SUB Vd, Va
01d3               3a6               00f0       
01d4               3a8               1edb       JP edb
01d5               3aa               c67b       RND V6, 7b
01d6               3ac               087d       
01d7               3ae               017a       
01d8               3b0               013a       
01d9               3b2               0713       
01da               3b4               8d00       LD Vd, V0
01db               3b6               ee3c       
01dc               3b8               7eff       ADD Ve, ff
01dd               3ba               ff99       
01de               3bc               997e       SNE V9, V7
01df               3be               ffff       
01e0               3c0               2424       CALL 424
01e1               3c2               e77e       
01e2               3c4               ff3c       
01e3               3c6               3c7e       SE Vc, 7e
01e4               3c8               db81       DRW Vb, V8, 1
01e5               3ca               423c       SNE V2, 3c
01e6               3cc               7eff       ADD Ve, ff
01e7               3ce               db10       DRW Vb, V1, 0
01e8               3d0               387c       SE V8, 7c
01e9               3d2               fe00       
01ea               3d4               007f       
01eb               3d6               003f       
01ec               3d8               007f       
01ed               3da               0000       
01ee               3dc               0001       
01ef               3de               0101       
01f0               3e0               0303       
01f1               3e2               0303       
01f2               3e4               0000       
01f3               3e6               3f20       SE Vf, 20
01f4               3e8               2020       CALL 020
01f5               3ea               2020       CALL 020
01f6               3ec               2020       CALL 020
01f7               3ee               203f       CALL 03f
01f8               3f0               0808       
01f9               3f2               ff00       
01fa               3f4               00fe       
01fb               3f6               00fc       
01fc               3f8               00fe       
01fd               3fa               0000       
01fe               3fc               007e       
01ff               3fe               4242       SNE V2, 42
0200               400               6262       LD V2, 62
0201               402               6262       LD V2, 62
0202               404               0000       
0203               406               ff00       
0204               408               0000       
0205               40a               0000       
0206               40c               0000       
0207               40e               00ff       
0208               410               0000       
0209               412               ff00       
020a               414               7d00       ADD Vd, 0
020b               416               417d       SNE V1, 7d
020c               418               057d       
020d               41a               7d00       ADD Vd, 0
020e               41c               00c2       
020f               41e               c2c6       RND V2, c6
0210               420               446c       SNE V4, 6c
0211               422               2838       CALL 838
0212               424               0000       
0213               426               ff00       
0214               428               0000       
0215               42a               0000       
0216               42c               0000       
0217               42e               00ff       
0218               430               0000       
0219               432               ff00       
021a               434               f710       
021b               436               14f7       JP 4f7
021c               438               f704       
021d               43a               0400       
021e               43c               007c       
021f               43e               44fe       SNE V4, fe
0220               440               c2c2       RND V2, c2
0221               442               c2c2       RND V2, c2
0222               444               0000       
0223               446               ff00       
0224               448               0000       
0225               44a               0000       
0226               44c               0000       
0227               44e               00ff       
0228               450               0000       
0229               452               ff00       
022a               454               ef20       
022b               456               28e8       CALL 8e8
022c               458               e82f       
022d               45a               2f00       CALL f00
022e               45c               00f9       
022f               45e               85c5       SUB V5, Vc
0230               460               c5c5       RND V5, c5
0231               462               c5f9       RND V5, f9
0232               464               0000       
0233               466               ff00       
0234               468               0000       
0235               46a               0000       
0236               46c               0000       
0237               46e               00ff       
0238               470               0000       
0239               472               ff00       
023a               474               be00       JP V0, e00
023b               476               2030       CALL 030
023c               478               20be       CALL 0be
023d               47a               be00       JP V0, e00
023e               47c               00f7       
023f               47e               04e7       
0240               480               8585       SUB V5, V8
0241               482               84f4       ADD V4, Vf
0242               484               0000       
0243               486               ff00       
0244               488               0000       
0245               48a               0000       
0246               48c               0000       
0247               48e               00ff       
0248               490               0000       
0249               492               ff00       
024a               494               007f       
024b               496               003f       
024c               498               007f       
024d               49a               0000       
024e               49c               00ef       
024f               49e               28ef       CALL 8ef
0250               4a0               00e0       CLS

0251               4a2               606f       LD V0, 6f
0252               4a4               0000       
0253               4a6               ff00       
0254               4a8               0000       
0255               4aa               0000       
0256               4ac               0000       
0257               4ae               00ff       
0258               4b0               0000       
0259               4b2               ff00       
025a               4b4               00fe       
025b               4b6               00fc       
025c               4b8               00fe       
025d               4ba               0000       
025e               4bc               00c0       
025f               4be               00c0       
0260               4c0               c0c0       RND V0, c0
0261               4c2               c0c0       RND V0, c0
0262               4c4               0000       
0263               4c6               fc04       
0264               4c8               0404       
0265               4ca               0404       
0266               4cc               0404       
0267               4ce               04fc       
0268               4d0               1010       JP 010
0269               4d2               fff9       
026a               4d4               81b9       
026b               4d6               8b9a       
026c               4d8               9afa       SNE Va, Vf
026d               4da               00fa       
026e               4dc               8a9a       
026f               4de               9a9b       SNE Va, V9
0270               4e0               99f8       SNE V9, Vf
0271               4e2               e625       
0272               4e4               25f4       CALL 5f4
0273               4e6               3434       SE V4, 34
0274               4e8               3400       SE V4, 0
0275               4ea               1714       JP 714
0276               4ec               3437       SE V4, 37
0277               4ee               3626       SE V6, 26
0278               4f0               c7df       RND V7, df
0279               4f2               5050       SE V0, V5
027a               4f4               5cd8       SE Vc, Vd
027b               4f6               d8df       DRW V8, Vd, f
027c               4f8               00df       
027d               4fa               111f       JP 11f
027e               4fc               121b       JP 21b
027f               4fe               19d9       JP 9d9
0280               500               7c44       ADD Vc, 44
0281               502               fe86       
0282               504               8686       SHR V6{ , V8 }
0283               506               fc84       
0284               508               fe82       
0285               50a               82fe       SHL V2{ , Vf }
0286               50c               fe80       
0287               50e               c0c0       RND V0, c0
0288               510               c0fe       RND V0, fe
0289               512               fc82       
028a               514               c2c2       RND V2, c2
028b               516               c2fc       RND V2, fc
028c               518               fe80       
028d               51a               f8c0       
028e               51c               c0fe       RND V0, fe
028f               51e               fe80       
0290               520               f0c0       
0291               522               c0c0       RND V0, c0
0292               524               fe80       
0293               526               be86       JP V0, e86
0294               528               86fe       SHL V6{ , Vf }
0295               52a               8686       SHR V6{ , V8 }
0296               52c               fe86       
0297               52e               8686       SHR V6{ , V8 }
0298               530               1010       JP 010
0299               532               1010       JP 010
029a               534               1010       JP 010
029b               536               1818       JP 818
029c               538               1848       JP 848
029d               53a               4878       SNE V8, 78
029e               53c               9c90       SNE Vc, V9
029f               53e               b0c0       JP V0, 0c0
02a0               540               b09c       JP V0, 09c
02a1               542               8080       LD V0, V8
02a2               544               c0c0       RND V0, c0
02a3               546               c0fe       RND V0, fe
02a4               548               ee92       
02a5               54a               9286       SNE V2, V8
02a6               54c               8686       SHR V6{ , V8 }
02a7               54e               fe82       
02a8               550               8686       SHR V6{ , V8 }
02a9               552               8686       SHR V6{ , V8 }
02aa               554               7c82       ADD Vc, 82
02ab               556               8686       SHR V6{ , V8 }
02ac               558               867c       
02ad               55a               fe82       
02ae               55c               fec0       
02af               55e               c0c0       RND V0, c0
02b0               560               7c82       ADD Vc, 82
02b1               562               c2ca       RND V2, ca
02b2               564               c47a       RND V4, 7a
02b3               566               fe86       
02b4               568               fe90       
02b5               56a               9c84       SNE Vc, V8
02b6               56c               fec0       
02b7               56e               fe02       
02b8               570               02fe       
02b9               572               fe10       
02ba               574               3030       SE V0, 30
02bb               576               3030       SE V0, 30
02bc               578               8282       AND V2, V8
02bd               57a               c2c2       RND V2, c2
02be               57c               c2fe       RND V2, fe
02bf               57e               8282       AND V2, V8
02c0               580               82ee       SHL V2{ , Ve }
02c1               582               3810       SE V8, 10
02c2               584               8686       SHR V6{ , V8 }
02c3               586               9692       SNE V6, V9
02c4               588               92ee       SNE V2, Ve
02c5               58a               8244       ADD V2, V4
02c6               58c               3838       SE V8, 38
02c7               58e               4482       SNE V4, 82
02c8               590               8282       AND V2, V8
02c9               592               fe30       
02ca               594               3030       SE V0, 30
02cb               596               fe02       
02cc               598               1ef0       JP ef0
02cd               59a               80fe       SHL V0{ , Vf }
02ce               59c               0000       
02cf               59e               0000       
02d0               5a0               0606       
02d1               5a2               0000       
02d2               5a4               0060       
02d3               5a6               60c0       LD V0, c0
02d4               5a8               0000       
02d5               5aa               0000       
02d6               5ac               0000       
02d7               5ae               1818       JP 818
02d8               5b0               1818       JP 818
02d9               5b2               0018       
02da               5b4               7cc6       ADD Vc, c6
02db               5b6               0c18       
02dc               5b8               0018       
02dd               5ba               0000       
02de               5bc               fefe       
02df               5be               0000       
02e0               5c0               fe82       
02e1               5c2               8686       SHR V6{ , V8 }
02e2               5c4               86fe       SHL V6{ , Vf }
02e3               5c6               0808       
02e4               5c8               0818       
02e5               5ca               1818       JP 818
02e6               5cc               fe02       
02e7               5ce               fec0       
02e8               5d0               c0fe       RND V0, fe
02e9               5d2               fe02       
02ea               5d4               1e06       JP e06
02eb               5d6               06fe       
02ec               5d8               84c4       ADD V4, Vc
02ed               5da               c4fe       RND V4, fe
02ee               5dc               0404       
02ef               5de               fe80       
02f0               5e0               fe06       
02f1               5e2               06fe       
02f2               5e4               c0c0       RND V0, c0
02f3               5e6               c0fe       RND V0, fe
02f4               5e8               82fe       SHL V2{ , Vf }
02f5               5ea               fe02       
02f6               5ec               0206       
02f7               5ee               0606       
02f8               5f0               7c44       ADD Vc, 44
02f9               5f2               fe86       
02fa               5f4               86fe       SHL V6{ , Vf }
02fb               5f6               fe82       
02fc               5f8               fe06       
02fd               5fa               0606       
02fe               5fc               44fe       SNE V4, fe
02ff               5fe               4444       SNE V4, 44
0300               600               fe44       
0301               602               a8a8       LD I, 8a8
0302               604               a8a8       LD I, 8a8
0303               606               a8a8       LD I, 8a8
0304               608               a86c       LD I, 86c
0305               60a               5a00       SE Va, V0
0306               60c               0c18       
0307               60e               a830       LD I, 830
0308               610               4e7e       SNE Ve, 7e
0309               612               0012       
030a               614               1866       JP 866
030b               616               6ca8       LD Vc, a8
030c               618               5a66       SE Va, V6
030d               61a               5424       SE V4, V2
030e               61c               6600       LD V6, 0
030f               61e               4848       SNE V8, 48
0310               620               1812       JP 812
0311               622               a806       LD I, 806
0312               624               90a8       SNE V0, Va
0313               626               1200       JP 200
0314               628               7e30       ADD Ve, 30
0315               62a               12a8       JP 2a8
0316               62c               8430       LD V4, V3
0317               62e               4e72       SNE Ve, 72
0318               630               1866       JP 866
0319               632               a8a8       LD I, 8a8
031a               634               a8a8       LD I, 8a8
031b               636               a8a8       LD I, 8a8
031c               638               9054       SNE V0, V5
031d               63a               78a8       ADD V8, a8
031e               63c               4878       SNE V8, 78
031f               63e               6c72       LD Vc, 72
0320               640               a812       LD I, 812
0321               642               186c       JP 86c
0322               644               7266       ADD V2, 66
0323               646               5490       SE V4, V9
0324               648               a872       LD I, 872
0325               64a               2a18       CALL a18
0326               64c               a830       LD I, 830
0327               64e               4e7e       SNE Ve, 7e
0328               650               0012       
0329               652               1866       JP 866
032a               654               6ca8       LD Vc, a8
032b               656               7254       ADD V2, 54
032c               658               a85a       LD I, 85a
032d               65a               6618       LD V6, 18
032e               65c               7e18       ADD Ve, 18
032f               65e               4e72       SNE Ve, 72
0330               660               a872       LD I, 872
0331               662               2a18       CALL a18
0332               664               3066       SE V0, 66
0333               666               a830       LD I, 830
0334               668               4e7e       SNE Ve, 7e
0335               66a               006c       
0336               66c               3054       SE V0, 54
0337               66e               4e9c       SNE Ve, 9c
0338               670               a8a8       LD I, 8a8
0339               672               a8a8       LD I, 8a8
033a               674               a8a8       LD I, 8a8
033b               676               a848       LD I, 848
033c               678               547e       SE V4, V7
033d               67a               18a8       JP 8a8
033e               67c               9054       SNE V0, V5
033f               67e               7866       ADD V8, 66
0340               680               a86c       LD I, 86c
0341               682               2a30       CALL a30
0342               684               5aa8       SE Va, Va
0343               686               8430       LD V4, V3
0344               688               722a       ADD V2, 2a
0345               68a               a8d8       LD I, 8d8
0346               68c               a800       LD I, 800
0347               68e               4e12       SNE Ve, 12
0348               690               a8e4       LD I, 8e4
0349               692               a2a8       LD I, 2a8
034a               694               004e       
034b               696               12a8       JP 2a8
034c               698               6c2a       LD Vc, 2a
034d               69a               5454       SE V4, V5
034e               69c               72a8       ADD V2, a8
034f               69e               8430       LD V4, V3
0350               6a0               722a       ADD V2, 2a
0351               6a2               a8de       LD I, 8de
0352               6a4               9ca8       SNE Vc, Va
0353               6a6               722a       ADD V2, 2a
0354               6a8               18a8       JP 8a8
0355               6aa               0c54       
0356               6ac               485a       SNE V8, 5a
0357               6ae               7872       ADD V8, 72
0358               6b0               1866       JP 866
0359               6b2               a872       LD I, 872
035a               6b4               1842       JP 842
035b               6b6               426c       SNE V2, 6c
035c               6b8               a872       LD I, 872
035d               6ba               2a00       CALL a00
035e               6bc               72a8       ADD V2, a8
035f               6be               722a       ADD V2, 2a
0360               6c0               18a8       JP 8a8
0361               6c2               304e       SE V0, 4e
0362               6c4               7e00       ADD Ve, 0
0363               6c6               1218       JP 218
0364               6c8               666c       LD V6, 6c
0365               6ca               a830       LD I, 830
0366               6cc               4e0c       SNE Ve, c
0367               6ce               6618       LD V6, 18
0368               6d0               006c       
0369               6d2               18a8       JP 8a8
036a               6d4               722a       ADD V2, 2a
036b               6d6               1830       JP 830
036c               6d8               66a8       LD V6, a8
036d               6da               1e54       JP e54
036e               6dc               660c       LD V6, c
036f               6de               189c       JP 89c
0370               6e0               a824       LD I, 824
0371               6e2               5454       SE V4, V5
0372               6e4               12a8       JP 2a8
0373               6e6               4278       SNE V2, 78
0374               6e8               0c3c       
0375               6ea               a8ae       LD I, 8ae
0376               6ec               a8a8       LD I, 8a8
0377               6ee               a8a8       LD I, 8a8
0378               6f0               a8a8       LD I, 8a8
0379               6f2               a8ff       LD I, 8ff
037a               6f4               0000       
037b               6f6               0000       
037c               6f8               0000       
037d               6fa               0000       
037e               6fc               0000       
037f               6fe               0000       
0380               700               0000       
