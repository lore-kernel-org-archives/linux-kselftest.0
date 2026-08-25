Received: from mta1.migadu.com (out-111.mta1.migadu.com [95.215.58.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8142A41D223
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 12:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661048; cv=none; b=jCcBbOwwaIw8nZcHY4n2iirCpnxsrRpSj0einvPeAsjuLSyJK1WsfBNrH7hGvOvALm0l++WXIsgzrTNu6llYDwYKiwa7sSGbpm6M4QbWuX6SYLpoeuie0LYPBWwDkO/FWyriJaZuthl0jLY7O1AFHAvWxnWzpOvgbVO/ahTTg+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661048; c=relaxed/simple;
	bh=lKJdbgYc40Jcdb2LxGXn1NfTq3I444jKQUjSdN+FxF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RKtIQU0U9vQnZ49xzP2ZQjVICfoK+oIrb2mi2ZXA/xSL4oufvvjRQikUXbNZlUpRc904hOD7SmMI+H/HXQcRp//SRngaEQWVGxcAvsb8XLYC8lcpkEIMPTY3j0odtOnN4hxyZv+K+xhCy5Sod0OmC7WAQPB8cj4BLMqo4QmYM9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jbXpDYkS; arc=none smtp.client-ip=95.215.58.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jbXpDYkS"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lKJdbgYc40Jcdb2LxGXn1NfTq3I444jKQUjSdN+FxF4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787661040; v=1; x=1788265840;
 b=jbXpDYkSSpE3/fKdMTtIu2NfFmrbZAqBzRZ388JbIUwLFBziMQYAybduM46RMoEvpdkYhRhP
 LG4BXOEeYX8+uUhSDQ0SLmZP1o7iGtwyXZbyBRJOf+EwqOYvKw+c9+obxSKnF65N7epfn7CO2KK
 KbVrjBqsjal1s2vBSduNR4w4=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from localhost.localdomain (139.159.170.87)
	by smtp.migadu.com with ESMTPS id fdb6cd8b86f8c3a8;
	Tue, 25 Aug 2026 12:30:40 +0000
X-Mizu-Trace-ID: fdb6cd8b86f8c3a8
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
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
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH] selftests/mm: fix incorrect skip output in pkey_sighandler_tests
Date: Tue, 25 Aug 2026 20:30:23 +0800
Message-ID: <20260825123023.64418-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

When pkeys is not supported, ksft_exit_skip() runs with ksft_plan already
set, which takes the "ok N # SKIP" branch intended for skipping a single
test case.  The result is a TAP plan of 5 but only one result line.

 $ ./pkey_sighandler_tests
 TAP version 13
 1..5
 ok 1 # SKIP pkeys not supported
 # 1 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
 # Planned tests != run tests (5 != 1)
 # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0

Move ksft_set_plan() after the skip check so ksft_exit_skip() takes
the "1..0 # SKIP" branch, the correct TAP representation for
skipping an entire test file.

 $ ./pkey_sighandler_tests
 TAP version 13
 1..0 # SKIP pkeys not supported

Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 tools/testing/selftests/mm/pkey_sighandler_tests.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index c218d0510a2a..74bf79a5399d 100644
--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
+++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -543,11 +543,12 @@ static void (*pkey_tests[])(void) = {
 int main(int argc, char *argv[])
 {
 	ksft_print_header();
-	ksft_set_plan(ARRAY_SIZE(pkey_tests));
 
 	if (!is_pkeys_supported())
 		ksft_exit_skip("pkeys not supported\n");
 
+	ksft_set_plan(ARRAY_SIZE(pkey_tests));
+
 	for (test_nr = 0; test_nr < ARRAY_SIZE(pkey_tests); test_nr++) {
 		tracing_on();
 		(*pkey_tests[test_nr])();
-- 
2.53.0

