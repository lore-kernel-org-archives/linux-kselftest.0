Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795661456;
	b=AZ3rIibByM/0/1fYjHdJQfAGBgBv6n7Q2EnMFz22JlOJoN79lezgWhnm2aDsn35ErBd2
	 +J9lCQnLu8OYmVuFMgtX04a+262EzF1xBMyAVOV5Se1xE4AcXz5S7ZUDACqP1yNGL4R1T
	 pyXCZr/1ScsLDgs3DAEKW3FhsXEgHEo68/71dzYNEueifpaILrSl4XHla+ji6TuL72ORh
	 ALORE4XRVA6ppsyQ4YmGY4UWY3gFtNeWRpevCTyHJ4mL9v+jKTbf3YbD4oV3ktDLGnbaF
	 vfjlM4xJkaxhiwAVHJSn6jNHXFgzFht8lV3xYwOyNY32xL5wA37qcDLt+cNk0jhXQcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661456;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SfeYB57igHTTlxVjpfFBm169fwgr0jQg7p1/yKEN9h4=;
	b=uZsJaUHkCxPjqgLV5ex4DOWuXJZd53nrFz+/W5RfE03QU6IzOeGrn2QrdqIOyG6fppwB
	 INoNZf+W8VFc0hcM4mHhoppgIpPd7jebiv0UJ1oYrv1sne7bcVrj00mMuAi3y2R4lTfGG
	 PzW7MeEjVwooGLVh+6w9mNgPq8vaVAVdE8SXISy4luY2B1BYDSudJs3e36K5vua9r++L0
	 bFFWM/4/J2szNMzACJLXcPCNSTwBqr0P9pAl3T32P/zGB07mXBY5hzIbNMqY4DN303a2B
	 TmUSGg2UY4gA/ITSQ4ZtUFS6SOn9dKxWuWdqa5kqVxGOyPMNuDOuOb7zKKoKcVNjxXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=RP0qA63+;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC531606A338;
	Thu, 26 Nov 2026 02:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC531606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=RP0qA63+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=RP0qA63+S+UEjokQNopUb703S+eZPFtlTnn079r6z9ygoKFJaL6tT1tuHAvZbiMusOFCtXa+Lbjlx
	 DY9q3FRmw8wl/V7bTSz+4CiF12tNEWVpgheeWHZmgj09ZYb6zi/a594dJaF2AQJBkh4WiBS6dyX2xF
	 ZFaHJ5Xp/GPFW2R8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86b079e8d45d-f6ebe;
	Thu, 26 Nov 2026 10:50:53 +0800 (CST)
X-RM-TRANSID:2ee86b079e8d45d-f6ebe
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[104.224.130.48])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86b079e693eb-59c39;
	Thu, 26 Nov 2026 10:50:53 +0800 (CST)
X-RM-TRANSID:2ee86b079e693eb-59c39
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
Subject: [PATCH net-next v2 3/6] sit: Enable BIG TCP packets
Date: Wed, 25 Nov 2026 18:50:12 -0800
Message-ID: <20261126025015.10416-4-yanhaishuang@cmss.chinamobile.com>
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
on UDP tunnels. sit can carry BIG TCP packets as well: the outer IPv4
header gets its total length from iph_set_totlen() on output, the GSO
path already handles BIG TCP, and FOU encapsulation sets the UDP length
with udp_set_len() since commit 47282504ad21 ("udp: Support BIG TCP GSO
packets where they can occur").

Bump tso_max_size up to GSO_MAX_SIZE so that the admin can use BIG TCP
with sit. The default gso_max_size and gso_ipv4_max_size stay at 64KB,
so nothing changes unless they are raised explicitly.

iperf3 TCP over sit between two netns connected by veth, without
encapsulation, 3 runs of 10 seconds each, in a KVM guest with 8 vCPUs
on an Intel Core i7-14700 host:

  gso_max_size 65536:   96.0,  95.4,  98.0 Gbit/s
  gso_max_size 196608: 136.9, 131.0, 129.8 Gbit/s (+37%)

On the receive side, GRO does not build sit packets larger than 64KB, so
the gain comes from the sender when the underlay offloads GSO.

A later patch in this series extends big_tcp_tunnels.sh to cover sit
without encapsulation and with FOU and GUE.

Reviewed-by: Alice Mikityanska <alice.kernel@fastmail.im>
Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
---
 net/ipv6/sit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/ipv6/sit.c b/net/ipv6/sit.c
index a7ec800216a..97044b1cad2 100644
--- a/net/ipv6/sit.c
+++ b/net/ipv6/sit.c
@@ -1577,6 +1577,7 @@ static void ipip6_tunnel_setup(struct net_device *dev)
 	dev->max_mtu		= IP6_MAX_MTU - t_hlen;
 	dev->flags		= IFF_NOARP;
 	netif_keep_dst(dev);
+	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
 	dev->addr_len		= 4;
 	dev->lltx		= true;
 	dev->features		|= SIT_FEATURES;
-- 
2.43.0



