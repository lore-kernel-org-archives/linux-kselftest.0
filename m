Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78E13E0248
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 20:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774297910; cv=none; b=u8tK2y0HEaBb+qlK46i9nsaEhwVv7NkaaDsLQ9scESvIOmPD6y35wTJD/exL3wgKX7VWIG032WA0XK82AWaq6KdYLh1zt/yK1cr9briF6PEFlKptBtD+rEk7v7nI7DN94DMz34jYlSi/axc9CzqK4N0b/dz2qkrSc4XrpBag7WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774297910; c=relaxed/simple;
	bh=h/f8j6IJuYkI1ktQO+TMs/HB/IY4/aGXmmNR202EWLY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dO+JszoFjHK+3jTtyNGxndX8eqmlGkCyZCBfLzuXTMYEg6ZBnnXh/+b3SlHmrkX7uN60jGaFNuca7ONh9sSgo+YqJD226K468IoLtEOLcJN/xw2mYCvePAO3K4zVpHy7KFVZDYrDnZcoYswgbJL5WLgTWxWziuQzr08tOkRw89M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=WPbgS7q1; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="WPbgS7q1"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cd77786e97so50880585a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 13:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1774297908; x=1774902708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mp+NroOy4/hHawAvVZuOZcBwNbvsjzSVce/sSOrDnHI=;
        b=WPbgS7q1tHn5LhjucuO2HYkeIPuFEHk1NcHk31ofqr/q/899AYn5kv/6qdP1u84hBz
         xz5ln0FzHTK5yg8tVb1H/QBuusjw0T+T+DlPtD7wSf12wVwfpaJlwmDuYokiYC+y52Xj
         krpY8h4eFMam1mmsBGVez7GFgAtaAZNj4CuUdLrRf/rJisGtt5GIxsmh+3e739tIqrtX
         pIa0dnJ0aDRzs7y8aVBPWLvr0b9+YyKIgF+B1GO1khVMf1TPH1HSifZyWEaYCBTxRANR
         hTtxdCIw0cbGRCGD+9f1vMEme7jD8z9ouXDP+M9y/AR0dLjYIYjZAxDTWOVAJ4id2Ixm
         GTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774297908; x=1774902708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mp+NroOy4/hHawAvVZuOZcBwNbvsjzSVce/sSOrDnHI=;
        b=YcK7l5zjKisdEob/qn/m2NGlMzXvt/Vt/rC4zWeDWsGX6n8m4LgYLVAB9SwcohPLVh
         8fwNV1fQEvWBY3qsjhBSed5+gpmTOlfuLW9DF4BaS5aJ0/2qEM4lY3jCvbuxsQE+/tJl
         w9wiUPSV61QH3GcUIFG2Zo315J4bvN4IKSarL+doLSNIcw14Q9eERd1nYkgWGhu1TnRq
         gMCS2ForEKLe5FJ0okvE2oe/PtEg63yTetN6mhn44WoGcSjQRrk4ebAByCjmm+utAoCr
         yruEXjrTa+Mne3SPwnGF7VUHMlL74g1S/JhDgEBQEGyOqbpXLTWWY8awdqI+JPePHt2k
         u3cA==
X-Gm-Message-State: AOJu0Yx5wSl/bUwEs8Om6zhyidr3av7fbgD9SpaY29Ty2zzFj/ChoWu+
	D+t2Jf+rE0ZV+7C7gMY23+8sPkIr09LEWWtYhasUeEUdPLFx8s4vU7rmQEv/kFkmlmEqK/cLATt
	DKvm3
X-Gm-Gg: ATEYQzyge8bS4WEtex7YP4oYUMbYEo/THvFtg1hdZsVHVO9SNBalJeq0chvWRftulH8
	Rh8iG4oDon4yKoYqUAP7DenL9aQc8Riylu1o6AUy0TgM0bomxSI5SAWlJEqGe1v/n7XgBxBaw+u
	w3+VlSyzmMVxQ3tERIc7i1jYkrHzvLkZdx3MlAvikaO39oFYDN6Ima4p/P/qCLF+p1CQo09IpU7
	kII3OEfkHTJnIGJKX7QBquXmbPBduh8/TUpNFEZXRd8vALigjyLh8A4RScq2iwJF/zBJd04Ao5Q
	DeRpIgA5ZVgXwddsUyxqIVit6jn7CGMUTZq6+NiA0zMvgyQM5cq/Fm6IO2eukNFrG60Ymh4I0/j
	YILI6kRsQFDURjiqh0UiptEkkJUYLCLUHQlrY/mG4/DzfHcLlzl/tYCSfcdjP6xR62L776/XiIG
	ENhzmoEwOnwDPZSxOMesZuWI+rCwm7XVwsNPqvNfJ8jV0JyvDdyNF0aOMjL1A7fwi5lg==
X-Received: by 2002:a05:620a:2802:b0:8cd:80f1:f468 with SMTP id af79cd13be357-8cfc7f49c3dmr2025158685a.41.1774297908246;
        Mon, 23 Mar 2026 13:31:48 -0700 (PDT)
Received: from plex.localdomain ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8fb9c10sm1014271785a.19.2026.03.23.13.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:31:47 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	pratyush@kernel.org,
	skhawaja@google.com
Subject: [PATCH v2 1/2] liveupdate: prevent double management of files
Date: Mon, 23 Mar 2026 20:31:44 +0000
Message-ID: <20260323203145.148057-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323203145.148057-1-pasha.tatashin@soleen.com>
References: <20260323203145.148057-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, LUO does not prevent the same file from being managed twice
across different active sessions.

Use a global xarray `luo_preserved_files_xa` to keep track of file
pointers being preserved by LUO. Update luo_preserve_file() to check and
insert the file pointer into this xarray when it is preserved, and
erase it in luo_file_unpreserve_files() when it is released.

This ensures that the same file (struct file) cannot be managed by
multiple sessions. If another session attempts to preserve an already
managed file, it will now fail with -EBUSY.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_file.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index a38ea4975824..5f48c3c8c561 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -110,11 +110,15 @@
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/xarray.h>
 #include "luo_internal.h"
 
 static DECLARE_RWSEM(luo_file_handler_lock);
 static LIST_HEAD(luo_file_handler_list);
 
+/* Keep track of files being preserved by LUO */
+static DEFINE_XARRAY(luo_preserved_files_xa);
+
 /* 2 4K pages, give space for 128 files per file_set */
 #define LUO_FILE_PGCNT		2ul
 #define LUO_FILE_MAX							\
@@ -249,6 +253,7 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
  * Context: Can be called from an ioctl handler during normal system operation.
  * Return: 0 on success. Returns a negative errno on failure:
  *         -EEXIST if the token is already used.
+ *         -EBUSY if the file descriptor is already preserved by another session.
  *         -EBADF if the file descriptor is invalid.
  *         -ENOSPC if the file_set is full.
  *         -ENOENT if no compatible handler is found.
@@ -277,6 +282,11 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	if (err)
 		goto  err_fput;
 
+	err = xa_insert(&luo_preserved_files_xa, (unsigned long)file,
+			file, GFP_KERNEL);
+	if (err)
+		goto err_free_files_mem;
+
 	err = -ENOENT;
 	scoped_guard(rwsem_read, &luo_file_handler_lock) {
 		list_private_for_each_entry(fh, &luo_file_handler_list, list) {
@@ -289,11 +299,11 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 
 	/* err is still -ENOENT if no handler was found */
 	if (err)
-		goto err_free_files_mem;
+		goto err_erase_xa;
 
 	err = luo_flb_file_preserve(fh);
 	if (err)
-		goto err_free_files_mem;
+		goto err_erase_xa;
 
 	luo_file = kzalloc_obj(*luo_file);
 	if (!luo_file) {
@@ -323,6 +333,8 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	kfree(luo_file);
 err_flb_unpreserve:
 	luo_flb_file_unpreserve(fh);
+err_erase_xa:
+	xa_erase(&luo_preserved_files_xa, (unsigned long)file);
 err_free_files_mem:
 	luo_free_files_mem(file_set);
 err_fput:
@@ -366,6 +378,7 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
 		luo_file->fh->ops->unpreserve(&args);
 		luo_flb_file_unpreserve(luo_file->fh);
 
+		xa_erase(&luo_preserved_files_xa, (unsigned long)luo_file->file);
 		list_del(&luo_file->list);
 		file_set->count--;
 
-- 
2.43.0

