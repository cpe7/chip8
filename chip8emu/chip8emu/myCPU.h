// Filename : myCPU.h
// Author   : Lauren Rush
// Ref.     : [1] Chip-8 Instruction set: http://devernay.free.fr/hacks/chip8/C8TECH10.HTM#3.0
//            [2] Display and Keyboard emulation, from Laurence Muller example Chip-8 Emulator
//            http://www.multigesture.net/articles/how-to-write-an-emulator-chip-8-interpreter/

#pragma once

#include "Stack.h"
#include "Utility.h"

class myCPU
{
public:
	myCPU();
	~myCPU();

	bool loadROM(string filename);
	void emulator();
	void keyboardUp(unsigned char key, int x, int y);
	void keyboardDown(unsigned char key, int x, int y);

	short lengthROM16; // 16-bit words length
	short lengthROM8;  // byte length

	// Window size
	int display_width;
	int display_height;

	bool drawFlag; // From Laurence Muller example Chip-8 Emulator, [2]

	CUtility mytimer;

	ofstream debugger;

	///////////////////////////////////////////////////////////////////////////
	// MEMORY MAP, per [1]
	///////////////////////////////////////////////////////////////////////////
	char chip8ram8[0x1000];
	short chip8ram[0x0800]; // 4096 bytes [1]
	                        // 0x0000 - 0x01FF: Reserved for interpretter
	                        // 0x0200 - 0x0FFF: Program/Data RAM

	///////////////////////////////////////////////////////////////////////////
	// REGISTERS, per [1]
	///////////////////////////////////////////////////////////////////////////
	// - 16 general purpose 8-bit registers, Vx where x = 0 to F
	short regVx[0x10];
	// - I, 16-bit register stores memory addresses
	short regI;
	// - DT (delay timer)
	char regDT;
	// - ST (sound timer)
	char regST;
	// - PC (program counter)
	short regPC;
	// - SP (stack pointer)
	char regSP;
	// - Stack: array of 16, 16-bit values
	Stack regStack = Stack(0x10);

	///////////////////////////////////////////////////////////////////////////
	// KEYBOARD, per [1]
	// From Laurence Muller example Chip-8 Emulator, [2]
	///////////////////////////////////////////////////////////////////////////
	unsigned char key[0x10]; // 0-9,A-F keys

	///////////////////////////////////////////////////////////////////////////
	// DISPLAY, per [1]
	// From Laurence Muller example Chip-8 Emulator, [2]
	///////////////////////////////////////////////////////////////////////////
	unsigned char gfx[64 * 32]; // 2048 pixels, 64 x 32 pixels
};

