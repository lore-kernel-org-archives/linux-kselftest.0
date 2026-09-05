Received: from mta1.migadu.com (out-73.mta1.migadu.com [95.215.58.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948AA23AB9D
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 19:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788635797; cv=none; b=V1xrMMnwAnM5eT27CozPQtnaMVF0eZf2v7h8ITrSVNIvy6brpxmDY61JdbP+JE2L/zT2rm/mvcblbIXsJIHChXTUcBrU8VnnBY7KekNgeAODxnxLlLEqErFZqodH4G6/Uk/+VoglNs1S8eOkzNWT3fSFprHHHXIqvSHorww0phg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788635797; c=relaxed/simple;
	bh=WBt1gcOUPcF87z43kqy+nFmn0uUqQjGuY1EyXbG1LBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2137uC99xxxyb3FVGQdAFQNeWzCTjnH1rltZ3GHvUggphlyRAvjXKTr5envsjDyg4kI283ougDC2rUQfPO8Zy+sGrmQgAL0Itbwm9bjW1QT8EeO8oUaFOwr+Qq7XPvMRaq/9nff3z1VP5wSrcUd0jmZJb30CEeq+K+R+ZCWopU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=i1oub85v; arc=none smtp.client-ip=95.215.58.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="i1oub85v"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WBt1gcOUPcF87z43kqy+nFmn0uUqQjGuY1EyXbG1LBQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788635793; v=1; x=1789240593;
 b=i1oub85vWS5K6QE1qpWSn0xDcsvPFitddUJfVsdJt04OzztOOdq4mmkC640W9AVl3+v5NcQd
 yt0mTPvyqwMs+1ywDKuxhmPBqkJtmuZBG++/7UoINEnc3ylpRbYh4BsjD6HSe8yKhWCKFTb4cyD
 wlk/5Dkb1EMu83MsznTWY7ps=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 122d4c13fd44d7d5;
	Sat, 05 Sep 2026 19:16:33 +0000
X-Mizu-Trace-ID: 122d4c13fd44d7d5
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Christian Brauner <christian@brauner.io>
Cc: Meta kernel team <kernel-team@meta.com>,
	linux-kselftest@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] kernfs: take kernfs_rename_lock for same-parent renames too
Date: Sat,  5 Sep 2026 12:16:11 -0700
Message-ID: <20260905191613.3143937-3-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260905191613.3143937-1-shakeel.butt@linux.dev>
References: <20260905191613.3143937-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernfs_rename_ns() takes kernfs_rename_lock only when the rename moves
the node to a new parent.  A rename that keeps the parent, like renaming
a network interface, changes kernfs_node::name under kernfs_rwsem alone.
So the lock covers ->__parent but not ->name, and a reader that wants a
stable name has to take kernfs_rwsem, the lock every lookup needs.

It is also a real bug.  kernfs_path_from_node() holds the lock for
reading and reads each ancestor's name once.  One rename only moves the
answer from the old path to the new one, but two renames inside one walk
build a path that never existed:

  CPU0                                   CPU1
  kernfs_path_from_node() on /a/b/c
    reads the name of a, gets "a"
                                         renames a to a2
                                         renames b to b2
    reads the name of b, gets "b2"
    returns "/a/b2/c"

Only sysfs can hit this: sysfs_warn_dup() is the one caller on a root
without KERNFS_ROOT_INVARIANT_PARENT.  The rest are cgroup, which sets
the flag, so it skips the lock and reads names under RCU alone.  That
case needs something else and is left alone here.

So take the lock for both kinds of rename, and let kernfs_rcu_name()
accept it, like kernfs_parent() already does for ->__parent.  Renames
are rare, the lock is per filesystem, and the locked section is at most
three stores.  It also gives a future rename counter one place to sit.

Fixes: 741c10b096bc ("kernfs: Use RCU to access kernfs_node::name.")
Acked-by: Tejun Heo <tj@kernel.org>
Assisted-by: LLM
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

