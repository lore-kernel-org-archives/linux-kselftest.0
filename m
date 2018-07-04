From: davem@davemloft.net (David Miller)
Date: Wed, 04 Jul 2018 14:19:04 +0900 (KST)
Subject: [PATCH net-next 0/2] More mirror-to-gretap tests with bridge in UL
In-Reply-To: <cover.1530553971.git.petrm@mellanox.com>
References: <cover.1530553971.git.petrm@mellanox.com>
Message-ID: <20180704.141904.1557393882926335114.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180704051904.DGjBWUNvWzxgglabg5GsmYU9O2yWuSLo2w-2FaOHdEI@z>

From: Petr Machata <petrm@mellanox.com>
Date: Mon, 02 Jul 2018 19:58:44 +0200

> This patchset adds two more tests where the mirror-to-gretap has a
> bridge in underlay packet path, without a VLAN above or below that
> bridge.
> 
> In patch #1, a non-VLAN-filtering bridge is tested.
> 
> In patch #2, a VLAN-filtering bridge is tested.

Series applied.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
