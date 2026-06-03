Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4EE3F5BFE
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 03:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780457357; cv=none; b=pneU+7xCX9o3t++wA/mus1rMO8pAPuR09+7/Mm8GHyb3RQh9fo1zwDsdzzclqDCXSZ6iQgd5MvH4jZMVSH/Lb7c+HRWdBlPQrO7Z0mhZ+xbjN5+52vW3Zsm7OSrOdHLzSFVklxVAFMJrDNu11ONugd8OekbY9oWAwlUvMz4COtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780457357; c=relaxed/simple;
	bh=bhQWLj7PPI9UClPVVfb3CJJP1nHiv+tJKCbUyOi+1+A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XuBBwveaCHmOFzvEzuL+xz6Sufnt6XeJiiHj7UkM4H2548a9U68uK9wyMfAOlux34+iRCif7gH4ejP+L2vp5ARGIbtuFWRKN+U/kRoyEgKDPb7JM/m6F2mtup/rt/ztBj4DjuZCZNCJG+uzBcaqFueNSU30p8Iu7Eiy2nfcLyP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=b0UihE1q; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="b0UihE1q"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ce9df48e1bso31844646d6.1
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 20:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780457354; x=1781062154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0UeBGKKNpBDiXtsHx+XK9ecjuYaKOuvdeJHksP7ylQ=;
        b=b0UihE1qbydPBT3aAxZax/HNmDv6aVh/BfpF5M6dC/MZAOl0zPU0b7mtwrkgiPUINa
         faI354ziYU+ZOk5Hu0LwV3ePqC7XGQgwYhI/Vz247YkT2x1xhIaK55Esp+a3dIUyfaE9
         rQkgQR3GWxiyMnVxodlg1jaao+k4lWM3HlNIZiK8JAKIG8x3b5Y1Etnz2lBEi+RWimDV
         WD9fMfzeVvUawywEpwZzOXVaJBduWQtYvtr3H1OMTYIkFysJ3PrEckrVrAtXMuK2sa/j
         w1ytAYnYMvRJufAdGWI8oJFv6owf0QBWAmsOhdjo7iOuQxPKWKnS0BGiA3ZhsT0ko9x8
         PJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780457354; x=1781062154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M0UeBGKKNpBDiXtsHx+XK9ecjuYaKOuvdeJHksP7ylQ=;
        b=X2fJqavvhkAscGIyrNi93jFD4sBKOEUD5BaFOfyY+K4dY6aFwb/Ax7xuWLd6gNtSiw
         i1eMQKUafgwQQZdOo2v6qakBCH3PNzynowvrXfJqqL03I7UtJdQWsccvPY/GjfKvw2hq
         LztjoeN6uYxAct3fKXj+qH9gywUBv2KMevQXL1CjR5bcRLOXComNX5jJsnxdTeJbOuEZ
         FeL7u0LqYJQ+LIbxD58ZWMp8iaGVYzS5HniQmMPGG9+bqTyl1AMn0fQVm97XNtwrOLR7
         OCFxK34SxOXEwVlqtYMPLyuqDkJMX1q5I3CTn1Bou2i/Hlc7+QM5VUbs2Hx+3iBkG+xh
         ynjg==
X-Gm-Message-State: AOJu0Yx9ryOb4HKe9EeLATasFIB0wHeLN98U5A5upOSW8uv552dgN2PF
	tRKkF9z51qFoinioMAc5vxvLckdW0E/q628C5rfZm/NsiIUk1TRdQNiBeHfjKc3lUSTNzAZhXgs
	SfzTz
X-Gm-Gg: Acq92OHpBpY1EvlIE+7pYLm0SMH6OiTOGbjpB1VNaTZMX/QgLYjFZe1Dgj71eWRhHVf
	sshnpiggc/vgXbvoQvjfiwqmNiRhOsqQRDTyWU2Ok80j3UYiyFUd3sbN7o+pRy9XLZZfaSIzYM2
	vuF9bNksHaCOequV3U3gf+CK7mLN8fPAaCiH31cLIK8R0RYxEzsBW1KIiqWJpboZxM2Sy/DIweK
	RYyDQ0Pqjoas42IM2qQCXJE7qfoWzaeZ1UFfVkFobOrA1umM3f/rlGYR+p7UHdb/Djcgqf+t6Bs
	1kgp5ddE1DqLI5Me/xFAx5425jde9wqU8QkiDVz2zQaZliiasC5RiDUXHR1KE4Ghb336RztVF+4
	rqUSpbxYjaMCRbzprUmIQ+weTtoy2j/GTVSKb7Nk81cJ/atnwaXTmpxMT5CDuDsWxeoDF7kqEwb
	KsFpVQ6w1+/U7H0g8zElDoGk80vz12m5ujDktaqvhknOKs85lhVODZBfIR7szQuw==
X-Received: by 2002:ad4:5be8:0:b0:8ac:b4d5:50ec with SMTP id 6a1803df08f44-8cecdcc5dd2mr23007136d6.38.1780457354509;
        Tue, 02 Jun 2026 20:29:14 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b3b9sm9244566d6.45.2026.06.02.20.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:29:14 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v6 05/13] liveupdate: Extract luo_file_deserialize_one helper
Date: Wed,  3 Jun 2026 03:28:56 +0000
Message-ID: <20260603032905.344462-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603032905.344462-1-pasha.tatashin@soleen.com>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extract the logic for deserializing single entries for files into
separate helper functions. In preparation to a linked-block
serialization for files.

This is a pure code movement, no other changes intended.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_file.c | 77 ++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 33 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 208987502f73..9eec07a9e9fc 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -753,6 +753,46 @@ int luo_file_finish(struct luo_file_set *file_set)
 	return 0;
 }
 
+static int luo_file_deserialize_one(struct luo_file_set *file_set,
+				    struct luo_file_ser *ser)
+{
+	struct liveupdate_file_handler *fh;
+	bool handler_found = false;
+	struct luo_file *luo_file;
+
+	down_read(&luo_register_rwlock);
+	list_private_for_each_entry(fh, &luo_file_handler_list, list) {
+		if (!strcmp(fh->compatible, ser->compatible)) {
+			if (try_module_get(fh->ops->owner))
+				handler_found = true;
+			break;
+		}
+	}
+	up_read(&luo_register_rwlock);
+
+	if (!handler_found) {
+		pr_warn("No registered handler for compatible '%.*s'\n",
+			(int)sizeof(ser->compatible),
+			ser->compatible);
+		return -ENOENT;
+	}
+
+	luo_file = kzalloc_obj(*luo_file);
+	if (!luo_file) {
+		module_put(fh->ops->owner);
+		return -ENOMEM;
+	}
+
+	luo_file->fh = fh;
+	luo_file->file = NULL;
+	luo_file->serialized_data = ser->data;
+	luo_file->token = ser->token;
+	mutex_init(&luo_file->mutex);
+	list_add_tail(&luo_file->list, &file_set->files_list);
+
+	return 0;
+}
+
 /**
  * luo_file_deserialize - Reconstructs the list of preserved files in the new kernel.
  * @file_set:     The incoming file_set to fill with deserialized data.
@@ -782,6 +822,7 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 			 struct luo_file_set_ser *file_set_ser)
 {
 	struct luo_file_ser *file_ser;
+	int err;
 	u64 i;
 
 	if (!file_set_ser->files) {
@@ -809,39 +850,9 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 	 */
 	file_ser = file_set->files;
 	for (i = 0; i < file_set->count; i++) {
-		struct liveupdate_file_handler *fh;
-		bool handler_found = false;
-		struct luo_file *luo_file;
-
-		down_read(&luo_register_rwlock);
-		list_private_for_each_entry(fh, &luo_file_handler_list, list) {
-			if (!strcmp(fh->compatible, file_ser[i].compatible)) {
-				if (try_module_get(fh->ops->owner))
-					handler_found = true;
-				break;
-			}
-		}
-		up_read(&luo_register_rwlock);
-
-		if (!handler_found) {
-			pr_warn("No registered handler for compatible '%.*s'\n",
-				(int)sizeof(file_ser[i].compatible),
-				file_ser[i].compatible);
-			return -ENOENT;
-		}
-
-		luo_file = kzalloc_obj(*luo_file);
-		if (!luo_file) {
-			module_put(fh->ops->owner);
-			return -ENOMEM;
-		}
-
-		luo_file->fh = fh;
-		luo_file->file = NULL;
-		luo_file->serialized_data = file_ser[i].data;
-		luo_file->token = file_ser[i].token;
-		mutex_init(&luo_file->mutex);
-		list_add_tail(&luo_file->list, &file_set->files_list);
+		err = luo_file_deserialize_one(file_set, &file_ser[i]);
+		if (err)
+			return err;
 	}
 
 	return 0;
-- 
2.53.0

