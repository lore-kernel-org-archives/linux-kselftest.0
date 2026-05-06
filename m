Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCB912FF69;
	Wed,  6 May 2026 00:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778025995; cv=none; b=VTOthyTXrDGMPUorjWCSv2oIobvp5p2w3NwKICD4DPpbfuMRKYmtWAxsKtLWdeJSWqGC5pp9iSrXY5MgJ0pA6RGzPzrkU4z7NYzgK0/BZD4mAdfeU7xuh9nW2rmcbhhWQ3e0uvyTHhHgrG/ZVzyaDmyUOlXw0CUk1FalRyGSdx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778025995; c=relaxed/simple;
	bh=Xc484GNJJcB9dnUTHXFcHl9TfC/hxfWHPkcb4XMZde8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HIyE67L49URHSyp3k7V1oQ9WmypLy9yYkdEWmdWbVFamJyS2rEI7StCixiLZ+GQixis+j91yImVhTWSYi/4qWk+bW9e1ws2kN/lFEwKTysWeA0HSECbXeexOXWjC8Pev6sM6f3ezsXCd+6zqNwxVS89hLLpnL8/JwTghW8SqxCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKOss1I1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKOss1I1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B46C2BCC9;
	Wed,  6 May 2026 00:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778025994;
	bh=Xc484GNJJcB9dnUTHXFcHl9TfC/hxfWHPkcb4XMZde8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EKOss1I1YaM7Do8pk84n26av8mfYrK6AzR63WW8AQet4J13+yZQaqCd+AAhIwQfjy
	 WVCm8gANfkTR0019h1JxLIE1ylPdRFpooatM19ilvqLWIkudKvN1CL0aQlrR7AjHY7
	 4J72jVc3bOHAqCYwbext5Hah2RjDWEALxgJabrYYoxumSasN7dNQRbIAAY1qjAMayb
	 +Dkpag67aqqDkuTkPaWTX10R0ZJprwIZVY5x9pRZi6hZ7RmmPsgn7vfnna1+YhtD8G
	 ZOThyRNwcErZcVOwOzkttM8IQd79lb1fR2fe+il09QfKcYVVR5MDBgop9Y/Y+jgr58
	 c+vDIVfbNL04Q==
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
Subject: [PATCH net 03/12] net: shaper: fix trivial ordering issue in net_shaper_commit()
Date: Tue,  5 May 2026 17:06:19 -0700
Message-ID: <20260506000628.1501691-4-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506000628.1501691-1-kuba@kernel.org>
References: <20260506000628.1501691-1-kuba@kernel.org>
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
index c5cf10543af0..692e38df42cb 100644
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
 
@@ -411,8 +415,9 @@ static void net_shaper_commit(struct net_shaper_binding *binding,
 		/* Successful update: drop the tentative mark
 		 * and update the hierarchy container.
 		 */
-		xa_set_mark(&hierarchy->shapers, index, NET_SHAPER_VALID);
 		*cur = shapers[i];
+		smp_wmb();
+		xa_set_mark(&hierarchy->shapers, index, NET_SHAPER_VALID);
 	}
 }
 
@@ -833,6 +838,10 @@ int net_shaper_nl_get_dumpit(struct sk_buff *skb,
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

