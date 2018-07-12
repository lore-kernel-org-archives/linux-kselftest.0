From: davem at davemloft.net (David Miller)
Date: Wed, 11 Jul 2018 23:59:39 -0700 (PDT)
Subject: [PATCH net-next] selftests: forwarding: mirror_gre_nh: Unset
 rp_filter on host VRF
In-Reply-To: <a1d9001969381681ce4c3891ef8404b74aef177f.1531226547.git.petrm@mellanox.com>
References: <a1d9001969381681ce4c3891ef8404b74aef177f.1531226547.git.petrm@mellanox.com>
Message-ID: <20180711.235939.1607210055217095532.davem@davemloft.net>

From: Petr Machata <petrm at mellanox.com>
Date: Tue, 10 Jul 2018 14:44:26 +0200

> The mirrored packets arrive at $h3 encapsulated in GRE/IPv4, with IP
> address from 192.0.2.128/28 network. However the interface is configured
> as a member of 192.0.2.160/28 and there's no route directing traffic
> from the former network through that interface. Correspondingly, the RP
> filter on the VRF rejects it.
> 
> Therefore turn off the VRF's RP filter.
> 
> Signed-off-by: Petr Machata <petrm at mellanox.com>

Applied.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
