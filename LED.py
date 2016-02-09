import os
import sys
import math

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


    def getSBoxValue(self,num):
        """Retrieves a given S-Box Value"""
        return self.sbox[num]

    def getRoundConstant(self,round, bit):
        constant = self.roundConstants[round];
        print constant & (1 << bit);

    

def generateRandomKey(keysize):
    """Generates a key from random data of length `keysize`.    
    The returned key is a string of bytes.    
    """
    if keysize not in (16, 24, 32):
        emsg = 'Invalid keysize, %s. Should be one of (16, 24, 32).'
        raise ValueError, emsg % keysize
    return os.urandom(keysize)

def testStr(cleartext, keysize=16, modeName = "CBC"):
    '''Test with random key, choice of mode.'''
    print 'Random key test', 'Mode:', modeName
    print 'cleartext:', cleartext
    key =  generateRandomKey(keysize)
    print 'Key:', [ord(x) for x in key]
    mode = AESModeOfOperation.modeOfOperation[modeName]
    cipher = encryptData(key, cleartext, mode)
    print 'Cipher:', [ord(x) for x in cipher]
    decr = decryptData(key, cipher, mode)
    print 'Decrypted:', decr
    
    
if __name__ == "__main__":
    obj = LED()
    for x in range(0, 7):
        obj.getRoundConstant(1, x);
