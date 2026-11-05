Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.80.4.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793844003;
	b=vPWF9ljLxZH1v+56w/4BNec6h6aPSW+Y9raVXQjr2akMLa9fVtxVWyvLxqGCvWbIDsZt
	 FqAB0REbgz6JGqjVVTJws8WvTUo9OQOyzbe3vHrtUOEdzbumblo9BLzFIG0XeHX3KGlkS
	 fo3tn3Su7TVj+DcZIxJcA4X/X1ovtCrfNtHk3STw08PmVvceV6eq/DA15txgkh1N/nImk
	 eGXeimGQ0qrmx9QBHC+Q+7Rt2xA2z+Hbkp2dmZIG8kCORmALIe5rTjYhRP6auKb51NVTl
	 CTezbVuJBPr+gHIdznL1KKlHAhEVn4PL9gWKlsAzT24VT06P41br9J98XrqXiyoQDxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793844003;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Virus-Scanned:
	 X-Virus-Status;
	bh=DmQXE3CaAVl0Zz6o4LK0xCYillIz77fI97ndvt560Sg=;
	b=brnlEg9apV4SC8qlkbSKBPzqyV2AwiwV31hYeR/iFoHw3c/BJp5PKFru/hypZaFRa6Zs
	 2bxAw5qOnl5PW7yKmaq+GQdKYLa7qOqBH+Al9HMVTYYjKyYvyAT5FubVKV0xouC8z9JWb
	 HxapnRfLrV3SNMcv+MI9uGbVCUi0is0gHJ9K8yethTlUK9GDnZ1UH1b9x5+Zq+k9hUWqd
	 b9lZWM5Q1NjPerviwcxSzaEh4LtGx167LKBeg63SgsMnTBCUcpALR/jWxyTkD+bfziHg1
	 xPwwDbzElBKZI5kjudoJnt0mqKdQK6DUiXQyVdtJPPLv2biViH+kDt2SSHID4YJi+/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniroma2.it;
	spf=pass smtp.mailfrom=uniroma2.it;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=voiLsuYs;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=IB+17Crj;
	arc=none smtp.remote-ip=160.80.4.35
Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.35])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFDC606D82B;
	Thu,  5 Nov 2026 02:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EFDC606D82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=voiLsuYs;
	dkim=pass (2048-bit key, unprotected) header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=IB+17Crj
Received: from smtpauth-2019-1.uniroma2.it (smtpauth-2019-1.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 6A51xCDK001497;
	Thu, 5 Nov 2026 02:59:17 +0100
Received: from localhost.localdomain (unknown [160.80.105.87])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id DE621122926;
	Thu,  5 Nov 2026 02:59:07 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1793843947; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DmQXE3CaAVl0Zz6o4LK0xCYillIz77fI97ndvt560Sg=;
	b=voiLsuYshGeijyireJryolwAubAGQ10sSwmMGmU7dB79SnlN0eB5GqR+tal9pYEU/YNQMR
	zj58J3hI3z4/r4CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1793843947; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DmQXE3CaAVl0Zz6o4LK0xCYillIz77fI97ndvt560Sg=;
	b=IB+17Crjh5ZQc3meNHUcXGnQAZsuIMWdhhMFL+DwjMCHa6JuTLdP2DOPHpzAKmVZ4/OTrl
	UuNwUqXPeasCcQfdgQ0kEHu0l043j47+X27vv1yLBF7mhonsbBRQjQEf3C7F6i6VBXTPh5
	v3oScZm+h7MEaPKZjNHA9OEa6tvlXml9jFXMn72RbCcnFGyfAdsFZW8TMVaLaZgRAiPdXO
	3dCLHwzuikwIRwlSgbUKF+9z6kdx4RnCTSjuvn6zcBfLie6TvEI7MEsJgCl2Ilz3hoQstA
	DqoRkI8wMKBOfHz8uckF+bm1SzlNDcLJG6smJtxORIfTs34C0kCGkqTvKwb0+A==
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
Subject: [PATCH net-next v2 2/5] seg6: handle a consumed SRH in SRv6 End with the PSP flavor
Date: Thu,  5 Nov 2026 02:57:12 +0100
Message-Id: <20261105015715.57-3-andrea.mayer@uniroma2.it>
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

With the seg6 inline mode, a packet can carry more than one SRH. The
SRHs with Segments Left 0 are considered consumed SRHs, and they can
come before the SRH to process (Segments Left > 0), as in this packet:

  +------+----------------------+----------------------+---------+
  | IPv6 | SRH, Segments Left 0 | SRH, Segments Left 1 | payload |
  +------+----------------------+----------------------+---------+

End without flavors skips the consumed SRH and processes the next
one [1]. With the PSP flavor, End should do the same. When the SRH to
process arrives with Segments Left 1, as in the diagram, End with PSP
should then also remove it [2]. However, End with PSP alone currently
looks only at the first routing header of the packet, finds Segments
Left 0 there, and drops the packet.

Make End with PSP alone skip the consumed SRHs, and any other routing
header with Segments Left 0, and process the SRH that follows them. If
there is no SRH to process, the packet is dropped as before. When the
SRH to process arrives with Segments Left 1, End with PSP now removes
it even if consumed SRHs come before it.

Found by manual code inspection and reproduced in a VM without kernel
changes or error injection. A following commit adds tests for this case
to srv6_end_flavors_test.sh. Without this change, the new tests with a
consumed SRH fail for End with PSP alone. With this series, all tests
pass and KASAN reports no error.

[1] - https://datatracker.ietf.org/doc/html/rfc8986#section-4.1
[2] - https://datatracker.ietf.org/doc/html/rfc8986#section-4.16.1.2

Fixes: bdf3c0b9c10b ("seg6: add PSP flavor support for SRv6 End behavior")
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
---
 net/ipv6/seg6_local.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index da8225591fe3..26cd4facbe36 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -775,11 +775,14 @@ static bool seg6_pop_srh(struct sk_buff *skb, int srhoff)
 		skb_set_transport_header(skb, thoff);
 
 	iph = ipv6_hdr(skb);
-	if (iph->nexthdr == NEXTHDR_ROUTING) {
+	if (srhoff == sizeof(*iph)) {
 		iph->nexthdr = srh_nexthdr;
 	} else {
 		/* we must look for the extension header (EXTH, for short) that
-		 * immediately precedes the SRH we have just removed.
+		 * immediately precedes the SRH we have just removed, i.e. the
+		 * EXTH that ends at srhoff. We find it by its position and not
+		 * by its nexthdr, since another routing header (e.g. an SRH
+		 * with SL = 0) may come before the removed SRH.
 		 * Then, we update the value of the EXTH nexthdr with the one
 		 * contained in the SRH nexthdr.
 		 */
@@ -807,7 +810,7 @@ static bool seg6_pop_srh(struct sk_buff *skb, int srhoff)
 				break;
 			}
 
-			if (hp->nexthdr == NEXTHDR_ROUTING) {
+			if (off == srhoff) {
 				hp->nexthdr = srh_nexthdr;
 				break;
 			}
@@ -823,6 +826,24 @@ static bool seg6_pop_srh(struct sk_buff *skb, int srhoff)
 	return true;
 }
 
+/* look up the SRH to be processed by the RFC8986 flavors. As End does, a
+ * routing header with SL = 0 is skipped (e.g. an SRH already consumed).
+ * This function returns NULL when no valid SRH is found.
+ */
+static struct ipv6_sr_hdr *seg6_flv8986_get_srh(struct sk_buff *skb)
+{
+	struct ipv6_sr_hdr *srh;
+
+	srh = seg6_get_srh(skb, IP6_FH_F_SKIP_RH);
+	if (srh)
+		return srh;
+
+	/* we take the first routing header without skipping it. In this way,
+	 * seg6_get_srh_pktinfo() reports SL = 0 and not a missing SRH.
+	 */
+	return seg6_get_srh(skb, 0);
+}
+
 /* process the packet on the basis of the RFC8986 flavors set for the given
  * SRv6 End behavior instance.
  */
@@ -837,7 +858,7 @@ static int end_flv8986_core(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 	__u32 flvmask;
 	int srhoff;
 
-	srh = seg6_get_srh(skb, 0);
+	srh = seg6_flv8986_get_srh(skb);
 	srhoff = srh ? ((unsigned char *)srh - skb->data) : 0;
 	pinfo = seg6_get_srh_pktinfo(srh);
 #ifdef CONFIG_IPV6_SEG6_HMAC
-- 
2.43.0

