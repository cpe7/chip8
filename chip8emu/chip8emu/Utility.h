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
	void dissassemble(unsigned short const * chip8ram, unsigned short const lengthROM16);
	void handleTimers(unsigned char &rST, unsigned char &rDT);
};

