// chip8emu.cpp : Defines the entry point for the console application.
// Author        : Lauren Rush
// References    : See file headers.

#include "stdafx.h"

int _tmain(int argc, _TCHAR* argv[])
{
	myCPU chip8;

	if (chip8.loadROM())
	{
		chip8.dissassemble();
		chip8.emulator();
	}

	system("pause"); // Pause until keystroke to observe console...
	return 0;
}

