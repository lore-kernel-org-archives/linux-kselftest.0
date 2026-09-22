Received: from mta1.migadu.com (out-99.mta1.migadu.com [95.215.58.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADE943DEA0
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 08:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067302; cv=none; b=YGyh3W7dWNX6lTOCXLSPVjLzlmGd8dhxQvWHmX1K9AEGCDSKT5hFNTBRxYZeOkWBuusPUhWF4oqLn3g9RKOKUpCk0RVTElA6WaQrNeVR1sotWlygLNWfjm9ImBrtsdtLOKDPBjlAYU28Tl6PlCFFIjcXRm8EGVtI+BfvhUobfQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067302; c=relaxed/simple;
	bh=988pi3oTdtsnoS5j0ActZjzPjSaiob3jbZgYYhq8UUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I/Y0KVDusHeVXmJiw3iCwgXbX+uQW0GI7IfuQSMECkH7MPwWrjxs9R49o5HN1UFJHAS5wZqDgo6mCFwwhK4Y4sF2hCCgIqH2bz2t5YLNyqBIMh4+88k6k8UQkQOXyR05TzedEst6R2KR0EUnLDeBGLXMTwj+BPo/XAEUCZeUqT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jjWOtt7W; arc=none smtp.client-ip=95.215.58.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jjWOtt7W"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=988pi3oTdtsnoS5j0ActZjzPjSaiob3jbZgYYhq8UUM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790067298; v=1; x=1790672098;
 b=jjWOtt7Wwdw+7deOVWe+RlTVKbG2ojFs0jRO4hUj4FwYNbp1rijsngDUmTPOVUyiqdzZB9dq
 J++McUz8Pd2MjTFvJFVh/GlaD6rYK0aGiR4HPGDmRzMzOu4jX384ORR+R1aKgAzHeEYkoY6S2lg
 M8VxuachIl5ZyWQuVcP06js4=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7a67b773cacf3de3;
	Tue, 22 Sep 2026 08:54:58 +0000
X-Mizu-Trace-ID: 7a67b773cacf3de3
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Tue, 22 Sep 2026 16:54:43 +0800
Subject: [PATCH net-next 1/5] seg6: split final End process out of flavor
 processing
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-srv6_flavors_endx-v1-1-4d01c05c47b7@kylinos.cn>
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

Move the final End forwarding step out of end_flv8986_core() and return
success to the caller instead.

Currently end_flv8986_core() performs both RFC8986 flavor processing and
final End forwarding by calling input_action_end_finish(). That couples
flavor handling with the End-specific forwarding path, which makes it
hard to reuse the same flavor logic for other End variants.

Split the two steps so input_action_end() does:
  1) end_flv8986_core() for flavor processing
  2) input_action_end_finish() for final forwarding

This keeps end_flv8986_core() focused on RFC8986/PSP flavor semantics
and makes it easier to plug the same flavor core into End.X/T later.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 net/ipv6/seg6_local.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index d1070aec7b72..584e6aca3893 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -804,7 +804,7 @@ static int end_flv8986_core(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 		goto drop;
 	}
 
-	return input_action_end_finish(skb, slwt);
+	return 0;
 
 drop:
 	kfree_skb(skb);
@@ -816,6 +816,7 @@ static int input_action_end(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 {
 	const struct seg6_flavors_info *finfo = &slwt->flv_info;
 	__u32 fops = finfo->flv_ops;
+	int ret;
 
 	if (!fops)
 		return input_action_end_core(skb, slwt);
@@ -829,7 +830,10 @@ static int input_action_end(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 	 * information extracted from the packet, e.g. presence/absence of SRH,
 	 * Segment Left = 0, etc.
 	 */
-	return end_flv8986_core(skb, slwt);
+	ret = end_flv8986_core(skb, slwt);
+	if (ret)
+		return ret;
+	return input_action_end_finish(skb, slwt);
 }
 
 /* regular endpoint, and forward to specified nexthop */

-- 
2.55.0

