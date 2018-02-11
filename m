From: mingo at kernel.org (Ingo Molnar)
Date: Sun, 11 Feb 2018 12:21:53 +0100
Subject: [Linux-kselftest-mirror] [PATCH 2/5] selftests/x86: fix vDSO
 selftest segfault for vsyscall=none
In-Reply-To: <20180211111013.16888-3-linux@dominikbrodowski.net>
References: <20180211111013.16888-1-linux@dominikbrodowski.net>
 <20180211111013.16888-3-linux@dominikbrodowski.net>
Message-ID: <20180211112153.f2ni5mcuut6f6zvq@gmail.com>


* Dominik Brodowski <linux at dominikbrodowski.net> wrote:

> +		char name[128];
> +		if (sscanf(line, "%p-%p %c-%cp %*x %*x:%*x %*u %s",
> +			   &start, &end, &r, &x, name) != 5)

So that's a buffer overflow waiting to happen, if a line in 'maps' gets too large, 
right?

Thanks,

	Ingo
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
