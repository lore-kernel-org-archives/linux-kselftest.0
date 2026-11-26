Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795661468;
	b=yeQI/S/y4+M5eslaXxt6p/3bRcTPaEaycqiK8iMsoO4uZ2ELewT0u6StzByROSRHj7WD
	 BLivv0mo9oaGlYOyOHX9p5sE/M3jej8rkFV5a2Me2zq+4O+jdD9X+ZD15XoSa+qJqrgnZ
	 l05xGlfKmJIIfUV2ZpvRFyLCv5hSNYXGCU8sJ/y7kBl8UHJjsvWIljGNb0qW+QqLJrwd6
	 ONSFsLzaWrpp0EpPa7eLI8QU3QLGjf7Xsood2GdPE5eEE/F47Ye+9bJMzrAMbMam4Hz2J
	 PkRTmM1FGbUT+diATwWTQ3UPk0iJB9rlIgMJN+qDMkhuQckekMQzZ3YP7M/iD08qJHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661468;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UTvwzeMDlYwCgKOPvi6/8ytTUxbKbDf1EkK+RUqXSnU=;
	b=TeOZI6NfY9OT5TgTYE9MVYNW75AXkzwW+/Zm8SL6Sa7LQCz2OJE92Z2l+0GQE+qPLRBb
	 mxCfY4+wQTAX1SAuHHMSwui0ThR2KXwg1e0IJRJINP4pDaAHCQ1/dcdOwMtaaIyEB1hSU
	 ZliGlFUnY3l+DnJLbG3qWcYd6y7wP1/wYAbYVoNjqmXwCfz5x+16hIaL+RLeFw6rk3C8G
	 1ze3GwaEpTKzLfBMsYA8HzoOewBDzE9VgprqB9/j0RL+tqa59pvJEmz7NPnzeKQQ5SNXH
	 xzT/xTQ1GBAqshOfRgcCebHQ1sEE+XDvEWJqRlIuthTtg8njg4sxRgQstPwEkHtInpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=XN1eGnfO;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40878606A327;
	Thu, 26 Nov 2026 02:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40878606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=XN1eGnfO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=XN1eGnfOTnXxxOlXBqE9uwp4wOs3HU3FMLO2k93IU+OPZK9MeS+xSmT5cyRy1gerHZ3+Lfehsspbb
	 vjOQLdMrKChTDykeX5ffPTmWmVNZ3/c1eM3F/+X8SdQ1rbQOum6PGHAbiHTGXEOhEK03C6kUbL1x+l
	 dsRs9l4Hee3Dta6A=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96b079e919d3-5c70f;
	Thu, 26 Nov 2026 10:50:58 +0800 (CST)
X-RM-TRANSID:2ee96b079e919d3-5c70f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[104.224.130.48])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86b079e693eb-59c4a;
	Thu, 26 Nov 2026 10:50:58 +0800 (CST)
X-RM-TRANSID:2ee86b079e693eb-59c4a
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
Subject: [PATCH net-next v2 4/6] ip6_tunnel: Enable BIG TCP packets
Date: Wed, 25 Nov 2026 18:50:13 -0800
Message-ID: <20261126025015.10416-5-yanhaishuang@cmss.chinamobile.com>
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
with IPv4 and IPv6 traffic, without encapsulation and with FOU and GUE.

Reviewed-by: Alice Mikityanska <alice.kernel@fastmail.im>
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



