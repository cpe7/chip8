// Filename : Stack.cpp
///////////////////////////////////////////////////////////////////////////
// Reference:
// "DATA STRUCTURES DEMYSTIFIED" Pgs. 60-63 'Creating a Stack in C++'
///////////////////////////////////////////////////////////////////////////

#include "Stack.h"

Stack::~Stack()
{
}

Stack::Stack(int size)
{
	this->size = size;
	values = new unsigned short[size];
	memset(values, 0, size);
	top = -1;
}

bool Stack::isFull()
{
	if (top < (size - 1))
	{
		return false;
	}
	else
	{
		return true;
	}
}

void Stack::push(unsigned short x)
{
	if (!isFull())
	{
		top++;
		values[top] = x;
	}
}

bool Stack::isEmpty()
{
	if (top == -1)
	{
		return true;
	}
	else
	{
		return false;
	}
}

unsigned short Stack::pop()
{
	unsigned short retVal = 0;
	if (!isEmpty())
	{
		retVal = values[top];
		top--;
	}
	return retVal;
}