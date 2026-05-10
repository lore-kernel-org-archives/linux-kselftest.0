Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4C2332ED0;
	Sun, 10 May 2026 19:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778441352; cv=none; b=k2HuuLIjONq41jbQzT7I0vhSkF4CfiiNEpTphG42aBWMm1gJmXCykjfIiMe0Sda7VWDAfo+uQx8FSPQK0PFRsMeu5AVCDoJ/vd+BZtLDq22XgukOmdxq+0IegzdeSsJ5cqu8sTh7tfOj1lOGUG6aYLWKQv+tek6u+9g8rQv0r+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778441352; c=relaxed/simple;
	bh=s4aSvPbEwXK7GTMFdGafNVnEYwaLxrmLv/GBK8KT98I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V9bt3W1+ZMhGg/B7VRCp80SA0X90snntNkKEzrGC1rgCVNFQlfgRw9rvfQgEyx8/wxJJuzo82nV39ph0fhrXdF86FPuM0kUS9IsFGI3YMUTf05gj4/TxW+irSsFDbSlhCA34P18DQjKhhMR12ytzWITSml0TNWzMBM12cXMfCBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ciPDioNz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ciPDioNz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927C9C2BCB8;
	Sun, 10 May 2026 19:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778441351;
	bh=s4aSvPbEwXK7GTMFdGafNVnEYwaLxrmLv/GBK8KT98I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ciPDioNzZ9D3Fvn0XVkezNn/xPDb9eyNNh8xMntrzTs3I7PH9HWKwlp+1F3eGxO3v
	 TUpY9YJgU2T97RqkQf4IasaZFiqCNIg1GXHnnX69NdaGCW5P8i3YBrQ4LQFlR6SKqa
	 pI78PMfK+pDMYRMAVc7y7umkUQV71/K6cS7p+xUBO9IR7Kf31ngI5BDa/Wiplmief2
	 HKmmXhwfRjq1eYAEPBjqqaoprPudDGASKLtg0LZ5kiVWL7XaM6jw6M8YaPeRju67mA
	 xVgzZ5u4s2n1nTyWM32NOeoN3Vx9p8nbZ02frJuYcMncoD1NSMxkL4SxcUimUhciMz
	 tlPPPp/wYYOkw==
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
Subject: [PATCH net v2 06/10] net: shaper: fix undersized reply skb allocation in GROUP command
Date: Sun, 10 May 2026 12:29:00 -0700
Message-ID: <20260510192904.3987113-7-kuba@kernel.org>
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

net_shaper_group_send_reply() writes both the NET_SHAPER_A_IFINDEX
attribute (via net_shaper_fill_binding()) and the nested
NET_SHAPER_A_HANDLE attribute (via net_shaper_fill_handle()), but
the reply skb at the call site in net_shaper_nl_group_doit() is
allocated using net_shaper_handle_size(), which only accounts for
the nested handle.

The allocation is therefore short by nla_total_size(sizeof(u32))
(8 bytes) for the IFINDEX attribute.  In practice the slab allocator
rounds up the small allocation so the bug is latent, but the size
accounting is wrong and could bite if the reply grew further.

Introduce net_shaper_group_reply_size() that accounts for the full
reply payload and use it both at the genlmsg_new() call site and in
the defensive WARN_ONCE message.

Fixes: 5d5d4700e75d ("net-shapers: implement NL group operation")
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 net/shaper/shaper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/net/shaper/shaper.c b/net/shaper/shaper.c
index 12e5e0c18643..08fde2d9e8aa 100644
--- a/net/shaper/shaper.c
+++ b/net/shaper/shaper.c
@@ -90,6 +90,12 @@ static int net_shaper_handle_size(void)
 			      nla_total_size(sizeof(u32)));
 }
 
+static int net_shaper_group_reply_size(void)
+{
+	return nla_total_size(sizeof(u32)) +	/* NET_SHAPER_A_IFINDEX */
+	       net_shaper_handle_size();	/* NET_SHAPER_A_HANDLE */
+}
+
 static int net_shaper_fill_binding(struct sk_buff *msg,
 				   const struct net_shaper_binding *binding,
 				   u32 type)
@@ -1227,7 +1233,7 @@ static int net_shaper_group_send_reply(struct net_shaper_binding *binding,
 free_msg:
 	/* Should never happen as msg is pre-allocated with enough space. */
 	WARN_ONCE(true, "calculated message payload length (%d)",
-		  net_shaper_handle_size());
+		  net_shaper_group_reply_size());
 	nlmsg_free(msg);
 	return -EMSGSIZE;
 }
@@ -1275,7 +1281,7 @@ int net_shaper_nl_group_doit(struct sk_buff *skb, struct genl_info *info)
 	/* Prepare the msg reply in advance, to avoid device operation
 	 * rollback on allocation failure.
 	 */
-	msg = genlmsg_new(net_shaper_handle_size(), GFP_KERNEL);
+	msg = genlmsg_new(net_shaper_group_reply_size(), GFP_KERNEL);
 	if (!msg) {
 		ret = -ENOMEM;
 		goto free_leaves;
-- 
2.54.0

