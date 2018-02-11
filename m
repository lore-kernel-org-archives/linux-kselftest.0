From: mingo at kernel.org (Ingo Molnar)
Date: Sun, 11 Feb 2018 19:24:28 +0100
Subject: [Linux-kselftest-mirror] [PATCH 2/5] selftests/x86: fix vDSO
 selftest segfault for vsyscall=none
In-Reply-To: <20180211130029.GA23754@light.dominikbrodowski.net>
References: <20180211111013.16888-1-linux@dominikbrodowski.net>
 <20180211111013.16888-3-linux@dominikbrodowski.net>
 <20180211112153.f2ni5mcuut6f6zvq@gmail.com>
 <20180211121714.GA11096@isilmar-4.linta.de>
 <20180211130029.GA23754@light.dominikbrodowski.net>
Message-ID: <20180211182428.e7isprkt6hbuq3dk@gmail.com>


* Dominik Brodowski <linux at dominikbrodowski.net> wrote:

> On Sun, Feb 11, 2018 at 01:17:14PM +0100, Dominik Brodowski wrote:
> > On Sun, Feb 11, 2018 at 12:21:53PM +0100, Ingo Molnar wrote:
> > > 
> > > * Dominik Brodowski <linux at dominikbrodowski.net> wrote:
> > > 
> > > > +		char name[128];
> > > > +		if (sscanf(line, "%p-%p %c-%cp %*x %*x:%*x %*u %s",
> > > > +			   &start, &end, &r, &x, name) != 5)
> > > 
> > > So that's a buffer overflow waiting to happen, if a line in 'maps' gets too large, 
> > > right?
> > 
> > ... as does tools/testing/selftests/x86/test_vsyscall.c already now, right?
> > Will fix both up with an additional patch.
> 
> Maybe no fix is needed after all: The fgets() call a few lines above
> limits "line" to 127 chars max. So "name" can't even get close to 128
> chars, right?
> 
> 	char line[128];
> ...
> 	while (fgets(line, sizeof(line), maps)) {

Yeah, probably - but still, this connection and the sscanf() guarantee is not 
obvious at first sight, so please improve this to derive from the same value 
(define a LINE_MAX size or such), plus maybe add a comment to the sscanf() line 
that this is safe because strlen(name) >= strlen(line).

Thanks,

	Ingo
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
