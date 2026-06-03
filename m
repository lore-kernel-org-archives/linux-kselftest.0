Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECF838E8D6
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501505; cv=none; b=QJy3JsC0I8S0fHmrPah0YKmDYzPKWFT4DFWp7H0LczEj+cy9yr0Z0GpyytKf6frwYtnSf27+0dj8WNsbYGn4aQ6JzpbDhbr4zDMHl8WpNAb3wwznpNqECTZeTjo0H3MK3nm3Y1H2LTrF6B56BZPjwvLTDgoWuPAjQNa5Bus2xKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501505; c=relaxed/simple;
	bh=bhQWLj7PPI9UClPVVfb3CJJP1nHiv+tJKCbUyOi+1+A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bPph2FGGJCfaYQtHIwf/8M0lIY0fo3U5xtc3ghUCXPjw5r5HN2eKT3Qvua9Exh7r9+BlvvYgq9sv9JecvqMBzZ0tAPWpJU2q04kP0K96Atb4WGCF+vPpzhAw53I2XSbD+FCh+R0Szwo2NEeVRp5O9Tz5ycHbfNl4UtLVPxHacE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=RDnoz0xh; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="RDnoz0xh"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9159477c893so60199485a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 08:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780501503; x=1781106303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0UeBGKKNpBDiXtsHx+XK9ecjuYaKOuvdeJHksP7ylQ=;
        b=RDnoz0xhdQST67dpD/3XTd3sl734Rd/Q4ixdi8B+7ngVRkJmAZp2RQChXS7t3TmW5I
         iCjAXP5sVol2Iwf8Ns1k/Pk26qTYrkFNyaUO6LVmW5QJgmJcHVOZzayLpcQoI7HMfqYd
         hdy1LaFx1qDzF9JLe3+fMFOE+Z9vAEr7NtIr6MnMypeE2jQrpZqmAxEt7QyAZ0M3TN9/
         3wq4uIxXsEnBFWM0JY8e9qtbGOhxs3tHduXVIVoltn1FWzGCmobj73PTocwRkkEIlcTT
         66GTCOJLNsxfoGEyPu3BfOlIYkDsX9qSN3Ye+NAGzsZ5BjVdomdVOg/txxOykU53X0X3
         LelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501503; x=1781106303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M0UeBGKKNpBDiXtsHx+XK9ecjuYaKOuvdeJHksP7ylQ=;
        b=C9VnTSjp/8opljSngiZbaXEIEfl1F+ZdsvmyFN1x8XQ71fEUvbyVjDKMGBvbe6sThw
         1/PrVR3A19sZmvEJ4xkXNPAOwcUcx//TvRvvRUPScu8116x25/0jrp6FH1PaVlr9EhMu
         fuhz2fEHNfU1XP52SlArZIruyM4Ti754lieib5xRcKUvgTLVCBire9MVdXbuDqIP2tel
         GsUElVCw7FUHsUBoKkmOqPv129RLSw05JOuwoezcqytbFDJUZJ2ZHRniD7nO6XQop0Ya
         JhyjUMYJml10083Og7WGXQrxP1U26aukNmlnjF8lKaJGy9ftLKXPMpv2QaWf+skbC7fq
         N0hQ==
X-Gm-Message-State: AOJu0YwATfLnagTQxYPFK9iT3k5sN4h1WF9K7VVYW7Ucyn8lvdReNqcB
	SzJ/Ax6T9yu+zc59Ca3j5GePqCf+YJKPXlsG0vomwvQQPHn5VtYFLGuWnwFf1OtihL9v7SXvQAF
	wFxcz
X-Gm-Gg: Acq92OHOTf+M1u1qOIn7RseRlulIMHK5GYGrMnqLJdgidcYj7BQ3bHfgHM6OkXjWqmE
	rTNtGh2z415SwNf3VIZB6IBM2Gu9dbPM0fhWl+cnG8SBw/n7vi28OpUaTCC7067pd75sIvWVZ9L
	VaV7hUhXuU04kxglqw6p4/mZ5U9LoR5ftYabwfoXiRFdDQgV+ERWruQl2MXa1CbDtsukfGTJK00
	TJdD3HXv2u/M1CLsfp5Gw7TTGm8oz79djlCt0AzP1Pjqq8EaefqccJv2oYk4509xQMVtbWfyzkq
	ALMQy66tY84O+YC3L049A2kk4c3IdO/7eiElwd4Jaj4xEdsCmItz0kn5kw0pXXVjfJHIN7ABv89
	kXNeKj41NNWkXzMS2G189roa6KlFHOhbYBtQjFRmshyEakXqti78TZRQd+Xo8A7ke4hiag2xRWt
	EzelYJiWvk8kAhpQyaKBDHmm1CmmXsoA92tQzRbxpU+3AU/4dJjigiOkkD1NiZVw==
X-Received: by 2002:a05:620a:1a09:b0:915:4212:c483 with SMTP id af79cd13be357-9158a7dfdb2mr674935885a.45.1780501503068;
        Wed, 03 Jun 2026 08:45:03 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a259428sm273352585a.21.2026.06.03.08.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:45:02 -0700 (PDT)
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
Subject: [PATCH v7 05/13] liveupdate: Extract luo_file_deserialize_one helper
Date: Wed,  3 Jun 2026 15:43:54 +0000
Message-ID: <20260603154402.468928-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603154402.468928-1-pasha.tatashin@soleen.com>
References: <20260603154402.468928-1-pasha.tatashin@soleen.com>
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

