Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795661448;
	b=3sU0hF9gdMyg8Djlsjjg4u69GTVyMaukj1j0WNqlte3SQloiiQzTEBlg32gLVHysVFpv
	 JJ/FGsXAHkoP9aj8UQmBQeabHHI2HC2+NpflpdR0n/aPGViqed6OwLK6hEaWpnYgbrzfY
	 QmxjlUwtZkdJOp15lCD8M4VH47w/66kVQSxyucT+yBHDj2Lawwpt1us510Zpa50wIN6Go
	 zlZnhFg8xcLrgxmMZkElPla6JkeOH/aru+kEdTZfguh7Y8M3nGxb5ySJNdZPa4s+0xcSF
	 1T55P1E5CsWcZrPnbp4/nezFIEl5wNnxHRImmgnXIvs+SEDAgNErtqqYuTc0lvbiI2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661448;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tjFdlVVA7ekWCX0fNqw/SC5FFs7MiHWieiFjZJkC8e8=;
	b=sgI2sJ3CX6t7dNM/jGEx1sCTrsWkotVZnZ4Q2coP2htP8X/aSnQD/bDFGsmtllAmTuQj
	 SbD35/TS1Gg/Ryb+jdj16zThr33vxp0EHivsBaC8+x4emPxfHTJEXxXXpNBjvGH277CU4
	 i6wbANLrCL+eNTpO0FXyG+obpOpSuEvwqiKYIKl8aZkb6Lxkp3TSBNoeBr5VHE8L8j3xk
	 rDhuX3ccExP+VBp15tT4SRzKIbLpaT1sySY+ft2vJA1cQ3kDXdrUSWRo1Ws645Md2Qhea
	 Jw1oBMttl4jORfUDXN1/3BVlWXG/IX6s5o5EPXC2MB0Fpy1HrDSWacdmGfhLvx728fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=RDJwM465;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228CA606A323;
	Thu, 26 Nov 2026 02:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 228CA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=RDJwM465
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=RDJwM465hiRtcq2s0DiYhflvlDWymGKWrcBg7hZ5TVE6+A+DIk2CFyR4xm3kVwSU+1GZCeY/S0omw
	 ToL+s9uA8RGy2Q4JsEsEF5yBjVDQAjKBWefd4mB61Pgf+i/iHp2oygGqMr2Wz3WdVoN8QT6tMjcCuI
	 5HtsRcm9JkD1AYtg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66b079e82045-23635;
	Thu, 26 Nov 2026 10:50:43 +0800 (CST)
X-RM-TRANSID:2ee66b079e82045-23635
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[104.224.130.48])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86b079e693eb-59c24;
	Thu, 26 Nov 2026 10:50:43 +0800 (CST)
X-RM-TRANSID:2ee86b079e693eb-59c24
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
Subject: [PATCH net-next v2 1/6] ipip: Enable BIG TCP packets
Date: Wed, 25 Nov 2026 18:50:10 -0800
Message-ID: <20261126025015.10416-2-yanhaishuang@cmss.chinamobile.com>
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
on UDP tunnels. ipip can carry BIG TCP packets as well: the outer IPv4
header gets its total length from iph_set_totlen() on output, the GSO
and GRO paths already handle IPv4 BIG TCP, and FOU and GUE encapsulation
set the UDP length with udp_set_len() since commit 47282504ad21 ("udp:
Support BIG TCP GSO packets where they can occur").

Bump tso_max_size up to GSO_MAX_SIZE so that the admin can use BIG TCP
with ipip. The default gso_max_size and gso_ipv4_max_size stay at 64KB,
so nothing changes unless they are raised explicitly.

iperf3 TCP over ipip between two netns connected by veth, without
encapsulation, 3 runs of 10 seconds each, in a KVM guest with 8 vCPUs
on an Intel Core i7-14700 host:

  gso_max_size/gso_ipv4_max_size 65536:   94.2,  97.4,  97.2 Gbit/s
  gso_max_size/gso_ipv4_max_size 196608: 133.7, 128.5, 130.5 Gbit/s (+36%)

A later patch in this series extends big_tcp_tunnels.sh to cover ipip
without encapsulation, and with FOU and GUE.

Reviewed-by: Alice Mikityanska <alice.kernel@fastmail.im>
Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
---
 net/ipv4/ipip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/ipv4/ipip.c b/net/ipv4/ipip.c
index 15189e1fa06..74af06b1d94 100644
--- a/net/ipv4/ipip.c
+++ b/net/ipv4/ipip.c
@@ -416,6 +416,7 @@ static void ipip_tunnel_setup(struct net_device *dev)
 	dev->addr_len		= 4;
 	dev->lltx		= true;
 	netif_keep_dst(dev);
+	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
 
 	dev->features		|= IPIP_FEATURES;
 	dev->hw_features	|= IPIP_FEATURES;
-- 
2.43.0



