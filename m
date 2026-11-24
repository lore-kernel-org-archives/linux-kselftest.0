Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483931;
	b=lkH4JBxK/aETOgKuLNl1D+/dLDZOyRXEpFEowwTSLiQqHxtnmjRQYp2jkjZmvR0Tqo2D
	 SRz4LhtCXBMbEo9g5Uc6buWBRTmCO75vPcb9QJ87PN/vN8hmyKuiFR7NsvNQXgpj157Bz
	 zWo2em7okwnRn9Wzu6xfxzl4VaR+9ZBCalOjZ6yULuVJbyq4NKzHrgZZhBIqWHO1ODTtf
	 hrC0kYtCrdoUd8vw9Gf9l4iPAcgbbT4jDJiVba/xb503jwJ1I2cm1He6V9UMYlNCFcUJN
	 MuRIJI+N092Qy7bPKj2zQSAtZS3VZ1/WXFgetk027EZ50XUrDJFfIlgPD1hFxGa8PcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483931;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8DQfScVI/a0jrYgdwlW/mGWFJDrVQPcoX+a6zQaOWRA=;
	b=1ewx7olXkoC4yFG2B30IjaN5k6XXx7DfgmfhGX2+ei4vSLPbU8QwgOjbKDKMDzqb8Bwy
	 2zdQk/aFqZqxAttHP6pUlJPq3AHy41G25YM+lwT9x7NXBnKxSnR9QGgaLTIcrR2+bSqgB
	 gHz7M+kcEfscy5Q64O27ythdPDoUM3UXUhK01miT23vQEIcs8ruvTxcHGGgdd1SWsJmn6
	 X+qC7w4DF1rFdRw25MQC1X2HTJvqs+QP0BC6ChNh0lonALwdF5zA4pJFK6KqN/CzEUYsU
	 hMD4MpcyxNgRyM1dElxa+QaMFmKKBlroXt4SzHb7ZchP0eCgNqTv/FqMa99lRWk+nxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=cNS8qiJb;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D77606A334;
	Tue, 24 Nov 2026 01:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4D77606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=cNS8qiJb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=cNS8qiJbNOoQAQOqdVNfukYzECZdFweXlnDycQnHnpb3hs1kV2DFWl7AQozhQEWLAnJd/rOvwSbCx
	 dMdCPPxzrGO2yXBlsvB9ttxxUDIW9Osc8rxwqcxPFJpuA0bc+JPTNzvBZeY7SI9kgur8wk9QTZ8TQf
	 FZUhyh+ReL4Gplqc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66b04e910faa-0e47d;
	Tue, 24 Nov 2026 09:32:02 +0800 (CST)
X-RM-TRANSID:2ee66b04e910faa-0e47d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[104.224.130.48])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26b04e8edf00-0e06c;
	Tue, 24 Nov 2026 09:32:02 +0800 (CST)
X-RM-TRANSID:2ee26b04e8edf00-0e06c
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
Subject: [PATCH net-next 2/6] gre: Enable BIG TCP packets
Date: Mon, 23 Nov 2026 17:31:20 -0800
Message-ID: <20261124013124.3693-3-yanhaishuang@cmss.chinamobile.com>
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



