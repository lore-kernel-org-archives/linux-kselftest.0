From: rdunlap@infradead.org (Randy Dunlap)
Date: Fri, 27 Apr 2018 17:17:32 -0700
Subject: kselftest archives etc.
Message-ID: <958d61ac-f70a-80b1-a657-59fe1fd1d369@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180428001732.YVfdavi0aL3kTdj6w4TMnCxdBN3ctqe6epAb6xKvmEw@z>

Hi,

I was having trouble with the use of the gcc -no-pie option in
tools/testing/selftests/x86: (option not supported)

CFLAGS := -O2 -g -std=gnu99 -pthread -Wall -no-pie

so I looked for an archive of linux-kselftest at vger.kernel.org.

http://vger.kernel.org/vger-lists.html lists all mailing lists and
(some of) their archives, but none for linux-kselftest.

Anyway, I checked www.spinics.net for an archive and there it was.


(1) Is it OK to ask DaveM to list http://www.spinics.net/lists/linux-kselftest/
at http://vger.kernel.org/vger-lists.html#linux-kselftest ?

(2) for this patch:  http://www.spinics.net/lists/linux-kselftest/msg03136.html

[PATCH] selftests/x86: Detect -no-pie availability

Acked-by: Randy Dunlap <rdunlap at infradead.org>
Tested-by: Randy Dunlap <rdunlap at infradead.org>

What is the status of this patch?

thanks,
-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
