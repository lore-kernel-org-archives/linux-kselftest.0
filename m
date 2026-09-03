Received: from mta0.migadu.com (out-43.mta0.migadu.com [91.218.175.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB5825CC79
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 04:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408234; cv=none; b=bSPmawOzHIj1yeRYTqsRR37MPtq5c/Iow1eyiI5ZOQEjDEwEbyZc6dsII7dxjB0zk2n680K/ArsOfEZ6g6SW84Hda6iYYrqwjxgTTMy7Zy1HsnEir3CGTA7y4P/WfRKAUuq8ZPx98kb3bkhaslZAcCdeSyroJiHhpDesIySt6cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408234; c=relaxed/simple;
	bh=xIQ6328uPha5Ej51WRnaGrlS19oTAvrX4j5xJxvcgUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/XlM0kiLcKVa+QN0Kppq91CTchZilRWVew5itcmrWS++c4HOx36ZrkW4Qqnk1U7KphZ/7gV2XNdPwBUWaW42TBIPjkTNnG6Jb0fLPGvKvtNkngjlwDO7jTc5Cen5kxwGWi6xoUNjOdTl4cfbUnFO64rxanSWA4aVOD0J/295Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m69SkJVA; arc=none smtp.client-ip=91.218.175.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m69SkJVA"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xIQ6328uPha5Ej51WRnaGrlS19oTAvrX4j5xJxvcgUU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788408230; v=1; x=1789013030;
 b=m69SkJVAcYUg5n0cTv8caE7Vww1YTSNpjF5EqTw7NBXqLR3bF4N396noKQEzDtdeaWzJ9GAf
 w/Lj/ryplDdNY5v8sTjK+T0WuGvJ4WHtHZuPZsuBADeOAVj7coek2z0RT+DHAjj7ZPDLhgEEN1R
 oW7R3n06OiAs6Np1rbcxavR4=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ba3584afaf9a3bb2;
	Thu, 03 Sep 2026 04:03:50 +0000
X-Mizu-Trace-ID: ba3584afaf9a3bb2
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Christian Brauner <christian@brauner.io>
Cc: Meta kernel team <kernel-team@meta.com>,
	linux-kselftest@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] kernfs: fix up the unlocked attribute reads on the creation paths
Date: Wed,  2 Sep 2026 21:02:53 -0700
Message-ID: <20260903040253.670020-3-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903040253.670020-1-shakeel.butt@linux.dev>
References: <20260903040253.670020-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two creation paths read a live node's attributes without holding
kernfs_iattr_rwsem, which kernfs_iop_setattr() takes for writing.  They
do not want the same fix.

kernfs_create_link() copies the target's ia_uid and then its ia_gid
into the new link.  A chown of the target between the two reads leaves
the link with the old uid and the new gid, an owner the target never
had, when copying the target's owner is the whole point.  Read both
fields under the rwsem.

kernfs_new_node() reads the parent's ia_gid for S_ISGID inheritance,
and that one does not care which value it gets: the node does not exist
yet, so nothing orders a racing chown against the creation either way.
Taking the rwsem there would only serialize creation under a set-gid
parent against a chown of that parent, to pick between two answers that
are both right.  Mark the field read data_race() instead.

The pointer that leads to it is a different matter: __kernfs_iattrs()
publishes kernfs_node::iattr with try_cmpxchg(), so there is no
unmarked write for that read to pair with, and both sides read it with
READ_ONCE() like the rest of fs/kernfs does.

The Fixes tag is for the symlink half.  kernfs_create_link() has read
the pair without a lock since it started copying the target's owner at
all; only the name of the lock its writer takes has changed since.  The
data_race() is a marking rather than a fix.

Fixes: 488dee96bb62 ("kernfs: allow creating kernfs objects with arbitrary uid/gid")
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 fs/kernfs/dir.c     | 16 +++++++++++++---
 fs/kernfs/symlink.c | 17 ++++++++++++++---
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 214c97130a8a..3997c02f0165 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -740,9 +740,19 @@ struct kernfs_node *kernfs_new_node(struct kernfs_node *parent,
 		/* this code block imitates inode_init_owner() for
 		 * kernfs
 		 */
-
-		if (parent->iattr)
-			gid = parent->iattr->ia_gid;
+		struct kernfs_iattrs *attrs = READ_ONCE(parent->iattr);
+
+		if (attrs) {
+			/*
+			 * Unlocked on purpose: the gid is inherited onto a
+			 * node that does not exist yet, so nothing orders a
+			 * racing chown against this creation, and either
+			 * value is correct.  The pointer above needs no such
+			 * marking, __kernfs_iattrs() publishes it with
+			 * try_cmpxchg().
+			 */
+			gid = data_race(attrs->ia_gid);
+		}
 
 		if (flags & KERNFS_DIR)
 			mode |= S_ISGID;
diff --git a/fs/kernfs/symlink.c b/fs/kernfs/symlink.c
index 90e2b3221b83..3e53105d3abf 100644
--- a/fs/kernfs/symlink.c
+++ b/fs/kernfs/symlink.c
@@ -31,9 +31,20 @@ struct kernfs_node *kernfs_create_link(struct kernfs_node *parent,
 	kuid_t uid = GLOBAL_ROOT_UID;
 	kgid_t gid = GLOBAL_ROOT_GID;
 
-	if (target->iattr) {
-		uid = target->iattr->ia_uid;
-		gid = target->iattr->ia_gid;
+	/*
+	 * A symlink takes its owner from its target, so both fields have to
+	 * come from the same moment: read them under kernfs_iattr_rwsem, or
+	 * a chown of the target racing this could leave the link with the
+	 * old uid and the new gid.  The section ends before kernfs_add_one()
+	 * takes kernfs_rwsem.
+	 */
+	scoped_guard(rwsem_read, &kernfs_root(target)->kernfs_iattr_rwsem) {
+		struct kernfs_iattrs *attrs = READ_ONCE(target->iattr);
+
+		if (attrs) {
+			uid = attrs->ia_uid;
+			gid = attrs->ia_gid;
+		}
 	}
 
 	kn = kernfs_new_node(parent, name, S_IFLNK|0777, uid, gid, KERNFS_LINK);
-- 
2.53.0-Meta

