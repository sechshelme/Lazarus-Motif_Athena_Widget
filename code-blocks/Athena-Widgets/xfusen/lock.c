/*
 * xfusen -- Fusen on X Desktop
 *
 *  lock.c    Lock Subroutine
 */

#include "xfusen.h"

#ifdef SVR4              /* for Solaris */
 #include <fcntl.h>
#else
 #include <sys/file.h>
#endif

static int lock_fd;
static char lock_name[256];

Boolean InitLock()
{
  sprintf(lock_name,"%s%d",_LOCK_PATH,getuid());

  if ((lock_fd = open(lock_name,O_RDONLY|O_CREAT|O_NONBLOCK|O_EXCL,0444)) < 0) {
    return FALSE;
  }
  return TRUE;
}

void RemoveLock()
{
  close(lock_fd);
  remove(lock_name);
}