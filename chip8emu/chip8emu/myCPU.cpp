// Filename : myCPU.cpp
// Author   : Lauren Rush
// Refs     : [1] file i/o: http://www.cplusplus.com/doc/tutorial/files/
//            [2] two bytes at a time: http://www.cplusplus.com/forum/beginner/48160/
//            [3] Chip-8 Instruction set: http://devernay.free.fr/hacks/chip8/C8TECH10.HTM#3.0
//            [4] iomanip: http://en.cppreference.com/w/cpp/io/manip/
//			  [5] rand: http://www.cplusplus.com/reference/cstdlib/rand/?kw=rand
//			  [6] Laurence Muller, Chip-8 Emulator: 
//            http://www.multigesture.net/articles/how-to-write-an-emulator-chip-8-interpreter/
//            [7] Lyndon Armitage, Chip-8 Emulator:
//            http://lyndonarmitage.com/chip-8-emulator/
//            https://github.com/LyndonArmitage/Chip8/blob/master/Chip8/Chip8.cpp
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
	memset(chip8ram, 0x0000, LENGTH_WORDS);
	lengthROM16 = 0;

	// Window size
	display_width = 64 * 10;
	display_height = 32 * 10;

	drawFlag = true; // See header refs.
	memset(gfx, 0x00, LENGTH_WORDS);

	for (unsigned int i = 0; i < NUM_REGS; i++)
		key[i] = 0; // not pressed

	///////////////////////////////////////////////////////////////////////////
	// REGISTERS, per [3]
	///////////////////////////////////////////////////////////////////////////
	// - 16 general purpose 8-bit registers, Vx where x = 0 to F
	memset(regVx, 0x00, NUM_REGS);
	// - I, 16-bit register stores memory addresses
	regI = 0x00;
	// - DT (delay timer)
	regDT = 0x0;
	// - ST (sound timer)
	regST = 0x0;
	// - PC (program counter)
	regPC = 0x0200; // correction [6]
	// - SP (stack pointer)
	regSP = 0x0;
	// - Stack: array of 16, 16-bit values
	regStack = Stack(NUM_REGS);

	/////////////////////
	// parsing variables
	/////////////////////
	msb = 0;
	lsb = 0;
	inst = 0;
	firstentry = false;
	index = 0; // index
}

///////////////////////////////////////////////////////////////////////////////
// Method:  myCPU::loadROM()
// Purpose: Save ROM to RAM
///////////////////////////////////////////////////////////////////////////////
bool myCPU::loadROM(string filename)
{
	unsigned short msb = 0;
	unsigned short lsb = 0;
	unsigned short inst = 0;

	unsigned short i = 0x0100; // Start at offset 0x0100, word offset
	unsigned short j = 0x0200; // Start at offset 0x0200, byte offset

	// Open binary file [1]
	ifstream myROM;
	streampos begin, end;
	myROM.open(filename, ios::binary); // open binary file

	// File is valid, verify it has been successfully opened...
	if (myROM.is_open())
	{
		// Issue #4 - Check File size to ensure no memory overflow, using ref. [1]
		begin = myROM.tellg();
		myROM.seekg(ios::end); // set position to end to determine number of bytes
		end = myROM.tellg();
		myROM.seekg(ios::beg); // set position back to beginning

		// If ROM is an acceptable length, proceed ...
		if ((end - begin) <= LENGTH_BYTES)
		{
			cout << "Loading ROM....\n";
			// Until the end of the file, grab bytes...
			do {
				// Read two bytes at a time to [2]
				msb = myROM.get();
				lsb = myROM.get();

				// Save OpCodes byte at a  time
				chip8ram8[j++] = (unsigned char)msb;
				chip8ram8[j++] = (unsigned char)lsb;

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
			lengthROM16 = i;

			// Close input file...
			myROM.close();
			return true;
		}
		else
		{
			myROM.close();
			cout << "File length too large - " << (end - begin) << endl;
			return false;
		}
	}
	else // Invalid file or filename...
	{
		cout << "Error opening file" << endl;
		return false;
	}
} // END loadROM()


///////////////////////////////////////////////////////////////////////////////
// Method:  myCPU::emulator()
// Purpose: Execute ROM
///////////////////////////////////////////////////////////////////////////////
void myCPU::emulator()
{
	if (firstentry == false)
		mytimer.initTime(); // Initialize my timer for Timer Registers...

	// Process ROM OpCodes...
	// Reconstitute instruction, 2 bytes [2]
	msb = 0;
	lsb = 0;
	inst = 0;
	msb = (unsigned short)chip8ram8[index];
	lsb = (unsigned short)chip8ram8[index + 1];
	inst = (((msb & 0xFF) << 0x8) | (lsb & 0xFF));

	//*****************************************************************
	// Parse Instructions [3], [6]
	//  The following switch/case format is adapted from 
	//  Laurence Muller's implementation [6].
	//*****************************************************************
	switch (inst & 0xF000) // ref. [6]
	{
	case 0x0000:
		switch (inst & 0x00FF)
		{
			//*****************************************************************
			// (1) 0nnn - SYS addr
			//	Jump to a machine code routine at nnn.  This instruction is only
			//	used on the old computers on which Chip8 was originally implemented.  
			//  It is ignored by modern interpreters.
			//*****************************************************************

			//*****************************************************************
			// (2) 00E0 - CLS
			//	Clear the display.
			//*****************************************************************
		case 0x00E0:
			drawFlag = true;
			memset(gfx, 0x00, LENGTH_WORDS);
			regPC += 2;
			index = regPC;
			break;

			//*****************************************************************
			// (3) 00EE - RET
			//	Return from a subroutine.
			//  The interpreter sets the program counter to the address at the 
			//  top of the stack, then subtracts 1 from the stack pointer.
			//*****************************************************************
		case 0x00EE:
			regPC = regStack.pop();
			--regSP;
			regPC += 2; // correction from Laurence Muller [6]
			index = regPC;
			break;

		default:
			regPC += 1;
			index = regPC;
			//cout << index << ": 0x0000: invalid instruction - " << inst << endl;
			break;
		}
		break;

	case 0x1000:
		//*****************************************************************
		// (4) 1nnn - JP addr
		//	Jump to location nnn.
		//	The interpreter sets the program counter to nnn.
		//*****************************************************************
		regPC = (0x0FFF & inst);
		index = regPC;
		break;

		//*****************************************************************
		// (5) 2nnn - CALL addr
		//	Call subroutine at nnn.
		//	The interpreter increments the stack pointer, 
		//  then puts the current PC on the top of the stack. 
		//  The PC is then set to nnn.
		//*****************************************************************
	case 0x2000:
		++regSP;
		regStack.push(regPC);
		regPC = (0x0FFF & inst);
		index = regPC;
		break;

	case 0x3000:
		//*****************************************************************
		// (6) 3xkk - SE Vx, byte
		//	Skip next instruction if Vx = kk.
		//	The interpreter compares register Vx to kk, and if they are 
		//  equal, increments the program counter by 2.
		//*****************************************************************
		if (regVx[((0x0F00 & inst) >> 8)] == (0x00FF & inst))
		{
			regPC += 4;
			index = regPC;
		}
		else
		{
			regPC += 2;
			index = regPC;
		}
		break;

	case 0x4000:
		//*****************************************************************
		// (7) 4xkk - SNE Vx, byte
		//	Skip next instruction if Vx != kk.
		//	The interpreter compares register Vx to kk, and if they are not
		//  equal, increments the program counter by 2.
		//*****************************************************************
		if (regVx[((0x0F00 & inst) >> 8)] != (0x00FF & inst))
		{
			regPC += 4;
			index = regPC;
		}
		else
		{
			regPC += 2;
			index = regPC;
		}
		break;

	case 0x5000:
		//*****************************************************************
		// (8) 5xy0 - SE Vx, Vy
		//	Skip next instruction if Vx = Vy.
		//	The interpreter compares register Vx to register Vy, and if 
		//  they are equal, increments the program counter by 2.
		//*****************************************************************
		if (regVx[((0x0F00 & inst) >> 8)] == regVx[((0x00F0 & inst) >> 4)])
		{
			regPC += 4;
			index = regPC;
		}
		else
		{
			regPC += 2;
			index = regPC;
		}
		break;

	case 0x6000:
		//*****************************************************************
		// (9) 6xkk - LD Vx, byte
		//	Set Vx = kk.
		//	The interpreter puts the value kk into register Vx.
		//*****************************************************************
		regVx[((0x0F00 & inst) >> 8)] = (unsigned char)(0x00FF & inst);
		regPC += 2;
		index = regPC;
		break;

	case 0x7000:
		//*****************************************************************
		// (10)	7xkk - ADD Vx, byte
		//	Set Vx = Vx + kk.
		//	Adds the value kk to the value of register Vx, then stores the 
		//  result in Vx.
		//*****************************************************************
		regVx[((0x0F00 & inst) >> 8)] += (unsigned char)(0x00FF & inst);
		regPC += 2;
		index = regPC;
		break;

	case 0x8000:
		switch (inst & 0x000F)
		{
			//*****************************************************************
			// (11)	8xy0 - LD Vx, Vy
			//	Set Vx = Vy.
			//	Stores the value of register Vy in register Vx.
			//*****************************************************************
		case 0x0000:
			regVx[((0x0F00 & inst) >> 8)] = regVx[((0x00F0 & inst) >> 4)];
			regPC += 2;
			index = regPC;
			break;

			//*****************************************************************
			// (12)	8xy1 - OR Vx, Vy
			//	Set Vx = Vx OR Vy.
			//	Performs a bitwise OR on the values of Vx and Vy, then stores 
			//  the result in Vx.
			//*****************************************************************
		case 0x0001:
			regVx[((0x0F00 & inst) >> 8)] |= regVx[((0x00F0 & inst) >> 4)];
			regPC += 2;
			index = regPC;
			break;

			//*****************************************************************
			// (13)	8xy2 - AND Vx, Vy
			//	Set Vx = Vx AND Vy.
			//	Performs a bitwise AND on the values of Vx and Vy, then stores 
			//  the result in Vx.
			//*****************************************************************
		case 0x0002:
			regVx[((0x0F00 & inst) >> 8)] &= regVx[((0x00F0 & inst) >> 4)];
			regPC += 2;
			index = regPC;
			break;

			//*****************************************************************
			// (14)	8xy3 - XOR Vx, Vy
			//	Set Vx = Vx XOR Vy.
			//	Performs a bitwise exclusive OR on the values of Vx and Vy, 
			//  then stores the result in Vx.
			//*****************************************************************
		case 0x0003:
			regVx[((0x0F00 & inst) >> 8)] ^= regVx[((0x00F0 & inst) >> 4)];
			regPC += 2;
			index = regPC;
			break;

			//*****************************************************************
			// (15)	8xy4 - ADD Vx, Vy
			//	Set Vx = Vx + Vy, set VF = carry.
			//	The values of Vx and Vy are added together.
			//   If the result is greater than 8 bits(index.e., > 255, ) 
			//   VF is set to 1, otherwise 0. 
			//  Only the lowest 8 bits of the result are kept, and stored in Vx.
			//*****************************************************************
		case 0x0004:
			// Vx = Vx + Vy
			regVx[((0x0F00 & inst) >> 8)] += regVx[((0x00F0 & inst) >> 4)];

			//   If the result is greater than 8 bits(i.e., > 255, ) 
			//   VF is set to 1, otherwise 0. 
			if (regVx[((0x0F00 & inst) >> 8)] > 0xFF)
			{
				regVx[0xF] = 1;
			}
			else
			{
				regVx[0xF] = 0;
			}

			//  Only the lowest 8 bits of the result are kept, and stored in Vx.
			// TBD - neither Laurence or Lyndon do this step
			// regVx[((0x0F00 & inst) >> 8)] &= 0xF;
			regPC += 2;
			index = regPC;
			break;

			//*****************************************************************
			// (16)	8xy5 - SUB Vx, Vy
			//	Set Vx = Vx - Vy, set VF = NOT borrow.
			//	If Vx > Vy, then VF is set to 1, otherwise 0. 
			//  Then Vy is subtracted from Vx, and the results stored in Vx.
			//*****************************************************************
		case 0x0005:
			// if Vx > Vy, set to 1, otherwise 0
			if (regVx[((0x0F00 & inst) >> 8)] > regVx[((0x00F0 & inst) >> 4)])
				regVx[0xF] = 1;
			else
				regVx[0xF] = 0; // corrected from Laurence Muller's solution [6]

			regVx[((0x0F00 & inst) >> 8)] -= regVx[((0x00F0 & inst) >> 4)];
			regPC += 2;
			index = regPC;
			break;

			//*****************************************************************
			// (17)	8xy6 - SHR Vx{ , Vy }
			//  Set Vx = Vx SHR 1.
			//	If the least - significant bit of Vx is 1, then VF is set to 1, 
			//  otherwise 0. Then Vx is divided by 2.
			//*****************************************************************
		case 0x0006:
			regVx[0xF] = (regVx[((0x0F00 & inst) >> 8)] & 0x1);
			regVx[((0x0F00 & inst) >> 8)] >>= 1; // corrected from Laurence Muller's solution [6]
			regPC += 2;
			index = regPC;
			break;

			//*****************************************************************
			// (18)	8xy7 - SUBN Vx, Vy
			//	Set Vx = Vy - Vx, set VF = NOT borrow.
			//	If Vy > Vx, then VF is set to 1, otherwise 0. 
			//  Then Vx	is subtracted from Vy, and the results stored in Vx.
			//*****************************************************************
		case 0x0007:
			// If Vy > Vx, set VF to 1, otherwise 0
			if (regVx[((0x00F0 & inst) >> 4)] > regVx[((0x0F00 & inst) >> 8)])
				regVx[0xF] = 1;
			else
				regVx[0xF] = 0;

			regVx[((0x0F00 & inst) >> 8)] = regVx[((0x00F0 & inst) >> 4)] - regVx[((0x0F00 & inst) >> 8)];
			regPC += 2;
			index = regPC;
			break;

			//*****************************************************************
			// (19)	8xyE - SHL Vx{ , Vy }
			//  Set Vx = Vx SHL 1.
			//	If the most significant bit of Vx is 1, then VF is set to 1, 
			//  otherwise to 0. Then Vx is multiplied by 2.
			//*****************************************************************
		case 0x000E:
			regVx[0xF] = (regVx[((0x0F00 & inst) >> 8)] >> 7); // corrected from Laurence Muller's solution [6]
			regVx[((0x0F00 & inst) >> 8)] <<= 1; // corrected from Laurence Muller's solution [6]
			regPC += 2;
			index = regPC;
			break;

		default:
			regPC += 1;
			index = regPC;
			//cout << index << ": 0x8000: invalid instruction - " << inst << endl;
			break;
		}
		break;

	case 0x9000:
		//*****************************************************************
		// (20)	9xy0 - SNE Vx, Vy
		//	Skip next instruction if Vx != Vy.
		//	The values of Vx and Vy are compared, and if they are not 
		//  equal, the program counter is increased by 2.
		//*****************************************************************
		if (regVx[((0x0F00 & inst) >> 8)] != regVx[((0x00F0 & inst) >> 4)])
		{
			regPC += 4;
			index = regPC;
		}
		else // corrected from Laurence Muller's solution [6]
		{
			regPC += 2;
			index = regPC;
		}
		break;

	case 0xA000:
		//*****************************************************************
		// (21)	Annn - LD I, addr
		//	Set I = nnn.
		//	The value of register I is set to nnn.
		//*****************************************************************
		regI = (0x0FFF & inst);
		regPC += 2;
		index = regPC;
		break;

	case 0xB000:
		//*****************************************************************
		// (22)	Bnnn - JP V0, addr
		//	Jump to location nnn + V0.
		//	The program counter is set to nnn plus the value of V0.
		//*****************************************************************
		regPC = (unsigned short)regVx[0] + (0x0FFF & inst);
		index = regPC;
		break;

	case 0xC000:
	{
		//*****************************************************************
		// (23)	Cxkk - RND Vx, byte
		//	Set Vx = random byte AND kk.
		//	The interpreter generates a random number from 0 to 255, which 
		//   is then ANDed with the value kk.
		//  The results are stored in Vx.
		//*****************************************************************
		unsigned char temp = (rand() % 0xFF); // [5], [6]
		regVx[((0x0F00 & inst) >> 8)] = (unsigned char)(temp & ((0x00FF) & inst));
		regPC += 2;
		index = regPC;
	}
	break;

	case 0xD000:
	{
		//*****************************************************************
		// (24)	Dxyn - DRW Vx, Vy, nibble
		//	(1) Display n - byte sprite starting at memory location I 
		//  at(Vx, Vy), set VF = collision.
		//	(2) The interpreter reads n bytes from memory, starting at the 
		//  address stored in I.
		//  (3) These bytes are then displayed as sprites on screen at coordinates(Vx, Vy).
		//  (4) Sprites are XORed onto the existing screen.  
		//  If this causes any pixels to be erased, VF is set to 1, otherwise it is set to 0. 
		//  If the sprite is positioned so part of it is outside the 
		//  coordinates of the display, it wraps around to the opposite side of the screen.
		//  See instruction 8xy3 for more information on XOR, and section 2.4, 
		//  Display, for more information on the Chip - 8 screen and sprites.
		//*****************************************************************
		///////////////////////////////////////////////////////////////////
		// The following code belongs to Laurence Muller
		// http://www.multigesture.net/articles/how-to-write-an-emulator-chip-8-interpreter/
		///////////////////////////////////////////////////////////////////  
		unsigned char x = regVx[((inst & 0x0F00) >> 8)];
		unsigned char y = regVx[((inst & 0x00F0) >> 4)];
		unsigned short height = (inst & 0x000F);
		unsigned short pixel = 0;
		regVx[0xF] = 0;
		for (int yline = 0; yline < height; yline++)
		{
			pixel = chip8ram8[(regI + yline)];
			for (int xline = 0; xline < 8; xline++)
			{
				if ((pixel & (0x80 >> xline)) != 0)
				{	
					if (gfx[(x + xline + ((y + yline) * 64))] == 1)
					   regVx[0xF] = 1;
				   gfx[(x + xline + ((y + yline) * 64))] ^= 1;
				}
			}
		}
		drawFlag = true;
		regPC += 2;
		///////////////////////////////////////////////////////////////////
		index = regPC;
	}
	break;
	
	case 0xE000:
		switch (inst & 0x00FF)
		{
			//*****************************************************************
			// (25) Ex9E - SKP Vx
			//	Skip next instruction if key with the value of Vx is pressed.
			//	Checks the keyboard, and if the key corresponding to the value 
			//  of Vx is currently in the down position, PC is increased by 2.
			//*****************************************************************
		case 0x009E:
			if (key[regVx[((inst & 0x0F00) >> 8)]] != 0) // corrected from Laurence Muller's solution [6]
			{
				regPC += 4;
			}
			else
			{
				regPC += 2;
			}
			index = regPC;
			break;

			//*****************************************************************
			// (26) ExA1 - SKNP Vx
			//	Skip next instruction if key with the value of Vx is not pressed.
			//	Checks the keyboard, and if the key corresponding to the value 
			//  of Vx is currently in the up position, PC is increased by 2.
			//*****************************************************************
		case 0x0A1:
			if (key[regVx[((inst & 0x0F00) >> 8)]] == 0) // corrected from Laurence Muller's solution [6]
			{
				regPC += 4;
			}
			else
			{
				regPC += 2;
			}
			index = regPC;
			break;

		default:
			regPC += 1;
			index = regPC;
			//cout << index << ": 0xE000: invalid instruction - " << inst << endl;
			break;
		}
		break;

	case 0xF000:
		switch (inst & 0x00FF)
		{
			//*****************************************************************
			// (27)	Fx07 - LD Vx, DT
			//	Set Vx = delay timer value.
			//	The value of DT is placed into Vx.
			//*****************************************************************
		case 0x0007:
			regVx[((0x0F00 & inst) >> 8)] = regDT;
			regPC += 2;
			index = regPC;
			break;

			//*****************************************************************
			// (28)	Fx0A - LD Vx, K
			//	Wait for a key press, store the value of the key in Vx.
			//	All execution stops until a key is pressed, then the value of 
			//  that key is stored in Vx.
			//*****************************************************************
		case 0x000A:
		{
			///////////////////////////////////////////////////////////////////
			// The following code belongs to Laurence Muller
			// http://www.multigesture.net/articles/how-to-write-an-emulator-chip-8-interpreter/
			///////////////////////////////////////////////////////////////////  
			bool keyPress = false;

			for (unsigned char k = 0; k < NUM_REGS; ++k)
			{
				if (key[k] != 0)
				{
					regVx[((inst & 0x0F00) >> 8)] = k;
					keyPress = true;
				}
			}

			// If we didn't received a keypress, skip this cycle and try again.
			if (!keyPress)
				return;
			///////////////////////////////////////////////////////////////////  
			regPC += 2;
			index = regPC;
		}
		break;

		//*****************************************************************
		// (29)	Fx15 - LD DT, Vx
		//	Set delay timer = Vx.
		//	DT is set equal to the value of Vx.
		//*****************************************************************
		case 0x0015:
			regDT = regVx[((0x0F00 & inst) >> 8)];
			regPC += 2;
			index = regPC;
			break;

			//*****************************************************************
			// (30)	Fx18 - LD ST, Vx
			//	Set sound timer = Vx.
			//	ST is set equal to the value of Vx.
			//*****************************************************************
		case 0x0018:
			// The sound timer is active whenever the sound timer register
			// (ST)is non - zero.  This timer also decrements at a rate of 
			// 60Hz, however, as long as ST's value is greater than zero,
			// the Chip-8 buzzer will sound. When ST reaches zero, the 
			// sound timer deactivates.
			// The sound produced by the Chip - 8 interpreter has only one 
			// tone.  The frequency of this tone is decided by the author 
			//  of the interpreter.
			regST = regVx[((0x0F00 & inst) >> 8)];
			regPC += 2;
			index = regPC;
			break;

			//*****************************************************************
			// (31)	Fx1E - ADD I, Vx
			//	Set I = I + Vx.
			//	The values of I and Vx are added, and the results are stored in I.
			//*****************************************************************
		case 0x001E:
			///////////////////////////////////////////////////////////////////
			// The following instruction belongs to Laurence Muller
			// http://www.multigesture.net/articles/how-to-write-an-emulator-chip-8-interpreter/
			///////////////////////////////////////////////////////////////////  
			// VF is set to 1 when range overflow (I+VX>0xFFF), and 0 when there isn't.
			if ((regI + regVx[(inst & 0x0F00) >> 8]) > 0xFFF)
			{
				regVx[0xF] = 1;
			}
			else
			{
				regVx[0xF] = 0;
			}
			////////////////////////////////////////////////////////////////////////////
			regI += regVx[((0x0F00 & inst) >> 8)];
			regPC += 2;
			index = regPC;
			break;

			//*****************************************************************
			// (32)	Fx29 - LD F, Vx
			//	Set I = location of sprite for digit Vx.
			//	The value of I is set to the location for the hexadecimal 
			//  sprite corresponding to the value of Vx.
			//*****************************************************************
		case 0x0029:
			///////////////////////////////////////////////////////////////////
			// The following instruction belongs to Laurence Muller
			// http://www.multigesture.net/articles/how-to-write-an-emulator-chip-8-interpreter/
			///////////////////////////////////////////////////////////////////  
			regI = (unsigned short)(regVx[((inst & 0x0F00) >> 8)] * 0x5);
			regPC += 2;
			index = regPC;
			break;

			//*****************************************************************
			// (33)	Fx33 - LD B, Vx
			//	Store BCD representation of Vx in memory locations I, I + 1, and I + 2.
			//	The interpreter takes the decimal value of Vx, and places the hundreds digit in memory at location 
			//   in I, the tens digit at location I + 1, and the ones digit at location I + 2.
			//*****************************************************************
		case 0x0033:
			chip8ram8[regI] = ((regVx[((0x0F00 & inst) >> 8)] / 100)); // corrected from Laurence Muller's solution [6]
			chip8ram8[regI + 1] = ((regVx[((0x0F00 & inst) >> 8)] / 10) % 10); // corrected from Laurence Muller's solution [6]
			chip8ram8[regI + 2] = ((regVx[((0x0F00 & inst) >> 8)] % 100) % 10); // corrected from Laurence Muller's solution [6]
			regPC += 2;
			index = regPC;
			break;

			//*****************************************************************
			// (34)	Fx55 - LD[I], Vx
			//	Store registers V0 through Vx in memory starting at location I.
			//	The interpreter copies the values of registers V0 through Vx 
			//  into memory, starting at the address in I.
			//*****************************************************************
		case 0x0055:
			for (unsigned short m = 0; m <= ((0x0F00 & inst) >> 8); m++) // corrected from Laurence Muller's solution [6]
			{
				chip8ram8[(regI + m)] = regVx[m]; // corrected from Laurence Muller's solution [6]
			}
			// On the original interpreter, when the operation is done, I = I + X + 1.
			// Laurence Muller [6]
			regI += (((inst & 0x0F00) >> 8) + 1);
			regPC += 2;
			index = regPC;
			break;

			//*****************************************************************
			// (35)	Fx65 - LD Vx, [I]
			//	Read registers V0 through Vx from memory starting at location I.
			//	The interpreter reads values from memory starting at location I 
			//  into registers V0 through Vx.
			//*****************************************************************
		case 0x0065:
			for (unsigned short m = 0; m <= ((0x0F00 & inst) >> 8); m++) // corrected from Laurence Muller's solution [6]
			{
				regVx[m] = chip8ram8[(regI + m)]; // corrected from Laurence Muller's solution [6]
			}

			// On the original interpreter, when the operation is done, I = I + X + 1.
			// Laurence Muller [6]
			regI += (((inst & 0x0F00) >> 8) + 1);
			regPC += 2;
			index = regPC;
			break;

		default:
			regPC += 1;
			index = regPC;
			//cout << index << ": 0xF000: invalid instruction - " << inst << endl;
			break;
		}
		break;

		// Unknown instruction
	default:
		regPC += 1;
		index = regPC;
		//cout << index << ": default: invalid instruction - " << inst << endl;
	}

	// Check on the timer registers ....
	mytimer.handleTimers(regST, regDT);
}