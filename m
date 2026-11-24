Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483940;
	b=fSgvoqMK46Las89NnWnRVUcQJlzR7yhENXCBO4Rm9ymbxsQHTYyCRZbaEwDP2jevDLT8
	 s+vEjmzNbvyt+4MshwNb0qcxlbhhRlbb/iuAlJoe58jEM1vIh6fkRfHJEzJWFLuKf1JOl
	 dpX4llvtF8Xzou3VyvlQ6HHZYbQ43BUa1haNop2E5e42hx5ifbmz8r7oDABWuHMehqh1T
	 4P7kxmKhajxuXBytSkrOxBklWAHILL8lt6mgKo2OSUXOGv3bFZrwJ9D/WmjIhg5ftQKKa
	 t0V1l59DJqX89R7aV/Y8a2E1rAprNJ8oV/bqTVWLjbWoOnxjcIzkmek4+REz5m6/Ynw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483940;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kTiCx1nGBqhTPvN9zmHTwQR8MBY578BB/oiZhYYLins=;
	b=Zw6NO/GnaLpK6a63rLdMEBWSQekBl4yZUmksLDgWxEOD1RCErknm5PrUNBHKbOWwJZ8h
	 1l+ZJQo+3sW2BHK0sCFBpSqZLthqwSrxjaEI+gGP6d32X2nSxSZYXHsgS5TPAQgEZYc+F
	 WEQ3R9XhVd+6r2U275ezasxu8ypJDC7U2ZEJCjEonExjG3BZn/WmwHBq7OYDVwoYTkski
	 KI5bgzhIIuJ+qSpbl5C5kESQGN+s9FviaPoEAwvSv60yz7bVp5jeHurvgl3rfMKs8eIBZ
	 1xO3Nk0r+eI6lIWRg6PpZgi49Paip8Ow6vMBstsOi51xCHO7GOz0Nj0ujOiUHh3/Q5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=MOfrJH1E;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0725E606A31E;
	Tue, 24 Nov 2026 01:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0725E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=MOfrJH1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=MOfrJH1E6iHCM6bz4IBzaIRYFWUiHv11QUvCQSe4B/89t8eDakmP9dievy9ZvmFJiWS5uYML02mr4
	 MNhLQZ6Rq4aPsQvfbqixFClNwJ69l3SCRejCF6Hrk5uiTlB1TO0PI9v6kPVkaAqumdDOJRX/oNkBz+
	 HijECyooY+fQ3u7E=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66b04e921fc7-0e49a;
	Tue, 24 Nov 2026 09:32:17 +0800 (CST)
X-RM-TRANSID:2ee66b04e921fc7-0e49a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[104.224.130.48])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26b04e8edf00-0e094;
	Tue, 24 Nov 2026 09:32:17 +0800 (CST)
X-RM-TRANSID:2ee26b04e8edf00-0e094
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
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 5/6] ip6_gre: Enable BIG TCP packets
Date: Mon, 23 Nov 2026 17:31:23 -0800
Message-ID: <20261124013124.3693-6-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124013124.3693-1-yanhaishuang@cmss.chinamobile.com>
References: <20261124013124.3693-1-yanhaishuang@cmss.chinamobile.com>
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
FOU.

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



