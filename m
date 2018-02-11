From: linux@dominikbrodowski.net (Dominik Brodowski)
Date: Sun, 11 Feb 2018 13:17:14 +0100
Subject: [Linux-kselftest-mirror] [PATCH 2/5] selftests/x86: fix vDSO
 selftest segfault for vsyscall=none
In-Reply-To: <20180211112153.f2ni5mcuut6f6zvq@gmail.com>
References: <20180211111013.16888-1-linux@dominikbrodowski.net>
 <20180211111013.16888-3-linux@dominikbrodowski.net>
 <20180211112153.f2ni5mcuut6f6zvq@gmail.com>
Message-ID: <20180211121714.GA11096@isilmar-4.linta.de>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180211121714.ME6ZIJ6Sjwqz5R9hB7cE68-TOsrKdNEDZPqMN60FTHY@z>

On Sun, Feb 11, 2018@12:21:53PM +0100, Ingo Molnar wrote:
> 
> * Dominik Brodowski <linux@dominikbrodowski.net> wrote:
> 
> > +		char name[128];
> > +		if (sscanf(line, "%p-%p %c-%cp %*x %*x:%*x %*u %s",
> > +			   &start, &end, &r, &x, name) != 5)
> 
> So that's a buffer overflow waiting to happen, if a line in 'maps' gets too large, 
> right?

... as does tools/testing/selftests/x86/test_vsyscall.c already now, right?
Will fix both up with an additional patch.

But a more generic question: Is there a quick, easy but reliable test
available in userspace to determine whether
	int $0x80
	vsyscall
is available on a given system, or will cause a segfault?

Thanks,
	Dominik
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
