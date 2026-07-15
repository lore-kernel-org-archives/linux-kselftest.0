Received: from mail-wm2-f2.google.com (mail-wm2-f2.google.com [74.125.225.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CAE2EAB6F
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 13:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122481; cv=none; b=tf8ZhrAinXAzwrv6n6UNkaa6uFsIVF4IMBnPqfZq5HiNnzxJAXzY9FKxgz+hGlQox+0dQeBii/EOhd+hXG2e66redq7SOgHApXjgJE5q8pUGICXqYtmkiusBCio02Z5KaTOKoE3PiLtHSILMWWsXiwLRI382VoxYhPIcDsLJ8og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122481; c=relaxed/simple;
	bh=7kOnVrDgGdifj9QY0fXvftFGiW2qVdDptZ7neLyplqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SCy3nRv58ypGcLfDPJShxd5rfmo5pJ6r2F/PrOG7lclRCgutocqFzinNfgpyFAzPbRgEeXQDxn6m5ezhg1pI3zk2vw3YJvYc5fBpTgKnXLrgiQ3nN93nLm4U5NNihiSqn/0oYi7FsF3lc07g2ZIUr44xlch6NOLZ8jcHQcs8zoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pb0kqd9z; arc=none smtp.client-ip=74.125.225.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pb0kqd9z"
Received: by mail-wm2-f2.google.com with SMTP id 5b1f17b1804b1-4926d058720so5658475e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 06:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784122476; x=1784727276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gpdCEuNC6+ipebO3NzplfX4VLPuQi09kjzb5eK7FZmM=;
        b=Pb0kqd9zqfqr5HF+LSG37Rnug0Rh61OyAgJ+nywuhe1O2YJfIWiTUvNvXa4jrIsywI
         C25ptdAN2xl8qNntHLCwBHTAlFIpmlvW6jAfDXRbiT8CYEek24Cu4Ry3XVN+TnEzOjS7
         IwcCoPEY/0HoTYK8g+OA5SnfeJldw1CPPfmfPW1WrNwzB3O2mpSgBxE9rM2E7a36yyde
         +HpBYqroDgIygy1u69GvATLsxjSc7l3tOVcuaq/r0C2mFStk0BJdAyA2ujCAJvkTJcu1
         KwLZ5Zj7LBcGAQecfcDoBwOuBZnQuGCJpENWpNekxHitzNERIlmhmchxOAQOYkywPxlh
         fNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122476; x=1784727276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gpdCEuNC6+ipebO3NzplfX4VLPuQi09kjzb5eK7FZmM=;
        b=ar3cbaGP9Gp8mXqHAXz3KPlK42rhAnkguL+3TwXgz0WopUr68Bv7g3m3MSInTP7PZ3
         9rPteliNpMmJ7GFF3Z2x8c4eNu/MFMp17wiXRjnNZY5m/KJaSSRx7OVdvY33ySOWDr09
         PbOG0L18iHQYv6sM8mxy1c1TtiXkZ7tdaQUk2/HmGDomkhEFtYgyKILJyim/nRHX8FB+
         f2/T6DpyPVDlWFNGO/Vx8+tUkRvW23v/OihRsYKiHmyxBuTA3I7BmdD0Qo9w9NioPMkb
         unErz+0vdRjRNQXhmPReyrlRJfabrrM0GUfSIvZUud06UEJESFsrzzeZhjHDHK5W8Wb4
         pvUw==
X-Forwarded-Encrypted: i=1; AHgh+RqnvfBJ1XBxDKm3dJIYmxFjRrnhUp9ON5xYj54JNiW+KX+dD14mxwxqdamSiz0LFIO2hkM1S+74dZTiXDW8R3s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu5t3lFn/rwJ/HmhXyOJzPsgmDJSbSRLXPk1Fp0MyqaLYysyhH
	tshjBzUrWBmyFbMmuMqZHIvIrfT2RJeh3BAYjoLPfhmLx1NaxwSG6nUn
X-Gm-Gg: AfdE7cmfMDIsgJ3fS/+74onNFGxeLfnEvAD3hrW+PHGK3vUpfq0WqLi3sPC9NBgt6XH
	8TdRd3QgAz+pEWICJGkC6++PO29noV6QXITnX2sZ2mJcP3jo09mEkSDNujgioK5BTgYjP57BysZ
	ue56hNBIdtDM7/8tGW85QAC3oCHKt28DMbjD15X89b7fbHS3UUp87HogOfc0B1l41IBVeXavlEg
	Zpc3oaHR82Dt8SIDWKng+pQ5LvXv+RfuwTAxWd6FaPJ68gCJVwIbZP3789O8Rac6+rd8wF6d9z6
	x88gvCAHr5+U+kqSZWKFNlyX56M4i0UpG80c6FfCde/XJW30nvXa5QtUCBH2or3Q6NrmX4YO6DZ
	qZiyB22um7Z1UKDlITlYyjM7UhdTpz51VVi86w6bq+KQ1IqrDtMR/vo6hqaDyYyNPwsVFljXVt5
	aKJHKw98NeIWiF57Hm153co/h4EY/YdMmoCHFwzbjO1rsWPVrWfLvIC6Z8G+ArcctaZnZnX0ncm
	j1gg1BSXZtMSfcr0Xr0hm0I2RQtpJVXxw==
X-Received: by 2002:a05:600c:a00f:b0:495:3dd7:ef06 with SMTP id 5b1f17b1804b1-4953dd7f0bcmr26130985e9.12.1784122475929;
        Wed, 15 Jul 2026 06:34:35 -0700 (PDT)
Received: from lima-kernel.. (host-123-106.campusbrigittenau.at. [78.104.123.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a322c86sm142033015e9.11.2026.07.15.06.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:34:35 -0700 (PDT)
From: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
Subject: [PATCH] selftests/mm: khugepaged: skip swap tests when swap is unavailable
Date: Wed, 15 Jul 2026 15:34:17 +0200
Message-ID: <20260715133418.170386-1-jaeyeon.lee.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The collapse_swapin_single_pte and collapse_max_ptes_swap tests use
MADV_PAGEOUT to swap out pages before verifying khugepaged collapse
behavior. On systems without swap configured, MADV_PAGEOUT succeeds
but the pages are not actually swapped out, so check_swap() returns
false and the tests report a failure.

These tests cannot run meaningfully without swap, so a missing swap
area is an environment limitation rather than a test failure. Detect
the absence of swap via /proc/swaps and skip the affected tests
instead of failing them.

Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
---
 tools/testing/selftests/mm/khugepaged.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 10e8dedcb087..f9b4ebe733ce 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -100,6 +100,22 @@ static void skip(const char *msg)
 	exit_status = KSFT_SKIP;
 }
 
+static bool swap_available(void)
+{
+	char buf[256];
+	bool ret;
+	FILE *fp = fopen("/proc/swaps", "r");
+
+	if (!fp)
+		return false;
+
+	fgets(buf, sizeof(buf), fp);
+	ret = !!fgets(buf, sizeof(buf), fp);
+
+	fclose(fp);
+	return ret;
+}
+
 static void save_settings(void)
 {
 	ksft_print_msg("Save THP and khugepaged settings...");
@@ -742,6 +758,9 @@ static void collapse_swapin_single_pte(struct collapse_context *c, struct mem_op
 		ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
 	if (check_swap(p, page_size)) {
 		success("OK");
+	} else if (!swap_available()) {
+		skip("Swap is not available");
+		goto out;
 	} else {
 		fail("Fail");
 		goto out;
@@ -768,6 +787,9 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
 		ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
 	if (check_swap(p, (max_ptes_swap + 1) * page_size)) {
 		success("OK");
+	} else if (!swap_available()) {
+		skip("Swap is not available");
+		goto out;
 	} else {
 		fail("Fail");
 		goto out;
@@ -785,6 +807,9 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
 			ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
 		if (check_swap(p, max_ptes_swap * page_size)) {
 			success("OK");
+		} else if (!swap_available()) {
+			skip("Swap is not available");
+			goto out;
 		} else {
 			fail("Fail");
 			goto out;

base-commit: 7081238c5ca29839924f13bf5daa80763bc589f2
-- 
2.43.0

