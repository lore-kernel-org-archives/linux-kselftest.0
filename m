From: davem at davemloft.net (David Miller)
Date: Sat, 30 Jun 2018 22:06:54 +0900 (KST)
Subject: [PATCH net-next 00/13] mlxsw: Add resource scale tests
In-Reply-To: <cover.1530319109.git.petrm@mellanox.com>
References: <cover.1530319109.git.petrm@mellanox.com>
Message-ID: <20180630.220654.479410647137748499.davem@davemloft.net>

From: Petr Machata <petrm at mellanox.com>
Date: Sat, 30 Jun 2018 02:44:23 +0200

> There are a number of tests that check features of the Linux networking
> stack. By running them on suitable interfaces, one can exercise the
> mlxsw offloading code. However none of these tests attempts to push
> mlxsw to the limits supported by the ASIC.
> 
> As an additional wrinkle, the "limits supported by the ASIC" themselves
> may not be a set of fixed numbers, but rather depend on a profile that
> determines how the ASIC resources are allocated for different purposes.
> 
> This patchset introduces several tests that verify capability of mlxsw
> to offload amounts of routes, flower rules, and mirroring sessions that
> match predicted ASIC capacity, at different configuration profiles.
> Additionally they verify that amounts exceeding the predicted capacity
> can *not* be offloaded.
 ...

Good stuff, series applied, thanks!
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
