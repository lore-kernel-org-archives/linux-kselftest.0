Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356658;
	b=sf3USQnNb1P4m7QWl0Gl1bOSakNstwdxJmZ2eFEDTYy+GDLIs+1V1BtLmt/Ue08XD8Vw
	 BRaiTAsge2jMZSTNqdigIbgluOv7OvAEBSFHS3fnqM4oosfotyCC7zYym2rgOgdHWtgYy
	 m56K1cXJ3xAUbpKynHsQmyDTjqbdyA8MB1CgCprk7HdG2GsTCU1GreS7eL/lM91fkArU0
	 6sKEiGsUiW7D0Co3VL+eR/8nmmwnj8Ll2a6jC4WZVxQ/do9Vo8lwVhC8YwUngIpEb5yGk
	 l01hM5Ou2ygE7zox59GmuLRkM4e4kVY73XQ5aPCzNpXKE7ke36tAagEK7sMU4L2yaGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=bPv+WMWcyhJBfMpWVwqvVEabR827fX5uGDPeWoliS18=;
	b=g/t6CmtRfzRYXs2+t9nfa3kEPlnZiZoOjbVFwfw18drC9o+fYF0eXHo8aftA0odDnKq2
	 TGOE1R47ceKogC5r6/JpIhagycXGZwHRW4Yn3+ixL1bG+dm5DjFqP38oIijzfRkiokhgR
	 8gej0bYciILzIKFZL5pMX7PECB6QQJjoKOcZQGXQMtXPEcaOKlJiqt7SnKYWbJTgCgs0r
	 te6KNOnAgwe1lApOtZ4abzJ79EvZ9p7BSiqp4sCJc2cgTLCBkxF6vWX7AZqxGEoP+m6UM
	 ObOTxfwiss5nr0eojJJEWto4Dw/oXa7Im0M5GzAHo6w5fHdcYDJm1mjdfItjxagwmeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UacCW5C+;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9441F60A3821
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 00:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9441F60A3821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UacCW5C+
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-821de0b7baaso3476121a34.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356656; x=1794961456; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bPv+WMWcyhJBfMpWVwqvVEabR827fX5uGDPeWoliS18=;
        b=UacCW5C+bCfoMDMgu5yyX1N2azVaE+JiaTAakMn9R+ZXPsYlHtOUZoneOWj4ybNXzr
         7uy6R2LYb5ZYvUGgXUokdzuk+zbW4iZdVpzG+SgVoiMOjSJdbk3cTr+Hw9pP+Dk0m2Xa
         Opa4xWCcRdyE+1VB7WA3Xykt3tnL8WPXT/FInoJ9qeZ/yDW2VjCI3faoHqICVcQy+/uT
         reCAILSWTOfHaP54Do8vkPbHYWFlG1690IJN3D3slfYkNxWfwMlm67tnd53RGbqdHeRe
         er3REd0G+icM+hLfuxMEO4hBlDQsLbEuvIuhwFrWzC96dVNxm49tx87xTfFpMbktAdzF
         4NSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356656; x=1794961456;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPv+WMWcyhJBfMpWVwqvVEabR827fX5uGDPeWoliS18=;
        b=VlFMJ4OaWGp9b7fDMqDP6lHlB+oofiGCCxHIuztOoK2dtXke6NqwUp4yvx2nvrfzrN
         lS+oEuOe7XSglCdVvbB9d03VAeoyKrtQCH3/rOkhbuCfRl5DBQ6RNgtCTJPB3uneiIX9
         3zmT5S9HKRbIlFYOdfAl+1LwY1k2dLffK5hZ1yUQVNzWDmPUQvVCNtB9jDk7kt583SVG
         JlENR5qq0ZXJoQB+Q6XR4u1YLDZYtabQdNv5mTmMVUw1LwZl2uhSNNtH0yoMfSJI84N/
         cwzYwDOXcvbYP6JniO4C52VNFCJHDMk5mvVc8OPQ3/ZFSDies3q2fTb5GtZHCgeJ3xF+
         ZiCA==
X-Forwarded-Encrypted: i=1; AL+hErEMczlMs3MGBfuOhKbweiBapDq7NhuMS8cYdycq5+fkEjMz3ZyK9M4SVjCd7dhYsADcbjw7TkhpLIrlSgQHelM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P230cG70ch7IcdXhgLI6rk2T93j3YWJHbtpbeMaK+2RdF+Qad
	xR7dy23fXu4JjglfpYgThJPrjt0/v/SCYQ3pZr7bePa+QImAPHvQVVAwHdrQo+ITwyhW/19m56S
	/XTpBYxrCdV2vmQ==
X-Received: from iocow25-n1.prod.google.com ([2002:a05:6602:c5d9:10b0:9cb:8099:40ad])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:e88:b0:4e6:db9c:9a7c with SMTP id 5614622812f47-56b9891f794mr602405b6e.63.1794356656227;
 Tue, 10 Nov 2026 16:24:16 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:45 +0000
In-Reply-To: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111002358.1842967-8-dmatlack@google.com>
Subject: [PATCH v4 07/19] liveupdate: Add helpers to track the files that LUO manages
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

Add luo_track_file() and luo_untrack_file(), which add a file to and
remove it from luo_preserved_files, and use them instead of open-coding
xa_insert() and xa_erase() with luo_get_id() for preserved and retrieved
files.

The next commit lets file handlers make LUO track the file they retrieve
into, which adds more users. The helpers keep the key and the -EBUSY
behavior in one place.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 kernel/liveupdate/luo_file.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index e5d333649f76..91a2b74f71cb 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -192,6 +192,19 @@ static unsigned long luo_get_id(struct liveupdate_file_handler *fh,
 	return fh->ops->get_id ? fh->ops->get_id(file) : (unsigned long)file;
 }
 
+/* Make LUO manage @file, or fail with -EBUSY if it already does. */
+static int luo_track_file(struct liveupdate_file_handler *fh, struct file *file)
+{
+	return xa_insert(&luo_preserved_files, luo_get_id(fh, file), file,
+			 GFP_KERNEL);
+}
+
+static void luo_untrack_file(struct liveupdate_file_handler *fh,
+			     struct file *file)
+{
+	xa_erase(&luo_preserved_files, luo_get_id(fh, file));
+}
+
 static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
 {
 	struct luo_file *iter;
@@ -306,14 +319,13 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd,
 	if (err)
 		goto err_module_put;
 
-	err = xa_insert(&luo_preserved_files, luo_get_id(fh, file),
-			file, GFP_KERNEL);
+	err = luo_track_file(fh, file);
 	if (err)
 		goto err_free_arg;
 
 	err = luo_flb_file_preserve(fh);
 	if (err)
-		goto err_erase_xa;
+		goto err_untrack;
 
 	luo_file = kzalloc_obj(*luo_file);
 	if (!luo_file) {
@@ -345,8 +357,8 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd,
 	kfree(luo_file);
 err_flb_unpreserve:
 	luo_flb_file_unpreserve(fh);
-err_erase_xa:
-	xa_erase(&luo_preserved_files, luo_get_id(fh, file));
+err_untrack:
+	luo_untrack_file(fh, file);
 err_free_arg:
 	kfree(args.arg);
 err_module_put:
@@ -395,8 +407,7 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
 		luo_file->fh->ops->unpreserve(&args);
 		luo_flb_file_unpreserve(luo_file->fh);
 
-		xa_erase(&luo_preserved_files,
-			 luo_get_id(luo_file->fh, luo_file->file));
+		luo_untrack_file(luo_file->fh, luo_file->file);
 		module_put(luo_file->fh->ops->owner);
 
 		list_del(&luo_file->list);
@@ -668,9 +679,7 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 		return err;
 	}
 
-	err = xa_insert(&luo_preserved_files,
-			luo_get_id(luo_file->fh, args.file), args.file,
-			GFP_KERNEL);
+	err = luo_track_file(luo_file->fh, args.file);
 	if (err) {
 		/* A retrieved file is new, so it can't be tracked already. */
 		WARN_ON_ONCE(err == -EBUSY);
@@ -788,8 +797,7 @@ int luo_file_finish(struct luo_file_set *file_set)
 		luo_file_finish_one(file_set, luo_file);
 
 		if (luo_file->file) {
-			xa_erase(&luo_preserved_files,
-				 luo_get_id(luo_file->fh, luo_file->file));
+			luo_untrack_file(luo_file->fh, luo_file->file);
 			fput(luo_file->file);
 		}
 		module_put(luo_file->fh->ops->owner);
-- 
2.56.0.542.g3ef89b7020-goog

