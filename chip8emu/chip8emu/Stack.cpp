// Filename : Stack.cpp

#include "Stack.h"

///////////////////////////////////////////////////////////////////////////
// Reference:
// "DATA STRUCTURES DEMYSTIFIED" Pgs. 60-63 'Creating a Stack in C++'
///////////////////////////////////////////////////////////////////////////
Stack::~Stack()
{
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

void Stack::push(int x)
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

int Stack::pop()
{
	int retVal = 0;
	if (!isEmpty())
	{
		retVal = values[top];
		top--;
	}
	return retVal;
}