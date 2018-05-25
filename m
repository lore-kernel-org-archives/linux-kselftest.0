From: davem@davemloft.net (David Miller)
Date: Thu, 24 May 2018 22:14:49 -0400 (EDT)
Subject: [PATCH net-next 0/3] selftests: forwarding: Additions to
 mirror-to-gretap tests
In-Reply-To: <cover.1527093017.git.petrm@mellanox.com>
References: <cover.1527093017.git.petrm@mellanox.com>
Message-ID: <20180524.221449.331369875257512117.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180525021449.uTPyklVmp4ChW5Ze71j7IxMyr1bH5Q5ds8jfgylOWDo@z>

From: Petr Machata <petrm@mellanox.com>
Date: Wed, 23 May 2018 18:34:49 +0200

> This patchset is for a handful of edge cases in mirror-to-gretap
> scenarios: removal of mirrored-to netdevice (#1), removal of underlay
> route for tunnel remote endpoint (#2) and cessation of mirroring upon
> removal of flower mirroring rule (#3).

Series applied, thank you.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
