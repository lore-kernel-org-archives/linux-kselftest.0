Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.80.4.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843999;
	b=XEqscHAcRDNvQOf6m8nBSLW7qnDCpAi8SyX/cE/XrHRIEqwCci1vIX05CV9PJzT1Wqhn
	 HWJUgVdIGamJ3R2Ni4yST2XKZi5lknf4dC1/llonHVBRi5ITU9qI8iUR3RNovXjhoqcKS
	 KZAHX6VavAtR7+75MHsRdNsLeiLJ3fvYN71Zr/XG6y0QGj7wH4lEDqso7i1GR1L7eAjU4
	 sYjp7gTB8HCXMz/B6CqjDH6GtV9i3yG5OappdhKvcNDon76ig/cNtyBJe0tGf+ZwTQTjB
	 JgmNoITiOfc/q+UcJHmTfSq3LEqJu6Bge08R2Vqvymz3nAc7wHdP/LWZWzdvPfYTXCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843999;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Virus-Scanned:
	 X-Virus-Status;
	bh=0uFUiNBADWLsVyespJGX9TFCNxcnQ1X32FvqWfAy6qA=;
	b=gHf3kyWY9jDfJpZWa4p/OxsSd5HwAWdZxuNgZs5u4mc+lwZvD200YQ4rObCpoVhdqtef
	 VPXUFyEi6WwaPONQ+63DFF8XCY0cVoGxAy/Ze++Wua+R9lRoi4XzCK/ANFfZwBN6kbl1D
	 xk3qH30uVc6ybTMIIGMyuHM13v3h/4Z2Z9FAuvg472xvf4vJtHrGEbit3ZKGj2qkusETD
	 zrcyuFXF8jLRybOuFkNj6TYOoizVVO00IVouXmEA37RLBB1SwYYJcCvBXuEOCNaxWARqN
	 8aKjoEMBO7H2MD/qdBYvksBV1sQBWRRamn66vnwUAfyhJyEftnY7eAnnh0uPuf5pthQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniroma2.it;
	spf=pass smtp.mailfrom=uniroma2.it;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=D0NoUqyj;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=d9Mi9COX;
	arc=none smtp.remote-ip=160.80.4.35
Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.35])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8842F606A329;
	Thu,  5 Nov 2026 01:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8842F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=D0NoUqyj;
	dkim=pass (2048-bit key, unprotected) header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=d9Mi9COX
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 6A51xC7J001498;
	Thu, 5 Nov 2026 02:59:17 +0100
Received: from localhost.localdomain (unknown [160.80.105.87])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 0133812294E;
	Thu,  5 Nov 2026 02:59:08 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1793843948; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0uFUiNBADWLsVyespJGX9TFCNxcnQ1X32FvqWfAy6qA=;
	b=D0NoUqyjm5QCmVNYW+kHed2EXGo25ym2KcxtSiTGSfA3qhhjiMM0ahlfmPpNZoLg7niDjA
	lpy/R2fDkePuZUDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1793843948; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0uFUiNBADWLsVyespJGX9TFCNxcnQ1X32FvqWfAy6qA=;
	b=d9Mi9COX8dsnbov/p9nz8ZaP2FbUfn2yFtSZnVNUt/I5uMPtCDMBM5enL7UT2aAp6C0XXQ
	Zq6XWH6yj2qR4rYcQq3JLADj0W4gQA3SjGW1enmO1ypmsNDIxkK2AWjqLgQVAvQxaae7sO
	nC2foog+P2OACEsmFr7QHodfudFdDryCu3kpUqs0YrFKc7FP6DemiifO9tkdYMIIMrY6VP
	//TyK88wOytZCsmYhqZhtPhqr3bUuO1/d7VXIPUW/dsQgl9pLUKqXgkwYgX6oH848MR2Is
	UfQQVeVWaBU5LYAm2y88uErmQHUWKaRZylJ16DtjlMHitiaUl6W5aIlTxvCJ0g==
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
Subject: [PATCH net-next v2 3/5] seg6: apply the PSP flavor together with NEXT-C-SID in SRv6 End
Date: Thu,  5 Nov 2026 02:57:13 +0100
Message-Id: <20261105015715.57-4-andrea.mayer@uniroma2.it>
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
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
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

