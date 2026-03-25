Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F092D2BDC3F
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 18:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462833; cv=none; b=tjYhZ/6RqdhltF+x7r8FqU9EdJYnmOVUFvIz+LID49QR/oru3qHs+DlDzgfmUUT6A9s7Eo2K/XfurTgFUUWh5/69nlvkmu/l4zfXlPDnpfOD+5TaMgOsGIo+TBpWJ6YX2xOy4hEcYO6VjVnh/8WBKXss4Px+euxToiV1iSnM1UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462833; c=relaxed/simple;
	bh=rgpLpqZJLkucnhNPG0p5vGblP5wlFIaNzmXS/Hf4jzo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFoJg8OVpiu13xXbuyzb/v3I0XmcGp6ZCGGk3Ew97fu8CzC9s7/+an8WjrfsMXct8weSB1o2XLvVBCm2scfy5yMllZ7YDVaFBY/sWIIq55UpXEEUg7EfD766Ud7qbtTBuWCHAyp1cIHb4N0j89ITNXbmlk5EaHlbGtAswRfs1TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=TP3cUARc; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="TP3cUARc"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8d00cf835b7so28407885a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 11:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1774462831; x=1775067631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLqludGATIl3hRiyxTIx0CjPLFsz0CkRWvUmhsLy2/k=;
        b=TP3cUARctAxZaBtW/+rGwA7xjU9Uo5ZIq6gAEr7hMzPvMqVzR/7IccGhsYiMmFQeAv
         fzwxoiW6YMEeUYDglYbNGPPl1uoGuDuBEfETkHDyjN9JGagZotWbV7xamtmXjbAVmryu
         b12YF7Nr75GGDfFLbwcsDQXBuXPnduG6d3MoQWYAs2p+Pie+xZsuhGGCrgwhwnVZhG39
         2zilVmWH6oJNK9VZPPbF2oZOfSngoRujTnKzdAMAUzSr4hRbtiYe5B96SayioCPq8rBS
         Ze1rFqaqa/aIYO1PzakDA/BN0SKamfvdByimkYTL4KKJrfiTg7COe0gp6dkAkYituR6L
         pzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462831; x=1775067631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zLqludGATIl3hRiyxTIx0CjPLFsz0CkRWvUmhsLy2/k=;
        b=MOsnu1gIFfYEGYhxNGrUM+QJdq7Vj42w2i76NyR/OsZXtjf9vt58AEt+2K20eFQWB1
         XdfM11To8bL2mTE/61LA4M0YQJsRMc7yZHiFFegtzAVfQtZuI22Dq2ooxGEtgSWqB7Wo
         xFqB0V0rlvhr4k4nvPa7onKCEcjgk9SuhfVPztsLQXSU2l3eY4lMzoRAI6MYlrTZk6dP
         pvlVGBj0rxb7VXPWQJG/IREV2UPZvFR7ZM2B/2wv7BrrYeLrgRFvAGN1PJ/X7fWHJJLa
         KyDT5jtzfa+XG8z+sbzorKaA/ihyd699+6lLsidP3otANlig5LNjV8AUIISzg3yyTX7O
         5crA==
X-Gm-Message-State: AOJu0Yy5eWK1+15pljGigfuzQBLKmRotJahfh5ZvYa5pPs64ZdNo0KME
	YmcRyyXnLnH+jk8RDR180gBfRebr7ST956dOXfyd6WPu21d7jQ4h6C3g5xD/B0Wc0nTVpUZqbJV
	nU+XY
X-Gm-Gg: ATEYQzzKhk1ZyTtFU/F1xDJi4aw0vbfDzH/6WQ7zPN23l9MRdAdH/gYDrkj2EMUMYSf
	wWF7HSG3aQR2v5EXtZ/RJuuvE7u0Hc6BdRP29r+BnrMT8VzQDLDKoR4WZVfm4F46gs9AooHcD1y
	R6KgLJACi0e8RpquazHmcMTQnbLxaseiAT21gtkM0WQxT6ifNwzRixtGIuKP0UbBqjyzn+bKMCC
	kZUX1DRjzY7fIsGWa5N2Ul/G4l+wFNWYQ3R9JmsXTfkMKy4mxT462MhSIh6KStywIP+p1Y3PDuC
	Clp52gP/c5I5yzh65tc+KlgZZTpSRquuTJ8qWZMFfPRTlz484j9k195Oofr5NsFUBIptPIE+0Sl
	Fm1GPGIOdhDO4zam8m5XVDmDINmtxCLU4TV0djzsmkGTFdd3ydaiTfqtmD+IIx4NfcuqiK+BQSZ
	LAidLFgnEPdAyb+lOMpaRuzTUK10oIfTtDcznMDGiadYaNe27ep3mYU7t6rgwNVjau6A==
X-Received: by 2002:a05:620a:4627:b0:8cd:7811:941c with SMTP id af79cd13be357-8d00103931amr629323885a.54.1774462830472;
        Wed, 25 Mar 2026 11:20:30 -0700 (PDT)
Received: from plex.localdomain ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d00e250556sm64225385a.0.2026.03.25.11.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:20:30 -0700 (PDT)
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
Subject: [PATCH v3 1/2] liveupdate: prevent double management of files
Date: Wed, 25 Mar 2026 18:20:25 +0000
Message-ID: <20260325182026.467307-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325182026.467307-1-pasha.tatashin@soleen.com>
References: <20260325182026.467307-1-pasha.tatashin@soleen.com>
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
pointers being preserved by LUO. Update luo_preserve_file() to check and
insert the file pointer into this xarray when it is preserved, and
erase it in luo_file_unpreserve_files() when it is released.

This ensures that the same file (struct file) cannot be managed by
multiple sessions. If another session attempts to preserve an already
managed file, it will now fail with -EBUSY.

Acked-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_file.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index a38ea4975824..d1bb4213fd14 100644
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
+static DEFINE_XARRAY(luo_preserved_files);
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
 
+	err = xa_insert(&luo_preserved_files, (unsigned long)file,
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
+	xa_erase(&luo_preserved_files, (unsigned long)file);
 err_free_files_mem:
 	luo_free_files_mem(file_set);
 err_fput:
@@ -366,6 +378,7 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
 		luo_file->fh->ops->unpreserve(&args);
 		luo_flb_file_unpreserve(luo_file->fh);
 
+		xa_erase(&luo_preserved_files, (unsigned long)luo_file->file);
 		list_del(&luo_file->list);
 		file_set->count--;
 
@@ -609,6 +622,10 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 	luo_file->file = args.file;
 	/* Get reference so we can keep this file in LUO until finish */
 	get_file(luo_file->file);
+
+	WARN_ON(xa_insert(&luo_preserved_files, (unsigned long)luo_file->file,
+			  luo_file->file, GFP_KERNEL));
+
 	*filep = luo_file->file;
 	luo_file->retrieve_status = 1;
 
@@ -704,8 +721,11 @@ int luo_file_finish(struct luo_file_set *file_set)
 
 		luo_file_finish_one(file_set, luo_file);
 
-		if (luo_file->file)
+		if (luo_file->file) {
+			xa_erase(&luo_preserved_files,
+				 (unsigned long)luo_file->file);
 			fput(luo_file->file);
+		}
 		list_del(&luo_file->list);
 		file_set->count--;
 		mutex_destroy(&luo_file->mutex);
-- 
2.43.0

