Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450FC36A36B
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 03:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370247; cv=none; b=t+j8TNFaap5gDCXIFgdwiG4vDB/9MQv/yUbL6cBS/oLTM0CGA9OPcDUPdMerlF5tX7QI5XFIoVSUuCVKmVDM/GSwAukfMKEAE9HC2mbf8+CMyrOZP3QhRDzNqh9/axEqEOKUOmokEwqB2NQVtlg7nn2r0vFFkqs868V/zGWMzPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370247; c=relaxed/simple;
	bh=bhQWLj7PPI9UClPVVfb3CJJP1nHiv+tJKCbUyOi+1+A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D3ZaN3lrsLQ97fq7I89cd9AoNGJS9mJ4rMYhfYqvrOY1ESi9S6odfUePwNtrUixigxcxHmhga1D/+mz6osirb/oy4qSsRKoK3E9ih5RIY4fhQN11GgmCbyRq2ypqmbcqgKlBqdrwTBZJwzrjahAGJGu0Py68ZIsWACTmCliJVwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=is65wlwj; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="is65wlwj"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51749fe63f0so18585081cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 20:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780370245; x=1780975045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0UeBGKKNpBDiXtsHx+XK9ecjuYaKOuvdeJHksP7ylQ=;
        b=is65wlwjpTR/tCrzZycG04HLDVkHdT0pPCD2C5EwsQttUHkSgKLjCnlM+MtXHwblnj
         DWIKanjQ4bG3Mix+DpA5l/fFShnXvTGGowa/LYAvI03Tj/bZZVjKxn2xWhFqJf4Kxu3G
         RiGbgUhjHhmhtrNxVe2mCDO8YCBO8Ovjzzfgrs8YoqbM9mt4MEbjSEH/Z6aA/FfqtmpR
         3ZAZvgqx1q8sK9yjkjV4Lbzb8mb7oDfLMkQyQwOyLPDUfQYOd/VS0RbxwjcS1ZyS9IFk
         5+tC/mVPhkcKtsHmYZDfd7Vtt+VLiiy87xWVx7kOu7TehwexOylOxPoe8zRW4/DFCQ8U
         dWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780370245; x=1780975045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M0UeBGKKNpBDiXtsHx+XK9ecjuYaKOuvdeJHksP7ylQ=;
        b=tNHayCJyWYhLua0TY0p8V240MSSzOwjY95QWjfpgoaNNMXT8Kbz5yFsj7kboMHyHZr
         NqTCgyBaywqjNqYCxmKk6fv9Vr5+HW8ckg3O2c9ao1a1Fnkz/e1dgax9YnZbkJrJvJAf
         mUbM76wrvygPpSUQ0HO6AiVJSt4wRsbwT+aUZRde488R7Aoqhj12TndBNOiuX72mmYsN
         nkHIji5PA7+1Gfie5Yrs9Y1MSPybPQGqnzITWKjL6NGE+aQ0cGfgURELA+PvQP/xztqU
         hIF2Obc26Vvn+PVALxckByIPBZHGEb8AtqIasK9dh8YuICzBAVWpjdAut8HPyGicO4Ym
         dpqg==
X-Gm-Message-State: AOJu0Yxhl5+vNW3i7sIzLlcREtY9/SFxU3KUpRTfdqO5GN8JMp4z4xaW
	G+WjYwvRmdHLzKaq7QqmXJs3JxyQx+CcyEXnrjtptymiEPxpn9ePu2aMRO4z7SWnKxJpSfm1YpD
	4oPuy
X-Gm-Gg: Acq92OH9ZuebRVi/Q7dSTbMXOMWf6uy5ZSGhIzlLufkiwdHDTNZiDgFw64ACSC6NdIj
	Xvx3uu4XawnnGsZ81jlvJk5ptwPByaCSv54zn9l6RuDyqA/9yC9YzX2E92fz50KWJYFKt1Lojqs
	86HHR/O4+iztFkGZyJZ3Ba/EuI5G4oYlZWlBHiIYaZ+EYDdT4y07Wo4r156kcy3piOqrTT+kvwD
	f9Oy7YaGDLsqs3UEZbDoSUA0pKACDTXtuP5Z2WX9kqQUmKxCO2fqIAfCUDx0QWtEOOT3tZbefen
	83/9er03CHbJ4Zcns8KUwQ7HMw3O/GA81inIgwvNuMP2CLY4lAlI/fxV/g43tcVXNsv828x0lNh
	lM3Pqk/2VnsY08xDUcPpj8yl8qy3xc40FDqhjWdFbbm5NLenRAIDE9Lq/cNgM8guLHHkeXvPgGA
	7l9wahPKhNhzUQ9tcmqRQmKacJfKtEN+QXrQnedIMxU6vIWdQJ9SnXrmbtWFdVxg==
X-Received: by 2002:a05:622a:5986:b0:50f:c117:1c52 with SMTP id d75a77b69052e-5173a5e7f0emr188951681cf.4.1780370245318;
        Mon, 01 Jun 2026 20:17:25 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741b29745sm71219081cf.8.2026.06.01.20.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:17:24 -0700 (PDT)
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
Subject: [PATCH v5 05/13] liveupdate: Extract luo_file_deserialize_one helper
Date: Tue,  2 Jun 2026 03:17:09 +0000
Message-ID: <20260602031717.197696-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602031717.197696-1-pasha.tatashin@soleen.com>
References: <20260602031717.197696-1-pasha.tatashin@soleen.com>
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

