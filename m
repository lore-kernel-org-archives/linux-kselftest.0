From: andrew@lunn.ch (Andrew Lunn)
Date: Thu, 18 Jan 2018 13:46:14 +0100
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 00/12] selftests:
 forwarding: Add VRF-based tests
In-Reply-To: <20180118074125.GB5379@splinter>
References: <20180115191853.26129-1-idosch@mellanox.com>
 <df929bcd-f15e-1897-fc54-c9aba9b65667@gmail.com>
 <c8c4a3ef-f21d-0e13-5d35-dfa212c439ab@gmail.com>
 <20180117231111.GG5894@lunn.ch> <20180118074125.GB5379@splinter>
Message-ID: <20180118124614.GF32299@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180118124614.bnPZM94fpCz6uxHlUECCJrhAQxKgdpcvYDnBlndiiu0@z>

> > > >>
> > > >>                              br0
> > > >>                               +
> > > >>                vrf-h1         |           vrf-h2
> > > >>                  +        +---+----+        +
> > > >>                  |        |        |        |
> > > >>     192.0.2.1/24 +        +        +        + 192.0.2.2/24
> > > >>                swp1     swp2     swp3     swp4
> > > >>                  +        +        +        +
> > > >>                  |        |        |        |
> > > >>                  +--------+        +--------+
> > > >>
> > 
> > > Agreed this is really cool! For DSA enabled switches, we usually have a
> > > host that does the test sequencing and then execute commands remotely on
> > > the DUT, but we might be able to get such a similar framework up and
> > > running on the DUT itself without too much hassle.
> > 
> > I think the problem we will have is a lack of ports. Most DSA switches
> > have 4 or 5 ports. Given the need for two ports per bridge port, we
> > will be limited to bridges with just two members. That really limits
> > what sort of tests you can do.
> 
> I was actually interested in feedback from you guys. Looking at
> dsa_slave_changeupper() I see you don't forbid the enslavement to a VRF
> and that you set STP state to forwarding when a port leaves a bridge
> (good). Does that mean you're able to use some of these tests on your
> switches?

By default, we have port separation. So you can add individual IP
addresses to interfaces, and ping from them. In fact, this is the
first test i always run. My test setup uses 4 ports of the switch, and
connects a USB-Ethernet dongle to each port. The 4 USB cables then
connect to my host running the tests. I setup four parallel subnets,
and ping across each.

I've never used vrf, so i've no idea if that will just work on top.

> The reason we can use these tests for mlxsw is that we support VRF and
> ACL offload. At least in the above example, swp4 is able to receive
> packets directed at 192.0.2.2 because we program the device with the
> host route 192.0.2.2/32.

We are all L2. So no route needed. No ACLs either.

So in theory, this could be used with DSA. But in practice, only
having two test ports really restricts you from doing anything
interesting. You need a minimum of 3, and all my tests use 4. Given
your double requirements, that means you actually need a switch with 8
external ports. I don't know of any DSA board which has that.

  Andrew



--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
