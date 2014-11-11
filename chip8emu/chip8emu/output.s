ADDRESS    OPCODE     MNEMONIC
0200       1225       JP 225
0225       6000       LD V0, 0
0227       6100       LD V1, 0
0229       6208       LD V2, 8
022b       ffd3       
022d       d018       DRW V0, V1, 8
022f       7108       ADD V1, 8
0231       f21e       ADD I, V2
0233       3120       SE V1, 20
0235       122d       JP 22d
0237       7008       ADD V0, 8
0239       6100       LD V1, 0
023b       3040       SE V0, 40
023d       122d       JP 22d
023f       6905       LD V9, 5
0241       6c15       LD Vc, 15
0243       6e00       LD Ve, 0
0245       ff87       
0247       600a       LD V0, a
0249       f015       LD DT, V0
024b       f007       LD V0, DT
024d       3000       SE V0, 0
024f       124b       JP 24b
0251       ff87       
0253       7e01       ADD Ve, 1
0255       1245       JP 245
0257       6600       LD V6, 0
0259       681c       LD V8, 1c
025b       6900       LD V9, 0
025d       6a04       LD Va, 4
025f       6b0a       LD Vb, a
0261       6c04       LD Vc, 4
0263       6d3c       LD Vd, 3c
0265       6e0f       LD Ve, f
0267       ffe0       
0269       236b       CALL 36b
026b       2347       CALL 347
026d       fd15       LD DT, Vd
026f       6004       LD V0, 4
0271       ff9e       
0273       127d       JP 27d
0275       236b       CALL 36b
0277       3800       SE V8, 0
0279       ffff       
027b       236b       CALL 36b
027d       6006       LD V0, 6
027f       ff9e       
0281       ff8b       
0283       236b       CALL 36b
0285       3839       SE V8, 39
0287       7801       ADD V8, 1
0289       236b       CALL 36b
028b       3600       SE V6, 0
028d       ff9f       
028f       6005       LD V0, 5
0291       ff9e       
0293       ffe9       
0295       6601       LD V6, 1
0297       651b       LD V5, 1b
0299       ff80       
029b       ffcf       
029d       d451       DRW V4, V5, 1
029f       ffcf       
02a1       d451       DRW V4, V5, 1
02a3       ffff       
02a5       ffff       
02a7       ffad       
02a9       6600       LD V6, 0
02ab       ffe9       
02ad       d451       DRW V4, V5, 1
02af       3f01       SE Vf, 1
02b1       ffe9       
02b3       d451       DRW V4, V5, 1
02b5       6600       LD V6, 0
02b7       8340       LD V3, V4
02b9       7303       ADD V3, 3
02bb       ffb5       
02bd       fff8       
02bf       8322       AND V3, V2
02c1       6208       LD V2, 8
02c3       3300       SE V3, 0
02c5       ffc9       
02c7       2373       CALL 373
02c9       8206       SHR V2{ , V0 }
02cb       4308       SNE V3, 8
02cd       ffd3       
02cf       3310       SE V3, 10
02d1       ffd5       
02d3       2373       CALL 373
02d5       8206       SHR V2{ , V0 }
02d7       3318       SE V3, 18
02d9       ffdd       
02db       2373       CALL 373
02dd       8206       SHR V2{ , V0 }
02df       4320       SNE V3, 20
02e1       ffe7       
02e3       3328       SE V3, 28
02e5       ffe9       
02e7       2373       CALL 373
02e9       3e00       SE Ve, 0
02eb       1307       JP 307
02ed       7906       ADD V9, 6
02ef       4918       SNE V9, 18
02f1       6900       LD V9, 0
02f3       6a04       LD Va, 4
02f5       6b0a       LD Vb, a
02f7       6c04       LD Vc, 4
02f9       fff4       
02fb       6e0f       LD Ve, f
02fd       ffe0       
02ff       2347       CALL 347
0301       236b       CALL 36b
0303       fd15       LD DT, Vd
0305       126f       JP 26f
0307       f707       LD V7, DT
0309       3700       SE V7, 0
030b       126f       JP 26f
030d       fd15       LD DT, Vd
030f       2347       CALL 347
0311       ffa4       
0313       3b12       SE Vb, 12
0315       131b       JP 31b
0317       7c02       ADD Vc, 2
0319       fffc       
031b       3b02       SE Vb, 2
031d       1323       JP 323
031f       7c02       ADD Vc, 2
0321       6a04       LD Va, 4
0323       2347       CALL 347
0325       3c18       SE Vc, 18
0327       126f       JP 26f
0329       ffe0       
032b       ffd3       
032d       6014       LD V0, 14
032f       6108       LD V1, 8
0331       620f       LD V2, f
0333       d01f       DRW V0, V1, f
0335       7008       ADD V0, 8
0337       f21e       ADD I, V2
0339       302c       SE V0, 2c
033b       1333       JP 333
033d       f00a       LD V0, K
033f       ffe0       
0341       fff4       
0343       fe65       LD Ve, [I]
0345       1225       JP 225
0347       ffb7       
0349       f91e       ADD I, V9
034b       6108       LD V1, 8
034d       235f       CALL 35f
034f       8106       SHR V1{ , V0 }
0351       235f       CALL 35f
0353       8106       SHR V1{ , V0 }
0355       235f       CALL 35f
0357       8106       SHR V1{ , V0 }
0359       235f       CALL 35f
035b       ffd0       
035d       ffee       
035f       ffe0       
0361       8012       AND V0, V1
0363       3000       SE V0, 0
0365       ffc6       
0367       7b0c       ADD Vb, c
0369       ffee       
036b       ffcf       
036d       601c       LD V0, 1c
036f       d804       DRW V8, V0, 4
0371       ffee       
0373       2347       CALL 347
0375       8e23       XOR Ve, V2
0377       2347       CALL 347
0379       6005       LD V0, 5
037b       f018       LD ST, V0
037d       f015       LD DT, V0
037f       f007       LD V0, DT
0381       3000       SE V0, 0
0383       137f       JP 37f
0385       ffee       
0387       6a00       LD Va, 0
0389       ffe0       
038b       6b04       LD Vb, 4
038d       ffa1       
038f       1257       JP 257
0391       a602       LD I, 602
0393       fd1e       ADD I, Vd
0395       f065       LD V0, [I]
0397       ffff       
0399       ffa5       
039b       6a00       LD Va, 0
039d       6b04       LD Vb, 4
039f       6d01       LD Vd, 1
03a1       6e01       LD Ve, 1
03a3       ff8d       
03a5       a500       LD I, 500
03a7       f01e       ADD I, V0
03a9       ffc6       
03ab       7b08       ADD Vb, 8
03ad       7d01       ADD Vd, 1
03af       7a01       ADD Va, 1
03b1       3a07       SE Va, 7
03b3       ff8d       
03b5       ffee       
03b7       3c7e       SE Vc, 7e
03b9       ffff       
03bb       ff99       
03bd       ffff       
03bf       ff24       
03c1       ffe7       
03c3       ffff       
03c5       3c3c       SE Vc, 3c
03c7       ffdb       
03c9       8142       AND V1, V4
03cb       3c7e       SE Vc, 7e
03cd       ffdb       
03cf       1038       JP 038
03d1       fffe       
03d3       0000       
03d5       7f00       ADD Vf, 0
03d7       3f00       SE Vf, 0
03d9       7f00       ADD Vf, 0
03db       0000       
03dd       0101       
03df       0103       
03e1       0303       
03e3       0300       
03e5       003f       
03e7       2020       CALL 020
03e9       2020       CALL 020
03eb       2020       CALL 020
03ed       2020       CALL 020
03ef       3f08       SE Vf, 8
03f1       ffff       
03f3       0000       
03f5       fe00       
03f7       fc00       
03f9       fe00       
03fb       0000       
03fd       7e42       ADD Ve, 42
03ff       4262       SNE V2, 62
0401       6262       LD V2, 62
0403       6200       LD V2, 0
0405       ffff       
0407       0000       
0409       0000       
040b       0000       
040d       0000       
040f       ff00       
0411       ffff       
0413       007d       
0415       0041       
0417       7d05       ADD Vd, 5
0419       7d7d       ADD Vd, 7d
041b       0000       
041d       ffc2       
041f       c644       RND V6, 44
0421       6c28       LD Vc, 28
0423       3800       SE V8, 0
0425       ffff       
0427       0000       
0429       0000       
042b       0000       
042d       0000       
042f       ff00       
0431       ffff       
0433       fff7       
0435       1014       JP 014
0437       fff7       
0439       0404       
043b       0000       
043d       7c44       ADD Vc, 44
043f       ffc2       
0441       ffc2       
0443       c200       RND V2, 0
0445       ffff       
0447       0000       
0449       0000       
044b       0000       
044d       0000       
044f       ff00       
0451       ffff       
0453       ffef       
0455       2028       CALL 028
0457       ffe8       
0459       2f2f       CALL f2f
045b       0000       
045d       ff85       
045f       ffc5       
0461       ffc5       
0463       f900       
0465       ffff       
0467       0000       
0469       0000       
046b       0000       
046d       0000       
046f       ff00       
0471       ffff       
0473       ffbe       
0475       0020       
0477       3020       SE V0, 20
0479       ffbe       
047b       0000       
047d       f704       
047f       ff85       
0481       ff84       
0483       f400       
0485       ffff       
0487       0000       
0489       0000       
048b       0000       
048d       0000       
048f       ff00       
0491       ffff       
0493       0000       
0495       7f00       ADD Vf, 0
0497       3f00       SE Vf, 0
0499       7f00       ADD Vf, 0
049b       0000       
049d       ef28       
049f       ef00       
04a1       e060       
04a3       6f00       LD Vf, 0
04a5       ffff       
04a7       0000       
04a9       0000       
04ab       0000       
04ad       0000       
04af       ff00       
04b1       ffff       
04b3       0000       
04b5       fe00       
04b7       fc00       
04b9       fe00       
04bb       0000       
04bd       c000       RND V0, 0
04bf       ffc0       
04c1       ffc0       
04c3       c000       RND V0, 0
04c5       fffc       
04c7       0404       
04c9       0404       
04cb       0404       
04cd       0404       
04cf       fc10       
04d1       ffff       
04d3       ff81       
04d5       ff8b       
04d7       ff9a       
04d9       fa00       
04db       ff8a       
04dd       ff9a       
04df       ff99       
04e1       ffe6       
04e3       2525       CALL 525
04e5       f434       
04e7       3434       SE V4, 34
04e9       0017       
04eb       1434       JP 434
04ed       3736       SE V7, 36
04ef       ffc7       
04f1       df50       DRW Vf, V5, 0
04f3       505c       SE V0, V5
04f5       ffd8       
04f7       df00       DRW Vf, V0, 0
04f9       df11       DRW Vf, V1, 1
04fb       1f12       JP f12
04fd       1b19       JP b19
04ff       d97c       DRW V9, V7, c
0501       fffe       
0503       ff86       
0505       fffc       
0507       fffe       
0509       ff82       
050b       fffe       
050d       ffc0       
050f       ffc0       
0511       fffc       
0513       ffc2       
0515       ffc2       
0517       fffe       
0519       fff8       
051b       ffc0       
051d       fffe       
051f       fff0       
0521       ffc0       
0523       fffe       
0525       ffbe       
0527       ff86       
0529       ff86       
052b       fffe       
052d       ff86       
052f       8610       LD V6, V1
0531       1010       JP 010
0533       1010       JP 010
0535       1018       JP 018
0537       1818       JP 818
0539       4848       SNE V8, 48
053b       ff9c       
053d       ffb0       
053f       ffb0       
0541       ff80       
0543       ffc0       
0545       ffc0       
0547       ffee       
0549       ff92       
054b       ff86       
054d       fffe       
054f       ff86       
0551       ff86       
0553       867c       
0555       ff86       
0557       ff86       
0559       fffe       
055b       fffe       
055d       ffc0       
055f       c07c       RND V0, 7c
0561       ffc2       
0563       ffc4       
0565       fffe       
0567       fffe       
0569       ff9c       
056b       fffe       
056d       fffe       
056f       0202       
0571       fffe       
0573       1030       JP 030
0575       3030       SE V0, 30
0577       ff82       
0579       ffc2       
057b       ffc2       
057d       ff82       
057f       ff82       
0581       ee38       
0583       ff86       
0585       ff96       
0587       ff92       
0589       ff82       
058b       4438       SNE V4, 38
058d       3844       SE V8, 44
058f       ff82       
0591       fffe       
0593       3030       SE V0, 30
0595       fffe       
0597       021e       
0599       ff80       
059b       fe00       
059d       0000       
059f       0006       
05a1       0600       
05a3       0000       
05a5       6060       LD V0, 60
05a7       c000       RND V0, 0
05a9       0000       
05ab       0000       
05ad       0018       
05af       1818       JP 818
05b1       1800       JP 800
05b3       187c       JP 87c
05b5       c60c       RND V6, c
05b7       1800       JP 800
05b9       1800       JP 800
05bb       fffe       
05bd       fe00       
05bf       fffe       
05c1       ff86       
05c3       ff86       
05c5       fe08       
05c7       0808       
05c9       1818       JP 818
05cb       fffe       
05cd       fffe       
05cf       ffc0       
05d1       fffe       
05d3       021e       
05d5       0606       
05d7       ff84       
05d9       ffc4       
05db       fe04       
05dd       fffe       
05df       fffe       
05e1       0606       
05e3       ffc0       
05e5       ffc0       
05e7       ff82       
05e9       fffe       
05eb       0202       
05ed       0606       
05ef       067c       
05f1       fffe       
05f3       ff86       
05f5       fffe       
05f7       fffe       
05f9       0606       
05fb       0644       
05fd       fe44       
05ff       fffe       
0601       ffa8       
0603       ffa8       
0605       ffa8       
0607       ffa8       
0609       6c5a       LD Vc, 5a
060b       000c       
060d       ffa8       
060f       304e       SE V0, 4e
0611       7e00       ADD Ve, 0
0613       1218       JP 218
0615       666c       LD V6, 6c
0617       a85a       LD I, 85a
0619       6654       LD V6, 54
061b       2466       CALL 466
061d       0048       
061f       4818       SNE V8, 18
0621       ffa8       
0623       ff90       
0625       a812       LD I, 812
0627       007e       
0629       3012       SE V0, 12
062b       ff84       
062d       304e       SE V0, 4e
062f       7218       ADD V2, 18
0631       ffa8       
0633       ffa8       
0635       ffa8       
0637       ff90       
0639       5478       SE V4, V7
063b       a848       LD I, 848
063d       786c       ADD V8, 6c
063f       ffa8       
0641       1218       JP 218
0643       6c72       LD Vc, 72
0645       6654       LD V6, 54
0647       ffa8       
0649       722a       ADD V2, 2a
064b       ffa8       
064d       304e       SE V0, 4e
064f       7e00       ADD Ve, 0
0651       1218       JP 218
0653       666c       LD V6, 6c
0655       a872       LD I, 872
0657       ffa8       
0659       5a66       SE Va, V6
065b       187e       JP 87e
065d       184e       JP 84e
065f       ffa8       
0661       722a       ADD V2, 2a
0663       1830       JP 830
0665       ffa8       
0667       304e       SE V0, 4e
0669       7e00       ADD Ve, 0
066b       6c30       LD Vc, 30
066d       544e       SE V4, V4
066f       ffa8       
0671       ffa8       
0673       ffa8       
0675       ffa8       
0677       4854       SNE V8, 54
0679       7e18       ADD Ve, 18
067b       ff90       
067d       5478       SE V4, V7
067f       ffa8       
0681       6c2a       LD Vc, 2a
0683       305a       SE V0, 5a
0685       ff84       
0687       3072       SE V0, 72
0689       ffa8       
068b       ffa8       
068d       004e       
068f       ffa8       
0691       ffa2       
0693       a800       LD I, 800
0695       4e12       SNE Ve, 12
0697       a86c       LD I, 86c
0699       2a54       CALL a54
069b       5472       SE V4, V7
069d       ff84       
069f       3072       SE V0, 72
06a1       ffa8       
06a3       ff9c       
06a5       a872       LD I, 872
06a7       2a18       CALL a18
06a9       a80c       LD I, 80c
06ab       5448       SE V4, V4
06ad       5a78       SE Va, V7
06af       7218       ADD V2, 18
06b1       ffa8       
06b3       7218       ADD V2, 18
06b5       4242       SNE V2, 42
06b7       ffa8       
06b9       722a       ADD V2, 2a
06bb       0072       
06bd       a872       LD I, 872
06bf       2a18       CALL a18
06c1       a830       LD I, 830
06c3       4e7e       SNE Ve, 7e
06c5       0012       
06c7       1866       JP 866
06c9       ffa8       
06cb       304e       SE V0, 4e
06cd       0c66       
06cf       1800       JP 800
06d1       6c18       LD Vc, 18
06d3       a872       LD I, 872
06d5       2a18       CALL a18
06d7       3066       SE V0, 66
06d9       a81e       LD I, 81e
06db       5466       SE V4, V6
06dd       0c18       
06df       ffa8       
06e1       2454       CALL 454
06e3       5412       SE V4, V1
06e5       a842       LD I, 842
06e7       780c       ADD V8, c
06e9       ffa8       
06eb       ffa8       
06ed       ffa8       
06ef       ffa8       
06f1       ffa8       
06f3       ff00       
06f5       0000       
06f7       0000       
06f9       0000       
06fb       0000       
06fd       0000       
06ff       0000       
0701       0000       
