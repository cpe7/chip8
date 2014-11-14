// Filename : myCPU.cpp
// Author   : Lauren Rush
// Refs     : [1] file i/o: http://www.cplusplus.com/doc/tutorial/files/
//            [2] two bytes at a time: http://www.cplusplus.com/forum/beginner/48160/
//            [3] Chip-8 Instruction set: http://devernay.free.fr/hacks/chip8/C8TECH10.HTM#3.0
//            [4] iomanip: http://en.cppreference.com/w/cpp/io/manip/
//			  [5] rand: http://www.cplusplus.com/reference/cstdlib/rand/?kw=rand

#include "myCPU.h"

///////////////////////////////////////////////////////////////////////////////
// Method:  myCPU::~myCPU()
// Purpose: Destructor
///////////////////////////////////////////////////////////////////////////////
myCPU::~myCPU()
{
}

///////////////////////////////////////////////////////////////////////////////
// Method:  myCPU::myCPU()
// Purpose: Constructor
///////////////////////////////////////////////////////////////////////////////
myCPU::myCPU()
{
	// 0x0000 - 0x01FF: Reserved for interpretter
	// 0x0200 - 0x0FFF: Program/Data RAM
	memset(chip8ram, 0x00, 0x0FFF);
	lengthROM16 = 0;
	lengthROM8 = 0;
	///////////////////////////////////////////////////////////////////////////
	// REGISTERS, per [3]
	///////////////////////////////////////////////////////////////////////////
	// - 16 general purpose 8-bit registers, Vx where x = 0 to F
	memset(regVx, 0, 0xF);
	// - I, 16-bit register stores memory addresses
	regI = 0x00;
	// - VF register used by instructions
	regVF = 0x0;
	// - DT (delay timer)
	regDT = 0x0;
	activeDT = false;
	// - ST (sound timer)
	regST = 0x0;
	activeST = false;
	// - PC (program counter)
	regPC = 0x00;
	// - SP (stack pointer)
	regSP = 0x0;
	// - Stack: array of 16, 16-bit values
	regStack = new Stack(0x10);
}

///////////////////////////////////////////////////////////////////////////////
// Method:  myCPU::loadROM()
// Purpose: Save ROM to RAM
///////////////////////////////////////////////////////////////////////////////
bool myCPU::loadROM()
{
	short msb = 0;
	short lsb = 0;
	short inst = 0;
	ifstream myROM;
	short i = 0x0100; // Start at offset 0x0100, word offset
	short j = 0x0200; // Start at offset 0x0200, byte offset

	// Open binary file [1]
	myROM.open(("..\\Debug\\INVADERS"), ios::binary);

	// File is valid, verify it has been successfully opened...
	if (myROM.is_open())
	{
		cout << "Loading ROM....\n";
		// Until the end of the file, grab bytes...
		do {
			// Read two bytes at a time to [2]
			msb = myROM.get();
			lsb = myROM.get();

			// Save OpCodes byte at a  time
			chip8ram8[j++] = (char)msb;
			chip8ram8[j++] = (char)lsb;

			// Reconstitute instruction, 2 bytes [2]
			inst = ((msb << 0x8) | lsb); 

			// Save OpCodes
			chip8ram[i++] = inst;

			// Reset work variables ...
			msb = 0;
			lsb = 0;
			inst = 0;
		} while (myROM.peek() != EOF); 

		// Save length of ROM (number of 16-bit words)
		lengthROM16 = i-1;
		lengthROM8 = j;
		// Close input file...
		myROM.close();
		return true;
	}
	else // Invalid file or filename...
	{
		cout << "Error opening file" << endl;
		return false;
	}
} // END loadROM()

///////////////////////////////////////////////////////////////////////////////
// Method:  myCPU::dissassemble()
// Purpose: Parse ROM and create source assembly listing to save to file
//          output.s
///////////////////////////////////////////////////////////////////////////////
void myCPU::dissassemble()
{
	ofstream myDIS;

	// Create output file for source assembly listing...
	myDIS.open("output.s");
	myDIS << "ADDRESS    OPCODE     MNEMONIC\n";

	// Start parsing through ROM
	// starting at address 0x0100 (or 0x0200 byte offset) for Program Memory
	for (short i = 0x0100; i < lengthROM16; i++)
	{
		// Parse address, opcode, mnemonic... [4]
		myDIS << hex << setw(4) << setfill('0') << i << "       "
 			  << setw(4) << setfill('0') << chip8ram[i] << "       ";

		//*****************************************************************
		// Parse Instructions [3]
		//*****************************************************************
		// (1) 0nnn - SYS addr
		//	Jump to a machine code routine at nnn.
		//	This instruction is only used on the old computers on which 
		//	Chip - 8 was originally implemented.  
		//  It is ignored by modern interpreters.

		//*****************************************************************
		// (2) 00E0 - CLS
		//	Clear the display.
		//*****************************************************************
		if (chip8ram[i] == 0x00E0)
			myDIS << "CLS\n";

		//*****************************************************************
		// (3) 00EE - RET
		//	Return from a subroutine.
		//*****************************************************************
		if (chip8ram[i] == 0x00EE)
			myDIS << "RET\n";

		//*****************************************************************
		// (4) 1nnn - JP addr
		//	Jump to location nnn.
		//	The interpreter sets the program counter to nnn.
		//*****************************************************************
		if ((chip8ram[i] & 0xF000) == 0x1000)
			myDIS << "JP " << setw(3) << setfill('0') << (0x0FFF & chip8ram[i]);

		//*****************************************************************
		// (5) 2nnn - CALL addr
		//	Call subroutine at nnn.
		//	The interpreter increments the stack pointer, 
		//  then puts the current PC on the top of the stack. 
		//  The PC is then set to nnn.
		//*****************************************************************
		if ((chip8ram[i] & 0xF000) == 0x2000)
			myDIS << "CALL " << setw(3) << setfill('0') << (0x0FFF & chip8ram[i]);

		//*****************************************************************
		// (6) 3xkk - SE Vx, byte
		//	Skip next instruction if Vx = kk.
		//	The interpreter compares register Vx to kk, and if they are 
		//  equal, increments the program counter by 2.
		//*****************************************************************
		if ((chip8ram[i] & 0xF000) == 0x3000)
			myDIS << "SE V" << ((0x0F00 & chip8ram[i]) >> 8) << ", " << (0x00FF & chip8ram[i]);

		//*****************************************************************
		// (7) 4xkk - SNE Vx, byte
		//	Skip next instruction if Vx != kk.
		//	The interpreter compares register Vx to kk, and if they are not
		//  equal, increments the program counter by 2.
		//*****************************************************************
		if ((chip8ram[i] & 0xF000) == 0x4000)
			myDIS << "SNE V" << ((0x0F00 & chip8ram[i]) >> 8) << ", " << (0x00FF & chip8ram[i]);

		//*****************************************************************
		// (8) 5xy0 - SE Vx, Vy
		//	Skip next instruction if Vx = Vy.
		//	The interpreter compares register Vx to register Vy, and if 
		//  they are equal, increments the program counter by 2.
		//*****************************************************************
		if ((chip8ram[i] & 0xF000) == 0x5000)
			myDIS << "SE V" << ((0x0F00 & chip8ram[i]) >> 8) << ", V" << ((0x00F0 & chip8ram[i]) >> 4);

		//*****************************************************************
		// (9) 6xkk - LD Vx, byte
		//	Set Vx = kk.
		//	The interpreter puts the value kk into register Vx.
		//*****************************************************************
		if ((chip8ram[i] & 0xF000) == 0x6000)
			myDIS << "LD V" << ((0x0F00 & chip8ram[i]) >> 8) << ", " << (0x00FF & chip8ram[i]);

		//*****************************************************************
		// (10)	7xkk - ADD Vx, byte
		//	Set Vx = Vx + kk.
		//	Adds the value kk to the value of register Vx, then stores the 
		//  result in Vx.
		//*****************************************************************
		if ((chip8ram[i] & 0xF000) == 0x7000)
			myDIS << "ADD V" << ((0x0F00 & chip8ram[i]) >> 8) << ", " << (0x00FF & chip8ram[i]);

		//*****************************************************************
		// (11)	8xy0 - LD Vx, Vy
		//	Set Vx = Vy.
		//	Stores the value of register Vy in register Vx.
		//*****************************************************************
		if ((chip8ram[i] & 0xF00F) == 0x8000)
			myDIS << "LD V" << ((0x0F00 & chip8ram[i]) >> 8) << ", V" << ((0x00F0 & chip8ram[i]) >> 4);

		//*****************************************************************
		// (12)	8xy1 - OR Vx, Vy
		//	Set Vx = Vx OR Vy.
		//	Performs a bitwise OR on the values of Vx and Vy, then stores 
		//  the result in Vx.
		//  A bitwise OR compares the corrseponding bits from two values, 
		//  and if either bit is 1, then the same bit in the result is 
		//  also 1. 
		//  Otherwise, it is 0.
		//*****************************************************************
		if ((chip8ram[i] & 0xF00F) == 0x8001)
			myDIS << "OR V" << ((0x0F00 & chip8ram[i]) >> 8) << ", V" << ((0x00F0 & chip8ram[i]) >> 4);

		//*****************************************************************
		// (13)	8xy2 - AND Vx, Vy
		//	Set Vx = Vx AND Vy.
		//	Performs a bitwise AND on the values of Vx and Vy, then stores 
		//  the result in Vx.
		//  A bitwise AND compares the corrseponding bits from two values, 
		//  and if both bits are 1, then the same bit in the result is 
		//  also 1. 
		//  Otherwise, it is 0.
		//*****************************************************************
		if ((chip8ram[i] & 0xF00F) == 0x8002)
			myDIS << "AND V" << ((0x0F00 & chip8ram[i]) >> 8) << ", V" << ((0x00F0 & chip8ram[i]) >> 4);

		//*****************************************************************
		// (14)	8xy3 - XOR Vx, Vy
		//	Set Vx = Vx XOR Vy.
		//	Performs a bitwise exclusive OR on the values of Vx and Vy, then stores the result in Vx.
		//  An exclusive OR compares the corrseponding bits from two values, and if the bits are not 
		//  both the same, then the corresponding bit in the result is set to 1. Otherwise, it is 0.
		//*****************************************************************
		if ((chip8ram[i] & 0xF00F) == 0x8003)
			myDIS << "XOR V" << ((0x0F00 & chip8ram[i]) >> 8) << ", V" << ((0x00F0 & chip8ram[i]) >> 4);

		//*****************************************************************
		// (15)	8xy4 - ADD Vx, Vy
		//	Set Vx = Vx + Vy, set VF = carry.
		//	The values of Vx and Vy are added together.
		//   If the result is greater than 8 bits(i.e., > 255, ) 
		//   VF is set to 1, otherwise 0. Only the lowest 8 bits of the result are kept, and stored in Vx.
		//*****************************************************************
		if ((chip8ram[i] & 0xF00F) == 0x8004)
			myDIS << "ADD V" << ((0x0F00 & chip8ram[i]) >> 8) << ", V" << ((0x00F0 & chip8ram[i]) >> 4);

		//*****************************************************************
		// (16)	8xy5 - SUB Vx, Vy
		//	Set Vx = Vx - Vy, set VF = NOT borrow.
		//	If Vx > Vy, then VF is set to 1, otherwise 0. Then Vy is subtracted from Vx, and the results stored in Vx.
		//*****************************************************************
		if ((chip8ram[i] & 0xF00F) == 0x8005)
			myDIS << "SUB V" << ((0x0F00 & chip8ram[i]) >> 8) << ", V" << ((0x00F0 & chip8ram[i]) >> 4);

		//*****************************************************************
		// (17)	8xy6 - SHR Vx{ , Vy }
		//  Set Vx = Vx SHR 1.
		//	If the least - significant bit of Vx is 1, then VF is set to 1, otherwise 0. Then Vx is divided by 2.
		//*****************************************************************
		if ((chip8ram[i] & 0xF00F) == 0x8006)
			myDIS << "SHR V" << ((0x0F00 & chip8ram[i]) >> 8) << "{ , V" << ((0x00F0 & chip8ram[i]) >> 4) << " }";

		//*****************************************************************
		// (18)	8xy7 - SUBN Vx, Vy
		//	Set Vx = Vy - Vx, set VF = NOT borrow.
		//	If Vy > Vx, then VF is set to 1, otherwise 0. Then Vx is subtracted from Vy, and the results stored in Vx.
		//*****************************************************************
		if ((chip8ram[i] & 0xF00F) == 0x8007)
			myDIS << "SUBN V" << ((0x0F00 & chip8ram[i]) >> 8) << ", V" << ((0x00F0 & chip8ram[i]) >> 4);

		//*****************************************************************
		// (19)	8xyE - SHL Vx{ , Vy }
		//  Set Vx = Vx SHL 1.
		//	If the most - significant bit of Vx is 1, then VF is set to 1, otherwise to 0. Then Vx is multiplied by 2.
		//*****************************************************************
		if ((chip8ram[i] & 0xF00F) == 0x800E)
			myDIS << "SHL V" << ((0x0F00 & chip8ram[i]) >> 8) << "{ , V" << ((0x00F0 & chip8ram[i]) >> 4) << " }";

		//*****************************************************************
		// (20)	9xy0 - SNE Vx, Vy
		//	Skip next instruction if Vx != Vy.
		//	The values of Vx and Vy are compared, and if they are not equal, the program counter is increased by 2.
		//*****************************************************************
		if ((chip8ram[i] & 0xF000) == 0x9000)
			myDIS << "SNE V" << ((0x0F00 & chip8ram[i]) >> 8) << ", V" << ((0x00F0 & chip8ram[i]) >> 4);

		//*****************************************************************
		// (21)	Annn - LD I, addr
		//	Set I = nnn.
		//	The value of register I is set to nnn.
		//*****************************************************************
		if ((chip8ram[i] & 0xF000) == 0xA000)
			myDIS << "LD I, " << setw(3) << setfill('0') << (0x0FFF & chip8ram[i]);

		//*****************************************************************
		// (22)	Bnnn - JP V0, addr
		//	Jump to location nnn + V0.
		//	The program counter is set to nnn plus the value of V0.
		//*****************************************************************
		if ((chip8ram[i] & 0xF000) == 0xB000)
			myDIS << "JP V0, " << setw(3) << setfill('0') << (0x0FFF & chip8ram[i]);

		//*****************************************************************
		// (23)	Cxkk - RND Vx, byte
		//	Set Vx = random byte AND kk.
		//	The interpreter generates a random number from 0 to 255, which is then ANDed with the value kk.
		//  The results are stored in Vx.See instruction 8xy2 for more information on AND.
		//*****************************************************************
		if ((chip8ram[i] & 0xF000) == 0xC000)
			myDIS << "RND V" << ((0x0F00 & chip8ram[i]) >> 8) << ", " << (0x00FF & chip8ram[i]);

		//*****************************************************************
		// (24)	Dxyn - DRW Vx, Vy, nibble
		//	Display n - byte sprite starting at memory location I at(Vx, Vy), set VF = collision.
		//	The interpreter reads n bytes from memory, starting at the address stored in I.
		//  These bytes are then displayed as sprites on screen at coordinates(Vx, Vy).
		//  Sprites are XORed onto the existing screen.  If this causes any pixels to be erased, VF is set to 1, otherwise it is set to 0. 
		//  If the sprite is positioned so part of it is outside the coordinates of the display, it wraps around to the opposite side of the screen.
		//  See instruction 8xy3 for more information on XOR, and section 2.4, Display, for more information on the Chip - 8 screen and sprites.
		//*****************************************************************
		if ((chip8ram[i] & 0xF000) == 0xD000)
			myDIS << "DRW V" << ((0x0F00 & chip8ram[i]) >> 8) << ", V" << ((0x00F0 & chip8ram[i]) >> 4) << ", " << (0x000F & chip8ram[i]);

		//*****************************************************************
		// (25) Ex9E - SKP Vx
		//	Skip next instruction if key with the value of Vx is pressed.
		//	Checks the keyboard, and if the key corresponding to the value 
		//  of Vx is currently in the down position, PC is increased by 2.
		//*****************************************************************
		if ((chip8ram[i] & 0xF000) == 0xE09E)
			myDIS << "SKP V" << ((0x0F00 & chip8ram[i]) >> 8);

		//*****************************************************************
		// (26) ExA1 - SKNP Vx
		//	Skip next instruction if key with the value of Vx is not pressed.
		//	Checks the keyboard, and if the key corresponding to the value 
		//  of Vx is currently in the up position, PC is increased by 2.
		//*****************************************************************
		if ((chip8ram[i] & 0xF0FF) == 0xE0A1)
			myDIS << "SKNP V" << ((0x0F00 & chip8ram[i]) >> 8);

		//*****************************************************************
		// (27)	Fx07 - LD Vx, DT
		//	Set Vx = delay timer value.
		//	The value of DT is placed into Vx.
		//*****************************************************************
		if ((chip8ram[i] & 0xF0FF) == 0xF007)
			myDIS << "LD V" << ((0x0F00 & chip8ram[i]) >> 8) << ", DT";

		//*****************************************************************
		// (28)	Fx0A - LD Vx, K
		//	Wait for a key press, store the value of the key in Vx.
		//	All execution stops until a key is pressed, then the value of that key is stored in Vx.
		//*****************************************************************
		if ((chip8ram[i] & 0xF0FF) == 0xF00A)
			myDIS << "LD V" << ((0x0F00 & chip8ram[i]) >> 8) << ", K";

		//*****************************************************************
		// (29)	Fx15 - LD DT, Vx
		//	Set delay timer = Vx.
		//	DT is set equal to the value of Vx.
		//*****************************************************************
		if ((chip8ram[i] & 0xF0FF) == 0xF015)
			myDIS << "LD DT, V" << ((0x0F00 & chip8ram[i]) >> 8);

		//*****************************************************************
		// (30)	Fx18 - LD ST, Vx
		//	Set sound timer = Vx.
		//	ST is set equal to the value of Vx.
		//*****************************************************************
		if ((chip8ram[i] & 0xF0FF) == 0xF018)
			myDIS << "LD ST, V" << ((0x0F00 & chip8ram[i]) >> 8);

		//*****************************************************************
		// (31)	Fx1E - ADD I, Vx
		//	Set I = I + Vx.
		//	The values of I and Vx are added, and the results are stored in I.
		//*****************************************************************
		if ((chip8ram[i] & 0xF0FF) == 0xF01E)
			myDIS << "ADD I, V" << ((0x0F00 & chip8ram[i]) >> 8);

		//*****************************************************************
		// (32)	Fx29 - LD F, Vx
		//	Set I = location of sprite for digit Vx.
		//	The value of I is set to the location for the hexadecimal sprite corresponding to the value of Vx.
		//   See section 2.4, Display, for more information on the Chip - 8 hexadecimal font.
		//*****************************************************************
		if ((chip8ram[i] & 0xF0FF) == 0xF029)
			myDIS << "LD F, V" << ((0x0F00 & chip8ram[i]) >> 8);

		//*****************************************************************
		// (33)	Fx33 - LD B, Vx
		//	Store BCD representation of Vx in memory locations I, I + 1, and I + 2.
		//	The interpreter takes the decimal value of Vx, and places the hundreds digit in memory at location 
		//   in I, the tens digit at location I + 1, and the ones digit at location I + 2.
		//*****************************************************************
		if ((chip8ram[i] & 0xF0FF) == 0xF033)
			myDIS << "LD B, V" << ((0x0F00 & chip8ram[i]) >> 8);

		//*****************************************************************
		// (34)	Fx55 - LD[I], Vx
		//	Store registers V0 through Vx in memory starting at location I.
		//	The interpreter copies the values of registers V0 through Vx into memory, starting at the address in I.
		//*****************************************************************
		if ((chip8ram[i] & 0xF0FF) == 0xF055)
			myDIS << "LD[I], V" << ((0x0F00 & chip8ram[i]) >> 8);

		//*****************************************************************
		// (35)	Fx65 - LD Vx, [I]
		//	Read registers V0 through Vx from memory starting at location I.
		//	The interpreter reads values from memory starting at location I into registers V0 through Vx.
		//*****************************************************************
		if ((chip8ram[i] & 0xF0FF) == 0xF065)
			myDIS << "LD V" << ((0x0F00 & chip8ram[i]) >> 8) << ", [I]";

		myDIS << endl;
	}

	// Close file, when done...
	myDIS.close();
}

///////////////////////////////////////////////////////////////////////////////
// Method:  myCPU::emulator()
// Purpose: Execute ROM
///////////////////////////////////////////////////////////////////////////////
void myCPU::emulator()
{
	short msb = 0;
	short lsb = 0;
	short inst = 0;
	
	cout << "Press CTRL+c to exit...\n";

	// Process ROM OpCodes...
	// starting at address 0x0100 (or 0x0200 byte offset) for Program Memory
	for (short i = 0x0200; i < lengthROM8;)
	{
		// Reconstitute instruction, 2 bytes [2]
		msb = 0;
		lsb = 0;
		inst = 0;
		msb = (short)chip8ram8[i];
		lsb = (short)chip8ram8[i + 1];
		inst = (((msb&0xFF) << 0x8) | (lsb&0xFF));

		//*****************************************************************
		// Parse Instructions [3]
		//*****************************************************************
		// (1) 0nnn - SYS addr
		//	Jump to a machine code routine at nnn.
		//	This instruction is only used on the old computers on which 
		//	Chip - 8 was originally implemented.  
		//  It is ignored by modern interpreters.

		//*****************************************************************
		// (2) 00E0 - CLS
		//	Clear the display.
		//*****************************************************************
		if (inst == 0x00E0)
		{
			// TBD
			regPC += 2;
			i = regPC;
		}

		//*****************************************************************
		// (3) 00EE - RET
		//	Return from a subroutine.
		//  The interpreter sets the program counter to the address at the 
		//  top of the stack, then subtracts 1 from the stack pointer.
		//*****************************************************************
		if (inst == 0x00EE)
		{
			regPC = regStack->pop();
			regSP--;
			i = regPC;
		}

		//*****************************************************************
		// (4) 1nnn - JP addr
		//	Jump to location nnn.
		//	The interpreter sets the program counter to nnn.
		//*****************************************************************
		else if ((inst & 0xF000) == 0x1000)
		{
			regPC = (0x0FFF & inst);
			i = regPC;
		}

		//*****************************************************************
		// (5) 2nnn - CALL addr
		//	Call subroutine at nnn.
		//	The interpreter increments the stack pointer, 
		//  then puts the current PC on the top of the stack. 
		//  The PC is then set to nnn.
		//*****************************************************************
		else if ((inst & 0xF000) == 0x2000)
		{
			regSP++;
			regStack->push(regPC);
			regPC = (0x0FFF & inst);
			i = regPC;
		}

		//*****************************************************************
		// (6) 3xkk - SE Vx, byte
		//	Skip next instruction if Vx = kk.
		//	The interpreter compares register Vx to kk, and if they are 
		//  equal, increments the program counter by 2.
		//*****************************************************************
		else if ((inst & 0xF000) == 0x3000)
		{
			if (regVx[((0x0F00 & inst) >> 8)] == (0x00FF & inst))
			{
				regPC += 4;
				i = regPC;
			}
			else
			{
				regPC += 2;
				i = regPC;
			}
		}

		//*****************************************************************
		// (7) 4xkk - SNE Vx, byte
		//	Skip next instruction if Vx != kk.
		//	The interpreter compares register Vx to kk, and if they are not
		//  equal, increments the program counter by 2.
		//*****************************************************************
		else if ((inst & 0xF000) == 0x4000)
		{
			if (regVx[((0x0F00 & inst) >> 8)] != (0x00FF & inst))
			{
				regPC += 4;
				i = regPC;
			}
			else
			{
				regPC += 2;
				i = regPC;
			}
		}

		//*****************************************************************
		// (8) 5xy0 - SE Vx, Vy
		//	Skip next instruction if Vx = Vy.
		//	The interpreter compares register Vx to register Vy, and if 
		//  they are equal, increments the program counter by 2.
		//*****************************************************************
		else if ((inst & 0xF000) == 0x5000)
		{
			if (regVx[((0x0F00 & inst) >> 8)] == regVx[((0x00F0 & inst) >> 4)])
			{
				regPC += 4;
				i = regPC;
			}
			else
			{
				regPC += 2;
				i = regPC;
			}
		}

		//*****************************************************************
		// (9) 6xkk - LD Vx, byte
		//	Set Vx = kk.
		//	The interpreter puts the value kk into register Vx.
		//*****************************************************************
		else if ((inst & 0xF000) == 0x6000)
		{
			regVx[((0x0F00 & inst) >> 8)] = (0x00FF & inst);
			regPC+=2;
			i = regPC;
		}

		//*****************************************************************
		// (10)	7xkk - ADD Vx, byte
		//	Set Vx = Vx + kk.
		//	Adds the value kk to the value of register Vx, then stores the 
		//  result in Vx.
		//*****************************************************************
		else if ((inst & 0xF000) == 0x7000)
		{
			regVx[((0x0F00 & inst) >> 8)] += (0x00FF & inst);
			regPC+=2;
			i = regPC;
		}

		//*****************************************************************
		// (11)	8xy0 - LD Vx, Vy
		//	Set Vx = Vy.
		//	Stores the value of register Vy in register Vx.
		//*****************************************************************
		else if ((inst & 0xF00F) == 0x8000)
		{
			regVx[((0x0F00 & inst) >> 8)] = regVx[((0x00F0 & inst) >> 4)];
			regPC+=2;
			i = regPC;
		}

		//*****************************************************************
		// (12)	8xy1 - OR Vx, Vy
		//	Set Vx = Vx OR Vy.
		//	Performs a bitwise OR on the values of Vx and Vy, then stores 
		//  the result in Vx.
		//*****************************************************************
		else if ((inst & 0xF00F) == 0x8001)
		{
			regVx[((0x0F00 & inst) >> 8)] |= regVx[((0x00F0 & inst) >> 4)];
			regPC+=2;
			i = regPC;
		}

		//*****************************************************************
		// (13)	8xy2 - AND Vx, Vy
		//	Set Vx = Vx AND Vy.
		//	Performs a bitwise AND on the values of Vx and Vy, then stores 
		//  the result in Vx.
		//*****************************************************************
		else if ((inst & 0xF00F) == 0x8002)
		{
			regVx[((0x0F00 & inst) >> 8)] &= regVx[((0x00F0 & inst) >> 4)];
			regPC+=2;
			i = regPC;
		}

		//*****************************************************************
		// (14)	8xy3 - XOR Vx, Vy
		//	Set Vx = Vx XOR Vy.
		//	Performs a bitwise exclusive OR on the values of Vx and Vy, 
		//  then stores the result in Vx.
		//*****************************************************************
		else if ((inst & 0xF00F) == 0x8003)
		{
			regVx[((0x0F00 & inst) >> 8)] ^= regVx[((0x00F0 & inst) >> 4)];
			regPC+=2;
			i = regPC;
		}

		//*****************************************************************
		// (15)	8xy4 - ADD Vx, Vy
		//	Set Vx = Vx + Vy, set VF = carry.
		//	The values of Vx and Vy are added together.
		//   If the result is greater than 8 bits(i.e., > 255, ) 
		//   VF is set to 1, otherwise 0. 
		//  Only the lowest 8 bits of the result are kept, and stored in Vx.
		//*****************************************************************
		else if ((inst & 0xF00F) == 0x8004)
		{
			regVx[((0x0F00 & inst) >> 8)] += regVx[((0x00F0 & inst) >> 4)];
			if (regVx[((0x0F00 & inst) >> 8)] > 255)
			{
				regVF = 1;
				regVx[((0x0F00 & inst) >> 8)] &= 0xF;
			}
			else
				regVF = 0;

			regPC+=2;
			i = regPC;
		}

		//*****************************************************************
		// (16)	8xy5 - SUB Vx, Vy
		//	Set Vx = Vx - Vy, set VF = NOT borrow.
		//	If Vx > Vy, then VF is set to 1, otherwise 0. 
		//  Then Vy is subtracted from Vx, and the results stored in Vx.
		//*****************************************************************
		else if ((inst & 0xF00F) == 0x8005)
		{
			if (regVx[((0x0F00 & inst) >> 8)] > regVx[((0x00F0 & inst) >> 4)])
				regVF = 1;

			regVx[((0x0F00 & inst) >> 8)] -= regVx[((0x00F0 & inst) >> 4)];

			regPC+=2;
			i = regPC;
		}

		//*****************************************************************
		// (17)	8xy6 - SHR Vx{ , Vy }
		//  Set Vx = Vx SHR 1.
		//	If the least - significant bit of Vx is 1, then VF is set to 1, 
		//  otherwise 0. Then Vx is divided by 2.
		//*****************************************************************
		else if ((inst & 0xF00F) == 0x8006)
		{
			regVF = (regVx[((0x0F00 & inst) >> 8)] & 0x1);
			regVx[((0x0F00 & inst) >> 8)] = regVx[((0x0F00 & inst) >> 8)] >> 1;
			regPC += 2;
			i = regPC;
		}

		//*****************************************************************
		// (18)	8xy7 - SUBN Vx, Vy
		//	Set Vx = Vy - Vx, set VF = NOT borrow.
		//	If Vy > Vx, then VF is set to 1, otherwise 0. 
		//  Then Vx is subtracted from Vy, and the results stored in Vx.
		//*****************************************************************
		else if ((inst & 0xF00F) == 0x8007)
		{
			if (regVx[((0x00F0 & inst) >> 4)] > regVx[((0x0F00 & inst) >> 8)])
				regVF = 1;
			else
				regVF = 0;

			regVx[((0x0F00 & inst) >> 8)] = regVx[((0x00F0 & inst) >> 4)] - regVx[((0x0F00 & inst) >> 8)];
			regPC+=2;
			i = regPC;
		}

		//*****************************************************************
		// (19)	8xyE - SHL Vx{ , Vy }
		//  Set Vx = Vx SHL 1.
		//	If the most significant bit of Vx is 1, then VF is set to 1, 
		//  otherwise to 0. Then Vx is multiplied by 2.
		//*****************************************************************
		else if ((inst & 0xF00F) == 0x800E)
		{
			regVF = (regVx[((0x0F00 & inst) >> 8)] & 0xFE);
			regVx[((0x0F00 & inst) >> 8)] = regVx[((0x0F00 & inst) >> 8)] << 1;
			regPC+=2;
			i = regPC;
		}

		//*****************************************************************
		// (20)	9xy0 - SNE Vx, Vy
		//	Skip next instruction if Vx != Vy.
		//	The values of Vx and Vy are compared, and if they are not 
		//  equal, the program counter is increased by 2.
		//*****************************************************************
		else if ((inst & 0xF000) == 0x9000)
		{
			if (regVx[((0x0F00 & inst) >> 8)] != regVx[((0x00F0 & inst) >> 4)])
			{
				regPC += 2;
				i = regPC;
			}
		}

		//*****************************************************************
		// (21)	Annn - LD I, addr
		//	Set I = nnn.
		//	The value of register I is set to nnn.
		//*****************************************************************
		else if ((inst & 0xF000) == 0xA000)
		{
			regI = (0x0FFF & inst);
			regPC+=2;
			i = regPC;
		}

		//*****************************************************************
		// (22)	Bnnn - JP V0, addr
		//	Jump to location nnn + V0.
		//	The program counter is set to nnn plus the value of V0.
		//*****************************************************************
		else if ((inst & 0xF000) == 0xB000)
		{
			regPC = regVx[0] + (0x0FFF & inst);
			i = regPC;
		}

		//*****************************************************************
		// (23)	Cxkk - RND Vx, byte
		//	Set Vx = random byte AND kk.
		//	The interpreter generates a random number from 0 to 255, which 
		//   is then ANDed with the value kk.
		//  The results are stored in Vx.
		//*****************************************************************
		else if ((inst & 0xF000) == 0xC000)
		{
			char temp = rand() % 255; // [5]
			regVx[((0x0F00 & inst) >> 8)] = temp & ((0x00FF) & inst);
			regPC += 2;
			i = regPC;
		}

		
		//*****************************************************************
		// (24)	Dxyn - DRW Vx, Vy, nibble
		//	Display n - byte sprite starting at memory location I at(Vx, Vy), set VF = collision.
		//	The interpreter reads n bytes from memory, starting at the address stored in I.
		//  These bytes are then displayed as sprites on screen at coordinates(Vx, Vy).
		//  Sprites are XORed onto the existing screen.  If this causes any pixels to be erased, VF is set to 1, otherwise it is set to 0. 
		//  If the sprite is positioned so part of it is outside the coordinates of the display, it wraps around to the opposite side of the screen.
		//  See instruction 8xy3 for more information on XOR, and section 2.4, Display, for more information on the Chip - 8 screen and sprites.
		//*****************************************************************
		else if ((inst & 0xF000) == 0xD000)
		{
			// TBD
			regPC += 2;
			i = regPC;
		}
		
		//*****************************************************************
		// (25) Ex9E - SKP Vx
		//	Skip next instruction if key with the value of Vx is pressed.
		//	Checks the keyboard, and if the key corresponding to the value 
		//  of Vx is currently in the down position, PC is increased by 2.
		//*****************************************************************
		else if ((inst & 0xF000) == 0xE09E)
		{
			// TBD
			regPC += 2;
			i = regPC;
		}

		//*****************************************************************
		// (26) ExA1 - SKNP Vx
		//	Skip next instruction if key with the value of Vx is not pressed.
		//	Checks the keyboard, and if the key corresponding to the value 
		//  of Vx is currently in the up position, PC is increased by 2.
		//*****************************************************************
		else if ((inst & 0xF0FF) == 0xE0A1)
		{
			// TBD
			regPC += 2;
			i = regPC;
		}

		//*****************************************************************
		// (27)	Fx07 - LD Vx, DT
		//	Set Vx = delay timer value.
		//	The value of DT is placed into Vx.
		//*****************************************************************
		else if ((inst & 0xF0FF) == 0xF007)
		{
			regVx[((0x0F00 & inst) >> 8)] = regDT;
			regPC += 2;
			i = regPC;
		}
		
		//*****************************************************************
		// (28)	Fx0A - LD Vx, K
		//	Wait for a key press, store the value of the key in Vx.
		//	All execution stops until a key is pressed, then the value of 
		//  that key is stored in Vx.
		//*****************************************************************
		else if ((inst & 0xF0FF) == 0xF00A)
		{
			// TBD
			regPC += 2;
			i = regPC;
		}

		//*****************************************************************
		// (29)	Fx15 - LD DT, Vx
		//	Set delay timer = Vx.
		//	DT is set equal to the value of Vx.
		//*****************************************************************
		else if ((inst & 0xF0FF) == 0xF015)
		{
			regDT = (char)regVx[((0x0F00 & inst) >> 8)];
			if (regDT > 0)
				activeDT = true;
			regPC += 2;
			i = regPC;
		}

		//*****************************************************************
		// (30)	Fx18 - LD ST, Vx
		//	Set sound timer = Vx.
		//	ST is set equal to the value of Vx.
		//*****************************************************************
		else if ((inst & 0xF0FF) == 0xF018)
		{
			// The sound timer is active whenever the sound timer register
			// (ST)is non - zero.  This timer also decrements at a rate of 
			// 60Hz, however, as long as ST's value is greater than zero,
			// the Chip-8 buzzer will sound. When ST reaches zero, the 
			// sound timer deactivates.
			// The sound produced by the Chip - 8 interpreter has only one 
			// tone.  The frequency of this tone is decided by the author 
			//  of the interpreter.
			regST = (char)regVx[((0x0F00 & inst) >> 8)];
			if (regST > 0)
				activeST = true;
			regPC += 2;
			i = regPC;
		}

		//*****************************************************************
		// (31)	Fx1E - ADD I, Vx
		//	Set I = I + Vx.
		//	The values of I and Vx are added, and the results are stored in I.
		//*****************************************************************
		else if ((inst & 0xF0FF) == 0xF01E)
		{
			regI += regVx[((0x0F00 & inst) >> 8)];
			regPC += 2;
			i = regPC;
		}

		//*****************************************************************
		// (32)	Fx29 - LD F, Vx
		//	Set I = location of sprite for digit Vx.
		//	The value of I is set to the location for the hexadecimal sprite corresponding to the value of Vx.
		//   See section 2.4, Display, for more information on the Chip - 8 hexadecimal font.
		//*****************************************************************
		else if ((inst & 0xF0FF) == 0xF029)
		{
			// TBD
			regPC += 2;
			i = regPC;
		}

		//*****************************************************************
		// (33)	Fx33 - LD B, Vx
		//	Store BCD representation of Vx in memory locations I, I + 1, and I + 2.
		//	The interpreter takes the decimal value of Vx, and places the hundreds digit in memory at location 
		//   in I, the tens digit at location I + 1, and the ones digit at location I + 2.
		//*****************************************************************
		else if ((inst & 0xF0FF) == 0xF033)
		{
			chip8ram8[regI] = (char)regVx[((0x0F00 & inst) >> 8)];
			chip8ram8[regI+1] = (char)regVx[((0x0F00 & inst) >> 8)];
			chip8ram8[regI+2] = (char)regVx[((0x0F00 & inst) >> 8)];
			regPC += 2;
			i = regPC;
		}

		//*****************************************************************
		// (34)	Fx55 - LD[I], Vx
		//	Store registers V0 through Vx in memory starting at location I.
		//	The interpreter copies the values of registers V0 through Vx 
		//  into memory, starting at the address in I.
		//*****************************************************************
		else if ((inst & 0xF0FF) == 0xF055)
		{
			for (short m = 0; m < 0x10; m++)
				chip8ram8[regI++] = (char)regVx[m];

			regPC += 2;
			i = regPC;
		}

		//*****************************************************************
		// (35)	Fx65 - LD Vx, [I]
		//	Read registers V0 through Vx from memory starting at location I.
		//	The interpreter reads values from memory starting at location I 
		//  into registers V0 through Vx.
		//*****************************************************************
		else if ((inst & 0xF0FF) == 0xF065)
		{
			for (short m = 0; m < 0x10; m++)
				regVx[m] = chip8ram8[regI++];

			regPC += 2;
			i = regPC;
		}
		else // unknown instruction
		{
			regPC += 2;
			i = regPC;
		}
	}
}


// TBD - delay timer register simulation
// TBD - sound timer register simulation
// http://cboard.cprogramming.com/cplusplus-programming/52392-producing-beep-sound-cplusplus.html
// TBD - Display 
// TBD - keyboard