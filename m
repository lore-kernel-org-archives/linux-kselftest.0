Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709459;
	b=0xtB78HqM4v9gNfoKLE7jQcfNf39lR9t0dnF6bF9UO76mrwGHd00TcvK5PSqRePM6lnG
	 x8FRJ8NFYE2KlhkSYRXB0VUsuKWxWr5teU8zbn9NkXeQeCTQ18EJM/SDEZ9O1bBkMxjLZ
	 d0rMdsohsUU3HVzP4sFpH/R5jsmRu1N0pjtQ5OpYhAQs++M2I31hUGXnhHcnl1Z/LF9sO
	 1z6ffWI8RMVh71br2n7pPMmZxjvo7HnSRU2yj5wdlX31Wgh+BexwPa8ZuKmN4IaeetGle
	 jLcXndB7+xNbCi8LiZVTJJfjC6RHYcERL+89ShU5prvfKGX49K9du3yA6mTGHguF23Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tveVWO7bpJoIkcGyu5OICWvMrLDi2sKmFxgN2k+RxPA=;
	b=g91lwGgNaTrDORfDB5xRsTNAu4u/XTZL5Jnm7PPO5AM+zvozBY01kjq7ixYnoPQq4c3i
	 kVf4hBqBE9O7vxby/oG5FipWoqDDrrkq8vuz5VMuPuV7N6478LwThQ8bNyrVC8L0hQgD0
	 w/1lh6Q4F1qUbx/qEG6j/nv5Nj9F3UiGCOlq3PVGee/arMvwh3BOfF9be7iEnnmyKLPMz
	 DVgzWqWH51Jz9rJm/cOsmz0ZUn59678moyf017+cFDjaocXgg8rJxJ/LbmcDGUwiB/VWE
	 SA8Y7wOb1ZR00koJeTqkhU1oCZSpkn5rvewFk6/MpMmyD8qSYJh1n1KyM4OFaPljjsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JI1oGfp7;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15592606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 22:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15592606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JI1oGfp7
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86fa6b15ed3so472037b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792709458; x=1793314258; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tveVWO7bpJoIkcGyu5OICWvMrLDi2sKmFxgN2k+RxPA=;
        b=JI1oGfp73ClAM+rrrmG0fU/E10DtJ505Iuk7NocRTECK3OS5pKrAR+KGXtLKgD32at
         Psx+S04EfZlRqm53rtSpodOJ+D+OnJMU3n2xA7CM4nVyMVFXgxwoFoIPE1iz/X/buu/q
         ZJnrAEXWAFGazTBvdoeZrcHA0Az7y1m+kJ9yuwqbhvB4n05Zm4nI9yryqfFe3hNtRPb0
         +P8RY/tcc3g9IdFw9xrJICoJ31mVVGCJa6uB67WpN51tSK0Cw/e7wY65Z1ylDeopw5KY
         YCvOj7BUvMly23jNmQAMu9JRkL38DkL28XTU9UwI10UVUR9QQZ9agQ66wh3xdB2L5HoV
         QpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709458; x=1793314258;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tveVWO7bpJoIkcGyu5OICWvMrLDi2sKmFxgN2k+RxPA=;
        b=tXjkIKyPbdz0NIKS/UmOGS+DqjGCQSXb1KSOiA8tdBtr48t/Df+9o3+sZ+VokxjFsJ
         GtohFLERGSnLgsayRf+ERhxhhy8kgEGBFHbZeGyN0MK5jTizSbIrvAg01igwjTx+cSht
         HjnKKqpWhM2sHoZBEyE4sSyg6v27biAk4JdJ3JMYHQxOmesORhVPe727Xx5kDzdmdMLv
         8XsnOXra/1qXlFp/i4bT8bR3jxvfdVSkKpdp0fTFScBu6R4VCfMI357L7tpLJ7UIO8QN
         QuYEAT+JwDtHZl8AFGbAsB/mHF2uPCje4dTp5A2Q9mnOVUpGxzC5sOQxfwvCIAzkc9aL
         +gtQ==
X-Forwarded-Encrypted: i=1; AKwUvByrMfbigjxh4e/wPoIulKilqpDKRyMKZAp+1NnAhjZoqR2W1ANlXX4CUXa3maSCMNV3WECc0CX0MYece4LegdA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0FpLQVQA0iIydHe1X+H6BevLPSw1/ziBaksIeDw+1gsfz43Fx
	YRLa5mdNgd2PSwQF2oNf3kPt3ek0x2nomHdxLYxDVzMHP8WpFWY+/PrndP30JXECgyPMOvnW2j2
	UcScbAGVTElgfoA==
X-Received: from pgww26-n1.prod.google.com ([2002:a05:6a02:2c9a:10b0:cd6:1195:61cb])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:8a0e:b0:3e2:335b:1a5d with SMTP id adf61e73a8af0-3e3767c3067mr249935637.71.1792709458271;
 Thu, 22 Oct 2026 15:50:58 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:50:34 +0000
In-Reply-To: <20261022225035.377445-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022225035.377445-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022225035.377445-10-dmatlack@google.com>
Subject: [PATCH v2 09/10] mm/shmem_luo: Allow retrieving tmpfs files with O_RDONLY
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Allow userspace to pass O_RDONLY in struct liveupdate_shmem_retrieve_arg
to retrieve a tmpfs file read-only.

open() requires write access for O_TMPFILE, so create the file writable
like before, then reopen it read-only with dentry_open() using the same
flags, and drop the writable file. Like open(), which grants the
requested access to a new file regardless of its mode, don't check
permission for the read-only open.

Retrieving a file read-only allows a restored binary to be executed
before the session is finished. LUO keeps the retrieved file open until
then, and executing a binary that is open for writing fails with
-ETXTBSY. Being able to execute restored binaries right away matters
when they are needed to finish restoring the system, e.g. to bring up
the services that retrieve and finish the remaining sessions.

Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/uapi/linux/liveupdate.h |  6 +++---
 mm/shmem_luo.c                  | 28 +++++++++++++++++++++-------
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
index a9dcc4fcc87b..790742a247e8 100644
--- a/include/uapi/linux/liveupdate.h
+++ b/include/uapi/linux/liveupdate.h
@@ -265,9 +265,9 @@ struct liveupdate_session_get_name {
  *
  * The kernel creates a new file as if by openat(@dirfd, ".", O_TMPFILE |
  * @flags, @mode), fills it with the preserved contents, and returns it in
- * &struct liveupdate_session_retrieve_fd.fd. Like any O_TMPFILE file, the file
- * is not linked into the filesystem. Userspace can link it with linkat(),
- * unless @flags contains O_EXCL.
+ * &struct liveupdate_session_retrieve_fd.fd. Unlike open(), O_RDONLY is
+ * allowed. Like any O_TMPFILE file, the file is not linked into the filesystem.
+ * Userspace can link it with linkat(), unless @flags contains O_EXCL.
  *
  * If @flags contains unknown flags or O_PATH, if @mode contains unknown mode
  * bits, or if @dirfd is not on a tmpfs mount, the retrieve fails with -EINVAL.
diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index aba2bc1f18c5..0b4a9d6e2968 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -112,9 +112,10 @@
  *
  * Like any ``O_TMPFILE`` file, the new file is not linked into the filesystem.
  * Userspace can link it at the path it wants with ``linkat()``, unless it asked
- * for ``O_EXCL``. Like with ``open()``, the file must be opened for writing.
- * LUO keeps the file open until the session is finished, so a retrieved binary
- * can't be executed until then.
+ * for ``O_EXCL``. Unlike ``open()``, the file can be retrieved with
+ * ``O_RDONLY``. LUO keeps the file open until the session is finished, so a
+ * binary retrieved with ``O_RDWR`` or ``O_WRONLY`` can't be executed until
+ * then.
  *
  * The blocks of the file are charged to the target mount, so the size limit
  * and quotas of the mount apply. If the file doesn't fit, the retrieve fails
@@ -649,7 +650,9 @@ static struct file *shmem_luo_create_memfd(const struct liveupdate_shmem_retriev
 static struct file *shmem_luo_create_tmpfs_file(const struct liveupdate_shmem_retrieve_arg *arg,
 						unsigned int seals)
 {
-	struct file *file;
+	struct file *file, *ro_file;
+	bool rdonly;
+	int flags;
 	int err;
 
 	if (!arg)
@@ -673,10 +676,16 @@ static struct file *shmem_luo_create_tmpfs_file(const struct liveupdate_shmem_re
 
 	/*
 	 * Create the file like open(O_TMPFILE) does, so that it gets the same
-	 * flag checks, permission checks, owner and security labels.
+	 * flag checks, permission checks, owner and security labels. open()
+	 * requires write access for O_TMPFILE, so create the file writable and
+	 * reopen it read-only below if that is what userspace asked for. LUO
+	 * keeps the file until the session is finished, and a file opened for
+	 * writing couldn't be executed until then.
 	 */
+	flags = O_TMPFILE | O_LARGEFILE | arg->flags;
+	rdonly = (flags & O_ACCMODE) == O_RDONLY;
 	file = file_open_root(&fd_file(dir)->f_path, ".",
-			      O_TMPFILE | O_LARGEFILE | arg->flags, arg->mode);
+			      flags | (rdonly ? O_RDWR : 0), arg->mode);
 	if (IS_ERR(file))
 		return file;
 
@@ -694,7 +703,12 @@ static struct file *shmem_luo_create_tmpfs_file(const struct liveupdate_shmem_re
 	}
 	SHMEM_I(file_inode(file))->seals = seals;
 
-	return file;
+	if (!rdonly)
+		return file;
+
+	ro_file = dentry_open(&file->f_path, flags, current_cred());
+	fput(file);
+	return ro_file;
 }
 
 static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
-- 
2.56.0.257.gf7497c7d27-goog

