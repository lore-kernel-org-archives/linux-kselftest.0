Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AB7345EA8
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 22:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795461; cv=none; b=BKwzNJhcd1Vb5H8x3aC+8LpNr5mybC7EqKhFq3sNVMNrnEM2ctxYhu34lSeYoTVxcu4z3ugQR5EwVS2OfKcOThCp4s1wuDezF4VEnuq4BNHdLUignx1Tc5MR7hrP6QyF4+bfcslcjZ9QYRDVP115xRAskxnkHezGT9bOZGECyBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795461; c=relaxed/simple;
	bh=+JU3yYr51cdqbWn0b7a8r9ayU9cSVfTpwTzBHm3+Fu0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kva9CuQQBwJiry24NRH1XjYva751XNnMHAnG+rquE3KzYfQtgpdAbhovnOzZt2Ao1b5FyGm7F6/HSFfxpsQNbuhd99FSrB7iBoeuEaB9aQSSO3JL8jYMDp2KF2Wsdg4n+QfHBL0y1ZpuHNAlvUPyJDEgFnZJwSNsDGM8PTfYrIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rK3KDdc3; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rK3KDdc3"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848d21bbb55so7122234b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 15:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785795459; x=1786400259; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2m7uZHClv1XrW6044CiQwNw33tdPDy6nZL+JxysQdrg=;
        b=rK3KDdc3VMKlwCA/BLvEHIRh3Oo3s+uZxeo/ZZ35GtbXDQ454k04HZBJUlcAK7ZXgT
         rLFinpBP2Ur6g+nmrvlbWJkPrljPMLO1OYjXY23WYCq+3wYHxjDWhTwz8F5gatTP82mZ
         HCRRJaBdnH7vLxLmH8kuG/U9/rqJrsYzJlfOIQ4bSM5i89YiCWsO+57qqVqgc5+Hl/ZJ
         aUGZn+J7RguO38efJhL299HmK2u5DLzRDCzfMYfXGSDsbAmogeUd2eVvAMCKruYfWYsH
         eJyMBAN5priiykgpPJdJIOfmpC2VzXzRWG76IfnC72lkDWrBbsp2pS+86d8oZm6bo+1w
         J/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795459; x=1786400259;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2m7uZHClv1XrW6044CiQwNw33tdPDy6nZL+JxysQdrg=;
        b=noZBzrhlekjnP32pdzxYvHJuMewhe5vBz2K00gqk9n87yzz+Xi6etGi8n2YQzpCxR1
         t4q76KPFFQn8CjRTH1eFKfgCVMlqMZrll3i9x6X7Yo4xDbANmBHyWrmfQPYNK1UlWg5P
         qPjIoUz7/Bz+LyD5RH/Id1TH3MObkSwV6khxujyo79BdLqwYgtAPUwFmtauAKb93DCQm
         t+O8NMfOFN49nc1vC+UscOQnsXihydnqf/oOeKYSr3gPbviHawIVKVszCllpZ3nqhwmX
         3TQIxwLr102EKjXY/PLWFJdUhlLGXoz8KWCVGQ3S5ayOgj7UjIBOmcKfpfN7iNUArfM1
         IfuA==
X-Forwarded-Encrypted: i=1; AHgh+RosfteCWaMcmWUMnbRab2CbR/TNX4jkw+94clfzQmKxFFiA9DM9zxCKVGE6J67nV8cpDv6jVp7coMQAQHAx0Is=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBBUOT6Pdqkriv604BaOlHzQvNa7nt/DYNqn32G1CuE0NG1UI2
	Tf3HX07D3H8ma/TZX7MMqBxCO5JnQjLGPTEfFcwXcARd92Hqu93rWo/tM/DZyEeCeUy3v/1yFOx
	tBYnktTC6pw==
X-Received: from dyaz4-n2.prod.google.com ([2002:a05:693c:6384:20b0:30c:86eb:3114])
 (user=pratmal job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3390:b0:3c4:3ada:384d
 with SMTP id adf61e73a8af0-3c92a57baf2mr10389215637.30.1785795458586; Mon, 03
 Aug 2026 15:17:38 -0700 (PDT)
Date: Mon,  3 Aug 2026 22:17:31 +0000
In-Reply-To: <20260803221732.3651981-1-pratmal@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260803221732.3651981-1-pratmal@google.com>
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
Message-ID: <20260803221732.3651981-2-pratmal@google.com>
Subject: [PATCH v4 1/2] selftests/mm: rename local_config.h to local_config.h_gen
From: pratmal@google.com
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: SeongJae Park <sj@kernel.org>, Sarthak Sharma <sarthak.sharma@arm.com>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pratyush Mallick <pratmal@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pratyush Mallick <pratmal@google.com>

Because local_config.h is a generated build artifact, un-ignoring all
.h files in .gitignore causes it to incorrectly show up as an untracked
file in git status.

Rename it to local_config.h_gen so it no longer matches the !*.h
inclusion rule, preparing for a subsequent patch that switches
.gitignore to a pattern-matching approach.

Update Makefile, check_config.sh, and affected test sources (cow.c,
gup_longterm.c) accordingly.

Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Pratyush Mallick <pratmal@google.com>
---
 tools/testing/selftests/mm/Makefile        | 6 +++---
 tools/testing/selftests/mm/check_config.sh | 2 +-
 tools/testing/selftests/mm/cow.c           | 2 +-
 tools/testing/selftests/mm/gup_longterm.c  | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 7a5de4e9bf52..32f4b016b74f 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -5,7 +5,7 @@
 # script so kunit knows to run it, and add it to the list below.
 # If you do not YOUR TESTS WILL NOT RUN IN THE CI.
 
-LOCAL_HDRS += $(selfdir)/mm/local_config.h $(top_srcdir)/mm/gup_test.h
+LOCAL_HDRS += $(selfdir)/mm/local_config.h_gen $(top_srcdir)/mm/gup_test.h
 LOCAL_HDRS += $(selfdir)/mm/mseal_helpers.h
 
 include local_config.mk
@@ -259,10 +259,10 @@ $(OUTPUT)/migration: LDLIBS += -lnuma
 
 $(OUTPUT)/rmap: LDLIBS += -lnuma
 
-local_config.mk local_config.h: check_config.sh
+local_config.mk local_config.h_gen: check_config.sh
 	CC="$(CC)" CFLAGS="$(CFLAGS)" ./check_config.sh
 
-EXTRA_CLEAN += local_config.mk local_config.h
+EXTRA_CLEAN += local_config.mk local_config.h_gen
 
 ifeq ($(IOURING_EXTRA_LIBS),)
 all: warn_missing_liburing
diff --git a/tools/testing/selftests/mm/check_config.sh b/tools/testing/selftests/mm/check_config.sh
index b84c82bbf875..b46bf2d2e7f8 100755
--- a/tools/testing/selftests/mm/check_config.sh
+++ b/tools/testing/selftests/mm/check_config.sh
@@ -4,7 +4,7 @@
 # Probe for libraries and create header files to record the results. Both C
 # header files and Makefile include fragments are created.
 
-OUTPUT_H_FILE=local_config.h
+OUTPUT_H_FILE=local_config.h_gen
 OUTPUT_MKFILE=local_config.mk
 
 tmpname=$(mktemp)
diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
index d9c69c04b67d..87710c5a2d3c 100644
--- a/tools/testing/selftests/mm/cow.c
+++ b/tools/testing/selftests/mm/cow.c
@@ -21,7 +21,7 @@
 #include <sys/wait.h>
 #include <linux/memfd.h>
 
-#include "local_config.h"
+#include "local_config.h_gen"
 #ifdef LOCAL_CONFIG_HAVE_LIBURING
 #include <liburing.h>
 #endif /* LOCAL_CONFIG_HAVE_LIBURING */
diff --git a/tools/testing/selftests/mm/gup_longterm.c b/tools/testing/selftests/mm/gup_longterm.c
index f61150d28eb2..00ea0dd2f655 100644
--- a/tools/testing/selftests/mm/gup_longterm.c
+++ b/tools/testing/selftests/mm/gup_longterm.c
@@ -21,7 +21,7 @@
 #include <linux/magic.h>
 #include <linux/memfd.h>
 
-#include "local_config.h"
+#include "local_config.h_gen"
 #ifdef LOCAL_CONFIG_HAVE_LIBURING
 #include <liburing.h>
 #endif /* LOCAL_CONFIG_HAVE_LIBURING */
-- 
2.55.0.571.g244d577d93-goog

