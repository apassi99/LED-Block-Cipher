#include <stdio.h>

// long long state = 0x123456789abcdef0;
// long long key   = 0xfedcba9876543210;
// long long prev_state = 0x123456789abcdef0;

long long state = 0x0;
long long key   = 0x0;
long long prev_state = 0x0;

unsigned short first_col  = 0x48b2;
unsigned short second_col = 0x16e2;
unsigned short third_col  = 0x25af;
unsigned short fourth_col = 0x269b;

unsigned short first_row  = 0x4122;
unsigned short second_row = 0x8656;
unsigned short third_row  = 0xbea9;
unsigned short fourth_row = 0x22fb;

unsigned char FieldMult(unsigned char a, unsigned char b)
{
	const unsigned char ReductionPoly = 0x3;
	unsigned char x = a, ret = 0;
	int i;
	for(i = 0; i < 4; i++) {
		if((b>>i)&1) ret ^= x;
		if(x&0x8) {
			x <<= 1;
			x ^= ReductionPoly;
		}
		else x <<= 1;
	}
	return ret & 0xF;
}

const long long sbox[256] = {

	204, 197, 198, 203, 201, 192, 202, 205, 195, 
	206, 207, 200, 196, 199, 193, 194, 92, 
	85, 86, 91, 89, 80, 90, 93, 83, 
	94, 95, 88, 84, 87, 81, 82, 108, 
	101, 102, 107, 105, 96, 106, 109, 99, 
	110, 111, 104, 100, 103, 97, 98, 188, 
	181, 182, 187, 185, 176, 186, 189, 179, 
	190, 191, 184, 180, 183, 177, 178, 156, 
	149, 150, 155, 153, 144, 154, 157, 147, 
	158, 159, 152, 148, 151, 145, 146, 12, 
	5, 6, 11, 9, 0, 10, 13, 3, 
	14, 15, 8, 4, 7, 1, 2, 172, 
	165, 166, 171, 169, 160, 170, 173, 163, 
	174, 175, 168, 164, 167, 161, 162, 220, 
	213, 214, 219, 217, 208, 218, 221, 211, 
	222, 223, 216, 212, 215, 209, 210, 60, 
	53, 54, 59, 57, 48, 58, 61, 51, 
	62, 63, 56, 52, 55, 49, 50, 236, 
	229, 230, 235, 233, 224, 234, 237, 227, 
	238, 239, 232, 228, 231, 225, 226, 252, 
	245, 246, 251, 249, 240, 250, 253, 243, 
	254, 255, 248, 244, 247, 241, 242, 140, 
	133, 134, 139, 137, 128, 138, 141, 131, 
	142, 143, 136, 132, 135, 129, 130, 76, 
	69, 70, 75, 73, 64, 74, 77, 67, 
	78, 79, 72, 68, 71, 65, 66, 124, 
	117, 118, 123, 121, 112, 122, 125, 115, 
	126, 127, 120, 116, 119, 113, 114, 28, 
	21, 22, 27, 25, 16, 26, 29, 19, 
	30, 31, 24, 20, 23, 17, 18, 44, 
	37, 38, 43, 41, 32, 42, 45, 35, 
	46, 47, 40, 36, 39, 33, 34
};

const long long field_mult[256] = {
	0, 0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	1, 2, 3, 4, 5, 6, 7, 8, 
	9, 10, 11, 12, 13, 14, 15, 0, 
	2, 4, 6, 8, 10, 12, 14, 3, 
	1, 7, 5, 11, 9, 15, 13, 0, 
	3, 6, 5, 12, 15, 10, 9, 11, 
	8, 13, 14, 7, 4, 1, 2, 0, 
	4, 8, 12, 3, 7, 11, 15, 6, 
	2, 14, 10, 5, 1, 13, 9, 0, 
	5, 10, 15, 7, 2, 13, 8, 14, 
	11, 4, 1, 9, 12, 3, 6, 0, 
	6, 12, 10, 11, 13, 7, 1, 5, 
	3, 9, 15, 14, 8, 2, 4, 0, 
	7, 14, 9, 15, 8, 1, 6, 13, 
	10, 3, 4, 2, 5, 12, 11, 0, 
	8, 3, 11, 6, 14, 5, 13, 12, 
	4, 15, 7, 10, 2, 9, 1, 0, 
	9, 1, 8, 2, 11, 3, 10, 4, 
	13, 5, 12, 6, 15, 7, 14, 0, 
	10, 7, 13, 14, 4, 9, 3, 15, 
	5, 8, 2, 1, 11, 6, 12, 0, 
	11, 5, 14, 10, 1, 15, 4, 7, 
	12, 2, 9, 13, 6, 8, 3, 0, 
	12, 11, 7, 5, 9, 14, 2, 10, 
	6, 1, 13, 15, 3, 4, 8, 0, 
	13, 9, 4, 1, 12, 8, 5, 2, 
	15, 11, 6, 3, 14, 10, 7, 0, 
	14, 15, 1, 13, 3, 2, 12, 9, 
	7, 6, 8, 4, 10, 11, 5, 0, 
	15, 13, 2, 9, 6, 4, 11, 1, 
	14, 12, 3, 8, 7, 5, 10
};

void AddKey() {
	state ^= key;
}

void AddConstants(int r) {
	const unsigned char RC[48] = {
		0x01, 0x03, 0x07, 0x0F, 0x1F, 0x3E, 0x3D, 0x3B, 0x37, 0x2F,
		0x1E, 0x3C, 0x39, 0x33, 0x27, 0x0E, 0x1D, 0x3A, 0x35, 0x2B,
		0x16, 0x2C, 0x18, 0x30, 0x21, 0x02, 0x05, 0x0B, 0x17, 0x2E,
		0x1C, 0x38, 0x31, 0x23, 0x06, 0x0D, 0x1B, 0x36, 0x2D, 0x1A,
		0x34, 0x29, 0x12, 0x24, 0x08, 0x11, 0x22, 0x04
	};

	unsigned char temp = RC[r];
	long long t1 = (temp >> 3) & 7;
	long long t2 = temp & 7;

	long long temp_val =  0x4000500020003000 | (t1 << 56) | (t2 << 40) 
											 | (t1 << 24) | (t2 <<  8);
	state ^= temp_val;
}

void SubCell()
{
	unsigned char temp1 = state & 0xff;
	state = (state & 0xffffffffffffff00) | sbox[temp1];

	temp1 = (state >> 8) & 0xff;
	state = (state & 0xffffffffffff00ff) | sbox[temp1] << 8;

	temp1 = (state >> 16) & 0xff;
	state = (state & 0xffffffffff00ffff) | sbox[temp1] << 16;

	temp1 = (state >> 24) & 0xff;
	state = (state & 0xffffffff00ffffff) | sbox[temp1] << 24;

	temp1 = (state >> 32) & 0xff;
	state = (state & 0xffffff00ffffffff) | sbox[temp1] << 32;

	temp1 = (state >> 40) & 0xff;
	state = (state & 0xffff00ffffffffff) | sbox[temp1] << 40;

	temp1 = (state >> 48) & 0xff;
	state = (state & 0xff00ffffffffffff) | sbox[temp1] << 48;

	temp1 = (state >> 56) & 0xff;
	state = (state & 0x00ffffffffffffff) | sbox[temp1] << 56;
}

void ShiftRow()
{
	long long temp =  ( (state & 0x0000f00000000000) >> 12 ) |
					  ( (state & 0x00000000ff000000) >> 8  ) |
					  ( (state & 0x000000000000fff0) >> 4  );


	long long temp1 = ( (state & 0x00000fff00000000) << 4  ) |
					  ( (state & 0x0000000000ff0000) << 8  ) |
					  ( (state & 0x000000000000000f) << 12 ) | 
					  ( (state & 0xffff000000000000)       );

	state = temp | temp1;
}

// unsigned char FieldMult(unsigned char a, unsigned char b) {

// 	// This must be a general purpose register
// 	unsigned char temp = field_mult(a & 0xf, b & 0xf);
// }

long long MixColumnHelper1(unsigned short row) {

	long long temp  = ( (row >> 8) & 0xf0 ) | ( (prev_state >> 60) & 0xf);
	temp = field_mult[temp];

	long long temp1 = ( (row >> 4) & 0xf0 ) | ( (prev_state >> 44) & 0xf);
	temp1 = field_mult[temp1];

	long long temp2 = ( row & 0xf0 ) | ( (prev_state >> 28) & 0xf);
	temp2 = field_mult[temp2];

	long long temp3 = ( (row << 4) & 0xf0 ) | ( (prev_state >> 12) & 0xf);
	temp3 = field_mult[temp3];

	return (temp1 ^ temp2 ^ temp3 ^ temp) & 0xff;
}

long long MixColumnHelper2(unsigned short row) {
	long long temp  = ( (row >> 8) & 0xf0 ) | ( (prev_state >> 56) & 0xf);
	temp = field_mult[temp];

	long long temp1 = ( (row >> 4) & 0xf0 ) | ( (prev_state >> 40) & 0xf);
	temp1 = field_mult[temp1];

	long long temp2 = ( row & 0xf0 ) | ( (prev_state >> 24) & 0xf);
	temp2 = field_mult[temp2];

	long long temp3 = ( (row << 4) & 0xf0 ) | ( (prev_state >> 8) & 0xf);
	temp3 = field_mult[temp3];

	return (temp1 ^ temp2 ^ temp3 ^ temp) & 0xff;
}

long long MixColumnHelper3(unsigned short row){

	long long temp  = ( (row >> 8) & 0xf0 ) | ( (prev_state >> 52) & 0xf);
	temp = field_mult[temp];

	long long temp1 = ( (row >> 4) & 0xf0 ) | ( (prev_state >> 36) & 0xf);
	temp1 = field_mult[temp1];

	long long temp2 = ( row & 0xf0 ) | ( (prev_state >> 20) & 0xf);
	temp2 = field_mult[temp2];

	long long temp3 = ( (row << 4) & 0xf0 ) | ( (prev_state >> 4) & 0xf);
	temp3 = field_mult[temp3];

	return (temp1 ^ temp2 ^ temp3 ^ temp) & 0xff;
}

long long MixColumnHelper4(unsigned short row){

	/* Fourth ROW */
	long long temp  = ( (row >> 8) & 0xf0 ) | ( (prev_state >> 48) & 0xf);
	temp = field_mult[temp];

	long long temp1 = ( (row >> 4) & 0xf0 ) | ( (prev_state >> 32) & 0xf);
	temp1 = field_mult[temp1];

	long long temp2 = ( row & 0xf0 ) | ( (prev_state >> 16) & 0xf);
	temp2 = field_mult[temp2];

	long long temp3 = ( (row << 4) & 0xf0 ) | (prev_state & 0xf);
	temp3 = field_mult[temp3];

	return (temp1 ^ temp2 ^ temp3 ^ temp) & 0xff;
}


void MixColumn()
{

	prev_state = state;
	long long temp  = MixColumnHelper1(first_row);
	state = (state & 0x0fffffffffffffff) | (temp << 60);


	temp  = MixColumnHelper1(second_row);
	state = (state & 0xffff0fffffffffff) | (temp << 44);
	
	temp  = MixColumnHelper1(third_row);
	state = (state & 0xffffffff0fffffff) | (temp << 28);
	
	temp  = MixColumnHelper1(fourth_row);
	state = (state & 0xffffffffffff0fff) | (temp << 12);

	printf( " %llx \n ", state);


	prev_state = state;
	/* Second ROW State Variation */
	temp  = MixColumnHelper2(first_row);
	state = (state & 0xf0ffffffffffffff) | (temp << 56);

	printf( " M  %llx \n ", state);
	

	temp  = MixColumnHelper2(second_row);
	state = (state & 0xfffff0ffffffffff) | (temp << 40);
	
	temp  = MixColumnHelper2(third_row);
	state = (state & 0xfffffffff0ffffff) | (temp << 24);
	
	temp  = MixColumnHelper2(fourth_row);
	state = (state & 0xfffffffffffff0ff) | (temp << 8);

	printf( " %llx \n ", state);


	prev_state = state;
	
	/* Third ROW State Variation */
	temp  = MixColumnHelper3(first_row);
	state = (state & 0xff0fffffffffffff) | (temp << 52);
	

	temp  = MixColumnHelper3(second_row);
	state = (state & 0xffffff0fffffffff) | (temp << 36);

	temp  = MixColumnHelper3(third_row);
	state = (state & 0xffffffffff0fffff) | (temp << 20);

	temp  = MixColumnHelper3(fourth_row);
	state = (state & 0xffffffffffffff0f) | (temp << 4);

	printf( " %llx \n ", state);


	prev_state = state;
	/* Fourth ROW State Variation */
	temp  = MixColumnHelper4(first_row);
	state = (state & 0xfff0ffffffffffff) | (temp << 48);

	temp  = MixColumnHelper4(second_row);
	state = (state & 0xfffffff0ffffffff) | (temp << 32);

	temp  = MixColumnHelper4(third_row);
	state = (state & 0xfffffffffff0ffff) | (temp << 16);

	temp  = MixColumnHelper4(fourth_row);
	state = (state & 0xfffffffffffffff0) | (temp);

}


int main(int argc, char*argv[]) {

	//AddConstants(2);
	//ShiftRow();
	//MixColumn();


	int LED = 64;
	int RN = 48;
	if(LED <= 64)
		RN = 32;
	int i, j;
	AddKey();
	for(i = 0; i < RN/4; i++){
		for(j = 0; j < 4; j++)
		{
			AddConstants(i*4+j);
			SubCell();
			ShiftRow();
			MixColumn();
		}
		AddKey();
	}


	printf( " %llx \n ", state);
	return 0;
}
