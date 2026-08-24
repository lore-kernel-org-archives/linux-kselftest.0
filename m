Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9733B36F8F7;
	Mon, 24 Aug 2026 15:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584361; cv=none; b=VLfXP12petee+LB7cVH+rs+yqnss4xgmc9laFmGB0br6T4OLIBiKtlxZtDeqRWnhfbKZAyso9fQIvRNAptrMkYmeGADlIwXjWoTdHbdVtFojVxgIJB9Az5PN7MD5iYQmRCu0TaJxZv+MM5wM0zADiM7pC0HYChNxx5KLiP5deAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584361; c=relaxed/simple;
	bh=9wW+GCgN/Ukf+SGQy4tCr88gM63EiN7iHnQj3gpD7/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZmnohNePZlj1c7Hd8Ict8is5osGkzk0xnsh2jO1xIGHJnPQDFyf3wFfbAq8m3yluD4NM36LHu0+7dKDPke1jaQYlG7b69ZkEuR52pDhldxsT0C/SU0dt8ep6Xhb5ALq+pMM80rTNuzwAY51hsmAtBhHkNJ+uPUgVD85YFu5AGNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B011F000E9;
	Mon, 24 Aug 2026 15:12:34 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Karas <krzysztof.karas@intel.com>,
	Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
	Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Andi Shyti <andi.shyti@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] gpu: GPU_BUDDY_KUNIT_TEST should not select GPU_BUDDY
Date: Mon, 24 Aug 2026 17:12:30 +0200
Message-ID: <1e519fb24aa5521788d69cc7980665ccbc227b14.1787584184.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling a (modular) test should not silently enable additional kernel
functionality, as that may increase the attack vector for a product.

Fix this by reverting the select to a dependency.  Make sure the GPU
buddy allocator can be tested without enabling another driver that uses
DRM_BUDDY by making GPU_BUDDY visible if KUNIT is enabled.

The page based buddy allocator for GPU memory is only used by DRM.
Hence add a dependency on DRM to GPU_BUDDY, to prevent asking the user
about this code when configuring a kernel without DRM support.

Fixes: 8fe3fc37564920ae ("gpu: Fix dependencies in CONFIG_GPU_BUDDY_KUNIT_TEST")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/gpu/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/Kconfig b/drivers/gpu/Kconfig
index 3bcf08260d73a782..d881ab6f7a006a3b 100644
--- a/drivers/gpu/Kconfig
+++ b/drivers/gpu/Kconfig
@@ -1,14 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0
 
 config GPU_BUDDY
-       bool
+       bool "Page based buddy allocator for GPU memory" if KUNIT
+       depends on DRM || COMPILE_TEST
        help
          A page based buddy allocator for GPU memory.
 
 config GPU_BUDDY_KUNIT_TEST
        tristate "KUnit tests for GPU buddy allocator" if !KUNIT_ALL_TESTS
        depends on KUNIT
-       select GPU_BUDDY
+       depends on GPU_BUDDY
        default KUNIT_ALL_TESTS
        help
          KUnit tests for the GPU buddy allocator.
-- 
2.43.0

