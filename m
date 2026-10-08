Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CF02F8E91;
	Sat, 10 Oct 2026 01:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791595177; cv=none; b=NP3Sh6P6YimJEoBDKjYIqaWlA2VDiNJmiaJQ58s8zW/xyh/kt8HGO6vXKYmegL0c1PJDnOk3Ikm39Cg2j0AFyAVqAieZs3vvVAGLOBjpbZ5YqD9meehZjhd8/Om6/2UdbbZAt5Hx2D+mPWozlA7MnR+5Qu/VS1dI9DVhHbgXKlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791595177; c=relaxed/simple;
	bh=31WdfSjCWnB/HGcobwieMsmopL0/q4Qyr3sHHctciOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QovXQ62W41FHqfII6T+5JhBAAv8Znr1rU9mxHIafpN3wSqzQVaHwE76jkmpmD4m1kbhQMmyQKaoxgw48oSFOKpIS5sWWSfJkvxsMI5nYIY7JLR1815Fk9Tr7Zy2y55BJ7t4IUHMO4Gt/ZSw6grh4as7qiCaIRPFVQU0K67gXvsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b=hF92NX+4; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b="hF92NX+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=hF92NX+4PKQlCk36n0azjzLoEAZNMSzBRQZ+65LW8GHQQyUZMo1n0iJ50aV8I4KdARfQ1NgXZee8k
	 Ywjl2C0DBfcEcyeUZu6d3eo/SHC9l1P8K1sOKUvBOGSMfIQS+hqE66PnCT2eM5dkJSahH1STl6k4Rw
	 WC8bfZSC1U4lyI2s=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16ac9929abbc-9e4dd;
	Sat, 10 Oct 2026 09:19:22 +0800 (CST)
X-RM-TRANSID:2ee16ac9929abbc-9e4dd
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.100])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26ac99295573-599fe;
	Sat, 10 Oct 2026 09:19:22 +0800 (CST)
X-RM-TRANSID:2ee26ac99295573-599fe
From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: Alice Mikityanska <alice.kernel@fastmail.im>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Subject: [PATCH net-next v3 1/2] bareudp: Enable BIG TCP packets
Date: Thu,  8 Oct 2026 13:55:12 +0800
Message-ID: <20261008055513.1560739-2-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008055513.1560739-1-yanhaishuang@cmss.chinamobile.com>
References: <20261008055513.1560739-1-yanhaishuang@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit f3d0f753f066 ("vxlan: Enable BIG TCP packets") and commit
03ebe91b0f61 ("geneve: Enable BIG TCP packets") allowed BIG TCP on vxlan
and geneve, after the preceding patches of that series made the common
UDP tunnel transmit path handle GSO packets larger than 64KB.

bareudp transmits through the same helpers, udp_tunnel_handle_offloads()
followed by udp_tunnel_xmit_skb() or udp_tunnel6_xmit_skb(), and does
not fill in any length field itself. Bump tso_max_size up to
GSO_MAX_SIZE so that the admin can use BIG TCP with bareudp too.

The default gso_max_size and gso_ipv4_max_size stay at 64KB, so nothing
changes unless they are raised explicitly.

iperf3 TCP over bareudp (ethertype ipv4, IPv4 outer) between two netns
connected by veth, MTU 1600 on veth, 3 runs of 20 seconds each. This
was measured in a QEMU TCG guest, so only the relative numbers are
meaningful:

  gso_max_size/gso_ipv4_max_size 65536:
    4380.6, 4404.2, 4354.5 Mbit/s, average 4379.8 Mbit/s

  gso_max_size/gso_ipv4_max_size 196608:
    5509.4, 5454.7, 5497.4 Mbit/s, average 5487.2 Mbit/s (+25%)

With 196608, about 90k to 100k packets larger than 64KB were
transmitted on the bareudp device per run, none with 65536. Without
this patch, setting gso_max_size to 196608 is rejected.

Assisted-by: LLM
Acked-by: Alice Mikityanska <alice.kernel@fastmail.im>
Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
---
 drivers/net/bareudp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/bareudp.c b/drivers/net/bareudp.c
index c3b5ed52d877..fcc33e302b9c 100644
--- a/drivers/net/bareudp.c
+++ b/drivers/net/bareudp.c
@@ -589,6 +589,7 @@ static void bareudp_setup(struct net_device *dev)
 	dev->max_mtu = IP_MAX_MTU - BAREUDP_BASE_HLEN;
 	dev->type = ARPHRD_NONE;
 	netif_keep_dst(dev);
+	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
 	dev->priv_flags |= IFF_NO_QUEUE;
 	dev->lltx = true;
 	dev->flags = IFF_POINTOPOINT | IFF_NOARP | IFF_MULTICAST;
-- 
2.43.0



