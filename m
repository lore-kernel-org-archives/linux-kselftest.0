Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C9C2FFF90
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 05:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771566916; cv=none; b=GfAsfAnCVPRRgEB+0BeyxjQ/yE/q8jFxYlDCayyX/bqY+0ymaSpKWM8CCwsMS6gO1UaMAJ+rz1PwF1eHf2kRz9SlcKcqia3eUBvrWpGZbwjXcYaGE5Wvzr1GR5AbYSR7lReQeFrktV0d4t40mWtlX5dhTumXd/mKjYfPPMDjwmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771566916; c=relaxed/simple;
	bh=d/Njxo6LsxfyrmnJNgQrbf4Jrkxu+B4X3AZ0DsjVEVo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jI2BPBtnxfv27S/ArK8ygHYPtaw5/ASQPlNaZ32ci5EPOpcVbgVUCORfFRQrPMQodozU4aNYFBI6htBz1HYEZIbVy5rZ8AZdyTt0iPA95IlM02gNTw3uh7+9NV2RRkFRgGbbVOBdsTXbP3N64ozm9qukXMckK4kFrF9zqHPe/pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SZ9kflJm; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SZ9kflJm"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2aad5fec176so18076505ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 21:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771566915; x=1772171715; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ej8LZF1b2o/Ks4R9g/3WwRmZsBfUCiZmdJJkOcGo2tM=;
        b=SZ9kflJmOLf6mfxQZrtOSRooBSwUjxlYGdxn0wXR68/2lgpl9UvUKfnKAVue4uRi7O
         zlf+ld9GMTgb9fO4szslpS75J1Avk2LvZbLEDiOzCVafZteADj2sfHhQXpEyjzE0kWa6
         ZLzDQt0+6QrA1JpfIwn2Wux7dZtwwDsfRD2NeGxKYY8fVCmDa8ktXY4RanZ3vw0RmBK/
         j1AG1U8Ib3IXyE7y1W46/8AC1wgiJzDCSBZrEq2U0vM3+UhwShGaaDFGdOZ5wIwmZiz9
         vuhHTJtiPKXZWH/T3P1TxV14OiIR+T3fEcUpgsPEcSWaqG7hx+S0KMc21HemBrwAFbTK
         6fNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771566915; x=1772171715;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ej8LZF1b2o/Ks4R9g/3WwRmZsBfUCiZmdJJkOcGo2tM=;
        b=JF0UAFdsKmZLfa3f+HzjOexRESiT+iqltD37OKgUnWZedxIPQTe1YBnKg9xuaG9+4f
         cNx6VcZpkouzsDADDC5ozJkWy8DPt3rQ74cKqtZwYY+SWsZ5VOD5T/Lvci2erBznkSH0
         oNZfmdemBy2fCtdtec9yzp+gYErHJQkvzLAYdXRKrke33wNfIevEQQZUjyEp3ljm7Wup
         ueUwP85wwLqCzgorFXJyFmBE6xADV6AbWxgzTYsGgECBFIansxPYHZ7ixPi7y9LPxhYZ
         MtTA2Y5YGk4NH+2ERdz0T8lD6rePPxRxLe8CZR1O5Yxt13JJYAEnKdKA3B4I5IReucom
         uzqw==
X-Forwarded-Encrypted: i=1; AJvYcCUVEbXtsFJnlB4jPukrPx8pfQEUp1R9aUXSjmTw/SB4hkfEBOTISblwmPqkc0a3aSOoMHAkYSnXhBn9EKvcLsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxHQvth6DLhza1y+8Bg84PVg7UsWtJ2yDm0lIMAS9P0Zlprjye
	tCI2iu7M6uYIZR1Ks5/J/bLAtkUrc4lSaxfkW3VqKULXSRsvRjDJBAatiP9q0Pu9TnADUBuYqfb
	wRv/nISEsfARimTxvWQ==
X-Received: from plma8.prod.google.com ([2002:a17:902:7d88:b0:2a0:92b7:79c1])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3bd0:b0:2aa:dc84:251f with SMTP id d9443c01a7336-2ad5aec750dmr47251955ad.2.1771566914488;
 Thu, 19 Feb 2026 21:55:14 -0800 (PST)
Date: Thu, 19 Feb 2026 21:54:46 -0800
In-Reply-To: <20260220055449.3073-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260220055449.3073-2-tjmercier@google.com>
Subject: [PATCH v4 1/3] kernfs: Don't set_nlink for directories being removed
From: "T.J. Mercier" <tjmercier@google.com>
To: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, amir73il@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Cc: "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

If a directory is already in the process of removal its i_nlink count
becomes irrelevant because its contents are also about to be removed and
any pending filesystem operations on it or its contents will soon start
to fail. So we can avoid setting it for directories already flagged for
removal.

This avoids a race in the next patch, which adds clearing of the i_nlink
count for kernfs nodes being removed to support inotify delete events.

Use protection from the kernfs_iattr_rwsem to avoid adding more
contention to the kernfs_rwsem for calls to kernfs_refresh_inode.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 fs/kernfs/dir.c   | 2 ++
 fs/kernfs/inode.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 29baeeb97871..5b6ce2351a53 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -1491,12 +1491,14 @@ static void __kernfs_remove(struct kernfs_node *kn)
 	pr_debug("kernfs %s: removing\n", kernfs_rcu_name(kn));
 
 	/* prevent new usage by marking all nodes removing and deactivating */
+	down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
 	pos = NULL;
 	while ((pos = kernfs_next_descendant_post(pos, kn))) {
 		pos->flags |= KERNFS_REMOVING;
 		if (kernfs_active(pos))
 			atomic_add(KN_DEACTIVATED_BIAS, &pos->active);
 	}
+	up_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
 
 	/* deactivate and unlink the subtree node-by-node */
 	do {
diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index a36aaee98dce..afdc4021e81a 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -178,7 +178,7 @@ static void kernfs_refresh_inode(struct kernfs_node *kn, struct inode *inode)
 		 */
 		set_inode_attr(inode, attrs);
 
-	if (kernfs_type(kn) == KERNFS_DIR)
+	if (kernfs_type(kn) == KERNFS_DIR && !(kn->flags & KERNFS_REMOVING))
 		set_nlink(inode, kn->dir.subdirs + 2);
 }
 
-- 
2.53.0.414.gf7e9f6c205-goog

