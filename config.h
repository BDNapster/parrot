/* config.h
 *
 * Platform-specific config file
 *
 */

#if !defined(PARROT_CONFIG_H_GUARD)
#define PARROT_CONFIG_H_GUARD 
typedef long IV;
typedef long double NV;

typedef struct _vtable VTABLE;
typedef void DPOINTER;
typedef void SYNC;

//typedef IV *(*opcode_funcs)(void *, void *) OPFUNC;

#define FRAMES_PER_CHUNK 16

#define FRAMES_PER_PMC_REG_CHUNK FRAMES_PER_CHUNK
#define FRAMES_PER_NUM_REG_CHUNK FRAMES_PER_CHUNK
#define FRAMES_PER_INT_REG_CHUNK FRAMES_PER_CHUNK
#define FRAMES_PER_STR_REG_CHUNK FRAMES_PER_CHUNK

#define MASK_CHUNK_LOW_BITS 0xfffff000

#endif
