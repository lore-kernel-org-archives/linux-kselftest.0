Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D6933C189
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 22:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772058856; cv=none; b=mdy/FvpTj/dRBFTwIrCeXQqkjGw3LJsxvEkttD194DDDW3dik4/I2x53GjyuLxye83vRbkbjbHKOF+I3izgKzqViqtlGgl84dEhyCxB3prs7I2YBPeLnopI7RPnARPxPzGSgNl+XUb7NZUUAcIihginSrult0ky2+kGhOBoPCmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772058856; c=relaxed/simple;
	bh=d/Njxo6LsxfyrmnJNgQrbf4Jrkxu+B4X3AZ0DsjVEVo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SpEbpM6yEvTBDBeP3lKiFVLW2TqCiq8I7ZLs9QoDaoyV9bu7gBbCIlSwMvBUj9LA8bIfiVDTqlcGhV4lticJK6wTB3pIfAvRq2wTU2Ip8PJZLQrRQkKWLP7DutfjrSgCWD0vP11LJBBgsAbbrQf4vr5E3Z/GTN59hAWdqenvcdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BxzG4G3L; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BxzG4G3L"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-824f75919f4so730278b3a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 14:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772058854; x=1772663654; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ej8LZF1b2o/Ks4R9g/3WwRmZsBfUCiZmdJJkOcGo2tM=;
        b=BxzG4G3LajyWmNwxkvDlwpBcseYaD7ZbGndoatMSkBckWFxRfxbphZtibZ0hyraLjE
         Kl10IbA+mdZ32WOc6bbNFoMajjDCVWlXW2FDSPFQyOmfCaoCW1aoRg8Vuw4i8d7DdPCZ
         u69sgXA9X1oIeXkAb2reT67dShvUYVs7nJ79FiAUJv++cS349qRgf7EoNYbNs2UeRY+j
         o3MckmvdIhfSHceJBaSjUbrTSOgWXofI/CrlR54a+ydm7a7n4Ld/M9AwyrSMEGhGI3xC
         +/JOek7nLoMpUlB4CvMOIVx4GZ4LalpntsluNLyqeItkaRTOKt7rXOCSMMXpQtZrpJNZ
         DKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772058854; x=1772663654;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ej8LZF1b2o/Ks4R9g/3WwRmZsBfUCiZmdJJkOcGo2tM=;
        b=FJjFpgX+Qc+V+fRFl41WnsVU+kgD97iE8N9E/sftyoiBhEdsMQTOX/+flFdxpEgW9+
         XTUfTOrpxXLo5OSbOnC+1c6WPyxZsZ/MrNxKpzuatA+EuIHQFraBWbB9CET6aBYh47sT
         fXRuC5xOIl3XZKOxrMllsHqk4BkT2jh9T0VwnlWI+onvJ7fVUyUCyDwQ+G0aAjJe2iu+
         Gx+bacdcX9yMRA+2cwj/TYvgg/3JW8xEMiQRtgZ+iOqWfrV9UDL7DETGk39o7AYR7eug
         20A8iKUTbjo5SWlwI/hlc3hH/c38BKnONXiSx7r3qa9jpgnwjP9LqGdNwhYvco6PhzHz
         1D+A==
X-Forwarded-Encrypted: i=1; AJvYcCXT6JY89z80a4+q0idOVUR8Re2IPui3a5Bg9b1omhK+dO4tWEhG4SnbRugkYKM0xCDD2M8LZNG0Fs4Kao5G61s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCV0L1MWd3Uupi6oLbXs9Z5T+bu1crRxh6H0mCX/X5yKwU6c4f
	M2BQgSlOk2sgVzEUun1RPmuZvGNzGvgeEIFo6zrFM0+KcKM1vdkCyyIpBeaYrN3r+Rj6poa4w9A
	HRyflvN+f6/De434ePg==
X-Received: from pfbey14.prod.google.com ([2002:a05:6a00:38ce:b0:824:b235:888c])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:930a:0:b0:823:533d:5559 with SMTP id d2e1a72fcca58-826da9ee9b0mr17908704b3a.39.1772058854168;
 Wed, 25 Feb 2026 14:34:14 -0800 (PST)
Date: Wed, 25 Feb 2026 14:34:02 -0800
In-Reply-To: <20260225223404.783173-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260225223404.783173-1-tjmercier@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225223404.783173-2-tjmercier@google.com>
Subject: [PATCH v5 1/3] kernfs: Don't set_nlink for directories being removed
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

