Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657762BD0B
	for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 22:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179596; cv=none; b=kXL7e+nO24TNvoSXXn36CQk0XAEo8V2l87Hob2pkghBWxenm9nt0kYQ6xEKihK2UWeHGg55VODpoAas63vnlKLDHMpdN8tUhGH9LUiT5iCHQSZ5K446c7va+gtzJE01e4eQ+vmtwUqwQqQhgU05I8TLv9HnM5EHF+qEbL+2btEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179596; c=relaxed/simple;
	bh=PfkjUT85iG6ZEEiSWFVhFCj3d2qFujCbQIn6yvDet10=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/31STYHbwjyo6GqKkmXLx5L7/O0hf70+R5yI7G/Zapag8X4Ry2cIIx+ptrBoxFuh2jXr4F2UrOluh1CkaRkMPWi7G6IK3ICCLGN4Y6AnxC1oYKJ3cR6D5pd/Ooz6Kguh0cL9pQnQ2Jb5qVbZtzCgm/fqbJR9NBuEs0270V9Jc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=GlUcBfZ2; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="GlUcBfZ2"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-914bfa75911so948813085a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 15:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780179594; x=1780784394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WamWMdUBlghIACFozBjX6pZ6qu316jN4xzYIhWYXbwQ=;
        b=GlUcBfZ2lpiRZ+nyYGKM6icl5ONTnYnjkm308SlYiLtcRKcm2Y75mKs3hy0raZ62cT
         8CH43YrMGMl6UHINfT9rFHhFTvHYYDoAOAMTwcCCMSDFLMeHZ4zAKeoiSGnIUaPPAd9y
         l7KJfG06hxlUX/fO0diTILKXI8oFA6ojG3Ib2PFrWFQ7jeqbXgKRj8J1FX9s3pBR8s9Y
         CmWaej2IhIAC9d9iF55qnoSwEzYrrQJyRJx9ITUociwISl04wL/aCmUhVn9ptcZlDWgf
         zrTWaYVyjgMWCoHUZKtiVif7fozngwP83nz/MSFfelTpM0NwKdXHuzzrvpjZbFTweEYg
         Ce7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179594; x=1780784394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WamWMdUBlghIACFozBjX6pZ6qu316jN4xzYIhWYXbwQ=;
        b=S8l/zldkDykfsZRAAkpVSYhzd7NFjx1HV0IEOWYSZOwKi0L8gmA22rNEXq/7KbyOz1
         TZ2LdZIOEosfjDl7o/e6uqnL1keR8mhpkKflhpXNdL2VNaUsLyg2Jyr61niBoMeyw9K7
         9s6IjJjBQmYAhNQYfcrsexMyX073w6fbIIbighA4Gu6XzXjHpZ6yVjIGBfTdp9q8ftR2
         1FNGJS9pOAPESz2eBeQ64yq3Bmah0slhpI74OkW0T35RMV19CFPii2lvS3a0IqW3USft
         /Vrdo88mBI1zqR54LpzZgb7v8lSeCYEJV/RDFK3T91Obylszec6Ah8d0SqBNImAke6+f
         d8Hw==
X-Gm-Message-State: AOJu0Yym/1iIQ/EcNEl05YeKFpAYRfUqFRD2j+4FaraTlaj5fWW4DlRV
	FNdn4zh8ekk6oAiBgf4qrVVR+QJTpdFKiXNSXrLb2fuoTUh8oFaLBrup7qsXOLrnAhapR4xYNC/
	j1xHZ
X-Gm-Gg: Acq92OGq5ZIyAcH1uJmBKa7WtUklGoMmXOXqO88ofpAoIiQDLwsSdO9nLKBmvF+QAep
	Yrnhmu4hzwIN1MnJsL+RJfuMgFJaZOeiHZecZbJq2aWHu4Kx3uH+cttf+dSmdVsw3EsJaTudod8
	EJw9V1/dZhhYv79vwVwCUbpxCRdves2EeR23EnCLpM1BGAHAeKakrym7Xlm+7YWpZkAMBwqMeTo
	1fn3tYMTVnxbANcvrMnvHMlpGV5SKzdm9Tt9UkqVo4L0fa/KskuDOLvTSbjnI+zou8bwwU/Sryv
	2Qk/Nb7axzB4h2+L/7ANnDH99ebHCMHfilGKYkmXhpeFSa+6KAh0RG3dQOEcRuG889oik0pnBmo
	ZCLu44guE0rih4n9StEuVIY/njB7lni9Rv7orp/nCbkwx+dnY4B7wVVglU4oSzMKrpAVzLWSYRT
	FHhbH+CRz9JXXZYcXk8s1gqhxE+PqoN1BssHIv8nDrIqJQfH9rk29XUmu4pZVAMA==
X-Received: by 2002:a05:620a:198e:b0:8d6:6db0:88de with SMTP id af79cd13be357-9152fa4cdfdmr980466785a.44.1780179594396;
        Sat, 30 May 2026 15:19:54 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-915324868a0sm651790085a.18.2026.05.30.15.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:19:53 -0700 (PDT)
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
Subject: [PATCH v4 06/13] liveupdate: Extract luo_session_deserialize_one helper
Date: Sat, 30 May 2026 22:19:31 +0000
Message-ID: <20260530221938.115978-7-pasha.tatashin@soleen.com>
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

Extract the logic for deserializing single entries for sessions into
separate helper functions. In preparation to a linked-block
serialization for sessions.

This is a pure code movement, no other changes intended.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_session.c | 62 +++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 26 deletions(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 3b760fefa7b9..b728fd9e3ed2 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -525,6 +525,40 @@ int __init luo_session_setup_incoming(u64 sessions_pa)
 	return 0;
 }
 
+static int luo_session_deserialize_one(struct luo_session_header *sh,
+				       struct luo_session_ser *ser)
+{
+	struct luo_session *session;
+	int err;
+
+	session = luo_session_alloc(ser->name);
+	if (IS_ERR(session)) {
+		pr_warn("Failed to allocate session [%.*s] during deserialization %pe\n",
+			(int)sizeof(ser->name), ser->name, session);
+		return PTR_ERR(session);
+	}
+
+	err = luo_session_insert(sh, session);
+	if (err) {
+		pr_warn("Failed to insert session [%s] %pe\n",
+			session->name, ERR_PTR(err));
+		luo_session_free(session);
+		return err;
+	}
+
+	scoped_guard(mutex, &session->mutex) {
+		err = luo_file_deserialize(&session->file_set,
+					   &ser->file_set_ser);
+	}
+	if (err) {
+		pr_warn("Failed to deserialize files for session [%s] %pe\n",
+			session->name, ERR_PTR(err));
+		return err;
+	}
+
+	return 0;
+}
+
 int luo_session_deserialize(void)
 {
 	struct luo_session_header *sh = &luo_session_global.incoming;
@@ -555,33 +589,9 @@ int luo_session_deserialize(void)
 	 * reliably reset devices and reclaim memory.
 	 */
 	for (int i = 0; i < sh->header_ser->count; i++) {
-		struct luo_session *session;
-
-		session = luo_session_alloc(sh->ser[i].name);
-		if (IS_ERR(session)) {
-			pr_warn("Failed to allocate session [%.*s] during deserialization %pe\n",
-				(int)sizeof(sh->ser[i].name),
-				sh->ser[i].name, session);
-			return PTR_ERR(session);
-		}
-
-		err = luo_session_insert(sh, session);
-		if (err) {
-			pr_warn("Failed to insert session [%s] %pe\n",
-				session->name, ERR_PTR(err));
-			luo_session_free(session);
-			return err;
-		}
-
-		scoped_guard(mutex, &session->mutex) {
-			err = luo_file_deserialize(&session->file_set,
-						   &sh->ser[i].file_set_ser);
-		}
-		if (err) {
-			pr_warn("Failed to deserialize files for session [%s] %pe\n",
-				session->name, ERR_PTR(err));
+		err = luo_session_deserialize_one(sh, &sh->ser[i]);
+		if (err)
 			return err;
-		}
 	}
 
 	kho_restore_free(sh->header_ser);
-- 
2.53.0

