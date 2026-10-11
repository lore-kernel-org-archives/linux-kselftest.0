Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C002F3403E8;
	Sun, 11 Oct 2026 19:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746667; cv=none; b=R4RlzvCfa++7vzdd039STsvUlPUZtfzsTlovBQ12GgRjdi5Dnu0gtQYmSoccb17S9ZwCabBSqLRQabyYCVl7ty+/0EChGDEV7cYVOqVMEVFkGG0lHPbUpYNm/RMzu7fyPzVmuybqqvL6zNL7hqqoqE3HRNH/FLyakTWL0QLg2q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746667; c=relaxed/simple;
	bh=wVvs34JXYAOct3wsRjx11NKKpF08OFkBXGvyFNoM6bs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pCPFMnKhzjxEIJxg/E/WjiOfNWn9/bBIwv0y2I+8lPOI4VPgeEdKqwqFdx7qu0hQuF1YRxwjU0R8eSPo1Y3evBB+5zCrCmFCeUIQ7Y2RL6603ZLyrhe9VcHWNRzBxMMz0MoPzYp2JL9xLOY1oNa/nfuXLI+LXKvzsctRn2YVUeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=q41pPjgx; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=Qv7d/UXj; arc=none smtp.client-ip=160.80.4.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="q41pPjgx";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="Qv7d/UXj"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth-2019-1.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 69BJNbOw010948;
	Sun, 11 Oct 2026 21:23:42 +0200
Received: from localhost.localdomain (unknown [160.80.105.87])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id D314C12294F;
	Sun, 11 Oct 2026 21:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1791746612; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gOIZzI8MoZpC+ul484Q1c2neV7O0L3gKo49Mhwr/msk=;
	b=q41pPjgxop9hYMTS4p34WkJThxQmMQOtWCx+zSvVG7c/V4/LmCGc0xX9afiXfdfbF24VdS
	DZtrBkWoeJxrllDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1791746612; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gOIZzI8MoZpC+ul484Q1c2neV7O0L3gKo49Mhwr/msk=;
	b=Qv7d/UXjE4d5QFZOa/lGjIq1mxiEh2+JrEnA2ixkxUqxF+p2HGEU3RRZRm4PY+HprN8cYw
	76H/L65HC9ydNCt8Ss4i2m0bTfxj5HDcxXSNKZ5RMezbFKPcTbd31eksw4xecYl2p5UGL6
	HqfCV55WvQjTeiZHrKwoQ95CVASKo6R3Wnu9q/So18tj5Hr23ZWc1dIfrdEjvtlxMoqdBM
	7fYzzSMc7dw04ysnM0UTAVSrdffckzQ0fLLs0+l9zyLjPSlehkcjvV67Yhuiy5KoJYdzKY
	Aa5GQJiu9iH8rM8nE3OGMCs6UP3o1pQA4IC0HUsU/MWI6sjIP0e10HyVSzUKzg==
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
Subject: [PATCH net-next 3/5] seg6: apply the PSP flavor together with NEXT-C-SID in SRv6 End
Date: Sun, 11 Oct 2026 21:23:08 +0200
Message-Id: <20261011192310.55-4-andrea.mayer@uniroma2.it>
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

Since commit bdf3c0b9c10b ("seg6: add PSP flavor support for SRv6 End
behavior"), an SRv6 End route can be set up with both the NEXT-C-SID and
the PSP flavors, e.g.:

  ip -6 route add fcbb:0:100::/48 encap seg6local action End \
          flavors next-csid,psp lblen 32 nflen 16 dev dum0

In RFC 9800, the NEXT-C-SID flavor (NEXT-CSID in the RFC) changes the
End processing only when the Argument is not zero [1]. With a zero
Argument (i.e. when the IPv6 DA carries no further C-SID), End is
processed as in RFC 8986, and the PSP flavor (when set) applies
unchanged [2]. If the packet arrives with Segments Left 1, PSP must
then remove the SRH.

However, on a route with both the NEXT-C-SID and PSP flavors,
input_action_end() always uses the NEXT-C-SID processing. The
NEXT-C-SID processing handles a packet with a zero Argument as End
without flavors, ignoring PSP. Therefore, if this packet arrives with
Segments Left 1, the SRH is not removed.

Fix this by using the NEXT-C-SID processing only when the Argument is
not zero or the route has no RFC 8986 flavor. Otherwise, the packet is
processed as End with its RFC 8986 flavors, in end_flv8986_core(). With
a zero Argument and Segments Left 1, PSP now removes the SRH before the
packet is forwarded. If seg6_pop_srh() cannot remove the SRH, the packet
is dropped, as on a route with the PSP flavor alone.

Found by manual code inspection and reproduced in a VM without kernel
changes or error injection. A following commit adds tests for this case
to srv6_end_flavors_test.sh. The tests reproduce the issue: they fail
without this change and pass with it.

[1] - https://datatracker.ietf.org/doc/html/rfc9800#section-4.1.1
[2] - https://datatracker.ietf.org/doc/html/rfc9800#section-4.1.7

Fixes: bdf3c0b9c10b ("seg6: add PSP flavor support for SRv6 End behavior")
Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
---
 net/ipv6/seg6_local.c | 50 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index 26cd4facbe36..427d12fedfc3 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -551,6 +551,47 @@ static bool seg6_next_csid_enabled(__u32 fops)
 	return fops & SEG6_F_LOCAL_FLV_NEXT_CSID;
 }
 
+static bool seg6_flv8986_enabled(__u32 fops)
+{
+	return fops & SEG6_LOCAL_FLV8986_SUPP_OPS;
+}
+
+/* check whether the NEXT-C-SID processing has to be used for the packet,
+ * instead of the RFC8986 flavors set for the given SRv6 End* behavior
+ * instance.
+ *
+ * This function returns:
+ *  - true, when the packet has to go through the NEXT-C-SID processing;
+ *  - false, when NEXT-C-SID is not configured or the packet has to be
+ *    processed on the basis of the RFC8986 flavors.
+ */
+static bool seg6_use_next_csid(struct sk_buff *skb,
+			       const struct seg6_flavors_info *finfo)
+{
+	const struct in6_addr *addr;
+	__u32 fops = finfo->flv_ops;
+
+	if (!seg6_next_csid_enabled(fops))
+		return false;
+
+	addr = &ipv6_hdr(skb)->daddr;
+
+	/* NEXT-C-SID and the RFC8986 flavors combine according to the
+	 * DA.Argument (see RFC9800, sections 4.1.1 and 4.1.7):
+	 *
+	 *       DA.Argument   RFC8986 flavors   processing
+	 *   (1) != 0          any               NEXT-C-SID only, SL unchanged
+	 *   (2) == 0          none              the behavior, e.g. End
+	 *   (3) == 0          one or more       the behavior with its flavors,
+	 *                                       e.g. End with PSP
+	 *
+	 * In (2), the packet still goes through the NEXT-C-SID processing,
+	 * which runs the behavior (e.g. End) when the DA.Argument is zero.
+	 */
+	return !seg6_flv8986_enabled(fops) ||
+	       !seg6_next_csid_is_arg_zero(addr, finfo);
+}
+
 /* Processing of SRv6 End, End.X, and End.T behaviors can be extended through
  * the flavors framework. These behaviors must report the subset of (flavor)
  * operations they currently implement. In this way, if a user specifies a
@@ -865,7 +906,10 @@ static int end_flv8986_core(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 	if (srh && !seg6_hmac_validate_skb(skb, srh))
 		goto drop;
 #endif
-	flvmask = finfo->flv_ops;
+	/* NEXT-C-SID, when configured, has already been evaluated by the
+	 * caller. Only the RFC8986 flavors are left here.
+	 */
+	flvmask = finfo->flv_ops & ~SEG6_F_LOCAL_FLV_NEXT_CSID;
 	if (unlikely(flvmask & ~SEG6_LOCAL_FLV8986_SUPP_OPS)) {
 		pr_warn_once("seg6local: invalid RFC8986 flavors\n");
 		goto drop;
@@ -919,8 +963,8 @@ static int input_action_end(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 	if (!fops)
 		return input_action_end_core(skb, slwt);
 
-	/* check for the presence of NEXT-C-SID since it applies first */
-	if (seg6_next_csid_enabled(fops))
+	/* NEXT-C-SID is evaluated first, when configured */
+	if (seg6_use_next_csid(skb, finfo))
 		return end_next_csid_core(skb, slwt);
 
 	/* the specific processing function to be performed on the packet
-- 
2.43.0

