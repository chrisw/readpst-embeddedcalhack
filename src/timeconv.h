#ifndef __PST_TIMECONV_H
#define __PST_TIMECONV_H

#include "common.h"

#ifdef __cplusplus
extern "C" {
#endif
    /** Convert a FILETIME to ascii printable local time.
       @param[in]  filetime time structure to be converted
       @param[out] result   pointer to output buffer, must be at least 30 bytes.
       @return     result pointer to the output buffer
     */
    char* pst_fileTimeToAscii (const FILETIME* filetime, char* result);

    /** Convert a FILETIME to unix struct tm.
       @param[in]  filetime time structure to be converted
       @param[out] result   pointer to output struct tm
     */
    void pst_fileTimeToStructTM (const FILETIME* filetime, struct tm *result);

    /** Convert a FILETIME to unix time_t value.
       @param[in]  filetime time structure to be converted
       @return     result time_t value
     */
    time_t pst_fileTimeToUnixTime( const FILETIME* filetime);
#ifdef __cplusplus
}
#endif

#endif
