From: davem@davemloft.net (David Miller)
Date: Tue, 26 Jun 2018 23:25:46 +0900 (KST)
Subject: [PATCH net-next] selftests: forwarding:
 mirror_gre_vlan_bridge_1q: Unset rp_filter
In-Reply-To: <66d218fb95026460e240752eec3af58920a14d86.1529968802.git.petrm@mellanox.com>
References: <66d218fb95026460e240752eec3af58920a14d86.1529968802.git.petrm@mellanox.com>
Message-ID: <20180626.232546.1490966337335126755.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180626142546.t7tbeDgFKAMb2GeAV4wT2QCUXTLwYU34Az5iyVxJHpU@z>

From: Petr Machata <petrm@mellanox.com>
Date: Tue, 26 Jun 2018 01:20:32 +0200

> The IP addresses of tunnel endpoint at H3 are set at the VLAN device
> $h3.555. Therefore when test_gretap_untagged_egress() sets vlan 555 to
> egress untagged at $swp3, $h3's rp_filter rejects these packets. The
> test then spuriously fails.
> 
> Therefore turn off net.ipv4.conf.{all, $h3}.rp_filter.
> 
> Fixes: 9c7c8a82442c ("selftests: forwarding: mirror_gre_vlan_bridge_1q: Add more tests")
> Signed-off-by: Petr Machata <petrm at mellanox.com>
> Reviewed-by: Ido Schimmel <idosch at mellanox.com>

Applied.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
