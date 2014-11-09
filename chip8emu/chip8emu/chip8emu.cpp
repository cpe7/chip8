// chip8emu.cpp : Defines the entry point for the console application.
// Author        : Lauren Rush
// References    : [1] http://www.cplusplus.com/doc/tutorial/files/
//

#include "stdafx.h"


int _tmain(int argc, _TCHAR* argv[])
{
	ifstream myROM;

	// (1) Open binary file [1]
	myROM.open(("..\\Debug\\MAZE"), ios::binary);

	// File is valid, verify it has been successfully opened...
	if (myROM.is_open())
	{
		// Until the end of the file, grab bytes...
		while (!myROM.eof())
		{
			// Print hexidecimal value to console...
			cout << hex << myROM.get() << " ";
		}

		// Close file, when done...
		myROM.close();
	}
	else // Invalid file or filename...
	{
		cout << "Error opening file" << endl;
	}

	system("pause"); // Pause until keystroke to observe console...
	return 0;
}

