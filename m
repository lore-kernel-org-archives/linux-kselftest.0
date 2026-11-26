Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795661467;
	b=48gCu5kffkTwH8itFIWCLlBurOm9W/49lUzoEqJE0Y9TrEL0eA9EXXoi0eC+Wct9mtnl
	 6juxGm5YEMiZd3EvEy3gpMgAUUI7QrrRb+ycG1JuWvNcVompOCxOScEOWQZT9Otwxi/Dm
	 PgMXMDSADDIsLzEP+BdKtoy9Yh5JcotRy4Wf5CIEiIZAE1/ViYC0jn47cY9wyjdVuYl6P
	 SUEpvQ+vDpLbgyd5YXK0ne2MwsNFPosFFIggAOqZBch9y6DnXAELdD4otKmhKW5vvWfhD
	 AVMvPLeuI8V/bY8nraHUXkWnap+pwNsQDs8TxasWI9ATeoSD+j60IPN5DuHkWzwnNLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661467;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ndf9yZP6EBzsJ/qlwEcDzJHp/MND10cYC2fVje+7eNg=;
	b=wyu5yrf04UQjf9zJvy7eXANVE6cdZPlRakCNcIcNgPXS7yeBa4QG66RnPxDBvQWBkrmY
	 x63lX1ST2BlHLf5H+IvYl4ZzmXfig90e4YlXkD4gs6L0RF9Zz/fgrjm4huDUEgQFLcaD4
	 XyhyGdUEW06oEqolkMSNPYnMSZQinD+yaDlfF26eXveHZQZmzfqyOApyqNW/wmqnbUrmZ
	 rdtElx5ItEhBm4ODz6CvRQkPkc4HG8mkf48AKbYiBrry+eR+1kdFydryGhQeL8IuzIj1s
	 4gKVBwRn+X+2uXej23MTUIBwBuwpaUKL7XF5UR+j6IZdFOfVDeJds+vxQZbTXvN6C0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=QEmgZ0do;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCF6606A326;
	Thu, 26 Nov 2026 02:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DCF6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=QEmgZ0do
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=QEmgZ0dofslj00y4HLbJ6OegjYMMLnBXaqxWb42oRWP6rQ8QbE88JpVSKt8xr02Q6+9CrVEURTF0Y
	 CKi2lNAGO9ld7stfCOQiYXuF5a0TyysbI3FxZXPFwRS48bEtl00vfM2BYxeaEj5663xj+2gaAnTNfj
	 R31GPpBzVRfiUaLE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36b079e97878-22b7e;
	Thu, 26 Nov 2026 10:51:03 +0800 (CST)
X-RM-TRANSID:2ee36b079e97878-22b7e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[104.224.130.48])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86b079e693eb-59c56;
	Thu, 26 Nov 2026 10:51:03 +0800 (CST)
X-RM-TRANSID:2ee86b079e693eb-59c56
From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Alice Mikityanska <alice.kernel@fastmail.im>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 5/6] ip6_gre: Enable BIG TCP packets
Date: Wed, 25 Nov 2026 18:50:14 -0800
Message-ID: <20261126025015.10416-6-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126025015.10416-1-yanhaishuang@cmss.chinamobile.com>
References: <20261126025015.10416-1-yanhaishuang@cmss.chinamobile.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit f3d0f753f066 ("vxlan: Enable BIG TCP packets") and
commit 03ebe91b0f61 ("geneve: Enable BIG TCP packets") allowed BIG TCP
on UDP tunnels. ip6gre and ip6gretap can carry BIG TCP packets as well:
IPv6 BIG TCP no longer needs a hop-by-hop jumbo header, the GRE header
has no length field, the GSO and GRO paths already handle it, and FOU
encapsulation sets the UDP length with udp_set_len() since
commit 47282504ad21 ("udp: Support BIG TCP GSO packets where they can
occur").

Bump tso_max_size up to GSO_MAX_SIZE so that the admin can use BIG TCP
with ip6gre and ip6gretap. ip6erspan is left alone. The default
gso_max_size and gso_ipv4_max_size stay at 64KB, so nothing changes
unless they are raised explicitly.

iperf3 TCP over ip6gre and ip6gretap, with IPv4 traffic between two
netns connected by veth, without encapsulation, 3 runs of 10 seconds
each, in a KVM guest with 8 vCPUs on an Intel Core i7-14700 host:

  ip6gre,    65536:   84.7,  84.4,  90.2 Gbit/s
  ip6gre,    196608: 117.7, 112.5, 128.4 Gbit/s (+38%)
  ip6gretap, 65536:  103.1,  97.9, 102.4 Gbit/s
  ip6gretap, 196608: 123.0, 125.7, 124.8 Gbit/s (+23%)

A later patch in this series extends big_tcp_tunnels.sh to cover ip6gre
and ip6gretap with IPv4 and IPv6 traffic, without encapsulation and with
FOU and GUE.

Reviewed-by: Alice Mikityanska <alice.kernel@fastmail.im>
Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
---
 net/ipv6/ip6_gre.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index 26c0e1c4de1..0ace21db3b4 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -1462,6 +1462,7 @@ static void ip6gre_tunnel_setup(struct net_device *dev)
 	dev->flags |= IFF_NOARP;
 	dev->addr_len = sizeof(struct in6_addr);
 	netif_keep_dst(dev);
+	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
 	/* This perm addr will be used as interface identifier by IPv6 */
 	dev->addr_assign_type = NET_ADDR_RANDOM;
 	eth_random_addr(dev->perm_addr);
@@ -1934,6 +1935,7 @@ static void ip6gre_tap_setup(struct net_device *dev)
 	dev->priv_flags &= ~IFF_TX_SKB_SHARING;
 	dev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
 	netif_keep_dst(dev);
+	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
 }
 
 static bool ip6gre_netlink_encap_parms(struct nlattr *data[],
-- 
2.43.0



