Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996EC376472;
	Thu, 22 Jan 2026 17:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101364; cv=none; b=MflINa3d+qU3p192Z4pAAZ0TjlGOBkLmNjyZ9cYqR+bGoWjnINaZyjKlpWuT2sVvzN7Wqs4DHi39DGnYGATH6DFdUucXOdJ3qe/RZRZ+lCBcm8KR6mohCzbUC8lfXHy/ZpSWZNkfAoiupVMYLeVp1SBC0m0TMI4efxa3WX5FO/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101364; c=relaxed/simple;
	bh=ZNRxNFE32weRNSCQI7tMxuz6rq0DOTVV9Nj6X02kyMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJU6X+99ArzN36IwIcw+JlGtiv+a6w0zyjCtwY2gplxl7/kBI0fUvMkc4341Q4TL2k6CK1S37YK1vk8igXn7J9g50dWVxSOWNlulLT0LrQPvXL+2Mb/tNT6meVkA5UtbfbOheWoB+Ter7UP/5yZLsKxUCw9ceHEiQfymEn5UPaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 840A41515;
	Thu, 22 Jan 2026 09:02:29 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB2283F632;
	Thu, 22 Jan 2026 09:02:34 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>
Subject: [PATCH v3 1/9] selftests/mm: default KDIR to build directory
Date: Thu, 22 Jan 2026 17:02:16 +0000
Message-ID: <20260122170224.4056513-2-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260122170224.4056513-1-kevin.brodsky@arm.com>
References: <20260122170224.4056513-1-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KDIR currently defaults to the running kernel's modules directory
when building the page_frag module. The underlying assumption is
that most users build the kselftests in order to run them against
the system they're built on.

This assumption seems questionable, and there is no guarantee that
the module can actually be built against the running kernel.

Switch the default value of KDIR to the kernel's build directory,
i.e. $(O) if O= or KBUILD_OUTPUT= is used, and the source directory
otherwise. This seems like the least surprising option: the test
module is built against the kernel that has been previously built.

Note: we can't use $(top_srcdir) in mm/Makefile because it is only
defined once lib.mk is included.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/Makefile           | 2 +-
 tools/testing/selftests/mm/page_frag/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index eaf9312097f7..bb93101e339e 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -44,7 +44,7 @@ LDLIBS = -lrt -lpthread -lm
 # warnings.
 CFLAGS += -U_FORTIFY_SOURCE
 
-KDIR ?= /lib/modules/$(shell uname -r)/build
+KDIR ?= $(if $(O),$(O),$(realpath ../../../..))
 ifneq (,$(wildcard $(KDIR)/Module.symvers))
 ifneq (,$(wildcard $(KDIR)/include/linux/page_frag_cache.h))
 TEST_GEN_MODS_DIR := page_frag
diff --git a/tools/testing/selftests/mm/page_frag/Makefile b/tools/testing/selftests/mm/page_frag/Makefile
index 8c8bb39ffa28..96e5f646e69b 100644
--- a/tools/testing/selftests/mm/page_frag/Makefile
+++ b/tools/testing/selftests/mm/page_frag/Makefile
@@ -1,5 +1,5 @@
 PAGE_FRAG_TEST_DIR := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
-KDIR ?= /lib/modules/$(shell uname -r)/build
+KDIR ?= $(if $(O),$(O),$(realpath ../../../../..))
 
 ifeq ($(V),1)
 Q =
-- 
2.51.2

