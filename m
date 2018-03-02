From: davem@davemloft.net (David Miller)
Date: Thu, 01 Mar 2018 21:19:18 -0500 (EST)
Subject: [PATCH v2 net-next 0/4] selftests: forwarding: misc bug fixes
 and enhancements
In-Reply-To: <20180301214933.20199-1-dsahern@gmail.com>
References: <20180301214933.20199-1-dsahern@gmail.com>
Message-ID: <20180301.211918.989356665193400652.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180302021918.wSoLbYjnbSIhIzcUT4ZzEsLspbPq-r8-mmCZowLSGCE@z>

From: David Ahern <dsahern@gmail.com>
Date: Thu,  1 Mar 2018 13:49:29 -0800

> Bug fixes and an enhancement for the recent forwarding tests:
> - only check tc version on tc tests
> - handle multipath tests failing with 0 packet count
> - fix ping command for IPv6 on Debian jessie
> - improve summary of multipath tests
> 
> v2
> - add CHECK_TC to bridge_vlan_aware.sh (Ido)
> - dropped patch 2; always check for mz given its use
> - fixed commit message for the last patch (Multipath: was dropped)

Series applied, thanks David.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
