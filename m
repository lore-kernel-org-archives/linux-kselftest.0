From: wharms@bfs.de (walter harms)
Date: Sun, 03 Dec 2017 22:59:01 +0100
Subject: [Linux-kselftest-mirror] selftests: Testing a write attempt
	into a full file?
In-Reply-To: <428c83c2-4752-0fe4-b135-fa23b69dca78@users.sourceforge.net>
References: <428c83c2-4752-0fe4-b135-fa23b69dca78@users.sourceforge.net>
Message-ID: <5A2473A5.2070601@bfs.de>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171203215901.WoH7q7YQVd5iKASuU3RmgYtF6qfn_ECA1W-vTX5V2qo@z>



Am 03.12.2017 21:46, schrieb SF Markus Elfring:
> Hello,
> 
> I have constructed another demonstration program.
> 
> 
> #include <errno.h>
> #include <stdio.h>
> #include <stdlib.h>
> 
> int main(void)
> {
> 	FILE *f = fopen("/dev/full", "a");
> 
> 	if (!f)
> 		goto report_failure;
> 
> 	{
> 	int const c = 'X';
> 
> 	if (fputc(c, f) != c)
> 		goto report_failure;
> 	}
> 
Your test is broken, you are writing actualy into a buffer.
Adding setbuf(f,NULL) to disable buffering will return
main: No space left on device

Otherwise force the buffer to be fflush()ed and i it will also
report an error.

> 	return EXIT_SUCCESS;
> 
> report_failure:
> 	perror(__func__);
from perror(3):
 errno is undefined after a successful library call

so this may or may not return what you expect.

re,
 wh
> 	return errno;
> }
> 
> 
> I got the following result.
> 
> elfring at Sonne:~/Projekte/selftests> gcc-7 putc_into_full_file1.c && ./a.out; echo $?
> 0
> 
> 
> Does such a simple test example need further software development considerations?
> 
> Regards,
> Markus
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo at vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
