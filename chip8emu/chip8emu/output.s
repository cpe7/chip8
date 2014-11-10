0: 1225 - Jump to location 225
1: 6000 - Set V0 = 0
2: 6100 - Set V1 = 0
3: 6208 - Set V2 = 8
4: ffd3 - 
5: d018 - Display 8 - byte sprite starting at memory location I at
(V0, V1), set VF = collision.
6: 7108 - Set V1 = 1 + 8
7: f21e - Set I = I + V2
8: 3120 - Skip next instruction if V1 = 20
9: 122d - Jump to location 22d
a: 7008 - Set V0 = 0 + 8
b: 6100 - Set V1 = 0
c: 3040 - Skip next instruction if V0 = 40
d: 122d - Jump to location 22d
e: 6905 - Set V9 = 5
f: 6c15 - Set Vc = 15
10: 6e00 - Set Ve = 0
11: ff87 - 
12: 600a - Set V0 = a
13: f015 - Set delay timer = V0
14: f007 - Set V0 = delay timer value (the value of DT is placed into it).
15: 3000 - Skip next instruction if V0 = 0
16: 124b - Jump to location 24b
17: ff87 - 
18: 7e01 - Set Ve = e + 1
19: 1245 - Jump to location 245
1a: 6600 - Set V6 = 0
1b: 681c - Set V8 = 1c
1c: 6900 - Set V9 = 0
1d: 6a04 - Set Va = 4
1e: 6b0a - Set Vb = a
1f: 6c04 - Set Vc = 4
20: 6d3c - Set Vd = 3c
21: 6e0f - Set Ve = f
22: ffe0 - 
23: 236b - Call subroutine at 36b
24: 2347 - Call subroutine at 347
25: fd15 - Set delay timer = Vd
26: 6004 - Set V0 = 4
27: ff9e - 
28: 127d - Jump to location 27d
29: 236b - Call subroutine at 36b
2a: 3800 - Skip next instruction if V8 = 0
2b: ffff - 
2c: 236b - Call subroutine at 36b
2d: 6006 - Set V0 = 6
2e: ff9e - 
2f: ff8b - 
30: 236b - Call subroutine at 36b
31: 3839 - Skip next instruction if V8 = 39
32: 7801 - Set V8 = 8 + 1
33: 236b - Call subroutine at 36b
34: 3600 - Skip next instruction if V6 = 0
35: ff9f - 
36: 6005 - Set V0 = 5
37: ff9e - 
38: ffe9 - 
39: 6601 - Set V6 = 1
3a: 651b - Set V5 = 1b
3b: ff80 - 
3c: ffcf - 
3d: d451 - Display 1 - byte sprite starting at memory location I at
(V4, V5), set VF = collision.
3e: ffcf - 
3f: d451 - Display 1 - byte sprite starting at memory location I at
(V4, V5), set VF = collision.
40: ffff - 
41: ffff - 
42: ffad - 
43: 6600 - Set V6 = 0
44: ffe9 - 
45: d451 - Display 1 - byte sprite starting at memory location I at
(V4, V5), set VF = collision.
46: 3f01 - Skip next instruction if Vf = 1
47: ffe9 - 
48: d451 - Display 1 - byte sprite starting at memory location I at
(V4, V5), set VF = collision.
49: 6600 - Set V6 = 0
4a: 8340 - Set V3 = V4
4b: 7303 - Set V3 = 3 + 3
4c: ffb5 - 
4d: fff8 - 
4e: 8322 - Set V3 = V3 OR V2
4f: 6208 - Set V2 = 8
50: 3300 - Skip next instruction if V3 = 0
51: ffc9 - 
52: 2373 - Call subroutine at 373
53: 8206 - Set V2 = V2x SHR 1.
54: 4308 - Skip next instruction if V3 != 8
55: ffd3 - 
56: 3310 - Skip next instruction if V3 = 10
57: ffd5 - 
58: 2373 - Call subroutine at 373
59: 8206 - Set V2 = V2x SHR 1.
5a: 3318 - Skip next instruction if V3 = 18
5b: ffdd - 
5c: 2373 - Call subroutine at 373
5d: 8206 - Set V2 = V2x SHR 1.
5e: 4320 - Skip next instruction if V3 != 20
5f: ffe7 - 
60: 3328 - Skip next instruction if V3 = 28
61: ffe9 - 
62: 2373 - Call subroutine at 373
63: 3e00 - Skip next instruction if Ve = 0
64: 1307 - Jump to location 307
65: 7906 - Set V9 = 9 + 6
66: 4918 - Skip next instruction if V9 != 18
67: 6900 - Set V9 = 0
68: 6a04 - Set Va = 4
69: 6b0a - Set Vb = a
6a: 6c04 - Set Vc = 4
6b: fff4 - 
6c: 6e0f - Set Ve = f
6d: ffe0 - 
6e: 2347 - Call subroutine at 347
6f: 236b - Call subroutine at 36b
70: fd15 - Set delay timer = Vd
71: 126f - Jump to location 26f
72: f707 - Set V7 = delay timer value (the value of DT is placed into it).
73: 3700 - Skip next instruction if V7 = 0
74: 126f - Jump to location 26f
75: fd15 - Set delay timer = Vd
76: 2347 - Call subroutine at 347
77: ffa4 - 
78: 3b12 - Skip next instruction if Vb = 12
79: 131b - Jump to location 31b
7a: 7c02 - Set Vc = c + 2
7b: fffc - 
7c: 3b02 - Skip next instruction if Vb = 2
7d: 1323 - Jump to location 323
7e: 7c02 - Set Vc = c + 2
7f: 6a04 - Set Va = 4
80: 2347 - Call subroutine at 347
81: 3c18 - Skip next instruction if Vc = 18
82: 126f - Jump to location 26f
83: ffe0 - 
84: ffd3 - 
85: 6014 - Set V0 = 14
86: 6108 - Set V1 = 8
87: 620f - Set V2 = f
88: d01f - Display f - byte sprite starting at memory location I at
(V0, V1), set VF = collision.
89: 7008 - Set V0 = 0 + 8
8a: f21e - Set I = I + V2
8b: 302c - Skip next instruction if V0 = 2c
8c: 1333 - Jump to location 333
8d: f00a - Wait for a key press, store the value of the key in V0
8e: ffe0 - 
8f: fff4 - 
90: fe65 - Read registers V0 through Ve from memory starting at location I.
91: 1225 - Jump to location 225
92: ffb7 - 
93: f91e - Set I = I + V9
94: 6108 - Set V1 = 8
95: 235f - Call subroutine at 35f
96: 8106 - Set V1 = V1x SHR 1.
97: 235f - Call subroutine at 35f
98: 8106 - Set V1 = V1x SHR 1.
99: 235f - Call subroutine at 35f
9a: 8106 - Set V1 = V1x SHR 1.
9b: 235f - Call subroutine at 35f
9c: ffd0 - 
9d: ffee - 
9e: ffe0 - 
9f: 8012 - Set V0 = V0 OR V1
a0: 3000 - Skip next instruction if V0 = 0
a1: ffc6 - 
a2: 7b0c - Set Vb = b + c
a3: ffee - 
a4: ffcf - 
a5: 601c - Set V0 = 1c
a6: d804 - Display 4 - byte sprite starting at memory location I at
(V8, V0), set VF = collision.
a7: ffee - 
a8: 2347 - Call subroutine at 347
a9: 8e23 - Set Ve = Ve XOR V2
aa: 2347 - Call subroutine at 347
ab: 6005 - Set V0 = 5
ac: f018 - Set sound timer = V0
ad: f015 - Set delay timer = V0
ae: f007 - Set V0 = delay timer value (the value of DT is placed into it).
af: 3000 - Skip next instruction if V0 = 0
b0: 137f - Jump to location 37f
b1: ffee - 
b2: 6a00 - Set Va = 0
b3: ffe0 - 
b4: 6b04 - Set Vb = 4
b5: ffa1 - 
b6: 1257 - Jump to location 257
b7: a602 - Set I = 602
b8: fd1e - Set I = I + Vd
b9: f065 - Read registers V0 through V0 from memory starting at location I.
ba: ffff - 
bb: ffa5 - 
bc: 6a00 - Set Va = 0
bd: 6b04 - Set Vb = 4
be: 6d01 - Set Vd = 1
bf: 6e01 - Set Ve = 1
c0: ff8d - 
c1: a500 - Set I = 500
c2: f01e - Set I = I + V0
c3: ffc6 - 
c4: 7b08 - Set Vb = b + 8
c5: 7d01 - Set Vd = d + 1
c6: 7a01 - Set Va = a + 1
c7: 3a07 - Skip next instruction if Va = 7
c8: ff8d - 
c9: ffee - 
ca: 3c7e - Skip next instruction if Vc = 7e
cb: ffff - 
cc: ff99 - 
cd: ffff - 
ce: ff24 - 
cf: ffe7 - 
d0: ffff - 
d1: 3c3c - Skip next instruction if Vc = 3c
d2: ffdb - 
d3: 8142 - Set V1 = V1 OR V4
d4: 3c7e - Skip next instruction if Vc = 7e
d5: ffdb - 
d6: 1038 - Jump to location 38
d7: fffe - 
d8: 0 - 
d9: 7f00 - Set Vf = f + 0
da: 3f00 - Skip next instruction if Vf = 0
db: 7f00 - Set Vf = f + 0
dc: 0 - 
dd: 101 - 
de: 103 - 
df: 303 - 
e0: 300 - 
e1: 3f - 
e2: 2020 - Call subroutine at 20
e3: 2020 - Call subroutine at 20
e4: 2020 - Call subroutine at 20
e5: 2020 - Call subroutine at 20
e6: 3f08 - Skip next instruction if Vf = 8
e7: ffff - 
e8: 0 - 
e9: fe00 - 
ea: fc00 - 
eb: fe00 - 
ec: 0 - 
ed: 7e42 - Set Ve = e + 42
ee: 4262 - Skip next instruction if V2 != 62
ef: 6262 - Set V2 = 62
f0: 6200 - Set V2 = 0
f1: ffff - 
f2: 0 - 
f3: 0 - 
f4: 0 - 
f5: 0 - 
f6: ff00 - 
f7: ffff - 
f8: 7d - 
f9: 41 - 
fa: 7d05 - Set Vd = d + 5
fb: 7d7d - Set Vd = d + 7d
fc: 0 - 
fd: ffc2 - 
fe: c644 - Set V6 = random byte AND 44
ff: 6c28 - Set Vc = 28
100: 3800 - Skip next instruction if V8 = 0
101: ffff - 
102: 0 - 
103: 0 - 
104: 0 - 
105: 0 - 
106: ff00 - 
107: ffff - 
108: fff7 - 
109: 1014 - Jump to location 14
10a: fff7 - 
10b: 404 - 
10c: 0 - 
10d: 7c44 - Set Vc = c + 44
10e: ffc2 - 
10f: ffc2 - 
110: c200 - Set V2 = random byte AND 0
111: ffff - 
112: 0 - 
113: 0 - 
114: 0 - 
115: 0 - 
116: ff00 - 
117: ffff - 
118: ffef - 
119: 2028 - Call subroutine at 28
11a: ffe8 - 
11b: 2f2f - Call subroutine at f2f
11c: 0 - 
11d: ff85 - 
11e: ffc5 - 
11f: ffc5 - 
120: f900 - 
121: ffff - 
122: 0 - 
123: 0 - 
124: 0 - 
125: 0 - 
126: ff00 - 
127: ffff - 
128: ffbe - 
129: 20 - 
12a: 3020 - Skip next instruction if V0 = 20
12b: ffbe - 
12c: 0 - 
12d: f704 - 
12e: ff85 - 
12f: ff84 - 
130: f400 - 
131: ffff - 
132: 0 - 
133: 0 - 
134: 0 - 
135: 0 - 
136: ff00 - 
137: ffff - 
138: 0 - 
139: 7f00 - Set Vf = f + 0
13a: 3f00 - Skip next instruction if Vf = 0
13b: 7f00 - Set Vf = f + 0
13c: 0 - 
13d: ef28 - 
13e: ef00 - 
13f: e060 - 
140: 6f00 - Set Vf = 0
141: ffff - 
142: 0 - 
143: 0 - 
144: 0 - 
145: 0 - 
146: ff00 - 
147: ffff - 
148: 0 - 
149: fe00 - 
14a: fc00 - 
14b: fe00 - 
14c: 0 - 
14d: c000 - Set V0 = random byte AND 0
14e: ffc0 - 
14f: ffc0 - 
150: c000 - Set V0 = random byte AND 0
151: fffc - 
152: 404 - 
153: 404 - 
154: 404 - 
155: 404 - 
156: fc10 - 
157: ffff - 
158: ff81 - 
159: ff8b - 
15a: ff9a - 
15b: fa00 - 
15c: ff8a - 
15d: ff9a - 
15e: ff99 - 
15f: ffe6 - 
160: 2525 - Call subroutine at 525
161: f434 - 
162: 3434 - Skip next instruction if V4 = 34
163: 17 - 
164: 1434 - Jump to location 434
165: 3736 - Skip next instruction if V7 = 36
166: ffc7 - 
167: df50 - Display 0 - byte sprite starting at memory location I at
(Vf, V5), set VF = collision.
168: 505c - Skip next instruction if V0 = 5
169: ffd8 - 
16a: df00 - Display 0 - byte sprite starting at memory location I at
(Vf, V0), set VF = collision.
16b: df11 - Display 1 - byte sprite starting at memory location I at
(Vf, V1), set VF = collision.
16c: 1f12 - Jump to location f12
16d: 1b19 - Jump to location b19
16e: d97c - Display c - byte sprite starting at memory location I at
(V9, V7), set VF = collision.
16f: fffe - 
170: ff86 - 
171: fffc - 
172: fffe - 
173: ff82 - 
174: fffe - 
175: ffc0 - 
176: ffc0 - 
177: fffc - 
178: ffc2 - 
179: ffc2 - 
17a: fffe - 
17b: fff8 - 
17c: ffc0 - 
17d: fffe - 
17e: fff0 - 
17f: ffc0 - 
180: fffe - 
181: ffbe - 
182: ff86 - 
183: ff86 - 
184: fffe - 
185: ff86 - 
186: 8610 - Set V6 = V1
187: 1010 - Jump to location 10
188: 1010 - Jump to location 10
189: 1018 - Jump to location 18
18a: 1818 - Jump to location 818
18b: 4848 - Skip next instruction if V8 != 48
18c: ff9c - 
18d: ffb0 - 
18e: ffb0 - 
18f: ff80 - 
190: ffc0 - 
191: ffc0 - 
192: ffee - 
193: ff92 - 
194: ff86 - 
195: fffe - 
196: ff86 - 
197: ff86 - 
198: 867c - 
199: ff86 - 
19a: ff86 - 
19b: fffe - 
19c: fffe - 
19d: ffc0 - 
19e: c07c - Set V0 = random byte AND 7c
19f: ffc2 - 
1a0: ffc4 - 
1a1: fffe - 
1a2: fffe - 
1a3: ff9c - 
1a4: fffe - 
1a5: fffe - 
1a6: 202 - 
1a7: fffe - 
1a8: 1030 - Jump to location 30
1a9: 3030 - Skip next instruction if V0 = 30
1aa: ff82 - 
1ab: ffc2 - 
1ac: ffc2 - 
1ad: ff82 - 
1ae: ff82 - 
1af: ee38 - 
1b0: ff86 - 
1b1: ff96 - 
1b2: ff92 - 
1b3: ff82 - 
1b4: 4438 - Skip next instruction if V4 != 38
1b5: 3844 - Skip next instruction if V8 = 44
1b6: ff82 - 
1b7: fffe - 
1b8: 3030 - Skip next instruction if V0 = 30
1b9: fffe - 
1ba: 21e - 
1bb: ff80 - 
1bc: fe00 - 
1bd: 0 - 
1be: 6 - 
1bf: 600 - 
1c0: 0 - 
1c1: 6060 - Set V0 = 60
1c2: c000 - Set V0 = random byte AND 0
1c3: 0 - 
1c4: 0 - 
1c5: 18 - 
1c6: 1818 - Jump to location 818
1c7: 1800 - Jump to location 800
1c8: 187c - Jump to location 87c
1c9: c60c - Set V6 = random byte AND c
1ca: 1800 - Jump to location 800
1cb: 1800 - Jump to location 800
1cc: fffe - 
1cd: fe00 - 
1ce: fffe - 
1cf: ff86 - 
1d0: ff86 - 
1d1: fe08 - 
1d2: 808 - 
1d3: 1818 - Jump to location 818
1d4: fffe - 
1d5: fffe - 
1d6: ffc0 - 
1d7: fffe - 
1d8: 21e - 
1d9: 606 - 
1da: ff84 - 
1db: ffc4 - 
1dc: fe04 - 
1dd: fffe - 
1de: fffe - 
1df: 606 - 
1e0: ffc0 - 
1e1: ffc0 - 
1e2: ff82 - 
1e3: fffe - 
1e4: 202 - 
1e5: 606 - 
1e6: 67c - 
1e7: fffe - 
1e8: ff86 - 
1e9: fffe - 
1ea: fffe - 
1eb: 606 - 
1ec: 644 - 
1ed: fe44 - 
1ee: fffe - 
1ef: ffa8 - 
1f0: ffa8 - 
1f1: ffa8 - 
1f2: ffa8 - 
1f3: 6c5a - Set Vc = 5a
1f4: c - 
1f5: ffa8 - 
1f6: 304e - Skip next instruction if V0 = 4e
1f7: 7e00 - Set Ve = e + 0
1f8: 1218 - Jump to location 218
1f9: 666c - Set V6 = 6c
1fa: a85a - Set I = 85a
1fb: 6654 - Set V6 = 54
1fc: 2466 - Call subroutine at 466
1fd: 48 - 
1fe: 4818 - Skip next instruction if V8 != 18
1ff: ffa8 - 
200: ff90 - 
201: a812 - Set I = 812
202: 7e - 
203: 3012 - Skip next instruction if V0 = 12
204: ff84 - 
205: 304e - Skip next instruction if V0 = 4e
206: 7218 - Set V2 = 2 + 18
207: ffa8 - 
208: ffa8 - 
209: ffa8 - 
20a: ff90 - 
20b: 5478 - Skip next instruction if V4 = 7
20c: a848 - Set I = 848
20d: 786c - Set V8 = 8 + 6c
20e: ffa8 - 
20f: 1218 - Jump to location 218
210: 6c72 - Set Vc = 72
211: 6654 - Set V6 = 54
212: ffa8 - 
213: 722a - Set V2 = 2 + 2a
214: ffa8 - 
215: 304e - Skip next instruction if V0 = 4e
216: 7e00 - Set Ve = e + 0
217: 1218 - Jump to location 218
218: 666c - Set V6 = 6c
219: a872 - Set I = 872
21a: ffa8 - 
21b: 5a66 - Skip next instruction if Va = 6
21c: 187e - Jump to location 87e
21d: 184e - Jump to location 84e
21e: ffa8 - 
21f: 722a - Set V2 = 2 + 2a
220: 1830 - Jump to location 830
221: ffa8 - 
222: 304e - Skip next instruction if V0 = 4e
223: 7e00 - Set Ve = e + 0
224: 6c30 - Set Vc = 30
225: 544e - Skip next instruction if V4 = 4
226: ffa8 - 
227: ffa8 - 
228: ffa8 - 
229: ffa8 - 
22a: 4854 - Skip next instruction if V8 != 54
22b: 7e18 - Set Ve = e + 18
22c: ff90 - 
22d: 5478 - Skip next instruction if V4 = 7
22e: ffa8 - 
22f: 6c2a - Set Vc = 2a
230: 305a - Skip next instruction if V0 = 5a
231: ff84 - 
232: 3072 - Skip next instruction if V0 = 72
233: ffa8 - 
234: ffa8 - 
235: 4e - 
236: ffa8 - 
237: ffa2 - 
238: a800 - Set I = 800
239: 4e12 - Skip next instruction if Ve != 12
23a: a86c - Set I = 86c
23b: 2a54 - Call subroutine at a54
23c: 5472 - Skip next instruction if V4 = 7
23d: ff84 - 
23e: 3072 - Skip next instruction if V0 = 72
23f: ffa8 - 
240: ff9c - 
241: a872 - Set I = 872
242: 2a18 - Call subroutine at a18
243: a80c - Set I = 80c
244: 5448 - Skip next instruction if V4 = 4
245: 5a78 - Skip next instruction if Va = 7
246: 7218 - Set V2 = 2 + 18
247: ffa8 - 
248: 7218 - Set V2 = 2 + 18
249: 4242 - Skip next instruction if V2 != 42
24a: ffa8 - 
24b: 722a - Set V2 = 2 + 2a
24c: 72 - 
24d: a872 - Set I = 872
24e: 2a18 - Call subroutine at a18
24f: a830 - Set I = 830
250: 4e7e - Skip next instruction if Ve != 7e
251: 12 - 
252: 1866 - Jump to location 866
253: ffa8 - 
254: 304e - Skip next instruction if V0 = 4e
255: c66 - 
256: 1800 - Jump to location 800
257: 6c18 - Set Vc = 18
258: a872 - Set I = 872
259: 2a18 - Call subroutine at a18
25a: 3066 - Skip next instruction if V0 = 66
25b: a81e - Set I = 81e
25c: 5466 - Skip next instruction if V4 = 6
25d: c18 - 
25e: ffa8 - 
25f: 2454 - Call subroutine at 454
260: 5412 - Skip next instruction if V4 = 1
261: a842 - Set I = 842
262: 780c - Set V8 = 8 + c
263: ffa8 - 
264: ffa8 - 
265: ffa8 - 
266: ffa8 - 
267: ffa8 - 
268: ff00 - 
269: 0 - 
26a: 0 - 
26b: 0 - 
26c: 0 - 
26d: 0 - 
26e: 0 - 
26f: 0 - 
