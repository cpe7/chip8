// Filename : Utility.h
// Author   : Lauren Rush

#pragma once

#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>
using namespace std;

class CUtility
{
public:
	CUtility();
	~CUtility();

	void dissassemble(short const * chip8ram, short const lengthROM16);
};

