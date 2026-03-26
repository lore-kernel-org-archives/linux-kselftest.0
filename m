Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB3D4070EB
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 16:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774543189; cv=none; b=lzp59yghzyl8DSTCknjcC9zCdWhYwthXC3iWpoucJCgEwChOYC2fK2NRA0JQPe71/MPXbfORRf5fkHMPZBJcnu9tqlleYQ/js5xYlhrR9RUM32n7r2LmIbCmTplHvXqqP2zbk28TRUyDAbhreGcdBgni7AKnximzV5w4M8JAW3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774543189; c=relaxed/simple;
	bh=nMoVBvse899NPg8tpB9OKbPFwPjKBuBCeTp4KA60WEU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fAhgaCyhLj4ZitkJsHGSPCIU2qVOviqcW4kcfDntedQdg/hpATz+rK1zPlMKr0P9x6Sl33DD3wFCwpNqEj44YYAvItMv6cbVQZcvQX6gHAOCYh7cjhZY3+539m8uMJfjSoRIdOGNvoz1fMGIqdtN4kb5A/K4za8oZQaWfUWlmLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=aGnEnuH0; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="aGnEnuH0"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50b3488fb31so28804701cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 09:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1774543186; x=1775147986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIdUnvgvoju2sn6Qx2mGLJNfJ9th4UndCcaJvlrJfI0=;
        b=aGnEnuH00aeslZWeM13KSRQjMeP+myxEwJInFTFq4KuPe/zYUJNi7j0nHe5zPF8BF6
         ZyfNZjtaIWghtUTCOhAqwGz/SHoeemz/TK3KUpxov/Pcx6+PtBKT3R066hY7xCgl6lR1
         1ZtY+fMcHFOVrC9hFx7d1dnujwi0Q3tPAx6dFT48pUn1LcrU2OzPzeZ2EOBoLXpqP25C
         5BnL3mERx1XUJ+qFYv0XN3a0OQTvXIV4Ug4AQGCWqtfMboWSKd0Fdzy3z4HYLo3RO7Sf
         gSv22mB1LbJg/IG83RUQEXiayW9q055IIA428ov3XwldYfaHHmJDE1k49TPBcDklT8ZN
         XnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774543186; x=1775147986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hIdUnvgvoju2sn6Qx2mGLJNfJ9th4UndCcaJvlrJfI0=;
        b=oikFgtmiK7rO1cGtqMCPuyHRpEr5UOz4BT0Wt0oQ002ZWA8Cd441uJk47lE6ahEvYO
         djWzaup2QjyjzZ/auR6iRuoHD/qxnTePhoh/EMy0+EWnddDAVMGkrjtxwHpX/z0isM6h
         TX2oD+1miv2SXBdMoQC5W1+NZCHgTys23MWtqE+7IVWrtklpp8LZ7Y2YnHuUFEftFl8L
         flS1vz0zyqO370g8uz12GeW0n9+5Uf7voZriKhDo5fBLbP8f4sue12gozGDmEA70gcb3
         NwM7nwJP9E7fm1JnYKgaXgoCoQ146wdjNbHV1rfw9nWmRhNi5DuxAYK9tHZqFajzHYX+
         mcWw==
X-Gm-Message-State: AOJu0YzPB4PqAZYydDe6dggANnIaQYjTPKZPHEm8bw1AikGfoM3QMDnw
	BUbK3Cs7GGO4yStxK1FEy8cYrOyjG6Q125rUBM36YJbs/8R6ognIfEzeaD+sVgOL40/nFXHvEY/
	tAamC
X-Gm-Gg: ATEYQzzOCfy9kSZmwZ4u1+MaS+1pT+Iyy98m6d1ek3elFeld6rnY3k1tcpQkPmqYk0H
	NXmtYECqjSFBf2rpzjTkTw1Jmz0FfwxOKJO01BruR3JUQLyb2LvoUEh8g7YYFwvxthCMByAEcG+
	0YR5kAfJOZZCqwNH3YGQvz3nKfwAyJ/3wuOYcAldnQzk7WtvDxdHNiokoKKK70KiJrkNMABmNZj
	UURm/rrm4tffRZkqy+W13sCFcJTFucwGBlXMC04ek6DSYG3EfqoPnktayqLC8kyccvsVMJAQM9Y
	Z2ABfQMmVyCDAzU48htHh1G7XeHr54fpA4iMfgE5W1jCe4My0V5+OshzPe0i/47RK7XOFL/Y8Ce
	Ex4xV7xrkKfN6RcsP1MbohwmLmzDhBjbTdJRr7DWF4Wci8z6FEJaeieKPzjIzA2/LMArdWF6/Ds
	luD3idXmC02r0pKzhThwc2PHiAAe7nMjykJHAH9wSmrPHAwpr8NvZJ0q7I+YU5mFe31CvvFyUPy
	72A
X-Received: by 2002:a05:622a:8d17:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-50b994a6c29mr24101061cf.24.1774543186042;
        Thu, 26 Mar 2026 09:39:46 -0700 (PDT)
Received: from plex.localdomain ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b920f77cfsm28238251cf.6.2026.03.26.09.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 09:39:45 -0700 (PDT)
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
Subject: [PATCH v4 1/3] liveupdate: prevent double management of files
Date: Thu, 26 Mar 2026 16:39:41 +0000
Message-ID: <20260326163943.574070-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326163943.574070-1-pasha.tatashin@soleen.com>
References: <20260326163943.574070-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, LUO does not prevent the same file from being managed twice
across different active sessions.

Use a global xarray luo_preserved_files to keep track of file
identifiers being preserved by LUO. Update luo_preserve_file() to
check and insert the file identifier into this xarray when it is
preserved, and erase it in luo_file_unpreserve_files() when it is
released.

To allow handlers to define what constitutes a "unique" file (e.g.,
different struct file objects pointing to the same hardware resource),
add a get_id() callback to struct liveupdate_file_ops. If not
provided, the default identifier is the struct file pointer itself.

This ensures that the same file (or resource) cannot be managed by
multiple sessions. If another session attempts to preserve an already
managed file, it will now fail with -EBUSY.

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/liveupdate.h   |  2 ++
 kernel/liveupdate/luo_file.c | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index dd11fdc76a5f..61325ad26526 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -63,6 +63,7 @@ struct liveupdate_file_op_args {
  *                finish, in order to do successful finish calls for all
  *                resources in the session.
  * @finish:       Required. Final cleanup in the new kernel.
+ * @get_id:       Optional. Returns a unique identifier for the file.
  * @owner:        Module reference
  *
  * All operations (except can_preserve) receive a pointer to a
@@ -78,6 +79,7 @@ struct liveupdate_file_ops {
 	int (*retrieve)(struct liveupdate_file_op_args *args);
 	bool (*can_finish)(struct liveupdate_file_op_args *args);
 	void (*finish)(struct liveupdate_file_op_args *args);
+	unsigned long (*get_id)(struct file *file);
 	struct module *owner;
 };
 
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 5acee4174bf0..b02e2891cdb8 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -110,10 +110,14 @@
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/xarray.h>
 #include "luo_internal.h"
 
 static LIST_HEAD(luo_file_handler_list);
 
+/* Keep track of files being preserved by LUO */
+static DEFINE_XARRAY(luo_preserved_files);
+
 /* 2 4K pages, give space for 128 files per file_set */
 #define LUO_FILE_PGCNT		2ul
 #define LUO_FILE_MAX							\
@@ -203,6 +207,12 @@ static void luo_free_files_mem(struct luo_file_set *file_set)
 	file_set->files = NULL;
 }
 
+static unsigned long luo_get_id(struct liveupdate_file_handler *fh,
+				struct file *file)
+{
+	return fh->ops->get_id ? fh->ops->get_id(file) : (unsigned long)file;
+}
+
 static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
 {
 	struct luo_file *iter;
@@ -248,6 +258,7 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
  * Context: Can be called from an ioctl handler during normal system operation.
  * Return: 0 on success. Returns a negative errno on failure:
  *         -EEXIST if the token is already used.
+ *         -EBUSY if the file descriptor is already preserved by another session.
  *         -EBADF if the file descriptor is invalid.
  *         -ENOSPC if the file_set is full.
  *         -ENOENT if no compatible handler is found.
@@ -288,10 +299,15 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	if (err)
 		goto err_free_files_mem;
 
-	err = luo_flb_file_preserve(fh);
+	err = xa_insert(&luo_preserved_files, luo_get_id(fh, file),
+			file, GFP_KERNEL);
 	if (err)
 		goto err_free_files_mem;
 
+	err = luo_flb_file_preserve(fh);
+	if (err)
+		goto err_erase_xa;
+
 	luo_file = kzalloc_obj(*luo_file);
 	if (!luo_file) {
 		err = -ENOMEM;
@@ -320,6 +336,8 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	kfree(luo_file);
 err_flb_unpreserve:
 	luo_flb_file_unpreserve(fh);
+err_erase_xa:
+	xa_erase(&luo_preserved_files, luo_get_id(fh, file));
 err_free_files_mem:
 	luo_free_files_mem(file_set);
 err_fput:
@@ -363,6 +381,8 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
 		luo_file->fh->ops->unpreserve(&args);
 		luo_flb_file_unpreserve(luo_file->fh);
 
+		xa_erase(&luo_preserved_files,
+			 luo_get_id(luo_file->fh, luo_file->file));
 		list_del(&luo_file->list);
 		file_set->count--;
 
@@ -606,6 +626,11 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 	luo_file->file = args.file;
 	/* Get reference so we can keep this file in LUO until finish */
 	get_file(luo_file->file);
+
+	WARN_ON(xa_insert(&luo_preserved_files,
+			  luo_get_id(luo_file->fh, luo_file->file),
+			  luo_file->file, GFP_KERNEL));
+
 	*filep = luo_file->file;
 	luo_file->retrieve_status = 1;
 
@@ -701,8 +726,11 @@ int luo_file_finish(struct luo_file_set *file_set)
 
 		luo_file_finish_one(file_set, luo_file);
 
-		if (luo_file->file)
+		if (luo_file->file) {
+			xa_erase(&luo_preserved_files,
+				 luo_get_id(luo_file->fh, luo_file->file));
 			fput(luo_file->file);
+		}
 		list_del(&luo_file->list);
 		file_set->count--;
 		mutex_destroy(&luo_file->mutex);
-- 
2.43.0

