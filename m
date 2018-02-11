From: linux@dominikbrodowski.net (Dominik Brodowski)
Date: Sun, 11 Feb 2018 14:00:29 +0100
Subject: [Linux-kselftest-mirror] [PATCH 2/5] selftests/x86: fix vDSO
 selftest segfault for vsyscall=none
In-Reply-To: <20180211121714.GA11096@isilmar-4.linta.de>
References: <20180211111013.16888-1-linux@dominikbrodowski.net>
 <20180211111013.16888-3-linux@dominikbrodowski.net>
 <20180211112153.f2ni5mcuut6f6zvq@gmail.com>
 <20180211121714.GA11096@isilmar-4.linta.de>
Message-ID: <20180211130029.GA23754@light.dominikbrodowski.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180211130029.AY3HyZ9vsGDMwSAH7vaCXOaUzm9UWnpGzP7FLbQ9TIs@z>

On Sun, Feb 11, 2018@01:17:14PM +0100, Dominik Brodowski wrote:
> On Sun, Feb 11, 2018@12:21:53PM +0100, Ingo Molnar wrote:
> > 
> > * Dominik Brodowski <linux@dominikbrodowski.net> wrote:
> > 
> > > +		char name[128];
> > > +		if (sscanf(line, "%p-%p %c-%cp %*x %*x:%*x %*u %s",
> > > +			   &start, &end, &r, &x, name) != 5)
> > 
> > So that's a buffer overflow waiting to happen, if a line in 'maps' gets too large, 
> > right?
> 
> ... as does tools/testing/selftests/x86/test_vsyscall.c already now, right?
> Will fix both up with an additional patch.

Maybe no fix is needed after all: The fgets() call a few lines above
limits "line" to 127 chars max. So "name" can't even get close to 128
chars, right?

	char line[128];
...
	while (fgets(line, sizeof(line), maps)) {

Thanks,
	Dominik
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
