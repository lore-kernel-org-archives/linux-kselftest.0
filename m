Received: from mta0.migadu.com (out-48.mta0.migadu.com [91.218.175.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C1F3803D3
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 04:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408237; cv=none; b=qisWBcaYDRJ5f0NbHBHtF4FYLK8w5WQTiBW/T95Bzzxb9voXQ/jEr8bU2Ax19m74pQACuQuSFqGAP0kgfpv9P5+6JgkuFBTk6owTn+0rgigHSsiOBDr39ycYWPT8G2AuMvVmq/ZR6Kppft7GLBI7PHcYDpxhtYHjDKUybrEKTHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408237; c=relaxed/simple;
	bh=9i77V11fdjrITPS9e5stuvj83XMA0hsSdLksE3ZmQPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IuviK5KY5hJv7upF+U3PcLXAP3xMLEJAEEMpcgR4Ms6XWN3D3dVZY2r1f10VBo22eFgT7MmHCgkLP3shgf0TOKpAW9HbbD5Hb6wHympMszyQwZlj25bFU7uNeto6z4rnxMxAKLhir0Ny0a/hxaeUqXFDUK5PPL++psXkttt4WPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sz4meoph; arc=none smtp.client-ip=91.218.175.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sz4meoph"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9i77V11fdjrITPS9e5stuvj83XMA0hsSdLksE3ZmQPg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788408233; v=1; x=1789013033;
 b=sz4meoph4t9rarEZwEQtNa5wx29cPTFdHtY3etWfVraPLfm2K1dskPoe3Qe+zDQ1Xzma7hgs
 1ZbM+zBQeh+qE7ie1uaSKuzor5FhuBVQYFjgBs03KLIFQt25EJVio3wJJZLRiZHVXjSu2eZ2RLO
 2a5/1tVyF74anx7KGhmwBV/w=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b8bef4dfbb207c2e;
	Thu, 03 Sep 2026 04:03:43 +0000
X-Mizu-Trace-ID: b8bef4dfbb207c2e
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Christian Brauner <christian@brauner.io>
Cc: Meta kernel team <kernel-team@meta.com>,
	linux-kselftest@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] kernfs: take kernfs_rename_lock for same-parent renames too
Date: Wed,  2 Sep 2026 21:02:51 -0700
Message-ID: <20260903040253.670020-1-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernfs_rename_ns() only takes kernfs_rename_lock when the rename moves
the node to a new parent.  A rename that keeps the same parent, like
renaming a network interface, changes kernfs_node::name with only
kernfs_rwsem held.  So the lock protects ->__parent but not ->name, and
a reader that wants a stable name has to take kernfs_rwsem, the same
lock every path lookup needs.

That also makes for a small but real bug.  kernfs_path_from_node()
takes kernfs_rename_lock for reading, and kernfs_path_from_node_locked()
then reads the name of each ancestor.  It reads each one once, so a
single same-parent rename only moves the answer from the old path to the
new one, but two of them landing inside one walk build a path that never
existed:

  CPU0                                   CPU1
  kernfs_path_from_node() on /a/b/c
    reads the name of a, gets "a"
                                         renames a to a2
                                         renames b to b2
    reads the name of b, gets "b2"
    returns "/a/b2/c"

This hits roots without KERNFS_ROOT_INVARIANT_PARENT: sysfs, where the
bad path can reach sysfs_warn_dup() and pr_cont_kernfs_path(), and
resctrl, which renames a mon group inside its mon_groups directory.
cgroup sets the flag, so it skips the lock and reads names under RCU
alone; that case needs something else and is not addressed here.

So take the lock in both cases, and let kernfs_rcu_name() accept it the
way kernfs_parent() already does for ->__parent.  Same-parent renames
are rare, the lock is per filesystem, and the locked section is at most
three stores.  It also gives a future rename sequence counter one place
to sit that covers every rename.

Fixes: 741c10b096bc ("kernfs: Use RCU to access kernfs_node::name.")
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 fs/kernfs/dir.c             | 28 +++++++++++++++-------------
 fs/kernfs/kernfs-internal.h |  9 ++++++++-
 2 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index cd7a8ff8b6b2..214c97130a8a 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -1808,6 +1808,7 @@ int kernfs_rename_ns(struct kernfs_node *kn, struct kernfs_node *new_parent,
 	struct kernfs_node *old_parent;
 	struct kernfs_root *root;
 	const char *old_name;
+	bool reparent;
 	int error;
 
 	/* can't move or rename root */
@@ -1857,25 +1858,26 @@ int kernfs_rename_ns(struct kernfs_node *kn, struct kernfs_node *new_parent,
 	 */
 	kernfs_unlink_sibling(kn);
 
-	/* rename_lock protects ->parent accessors */
-	if (old_parent != new_parent) {
+	reparent = old_parent != new_parent;
+	if (reparent)
 		kernfs_get(new_parent);
-		write_lock_irq(&root->kernfs_rename_lock);
 
+	/*
+	 * kernfs_rename_lock protects ->__parent, ->ns and ->name, so take it
+	 * even when the parent does not change.
+	 */
+	write_lock_irq(&root->kernfs_rename_lock);
+
+	if (reparent)
 		rcu_assign_pointer(kn->__parent, new_parent);
+	WRITE_ONCE(kn->ns, new_ns);
+	if (new_name)
+		rcu_assign_pointer(kn->name, new_name);
 
-		WRITE_ONCE(kn->ns, new_ns);
-		if (new_name)
-			rcu_assign_pointer(kn->name, new_name);
+	write_unlock_irq(&root->kernfs_rename_lock);
 
-		write_unlock_irq(&root->kernfs_rename_lock);
+	if (reparent)
 		kernfs_put(old_parent);
-	} else {
-		/* name assignment is RCU protected, parent is the same */
-		WRITE_ONCE(kn->ns, new_ns);
-		if (new_name)
-			rcu_assign_pointer(kn->name, new_name);
-	}
 
 	kn->hash = kernfs_name_hash(new_name ?: old_name, kn->ns);
 	kernfs_link_sibling(kn);
diff --git a/fs/kernfs/kernfs-internal.h b/fs/kernfs/kernfs-internal.h
index 20a0cf42ba8d..1609c1519698 100644
--- a/fs/kernfs/kernfs-internal.h
+++ b/fs/kernfs/kernfs-internal.h
@@ -117,7 +117,14 @@ static inline bool kernfs_rename_is_locked(const struct kernfs_node *kn)
 
 static inline const char *kernfs_rcu_name(const struct kernfs_node *kn)
 {
-	return rcu_dereference_check(kn->name, kernfs_root_is_locked(kn));
+	/*
+	 * Like kernfs_node::__parent below, the name is only replaced under
+	 * both kernfs_root::kernfs_rwsem and kernfs_root::kernfs_rename_lock,
+	 * so either one keeps it, and the string it points at, stable.
+	 */
+	return rcu_dereference_check(kn->name,
+				     kernfs_root_is_locked(kn) ||
+				     kernfs_rename_is_locked(kn));
 }
 
 static inline struct kernfs_node *kernfs_parent(const struct kernfs_node *kn)
-- 
2.53.0-Meta

