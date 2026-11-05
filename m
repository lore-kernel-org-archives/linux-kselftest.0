Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793847768;
	b=Nq0gfD76YCXiZEom9ZU056lK6Nl4/HpEpxXrgxiwissE4oaV0K/3ey90j013tgV4blVb
	 x6AFXxiCwrWVOCSkK6ddlgtC6RpW1dSNbNxn3P+QQxaAThCwd4pOJvJsnpqTI5I/R1KDv
	 Lx7NKblaTS1UbU3/O/eGrue40k8YH0Go3sxByqKq7Cjkdz2vQZrKvGmo49YcvxE/AV92L
	 IV9sYuKD8q+3cwVbmCxhUc/hWKuS5G8eiug8Yko4JuizeTOt7ajoBtVA9l/+u2I3yAcxV
	 tnNWD8LyVnRSvi3X1EP40zuDKX1S0Ial/OFHjGNGOG4JJc/CL3jgazavY5JjgJ1zjfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793847768;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WdKOtzvnJNMkGMT9C06CE/i0pxoSQC4W+nBE12HQ728=;
	b=Wg2tFjj5q2Rx8qoXH5S3gGnS7OpsSe6TPPjyEx8czUJRdwrKDygIbiDiYAshVgb+bA6j
	 9qcNCuWmW+idhwr8MbxU1B7QPbqarKQnr5necaEkNBGBo0p5FWy67lbw4I60IbOIRGhE1
	 6qzcRsTN+7XAiX3D/kd7oQp25CA8E5OxqWr/AedANI+SpnjDYrELFXhxdS6kJMnKnDoe/
	 Y17n6+kul48KPE4cI6UK6GZc7BtvNXgWilqXtSrUzZ/oXn0lrvBmjwZumh/Ez46HTGWBd
	 LuyYt8tOxRy42vMg2m6SHVtqfGtEqq94bepGhTPFO/yjVAZQXNBIOapNiPaKbn/+6hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dPFoeNED;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CE3606A329;
	Thu,  5 Nov 2026 03:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dPFoeNED
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52FB1F0093A;
	Thu,  5 Nov 2026 03:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793847767;
	bh=WdKOtzvnJNMkGMT9C06CE/i0pxoSQC4W+nBE12HQ728=;
	h=From:To:Cc:Subject:Date;
	b=dPFoeNEDP5/Vl/yIotbD3gBHZrXY9GIMk+nm3fnXG+/f3hvyXzBD6vLfrFEgBE3hP
	 A79vQGKy4T9/m+sM/sdzrFq04cBqOvaEEtmsJrduruHAmYIXQAhOzLLhKheB7GANBu
	 3pbovby8a7eJY0hkw6B4eEqc8reCEt2bEtfJVSYzZTURCBMsfTfR6HpFYHB08j0dJF
	 WACeoxM0Ov/N5MOXaIWq6Mm1r/233UfZB0KGK3VIEDcr30Yfr1kPLUnag2MlqbWpL0
	 fZa+bDenXLAS3D0DubgVlux9LLucV/2E4vhTF6Tl7HwVHb2DQrPwj7TdZiDehRaWmk
	 sTCc9CYEr/ZOg==
From: Sasha Levin <sashal@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/x86: report a skip when shadow stack cannot be enabled
Date: Wed,  4 Nov 2026 22:02:45 -0500
Message-ID: <20261105030245.1241500-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_shadow_stack prints "[SKIP] Could not enable Shadow stack" when
ARCH_SHSTK_ENABLE fails, as it does on CPUs without shadow stack support
and on kernels built without CONFIG_X86_USER_SHADOW_STACK, but then exits
with 1, so the kselftest runner reports a failure.

Exit with KSFT_SKIP instead.

Fixes: 81f30337ef4f ("selftests/x86: Add shadow stack test")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Found with KernelCI's x86 builds, which leave
CONFIG_X86_USER_SHADOW_STACK unset. Tested on an AMD EPYC 9655P with
KernelCI's x86_64 build of next-20261104: the test now exits with 4
instead of 1.

 tools/testing/selftests/x86/test_shadow_stack.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index 3d6ca33edba42..f7051ea525d4e 100644
--- a/tools/testing/selftests/x86/test_shadow_stack.c
+++ b/tools/testing/selftests/x86/test_shadow_stack.c
@@ -36,6 +36,8 @@
 #include <linux/elf.h>
 #include <linux/perf_event.h>
 
+#include "kselftest.h"
+
 /*
  * Define the ABI defines if needed, so people can run the tests
  * without building the headers.
@@ -1061,7 +1063,7 @@ int main(int argc, char *argv[])
 
 	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
 		printf("[SKIP]\tCould not enable Shadow stack\n");
-		return 1;
+		return KSFT_SKIP;
 	}
 
 	if (ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK)) {
-- 
2.53.0

