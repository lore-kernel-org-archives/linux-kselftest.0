Received: from mta1.migadu.com (out-105.mta1.migadu.com [95.215.58.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A5452940D
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 08:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067307; cv=none; b=pRHewLf+JM3XcW/vjWCwRVebjW6LhriBYFYJcbdJDeHCAR3HtQVeR+RUF46/FfipnQWq2eYywvSYPvduxjt6+vs1lqnUqMS3hhIwwADLkVJq3Y0QqQIMwj8LmNwlBujcfArNTY/G0nltnBcDo6VsxgQhOvaI+oAzRWg+D/SRIwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067307; c=relaxed/simple;
	bh=RqklO2bnVUUdxOx30CGmegn1deBHfBqHXY4iYTWrDmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ty5dVydt9FNRnPo9KjFrnTicAkk2XwQUeVSBWkztk2Xd2QQbw6bxe/U1Ho6tsKs0aCa8g80+tNjjiC64tLi1Lf0NcBsbsfu0Cq4cgpRg7pQU7OTzvVdiJmKhdgJbWJ0noKG60XENF4+Ykc+TNUVTKL5O1S4146XHSQ//Ki0A4vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uEUFG+/k; arc=none smtp.client-ip=95.215.58.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uEUFG+/k"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RqklO2bnVUUdxOx30CGmegn1deBHfBqHXY4iYTWrDmU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790067303; v=1; x=1790672103;
 b=uEUFG+/kP1/UHZ0s4s0rhpizbRhSbSSrFOKTEL/xcvH/NvqU+aPH4XXmykC9rAKVe1s7xhTZ
 Q7R3a4YHfQMqVo0ySYpqZlONt7ASxTvGKnbW+n8CwDOxmznVue7gQedj4HNWm//0C06Wib6fHjD
 qvnDehdOwqAeveGPC4m6UF9M=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c341bbbc24247b6b;
	Tue, 22 Sep 2026 08:55:02 +0000
X-Mizu-Trace-ID: c341bbbc24247b6b
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Tue, 22 Sep 2026 16:54:44 +0800
Subject: [PATCH net-next 2/5] seg6: add RFC8986 flavor support for End.X
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-srv6_flavors_endx-v1-2-4d01c05c47b7@kylinos.cn>
References: <20260922-srv6_flavors_endx-v1-0-4d01c05c47b7@kylinos.cn>
In-Reply-To: <20260922-srv6_flavors_endx-v1-0-4d01c05c47b7@kylinos.cn>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
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
 net/ipv6/seg6_local.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index 584e6aca3893..7462da1da362 100644
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
@@ -841,12 +842,19 @@ static int input_action_end_x(struct sk_buff *skb, struct seg6_local_lwt *slwt)
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
+	return input_action_end_x_finish(skb, slwt);
 }
 
 static int input_action_end_t(struct sk_buff *skb, struct seg6_local_lwt *slwt)

-- 
2.55.0

