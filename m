Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E3033374F;
	Sun, 11 Oct 2026 19:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746666; cv=none; b=loPLUdS2YtpK/wNidkLQGzXw4m24Yiqaf4OdAmVkdzqiVFv2nqjv9/lK7P8FjZdqUQW39XxX5JKIxHLU6RZHQ1lo1Ei6dDe0xbsdP7/q4gAVXeIzlHAGuh03oc626qdgIAzd7bQM5lpJ0xT65sOxhyA7NKdnIYbmoXWyKiPGyMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746666; c=relaxed/simple;
	bh=8ISJw40tR5HuAgc3yBUuBc4utvG1IZs+tRcA6nnbCHA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FlO9f2H3r/rSy/AQIr9fK7v2h+jBvrSGww1OW6pqPfT7mk1p96xaM7sFQtZSEGKuN0F81klkzv/wE9iNYAjn3ff/SfK8QkBS5tOGbIME2VWDhWER0ghMSOnpFi+ozSyXoAODGTlUWguGBYsuwwbqkQvLmvmu64Y4vIBLul1dJgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=xQwyhy/q; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=oYo/ZChi; arc=none smtp.client-ip=160.80.4.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="xQwyhy/q";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="oYo/ZChi"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth-2019-1.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 69BJNbrK010947;
	Sun, 11 Oct 2026 21:23:42 +0200
Received: from localhost.localdomain (unknown [160.80.105.87])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id BF2A112291D;
	Sun, 11 Oct 2026 21:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1791746612; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JKTEjUFSBPN41nZHavsL0A4ycsY8+w+B4urZbWzgb7w=;
	b=xQwyhy/qoaXIKPJUEsorvc8OsncjTZnR5S04PY2YJYq2P1JgcenZS22GNZ5cnz5Pdlq223
	jMwJoXdwjDv1/jDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1791746612; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JKTEjUFSBPN41nZHavsL0A4ycsY8+w+B4urZbWzgb7w=;
	b=oYo/ZChi0rU34MJf/4hrRDIscD/9Ex0+58gmy7mK77dXOCWKIS5yrKNwLh28JcwsZlZPUz
	Nc3qhOXlr9+MrP7/M/o+jJD20AMvj1vTkB+PeIib24qUY0HyWXyD63l27ub8H5e9WEI5jU
	FsGKA1/CWNx60kVTilXkCCjrrwsW7EJlpkAlQTlPTXxUa5P7bgloMAPvYymSsO8DBww0Lh
	vpNLUkYw5uU63s6fNMxrNrQnrT7phSnC7cMikKyS3j1SbZKEFLRZwllur2R48UA2vT9YYm
	IrA+7PgrQqiHZiQxgc2QVu20r7Zct0Su1fgvo0XQmimNkA+xNzXvHwe6BrUasQ==
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
Subject: [PATCH net-next 2/5] seg6: handle a consumed SRH in SRv6 End with the PSP flavor
Date: Sun, 11 Oct 2026 21:23:07 +0200
Message-Id: <20261011192310.55-3-andrea.mayer@uniroma2.it>
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

