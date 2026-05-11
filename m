Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4C945BD5E
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 17:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778520910; cv=none; b=LAp2agL6LDYVeFS4RJSMz53ssTWx2PaqspH0NPiThLcWs6XMZlwHSsSW2kRg0vkj4y/H2VMrRQTUmkmfniXuwBd2/WqzQQ/1vEdndLeOqVFM3VPkTOgOc81d0icgIM/47DKJTMb1KFdD4o+4renbCV/2924uqfOoaTY+YXQ9tCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778520910; c=relaxed/simple;
	bh=MfsmcPJ1mIXzyAIpmm2w07mkj6DwO36NreAgUezazJE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g4wIcqJ8AGeTZR8+OevpAWuFmK9QfUehXLDalkEq/mJH2L10GuJLYyUcvqdAXoq/92d2netSzcGcPr9KqOwm5jDtlJaLa/uFFvjfrIofYS26GrVHlaQvU4aTg4M84lpZJ7EAUJyB3vZLAAK1kHZ5vYD4k5pS8IGMfebPk2zJddk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gZ8dnyoH; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gZ8dnyoH"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-132a8f93432so4544669c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 10:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778520909; x=1779125709; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oXZTF46pWxFDLw2H92ISedrm06zB7QVPEnfycFkUHV0=;
        b=gZ8dnyoHH26gjmMlRf8TXVdasv5kAj5JlZn6tpvh+gO/iYEYcu/sZrEnKUMnWKwkRT
         oBUGyOKlOJ+ViiBT/7JrWSWEG6vNl5OLquN/T2BLd+Ij0A5Zu0DDnSbdx9DamAqCeL3H
         CzwVxpGkXe0KF4fwdVb5w9T87hukd7yfVgBU73103GTEj0ub8N0OrrqwJ7wKgzWKciH0
         UyPy2zfD66MFSCAGbHUT22bWBR++r9HPjqGiyUYkwcLk0sL69wzA6jvAfPyEIC7rnsQy
         eH7qctSAAXYT/CJ4aA2/TIJoqh7Akw3ILxvzX03seN5E+c4oyXOW9an0n///nj9Y/BJ1
         O+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778520909; x=1779125709;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXZTF46pWxFDLw2H92ISedrm06zB7QVPEnfycFkUHV0=;
        b=HPE4t/cjQhiArO9qurre4pbqrSALa6MOR3q2I48zPkxEr67iy3R7YP7GYvzlBVXPUb
         diuy1Igd0TBj0umFkUCbzmDkmyQMNyFHNXeGT33PDTTkUyKyuuHSCOi3SCgGhPhE04Dm
         lAf0eY4emZo3qJZzrtuSjOjgF5GwGEgGnitnXIvlJFNbFZcwcfhDpLO7+BYiKwo4y9UY
         Y9rIk0bFm9Dqzp4jhhPbch+/D5JPnSOd/4lywoR9+usRzzaBtS3g/A7jA16TRg0ny6Di
         4ogpF6T2OVX0lNuSmMl3roGPfhQ1NWjoVzR145ZILGixNsl6QiBbPFBAZKJKGoytv2Ga
         CnOw==
X-Forwarded-Encrypted: i=1; AFNElJ+Dp5TV0I6znLz1j9sB2zTvkqb24bDqtzJpeEFfckMk1f4Kb09MKEBoUk+5jKzmX90n2bV/H9Nhkn3547HzohA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHnUASpxZTSkvnNQbbpnnImV6aXj1MYp2lQNyUQQp8SQN8Zz9C
	KgEEtHTY+T26uY4WpdQnFLMZfg0kCAsNix0FYOfNGc2wlK+BYbKn5vw17t2UoBghGzT3xocYuG4
	dc7UA4foMOQ==
X-Received: from dlbtx10.prod.google.com ([2002:a05:7022:fc0a:b0:132:8d92:4d73])
 (user=pratmal job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ec4:b0:12a:6902:ddb8
 with SMTP id a92af1059eb24-131965af2c5mr11922224c88.4.1778520908571; Mon, 11
 May 2026 10:35:08 -0700 (PDT)
Date: Mon, 11 May 2026 17:34:11 +0000
In-Reply-To: <20260511173411.267628-1-pratmal@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260511173411.267628-1-pratmal@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260511173411.267628-3-pratmal@google.com>
Subject: [PATCH v3 2/2] selftests/mm: rename local_config.h to local_config.h_gen
From: pratmal@google.com
To: akpm@linux-foundation.org, shuah@kernel.org
Cc: yosry@kernel.org, david@kernel.org, ljs@kernel.org, 
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pratyush Mallick <pratmal@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pratyush Mallick <pratmal@google.com>

Because local_config.h is a generated build artifact, un-ignoring all
.h files causes it to incorrectly show up as an untracked file in git
status.

Rename it to local_config.h_gen so it no longer matches the !*.h
inclusion rule.

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
2.54.0.563.g4f69b47b94-goog

