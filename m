Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E981329E79;
	Wed, 14 Oct 2026 20:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008092; cv=none; b=f+zF0eZlrARTxkwWiFpKZzFKfvVmQEUbF1C8BwJkzdTti4q1yrw2qWvY1kAg4L8l3NgkVm+U4molmOQC3Sy1lNYySBF+Bei1AuhS1fFZz9KuXlkR3i7EiNki2S0sARXJDKwtqvl2qJjP76fJKlYjcdkFbnzfzJZPOe4Uo2HAmrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008092; c=relaxed/simple;
	bh=UjKNvEvAapCkXDaiwGGuY0Ctjo+bbdUzPEbSMdchq9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2jKlcVg/m4C+srAl6LjHdCYTkA1LLGO24dmE84pn//aAOJlMauYsO5VDtHNN4omg9hz59cOC61HLJQkDyqmTVhZ7/i3TuWpcw4p8d30qQx4Tqs1FHNvKZn0QVSMmew9IZw8LJX38afGZ7t3Nr4nRS2jbaZ4RtNMF9Onp/0JtWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CELUp8Y8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CELUp8Y8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B476A1F000C5;
	Wed, 14 Oct 2026 20:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008091;
	bh=emEk8CPevMzbjSFFu1Ej18NdZfPdEo64y3m/O08+QJs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CELUp8Y8B3LVVZzG5BKLZluNpSQkUoQl/BIumL+kjdmsDS9H69ORori8LMCCGxLDV
	 L+w6W/QWQWcraXu/2glxvmNvFRu9i2s3E4T/q4gYvsLwQ6REPen4Crj3qH6fwTvOhA
	 2ouF3NrduLS6FX3+mjZTzQKyRek44UrRtwZdWxwAegJW5b37x2lKtcr6N5Y0oNk2YF
	 6y05clq60cC4us6sEwP6sPDwlLf0cM8804tZJFewCIWVI+4GIxW4YFjazfaZsj1SfX
	 1zoiIPvqzNHOcI7OqnIqgnPVa8xd5p6vGm8murEBvkvYIKvAmVi/cWx8XPXjDRlFGC
	 1LGAZSI/+LDDw==
From: Sasha Levin <sashal@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] selftests/prctl: build generated tests for the target architecture
Date: Wed, 14 Oct 2026 16:01:23 -0400
Message-ID: <20261014200127.1363472-2-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014200127.1363472-1-sashal@kernel.org>
References: <20261014200127.1363472-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The prctl Makefile builds nothing when CROSS_COMPILE is set, even when
the target is x86, and it lists its compiled programs in TEST_PROGS,
which lib.mk treats as source-tree scripts. The binaries are therefore
built into the source directory rather than OUTPUT. The architecture
check also restricts set-anon-vma-name-test and set-process-name to x86
although neither depends on the architecture.

Build the programs as TEST_GEN_PROGS, build the two generic tests on
every architecture, and keep only the TSC tests x86 specific. Select
them from the target ARCH when it is given and from the host's SUBARCH
otherwise, using a private ARCH_PROCESSED instead of overriding ARCH.
The override added by commit 5a1292137e89 ("selftests: fix ARCH
normalization to handle command-line argument") changed the value that
lib.mk uses to choose the clang target: leaving ARCH unset again lets
lib.mk use the compiler's native triple. A command-line ARCH such as
x86_64 is still normalized for the TSC test selection, while an ARCH
spelling that lib.mk does not know, such as i686 with LLVM=1, is
rejected in the same way as for the other selftests.

Fixes: f59514b6a8c5 ("Documentation/prctl: don't build tsc tests when cross compiling")
Fixes: 5290586186d2 ("selftests: prctl: Add new prctl test for PR_SET_VMA action")
Fixes: e0606daeaab4 ("selftests: prctl: Add new prctl test for PR_SET_NAME")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/prctl/Makefile | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/prctl/Makefile b/tools/testing/selftests/prctl/Makefile
index e770e86fad9ac..123f884e9dfa5 100644
--- a/tools/testing/selftests/prctl/Makefile
+++ b/tools/testing/selftests/prctl/Makefile
@@ -1,14 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
-ifndef CROSS_COMPILE
-ARCH ?= $(shell uname -m 2>/dev/null || echo not)
-override ARCH := $(shell echo $(ARCH) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
+top_srcdir = ../../../..
+include $(top_srcdir)/scripts/subarch.include
+ARCH_PROCESSED := $(shell echo $(or $(ARCH),$(SUBARCH)) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
 
-ifeq ($(ARCH),x86)
-TEST_PROGS := disable-tsc-ctxt-sw-stress-test disable-tsc-on-off-stress-test \
-		disable-tsc-test set-anon-vma-name-test set-process-name
-all: $(TEST_PROGS)
+TEST_GEN_PROGS := set-anon-vma-name-test set-process-name
+ifeq ($(ARCH_PROCESSED),x86)
+TEST_GEN_PROGS += disable-tsc-ctxt-sw-stress-test disable-tsc-on-off-stress-test \
+		disable-tsc-test
+endif
 
 include ../lib.mk
-
-endif
-endif
-- 
2.53.0

