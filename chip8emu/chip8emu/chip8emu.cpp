// chip8emu.cpp : Defines the entry point for the console application.
// Author        : Lauren Rush
// References    : [1] file i/o: http://www.cplusplus.com/doc/tutorial/files/
//                 [2] two bytes at a time: http://www.cplusplus.com/forum/beginner/48160/
//                 [3] Chip-8 Instruction set: http://devernay.free.fr/hacks/chip8/C8TECH10.HTM#3.0

#include "stdafx.h"

int _tmain(int argc, _TCHAR* argv[])
{
	myCPU chip8;

	chip8.dissassemble();

	system("pause"); // Pause until keystroke to observe console...
	return 0;
}

