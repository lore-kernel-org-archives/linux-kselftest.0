From: davem at davemloft.net (David Miller)
Date: Tue, 10 Jul 2018 22:58:29 -0700 (PDT)
Subject: [PATCH net-next] selftests: forwarding: mirror_lib: Tighten up
 VLAN capture
In-Reply-To: <0fecbe018ff9a06a5f3686e3c4801b5005925019.1531072211.git.petrm@mellanox.com>
References: <0fecbe018ff9a06a5f3686e3c4801b5005925019.1531072211.git.petrm@mellanox.com>
Message-ID: <20180710.225829.143333520309033405.davem@davemloft.net>

From: Petr Machata <petrm at mellanox.com>
Date: Sun, 08 Jul 2018 19:58:55 +0200

> The function do_test_span_vlan_dir_ips() is used for testing whether
> mirrored packets are VLAN-encapsulated. But since it only considers
> VLAN encapsulation, it may end up matching unmirrored ARP traffic as
> well. One consequence is a rare failure of mirror_gre_vlan_bridge_1q's
> test_gretap_untagged_egress. Decreasing ping cadence in mirror_test()
> makes the problem easily reproducible.
> 
> Therefore tighten up the match criterion to only count those 802.1q
> packets where the next header is IP.
> 
> Signed-off-by: Petr Machata <petrm at mellanox.com>

Applied.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
