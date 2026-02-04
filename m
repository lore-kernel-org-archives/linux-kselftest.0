Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D216942188F
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 15:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218414; cv=none; b=pGYgacqZEkQq6vC6xQhRtXdFk7K0I9QXJiBeBf4SGDIV2sqb2g+ed1zEVXfn2f4DJOT7QofyPY1k999QaRLQ0CV/8R5z6h62mMkihYGbb7F2f2vmztzH/GJOcfRKfb9PhtRqxgXOcSL7ggjYbmiGujTxkpBnaZ3xgxETReuy7so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218414; c=relaxed/simple;
	bh=AbRr/30dy18DzHXHj6FkozJad0FQIPWhxZ2GqG3Z1M0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r2L8EIz1I6ByRI0PSosnkJvhA66kdxTlKpTU35+clJ+BxgIitMoukaRJgxMpkIA9H9zGsKuEsXN9KN6TAYmRCsl1rAItPfhJdhskQPdlDLN4Bcwj9A1OgErI0PZZDm45YA5nYnIkwS7r1oyHkCZiU9Zvx4Bq1ygGJRjy1Bo1rRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKF515F8; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKF515F8"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-649d200ac43so2203911d50.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 07:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770218413; x=1770823213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRqiqvUMMSZGLeeYDMB2av2ykrxfAYNo5nlbKFvA9yM=;
        b=cKF515F8Q/CCjYl4xQzW691ufkQetXcPnNErT+6dWJDiP8ooM0gnKjWfB1f6elzfO0
         U8LxLc5OnobAUQu8R+XKcphHOjBBgzFiDxoZR7aBXGTPP95EGVtatxgQCYyUS8rDqw2d
         x7EZRlkaWRsPNHYjsEinoc1/qu3N71dn0t/Y9rEylt654jcKrPP9T/6GWFTvDT6AVDb2
         giJc4tn/QdoJQr7X2Tlm0C5m3U19XBaDrk+EoS1JIiO8J25YoZSh+KjZuX0q6ssZ7QaH
         g2UFtjqCdOUQ0JQrzCw/NxARzEcjiTY9JFbEFCC+mo4PkbS79vXm73kbxJktC9ZUUeNL
         TTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770218413; x=1770823213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uRqiqvUMMSZGLeeYDMB2av2ykrxfAYNo5nlbKFvA9yM=;
        b=NYHjJK5nWFUQfHTIPbRsz8AUwANmIBGK3Q3NgkcFqE8ql3Bqr4t6Bbx3c+5q9UlW4T
         jcg91R7CVsHcPz6F4I4kKujRXVLUv0+/y4MskDQZ5qiQmuVhHuJonpM9B6+x4NApi0fg
         bEeIuEEHzTEtogAWTWGb/iaH3Psm1RKowtxdwxLxtDSudt1E42FpLmgJs/R0eRwVLfTs
         cESCki9XHIDs8cVkJ16m/BGuVxGfPz/D2/5+wgZvxWcQyIGIXftBXxs9VWhvVko5jOIX
         trkF+OF1LetdIZ8X4YhemuKT7d5BK+dffREEZRWTu+qodoXc9F2MsGUnN7zt1UKyK8tN
         f4vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm4u4egPxSIxp8f7pVZJap0WuKG0LRHf4ERbkz80rh/0i6m3sH3DTlV5/2+7dcPfGj4gZV5Ju+Q6NjJ1DKOS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJI2jpEWrCYL/lBH+vANBbEh4+wSG0ti5j1oiJSp4sqxb8zURQ
	NrfMKesB9ERqSh8eytfmv1SmLKqa/iouzp3NG1HY7REPA0Vi6a7vJv6q
X-Gm-Gg: AZuq6aLcs9Fmpcd2LfptBY1xxDA9jZGSYbwwFSbVb80p93icDNyjP8PGFfMw0vGWkmC
	RF/dLpMrz5tcZKUgYRXeltA6ll0ordI37O6Wyj0M6Qnn2Fz+RF0WsiQTKCOYUaFYoxqtbvveliY
	jHjUzmO97KaPOj5Zqpk7TAxeJs8uWoNN1CybOTcxQh/+g3MTHDzUDUkQffGZnFEKyplHhbpec86
	2vD57PkxbMcMhUmeignEhzX2hlXCRKBUmF7G3JJ7cdgjOqFeOcIUcoD0azdXjb1oYDMuN92MDQL
	zM8FTQCvNDY/KqmUFxf1m+TyjpwlpCt5UwxajQv9Mkf0lfUXQo/dVcZUtpfYoLa0/7yC8rros9z
	0ZxrVo5DJ7rTp6tJICfkrQlEAd0wZAw4A5fzHVGOo1xg8jVM0QPOp4Oc60GxT7bwWgr/DbfaXC3
	U47BTYVY4Y
X-Received: by 2002:a05:690e:2481:b0:649:d17e:9ac4 with SMTP id 956f58d0204a3-649db32d07dmr2575966d50.18.1770218412746;
        Wed, 04 Feb 2026 07:20:12 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:72::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649dc5cd5c1sm2584218d50.18.2026.02.04.07.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 07:20:12 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 04 Feb 2026 07:20:08 -0800
Subject: [PATCH net-next 4/9] psp: refactor psp_dev_tx_key_del()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-psp-v1-4-5f034e2dfa36@gmail.com>
References: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
In-Reply-To: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Donald Hunter <donald.hunter@gmail.com>, Boris Pismenny <borisp@nvidia.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Daniel Zahka <daniel.zahka@gmail.com>
X-Mailer: b4 0.13.0

This is a pure refactor. Lift the list deletion and key validation
code into callers. Subsequent patches will have different requirements
for what actions need to accompany psp dev key deletion.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 net/psp/psp_main.c |  7 +++++--
 net/psp/psp_sock.c | 11 ++++++-----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
index a8534124f626..982c96f74ae3 100644
--- a/net/psp/psp_main.c
+++ b/net/psp/psp_main.c
@@ -132,8 +132,11 @@ void psp_dev_unregister(struct psp_dev *psd)
 
 	list_splice_init(&psd->active_assocs, &psd->prev_assocs);
 	list_splice_init(&psd->prev_assocs, &psd->stale_assocs);
-	list_for_each_entry_safe(pas, next, &psd->stale_assocs, assocs_list)
-		psp_dev_tx_key_del(psd, pas);
+	list_for_each_entry_safe(pas, next, &psd->stale_assocs, assocs_list) {
+		list_del(&pas->assocs_list);
+		if (pas->tx.spi && !pas->tx_moved)
+			psp_dev_tx_key_del(psd, pas);
+	}
 
 	rcu_assign_pointer(psd->main_netdev->psp_dev, NULL);
 
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index f429b8b2d8f2..1a97609564e7 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -85,9 +85,7 @@ static int psp_dev_tx_key_add(struct psp_dev *psd, struct psp_assoc *pas,
 
 void psp_dev_tx_key_del(struct psp_dev *psd, struct psp_assoc *pas)
 {
-	if (pas->tx.spi && !pas->tx_moved)
-		psd->ops->tx_key_del(psd, pas);
-	list_del(&pas->assocs_list);
+	psd->ops->tx_key_del(psd, pas);
 }
 
 static void psp_assoc_free(struct work_struct *work)
@@ -96,8 +94,11 @@ static void psp_assoc_free(struct work_struct *work)
 	struct psp_dev *psd = pas->psd;
 
 	mutex_lock(&psd->lock);
-	if (psd->ops)
-		psp_dev_tx_key_del(psd, pas);
+	if (psd->ops) {
+		list_del(&pas->assocs_list);
+		if (pas->tx.spi && !pas->tx_moved)
+			psp_dev_tx_key_del(psd, pas);
+	}
 	mutex_unlock(&psd->lock);
 	psp_assoc_put(pas->prev);
 	psp_dev_put(psd);

-- 
2.47.3

