From: davem at davemloft.net (David Miller)
Date: Sun, 29 Jul 2018 13:00:22 -0700 (PDT)
Subject: [PATCH net-next] selftests: mlxsw: qos_dscp_bridge: Fix
In-Reply-To: <0265c1caa420b594b88f2b43ca0cd8df100aa627.1532731316.git.petrm@mellanox.com>
References: <0265c1caa420b594b88f2b43ca0cd8df100aa627.1532731316.git.petrm@mellanox.com>
Message-ID: <20180729.130022.1331103687380303425.davem@davemloft.net>

From: Petr Machata <petrm at mellanox.com>
Date: Sat, 28 Jul 2018 00:48:13 +0200

> There are two problems in this test case:
> 
> - When indexing in bash associative array, the subscript is interpreted as
>   string, not as a variable name to be expanded.
> 
> - The keys stored to t0s and t1s are not DSCP values, but priority +
>   base (i.e. the logical DSCP value, not the full bitfield value).
> 
> In combination these two bugs conspire to make the test just work,
> except it doesn't really test anything and always passes.
> 
> Fix the above two problems in obvious manner.
> 
> Signed-off-by: Petr Machata <petrm at mellanox.com>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
