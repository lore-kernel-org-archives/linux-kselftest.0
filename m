From: davem@davemloft.net (David Miller)
Date: Mon, 30 Jul 2018 09:48:25 -0700 (PDT)
Subject: [PATCH net-next 0/5] A test for mirror-to-gretap with team in
 UL packet path
In-Reply-To: <cover.1532961216.git.petrm@mellanox.com>
References: <cover.1532961216.git.petrm@mellanox.com>
Message-ID: <20180730.094825.1936294046318747308.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180730164825.XBcvMdyAt7G9b7z9p_w17Xm5pZFdKo7f3BHMSK0L0fE@z>

From: Petr Machata <petrm@mellanox.com>
Date: Mon, 30 Jul 2018 16:37:17 +0200

> This patchset adds a test for "tc action mirred mirror" where the
> mirrored-to device is a gretap, and underlay path contains a team
> device.
> 
> In patch #1 require_command() is added, which should henceforth be used
> to declare dependence on a certain tool.
> 
> In patch #2, two new functions, team_create() and team_destroy(), are
> added to lib.sh.
> 
> The newly-added test uses arping, which isn't necessarily available.
> Therefore patch #3 introduces $ARPING, and a preexisting test is fixed
> to require_command $ARPING.
> 
> In patches #4 and #5, two new tests are added. In both cases, a team
> device is on egress path of a mirrored packet in a mirror-to-gretap
> scenario. In the first one, the team device is in loadbalance mode, in
> the second one it's in lacp mode. (The difference in modes necessitates
> a different testing strategy, hence two test cases instead of just
> parameterizing one.)

I always like seeing new test cases. :)

Series applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
