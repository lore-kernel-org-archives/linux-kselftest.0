Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446273F8247;
	Mon, 17 Aug 2026 11:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965458; cv=none; b=Dk6P3EXdQW/doIROgGbRWbNUWRQoo+2jEtBaK4z0kwZEdrg8rszqaizkRCVGYKu6NAn7x24KvXxUPvkXp3TBBDv+xNHBEVNx0QBlqnQIGH4oqYjkGUQ6HMmFaJ0C6Y7P6PKlrrhYYjmb9+a8HQr2Lz4qf5OsEmjo/lROonoqrF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965458; c=relaxed/simple;
	bh=ynL3bS6ayzq4sWttTuUIlly522D4dekptJwLpURqfMY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JGXYZQmd4qczYpUGIzBXiBqsgmGKmCUgZztX89TpMJd+gfhJRxtShYxHN1OThSdfMXrFg6wvw3x4bDKh3UhIceCAeWdyRfizV8NuL24vJchUVUYlstAjSm/pujy7idRkiVcEbgqGbvNYLzfLt+aWW/Y/HgwoYRK5TGOLWDKu2v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gywd3y2H; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gywd3y2H"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF1C71688;
	Mon, 17 Aug 2026 04:17:31 -0700 (PDT)
Received: from e127648.cambridge.arm.com (e127648.arm.com [10.1.39.91])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E2423F66F;
	Mon, 17 Aug 2026 04:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786965455; bh=ynL3bS6ayzq4sWttTuUIlly522D4dekptJwLpURqfMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gywd3y2HVLoUciex3Lhznd/uByHZdwhcAwribYYRbl34XES4MtPWNdyIBtgXXhkyk
	 HZ3Jeuv59WVIIrgRacngzFpurLH1KhhLtd4dSZbbS0FtVJASZkZIcep9gWxArPyd3K
	 8USVv9NIot7H7bdaVwzgQY0IpUx//c5YZNGW1hvc=
From: Christian Loehle <christian.loehle@arm.com>
To: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Cc: Rama Krishna Katta <ramakrishna.katta@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Gregory Price <gourry.memverge@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Gabriel Krisman Bertazi <krisman@collabora.com>,
	linux-kernel@vger.kernel.org,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH 3/3] selftests/syscall_user_dispatch: Skip benchmark if SUD is unsupported
Date: Mon, 17 Aug 2026 12:16:11 +0100
Message-Id: <7f6caf7adeefaac0e57bb06d194b36795f2888bc.1786965107.git.christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1786965107.git.christian.loehle@arm.com>
References: <cover.1786965107.git.christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syscall User Dispatch is unavailable on architectures without generic
syscall entry. On such architectures, sud_benchmark spends several
seconds calibrating before its SUD prctl fails with EINVAL.

Probe SUD with a valid disabled configuration before calibration and skip
when the kernel returns EINVAL. Treat other probe errors as failures and
continue to run the benchmark unchanged on supported kernels.

Fixes: d87ae0fa21c2 ("selftests: Add benchmark for syscall user dispatch")
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 .../selftests/syscall_user_dispatch/sud_benchmark.c      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c b/tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c
index 073a03702ff5..bb05fece301a 100644
--- a/tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c
+++ b/tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c
@@ -18,6 +18,8 @@
 #include <sys/prctl.h>
 #include <sys/syscall.h>
 
+#include "kselftest.h"
+
 #ifndef PR_SET_SYSCALL_USER_DISPATCH
 # define PR_SET_SYSCALL_USER_DISPATCH	59
 # define PR_SYS_DISPATCH_OFF	0
@@ -140,6 +142,13 @@ int main(void)
 	int ret;
 	sigset_t mask;
 
+	ret = prctl(PR_SET_SYSCALL_USER_DISPATCH, PR_SYS_DISPATCH_OFF,
+		    0UL, 0UL, 0UL);
+	if (ret == -1 && errno == EINVAL)
+		ksft_exit_skip("Syscall User Dispatch is not supported\n");
+	if (ret)
+		ksft_exit_fail_perror("PR_SET_SYSCALL_USER_DISPATCH");
+
 	memset(&act, 0, sizeof(act));
 	sigemptyset(&mask);
 
-- 
2.34.1

