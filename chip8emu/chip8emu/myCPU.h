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

	unsigned short lengthROM16; // 16-bit words length

	// Window size
	int display_width;
	int display_height;

	bool drawFlag; // From Laurence Muller example Chip-8 Emulator, [2]

	CUtility mytimer;

	///////////////////////////////////////////////////////////////////////////
	// MEMORY MAP, per [1]
	///////////////////////////////////////////////////////////////////////////
	unsigned char chip8ram8[0x1000];
	unsigned short chip8ram[0x0800]; // 4096 bytes [1]
	                        // 0x0000 - 0x01FF: Reserved for interpretter
	                        // 0x0200 - 0x0FFF: Program/Data RAM

	///////////////////////////////////////////////////////////////////////////
	// REGISTERS, per [1]
	///////////////////////////////////////////////////////////////////////////
	// - 16 general purpose 8-bit registers, Vx where x = 0 to F
	unsigned char regVx[0x10]; // correction [2]
	// - I, 16-bit register stores memory addresses
	unsigned short regI; // correction - added 'unsigned' [2]
	// - DT (delay timer)
	unsigned char regDT; // correction - added 'unsigned' [2]
	// - ST (sound timer)
	unsigned char regST; // correction - added 'unsigned' [2]
	// - PC (program counter)
	unsigned short regPC; // correction - added 'unsigned' [2]
	// - SP (stack pointer)
	unsigned short regSP; // correction - added 'unsigned short' [2]
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

