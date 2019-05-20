From: cyphar@cyphar.com (Aleksa Sarai)
Date: Mon, 20 May 2019 23:32:59 +1000
Subject: [PATCH RFC v8 04/10] namei: split out nd->dfd handling to
 dirfd_path_init
In-Reply-To: <20190520133305.11925-1-cyphar@cyphar.com>
References: <20190520133305.11925-1-cyphar@cyphar.com>
Message-ID: <20190520133305.11925-5-cyphar@cyphar.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190520133259.deEVINMwBz-BgDCGHfxdLpvDqSP5LN3buj7XFIWxcC4@z>

Previously, path_init's handling of *at(dfd, ...) was only done once,
but with LOOKUP_BENEATH (and LOOKUP_IN_ROOT) we have to parse the
initial nd->path at different times (before or after absolute path
handling) depending on whether we have been asked to scope resolution
within a root.

Signed-off-by: Aleksa Sarai <cyphar at cyphar.com>
---
 fs/namei.c | 103 ++++++++++++++++++++++++++++++-----------------------
 1 file changed, 59 insertions(+), 44 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index 46c5302eea4a..dc323e25d4d2 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2251,9 +2251,59 @@ static int link_path_walk(const char *name, struct nameidata *nd)
 	}
 }
 
+/*
+ * Configure nd->path based on the nd->dfd. This is only used as part of
+ * path_init().
+ */
+static inline int dirfd_path_init(struct nameidata *nd)
+{
+	if (nd->dfd == AT_FDCWD) {
+		if (nd->flags & LOOKUP_RCU) {
+			struct fs_struct *fs = current->fs;
+			unsigned seq;
+
+			do {
+				seq = read_seqcount_begin(&fs->seq);
+				nd->path = fs->pwd;
+				nd->inode = nd->path.dentry->d_inode;
+				nd->seq = __read_seqcount_begin(&nd->path.dentry->d_seq);
+			} while (read_seqcount_retry(&fs->seq, seq));
+		} else {
+			get_fs_pwd(current->fs, &nd->path);
+			nd->inode = nd->path.dentry->d_inode;
+		}
+	} else {
+		/* Caller must check execute permissions on the starting path component */
+		struct fd f = fdget_raw(nd->dfd);
+		struct dentry *dentry;
+
+		if (!f.file)
+			return -EBADF;
+
+		dentry = f.file->f_path.dentry;
+
+		if (*nd->name->name && unlikely(!d_can_lookup(dentry))) {
+			fdput(f);
+			return -ENOTDIR;
+		}
+
+		nd->path = f.file->f_path;
+		if (nd->flags & LOOKUP_RCU) {
+			nd->inode = nd->path.dentry->d_inode;
+			nd->seq = read_seqcount_begin(&nd->path.dentry->d_seq);
+		} else {
+			path_get(&nd->path);
+			nd->inode = nd->path.dentry->d_inode;
+		}
+		fdput(f);
+	}
+	return 0;
+}
+
 /* must be paired with terminate_walk() */
 static const char *path_init(struct nameidata *nd, unsigned flags)
 {
+	int error;
 	const char *s = nd->name->name;
 
 	if (!*s)
@@ -2287,52 +2337,17 @@ static const char *path_init(struct nameidata *nd, unsigned flags)
 
 	nd->m_seq = read_seqbegin(&mount_lock);
 	if (*s == '/') {
-		set_root(nd);
-		if (likely(!nd_jump_root(nd)))
-			return s;
-		return ERR_PTR(-ECHILD);
-	} else if (nd->dfd == AT_FDCWD) {
-		if (flags & LOOKUP_RCU) {
-			struct fs_struct *fs = current->fs;
-			unsigned seq;
-
-			do {
-				seq = read_seqcount_begin(&fs->seq);
-				nd->path = fs->pwd;
-				nd->inode = nd->path.dentry->d_inode;
-				nd->seq = __read_seqcount_begin(&nd->path.dentry->d_seq);
-			} while (read_seqcount_retry(&fs->seq, seq));
-		} else {
-			get_fs_pwd(current->fs, &nd->path);
-			nd->inode = nd->path.dentry->d_inode;
-		}
-		return s;
-	} else {
-		/* Caller must check execute permissions on the starting path component */
-		struct fd f = fdget_raw(nd->dfd);
-		struct dentry *dentry;
-
-		if (!f.file)
-			return ERR_PTR(-EBADF);
-
-		dentry = f.file->f_path.dentry;
-
-		if (*s && unlikely(!d_can_lookup(dentry))) {
-			fdput(f);
-			return ERR_PTR(-ENOTDIR);
-		}
-
-		nd->path = f.file->f_path;
-		if (flags & LOOKUP_RCU) {
-			nd->inode = nd->path.dentry->d_inode;
-			nd->seq = read_seqcount_begin(&nd->path.dentry->d_seq);
-		} else {
-			path_get(&nd->path);
-			nd->inode = nd->path.dentry->d_inode;
-		}
-		fdput(f);
+		if (likely(!nd->root.mnt))
+			set_root(nd);
+		error = nd_jump_root(nd);
+		if (unlikely(error))
+			s = ERR_PTR(error);
 		return s;
 	}
+	error = dirfd_path_init(nd);
+	if (unlikely(error))
+		return ERR_PTR(error);
+	return s;
 }
 
 static const char *trailing_symlink(struct nameidata *nd)
-- 
2.21.0
