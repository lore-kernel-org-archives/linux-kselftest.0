Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798125;
	b=115DzVPNlvNOzVsN9AULsrm1WitbVTVEz4FisQ4cOUNC3AzKtkuh+L2ABwRYlTf60jM4
	 J9SqW3fPpjvGyeJsGOnMeHYhTaW8fcXy8WohjoniVAAuExFe3IzN4l9d40BW/jyjqDnNa
	 J5qzw7k7lO2Luvnps3c54MVan/x6qwZF7E5YwyE+uHkBmLM0caLebxtqZzY7+QUpDpP8K
	 TIyUhtdpQWxABjhOYDyudB1hGmWCZJEGKX4rvoFdM0yVaj7xBNXlzdgGejBujYPP6pSd5
	 pk3HHiOORp8PoumHpcbcXgmlmEaGS5nod8IdFRFCY7rytlsn0vS4Psu+q5KmTI+dpWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798125;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=R6M2QDm0shUYu+Aa9n3dgQxA+aZ0+wpdOiS/ZjGCe24=;
	b=ko2DjwBEFbOMGLkZKb98/m8ogB8QuUKy5SnEvwJD9uyYZl8CYO7ooathk0FzKZFBT2L9
	 nsGGk0Xj3N5fJLii41ijPUAWQoJTfm/v0R2NNCW+V58mQw7nUKP3pSRWCP08XJ5FFC6v+
	 +rfh/2cqU58bFb2w4wJzSnX/cgOKTlRKvikXiT/w1lTO0HTcPkrlL+NGn6Mc6et8yMNI+
	 f4aCQ9T+hLP3yal3k+PWTU6uWluXl7Vdk0qIN3BInLIJaMstjrkLU4kM8Qj4WzZrSgvnb
	 PawqzM86W7YEyBzg7roUgrj2jSmtR0Lj8Vq03BZklAOU/3WKiQFeUpg6diQZ9ZBpg3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=aCaGERtZ;
	arc=none smtp.remote-ip=195.10.208.61
Received: from mout-b-201.mailbox.org (mout-b-201.mailbox.org [195.10.208.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A151606A327;
	Fri, 27 Nov 2026 16:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A151606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=aCaGERtZ
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-201.mailbox.org (Postfix) with ESMTPS id 4jbfW74R7jzLlRn;
	Fri, 27 Nov 2026 17:48:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795798115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R6M2QDm0shUYu+Aa9n3dgQxA+aZ0+wpdOiS/ZjGCe24=;
	b=aCaGERtZHWwKOexRxXSeQA411NhVhQtDKBC8W6VZiMLAxUIuThKK0gOz+87Km/XeWNFIUU
	pGhKE5AFQt3ejoKRPSn3nd/u6ouUZZbZrrExXFzPGLvd/e3QtTgI3fc7iSVSFX8JwBvIW/
	5wBMH9eMeDATldY6sSAOq0NT22GT7B0Zx1BPpDU030aUwzucN0UkGPGG5csG5u5YR4Qgy3
	eOPjpZ5YFcPon7O0Lan9POhyXefk+31XAPaZACFojrmOub9SPW6UWF8IWJzstyXXkE0N5V
	z1Q4qouWKNZ8BHYf4exSRRzvUiCiaVjA3o1sYvJDXBBGWuQsSwF0+RN4MAn3OA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec v2 1/2] xfrm: advance the route generation when policies are removed
Date: Fri, 27 Nov 2026 17:48:20 +0100
Message-ID: <3c91d1fc49e074fea1e87a7fdb8d4157fc42b342.1795797791.git.ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795797791.git.ralf@mandelbit.com>
References: <cover.1795797791.git.ralf@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jbfW74R7jzLlRn

Only xfrm_policy_insert and xfrm_set_default advance the IPv4 and IPv6
route generations. Deleting, flushing or expiring a policy does not, so
a route that a socket cached while an allow policy without templates
matched its flow keeps validating after that policy is removed, and the
socket keeps sending in plaintext although a policy requiring IPsec now
matches. xfrm_policy_insert also advances the generation before
unlinking the policy that the new one replaces, which can still be
matched until then, since the new policy can be linked behind it.

Advance the generation once a policy is unlinked by a delete or by its
expiry, once after all policies are unlinked by a flush, and after the
replaced policy is unlinked by an insert. Socket policies only apply to
their own socket and are left out.

Fixes: ee8372dd1989 ("xfrm: invalidate dst on policy insertion/deletion")
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
---
 net/xfrm/xfrm_policy.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index d2e938d4db9a..47379da24e99 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -1569,6 +1569,14 @@ static struct xfrm_policy *xfrm_policy_insert_list(struct hlist_head *chain,
 	return delpol;
 }
 
+static void xfrm_policy_bump_rt_genid(struct net *net, unsigned short family)
+{
+	if (family == AF_INET)
+		rt_genid_bump_ipv4(net);
+	else
+		rt_genid_bump_ipv6(net);
+}
+
 int xfrm_policy_insert(int dir, struct xfrm_policy *policy, int excl)
 {
 	struct net *net = xp_net(policy);
@@ -1589,16 +1597,13 @@ int xfrm_policy_insert(int dir, struct xfrm_policy *policy, int excl)
 
 	__xfrm_policy_link(policy, dir);
 
-	/* After previous checking, family can either be AF_INET or AF_INET6 */
-	if (policy->family == AF_INET)
-		rt_genid_bump_ipv4(net);
-	else
-		rt_genid_bump_ipv6(net);
-
 	if (delpol) {
 		xfrm_policy_requeue(delpol, policy);
 		__xfrm_policy_unlink(delpol, dir);
 	}
+
+	/* Advance the route generation only once the replaced policy is gone */
+	xfrm_policy_bump_rt_genid(net, policy->family);
 	policy->index = delpol ? delpol->index : xfrm_gen_index(net, dir, policy->index);
 	hlist_add_head(&policy->byidx, net->xfrm.policy_byidx+idx_hash(net, policy->index));
 	policy->curlft.add_time = ktime_get_real_seconds();
@@ -1695,6 +1700,7 @@ xfrm_policy_bysel_ctx(struct net *net, const struct xfrm_mark *mark, u32 if_id,
 				return pol;
 			}
 			__xfrm_policy_unlink(pol, dir);
+			xfrm_policy_bump_rt_genid(net, pol->family);
 		}
 		ret = pol;
 	}
@@ -1735,6 +1741,7 @@ xfrm_policy_byid(struct net *net, const struct xfrm_mark *mark, u32 if_id,
 					return pol;
 				}
 				__xfrm_policy_unlink(pol, dir);
+				xfrm_policy_bump_rt_genid(net, pol->family);
 			}
 			ret = pol;
 			break;
@@ -1835,10 +1842,12 @@ int xfrm_policy_flush(struct net *net, u8 type, bool task_valid)
 		spin_lock_bh(&net->xfrm.xfrm_policy_lock);
 		goto again;
 	}
-	if (cnt)
+	if (cnt) {
+		rt_genid_bump_all(net);
 		__xfrm_policy_inexact_flush(net);
-	else
+	} else {
 		err = -ESRCH;
+	}
 out:
 	spin_unlock_bh(&net->xfrm.xfrm_policy_lock);
 	return err;
@@ -1875,10 +1884,12 @@ int xfrm_dev_policy_flush(struct net *net, struct net_device *dev,
 		spin_lock_bh(&net->xfrm.xfrm_policy_lock);
 		goto again;
 	}
-	if (cnt)
+	if (cnt) {
+		rt_genid_bump_all(net);
 		__xfrm_policy_inexact_flush(net);
-	else
+	} else {
 		err = -ESRCH;
+	}
 out:
 	spin_unlock_bh(&net->xfrm.xfrm_policy_lock);
 	return err;
@@ -2365,6 +2376,9 @@ int xfrm_policy_delete(struct xfrm_policy *pol, int dir)
 
 	spin_lock_bh(&net->xfrm.xfrm_policy_lock);
 	pol = __xfrm_policy_unlink(pol, dir);
+	/* Socket policies only apply to their own socket. */
+	if (pol && dir < XFRM_POLICY_MAX)
+		xfrm_policy_bump_rt_genid(net, pol->family);
 	spin_unlock_bh(&net->xfrm.xfrm_policy_lock);
 	if (pol) {
 		xfrm_policy_kill(pol);
-- 
2.56.0

