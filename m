Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793748194;
	b=g1dPQntyLxu2DsQlwQLAtKVAfEwnJab/TnqNtMWY+dN8eUzOuJzajtwfCGZX2hGl+eZi
	 wRKn/P/p2+cD3YrgRHXv0xzfGXlivPxt38CchKP+0x02xQl0W+kNMaHOEDdz0eyIwUxE6
	 GkX4nGJFbrTo/v7grD13cYd5ZnWD6cMXFI0V/uE2z1gDnCmyes9bENTlZnz1QsX2DYO0P
	 rWBbidQ+kuCLnU+bPcEBAyPnZ7tzJzYM1Phrwqu4A15Rk6kX3QWRnssHvWANbCUoTl6KT
	 SIWII0J408GQl/bGF/CrrQfmjAA0+asjDcCKMuv9J7RT6nh9cRcCGhYpEaB0MEl6sog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748194;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e7rXf/7upxx278z7chkqQz8HWBYmfJDS1RiHHtrdlaQ=;
	b=Gr1pJVKS1uzTBKVAeuADi+mENUm+cbLfJDxAuOuSGWxbN72FbixuBclz64L/1vql6z+9
	 EJGwGZgdcleltKRHKZHY3YrD65AzloDuXXwUJtbF+phbAOko2TbVsx9J3mkKi3ZnNKs1R
	 SI6LQytOFQQtrv9MYFtDXxiJuVVW6ikHBZ5TeRUEnuQnBEG6wLmZlbUDwDAbsZneu1jC4
	 3aP/RnZeTgMkTSzHqqAsLb7O/Bcne6Fzhf2h+Q/jxjvB4ypG5XlV9/glH39MBvtzW44ar
	 3of22Ns8KTBIHE3woOddPsvXAApq4KYdXjxr2rC0OVGnjyH19URxgV/nKpMNgHsNURw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOfgK94k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBA3606A31B;
	Tue,  3 Nov 2026 23:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOfgK94k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7081F000C1;
	Tue,  3 Nov 2026 23:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793748189;
	bh=e7rXf/7upxx278z7chkqQz8HWBYmfJDS1RiHHtrdlaQ=;
	h=From:To:Cc:Subject:Date;
	b=NOfgK94kPQuJt2tWbKaCubyhU9FV3ihz9gQSTdbmCF3YMtOS4Sd/+I94hUfntHllX
	 9NVzIZR+CFdaFq++/BBqhLMVViCNJNGHoi/6YJLLLwAARAW5ffLoxfHoub3rXAqLXr
	 Gu1nIATHojy4Kc9ncAbQL4eSjDeZZX7IwwmAPWHxKNYZqIKwEm8aXvWF2AE8YFHvDt
	 mYnntGgjz6LSIOtkTv5tHux5CubRchT9REAhSz+mjp1R2fc0Y+HXNi0Ab8jmf1q0M3
	 Qm3AGGKZPD7MdsaAVK8TgDluu1CC5Q/tr1peOtoxNT/+L87gp9T/nJB2PJ1U+qIEK6
	 bzAdlY5eL4odg==
From: Sasha Levin <sashal@kernel.org>
To: Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: harness: don't compare function pointers in is_signed_var()
Date: Tue,  3 Nov 2026 18:23:05 -0500
Message-ID: <20261103232307.1924618-1-sashal@kernel.org>
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

is_signed_var() checks whether -1 converted to the type of its argument
is below 1. When an ASSERT or EXPECT compares function pointers, such as
the result of signal() against SIG_ERR, that is an ordered comparison of
function pointers, and clang warns about it:

  legacy_check.c:41:2: warning: ordered comparison of function pointers ('typeof (__exp)' (aka 'void (*)(int)') and 'typeof (__exp)' (aka 'void (*)(int)')) [-Wordered-compare-function-pointers]

Do the check on uintptr_t for pointers, which __builtin_classify_type()
reports as class 5. Pointers already come out as unsigned, so the
output doesn't change.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Found with clang 19, 21 and 22 in the rseq and namespaces tests; gcc
doesn't warn. On failure the harness prints the same values as before
for integers, char, bool, enums, and object and function pointers. This
is next to the lines that the pending 32-bit __EXPECT() fixes change, so
whichever goes in second needs a trivial rebase.

 tools/testing/selftests/kselftest_harness.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 29a19bc870846..54ee275fac8f0 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -760,7 +760,11 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
 	for (; _metadata->trigger; _metadata->trigger = \
 			__bail(_assert, _metadata))
 
-#define is_signed_var(var)	(!!(((__typeof__(var))(-1)) < (__typeof__(var))1))
+#define __signedness_type(var) \
+	__typeof__(__builtin_choose_expr(__builtin_classify_type(var) == 5, \
+					 (uintptr_t)0, (var)))
+#define is_signed_var(var) \
+	(!!(((__signedness_type(var))(-1)) < (__signedness_type(var))1))
 
 #define __EXPECT(_expected, _expected_str, _seen, _seen_str, _t, _assert) do { \
 	/* Avoid multiple evaluation of the cases */ \
-- 
2.53.0

