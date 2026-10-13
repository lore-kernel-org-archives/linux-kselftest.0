Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D943CB541;
	Tue, 13 Oct 2026 09:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882528; cv=none; b=Pr5aX0tOIbabg92kyPwmHUvUpUn7Pr6GuDarBOPaa904kqe5dQrqIcdJNW0ZRiRLjOGCMR+65QNweY1CxEDERQEybl/dCht4nFeDypoZLQmNLWa2pLQ3dYVZthYNY4dFLtpB8dsduKgZtGN0OlHLIUpgiBC3Zo4a7W9GESefA7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882528; c=relaxed/simple;
	bh=cIR7sYatHzpWVUgO+t+s+s+L4/O0SWgp4nJcznB/T+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rkKY2GZ+6kxNSOqKjLEGTFAe4VrEQpGdHCUYkW7eDCTTJqnmK5TDirQWOZhn/IsdJ8jV4ZzCGxMDhKfkAtqsqUXWF361DkuByxqq861MVLpO4xZLG3Ij3WJjVZAQKQVOhrKZyU0dfDLp2vQpZNSEIVkjMu+kqmRJm8gmz3lP1wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kspaLnsb; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kspaLnsb"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A9DD2934;
	Tue, 13 Oct 2026 02:08:43 -0700 (PDT)
Received: from e127648.cambridge.arm.com (e127648.arm.com [10.0.128.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 19EA83F7B4;
	Tue, 13 Oct 2026 02:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791882526; bh=cIR7sYatHzpWVUgO+t+s+s+L4/O0SWgp4nJcznB/T+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kspaLnsbBtZxluusmb2wxUayWmeKxnQRNYEDRnCMaXo1Sc8pQmuDmfssM+KbBiDi4
	 HEayq7PhGvtytEQjRhMqtjR9XTNf8kB30RjZYWDhmj9+j9CI6WEZRRH2bt3xbduPBC
	 mh2Fr8VLcHM2yd/lMHxkWY2NB0yHqwY7A2YqX58Y=
From: Christian Loehle <christian.loehle@arm.com>
To: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Cc: Christian Loehle <christian.loehle@arm.com>,
	Rama Krishna Katta <ramakrishna.katta@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Gregory Price <gourry@gourry.net>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH RESEND 3/3] selftests/syscall_user_dispatch: Skip benchmark if SUD is unsupported
Date: Tue, 13 Oct 2026 10:08:21 +0100
Message-Id: <64ba18b71eaeac81c49a4008201b838dcd373e72.1791881928.git.christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791881928.git.christian.loehle@arm.com>
References: <cover.1791881928.git.christian.loehle@arm.com>
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
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>
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

