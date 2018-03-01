From: idosch@idosch.org (Ido Schimmel)
Date: Thu, 1 Mar 2018 21:27:27 +0200
Subject: [PATCH net-next 0/5] selftests: forwarding: misc bug fixes and
 enhancements
In-Reply-To: <20180301190947.7299-1-dsahern@gmail.com>
References: <20180301190947.7299-1-dsahern@gmail.com>
Message-ID: <20180301192727.GA4839@splinter>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180301192727.8T-qMqqpH_q9hviNrqHVyCPUzg4JIZkfU_cALTgXpnI@z>

On Thu, Mar 01, 2018@11:09:42AM -0800, David Ahern wrote:
> Bug fixes and an enhancement for the recent forwarding tests:
> - only check tc version on tc tests
> - only check for mz for tests that will use it
> - handle multipath tests failing with 0 packet count
> - fix ping command for IPv6 on Debian jessie
> - improve summary of multipath tests
> 
> BTW: who is the cruel person that made whitespace 7 spaces in these files?

I see this in some functions in router_multipath.sh . Not sure how that
happened... Will be more careful in the future.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
