Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9424C33D6F8
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Mar 2026 17:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774115893; cv=none; b=NMLpNcPaIBSEk565DAHPjJ+1PgiA6mhrHQZT1D4B0ZdDWbY5Iib8YE51fPCwU2xWm8NwTQ3HlqAkgKdhrOtPkYLkhj1E/Cu8v46C9w2SowyUDetXrrRz0uXoXnUq5ch2S9TzlEb5DXwFQq/KF8QWQFuSJqbZYwgAWQxaWx4+SV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774115893; c=relaxed/simple;
	bh=czt3DDK3Q9LMgggKCBsqxDSoXwaqrRNd+/LUBmGAS7M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cE+v5+SDxHHfz5QQcL2/PPya/3vDB78LA0ON9ITdBl1W8H/y/fHEHFlSLaHslv3xdUy9VWNxZ0jDNxE1RgozSXFFPGz5diYRsttKOjp2xZZdD4O2sxoMI+XjKacjASsZEJptp25OnddroftTExTKr6qtX0kMH3P3h4q7KOkGpeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=eeH2h1Jk; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="eeH2h1Jk"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cfcb045909so210632485a.0
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Mar 2026 10:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1774115891; x=1774720691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBOfKv8+dSxaoWkBve3vKf+AERqgheSr1LH0+CQ4vtE=;
        b=eeH2h1JkCzGMbUaQ6P87k/z8iP+HDN1iG2Z74LGdO8E5oVf9yolKGANZFyTtwR1aIC
         Cql1PK8aHYfroynH1QaF6ZIGXG9a97+/tM3lfek+WQ8/ZEp1HSZxlJogqIVkAZdLnq3K
         V853lErWJV6HGhS3Bk6OJ7cUipTVIbJDaW+iDgE2ExMR9TE0JC3hte69EtnNLuDyif5z
         xiI2QkYsbtZ0F5Tm22OEHrxCaewFdDSjvZUpqAOY0H1aAzX6w0ag3tLb7otpQG1AuUWL
         etjb8uAMGB7heeuXMhtSLzbhnyoDoUMvgqok1N7kXdk+Vvzbvz/AfwDvSvmNVYny5hIr
         e9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774115891; x=1774720691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GBOfKv8+dSxaoWkBve3vKf+AERqgheSr1LH0+CQ4vtE=;
        b=Xt7Gu6199OszQCWfuSYUo4HWFazizMvceSK8loQP/uWdl+0TUfk91CgN7zKaeCSOdB
         69mFLOWyrbPk7ykoFuBTR9QCpi/AfLgySPMIyRmiLsrQxLAOomWGotUjTRIRORplQpxs
         IL1PnrI9fmZWgLn0XXItUl0902sKlU/DpYEy0Y35+U2DDClD9oZllMc4e6WGqlj/YFje
         6Osjs+BgSwqcXRSuxVEJzGBSY2HjxM+Nt3FqFugpmczvsw6DFCf2aCHFem6d+XXdMjFR
         OKmuAnNpTcOEhCS+PtNo8Kfwdszh2RT2ArZu2f7U101tEmb5Zr+tCda6LrJz0ZKzWZ3u
         Jkuw==
X-Forwarded-Encrypted: i=1; AJvYcCVPU9KajxLTsJmLQvs0LNLKwLo9Rf4IWq5Y6IaNy6ZZukmBNP0QesKRIxpCa77zJJqJa0/XXFBHph1JX8NZNZs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4yTqw8rJeEofWZhO3wkOJsEXgm9hQvXp4T+gxYZgaJMQrXZZ6
	GWwrrP7dgn/WkOx1dha+AXdkkyr7tc9Z9XWaB/ekOiESVvUV1t52vbdtzNN+vKkFjms=
X-Gm-Gg: ATEYQzwfSqe1S1dPN1Gug58u8mHg3HyLR/8c1/S3o+jaO6tJIM0MC/H2vBlFIhfI/af
	V3lsoHyVm3Mcaktz92zC+cerHuvk76w8I2Jpy+taLidylsULrT83SFItk8AVvl4IuhDZkcnfy9R
	Ob+5+0Ht8I2OMpfsKjhPrHhr5BM8oslcqArjXyl1RvsgRc8ViLX7rWwFil18flTKB8Wt4mqaTQN
	Tkgo8xbBVjqiybOKgTzfqhOm1WONRe/81JWEKLUj8xs16nHGLAf3kE6JuoOB9CV+AorqAxSQFJK
	4ryCB2jRqfl8NwyKOh/xeipWRJqZOV2s70z/G0G6hvvmF0p9FsNufptNaQOE+IzuVTp5WkkDZYM
	S8jREsBORfYw95/vbtaWdiupI8XLb8ygrawJsBbPCdlzuWZqTi76G9tS+8sgJm8GAOTVpki+fbz
	Plt/6mpAVyJpE+mjZNRATqu8Lr8NKQfLQdX2jXqDodhdxxhcwMgaN/FPYlBgcCMtemJw8DrYwCW
	3rt
X-Received: by 2002:a05:620a:170f:b0:8cd:d921:7075 with SMTP id af79cd13be357-8cfc7f8adabmr1070366885a.71.1774115891450;
        Sat, 21 Mar 2026 10:58:11 -0700 (PDT)
Received: from plex.localdomain ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc9089ca9sm426515985a.24.2026.03.21.10.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 10:58:11 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: brauner@kernel.org,
	linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	jack@suse.cz,
	shuah@kernel.org,
	linux-fsdevel@vger.kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	viro@zeniv.linux.org.uk,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	pratyush@kernel.org,
	skhawaja@google.com
Subject: [PATCH 1/2] liveupdate: prevent double management of files
Date: Sat, 21 Mar 2026 17:58:07 +0000
Message-ID: <20260321175808.57942-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260321175808.57942-1-pasha.tatashin@soleen.com>
References: <20260321175808.57942-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, LUO does not prevent the same file from being managed twice
across different active sessions.

Add a new i_state flag I_LUO_MANAGED and update luo_preserve_file()
to check and set this flag when a file is preserved, and clear it in
luo_file_unpreserve_files() when it is released.

Additionally, set this flag in luo_retrieve_file() after a file is
successfully restored in the new kernel, and clear it in
luo_file_finish() when the LUO session is finalized.

This ensures that the same file (inode) cannot be managed by multiple
sessions. If another session attempts to preserve an already managed
file, it will now fail with -EBUSY.

Acked-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Acked-by: Jan Kara <jack@suse.cz>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/fs.h           |  5 ++++-
 kernel/liveupdate/luo_file.c | 27 ++++++++++++++++++++++++---
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 23f36a2613a3..692a8be56f3c 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -712,6 +712,8 @@ is_uncached_acl(struct posix_acl *acl)
  * I_LRU_ISOLATING	Inode is pinned being isolated from LRU without holding
  *			i_count.
  *
+ * I_LUO_MANAGED	Inode is being managed by a live update session.
+ *
  * Q: What is the difference between I_WILL_FREE and I_FREEING?
  *
  * __I_{SYNC,NEW,LRU_ISOLATING} are used to derive unique addresses to wait
@@ -744,7 +746,8 @@ enum inode_state_flags_enum {
 	I_CREATING		= (1U << 15),
 	I_DONTCACHE		= (1U << 16),
 	I_SYNC_QUEUED		= (1U << 17),
-	I_PINNING_NETFS_WB	= (1U << 18)
+	I_PINNING_NETFS_WB	= (1U << 18),
+	I_LUO_MANAGED		= (1U << 19),
 };
 
 #define I_DIRTY_INODE (I_DIRTY_SYNC | I_DIRTY_DATASYNC)
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 5acee4174bf0..86911beeff71 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -248,6 +248,7 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
  * Context: Can be called from an ioctl handler during normal system operation.
  * Return: 0 on success. Returns a negative errno on failure:
  *         -EEXIST if the token is already used.
+ *         -EBUSY if the file descriptor is already preserved by another session.
  *         -EBADF if the file descriptor is invalid.
  *         -ENOSPC if the file_set is full.
  *         -ENOENT if no compatible handler is found.
@@ -276,6 +277,14 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	if (err)
 		goto  err_fput;
 
+	scoped_guard(spinlock, &file_inode(file)->i_lock) {
+		if (inode_state_read(file_inode(file)) & I_LUO_MANAGED) {
+			err = -EBUSY;
+			goto err_free_files_mem;
+		}
+		inode_state_set(file_inode(file), I_LUO_MANAGED);
+	}
+
 	err = -ENOENT;
 	list_private_for_each_entry(fh, &luo_file_handler_list, list) {
 		if (fh->ops->can_preserve(fh, file)) {
@@ -286,11 +295,11 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 
 	/* err is still -ENOENT if no handler was found */
 	if (err)
-		goto err_free_files_mem;
+		goto err_unpreserve_inode;
 
 	err = luo_flb_file_preserve(fh);
 	if (err)
-		goto err_free_files_mem;
+		goto err_unpreserve_inode;
 
 	luo_file = kzalloc_obj(*luo_file);
 	if (!luo_file) {
@@ -320,6 +329,9 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	kfree(luo_file);
 err_flb_unpreserve:
 	luo_flb_file_unpreserve(fh);
+err_unpreserve_inode:
+	scoped_guard(spinlock, &file_inode(file)->i_lock)
+		inode_state_clear(file_inode(file), I_LUO_MANAGED);
 err_free_files_mem:
 	luo_free_files_mem(file_set);
 err_fput:
@@ -363,6 +375,9 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
 		luo_file->fh->ops->unpreserve(&args);
 		luo_flb_file_unpreserve(luo_file->fh);
 
+		scoped_guard(spinlock, &file_inode(luo_file->file)->i_lock)
+			inode_state_clear(file_inode(luo_file->file), I_LUO_MANAGED);
+
 		list_del(&luo_file->list);
 		file_set->count--;
 
@@ -609,6 +624,9 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 	*filep = luo_file->file;
 	luo_file->retrieve_status = 1;
 
+	scoped_guard(spinlock, &file_inode(luo_file->file)->i_lock)
+		inode_state_set(file_inode(luo_file->file), I_LUO_MANAGED);
+
 	return 0;
 }
 
@@ -701,8 +719,11 @@ int luo_file_finish(struct luo_file_set *file_set)
 
 		luo_file_finish_one(file_set, luo_file);
 
-		if (luo_file->file)
+		if (luo_file->file) {
+			scoped_guard(spinlock, &file_inode(luo_file->file)->i_lock)
+				inode_state_clear(file_inode(luo_file->file), I_LUO_MANAGED);
 			fput(luo_file->file);
+		}
 		list_del(&luo_file->list);
 		file_set->count--;
 		mutex_destroy(&luo_file->mutex);
-- 
2.43.0

