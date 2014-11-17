// chip8emu.cpp : Defines the entry point for the console application.
// Author        : Lauren Rush
// References    : See file headers.
//                [1] command line params: http://www.cplusplus.com/articles/DEN36Up4/
#include "stdafx.h"

int main(int argc, char *argv[])
{
	myCPU chip8;
	CUtility parseROM;

	if (argc == 2)
	{
		cout << "You've selected: " << argv[1] << endl; // [1]
		if (chip8.loadROM(argv[1]))  // [1]
		{
			parseROM.dissassemble(chip8.chip8ram, chip8.lengthROM16);
	//		chip8.emulator();
		}
	}
	else
	{
		cout << "Usage: chip8emu.exe <ROM_NAME> \n";  // [1]
	}

	system("pause"); // Pause until keystroke to observe console...
	return 0;
}

