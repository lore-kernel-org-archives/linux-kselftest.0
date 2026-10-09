Received: from mta0.migadu.com (out-162.mta0.migadu.com [91.218.175.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288E84968FC
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 09:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539942; cv=none; b=DqmvOcT8HA8fetV3r+u+X3po2b83uPAGpHkIAi8Bz3K/7BADweTUscHPApysSmOLEOOg6uQx3tcQ8caS1c2MSs/jm07bbdUr4AbcUAjE/1+h0kqddKSfI3dB296tLfpKewtpvI6/Y3AIwCFv1k9w5ZFXHURi/CDyuiCKWihvWNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539942; c=relaxed/simple;
	bh=Y1uVmzV2bz3CYLlsqzMYFKGNCe5FlbP0nIN2N71tN0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I19Wu+7mQtaxF5oqd7FtkQREVROjPVb8qQ0xnO1K8p0SSOKMXyOP1ENwL9fva0Xd8NOzTbABB4gEoG3BX9GNf6ZtRcdss+a+wXZu299ej0kjrlE6AbMFd6P/si8akdzFonM3bA8EzNKuGq1wjANmD9YHFgc79MC3LdJiSD9kbl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=W85xBscr; arc=none smtp.client-ip=91.218.175.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="W85xBscr"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Y1uVmzV2bz3CYLlsqzMYFKGNCe5FlbP0nIN2N71tN0c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791539938; v=1; x=1792144738;
 b=W85xBscrD2OcZCBnBksT08TfuGb7PR0TKH9wtj/BYtyrnBHYRrFOyhk2KWPwW5T+mcF0ms4c
 fPHLR9S4isrNRlsgej9gf860QOy/5PJBjmaZPNHJUuLmVhq74XeBEuyRocAcAlekxDisdQJbkIi
 N+dS1HG1cm1+BiQNNKl88KQk=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id e08e76e40cb58c40;
	Fri, 09 Oct 2026 09:58:58 +0000
X-Mizu-Trace-ID: e08e76e40cb58c40
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Fri, 09 Oct 2026 17:58:37 +0800
Subject: [PATCH net-next v2 1/5] seg6: split final End process out of
 flavor processing
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-srv6_flavors_endx-v2-1-56ac7f838f41@kylinos.cn>
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
 net/ipv6/seg6_local.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index 0c3d1be7f129..4fcfcd48cfae 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -825,6 +825,9 @@ static bool seg6_pop_srh(struct sk_buff *skb, int srhoff)
 
 /* process the packet on the basis of the RFC8986 flavors set for the given
  * SRv6 End behavior instance.
+ *
+ * Returns with skb freed on failure. On success, the caller must complete
+ * final processing and forward the packet.
  */
 static int end_flv8986_core(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 {
@@ -882,7 +885,7 @@ static int end_flv8986_core(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 		goto drop;
 	}
 
-	return input_action_end_finish(skb, slwt);
+	return 0;
 
 drop:
 	kfree_skb_reason(skb, reason);
@@ -894,6 +897,7 @@ static int input_action_end(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 {
 	const struct seg6_flavors_info *finfo = &slwt->flv_info;
 	__u32 fops = finfo->flv_ops;
+	int ret;
 
 	if (!fops)
 		return input_action_end_core(skb, slwt);
@@ -907,7 +911,11 @@ static int input_action_end(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 	 * information extracted from the packet, e.g. presence/absence of SRH,
 	 * Segment Left = 0, etc.
 	 */
-	return end_flv8986_core(skb, slwt);
+	ret = end_flv8986_core(skb, slwt);
+	if (ret)
+		return ret;
+
+	return input_action_end_finish(skb, slwt);
 }
 
 /* regular endpoint, and forward to specified nexthop */

-- 
2.55.0

