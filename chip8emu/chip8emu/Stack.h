// Filename : Stack.h
///////////////////////////////////////////////////////////////////////////
// Reference:
// "DATA STRUCTURES DEMYSTIFIED" Pgs. 60-63 'Creating a Stack in C++'
///////////////////////////////////////////////////////////////////////////

#pragma once

class Stack
{
private:
	int size;
	int top;
	int* values;

public:
	bool isFull();
	bool isEmpty();
	void push(int x);
	int  pop();

	Stack(int size)
	{
		this->size = size;
		values = new int[size];
		top = -1;
	}

	~Stack();
};
///////////////////////////////////////////////////////////////////////////

