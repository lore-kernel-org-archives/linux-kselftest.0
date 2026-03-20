Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD3F30CD85
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 01:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773969920; cv=none; b=r04QPUfli1kGq6Cj7CbfaAlXxF2Idrgy+0zfEm7O8URzlzIAHc9KTr994mmPszKmT44x1uM+oY+oZTYg28qUVSEEWboq2hridNr2NdbSbIECFUaVqHRrK+4Cy4EOdgRH2vIkLupFikRojXKwXU7kX1F7lLBsJ930lS2hhUKOMYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773969920; c=relaxed/simple;
	bh=5NcsxaHVIQ2NmCj9OLQh+nSLlXz0JVUjSv0mBYVb1MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bcC7xkPubcYfRFnzqpCInGQoXsPy/YET1bO+XVWyrCBAfM9q9qH+ZQY/GBfZe0aeIU6qF3mGfdfbtI5efKdusmHAzXx9MzWQDpChGtiK3htFa0Uwwsa2ei+At2yLME8huavH/J01JGx3CtjrQTFhB2aVf5kxra46BD12cIng8nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c0f754e756so1326286eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 18:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773969917; x=1774574717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HbyBRqP1dM0VO6fEJ4blZH7JfwL0DV5fAiX12aFZ5no=;
        b=lwRPgI4AzkysTSNokzDI4PVQ7u/4GR3nSqtOcnmDq8aYuOCVbgGQNa1dmWT0M1ujGO
         kFIxaqrORXoTik4mDEQ7U5I7Rbxhk/nqrNkwUTVJJWTsLAq2Eu2mld1JyguPWmNZd7J7
         gqNlWljw4b+rQjUqTG1qqA+6fFLSXeh5yoQHRo7CBq1QaTlgoX6E3xVfph5VDqIHfOC7
         zlJBE45fnt+9lPAoRKmb/0nbowf1RJsptMlJ2M2hjpTSp1wbz9NdsCgT93TlKmKE7Ghw
         5B7yKuzTTU21wl9w3CTvtFFywPURBHtNlsobLXoHOSY2/0UZNe2GshspzBXCAhiEVeZK
         P2kQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+aU+7w5/SV53h1/0Cq8m1ZJJQSy60o242oHG69GzwHk/TBqo2kJjvKWOEsHr1ZJJn9sRzh8dQMNoI+TV+CTE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw94xwzvDE1mheng4l3aha9STQghEb2R2aEq37JB1Ib5cTfQ7X3
	aVZVB6Tm2RYCmzPDv98MjWoz2RhBa227t0SSHc80jYBXwcG0COojBJc=
X-Gm-Gg: ATEYQzxv6q+mozcX1tJ0E2mAIiDQu84EWHtwbJsFSdHGQha2ZBpL7/eCZV9CwZyatuM
	SkDPwNu3w31yXN0LSAgeWYzNFIJGRs3V03D0fybuLjuBhrVnREJnGeKDrUPupc82RiZVlOfKcOh
	CxiR3ZirM4zKRu1hY6oXzAbkDM3jx62G2bGNB4gNbZE6Ug0J9mZaZ+txjG8Ak7G72VlRBM9wH9C
	nwv6rExOUsnYMaKdZSVSMhnk19hb68ynYdXLjcEF3UOsOC3zluoRhOQ4hlYObBd4Imr6UewObIk
	0ayJhtPoZtaWELfpAG1k/iNexRA0mJTSv02aLgvcTjj5FxX08PkwYlA1Lfaxiu5OgaHk15ERojs
	Legq75UzgtxK2epJ0Ej0opFRB/YFEy/vWNXUJWmhT6NaohX6O9QvIVDd1gZArtJor3YN5ntwz+L
	z18jCEF/IH7ZpKU117I91+aizVk31e0KBHR4h884w4BjZH71IHEzXf4uHKgIBf+bUTRFu0M+9s7
	8lNdyXVQAKZyBuXAQ==
X-Received: by 2002:a05:7300:6da5:b0:2c0:eec6:279e with SMTP id 5a478bee46e88-2c10974fb69mr728307eec.22.1773969916878;
        Thu, 19 Mar 2026 18:25:16 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b29c74bsm1146865eec.17.2026.03.19.18.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:25:16 -0700 (PDT)
From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	johannes@sipsolutions.net,
	sd@queasysnail.net,
	jianbol@nvidia.com,
	dtatulea@nvidia.com,
	sdf@fomichev.me,
	mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com,
	willemb@google.com,
	skhawaja@google.com,
	bestswngs@gmail.com,
	aleksandr.loktionov@intel.com,
	kees@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 11/13] dummy: convert to ndo_set_rx_mode_async
Date: Thu, 19 Mar 2026 18:24:59 -0700
Message-ID: <20260320012501.2033548-12-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320012501.2033548-1-sdf@fomichev.me>
References: <20260320012501.2033548-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert dummy driver from ndo_set_rx_mode to ndo_set_rx_mode_async.
The dummy driver's set_multicast_list is a no-op, so the conversion
is straightforward: update the signature and the ops assignment.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/dummy.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dummy.c b/drivers/net/dummy.c
index d6bdad4baadd..f8a4eb365c3d 100644
--- a/drivers/net/dummy.c
+++ b/drivers/net/dummy.c
@@ -47,7 +47,9 @@
 static int numdummies = 1;
 
 /* fake multicast ability */
-static void set_multicast_list(struct net_device *dev)
+static void set_multicast_list(struct net_device *dev,
+			       struct netdev_hw_addr_list *uc,
+			       struct netdev_hw_addr_list *mc)
 {
 }
 
@@ -87,7 +89,7 @@ static const struct net_device_ops dummy_netdev_ops = {
 	.ndo_init		= dummy_dev_init,
 	.ndo_start_xmit		= dummy_xmit,
 	.ndo_validate_addr	= eth_validate_addr,
-	.ndo_set_rx_mode	= set_multicast_list,
+	.ndo_set_rx_mode_async	= set_multicast_list,
 	.ndo_set_mac_address	= eth_mac_addr,
 	.ndo_get_stats64	= dummy_get_stats64,
 	.ndo_change_carrier	= dummy_change_carrier,
-- 
2.53.0

