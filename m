Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483941;
	b=5cw4+7gON8O+JGExutUpG8BkTG7FTqmuR9O3V5Vcd1LtK+QgxBr16fgLL62lF3nVd5nP
	 OcyWjuF9PfeByXfrN5S6Zqfy4ps9VacVopq72Kp7IdP8E//CJMvb1bGQlaN2319L6TSSD
	 VeFsli35Evy4r5W2mq+dh5qzKXpTIig098bsr7b2LX4rKAKlcZg4d1DhNQ1lQxMAPJ36+
	 nvhk/RgT9BV7lpubu6YUUK3R+2rFLHgKE6dibKzyn/EmX7OCOMr07hVTSM+u+hD/v2Sox
	 dv5D+F9C4zcnJUYiEVVwPzjDwTBiI127t+daWvRdTceS+3waA8VZuSizOlLuWyrpRgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483941;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kGW+sY6QHEhChuoRnQ4cRR8nlzxPeZXJJCiRCxQ8e08=;
	b=f/JlO2m+6xCuIT3x5QYWoMIEAf6MCgonCdeFVculPfVIwPAMDdozRfPqTjfzZcaNGu85
	 QJXHhQP/lhCamdoLxIw275mKPOJfj/xstjyCwzlAdkH1ONGTKSCeZJKJye5WTeszu4EE1
	 ZlKjtOZdHShnCms1uQozzyutfL2MMemmbQWQrbJGbV8mUl9tHsdmeKTpS7auGFuaWTbJ5
	 bR/sQiTfTi8MEK8aGA3Jaxkpip5X269H0Cem/54sT2/6ZuAXrJEh7DKKnemjBPwIXWS38
	 awDe0QvNhqF2ztPU7e0HZ9cH95X8LM/UOD7LpA3d+vEbg+sPHIHm8FP2ekn7NJbOuKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=V5JcN7PZ;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A6F606A322;
	Tue, 24 Nov 2026 01:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A6F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=V5JcN7PZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=V5JcN7PZMNQyMDJMwmTjyh0HiOHmeHiqjpv7QATDF3UpI6uXPBrBdwcyC3D4Bej+mjvEXynV0/7sk
	 0tzEbmhSIkyIkWb77tiPBs2oS6zursEHOlRSnPkbWydGly+1vmlfqTetxkZ7F9PZRdMNNmrQ/wNmWa
	 pQZBtxeSDaAvcXU0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76b04e91c727-428e1;
	Tue, 24 Nov 2026 09:32:12 +0800 (CST)
X-RM-TRANSID:2ee76b04e91c727-428e1
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[104.224.130.48])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26b04e8edf00-0e086;
	Tue, 24 Nov 2026 09:32:12 +0800 (CST)
X-RM-TRANSID:2ee26b04e8edf00-0e086
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
Subject: [PATCH net-next 4/6] ip6_tunnel: Enable BIG TCP packets
Date: Mon, 23 Nov 2026 17:31:22 -0800
Message-ID: <20261124013124.3693-5-yanhaishuang@cmss.chinamobile.com>
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
on UDP tunnels. ip6tnl can carry BIG TCP packets as well: IPv6 BIG TCP
no longer needs a hop-by-hop jumbo header, the GSO and GRO paths already
handle it, and FOU encapsulation sets the UDP length with udp_set_len()
since commit 47282504ad21 ("udp: Support BIG TCP GSO packets where they
can occur").

Bump tso_max_size up to GSO_MAX_SIZE so that the admin can use BIG TCP
with ip6tnl. The default gso_max_size and gso_ipv4_max_size stay at
64KB, so nothing changes unless they are raised explicitly.

iperf3 TCP over ip6tnl, with IPv4 traffic between two netns connected by
veth, without encapsulation, 3 runs of 10 seconds each, in a KVM guest
with 8 vCPUs on an Intel Core i7-14700 host:

  gso_max_size/gso_ipv4_max_size 65536:   93.0,  90.8,  83.3 Gbit/s
  gso_max_size/gso_ipv4_max_size 196608: 134.8, 123.4, 112.8 Gbit/s (+39%)

A later patch in this series extends big_tcp_tunnels.sh to cover ip6tnl
with IPv4 and IPv6 traffic, without encapsulation and with FOU.

Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
---
 net/ipv6/ip6_tunnel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
index 64a184bca46..040012cdf15 100644
--- a/net/ipv6/ip6_tunnel.c
+++ b/net/ipv6/ip6_tunnel.c
@@ -1919,6 +1919,7 @@ static void ip6_tnl_dev_setup(struct net_device *dev)
 	dev->lltx = true;
 	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
 	netif_keep_dst(dev);
+	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
 
 	dev->features		|= IPXIPX_FEATURES;
 	dev->hw_features	|= IPXIPX_FEATURES;
-- 
2.43.0



