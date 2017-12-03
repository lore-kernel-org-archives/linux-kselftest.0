From: elfring at users.sourceforge.net (SF Markus Elfring)
Date: Sun, 3 Dec 2017 21:46:55 +0100
Subject: [Linux-kselftest-mirror] selftests: Testing a write attempt into a
	full file?
Message-ID: <428c83c2-4752-0fe4-b135-fa23b69dca78@users.sourceforge.net>

Hello,

I have constructed another demonstration program.


#include <errno.h>
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	FILE *f = fopen("/dev/full", "a");

	if (!f)
		goto report_failure;

	{
	int const c = 'X';

	if (fputc(c, f) != c)
		goto report_failure;
	}

	return EXIT_SUCCESS;

report_failure:
	perror(__func__);
	return errno;
}


I got the following result.

elfring at Sonne:~/Projekte/selftests> gcc-7 putc_into_full_file1.c && ./a.out; echo $?
0


Does such a simple test example need further software development considerations?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
