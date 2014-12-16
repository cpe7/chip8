// chip8emu.	cpp : Defines the entry point for the console application.
// Author        : Lauren Rush
// References    : See file headers.
//                [1] command line params: http://www.cplusplus.com/articles/DEN36Up4/
//                [2] Laurence Muller http://www.multigesture.net/articles/how-to-write-an-emulator-chip-8-interpreter/
//                [3] Lyndon Armitage http://lyndonarmitage.com/chip-8-emulator/

#include "stdafx.h"
#include <GL/glut.h> // GLUT binaries: http://user.xmission.com/~nate/glut.html
                     // GLUT How To: http://visualambition.wordpress.com/2010/08/12/glut-and-visual-studio-2010/
                     //      (1) Download the GLUT binaries (.lib, .dll, .h) here http://user.xmission.com/~nate/glut/glut-3.7.6-bin.zip
                     //      (2) Make sure to copy the files to the following locations (these are the folders I had):
                     //           glut.h:     ‘C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\include\GL\’
                     //           glut32.lib: ‘C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\lib\’
                     //           glut32.dll: ‘C:\Windows\System32\’
                     //      (3) If necessary, add reference to library in:
                     //          PROJECT --> Properties --> Linker --> Input --> Additional Dependencies

// Global Instance (for main)
myCPU myChip8;

// Function prototypes
void drawPixel(unsigned int x, unsigned int y);
void updateQuads();
void display();
void reshape_window(GLsizei w, GLsizei h);
void keyboardUp(unsigned char key, int x, int y);
void keyboardDown(unsigned char key, int x, int y);

///////////////////////////////////////////////////////////////////////////////
// MAIN
///////////////////////////////////////////////////////////////////////////////
int main(int argc, char *argv[])
{
	CUtility parseROM;

	if (argc == 2)
	{
		cout << "You've selected: " << argv[1] << endl; // [1]
		/////////////////////////////////////////////////////////////////////////////
		// The following code belongs to Laurence Muller
		// http://www.multigesture.net/articles/how-to-write-an-emulator-chip-8-interpreter/
		// Setup OpenGL
		glutInit(&argc, argv);
		glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGBA);

		glutInitWindowSize(myChip8.display_width, myChip8.display_height);
		glutInitWindowPosition(320, 320);
		glutCreateWindow("myChip8 by Laurence Muller (& Lauren Rush)");

		glutDisplayFunc(display);
		glutIdleFunc(display);
		glutReshapeFunc(reshape_window);
		glutKeyboardFunc(keyboardDown);
		glutKeyboardUpFunc(keyboardUp);
		/////////////////////////////////////////////////////////////////////////////
		if (myChip8.loadROM(argv[1]))  // [1]
		{
			parseROM.dissassemble(myChip8.chip8ram, myChip8.lengthROM16);
			glutMainLoop(); // forever loop, until esc key pressed [2]
		}
	}
	else
	{
		cout << "Usage: chip8emu.exe <ROM_NAME> \n";  // [1]
	}

	system("pause"); // Pause until keystroke to observe console...
	return 0;
}

/////////////////////////////////////////////////////////////////////////////
// The following code belongs to Laurence Muller
// http://www.multigesture.net/articles/how-to-write-an-emulator-chip-8-interpreter/
/////////////////////////////////////////////////////////////////////////////
void drawPixel(unsigned int x, unsigned int y)
{
	int modifier = 10;

	glBegin(GL_QUADS);
	glVertex3f((x * modifier) + 0.0f, (y * modifier) + 0.0f, 0.0f);
	glVertex3f((x * modifier) + 0.0f, (y * modifier) + modifier, 0.0f);
	glVertex3f((x * modifier) + modifier, (y * modifier) + modifier, 0.0f);
	glVertex3f((x * modifier) + modifier, (y * modifier) + 0.0f, 0.0f);
	glEnd();
}

/////////////////////////////////////////////////////////////////////////////
// The following code belongs to Laurence Muller
// http://www.multigesture.net/articles/how-to-write-an-emulator-chip-8-interpreter/
/////////////////////////////////////////////////////////////////////////////
void updateQuads()
{
	// Draw
	for (int y = 0; y < 32; ++y)
	{
		for (int x = 0; x < 64; ++x)
		{
			if (myChip8.gfx[(y * 64) + x] == 0)
				glColor3f(0.0f, 0.0f, 0.0f);
			else
				glColor3f(1.0f, 1.0f, 1.0f);

			drawPixel(x, y);
		}
	}
}

/////////////////////////////////////////////////////////////////////////////
// The following code belongs to Laurence Muller
// http://www.multigesture.net/articles/how-to-write-an-emulator-chip-8-interpreter/
/////////////////////////////////////////////////////////////////////////////
void display()
{
	// Get Instruction
	myChip8.emulator();

	// Check if instruction modified display, and update
	if (myChip8.drawFlag)
	{
		// Clear framebuffer
		glClear(GL_COLOR_BUFFER_BIT);

		updateQuads();

		// Swap buffers!
		glutSwapBuffers();

		// Processed frame
		myChip8.drawFlag = false;
	}

	// Slow down loop 
	///////////////////////////////////////////////////////////////////////////
	for (unsigned int t = 1; t < 250000; t++);
	///////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////
// The following code belongs to Laurence Muller
// http://www.multigesture.net/articles/how-to-write-an-emulator-chip-8-interpreter/
/////////////////////////////////////////////////////////////////////////////
void reshape_window(GLsizei w, GLsizei h)
{
	glClearColor(0.0f, 0.0f, 0.5f, 0.0f);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluOrtho2D(0, w, h, 0);
	glMatrixMode(GL_MODELVIEW);
	glViewport(0, 0, w, h);

	// Resize quad
	myChip8.display_width = w;
	myChip8.display_height = h;
}

/////////////////////////////////////////////////////////////////////////////
// The following code belongs to Laurence Muller
// http://www.multigesture.net/articles/how-to-write-an-emulator-chip-8-interpreter/
/////////////////////////////////////////////////////////////////////////////
void keyboardDown(unsigned char key, int x, int y)
{
	if (key == 27)    // esc
	{
		exit(0);
	}

	if (key == '1')		
		myChip8.key[0x1] = 1;
	else if (key == '2')	
		myChip8.key[0x2] = 1;
	else if (key == '3')	
		myChip8.key[0x3] = 1;
	else if (key == '4')	
		myChip8.key[0xC] = 1;

	else if (key == 'q')	
		myChip8.key[0x4] = 1;
	else if (key == 'w')	
		myChip8.key[0x5] = 1;
	else if (key == 'e')	
		myChip8.key[0x6] = 1;
	else if (key == 'r')	
		myChip8.key[0xD] = 1;

	else if (key == 'a')	
		myChip8.key[0x7] = 1;
	else if (key == 's')	
		myChip8.key[0x8] = 1;
	else if (key == 'd')	
		myChip8.key[0x9] = 1;
	else if (key == 'f')	
		myChip8.key[0xE] = 1;

	else if (key == 'z')	
		myChip8.key[0xA] = 1;
	else if (key == 'x')	
		myChip8.key[0x0] = 1;
	else if (key == 'c')	
		myChip8.key[0xB] = 1;
	else if (key == 'v')	
		myChip8.key[0xF] = 1;
}

/////////////////////////////////////////////////////////////////////////////
// The following code belongs to Laurence Muller
// http://www.multigesture.net/articles/how-to-write-an-emulator-chip-8-interpreter/
/////////////////////////////////////////////////////////////////////////////
void keyboardUp(unsigned char key, int x, int y)
{
	if (key == '1')		
		myChip8.key[0x1] = 0;
	else if (key == '2')	
		myChip8.key[0x2] = 0;
	else if (key == '3')	
		myChip8.key[0x3] = 0;
	else if (key == '4')	
		myChip8.key[0xC] = 0;

	else if (key == 'q')	
		myChip8.key[0x4] = 0;
	else if (key == 'w')	
		myChip8.key[0x5] = 0;
	else if (key == 'e')	
		myChip8.key[0x6] = 0;
	else if (key == 'r')	
		myChip8.key[0xD] = 0;

	else if (key == 'a')	
		myChip8.key[0x7] = 0;
	else if (key == 's')	
		myChip8.key[0x8] = 0;
	else if (key == 'd')	
		myChip8.key[0x9] = 0;
	else if (key == 'f')	
		myChip8.key[0xE] = 0;

	else if (key == 'z')	
		myChip8.key[0xA] = 0;
	else if (key == 'x')	
		myChip8.key[0x0] = 0;
	else if (key == 'c')	
		myChip8.key[0xB] = 0;
	else if (key == 'v')	
		myChip8.key[0xF] = 0;
}

