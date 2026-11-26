Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795661453;
	b=qsM+LV4j/FL/HalPZrJzJHdYm9psP6Ud9eCxTxUxrbOAS53A+0adq14k8t6u1mgpL898
	 xMWr56hn/CQQPyXc6CUNyrCsZyYuPtRqsz1JT1ls9rY5jcdERs8Pehd3M4xSKKN2nR3PI
	 F8nKWYSZwwE73DdvevW+fLJLcm6O2UCIZYFG7+WL0ivwHBLhXTlGbEi6n9Sh6pbmH67gn
	 I1Hecvl67Ah26v9f/i6/v4t9rvfk0OzLy+DxZFxHqTN1O1aaXxEVyL9/8yqLlWZBKgYLw
	 2PtmsHl0oUHH8ZXx00nEf1DIssxymnLZQLTrWphp8EBcaZsPepP92JXcw4trxujb6zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661453;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o1MZcE24GU7E92J7de/D9mQ78QO/ZOjzQpgJg+tcA9I=;
	b=UHWf0JrO3GFAbXANpObWXMQ0ojyTTphoGGxpPvSpdPUYsCzkyAIbUTZXYpP08BbUZd2o
	 WPv7RLMtSLzUmJCmjI9i/gnpvYl9JdrvuZxaY+kEx73N/A8DPwJbUxh4qdv+AYelsmAZB
	 vKKg8AIU/ecihSZ/TZsZbl20x7HM4/qof2uk9QhLwLHdzlxjOdmWffq2rBzhn4G4tIcjV
	 aqj/TpmxEIYiTkU0Pd6lvwUskh6S6TgE9LvDu2Ep5NPPTM7iJ2LKK6xBt8klZMzS+jWRR
	 2WTx5CgEBaahgm4RghOSylyxYu5Vz21DRzpZzZp/0Y9oEsUAQocYpyoo0zvNp0MkxEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=l0g4cwRT;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B3A606A321;
	Thu, 26 Nov 2026 02:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2B3A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=l0g4cwRT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=l0g4cwRTSHt2HkTeqiH5vRF0HMmbb1at6882iDH7uL5jR9knUIMZcyIaiDWYW4bI3tr+t3scFEam3
	 taxw2yTnRta+XmX92Csb8OxEMEQprfiCGzNeHsE8GZ+Jfyp2oCU9hnu4WWYAzy3FPmspXkZdNKm+jG
	 /KLJx2QqLrXzH9ug=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86b079e84458-f6eb9;
	Thu, 26 Nov 2026 10:50:48 +0800 (CST)
X-RM-TRANSID:2ee86b079e84458-f6eb9
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[104.224.130.48])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86b079e693eb-59c2e;
	Thu, 26 Nov 2026 10:50:48 +0800 (CST)
X-RM-TRANSID:2ee86b079e693eb-59c2e
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
Subject: [PATCH net-next v2 2/6] gre: Enable BIG TCP packets
Date: Wed, 25 Nov 2026 18:50:11 -0800
Message-ID: <20261126025015.10416-3-yanhaishuang@cmss.chinamobile.com>
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
on UDP tunnels. gre and gretap can carry BIG TCP packets as well: the
outer IPv4 header gets its total length from iph_set_totlen() on output,
the GRE header has no length field, the GSO and GRO paths already handle
IPv4 BIG TCP, and FOU and GUE encapsulation set the UDP length with
udp_set_len() since commit 47282504ad21 ("udp: Support BIG TCP GSO
packets where they can occur").

Bump tso_max_size up to GSO_MAX_SIZE so that the admin can use BIG TCP
with gre and gretap. erspan is left alone. The default gso_max_size and
gso_ipv4_max_size stay at 64KB, so nothing changes unless they are
raised explicitly.

iperf3 TCP over gre and gretap between two netns connected by veth,
without encapsulation, 3 runs of 10 seconds each, in a KVM guest with 8
vCPUs on an Intel Core i7-14700 host:

  gre,    65536:   92.9,  94.2,  93.0 Gbit/s
  gre,    196608: 130.6, 128.6, 123.3 Gbit/s (+37%)
  gretap, 65536:  105.5, 106.6, 106.6 Gbit/s
  gretap, 196608: 124.7, 129.7, 127.5 Gbit/s (+20%)

A later patch in this series extends big_tcp_tunnels.sh to cover gre and
gretap with IPv4 and IPv6 traffic, without encapsulation, and with FOU
and GUE.

Reviewed-by: Alice Mikityanska <alice.kernel@fastmail.im>
Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
---
 net/ipv4/ip_gre.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index f8a7c435350..41ec54dcbfd 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -1007,6 +1007,7 @@ static void ipgre_tunnel_setup(struct net_device *dev)
 {
 	dev->netdev_ops		= &ipgre_netdev_ops;
 	dev->type		= ARPHRD_IPGRE;
+	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
 	ip_tunnel_setup(dev, ipgre_net_id);
 }
 
@@ -1394,6 +1395,7 @@ static void ipgre_tap_setup(struct net_device *dev)
 	dev->netdev_ops	= &gre_tap_netdev_ops;
 	dev->priv_flags &= ~IFF_TX_SKB_SHARING;
 	dev->priv_flags	|= IFF_LIVE_ADDR_CHANGE;
+	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
 	ip_tunnel_setup(dev, gre_tap_net_id);
 }
 
-- 
2.43.0



