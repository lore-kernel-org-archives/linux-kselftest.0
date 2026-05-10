Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED1F32BF24;
	Sun, 10 May 2026 19:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778441350; cv=none; b=tn8qWtUbwyR3wqasJUjaLkZcGr4Vx15bttgHtYEegLE5DBSfSMJUzig3D/5XXVK56Nc3hYUvz0JcUqLKYPOXYhDeDbuTJhhWlq8u46fPJ13EmfaAi9EXMBK4ueB1KIRPceq4ROajqwWuy+X7CwG9H5VMU6o+4F87uDTd4OBDeb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778441350; c=relaxed/simple;
	bh=L7LrkLgBXg7IKSLXsaQyWF1okpg5RNuXE/qMPhDVGhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cY5rPNHsCKCfx5J9lC9gPaV8hQwb40BeqqiYodt8TAyqyJk591YmM2zio1l+5Abd/vr0pXYfN70XDn/W/5/sb8XSqINwTTLAdQfCLCfZYeL9TnQ8YgWqBPQ7ROvbcOdHNwX4NJT8/eVxcIqn0pKZHr2ZNjAD6Yd3rq0b2SfzY9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vhldsl8c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vhldsl8c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC6AC2BCF7;
	Sun, 10 May 2026 19:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778441349;
	bh=L7LrkLgBXg7IKSLXsaQyWF1okpg5RNuXE/qMPhDVGhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vhldsl8c5k04SBK4xLEEZyFtITyqrTJkoyfmVcMUTej6eyAmV2bT6jxojZxgFk+gO
	 94+pX5E/IhgW19oxKp7MybGBnoxko2Oq26RpO5NMgbHfGXP3nVkqqJSckhsnKfXC62
	 e6ZlOtIGOWM/9nXgA072G/XkWfbbOpuMsW05BTHBDMpTL764OiW+10ulP75dl/QVeP
	 WnqhxbPA94IGb95+y7KvzdorRq3xxFv6muP/8LyyjAztu5IGlhOPMZU9WmFfYy69kD
	 JboQ/MHYIAzF59NsghpDjGxILATiZ7wdkdSJb0boUEqnETNlG+cLEFnTkffBaS6Vbz
	 i2F12wBCcGplA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net v2 02/10] net: shaper: fix trivial ordering issue in net_shaper_commit()
Date: Sun, 10 May 2026 12:28:56 -0700
Message-ID: <20260510192904.3987113-3-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510192904.3987113-1-kuba@kernel.org>
References: <20260510192904.3987113-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We should update the entry before we mark it as valid.

Fixes: 93954b40f6a4 ("net-shapers: implement NL set and delete operations")
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 net/shaper/shaper.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/net/shaper/shaper.c b/net/shaper/shaper.c
index d2b8f1f951b1..86319ddbf290 100644
--- a/net/shaper/shaper.c
+++ b/net/shaper/shaper.c
@@ -295,6 +295,10 @@ net_shaper_lookup(struct net_shaper_binding *binding,
 				       NET_SHAPER_VALID))
 		return NULL;
 
+	/* Pairs with smp_wmb() in net_shaper_commit(): if the entry is
+	 * valid, its contents must be visible too.
+	 */
+	smp_rmb();
 	return xa_load(&hierarchy->shapers, index);
 }
 
@@ -412,8 +416,9 @@ static void net_shaper_commit(struct net_shaper_binding *binding,
 		/* Successful update: drop the tentative mark
 		 * and update the hierarchy container.
 		 */
-		__xa_set_mark(&hierarchy->shapers, index, NET_SHAPER_VALID);
 		*cur = shapers[i];
+		smp_wmb();
+		__xa_set_mark(&hierarchy->shapers, index, NET_SHAPER_VALID);
 	}
 	xa_unlock(&hierarchy->shapers);
 }
@@ -837,6 +842,10 @@ int net_shaper_nl_get_dumpit(struct sk_buff *skb,
 	for (; (shaper = xa_find(&hierarchy->shapers, &ctx->start_index,
 				 U32_MAX, NET_SHAPER_VALID));
 	     ctx->start_index++) {
+		/* Pairs with smp_wmb() in net_shaper_commit(): the entry
+		 * is marked VALID, so its contents must be visible too.
+		 */
+		smp_rmb();
 		ret = net_shaper_fill_one(skb, binding, shaper, info);
 		if (ret)
 			break;
-- 
2.54.0

