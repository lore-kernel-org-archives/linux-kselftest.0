From: andrew at lunn.ch (Andrew Lunn)
Date: Thu, 18 Jan 2018 00:11:11 +0100
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 00/12] selftests:
 forwarding: Add VRF-based tests
In-Reply-To: <c8c4a3ef-f21d-0e13-5d35-dfa212c439ab@gmail.com>
References: <20180115191853.26129-1-idosch@mellanox.com>
 <df929bcd-f15e-1897-fc54-c9aba9b65667@gmail.com>
 <c8c4a3ef-f21d-0e13-5d35-dfa212c439ab@gmail.com>
Message-ID: <20180117231111.GG5894@lunn.ch>

> >> However, a similar kind of flexibility can be achieved by using VRFs and
> >> by looping the switch ports together. For example:
> >>
> >>                              br0
> >>                               +
> >>                vrf-h1         |           vrf-h2
> >>                  +        +---+----+        +
> >>                  |        |        |        |
> >>     192.0.2.1/24 +        +        +        + 192.0.2.2/24
> >>                swp1     swp2     swp3     swp4
> >>                  +        +        +        +
> >>                  |        |        |        |
> >>                  +--------+        +--------+
> >>

> Agreed this is really cool! For DSA enabled switches, we usually have a
> host that does the test sequencing and then execute commands remotely on
> the DUT, but we might be able to get such a similar framework up and
> running on the DUT itself without too much hassle.

I think the problem we will have is a lack of ports. Most DSA switches
have 4 or 5 ports. Given the need for two ports per bridge port, we
will be limited to bridges with just two members. That really limits
what sort of tests you can do.

But for top or rack switches, 16 ports, 8 loopback cables, that does
give interesting setups. If i were writing tests for that class of
routers, that would be the hardware setup i would define.

	 Andrew
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
