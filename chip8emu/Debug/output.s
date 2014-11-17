ADDRESS    OPCODE     MNEMONIC
0100       6a02       LD Va, 2
0101       6b0c       LD Vb, c
0102       6c3f       LD Vc, 3f
0103       6d0c       LD Vd, c
0104       a2ea       LD I, 2ea
0105       dab6       DRW Va, Vb, 6
0106       dcd6       DRW Vc, Vd, 6
0107       6e00       LD Ve, 0
0108       22d4       CALL 2d4
0109       6603       LD V6, 3
010a       6802       LD V8, 2
010b       6060       LD V0, 60
010c       f015       LD DT, V0
010d       f007       LD V0, DT
010e       3000       SE V0, 0
010f       121a       JP 21a
0110       c717       RND V7, 17
0111       7708       ADD V7, 8
0112       69ff       LD V9, ff
0113       a2f0       LD I, 2f0
0114       d671       DRW V6, V7, 1
0115       a2ea       LD I, 2ea
0116       dab6       DRW Va, Vb, 6
0117       dcd6       DRW Vc, Vd, 6
0118       6001       LD V0, 1
0119       e0a1       SKNP V0
011a       7bfe       ADD Vb, fe
011b       6004       LD V0, 4
011c       e0a1       SKNP V0
011d       7b02       ADD Vb, 2
011e       601f       LD V0, 1f
011f       8b02       AND Vb, V0
0120       dab6       DRW Va, Vb, 6
0121       600c       LD V0, c
0122       e0a1       SKNP V0
0123       7dfe       ADD Vd, fe
0124       600d       LD V0, d
0125       e0a1       SKNP V0
0126       7d02       ADD Vd, 2
0127       601f       LD V0, 1f
0128       8d02       AND Vd, V0
0129       dcd6       DRW Vc, Vd, 6
012a       a2f0       LD I, 2f0
012b       d671       DRW V6, V7, 1
012c       8684       ADD V6, V8
012d       8794       ADD V7, V9
012e       603f       LD V0, 3f
012f       8602       AND V6, V0
0130       611f       LD V1, 1f
0131       8712       AND V7, V1
0132       4602       SNE V6, 2
0133       1278       JP 278
0134       463f       SNE V6, 3f
0135       1282       JP 282
0136       471f       SNE V7, 1f
0137       69ff       LD V9, ff
0138       4700       SNE V7, 0
0139       6901       LD V9, 1
013a       d671       DRW V6, V7, 1
013b       122a       JP 22a
013c       6802       LD V8, 2
013d       6301       LD V3, 1
013e       8070       LD V0, V7
013f       80b5       SUB V0, Vb
0140       128a       JP 28a
0141       68fe       LD V8, fe
0142       630d       LD V3, d
0143       0a80       
0144       7080       ADD V0, 80
0145       d53f       DRW V5, V3, f
0146       0112       
0147       a261       LD I, 261
0148       0280       
0149       153f       JP 53f
014a       0112       
014b       ba80       JP V0, a80
014c       153f       JP 53f
014d       0112       
014e       c880       RND V8, 80
014f       153f       JP 53f
0150       0112       
0151       c260       RND V2, 60
0152       20f0       CALL 0f0
0153       1822       JP 822
0154       d48e       DRW V4, V8, e
0155       3422       SE V4, 22
0156       d466       DRW V4, V6, 6
0157       3e33       SE Ve, 33
0158       0166       
0159       0368       
015a       fe33       LD B, Ve
015b       0168       
015c       0212       
015d       1679       JP 679
015e       ff49       
015f       fe69       
0160       ff12       
0161       c879       RND V8, 79
0162       0149       
0163       0269       
0164       0160       
0165       04f0       
0166       1876       JP 876
0167       0146       
0168       4076       SNE V0, 76
0169       fe12       
016a       6ca2       LD Vc, a2
016b       f2fe       
016c       33f2       SE V3, f2
016d       65f1       LD V5, f1
016e       2964       CALL 964
016f       1465       JP 465
0170       00d4       
0171       5574       SE V5, V7
0172       15f2       JP 5f2
0173       29d4       CALL 9d4
0174       5500       SE V5, V0
0175       ee80       
0176       8080       LD V0, V8
0177       8080       LD V0, V8
0178       8080       LD V0, V8
0179       0000       
017a       0000       
