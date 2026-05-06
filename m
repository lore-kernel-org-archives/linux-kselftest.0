Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF811A9FB0;
	Wed,  6 May 2026 00:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778025996; cv=none; b=d4uoHOsjjarKNRu3xePrP4WdkYNDzNzEjjYVQTVu89dQtIt0ccBZijQuBiuYPjD6XX7RdfzK6maF3WNtGZ3yM8dk0+bhB6N2/pF3kubaEK6gITOEQaOLIcE+VnHPR6A6J70wD6Mp9CqC1Wy5vmoeU4uj9YxAFLAr344CO93p9qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778025996; c=relaxed/simple;
	bh=2HO1Fse0w1LKdl0Q6IgkbjImSyWIhCgKaEFPQcdkVrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U93VXHiDr7k08JYHaBMDuYcJ5G6uuYRNru6j0qMqXG50A8Jhnc54L9mACdH6CaQCpJAuHIakF7H1yRP8zZ9JrRo1FnpgvPNxMkFyHcP96sLoTVGN3oZTeYfxq7KRd8ILg0ISJGTgQ8lSb4wsgEWP90iR9hnv6HP/VXrLpZ8tHs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q/qpC2W0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q/qpC2W0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4F5C2BCF4;
	Wed,  6 May 2026 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778025995;
	bh=2HO1Fse0w1LKdl0Q6IgkbjImSyWIhCgKaEFPQcdkVrc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q/qpC2W0LMU7LeD0imIT+I/7hbEBRy0VBFyXbyTLQW0Hg1wkhwfvVE70CWGSUN1Sw
	 qIyUQ2A1Iu83dADgdXPMygdsLWBxFN+FI65Lk+bd6GlZMrNBwhbFmv2e5lbKYY6KRh
	 4ulZb93N369Ke3iPpp537NJe6LsM9En4oQj2wufBk4vtkUyZ+NwkSdEDaR+1M9VRnK
	 iFxICKptJtpKUc1fse0TUT469erhIX38IM5wSuMxnTD+sDh9s60YIUHQK4NG3nulaY
	 gzcrbs3452tx+i1a2dGkSAGOuSZ1wIj0Gy20Hv/FK8ZIunWMmMQz7Cym49Rmu6Ci5O
	 /+pEOdj+NlWBA==
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
Subject: [PATCH net 05/12] net: shaper: reject duplicate leaves in GROUP request
Date: Tue,  5 May 2026 17:06:21 -0700
Message-ID: <20260506000628.1501691-6-kuba@kernel.org>
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

net_shaper_nl_group_doit() does not deduplicate NET_SHAPER_A_LEAVES
entries. When userspace supplies the same leaf handle twice, the same
old-parent pointer lands twice in old_nodes[]. The cleanup loop double
frees the parent. Of course the same parent may still be in old_nodes[]
twice if we are moving multiple of its leaves.

Note that this patch also implicitly fixes the fact that the
i >= leaves_count path forgets to set ret.

Fixes: 5d5d4700e75d ("net-shapers: implement NL group operation")
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 net/shaper/shaper.c | 60 +++++++++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 15 deletions(-)

diff --git a/net/shaper/shaper.c b/net/shaper/shaper.c
index a2e9adca9afc..a27673e5919f 100644
--- a/net/shaper/shaper.c
+++ b/net/shaper/shaper.c
@@ -955,6 +955,46 @@ static int net_shaper_handle_cmp(const struct net_shaper_handle *a,
 	return memcmp(a, b, sizeof(*a));
 }
 
+static int net_shaper_parse_leaves(struct net_shaper_binding *binding,
+				   struct genl_info *info,
+				   const struct net_shaper *node,
+				   struct net_shaper *leaves,
+				   int leaves_count)
+{
+	struct nlattr *attr;
+	int i, j, ret, rem;
+
+	i = 0;
+	nla_for_each_attr_type(attr, NET_SHAPER_A_LEAVES,
+			       genlmsg_data(info->genlhdr),
+			       genlmsg_len(info->genlhdr), rem) {
+		if (WARN_ON_ONCE(i >= leaves_count))
+			return -EINVAL;
+
+		ret = net_shaper_parse_leaf(binding, attr, info,
+					    node, &leaves[i]);
+		if (ret)
+			return ret;
+
+		/* Reject duplicates */
+		for (j = 0; j < i; j++) {
+			if (net_shaper_handle_cmp(&leaves[i].handle,
+						  &leaves[j].handle))
+				continue;
+
+			NL_SET_ERR_MSG_ATTR_FMT(info->extack, attr,
+						"Duplicate leaf shaper %d:%d",
+						leaves[i].handle.scope,
+						leaves[i].handle.id);
+			return -EINVAL;
+		}
+
+		i++;
+	}
+
+	return 0;
+}
+
 static int net_shaper_parent_from_leaves(int leaves_count,
 					 const struct net_shaper *leaves,
 					 struct net_shaper *node,
@@ -1195,10 +1235,9 @@ int net_shaper_nl_group_doit(struct sk_buff *skb, struct genl_info *info)
 	struct net_shaper **old_nodes, *leaves, node = {};
 	struct net_shaper_hierarchy *hierarchy;
 	struct net_shaper_binding *binding;
-	int i, ret, rem, leaves_count;
+	int i, ret, leaves_count;
 	int old_nodes_count = 0;
 	struct sk_buff *msg;
-	struct nlattr *attr;
 
 	if (GENL_REQ_ATTR_CHECK(info, NET_SHAPER_A_LEAVES))
 		return -EINVAL;
@@ -1226,19 +1265,10 @@ int net_shaper_nl_group_doit(struct sk_buff *skb, struct genl_info *info)
 	if (ret)
 		goto free_leaves;
 
-	i = 0;
-	nla_for_each_attr_type(attr, NET_SHAPER_A_LEAVES,
-			       genlmsg_data(info->genlhdr),
-			       genlmsg_len(info->genlhdr), rem) {
-		if (WARN_ON_ONCE(i >= leaves_count))
-			goto free_leaves;
-
-		ret = net_shaper_parse_leaf(binding, attr, info,
-					    &node, &leaves[i]);
-		if (ret)
-			goto free_leaves;
-		i++;
-	}
+	ret = net_shaper_parse_leaves(binding, info, &node,
+				      leaves, leaves_count);
+	if (ret)
+		goto free_leaves;
 
 	/* Prepare the msg reply in advance, to avoid device operation
 	 * rollback on allocation failure.
-- 
2.54.0

