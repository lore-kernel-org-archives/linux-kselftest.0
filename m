Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E2B32FA29
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 05:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771566921; cv=none; b=ixTxk7clWUc6IFk+nAAYlYf0mvMHwpSnn46qLc9+XIF+rTSb7IQkQR4MHJ2oaJFgLeUWl5k+sPmYdPy0PKl/WP3pE3aV5LHrEBpx+De3PGmiJ8UOU19W0viwdjnT3Q4nDctSJeDWVUzx8xPt0LShomuo9WVzdsBCWQx4bYxtpEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771566921; c=relaxed/simple;
	bh=yUmonH/CIzK5lTEiC0IVbnht7EAF3Vi0dnZPfCMsJ2Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c3kA4vy5oIFAG+jilbeC0bbYHpHVHDbyCm7XbKNRT6m2RG598YseNuRex/KdAIp1v0bUrMvO8+ZdwYsqTLYRhByiy1wG4NaGE1CK4bCI1ragCYN3RtwxkZ9J+kdEeqPVAh57HIsiCi76t99vq+vMFaxU5BJwMMNJdxVdUaFd4oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zR6xDTLP; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zR6xDTLP"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-35678f99c6eso1159342a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 21:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771566918; x=1772171718; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gZMtE/y1E7pRM+BgrGCWh1tlQyBGUgnD2quexZvuA3I=;
        b=zR6xDTLPIPyJj2ALo9HaoWuJs6szIUR+nw7pPRGuF1WpLcPk8rr+gjBHszKvgOwDDS
         5J2thD5hWM+ZTTf4OSQm9HHXsb0VlkjqmId4q83snqdN/xQRaaTwcZshS31qA4eRsrgi
         wU4B/xGC2OLSknGeix8ezWoR4h7rbKLFShQgQHLoM0T+Wha6tStVyWhXSXsrCvCFsLDi
         aNM0lHBpHipClhsx4YeeFho7V6/WKMy3V3S9BDX3zrDGarJe8SQXixmSGCQnxv64lJIr
         VboUZBfNEMKuZKR9spnhZk6zz847djmH3lmWDfxxwVl9qbIr9r/LGt/Q7WoTg8RBkjv2
         JhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771566918; x=1772171718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gZMtE/y1E7pRM+BgrGCWh1tlQyBGUgnD2quexZvuA3I=;
        b=L98NJcVzgQEMKh+Mv8KhagTcbcIlxboP8PN5J+tGNyM/VL9Lc5ftbJktepPcg4d4xo
         p/xAloUryIJS/1mBHeuOdDLD5ni4ZKO2uIH/8vniWZiublkhWi/oVhsHvTmyzqUznCul
         IQjqUL1Vbhh66SJWseMIWif+1DgmBP+6lcOzICJ6E2I2RDXkpit9fN+/PduOjJ1P7tSi
         X1mMgaYX+8gdoD1+g1WeItewJVjO/fXatwJWukbcwCeg/pu/lM4zhzl54ol+oYo+5oBt
         sA8sFZd5z5Jg7+bCD2fIucwsaVt4vHTWE1hQfe4EfDCQ+r1l9rIr2wi2q1u70mveecpd
         4kMg==
X-Forwarded-Encrypted: i=1; AJvYcCWVV4SIltb8NncloCdny8Vn5dD0gVNv76SGwiisuKdaXsnKtbN1qpuR+4zX48Ia9932CNjdf4jQs67tLiPtwy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSH/1T5CsCrG7xVLVzoPHAMq+DPhqPLIm6CfUxAjniGO80GciX
	rvLKv8zEJY3mMZTgaqyKzSg24DvIelRQYBNjOfbH6M1sx2V0SluAjJoLzRXOXAWbPgsHeHvkWbc
	/Lo3aDpvy+5bXG9m83Q==
X-Received: from pgac4.prod.google.com ([2002:a05:6a02:2944:b0:c66:4148:f3f6])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:918e:b0:38c:792:56b0 with SMTP id adf61e73a8af0-394839d9911mr18666582637.38.1771566917867;
 Thu, 19 Feb 2026 21:55:17 -0800 (PST)
Date: Thu, 19 Feb 2026 21:54:47 -0800
In-Reply-To: <20260220055449.3073-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260220055449.3073-3-tjmercier@google.com>
Subject: [PATCH v4 2/3] kernfs: Send IN_DELETE_SELF and IN_IGNORED
From: "T.J. Mercier" <tjmercier@google.com>
To: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, amir73il@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Cc: "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently some kernfs files (e.g. cgroup.events, memory.events) support
inotify watches for IN_MODIFY, but unlike with regular filesystems, they
do not receive IN_DELETE_SELF or IN_IGNORED events when they are
removed. This means inotify watches persist after file deletion until
the process exits and the inotify file descriptor is cleaned up, or
until inotify_rm_watch is called manually.

This creates a problem for processes monitoring cgroups. For example, a
service monitoring memory.events for memory.high breaches needs to know
when a cgroup is removed to clean up its state. Where it's known that a
cgroup is removed when all processes die, without IN_DELETE_SELF the
service must resort to inefficient workarounds such as:
  1) Periodically scanning procfs to detect process death (wastes CPU
     and is susceptible to PID reuse).
  2) Holding a pidfd for every monitored cgroup (can exhaust file
     descriptors).

This patch enables IN_DELETE_SELF and IN_IGNORED events for kernfs files
and directories by clearing inode i_nlink values during removal. This
allows VFS to make the necessary fsnotify calls so that userspace
receives the inotify events.

As a result, applications can rely on a single existing watch on a file
of interest (e.g. memory.events) to receive notifications for both
modifications and the eventual removal of the file, as well as automatic
watch descriptor cleanup, simplifying userspace logic and improving
efficiency.

There is gap in this implementation for certain file removals due their
unique nature in kernfs. Directory removals that trigger file removals
occur through vfs_rmdir, which shrinks the dcache and emits fsnotify
events after the rmdir operation; there is no issue here. However kernfs
writes to particular files (e.g. cgroup.subtree_control) can also cause
file removal, but vfs_write does not attempt to emit fsnotify events
after the write operation, even if i_nlink counts are 0. As a usecase
for monitoring this category of file removals is not known, they are
left without having IN_DELETE or IN_DELETE_SELF events generated.

Suggested-by: Jan Kara <jack@suse.cz>
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 fs/kernfs/dir.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 5b6ce2351a53..41541b969fb2 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -1471,6 +1471,23 @@ void kernfs_show(struct kernfs_node *kn, bool show)
 	up_write(&root->kernfs_rwsem);
 }
 
+static void kernfs_clear_inode_nlink(struct kernfs_node *kn)
+{
+	struct kernfs_root *root = kernfs_root(kn);
+	struct kernfs_super_info *info;
+
+	lockdep_assert_held_read(&root->kernfs_supers_rwsem);
+
+	list_for_each_entry(info, &root->supers, node) {
+		struct inode *inode = ilookup(info->sb, kernfs_ino(kn));
+
+		if (inode) {
+			clear_nlink(inode);
+			iput(inode);
+		}
+	}
+}
+
 static void __kernfs_remove(struct kernfs_node *kn)
 {
 	struct kernfs_node *pos, *parent;
@@ -1479,6 +1496,7 @@ static void __kernfs_remove(struct kernfs_node *kn)
 	if (!kn)
 		return;
 
+	lockdep_assert_held_read(&kernfs_root(kn)->kernfs_supers_rwsem);
 	lockdep_assert_held_write(&kernfs_root(kn)->kernfs_rwsem);
 
 	/*
@@ -1522,9 +1540,11 @@ static void __kernfs_remove(struct kernfs_node *kn)
 			struct kernfs_iattrs *ps_iattr =
 				parent ? parent->iattr : NULL;
 
-			/* update timestamps on the parent */
 			down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
 
+			kernfs_clear_inode_nlink(pos);
+
+			/* update timestamps on the parent */
 			if (ps_iattr) {
 				ktime_get_real_ts64(&ps_iattr->ia_ctime);
 				ps_iattr->ia_mtime = ps_iattr->ia_ctime;
@@ -1553,9 +1573,11 @@ void kernfs_remove(struct kernfs_node *kn)
 
 	root = kernfs_root(kn);
 
+	down_read(&root->kernfs_supers_rwsem);
 	down_write(&root->kernfs_rwsem);
 	__kernfs_remove(kn);
 	up_write(&root->kernfs_rwsem);
+	up_read(&root->kernfs_supers_rwsem);
 }
 
 /**
@@ -1646,6 +1668,7 @@ bool kernfs_remove_self(struct kernfs_node *kn)
 	bool ret;
 	struct kernfs_root *root = kernfs_root(kn);
 
+	down_read(&root->kernfs_supers_rwsem);
 	down_write(&root->kernfs_rwsem);
 	kernfs_break_active_protection(kn);
 
@@ -1675,7 +1698,9 @@ bool kernfs_remove_self(struct kernfs_node *kn)
 				break;
 
 			up_write(&root->kernfs_rwsem);
+			up_read(&root->kernfs_supers_rwsem);
 			schedule();
+			down_read(&root->kernfs_supers_rwsem);
 			down_write(&root->kernfs_rwsem);
 		}
 		finish_wait(waitq, &wait);
@@ -1690,6 +1715,7 @@ bool kernfs_remove_self(struct kernfs_node *kn)
 	kernfs_unbreak_active_protection(kn);
 
 	up_write(&root->kernfs_rwsem);
+	up_read(&root->kernfs_supers_rwsem);
 	return ret;
 }
 
@@ -1716,6 +1742,7 @@ int kernfs_remove_by_name_ns(struct kernfs_node *parent, const char *name,
 	}
 
 	root = kernfs_root(parent);
+	down_read(&root->kernfs_supers_rwsem);
 	down_write(&root->kernfs_rwsem);
 
 	kn = kernfs_find_ns(parent, name, ns);
@@ -1726,6 +1753,7 @@ int kernfs_remove_by_name_ns(struct kernfs_node *parent, const char *name,
 	}
 
 	up_write(&root->kernfs_rwsem);
+	up_read(&root->kernfs_supers_rwsem);
 
 	if (kn)
 		return 0;
-- 
2.53.0.414.gf7e9f6c205-goog

