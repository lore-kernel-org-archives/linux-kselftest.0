Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730A835DCFF
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 21:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770933512; cv=none; b=AJB3cCyZ0Tapmx1k3+B5rmqop2YNGirHiDaW/alQqKKkdviH+hKRCgzI+SfD9rtV7J86z9zZPzK0OgkEaUJEDPOi4vsxn5DBLPhVYxjZcjldbgp/XewdvAlINeLx7ALxnF/UyKIUFCn5MZ+nAB2UpvZv6vZ4vdsTKW2yHVZrai8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770933512; c=relaxed/simple;
	bh=cddz7yiNNtZcRMbECFzY2RrBpOd+pdNNI+Dx9a521G0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tv12PA6dcOcinSe1D6MUe6B70wa/jBqELr0thpuPYIkG7ZsLG2+XJCSG+sCafSsveF51V73AV8GeuLtrOo23suNun3abWY9X/Xfk3XMJQH0S/ZrDLI1lP8pL+xAPK7doQgjecncNtZDe6z6bwKLKjpxriQbE4BSNq8VYT0vkL0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OgOaRaf3; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OgOaRaf3"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-354bee18a62so236068a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 13:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770933511; x=1771538311; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F9QIJ7/JNUJlnhiwP3aDc1NcdR+8wgC780wGHRVk+o8=;
        b=OgOaRaf37vhBtHyCrP3d6E4o6GDVE174CiT1tFdoq35UW+RZumKLiGLZhVNorLvyLH
         VK009YlDwcnMrFrOVNfprc01roOhwIUuFiVRy1gq9etX/MnTIOVu9xfxgOzhXpc288gu
         MvwJDLqHydjFUmUuSBL6OvVf0c25o/7Bfqgv130ieL4UZPRAHTV1GbGmAbM8f8f26muW
         oGhHN6yNqqC5iNATmJG32MmJegxnETit56bLO/QTq0zIlFXKdNmtFaAQuSjeAlb2kzT7
         wDBxPc1y6Hso9hIkc8PDGMx+ChE1/MJ1kXvSa34JIgWra1TXhMQr/yneGpuWUZNvoe7/
         WgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770933511; x=1771538311;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F9QIJ7/JNUJlnhiwP3aDc1NcdR+8wgC780wGHRVk+o8=;
        b=Vx2F5SjNIRUncafDpEb6ZssAQ/YkBmfgYaqsk8PA05T8rt6xszb8SuLD20y+CoffVv
         Y/9NVUgYiC3G2NKQXQhVe4iOSiXEuPiYkPML/sFnMqmQgHIgukPRBhMRVXu3/hNwotwD
         zR7tywbEq32UD5tTfNjZbsDUkYjW5tyO90jIhcmQ5ZSHQqy9G9XubTymY1F+UdE65+oA
         ysAufMf20L+bGcx+3pZW69HpATCbKAHXFLvIFt4ZJeue4hg9+SWMOilxAYZ5Jlubusod
         0eMI3Io04knW7Q6hiXJTGbbKLcJAToyGyrq3Wcn1ADR1PYYhl9RIKUHnskx6YvGNx3jJ
         GMZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmvZUKhidipTiZQNKhx//re1/3nlSVisUAoYihh9vKq+q0YnsohfbDUb+NIV9Huh1WsscI20p6X0vzol3c2Ps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3YHVMASyF9aI26NG9iswAsjB7FuJeMC3/0wG6dllHdro7xZvV
	KgzThntFi8I+i+bG+pJZzeg71mMR7scxhWw3MVaRDSMjWpKOHQlj06QZBKU5VGmD9dC7w5K7gPR
	RXJ32LRbFt9aedovZ3g==
X-Received: from pjob16.prod.google.com ([2002:a17:90a:8c90:b0:34b:e29d:f74c])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2d90:b0:356:22ef:57b9 with SMTP id 98e67ed59e1d1-356a7641a8emr399373a91.3.1770933510727;
 Thu, 12 Feb 2026 13:58:30 -0800 (PST)
Date: Thu, 12 Feb 2026 13:58:12 -0800
In-Reply-To: <20260212215814.629709-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260212215814.629709-1-tjmercier@google.com>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
Message-ID: <20260212215814.629709-2-tjmercier@google.com>
Subject: [PATCH v2 1/3] kernfs: allow passing fsnotify event types
From: "T.J. Mercier" <tjmercier@google.com>
To: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

The kernfs_notify function is hardcoded to only issue FS_MODIFY events
since that is the only current use case. Allow for supporting other
events by adding a notify_event field to kernfs_elem_attr. The
limitation of only one queued event per kernfs_node continues to exist
as a consequence of the design of the kernfs_notify_list. The new
notify_event field is protected by the same kernfs_notify_lock as the
existing notify_next field.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 fs/kernfs/file.c       | 8 ++++++--
 include/linux/kernfs.h | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
index 9adf36e6364b..e978284ff983 100644
--- a/fs/kernfs/file.c
+++ b/fs/kernfs/file.c
@@ -914,6 +914,7 @@ static void kernfs_notify_workfn(struct work_struct *work)
 	struct kernfs_node *kn;
 	struct kernfs_super_info *info;
 	struct kernfs_root *root;
+	u32 notify_event;
 repeat:
 	/* pop one off the notify_list */
 	spin_lock_irq(&kernfs_notify_lock);
@@ -924,6 +925,8 @@ static void kernfs_notify_workfn(struct work_struct *work)
 	}
 	kernfs_notify_list = kn->attr.notify_next;
 	kn->attr.notify_next = NULL;
+	notify_event = kn->attr.notify_event;
+	kn->attr.notify_event = 0;
 	spin_unlock_irq(&kernfs_notify_lock);
 
 	root = kernfs_root(kn);
@@ -954,7 +957,7 @@ static void kernfs_notify_workfn(struct work_struct *work)
 		if (parent) {
 			p_inode = ilookup(info->sb, kernfs_ino(parent));
 			if (p_inode) {
-				fsnotify(FS_MODIFY | FS_EVENT_ON_CHILD,
+				fsnotify(notify_event | FS_EVENT_ON_CHILD,
 					 inode, FSNOTIFY_EVENT_INODE,
 					 p_inode, &name, inode, 0);
 				iput(p_inode);
@@ -964,7 +967,7 @@ static void kernfs_notify_workfn(struct work_struct *work)
 		}
 
 		if (!p_inode)
-			fsnotify_inode(inode, FS_MODIFY);
+			fsnotify_inode(inode, notify_event);
 
 		iput(inode);
 	}
@@ -1005,6 +1008,7 @@ void kernfs_notify(struct kernfs_node *kn)
 	if (!kn->attr.notify_next) {
 		kernfs_get(kn);
 		kn->attr.notify_next = kernfs_notify_list;
+		kn->attr.notify_event = FS_MODIFY;
 		kernfs_notify_list = kn;
 		schedule_work(&kernfs_notify_work);
 	}
diff --git a/include/linux/kernfs.h b/include/linux/kernfs.h
index b5a5f32fdfd1..1762b32c1a8e 100644
--- a/include/linux/kernfs.h
+++ b/include/linux/kernfs.h
@@ -181,6 +181,7 @@ struct kernfs_elem_attr {
 	struct kernfs_open_node __rcu	*open;
 	loff_t			size;
 	struct kernfs_node	*notify_next;	/* for kernfs_notify() */
+	u32			notify_event;   /* for kernfs_notify() */
 };
 
 /*
-- 
2.53.0.273.g2a3d683680-goog

