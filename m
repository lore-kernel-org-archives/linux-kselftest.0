Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3BF3783A2
	for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 22:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179595; cv=none; b=ZJBQmuAAxWus+klWvJlhzUPbJpHRUlBB7kEDMv2e/FmVwdMecm/3qqV/I/x5e9pspE4ij6Uo104SPMkzB4KxMTkjS9IyoJHbjA8zXdh9/RFPdmrxV+hrP0YuJ95PrK2J0VSDLOnYyYYrXVXRVAxO1CtRkfb3ogBAkBZomEfaeSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179595; c=relaxed/simple;
	bh=bhQWLj7PPI9UClPVVfb3CJJP1nHiv+tJKCbUyOi+1+A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PWpLCLm1HdnPfNarUpWmZPnusiSllY6ZJJempH3DNo9+jkXZUmKOv9X2mXwSrnI4Aif7z6lSaBQu9XsBSX7dx9EyTLEElX1EXYlI89QFqzdB1saRS1jd/ot+XpUcEuSzjPb+guIi0QbQmJfEAwx1MSC62g7Zua4Kiiz4ToQYZs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=B+cCay2m; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="B+cCay2m"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9155183b42cso13938485a.0
        for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 15:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780179593; x=1780784393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0UeBGKKNpBDiXtsHx+XK9ecjuYaKOuvdeJHksP7ylQ=;
        b=B+cCay2mH6PBBLqoGu+xg01ymvomz2Tj48fXNn2ZFptH6Hz6gjg8MbSHIq+BP0zId0
         KCyh/Kyo7Rw+K1FDSyjtY/wd3O3hOSWYkpu/aXVpq7hkiFd+zCcVEexRSQZOFH2rda4X
         9hx8eZNKmLyafLJdjgfsZv328I0B9a7TGlHwcMZ2pcrgB4cgDpfkdexSzxmzFVxoXo2s
         2pHmWf3oeGdOcbUZtTC2ERFXKMWbJ8OqbSGVKSfISoRQDYiRWXTRYMU/UO2L39FEGyrK
         xPvDA8pKtVH7NfuZXAeQU/oJ5ZwPn56y7NQVyUSZUUcySWgdLv/SUDNs8USLS4scofKg
         gAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179593; x=1780784393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M0UeBGKKNpBDiXtsHx+XK9ecjuYaKOuvdeJHksP7ylQ=;
        b=b59TxRXdFSeZu4JXp/rSNMRnCnOKtcv6//KQ37Cn8SkM1Qo7i4m5sxZZWWGkCZWep2
         LOw3eqPVMroS9Pw3aMOxwofD4tZdwqSU5klKnaka2rjxUDar5Tohkjh2XADKmpL0Vz/3
         iO5JgxLHqIz8uQCYm0bP3RuSX8yxFhr3cz85mQyZjrJQgJUeHqbEIJWMkDYhazeGyzsk
         rDFHhkDN7gUh1xAqIOA+DqLPRYVLrC049YkWCCxpCztxm4hxhXA9IjTBHxCHHlVHVPei
         8ctrSf/Fda8r3WETQQEK3DnhXf086I94qLy+aTL47vTRCswsxWXq5Lghmh7aGssi2X16
         4apQ==
X-Gm-Message-State: AOJu0Yyl+lmeS9nM0SVtFOlB3GSlsGG4GBgdWxyBnln51op6N/waS7yr
	b9zjLuhH6Uid8qbhLL8MPtPd+r5cDyWvu/vlxUpafz4+09Bf2JyqB3mkEMozXMvDFTXgNr+NHJp
	eZcBH
X-Gm-Gg: Acq92OGWPxE2yJrHy71dG8qWmRyw7ss0YK1dps0YsoJnCZ1jr9RRBlElWwwSbu0xDEa
	Pbe1ZqGa4E1aiFiJeDHUHNfLuUtNXlifTSEqURJOOJeR2tcCL6AekGsJQr7gBe4vxtETeSmzeFW
	l3OVf3Mt1Qyf+xlVnHplGEw9snqheGDFQ8ygOa6tw+AyXuUM1rZ6owF+OWWlwiLYo6XKDJdsKCX
	HeHc2hXroxOxsBMvQXuVi5cFE+efxFG2hXSgeIettkHqZ47EMJ38sZ0QlWzGBMAJ4kQYBKAg/Kp
	vjkRbpH212BrPsQtsRzwrVmWqKFHT0I2hewXuJu1ijtydzBahfZ4cFlyeF3kDunkB2XdKxdWdrh
	sVI9aDFz72G0nDT/upDAg9XaGJ4nxeGYstGiPsydN+GhhUlyZxK662QZNHbkDoFVRA7z7LTKwoa
	mkKHni9Uh4VUQwgN3yIGm35+e2Tw9aOVVQdXEBZM8waUFmqvodYPBAJkWeU2v2YZB+RRLU6NRp
X-Received: by 2002:a05:620a:2697:b0:914:b4c3:997b with SMTP id af79cd13be357-9153decd84bmr587250885a.1.1780179593182;
        Sat, 30 May 2026 15:19:53 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-915324868a0sm651790085a.18.2026.05.30.15.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:19:52 -0700 (PDT)
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
Subject: [PATCH v4 05/13] liveupdate: Extract luo_file_deserialize_one helper
Date: Sat, 30 May 2026 22:19:30 +0000
Message-ID: <20260530221938.115978-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260530221938.115978-1-pasha.tatashin@soleen.com>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
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

