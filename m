Received: from mta1.migadu.com (out-43.mta1.migadu.com [95.215.58.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052D34A2A57
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539951; cv=none; b=O1NkMHP343KGfTTHxhtpuJKelqyTg3s4JHv3o9rD3FC/aEX8HzQNo8L0YPww4F49iaxCRLkhh+qM/EP5hHJn5i2zFNHC4zvqL/QGSlAoJJ90Hhv3oZ3zfQxAZ3dcnn3fT9/ZFjroigxUFvBxGFWudcdwq0TWK8AQUbnIXELrors=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539951; c=relaxed/simple;
	bh=9uZAzjSEaXX7aLkriGIzSgNvzuAo+od4BKnoGGnFE6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LVISibl4H4s0SWjy0nGxszKBWVNmHPie4SbSND5oEPET6l+gpbfAkzwtY1iV1QQa0bWKoxJDlMPQuTn3M6iqUSpVRGduUGCUYHYJlNIVd2p4LUmWX+rk4YTx+V1GfMXyVuu4RZ/6k5r6b1hX+Qs6Ku7Yyyk47VOr3G2fIZk0kzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kyJXSYL1; arc=none smtp.client-ip=95.215.58.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kyJXSYL1"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9uZAzjSEaXX7aLkriGIzSgNvzuAo+od4BKnoGGnFE6M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791539946; v=1; x=1792144746;
 b=kyJXSYL1AVhifibQUUf3cXaecE/YbjD6QHN6PhUO86d5m27uA5bHPV2sPMuLpzZD6svCPbvO
 hIqYM4LIB9a2DHgfIRvB+4rCCKxbAFP/pixPXEVcoaDr2AVqkkyKB94wmPe8aLcw+nC688sIYem
 bx7X2gm9rSfvHWzLdukweOIQ=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 925135fb1594fcaa;
	Fri, 09 Oct 2026 09:59:06 +0000
X-Mizu-Trace-ID: 925135fb1594fcaa
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Fri, 09 Oct 2026 17:58:38 +0800
Subject: [PATCH net-next v2 2/5] seg6: add RFC8986 flavor support for End.X
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-srv6_flavors_endx-v2-2-56ac7f838f41@kylinos.cn>
References: <20261009-srv6_flavors_endx-v2-0-56ac7f838f41@kylinos.cn>
In-Reply-To: <20261009-srv6_flavors_endx-v2-0-56ac7f838f41@kylinos.cn>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Eric Dumazet <edumazet@kernel.org>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.14.3

From: Hangbin Liu <liuhangbin@kylinos.cn>

Previously End.X only supported NEXT-C-SID, with a plain fallback to
input_action_end_x_core(). Add PSP End.X processing by reusing
end_flv8986_core().

Add SEG6_LOCAL_FLV8986_SUPP_OPS to SEG6_LOCAL_END_X_FLV_SUPP_OPS so
End.X advertises PSP flavor support.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---

For Sashiko:

With the SEG6_LOCAL_END_X_FLV_SUPP_OPS mask widened, parse_nla_flavors()
now accept the combination next-csid plus psp for an End.X instance. And
the current code is unable to handle this combination. The End instance
also has this issue. Andrea is preparing a fix for this bug.
---
 net/ipv6/seg6_local.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index 4fcfcd48cfae..521a9b0c0929 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -121,7 +121,8 @@ struct bpf_lwt_prog {
 
 #define SEG6_LOCAL_END_FLV_SUPP_OPS	(SEG6_F_LOCAL_FLV_NEXT_CSID | \
 					 SEG6_LOCAL_FLV8986_SUPP_OPS)
-#define SEG6_LOCAL_END_X_FLV_SUPP_OPS	SEG6_F_LOCAL_FLV_NEXT_CSID
+#define SEG6_LOCAL_END_X_FLV_SUPP_OPS	(SEG6_F_LOCAL_FLV_NEXT_CSID | \
+					 SEG6_LOCAL_FLV8986_SUPP_OPS)
 
 struct seg6_flavors_info {
 	/* Flavor operations */
@@ -824,7 +825,7 @@ static bool seg6_pop_srh(struct sk_buff *skb, int srhoff)
 }
 
 /* process the packet on the basis of the RFC8986 flavors set for the given
- * SRv6 End behavior instance.
+ * SRv6 End, End.X behavior instance.
  *
  * Returns with skb freed on failure. On success, the caller must complete
  * final processing and forward the packet.
@@ -923,12 +924,20 @@ static int input_action_end_x(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 {
 	const struct seg6_flavors_info *finfo = &slwt->flv_info;
 	__u32 fops = finfo->flv_ops;
+	int ret;
+
+	if (!fops)
+		return input_action_end_x_core(skb, slwt);
 
 	/* check for the presence of NEXT-C-SID since it applies first */
 	if (seg6_next_csid_enabled(fops))
 		return end_x_next_csid_core(skb, slwt);
 
-	return input_action_end_x_core(skb, slwt);
+	ret = end_flv8986_core(skb, slwt);
+	if (ret)
+		return ret;
+
+	return input_action_end_x_finish(skb, slwt);
 }
 
 static int input_action_end_t(struct sk_buff *skb, struct seg6_local_lwt *slwt)

-- 
2.55.0

