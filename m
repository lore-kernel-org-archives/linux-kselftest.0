Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795661452;
	b=vu5fJOV9hBT1at4PfBBhMkZwLwqt6NWxIzFZyeM9MLlUT8CQJxNQwFJ+ukxpQVyPYcea
	 oyH4S+rCPA+kQBNSTf8NNb7fbpsslKRu7rzZo1iAlATf/9E7LkEHWNjHrlWvgB6JEI69X
	 fWj5Wlf2Fqnqa5gmxLij6MbpBrk/GZcIvtqoIT0mUdeI5KuQdQsd3ELYO8zAbaJXu+Rrn
	 9HWa6m1PQwkW4aY7s7BhdZhFTXbIMmpGCq5Umu/WbR5NDBwr7cy9ul1c/5IJdrcOoirmj
	 kGPNu4D2tG3UNsDaqrVSOhDBdjzdbj45/AzV7almMDS7/mt6UapgBW8Opvld4M104mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661452;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/FmVBiVfyBotwdF/iltkXQ19WnirLAekLfetsD4Cg/I=;
	b=IgTI3xGcjq2DsepRN8ogDOh71PYfNxRmy1EoUvfrLmtD+EdSmpD/aqkJcJLYefiPMzJR
	 dbs3SWTtakGzvfGSQce6boJFaM5ce0Zo4D4Ae94F/34DTs3DyGOgO+Tpua9ktrrSSAA76
	 HmR8EuQKXkmqRqNNyYPK0yyNE37ifsZILIzcZw8jDLl9UiC1FZUQN1ywsSARubicNQaxO
	 ITLRfxSwkMzV0G6n5k7k6shN3ObgPZ1iz3COTNKAVNmU8h9gc3/Z7rLgQts1MZusNtSf0
	 JkgodsVfdG3yu4yiVPgj9NGoFfeAR9z+ZyuS4tJ6f0NfsW//AukQ3QI7GPamoSbNYEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jXtIhnhD;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE3A606A327;
	Thu, 26 Nov 2026 02:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AE3A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jXtIhnhD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jXtIhnhDqFmwzzOZADqq1IF/HEJTLyYKnTPJtbkG+bVjrWhgg0KiTTNjoDnZsgDfBM/BaXmVxgNo3
	 5VMh9Q/ozNMjiaJ8wx9VJa8azj4LGhNbL8s0TtiaC6Qe5xxVe5GijvQ5lpnQeAwTkhYnN1hPJ5uxMJ
	 DjmOXCmxs+D453js=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86b079e7e453-f6eb4;
	Thu, 26 Nov 2026 10:50:38 +0800 (CST)
X-RM-TRANSID:2ee86b079e7e453-f6eb4
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from openEuler-24.03.03 (unknown[104.224.130.48])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86b079e693eb-59bf6;
	Thu, 26 Nov 2026 10:50:38 +0800 (CST)
X-RM-TRANSID:2ee86b079e693eb-59bf6
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
Subject: [PATCH net-next v2 0/6] ip tunnels: Enable BIG TCP packets
Date: Wed, 25 Nov 2026 18:50:09 -0800
Message-ID: <20261126025015.10416-1-yanhaishuang@cmss.chinamobile.com>
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
checksum offload. sit is only checked with checksum offload, as it does
not use gro_cells on receive.

With iperf3 over veth in a KVM guest, raising gso_max_size from 64KB to
196608 gives +20% to +39% depending on the tunnel, see the commit
messages for the numbers.

This work was done with the help of an AI coding assistant.

Changes in v2:
- Patches 3-5: mention GUE in the changelog.
- Patch 6: test GUE over sit and over the IPv6 underlay too, skip FOU and
  GUE if the modules can't be loaded, fix the explanation for sit
  (Sashiko). Turn on the outer UDP checksum with FOU and GUE (Alice).
- Collect Reviewed-by from Alice on patches 1-5 (patch 6 changed).
v1: https://lore.kernel.org/netdev/20261124013124.3693-1-yanhaishuang@cmss.chinamobile.com/

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
 .../testing/selftests/net/big_tcp_tunnels.sh  | 139 +++++++++++++++++-
 6 files changed, 143 insertions(+), 3 deletions(-)


base-commit: b7ba0f96da0a33d893f514f18cfea2ffdce3a5ed
-- 
2.43.0



