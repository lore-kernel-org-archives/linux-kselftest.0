Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02DA192D8A;
	Wed,  6 May 2026 00:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778025995; cv=none; b=hg4B5q7OFHN7Q3VSD4BobhADZd8LE/BOkk/pkSl/XkCENVjprN6DQ/B2RENNV1amNcVIJqhCi588j+yN3/sLgE9+XlXEXzDpiriaFC4lAncZ+Qw+fy7C+d5UQUTXVsjJFR1V2pwiKAzL9RFsoVsltfi6TOPkTbBz17hKT3jUx+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778025995; c=relaxed/simple;
	bh=SpzQ28TDallNo0Vif37Ub3Zcsa7VFCQErqBJotQN2CU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TpW33/xgcn5m/CGaD1rASkLON+01R83vkreqzM2JtCeRb2Ey8r9heHQG0BOz3vSpErg4tl/cT2jCKloWpk0FHeOehNyMc8N1YgeFT0QHdVel3c4VdrRm8/lYDIDWiiIng/v7iJ7FCqeGi7tU1B4CTsfAsXR97IEOuojtFUUW2hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhZrwwSX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhZrwwSX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A1DC2BCFC;
	Wed,  6 May 2026 00:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778025995;
	bh=SpzQ28TDallNo0Vif37Ub3Zcsa7VFCQErqBJotQN2CU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FhZrwwSX5UY7W07piAVr8bOwHZLcTz/s7YYVinqfJA4xNgNAg380YOt8cFtYM0mOk
	 Scbcnp3+7Etv4ryu18X+7+UFZXganBTITis/z/5WGAO+xKZ33iXjgx1SWtp+safADn
	 DWbKLdvJqipq/VzlHJovcWgEHbZq6FzM/TTkvNcPeuwNMkok8U2Zr1ecXBPUg5zRiF
	 YmA9RF8nM0bWSJifda88zAvR4CSVp0JulijI0ed6WK2WuJo8x5hWSjNFFGMqkx7ZFI
	 dQV7140Xi/tWoWtsGaXiZmrsUTws8BSjjaDDTDh9cFCFHMLD2TmHM8yJHfOb6GjKyD
	 7BsfUl+a9fIWw==
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
Subject: [PATCH net 04/12] net: shaper: try to avoid violating RCU
Date: Tue,  5 May 2026 17:06:20 -0700
Message-ID: <20260506000628.1501691-5-kuba@kernel.org>
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

net_shaper_commit() overrides nodes which may be concurrently read
under RCU. This is not a huge deal since the entries only contain
config, worst case user will see inconsistent config params. But
we should try to avoid this obvious RCU violation. Try to allocate
a new node. Since commit() can't fail fall back to overriding.

Full fix is probably not worth the complexity, struct net_shaper
is around 80B, and the allocation is with GFP_KERNEL.

Fixes: 93954b40f6a4 ("net-shapers: implement NL set and delete operations")
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 net/shaper/shaper.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/net/shaper/shaper.c b/net/shaper/shaper.c
index 692e38df42cb..a2e9adca9afc 100644
--- a/net/shaper/shaper.c
+++ b/net/shaper/shaper.c
@@ -406,18 +406,36 @@ static void net_shaper_commit(struct net_shaper_binding *binding,
 	int i;
 
 	for (i = 0; i < nr_shapers; ++i) {
+		struct net_shaper *new;
+
 		index = net_shaper_handle_to_index(&shapers[i].handle);
 
 		cur = xa_load(&hierarchy->shapers, index);
 		if (WARN_ON_ONCE(!cur))
 			continue;
 
-		/* Successful update: drop the tentative mark
-		 * and update the hierarchy container.
+		/* If the shaper is already visible try to allocate a new
+		 * entry so that we don't cause torn reads under RCU.
+		 * This tiny GFP_KERNEL alloc should never fail, really,
+		 * but if it does just override, the torn read is acceptable.
 		 */
-		*cur = shapers[i];
-		smp_wmb();
-		xa_set_mark(&hierarchy->shapers, index, NET_SHAPER_VALID);
+		new = NULL;
+		if (xa_get_mark(&hierarchy->shapers, index, NET_SHAPER_VALID))
+			new = kmalloc_obj(*new);
+
+		if (new) {
+			*new = shapers[i];
+			smp_wmb();
+			/* Replacing an entry, xa_store() can't fail */
+			WARN_ON(xa_err(xa_store(&hierarchy->shapers, index,
+						new, GFP_KERNEL)));
+			kfree_rcu(cur, rcu);
+		} else {
+			*cur = shapers[i];
+			smp_wmb();
+			xa_set_mark(&hierarchy->shapers, index,
+				    NET_SHAPER_VALID);
+		}
 	}
 }
 
-- 
2.54.0

