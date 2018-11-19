From: davem at davemloft.net (David Miller)
Date: Mon, 19 Nov 2018 11:07:45 -0800 (PST)
Subject: [PATCH net-next 01/18] net: skb_scrub_packet(): Scrub
 offload_fwd_mark
In-Reply-To: <20181119161006.5405-2-idosch@mellanox.com>
References: <20181119161006.5405-1-idosch@mellanox.com>
 <20181119161006.5405-2-idosch@mellanox.com>
Message-ID: <20181119.110745.12820215456503449.davem@davemloft.net>

From: Ido Schimmel <idosch at mellanox.com>
Date: Mon, 19 Nov 2018 16:11:07 +0000

> From: Petr Machata <petrm at mellanox.com>
> 
> When a packet is trapped and the corresponding SKB marked as
> already-forwarded, it retains this marking even after it is forwarded
> across veth links into another bridge. There, since it ingresses the
> bridge over veth, which doesn't have offload_fwd_mark, it triggers a
> warning in nbp_switchdev_frame_mark().
> 
> Then nbp_switchdev_allowed_egress() decides not to allow egress from
> this bridge through another veth, because the SKB is already marked, and
> the mark (of 0) of course matches. Thus the packet is incorrectly
> blocked.
> 
> Solve by resetting offload_fwd_mark() in skb_scrub_packet(). That
> function is called from tunnels and also from veth, and thus catches the
> cases where traffic is forwarded between bridges and transformed in a
> way that invalidates the marking.
> 
> Signed-off-by: Petr Machata <petrm at mellanox.com>
> Suggested-by: Ido Schimmel <idosch at mellanox.com>
> Signed-off-by: Ido Schimmel <idosch at mellanox.com>

As a bug fix this seems relevant for 'net' instead of 'net-next'.
