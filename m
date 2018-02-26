From: idosch at idosch.org (Ido Schimmel)
Date: Mon, 26 Feb 2018 22:07:52 +0200
Subject: [PATCH net-next 00/14] selftests: forwarding: Add VRF-based tests
In-Reply-To: <20180226133524.GB1195@lunn.ch>
References: <20180226085948.19368-1-idosch@mellanox.com>
 <20180226133524.GB1195@lunn.ch>
Message-ID: <20180226200752.GC4195@splinter>

On Mon, Feb 26, 2018 at 02:35:24PM +0100, Andrew Lunn wrote:
> On Mon, Feb 26, 2018 at 10:59:34AM +0200, Ido Schimmel wrote:
> > One of the nice things about network namespaces is that they allow one
> > to easily create and test complex environments.
> > 
> > Unfortunately, these namespaces can not be used with actual switching
> > ASICs, as their ports can not be migrated to other network namespaces
> > (NETIF_F_NETNS_LOCAL) and most of them probably do not support the
> > L1-separation provided by namespaces.
> > 
> > However, a similar kind of flexibility can be achieved by using VRFs and
> > by looping the switch ports together. For example:
> > 
> >                              br0
> >                               +
> >                vrf-h1         |           vrf-h2
> >                  +        +---+----+        +
> >                  |        |        |        |
> >     192.0.2.1/24 +        +        +        + 192.0.2.2/24
> >                swp1     swp2     swp3     swp4
> >                  +        +        +        +
> >                  |        |        |        |
> >                  +--------+        +--------+
> 
> Hi Ido
> 
> So you decided to stick to a bridge of just two interfaces. You
> clearly can write tests using this, but it seems very limiting. You
> cannot test bridging vs flooding. You cannot tests packets don't leak
> between parallel bridges. It i hard to test igmp snooping, etc.

Thanks for the feedback Andrew. The bridge tests I currently have in the
patchset are the simplest I could come up with. I plan to add more tests
that will use more complex topologies.

At this stage, I'm mainly interested in feedback regarding the
infrastructure itself and will include the tests you suggested (in the
other mail as well) in follow-up patches.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
