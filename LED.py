import os
import sys
import math
from random import randint

class LED(object):
    '''AES funtions for a single block
    '''
    # Very annoying code:  all is for an object, but no state is kept!
    # Should just be plain functions in a AES modlule.
    
    # valid key sizes
    keySize = dict(SIZE_128=16, SIZE_192=24, SIZE_256=32)

    # LED S-box
    sbox =  [0xC, 0x5, 0x6, 0xB, 0x9, 0x0, 0xA, 0xD, 0x3, 
            0xE, 0xF, 0x8, 0x4, 0x7, 0x1, 0x2]

    # Below are the list of (rc5,rc4,rc3,rc2,rc1,rc0) 
    # encoded to byte values for each round, with rc0 
    # being the least significant bit.
    # Round Constants
    roundConstants = [0x01, 0x03, 0x07, 0x0F, 0x1F, 0x3E, 
                    0x3D, 0x3B, 0x37, 0x2F, 0x1E, 0x3C, 0x39,
                    0x33, 0x27, 0x0E, 0x1D, 0x3A, 0x35, 0x2B,
                    0x16, 0x2C, 0x18, 0x30, 0x21, 0x02, 0x05,
                    0x0B, 0x17, 0x2E, 0x1C, 0x38, 0x31, 0x23,
                    0x06, 0x0D, 0x1B, 0x36, 0x2D, 0x1A, 0x34,
                    0x29, 0x12, 0x24, 0x08, 0x11, 0x22, 0x04]


    MDS = [ [ 0x4, 0x1, 0x2, 0x2],
            [ 0x8, 0x6, 0x5, 0x6],
            [ 0xB, 0xE, 0xA, 0x9],
            [ 0x2, 0x2, 0xF, 0xB] ]


    def getSBoxValue(self,num):
        """Retrieves a given S-Box Value"""
        return self.sbox[num]

    def getRoundConstant(self,round, bit):
        constant = self.roundConstants[round];
        print constant & (1 << bit);


    def addConstants(self, state, round, kbits):

        state[1][0] ^= 1;
        state[2][0] ^= 2;
        state[3][0] ^= 3;

        state[0][0] ^= (kbits>>4)&0xf;
        state[1][0] ^= (kbits>>4)&0xf;
        state[2][0] ^= kbits & 0xf;
        state[3][0] ^= kbits & 0xf;

        tmp = (self.roundConstants[round] >> 3) & 7;
        state[0][1] ^= tmp;
        state[2][1] ^= tmp;
        tmp = self.roundConstants[round] & 7;
        state[1][1] ^= tmp;
        state[3][1] ^= tmp;

        return state
    
    def subBytes(self, state):
        for i in range(0, len(state)): 
            for j in range(0, len(state[i])):
                state[i][j] = self.getSBoxValue(state[i][j] & 0xF);
        return state

    def shiftRows(self, state):
        for i in range(1, len(state)):
            state[i] = self.leftShiftArray(state[i], i);
        return state

    def leftShiftArray(self, arr, shiftNum):
        length = len(arr)
        shiftNum = abs(shiftNum) % length
        
        while shiftNum > 0:
            shiftNum = shiftNum - 1
            temp = arr[0]
            for i in range(0, length):
                if i != length - 1:
                    arr[i] = arr[i+1];
                else:
                    arr[i] = temp

        return arr

    def mixColumnSerial(self, state):

        temp = [0 for x in range(4)]
        for j in range(0, 4):

            for i in range(0, 4):
                sum = 0;
                for k in range(0, 4):
                    sum = sum ^ self.fieldMult(self.MDS[i][k], state[k][j]);
                temp[i] = sum;

            for i in range(0, 4):
                state[i][j] = temp[i];

        return state

    def mixColumnSerialHelper(self, MDS, stateVector):

        result = []
        length = len(stateVector)
        for i in range(0, len(MDS)):
            temp = 0
            for j in range(0, len(MDS[i])):
                temp = temp ^ self.fieldMult(MDS[i][j], stateVector[i])
            result.append(temp)

        return result


    def fieldMult(self, a, b):
        ReductionPoly = 0x3;
        x = a
        ret = 0
        WORDFILTER = 0xf
    
        for i in range(0, 4):
            if (b >> i) & 1:
                ret = ret ^ x
            if (x & 0x8):
                x = x << 1
                x = x ^ ReductionPoly
            else:
                x = x << 1

        return ret & WORDFILTER;


    def ledRound(self, state, round, kbits):
        state = self.addConstants(state, round, kbits)     
        state = self.subBytes(state)
        state = self.shiftRows(state)
        state = self.mixColumnSerial(state)
        return state

    def keyXOR(self, state, key):
        for i in range(0, len(state)): 
            for j in range(0, len(state[i])):
                state[i][j] = state[i][j] ^ key[i][j]
        return state

    def ledEncrypt(self, state, key):

        S = 8
        state = self.keyXOR(state, key)
        for i in range(0, S):
            for j in range(0, 4):
                state = self.ledRound(state, i*4 + j, 64)
            state = self.keyXOR(state, key)
 
        return state

    def ledEncrypt128(self, state, key1, key2):

        S = 12
        state = self.keyXOR(state, key1)
        for i in range(0, S):
            for j in range(0, 4):
                state = self.ledRound(state, i*4 + j, 128)

            if i % 2 == 0:
                state = self.keyXOR(state, key1)
            else:
                state = self.keyXOR(state, key2)


        return state

    def print_results(self, state):
        s = [[str(e) for e in row] for row in state]
        lens = [max(map(len, col)) for col in zip(*s)]
        fmt = '  '.join('{{:{}}}'.format(x) for x in lens)
        table = [fmt.format(*row) for row in s]
        fmt = '\n'.join(table)
        # fmt = '  '.join(fmt)
        print fmt

    
if __name__ == "__main__":

    state = [[0 for x in range(4)] for x in range(4)]
    key = [[0 for x in range(4)] for x in range(4)]

    obj = LED()

    # count = 0
    # for i in range(0, 4):
    #     for j in range(0, 4):
    #         state[i][j] = count
    #         key[i][j] = count
    #         count = count + 1

    print ''
    print "plain - text"
    obj.print_results(state)
    print ''

    print "Key1"
    obj.print_results(key)
    print ''

    state = obj.ledEncrypt(state, key)

    print "cipher - text"
    obj.print_results(state)
    print ''

