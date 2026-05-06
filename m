Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7292EB10;
	Wed,  6 May 2026 00:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778025999; cv=none; b=QR7VqFJzUD2VwDUsQWTiPrzMARKaZp2r1MOqkXcIJ1MLRc5hfZhfSuGLLGQsos3Gc9aEAnJbNT5LbNDfTaAb4TLe5prAVJ5mevt9VoXmqf/VEAofNIPiVi4IDjODsOKazSt+Wj3EBtXsj14r22YpUA8wpIzs1hgAEVW908wBR0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778025999; c=relaxed/simple;
	bh=kJHE256oH3NTC3ff50n81tp42Luk22mTlgrrZBhy2W8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRNEMihwKLuZpiUbLMsodsgPvckkf5AUOAbQpMGgwzI62zt1HWc6mJoqqF+nO+jMa2tA2A33HSYjXfflJnQI6jLRrXrESTo0DHt8+2Jz1iOCV7I7kc30nxa4uibXvPQoBYPyeYqkhDGiRBfDAXMWWG0u19j8892WWJuaVh/zIVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJ/PWqXq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJ/PWqXq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A7BC2BCF6;
	Wed,  6 May 2026 00:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778025999;
	bh=kJHE256oH3NTC3ff50n81tp42Luk22mTlgrrZBhy2W8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CJ/PWqXqU4gFt3nwqJgWXU3Aimc7P6wJiZsIpuxcP+ANu3R9O/AxoBIcHpKTDWK48
	 tPJjUpYbU/6vSI8QLI1ldk/en9COvIWHg5S02f3S6NtQUk+dERgx1VqgkBOLhosl/9
	 GU4KusK98oy3hf3zbCWF3u5XfzrBTtNjwrBgeOXDa5rKjZAZZoUyZTVLGYpKgAvKlQ
	 DLvrpbKBqFBb2Qcvl8HAluyjh61HwTLr2DlUL/2Hzbf6O1q7A3Q7tGqXhoHpft5C9i
	 WyLjNySRpHy7Pb51VG8lAKC03CHeS0+w5Ilm1WQpHgNVC0TimxB+1ADLDQnQvJ35HB
	 z5QbYgtg/2JgA==
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
Subject: [PATCH net 12/12] net: shaper: reject QUEUE scope handle with missing id
Date: Tue,  5 May 2026 17:06:28 -0700
Message-ID: <20260506000628.1501691-13-kuba@kernel.org>
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
index 2adf8b0e1105..daaefc02237b 100644
--- a/net/shaper/shaper.c
+++ b/net/shaper/shaper.c
@@ -491,10 +491,15 @@ static int net_shaper_parse_handle(const struct nlattr *attr,
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
 
 	handle->id = id;
 	return 0;
-- 
2.54.0

