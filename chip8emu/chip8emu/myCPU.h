// Filename : myCPU.h
// Author   : Lauren Rush
// Ref.     : [3] Chip-8 Instruction set: http://devernay.free.fr/hacks/chip8/C8TECH10.HTM#3.0

#pragma once

#include "Stack.h"
#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>
using namespace std;

class myCPU
{
public:
	myCPU();
	~myCPU();

	bool loadROM(string filename);
	void emulator();

	short lengthROM16; // 16-bit words length
	short lengthROM8;  // byte length
	
	///////////////////////////////////////////////////////////////////////////
	// MEMORY MAP, per [3]
	///////////////////////////////////////////////////////////////////////////
	char chip8ram8[0x0FFF];
	short chip8ram[0x0800]; // 4096 bytes
	                        // 0x0000 - 0x01FF: Reserved for interpretter
	                        // 0x0200 - 0x0FFF: Program/Data RAM

	///////////////////////////////////////////////////////////////////////////
	// REGISTERS, per [3]
	///////////////////////////////////////////////////////////////////////////
	// - 16 general purpose 8-bit registers, Vx where x = 0 to F
	short regVx[0xF];
	// - I, 16-bit register stores memory addresses
	short regI;
	// - VF register used by instructions
	char regVF;
	// - DT (delay timer)
	char regDT;
	bool activeDT;
	// - ST (sound timer)
	char regST;
	bool activeST;
	// - PC (program counter)
	short regPC;
	// - SP (stack pointer)
	char regSP;
	// - Stack: array of 16, 16-bit values
	Stack* regStack;

	///////////////////////////////////////////////////////////////////////////
	// KEYBOARD, per [3]
	///////////////////////////////////////////////////////////////////////////

	///////////////////////////////////////////////////////////////////////////
	// DISPLAY, per [3]
	///////////////////////////////////////////////////////////////////////////
};

