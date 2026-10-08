Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F5138DC7C
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469629; cv=none; b=CdngTuGWG9al4m1fRynRNjr5bdtlklbyG/OwCZupRHl3P7qeya0a0jcb0fZDHufx24Lt+RR/FwAOk/qulU7MyCOwFvO4HYYe5h82mqV52+eist+2GaSyNuhy7wkHrVReJGHDcE+BFY5ONFW3E3n38B720BLnBwY7B3WdJ0pkOBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469629; c=relaxed/simple;
	bh=XeLGjfK+21U6lHWRK6NjJAkvdj0dja8T2p6k2BrqbxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UNAIZOFsC5eYbKeuOWi92rneypINcw/021+HaSC3q8M9mOKuZJ7uhFnJ8vl8FrZy1V54lQol25bwWb+AEtyOteNahQ74HSzQ6aB3SE4NGQHhEySz1pdCzZ7DZOLRX9SvJhgcLZbD129CKM0umAwF2qEg6DpK6D4v8AS3dKUy3Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhXhZsdI; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhXhZsdI"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-487048857f6so2697227f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469627; x=1792074427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fpxqDP5CsmzUMOKjttGXHMSiBcLd+CV1qvWa4yOxMC0=;
        b=XhXhZsdIDTcQXESmeb68lL868Hlbzmn5TePG6i2+qw0RDjBVf/8UXho7Wky3mTkTV4
         NxY/OdUVlyzx++KomWEiG6GKpuDTmLlEzomom0sHCTvxFaHqjtcbpaRtpWcIzmW5WEUi
         P+wc2iSGaZIowkfLEcuUzKrfySOv4Q0cG6MCNq+MlMZe1A3tRprl7inKp7OYb6aaCVvH
         8cW1Q8mHuPH2KTDGJxrxmb4XUCAMYGPbWlvnJbHxpvvxEE2o3KqX8eVVWYcPi+ES54FM
         wrdwH0QRGcLJV81i1DVw6oTs+N9qx8mcto880/5iyVmKP4WUPC7I88nrHyhjy3+yA+eo
         gTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469627; x=1792074427;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fpxqDP5CsmzUMOKjttGXHMSiBcLd+CV1qvWa4yOxMC0=;
        b=F/xx0Zlbe2pZNXwKFCWu2XWCD/+3fTNCDBGwhup9OKQrWBNvvlsgpB3/ID7B1adaVP
         upuOmXAbBYAFhqtWJ7/yMDNg8oLe67MaPKGWq2bB2f5IAmjMFWkCOMkKPkJKpdD0/bK8
         mYxJo75Ivsz9sQzRd4FPJeoXtOobfeUzWBBEd8kJqx54q44i0qk/tUgLgzXJdURqJALw
         6uRTO8XmO0cdhwe9+As0LUecK/KiePGan416meCUSdUpZhQ2RfzswiDX8Vwy5di6UHM1
         maXgE/BhY+e7aLeNCDUrXFh9lC5aT3cBMQ9Mr4qhkLsXIE+ZjNKZQpYIDkT6+99622ZQ
         U51Q==
X-Forwarded-Encrypted: i=1; AKwUvByc2dRXgo6oc7EmfqG7NZNZyDZIXh+FpUi+jRupR10fzXZvG7C3Ja6DhX1q4xzdTbjNRIj8hoU4JlOp/FsUv9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKbpqhRm/lMPAR2F/e3xiwiA1DX+Wn56MjeiMp6gQXriwJS6Vn
	ceF2A6heYHwYgG7IEWV/D56r9hT9eQ+wc8lW+Iowk3dp3GyEX1rVqifs
X-Gm-Gg: AYBFou0+csXaSJdZvKUAv9UjuP6uV5mAV0v/0OOkAlyW8eGH0SX8kArCJc4zGc43ccK
	rOQkFDCtnTATbyKJgfk+151SLZisySVNpehxfH6i5dXeXxoX8DJGFCOR7OWq5xtS6lcc7yTyliB
	Bq6NIGg937N/YEive9EMVT9O86NwfnOz8rul+kuQXo3EUJcK92sWI4te2SfZixqEXSMKx87Hfva
	amFOUKRBQ6HfFbp9Dw1FJQ2TCRnOTa89qgE68I1SgWF71PU6xvh/mo73m+2HtaOLEK0MwfwavXF
	k/XCGewP8vMmtUL/EqLAjxeRS3IX17MZP7m2BhWRXOcVtPnSZq4FhJkwyNFeOBsIgmkRPwynQwR
	TOm0iS3ELZF1KgJwDhopNgOOaUIaZoAOwluRKqwOQyc5oJkvUZRDpU8dp00SLs2FYnuISUM9kCQ
	aGFOtXYOV/AQSuI/0PGMZJuMAO7BQw51+rmlmh+tExVxXtKO99p9QAzyjwJuV6ea8MpNBCVfKIS
	efaeTGY7XghW3gHGgZP4hjx
X-Received: by 2002:adf:ff8b:0:b0:48a:fd58:a7df with SMTP id ffacd0b85a97d-48c72896f38mr7829329f8f.47.1791469625397;
        Thu, 08 Oct 2026 07:27:05 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ca8e2e627sm3241531f8f.20.2026.10.08.07.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:05 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/27] selftests/landlock: Assert tracefs_extract_field() results that are used
Date: Thu,  8 Oct 2026 16:25:38 +0200
Message-ID: <20261008142604.39107-11-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Several trace tests check tracefs_extract_field() with EXPECT_EQ() and
then compare the extracted field.  If the extraction fails, the field
buffer is left uninitialized and the following comparison reads it.

Use ASSERT_EQ() for these calls, as the other trace tests already do.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/trace_test.c | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/landlock/trace_test.c b/tools/testing/selftests/landlock/trace_test.c
index f9b293a9dd56..a331df746dbc 100644
--- a/tools/testing/selftests/landlock/trace_test.c
+++ b/tools/testing/selftests/landlock/trace_test.c
@@ -175,19 +175,19 @@ TEST_F(trace, create_ruleset)
 	}
 
 	/* Verify handled_fs matches what we requested. */
-	EXPECT_EQ(0,
+	ASSERT_EQ(0,
 		  tracefs_extract_field(buf, REGEX_CREATE_RULESET(TRACE_TASK),
 					"handled_fs", field, sizeof(field)));
 	EXPECT_STREQ("read_file", field);
 
 	/* Verify handled_net matches. */
-	EXPECT_EQ(0,
+	ASSERT_EQ(0,
 		  tracefs_extract_field(buf, REGEX_CREATE_RULESET(TRACE_TASK),
 					"handled_net", field, sizeof(field)));
 	EXPECT_STREQ("bind_tcp", field);
 
 	/* Verify version is 0 at creation (no rules added yet). */
-	EXPECT_EQ(0,
+	ASSERT_EQ(0,
 		  tracefs_extract_field(buf, REGEX_CREATE_RULESET(TRACE_TASK),
 					"ruleset", field, sizeof(field)));
 	/* Format is <hex>.<dec>; version is after the dot. */
@@ -357,7 +357,7 @@ TEST_F(trace, create_domain)
 	}
 
 	/* Extract the domain ID from create_domain. */
-	EXPECT_EQ(0, tracefs_extract_field(buf, REGEX_CREATE_DOMAIN(TRACE_TASK),
+	ASSERT_EQ(0, tracefs_extract_field(buf, REGEX_CREATE_DOMAIN(TRACE_TASK),
 					   "domain", domain_id,
 					   sizeof(domain_id)));
 
@@ -365,7 +365,7 @@ TEST_F(trace, create_domain)
 	EXPECT_NE(0, strcmp(domain_id, "0"));
 
 	/* Verify parent=0 (first restriction, no prior domain). */
-	EXPECT_EQ(0, tracefs_extract_field(buf, REGEX_CREATE_DOMAIN(TRACE_TASK),
+	ASSERT_EQ(0, tracefs_extract_field(buf, REGEX_CREATE_DOMAIN(TRACE_TASK),
 					   "parent", parent_id,
 					   sizeof(parent_id)));
 	EXPECT_STREQ("0", parent_id);
@@ -381,7 +381,7 @@ TEST_F(trace, create_domain)
 		TH_LOG("Expected check_rule_inode events\n%s", buf);
 	}
 
-	EXPECT_EQ(0, tracefs_extract_field(buf, REGEX_CHECK_RULE_FS(TRACE_TASK),
+	ASSERT_EQ(0, tracefs_extract_field(buf, REGEX_CHECK_RULE_FS(TRACE_TASK),
 					   "domain", check_domain,
 					   sizeof(check_domain)));
 	EXPECT_STREQ(domain_id, check_domain);
@@ -615,7 +615,7 @@ TEST_F(trace, free_domain)
 	}
 
 	/* Verify denials count matches the single denial we triggered. */
-	EXPECT_EQ(0, tracefs_extract_field(buf, REGEX_FREE_DOMAIN(KWORKER_TASK),
+	ASSERT_EQ(0, tracefs_extract_field(buf, REGEX_FREE_DOMAIN(KWORKER_TASK),
 					   "denials", denials_field,
 					   sizeof(denials_field)));
 	EXPECT_STREQ("1", denials_field);
@@ -900,7 +900,7 @@ TEST_F(trace, non_audit_visible_denial_counting)
 	{
 		TH_LOG("free_domain event not found after 10 retries");
 	}
-	EXPECT_EQ(0, tracefs_extract_field(buf, REGEX_FREE_DOMAIN(KWORKER_TASK),
+	ASSERT_EQ(0, tracefs_extract_field(buf, REGEX_FREE_DOMAIN(KWORKER_TASK),
 					   "denials", denials_field,
 					   sizeof(denials_field)));
 	EXPECT_STREQ("1", denials_field);
@@ -949,7 +949,7 @@ TEST_F(trace, add_rule_net_port_fields)
 	 * (landlock_net_port_attr.port).  On little-endian, htons(8080) is
 	 * 36895, so this comparison catches byte-order bugs.
 	 */
-	EXPECT_EQ(0, tracefs_extract_field(buf,
+	ASSERT_EQ(0, tracefs_extract_field(buf,
 					   REGEX_ADD_RULE_NET_PORT(TRACE_TASK),
 					   "port", field, sizeof(field)));
 	EXPECT_STREQ("8080", field);
@@ -959,7 +959,7 @@ TEST_F(trace, add_rule_net_port_fields)
 	 * net access bits are unhandled because the ruleset only handles
 	 * BIND_TCP).
 	 */
-	EXPECT_EQ(0, tracefs_extract_field(
+	ASSERT_EQ(0, tracefs_extract_field(
 			     buf, REGEX_ADD_RULE_NET_PORT(TRACE_TASK),
 			     "access_rights", field, sizeof(field)));
 	EXPECT_STREQ("bind_tcp|connect_tcp|bind_udp|connect_send_udp", field);
-- 
2.56.0

