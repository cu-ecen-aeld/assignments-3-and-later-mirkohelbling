#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <syslog.h>


/* Arbitrary, just to set the size of the buffer (see below).
   Can be bigger or smaller */
#define BUFSIZE 1000

int main(int argc, char *argv[])
{
    openlog(NULL, 0, LOG_USER);

    /* Check the number of arguments*/
    if(argc != 3){
        exit(1);
    }

    char message[BUFSIZE];

    strcpy(message, argv[2]);

    const char *filename = argv[1];

    FILE *file =fopen(filename, "w+");
    if(file ==-1){
         syslog (LOG_ERR, "Error by fopen happens %d", file);
        if (errno == EACCES){
            perror ("Access denied");
            exit(1);
            }
        else if(errno == ENOENT){
            perror ("File or directory does not exist");
            exit(1);
        }
        else if(errno == ETXTBSY){
            perror ("Text file is busy");
            exit(1);
        }
        perror("");
    }

    int nr = fputs(message, file);
    if (nr == -1){
        syslog (LOG_ERR, "Error by fputs happen %d", nr);
        if (errno == EACCES){
            perror ("Access denied");
            exit(1);
            }
        else if(errno == ENOENT){
            perror ("File or directory does not exist");
            exit(1);
        }
        else if(errno == ETXTBSY){
            perror ("Text file is busy");
            exit(1);
        }
    perror("");
} 
    syslog (LOG_DEBUG, "Writing %s", message ,"to", filename);
    fclose(file);
    closelog ();

}