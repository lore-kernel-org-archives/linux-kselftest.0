Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483926;
	b=FHY0mmoCIEPww2443oD532SeOHisDMaT6dKOQSnFSGax+P4SgzBv5WaNGYT+JhoeMkV9
	 2eiw5/wC/8QcYvK1R6a9SIiPVDB9NdZ7f7+PvUvJMfQ2dA6AKJeyB2BnMsn9KfXl2OPlj
	 9To+pWBMe2NRKoalNSAGOt3oHr/zMWdgo/OayJTRYMm3DnjEUIqPDMMmPRL2wBNevhFSo
	 /tTNa2HkbQp8Fswpu+pLvE1eVSNspdvmsoR8pCQ+PO826MtXjqxFovjPG37nYP+ZdRCmJ
	 lAkqOONqWqH4OTMkIpSZL0DdJBWB1tfdSKYg4yHxwjai9HgueDdG9v4DM7UwNHJ9O7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483926;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lWYIIShJOlJiI3HAIOOlkWjUg5h7k/nHaxRbuLK/H7c=;
	b=KK2OZtbdhVhMmJwqe6Jw3mMJc0IyI9wItf/xZNXDsoVRuPeCrTq92hY4kt7f8Mis3ZMU
	 yojUWtyrvF38N7k0Mw3IUTqDTsNtGRzzucp4YIAAK1wyan1pSx/8VLSd4AzaKPt8zLFtS
	 8NFWOInPyf6HaXGLi+2s92eyxBarvqokQKqk4TSzfD/R5Z1mZjVnoOqBbpym9/TuTX7s1
	 s8YcGS2eEznm1nVT4HUzOW0zNRdWl+5hbEfE+CmK2Owyd64Vg597RvrRRHKoMG/cqYQ+i
	 wcto50eQ31YJpcYwsxeewbVskRMhZyqhxmW/CPQvIKYaAKE9IBtTn9hNmddgYQPi9Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=T8T9I30W;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418D8606A335;
	Tue, 24 Nov 2026 01:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 418D8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=T8T9I30W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=T8T9I30WfKIzaLz2jpqG+PmJ8n7dwBhT7PJgU5HB35tzKRJpyJc6a5tUTImZ46p44u8trDFWR7BpE
	 UPOUsswYb6u9iOouXGI27H6A3af8hnMY4cMIgSxc03820jI7lguGDZdCVL8QOKZIPs6uO3xeOfJ3CT
	 5nYLyr1y8/QRcIPo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66b04e90dfa5-0e478;
	Tue, 24 Nov 2026 09:31:57 +0800 (CST)
X-RM-TRANSID:2ee66b04e90dfa5-0e478
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[104.224.130.48])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26b04e8edf00-0e05f;
	Tue, 24 Nov 2026 09:31:57 +0800 (CST)
X-RM-TRANSID:2ee26b04e8edf00-0e05f
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
Subject: [PATCH net-next 1/6] ipip: Enable BIG TCP packets
Date: Mon, 23 Nov 2026 17:31:19 -0800
Message-ID: <20261124013124.3693-2-yanhaishuang@cmss.chinamobile.com>
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



