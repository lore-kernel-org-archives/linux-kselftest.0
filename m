Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A99246783
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 00:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770683911; cv=none; b=PoAjUHTDtvnddk2mPUI5i9Fx1Jc8VSPShJNrPsst8+LM8gPwVPYWqqKvH6iy5sf/2iiC1oLWxqKeml8vcFUQE/GlAvRmSQxmjo7aZJl5EA09h9L8iyCfGAsEPjysTuwXDX9YW4P2JZNkbAncxtQStEzovzBMw0IYm/ozhfSArxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770683911; c=relaxed/simple;
	bh=xUZ6aO6Vonw0GmRwLJmSzeGDgxD5B5jYUwBGyhliZYQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m2mXDh4rOPEy2l4CNFB4pJJTsD2GVwn1Q7dKxvXMWcqOkET6NNX24C3KzK6d629OaQXapJTL+A2qswiaXQ1RJLLfY+7MEySJjtGZX7v4AfdpvGCD3FuG0zXswCZP95NXf0uzqzhNdoMs+AbwuPwfZg0e2X3+CLRnxDV/Hq2miFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RWcy9Fsr; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RWcy9Fsr"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-81f2481ab87so294651b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Feb 2026 16:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770683909; x=1771288709; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tip76l+g47OdHjbnqUq9WcMpsS2PZvPoe5KfSjLBVzA=;
        b=RWcy9FsrN2bax19CnztshhDysUsqmrhqmi0k6shl208zzWKSDywAMQERfNmyU7nleo
         XpZ3ldY0rK4GxtXzmZQis9Qn5wWQFTdoc4r04IPIqGXEmJzDwJQFSVlQAa3wet3DKJ5N
         jO+iwQNPIB0+SaSmOqfck9sk5dsk8wlGAUO5Bpif2synIclkS/ytxycKK+L9/bsKDbgT
         OjisM9QdKqa4Rp81cEDmX3c4Auhsq0yFCZw6V24lzngK3ZJXT9Dwjy4NDvRupvDB3mrP
         gvxhhf7ntwn+8OCdRbOJFntwPTTN20AEL69bAGhpgGPrN4NJyZFeBxyguiQszaQjU2T/
         C7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770683909; x=1771288709;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tip76l+g47OdHjbnqUq9WcMpsS2PZvPoe5KfSjLBVzA=;
        b=NKK/MAAjfVbOtCmiazUkAPqd9qgQQsSxKC48RawcXq7lJMNDpbOV3ZXYuezpyHrO0x
         QQ9TDYXkl7GLL0lsBHvKIFCIiB2a/2y4EB7uteFZh6h8Li5RR0DUEg8RC/FtPlThXrwP
         TuiOrXNi8uL20b2YVaUHP8Q8OzT0R9FPI1LQkCUFY9FCG9YRoK42/hFMzNfN4BkwluXu
         nfPmkR/UwUYFXlkngrA385dRzaydMSOFs6D0U5Y73VK8KB3FYiolA/75mzOUwxHCUygr
         JvNLwrVQa5K6Mel54B+tO+TA3dWJdYHNYP3P1yG1LARvJj4FKNK4DcF4UZctRgQq3yJI
         1S8A==
X-Forwarded-Encrypted: i=1; AJvYcCXXlJlhtNICy9utL0SSQuDpAukMUpvPhCxv0/qz7zYHPMXrWpAXSyW8RDK15CsR1E2Xv8aq96ELWJ5vDy5EuGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAnINV9bKkM6uj3kW5ZTyQBoDnuiM5NohOkQuDpxOpr2apENIK
	Fy2LjosD/C7gt1GocbCvo4T1dV8yoaDNSQJzgDsEiZZHz5Cb0omuEy0+fKdOyZ3jnDe+U6dMy8j
	MxHA7rYgND88oV2f8mA==
X-Received: from pfbls21.prod.google.com ([2002:a05:6a00:7415:b0:822:4e8c:2c9e])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3914:b0:823:9e5:855e with SMTP id d2e1a72fcca58-824413c8e09mr12457964b3a.0.1770683909153;
 Mon, 09 Feb 2026 16:38:29 -0800 (PST)
Date: Mon,  9 Feb 2026 16:37:59 -0800
In-Reply-To: <20260210003801.2834976-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260210003801.2834976-1-tjmercier@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260210003801.2834976-2-tjmercier@google.com>
Subject: [PATCH 1/3] kernfs: allow passing fsnotify event types
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
2.53.0.rc2.204.g2597b5adb4-goog

