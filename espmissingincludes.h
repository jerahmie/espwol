#ifndef ESPMISSINGINCLUDES_H
#define ESPMISSINGINCLUDES_H

#ifdef __cplusplus
extern "C" {
#endif
  
int os_printf_plus(const char *format, ...) __attribute__ ((format (printf, 1, 2)));

#ifdef __cplusplus
}
#endif

#endif // ESPMISSINGINCLUDES_H
