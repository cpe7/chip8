// Filename : Utility.h
// Author   : Lauren Rush

#pragma once
#include <windows.h>
#include <cstdio>
#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>
using namespace std;

class CUtility
{
public:
	unsigned int lastTick;

	CUtility();
	~CUtility();

	void initTime();
	void dissassemble(short const * chip8ram, short const lengthROM16);
	void handleTimers(unsigned char &rST, unsigned char &rDT);
};

