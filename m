Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.80.4.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793844002;
	b=PCF688leVl9uBJbuUdPOOd+ZlYyRkhhN1uGsOckkHJKGY5b8DGQO1QTAKLbAamrC7i1l
	 k8Ten+Jp+977MH8wcaCu/Awuk0p8qeriA3Xi3Zo3PZmHLGXC6iBhWVXuAHZ0P17i0bNJL
	 o10OdTda4b1eJvaygYnc41aDNIrxYEYYhSTtn2R6Me/BQOhgk02cB5sVpxmUxY01DQCYA
	 VvzqH2wLYzu5be87JtdIwXN/x64QvH60l0Hk2OaotowedpauMHPYOCnkZ136YUUrKPFgz
	 r26M9zzv8nNHJeTorUwAvLj0J9uOBx8vbrmqWoAB9hZLL4IdlszQ6edAq5CjKxkKm/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793844002;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Virus-Scanned:
	 X-Virus-Status;
	bh=ImAMCNfgrZHhGnvZrY4VhJufPGL6dv60m/vPtmdLXwM=;
	b=kG6csf0nFrSN4Vb5YdfWWrCRQ51A2O0xbH2iXX3lzYLCgnE65vXx6/3uAq9okRdy4m+i
	 U4gTsKFRdgfCXV/yn1OOHE4P1Baj4GVNcHlx6xFilIpbkRw6uvjIpgresBkgpAIX+N6B1
	 a4nBWAjPxkQ8r4b2Ud6onLr/l48QbV1jE5ZzCvr4oqBCPZOxBG1B/iZLrN0o7xV2rHYD6
	 hJ+oI2/mA8XIgmFu/v8lKm4IGL8dwf71LBsloO+YI1NhplDFuGTUuKldec+sYSH3k50WA
	 Cq6D4X6H/9jCW9a3oaLAphLlbHnIEHo5e3/FSX2Zl562hjsDG2KwnSn/QOrRUp6QTww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniroma2.it;
	spf=pass smtp.mailfrom=uniroma2.it;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=tds4UUfj;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=a+awCnuz;
	arc=none smtp.remote-ip=160.80.4.35
Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.35])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B88606D824;
	Thu,  5 Nov 2026 02:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29B88606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=tds4UUfj;
	dkim=pass (2048-bit key, unprotected) header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=a+awCnuz
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 6A51xCAn001496;
	Thu, 5 Nov 2026 02:59:17 +0100
Received: from localhost.localdomain (unknown [160.80.105.87])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id C94871228D3;
	Thu,  5 Nov 2026 02:59:07 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1793843947; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ImAMCNfgrZHhGnvZrY4VhJufPGL6dv60m/vPtmdLXwM=;
	b=tds4UUfj+wxvXhVWr+LUfKaO73mhLdIYrvbq50crqojK0ILr35sOKfUMwuoE1D93OFf2x5
	Ppvh9wK8A+tzGZBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1793843947; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ImAMCNfgrZHhGnvZrY4VhJufPGL6dv60m/vPtmdLXwM=;
	b=a+awCnuzUg5m36Ynwcn1qef6suk/Jd/6XWVnqJn4DS65/YiSM6e3/NDpXnTsAuIB9iWd5O
	QrDo7Zc1nZlLRKykBdYfsipTcRhjTTwWlHDrnajjSyhl6969sSZXhi/Opy+6SVkoTIooun
	OEsP+tLezGN6W2LC6Sok+yXJydLeo6qXNAi1KCRn5oIFo+7uAvJ85Yc2tBieGfNr98HgnK
	7iowRBVWKCD1FkaPTeMN2JBTwogxT9r7FMQDeCfzkIYVXyB3fq6KrW50X6uyizJm4XuhES
	2lyg0p1qUxcEUaShL1Cc3U9uTjAHeFo6QNtdlie4ItnCpiIFLU4zQLyo9tnfGQ==
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
        Andrea Mayer <andrea.mayer@uniroma2.it>, andrea@common-net.org,
        Hangbin Liu <liuhangbin@kylinos.cn>
Subject: [PATCH net-next v2 1/5] seg6: handle a Fragment or AH header before the SRH consistently in PSP
Date: Thu,  5 Nov 2026 02:57:11 +0100
Message-Id: <20261105015715.57-2-andrea.mayer@uniroma2.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261105015715.57-1-andrea.mayer@uniroma2.it>
References: <20261105015715.57-1-andrea.mayer@uniroma2.it>
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
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
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

