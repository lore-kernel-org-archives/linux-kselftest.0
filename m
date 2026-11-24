Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483923;
	b=0UnI8KNLv+Xn/70jQurMxT2LTLfIbKGnAcCo6ao2e+zY1xyeRHsIU0nSkOY1alyS2Q5K
	 Ks+g8j/HSksr/FEKW5pQhj2zTj7ToX+Fp/KxwOqhsQ5NblEnHRnNd+eqIuD4MDVw4Twae
	 IpJCVXQd9+CCFiv8ByQQmyfVOpmOdz8AudoeN/NVM9qP0tSi4K0OlhCmK/UuWK7nYtxC5
	 ATuD2NwZb8socLyts8KW2SOl3XTOLUMqw4W4jEsyZmDjNlwVoeo6YyzPb20IKwURWQY61
	 junygNF3MPRC6fsknDntunLCbReEIxld2sqtkkfrDJqUipd8PG5ELZY5TOqvq5Cc4mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483923;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wJGHOnV3Wb5MH8wxspaaUtnx8HHTgvKjZzB/OFvjafQ=;
	b=RCoZVvqOOyZByYr80oF8NVTYl9ajE+p7QYObMJrcU47EJjvCfRnpY1Lcpjv5+9Sxp08O
	 /degaJ85c+mfq45E5v1H8M2Pd3lH6IXN0GjYORXzdlQmUxp5EX11cz2mWHbKRP5ybA7/I
	 07/rZRVK7+8lV1ZT6xy7WTjuD2X+LBAINJshEou55t1sLmME6wbeDMzdzqkc8hI41l1wS
	 i1egliU0+qGBeYv+jLFbN+BdWUMruxo1dtSt5AJCQ+mg2cSdiCCPhpY8D//S7FOphYJp0
	 Xtdcxp9T7IU1JCnuDHgfPEUGRQf0k/hm44sQWmLlUGFLB0jaClw5a2+roXrjMkmGDNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=iLM0r9WK;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7868D606A322;
	Tue, 24 Nov 2026 01:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7868D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=iLM0r9WK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=iLM0r9WKvBVd2prX0d8nA4eKKXvlD9VA+HTOyT9MgD3RY335t43lM4rnSlVVSMZmYVW3/1kctV9E7
	 6Qr0n01y+/xLNeMLwqQjo0SUw9N9Aqqn+d7xXIlIaUFwVFsfyKbU5FGY7Q4irlD06uvbLwo3u0WHYh
	 vV9vlaQLlU1XLg0c=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46b04e90834a-e1acf;
	Tue, 24 Nov 2026 09:31:52 +0800 (CST)
X-RM-TRANSID:2ee46b04e90834a-e1acf
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from openEuler-24.03.03 (unknown[104.224.130.48])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26b04e8edf00-0e029;
	Tue, 24 Nov 2026 09:31:52 +0800 (CST)
X-RM-TRANSID:2ee26b04e8edf00-0e029
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
Subject: [PATCH net-next 0/6] ip tunnels: Enable BIG TCP packets
Date: Mon, 23 Nov 2026 17:31:18 -0800
Message-ID: <20261124013124.3693-1-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
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

Following vxlan and geneve, this series allows BIG TCP on ipip, gre,
gretap, sit, ip6tnl, ip6gre and ip6gretap, which also covers their FOU
and GUE encapsulation. The UDP length of FOU and GUE is already handled
since commit 47282504ad21 ("udp: Support BIG TCP GSO packets where they
can occur").

Each driver patch bumps tso_max_size to GSO_MAX_SIZE in the setup of
the device, like vxlan and geneve do. The default gso_max_size and
gso_ipv4_max_size stay at 64KB. vti, erspan and ip6erspan are left
alone.

Patch 6 extends big_tcp_tunnels.sh, which already covers vxlan, geneve
and bareudp, to check that BIG TCP packets go through all these devices,
without encapsulation and with FOU and GUE, with and without veth tx
checksum offload. sit is only checked with checksum offload, as GRO does
not build sit packets larger than 64KB.

With iperf3 over veth in a KVM guest, raising gso_max_size from 64KB to
196608 gives +20% to +39% depending on the tunnel, see the commit
messages for the numbers.

This work was done with the help of an AI coding assistant.

Haishuang Yan (6):
  ipip: Enable BIG TCP packets
  gre: Enable BIG TCP packets
  sit: Enable BIG TCP packets
  ip6_tunnel: Enable BIG TCP packets
  ip6_gre: Enable BIG TCP packets
  selftests: net: big_tcp_tunnels: Cover IP tunnels

 net/ipv4/ip_gre.c                             |   2 +
 net/ipv4/ipip.c                               |   1 +
 net/ipv6/ip6_gre.c                            |   2 +
 net/ipv6/ip6_tunnel.c                         |   1 +
 net/ipv6/sit.c                                |   1 +
 .../testing/selftests/net/big_tcp_tunnels.sh  | 131 +++++++++++++++++-
 6 files changed, 135 insertions(+), 3 deletions(-)


base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
-- 
2.43.0



