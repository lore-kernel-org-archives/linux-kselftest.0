Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBAD47A0DE;
	Fri, 11 Sep 2026 12:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131045; cv=none; b=Lfldck04FefzLO6k/mxq7YClyDFWVWqlNOcyKt3BrjGMQQ7Bgnk50bxbr5d0WGAnB7fyxtiJIKRUUjFd/AtP5ju3Mu3A5Ef4jmS/OPesuyykYMo8RRM4z/EXmkqEtSotA92aKVgiIMWzwA+Q2QSOmJILYoqY/PXub1ItQBzABJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131045; c=relaxed/simple;
	bh=xWtNJUTwM42lJpkUN0xjfcVe8e21SEBz9UB8yrPkMAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NTeDz4rU8j8x44ERMy0DfqvEgrI9W6/afCE5AQXzKax27kp1HG3Bk+9DunKrXkhog8rEZYYyZgOFZFlzSutv00Axa67zzfkYVJcj9Mk6jUVYSAg+cKINtyzGeYFfNHmMW99i3gYgvgGO5ubbvUS38VtykY3VLRDjBKvlMbr9PSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cDOU2Mbc; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cDOU2Mbc"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFF481655;
	Fri, 11 Sep 2026 05:50:31 -0700 (PDT)
Received: from e129823.cambridge.arm.com (unknown [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3E8FF3F7B4;
	Fri, 11 Sep 2026 05:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789131035; bh=xWtNJUTwM42lJpkUN0xjfcVe8e21SEBz9UB8yrPkMAw=;
	h=From:To:Cc:Subject:Date:From;
	b=cDOU2MbcaEMP1yBMbopyBDyoAv5Zy9emYA9RaAc3TnMstvdkF4LYm4+k+cEnpKQCI
	 7/gQ7+WrMc+1qMOvwOBxu+AXs2Vq3icXGCknW6CgdHvPoYvf7lR0variw/Sne9+SLm
	 O+SKNVnvemrESZxz37YQc/Nlik4oMnL0N1u0LlhI=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH] kselftest: mm: remove exclusion of building soft-dirty test in arm64
Date: Fri, 11 Sep 2026 13:50:28 +0100
Message-ID: <20260911125028.1268274-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 0389c305ef56 (“selftests/mm: skip soft-dirty tests when CONFIG_MEM_SOFT_DIRTY is disabled”),
the soft-dirty test is skipped when soft-dirty is not supported.

There is therefore no reason to exclude the test from being built on
arm64. Remove the arm64-specific exclusion.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 2d5366196e30..d3e9bd67904a 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -104,10 +104,7 @@ TEST_GEN_FILES += guard-regions
 TEST_GEN_FILES += merge
 TEST_GEN_FILES += rmap
 TEST_GEN_FILES += folio_split_race_test
-
-ifneq ($(ARCH),arm64)
 TEST_GEN_FILES += soft-dirty
-endif
 
 ifeq ($(ARCH),x86_64)
 CAN_BUILD_I386 := $(shell ./../x86/check_cc.sh "$(CC)" ../x86/trivial_32bit_program.c -m32)
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

