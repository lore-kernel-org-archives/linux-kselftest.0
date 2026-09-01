Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276DA43CE56
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 16:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279202; cv=none; b=ME9k7JQBq3DZKjKzLhy/BfL6vnfcxbJqAtGfG0WcsAxhAXZUxaSZBurAgxHOfub+njf1YNlPmjS3vkAjXxQ/onDOXAY9DecDJqYzzXp/3zUZ+hp39R5d3SWsFqDZk9+ya/QsGNa8yYpgGZDRdgFwx8rt0SR81ofTTG+7jOJ43jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279202; c=relaxed/simple;
	bh=z2KYWNyqrFo1sCW+OWkoJC7vv3DQjQh5BilYS0IFovQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n0hp5BXQFXIsN0VpAnsStZCqh6sZbgeX4f0HacdpYwVYMPExCzefi/g3fpCXuw7G5yPvZO9LbYD3a2hep0TlMjULqTPSnWlEuNXamfdUAOhubixshlXxl4Pa0kHE+6WDAc104Cap49c/8G5KKXNE0R0cMlTobhgYEztg3iuejf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ea8KNWJj; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ea8KNWJj"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4563ac048f4so58246fac.0
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 09:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788279198; x=1788883998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UrvqQXAc4Rj6TaVLaR+TE3DlGs7BEo7vSNB4Ui+eyI0=;
        b=ea8KNWJjEKQpDkI7Pcx3WpY/D8T9MRNttdo9WLjjKjP7Fw9QzMr3VFTCJ/li+2i7e4
         Sz2YtjtC272BYa7yNXLKA+pPu0d1Y5UxyxJ0VnpYE1sSrfGdELqhe0kDxNpHqz0zHKze
         VCsB0N6uVYpgtfmnUsfg8DTJgMxMGnq/tzGKzpsgnWy5ZwO6DxCxTcepTIeATpciqjvw
         qSa3Gt0jNxvmp/YfHTEptU214bytj0UGvbXIPZx7FqOkvNGCzr2YQAy9q+7hUNwRO6RJ
         Gedf5ih8/O5+oyYvrahIzxH4wxEq7mkr8WkLTOhslj9tMJuN10IJdkvL2K02fUZdnolR
         Mc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788279198; x=1788883998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UrvqQXAc4Rj6TaVLaR+TE3DlGs7BEo7vSNB4Ui+eyI0=;
        b=sdUev647seKB/98OxgqI76dPPl52JGrNQZwFVfrjq3TEr3HgAM29lbseY/wj7i0raz
         OX3zjbocg8gNih0vviMawQlmmz+0pZxsWaORdVFgn3wlXY0GzDM9ogXCyohS5214ovIP
         SaMUnRcWdlv5csZ9LDTmCBOdeCE6mMM9wXXWZzIIRJWwlACuoiZgkfHZhpZk+FaV7L4s
         LAGEyGVZs1o2ehxIMrFk3Hi2Gcd5kQz6AG4FxAjsZejbSyqec67mGNKYj1PzCmv3z6a6
         9Z1n7GUfhw2+LenxJaNtTfCyIROQw54jN8AYCJ9KqSDm0/jgQIp7yI0WVuLOPhLMsmbp
         pbzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRdFmjsYm+/hx6lknROOXLm3ITTCw2c594ndHt9N0YRtplDEBNG9z9AFOFg5vjH5RkLz5p3yfaA7egdbmQln8=@vger.kernel.org
X-Gm-Message-State: AFuF++mqtDvbvC1TcRJDJnzKZpFwhgG2MB9ylT77ZTIh6bnA7tIaLSnB
	gEOSqfMpSQadul+yKZ5oBMhuw2gMVYEQ0ZtNph3j+oqJZ8ga7Ak/BEaP
X-Gm-Gg: AR+sD12OC0Yd08YBHEtBCEW+arce5gPESYXa/vy57DWiqr3X3fYnW5zFUp7+VAqS++W
	3CQiOvD+2XHd7Yro5Ee2wXDo8VYL0WMm5ToEbTWqc+MCDJ8T0frYnKxWq6duW7MWWuZHjwaWBd9
	aD+K19XBCLlQcoar2kpwZ2JnWzq9OmThwiY++dgHsvnw5gysSX0vWxCLCK7ZLPJ0B3cfA+PZ22s
	KtfMbdtEsEP7p06Z0vOy0w77Hgrv56SI2XiGwNuufUJNKOdnmbI1cYSJPw9HvqccEE7SQ9n6zG3
	vkT93YNFnqH9VxnbkEySRZ9+COmN/Cg2LPzNkFfTKPvKpIdjSTibPPtJbHEPwMC3cTIb9mQXjGa
	WExBirXWFbpVxSVjsUeX+9nOxYcFAdRU6CjlU2ebKkXIYIsGZ5qzR5Ns5gg4dzuZSYFFOph0Sb2
	WPbotsoqQHFAN+FxkkaZ72TA0ZOKEXUyEMG8NzRxRObUGZWJqJyCWbiECy0ogfirJSgcl9+GJaE
	R/KU6dsZJcrxnYQp61fYuAhRLM5M5g=
X-Received: by 2002:a05:6808:508c:b0:4b2:8da1:3be4 with SMTP id 5614622812f47-4b398124cc7mr41327362b6e.9.1788279198361;
        Tue, 01 Sep 2026 09:13:18 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:28::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b3a19949c1sm11563412b6e.10.2026.09.01.09.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:13:18 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>
Cc: Chengming Zhou <chengming.zhou@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	cgroup@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] selftests/cgroup: Skip test_no_invasive_cgroup_shrink if zswap shrinker is enabled
Date: Tue,  1 Sep 2026 09:13:16 -0700
Message-ID: <20260901161317.3468233-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test_no_invasive_cgroup_shrink selftest checks that when a cgroup
has zswapped out more pages than memory.zswap.max, that it does not
trigger writeback for other cgroups. To do this, it compares the
writeback count in a control cgroup and makes sure that it is 0,
and compares it to the writeback count in a aggressor cgroup who
does expect to see writeback.

When the zswap shrinker is enabled however, there is an additional path
to zswap writeback, which can happen independently of reaching the
memory.zswap.max limit.

The writeback counter cannot distinguish between invasive noisy-neighbor
driven writeback and the zswap shrinker work, so the test becomes
invalid.

Skip test_no_invasive_cgroup_shrink if the zswap shrinker is enabled.

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 tools/testing/selftests/cgroup/test_zswap.c | 22 +++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index 9c5bd503c3f73..6f9b5c631d030 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -20,6 +20,8 @@ static int page_size;
 
 #define PATH_ZSWAP "/sys/module/zswap"
 #define PATH_ZSWAP_ENABLED "/sys/module/zswap/parameters/enabled"
+#define PATH_ZSWAP_SHRINKER_ENABLED \
+	"/sys/module/zswap/parameters/shrinker_enabled"
 #define PATH_ZSWAP_STORED_PAGES "/sys/kernel/debug/zswap/stored_pages"
 
 static int read_int(const char *path, size_t *value)
@@ -446,6 +448,16 @@ static int test_zswap_writeback_disabled(const char *root)
 	return test_zswap_writeback(root, false);
 }
 
+static bool zswap_shrinker_enabled(void)
+{
+	char value[2];
+
+	if (read_text(PATH_ZSWAP_SHRINKER_ENABLED, value, sizeof(value)) <= 0)
+		return false;
+
+	return value[0] == 'Y';
+}
+
 /*
  * When trying to store a memcg page in zswap, if the memcg hits its memory
  * limit in zswap, writeback should affect only the zswapped pages of that
@@ -461,6 +473,16 @@ static int test_no_invasive_cgroup_shrink(const char *root)
 	char *zw_allocation = NULL, *wb_allocation = NULL;
 	char *zw_group = NULL, *wb_group = NULL;
 
+	/*
+	 * The shrinker can write back zw_group's pages despite not hitting the
+	 * zswap limit. Skip the test if the zswap shrinker is enabled since the
+	 * test cannot distinguish invasive writeback from shrinker work.
+	 */
+	if (zswap_shrinker_enabled()) {
+		ksft_print_msg("zswap shrinker is enabled\n");
+		return KSFT_SKIP;
+	}
+
 	snprintf(zswap_max_buf, sizeof(zswap_max_buf), "%d", page_size);
 	snprintf(mem_max_buf, sizeof(mem_max_buf), "%zu", allocation_size / 2);
 
-- 
2.53.0-Meta

