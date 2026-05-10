Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF7432D7C7;
	Sun, 10 May 2026 19:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778441354; cv=none; b=tOh4OLJtBrp0FFAE3cBLjxHRbG5A8QflIQHfIvVkHX0OaGDMgLUYRKvqqrHfq5lHxcHldI0yTjalW7wp4//6LfGi9eS0UeUFjNQcER0dZK5077Vicw9bqz2qffMwfKcUjpx9lWd9QMudLxk/dbtf3C4XV9qDMG85y+/nMwBgz6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778441354; c=relaxed/simple;
	bh=Hovv7eLgCFdgedOgffl8VWtqHbYiTBVjbvkid2QLs6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XdJ0LDNioI/IDa3V0YPF1x1uRbdRmeDi9+D5qpke+33XVXi2I6XjaYTf+CSh0qxexJj01U8c17RGK3D9lWLaZ/xEu2eJG/evjHjxS08a9pwmzELFkk14q4TnywFNPAeI5pFCBRJGlNCR9ReuIaNBxJJH8tRHQjx3TMg+Q0noNDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Exp2onsj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Exp2onsj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61A4C2BCC7;
	Sun, 10 May 2026 19:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778441354;
	bh=Hovv7eLgCFdgedOgffl8VWtqHbYiTBVjbvkid2QLs6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Exp2onsj4vXn4+plK3DjzPG6Zu9bblJP4XojLI8mZcum0m1bS3EKH5jQCN9xE7nGb
	 at3G8ZrcCADhIZYb2fye16OJvgxZALt6gaOn9Xb6s6gC8UEgssE7ofJU0pgT4/D5US
	 jAzpd6xR9pfhI7gwFw/tjg4r2nuPLrX6A6zhmGG7SvA4dyK5Bb+EZ+35yEf55jYRBV
	 M1uaaPMPgDAMz9ZWvUgBIT3eA+4G8aQD9GVIm8Opg94uacG9BropAIdA/YxngCwHeq
	 uZLEEf7dn/xX9HyI32eBmTRoD7bGQLKQ3BeIPW/nhMiSM3YrjI4HWd4v6GYhysms4X
	 XShbzRcxo8GXg==
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
Subject: [PATCH net v2 10/10] net: shaper: reject QUEUE scope handle with missing id
Date: Sun, 10 May 2026 12:29:04 -0700
Message-ID: <20260510192904.3987113-11-kuba@kernel.org>
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

net_shaper_parse_handle() does not enforce that the user provides
the handle ID. For NODE the ID defaults to UNSPEC for all other
cases it defaults to 0.

For NETDEV 0 is the only option. For QUEUE defaulting to 0 makes
less intuitive sense. Specifically because the behavior should
(IMHO) be the same for all cases where there may be more than
one ID (QUEUE and NODE).

We should either document this as intentional or reject.
I picked the latter with no strong conviction.

Fixes: 4b623f9f0f59 ("net-shapers: implement NL get operation")
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 net/shaper/shaper.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/net/shaper/shaper.c b/net/shaper/shaper.c
index 4ae3ee6764a0..b1c65110f04d 100644
--- a/net/shaper/shaper.c
+++ b/net/shaper/shaper.c
@@ -477,10 +477,15 @@ static int net_shaper_parse_handle(const struct nlattr *attr,
 	 * shaper (any other value).
 	 */
 	id_attr = tb[NET_SHAPER_A_HANDLE_ID];
-	if (id_attr)
+	if (id_attr) {
 		id = nla_get_u32(id_attr);
-	else if (handle->scope == NET_SHAPER_SCOPE_NODE)
+	} else if (handle->scope == NET_SHAPER_SCOPE_NODE) {
 		id = NET_SHAPER_ID_UNSPEC;
+	} else if (handle->scope == NET_SHAPER_SCOPE_QUEUE) {
+		NL_SET_ERR_ATTR_MISS(info->extack, attr,
+				     NET_SHAPER_A_HANDLE_ID);
+		return -EINVAL;
+	}
 
 	if (id && handle->scope == NET_SHAPER_SCOPE_NETDEV) {
 		NL_SET_ERR_MSG_ATTR(info->extack, id_attr,
-- 
2.54.0

