Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3544645D922;
	Fri, 11 Sep 2026 21:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160777; cv=none; b=Z7UnLlHnocVmKsaevm323RveZzExc43lZumYgcZBb6p74YzPWtCK6TwqlyXy8P3ccP6CBwZxTvDsRIW39wiAR2M1zi65pCydUyKFcDUZZ2gek9FGEV0sOlDSj9lEPZXw4RHnNMjVIw0y6UHWduX94DQKNaDo1DagSPv7GcLAb4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160777; c=relaxed/simple;
	bh=Ko4HtAWHNGp2tQS4oxkiTDsisIyPXC3mwTAstW5j2OM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nkqhibROrAGv8e4mR7AmXTD2HTAYZOG8G15U1t0iMLl/xUsP9mos6XBYa1vZLkkzdfUQwsrwxk+IoIjN0O0KIvjU42tsrTGaPST6HSeLHM3xildFjYghTawYse9RPqK9svoc+qcrSWXYN/gJ8JNWGnWt5Kky/k7bof2cGtx9sEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ggRE77ma; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ggRE77ma"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C62C12E96;
	Fri, 11 Sep 2026 14:06:10 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E03973F8C6;
	Fri, 11 Sep 2026 14:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789160774; bh=Ko4HtAWHNGp2tQS4oxkiTDsisIyPXC3mwTAstW5j2OM=;
	h=From:To:Cc:Subject:Date:From;
	b=ggRE77ma+WZuCvCcU2DRXbCHnE8eEhQnfghWBaubvPG0j7Lkq1zMt42RDbb8r8z2P
	 6wtrYneVI4qutIAc7S4800a8aM4kvE8jtE57c1hJZb8b8Rlpehgf9OLxmOWU8Ws9Wb
	 fsKj6de4XzzjUJv2pZ9DRcQxw8CuOHTbWSKpfurQ=
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
Subject: [PATCH v2] kselftest: mm: remove exclusion of building soft-dirty test in arm64
Date: Fri, 11 Sep 2026 22:06:11 +0100
Message-ID: <20260911210611.4001419-1-yeoreum.yun@arm.com>
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
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
Changes in v2:
  - remove redundant condition in run_vmtests.sh
  - add r-b and a-b tag.
  - Link to v1: https://lore.kernel.org/all/20260911125028.1268274-1-yeoreum.yun@arm.com/
---
 tools/testing/selftests/mm/Makefile       | 3 ---
 tools/testing/selftests/mm/run_vmtests.sh | 5 +----
 2 files changed, 1 insertion(+), 7 deletions(-)

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
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index d09f9f6a384e..33963535616b 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -390,10 +390,7 @@ then
 	CATEGORY="pkey" run_test ./protection_keys_64
 fi
 
-if [ -x ./soft-dirty ]
-then
-	CATEGORY="soft_dirty" run_test ./soft-dirty
-fi
+CATEGORY="soft_dirty" run_test ./soft-dirty
 
 CATEGORY="pagemap" run_test ./pagemap_ioctl
 
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

