Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483931;
	b=g0bk+xV4BEE8N5yjipQ1PWcqP17SQLVYfIUBCZurIT3OV2F4ItNnmPIcXeTC2tkbrpZm
	 SWM8/OWa+ssVMZToGWFqSZbcyhq6zdmTWPTh2/6JpuwNgSzDWlfOOhi8e5N9MxqF6WK9r
	 gS6tAR533zN12IMaCSbS5gD2WziZi1cLDy6wWv54Ssr3xwtW21eLRCUKL1qspXbElEOQl
	 +0xKye8wqcQ4jE//n/ovzayGUnual7iN5Ji0rdb4gvEAtBduX3ck15z2g09liroALQNu2
	 q8MUzD6PbI4eMjJOeFMsQJdaGAvvOdXyNqoSEN7vLDQq5MgmZZfR5YtvQey04aZ17BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483931;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jgX4mOId1HKBIpOLH2mbuCJSntbymlBiKZ1frGuCA8M=;
	b=czYdXpevHvb/RGOde1NwScXs/9VyAhIT40gwXAldwfwy/t8qCSuEpzOyWpk6AXcyXHKk
	 zhEBD6XQyczgeHAPwmCutkVoLvuib5LJPiva47gMIVb7DXeiQnBX4jxMiIp7UFdoOmb4R
	 XbITBbd74MTfY2Qy0Vgx5od3xQhRt1ZwM9JSdo+Tlgfp+s0lMBXOJJMvYQjzA6wrquN8f
	 TwsdNyOag78y5AujBS4LgWL6R2g7Ef3WEbSbPesS4jIeIPbC6IOejhQWalcFJgh1jZ0Jp
	 e986w9fah9neuEUMwzZKHbOEVqTU141BbzNwAo+TzKvoCeL2NU3TR6KFysb7hWV18vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ce8jBtig;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E1B606A336;
	Tue, 24 Nov 2026 01:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4E1B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ce8jBtig
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ce8jBtigx+1XnT+9Q4y43JO2L60vzMqPCsNLwVkHYNNAtUi5r7edQYVZ34XrkuE32P1z4lQYUsrtR
	 3t1yLSshGj24QQ19PnKfoaMlE8oOejLyN0//AbJHTEeUX5KZ2whvfe1Er3kRjDkE6st3Y/ibc13VWq
	 L8SmicvXayrcRdCQ=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66b04e917fb0-0e483;
	Tue, 24 Nov 2026 09:32:07 +0800 (CST)
X-RM-TRANSID:2ee66b04e917fb0-0e483
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[104.224.130.48])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26b04e8edf00-0e077;
	Tue, 24 Nov 2026 09:32:07 +0800 (CST)
X-RM-TRANSID:2ee26b04e8edf00-0e077
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
Subject: [PATCH net-next 3/6] sit: Enable BIG TCP packets
Date: Mon, 23 Nov 2026 17:31:21 -0800
Message-ID: <20261124013124.3693-4-yanhaishuang@cmss.chinamobile.com>
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
without encapsulation and with FOU.

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



