#include "com_ece5580_apassi_crypto_LED.h"
#include <assert.h>
#include "led-bytes.h"

/*
 * Class:     com_ece5580_apassi_crypto_LED
 * Method:    getMyString
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_com_ece5580_apassi_crypto_LED_getMyString(JNIEnv * env, jobject) {
    return (*env).NewStringUTF("Yo Yo");
}

/*
 * Class:     com_ece5580_apassi_crypto_LED
 * Method:    encrypt
 * Signature: ([B[B)[B
 */
JNIEXPORT jbyteArray JNICALL Java_com_ece5580_apassi_crypto_LED_encrypt
  (JNIEnv * env, jobject, jbyteArray cipherText, jbyteArray key) {

    int len = env->GetArrayLength (cipherText);
    int keyLen = env->GetArrayLength (key);

    // Supporting a 64-bit key only
    assert(keyLen == 4);

    jbyteArray result = env->NewByteArray (len);

    for (int i = 0; i < len; i++) {
        result[i] = cipherText[i];
    }

//    env->SetByteArrayRegion (result, 0, len, reinterpret_cast<jbyte*>(buf));

    LED_enc((unsigned char*) result, (unsigned char*) key, 64);

    return result;
  }