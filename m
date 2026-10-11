Received: from smtp.uniroma2.it (smtp-2015.uniroma2.it [160.80.4.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA3E26656D;
	Sun, 11 Oct 2026 19:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746667; cv=none; b=ea/3vy/d5B+Puk5nh6MFZO1vvZBGxcSEG3tNiIZd1hz/TuC3xeOlkE+C77s4GmFlryboAiLxocqwaAkP9FoI9tY22UDDizVd6D/g+FoB3UKG8SXhWBOrjoSBhyW4xknvpLacUe42oIHFhGR0PA51WRxqSo/toZWYzccZed0dupQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746667; c=relaxed/simple;
	bh=QwOM6hFMt4hkwQeemfy+63vYTFj8AuI6bmv+YuyF/Jw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k8j6y1CcEnICixkSthruwf8mY4lqjiotR3yTbod+9BlM8P3clZccL6YCWTdKbTE7ZmGeubd0ofQRonx5TGaDUPnq9WZ6zKv4NtXP+unDCnc7v3hIpOUNLd9qEA2gCwGbARAhhIjaFtiqqfUyf1vwF27UgqfHiUIAVDVVXZrCqN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=FdUinSsU; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=bXrTWA4n; arc=none smtp.client-ip=160.80.4.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="FdUinSsU";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="bXrTWA4n"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 69BJNbSX010946;
	Sun, 11 Oct 2026 21:23:42 +0200
Received: from localhost.localdomain (unknown [160.80.105.87])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id AA5621228D8;
	Sun, 11 Oct 2026 21:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1791746612; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JBKsRlvMdblf5D1683fF488/D5zTQsvt3iQZRP+rwxw=;
	b=FdUinSsU4LxC7PX9sNho/+xqepny4rpwCJmdFOngY9/NXmpivC4La+UgDRDpyT1PSJf+V8
	jlWFb3/sonAvZcCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1791746612; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JBKsRlvMdblf5D1683fF488/D5zTQsvt3iQZRP+rwxw=;
	b=bXrTWA4nOwBBMl9M9P83TrXNLpLOTM02GIBm6QroFygxI2LzIEfB4pO0OKoUQN2CAmsfPY
	RDWw4MAXOjgt+48Zpqzy7EEvXQB/hPCaexJDrQbg9zY73hiWWT4WvBJMsbhqcbt0nOaxfJ
	H8dOIShMCETF23jydd6jgzxYqoCPRBlumzLmMNZFtP807hj8b62BPvk9ZODe203S3s9BGx
	3Sagne8aTUb4jCk5YfZjHyUYNIAALOuZDycCOTFdcv1C3noVlUuQW3qYbiO/HIZi3ZItA+
	YmSfShWtSCGE5iXbNanfUwRBn5h4P4yOkA8En/Bf6F6LB/WClqyJ4ef4oP1U4Q==
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>,
        Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
        Hangbin Liu <hangbin.liu@linux.dev>,
        Justin Iurman <justin.iurman@gmail.com>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>,
        Ahmed Abdelsalam <ahabdels@cisco.com>,
        Stefano Salsano <stefano.salsano@uniroma2.it>,
        Andrea Mayer <andrea.mayer@uniroma2.it>
Subject: [PATCH net-next 1/5] seg6: handle a Fragment or AH header before the SRH consistently in PSP
Date: Sun, 11 Oct 2026 21:23:06 +0200
Message-Id: <20261011192310.55-2-andrea.mayer@uniroma2.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261011192310.55-1-andrea.mayer@uniroma2.it>
References: <20261011192310.55-1-andrea.mayer@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.100.0 at smtp-2015
X-Virus-Status: Clean

seg6_pop_srh() already fails when a Fragment or AH header comes before
the SRH with other headers in between, and the packet is dropped ("we
expect SRH before FRAG and AUTH" in the code). But when the SRH directly
follows the Fragment or AH header, it is removed:

  (a) IPv6 | FRAG/AH | DOPT | SRH | ...   the packet is dropped
  (b) IPv6 | FRAG/AH | SRH | ...          the SRH is removed

In both packets the Fragment or AH header comes before the SRH.

Align the two cases: check first whether a header is a Fragment or AH
header, and only then look at its Next Header field. In this way, the
packet is dropped also when the Fragment or AH header comes directly
before the SRH. A Fragment or AH header before the SRH, with or without
other headers in between, does not follow RFC 8200 and RFC 4302: a
Fragment header must not come before the Routing header, as the
Per-Fragment headers must include the Routing header [1], and AH should
not come before the routing and fragmentation headers [2].

At the penultimate segment, End with the PSP flavor alone today drops
(a) and forwards (b) with the SRH removed. Packets with the Fragment or
AH header after the SRH are not affected: seg6_pop_srh() does not look
at the headers after the SRH.

Found by manual code inspection and reproduced in a VM without kernel
changes or error injection, by sending to End with PSP the packets
shown in the diagram, both with a Fragment header and with AH. With this
change, the packets are dropped in both cases, all tests in
srv6_end_flavors_test.sh pass, and KASAN reports no error. With the
whole series, all the srv6_*.sh selftests pass.

[1] - https://datatracker.ietf.org/doc/html/rfc8200#section-4.5
[2] - https://datatracker.ietf.org/doc/html/rfc4302#section-3.1.1

Fixes: bdf3c0b9c10b ("seg6: add PSP flavor support for SRv6 End behavior")
Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
---
 net/ipv6/seg6_local.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index 0c3d1be7f129..da8225591fe3 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -796,11 +796,6 @@ static bool seg6_pop_srh(struct sk_buff *skb, int srhoff)
 			if (unlikely(!hp))
 				return false;
 
-			if (hp->nexthdr == NEXTHDR_ROUTING) {
-				hp->nexthdr = srh_nexthdr;
-				break;
-			}
-
 			switch (nexthdr) {
 			case NEXTHDR_FRAGMENT:
 				fallthrough;
@@ -812,6 +807,11 @@ static bool seg6_pop_srh(struct sk_buff *skb, int srhoff)
 				break;
 			}
 
+			if (hp->nexthdr == NEXTHDR_ROUTING) {
+				hp->nexthdr = srh_nexthdr;
+				break;
+			}
+
 			nexthdr = hp->nexthdr;
 		}
 	}
-- 
2.43.0

