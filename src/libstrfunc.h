#include "common.h"
char *pst_base64_encode(void *data, size_t size);
char *pst_base64_encode_multiple(void *data, size_t size, int *line_count);
void  pst_hexdump(char *hbuf, int start, int stop, int ascii);
