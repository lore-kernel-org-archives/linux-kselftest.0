Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FDD38F631
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 21:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286810; cv=none; b=YFH9NI8+biEvzt12+3EA4UIzeT1sRj7OJt8hUr4+0/Muxls341+TgxuZJlFFwTpZ5g4g6NmDZNokW5y7VSjiobT6n9FdRD7MxN0NpEsF5AMt+gt4OW9e/dnhk1WDqYazoQmCRAFvavjZP7z3RF9sYC3zL4gmZ2dlg4FlqTr8V2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286810; c=relaxed/simple;
	bh=lgzOSFWnfizXkJttevzQ4RKDDkBKg9+cgJB2nDOdEzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nJpLhlZdwtDvdhymsFtdj+4lAyK/0BKup2Hgu5o/D8qMoPtZYb9AWpvkBVQ2RxFZizr5ZY+euB9SNdZ9glMJ6COBOuL+RpklJyUvYWKc6n5yK2YCbZz/bT/ohguV+MPMtpWf/e8nLl+o2IJ4TEWrVZ/H4rCx/deDnOrCNofaPvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TA5ALz5z; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TA5ALz5z"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso88101335e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 14:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776286808; x=1776891608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W17fl6DlylZsqZw79dVwMj/l25sGnBeZjcx83IwMViI=;
        b=TA5ALz5zECmuKYYstl4GfooC8DbW5f801uDwqfrQ1Ju74ctDFwZiE6UfSN5L/EXhKH
         G0dauZtZBOmN332sBhrT8S73+FtoG9PA0kaUax5O/R3gzATHeT0p4+vk0cgtLpe6JScw
         8h9RmuDzsJQxsKPPY8Ss9THRuDkGsjsQ2tUmIvgD+ebdhr7HTESQlhpFD2AxfzjcYwE+
         3rFWdH2xAg9kYv3aYao1Bz5zs6VqaXdmdUPhVSBAh46u1onY9oXV3tS2wDSgVrmyoF3n
         rZRQ90UptvqtlvnseaCfAqzX9oCdlv7tOyeb78+wf7CwTvqssJtGeZIMSiZgt6OuBwi5
         3pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286808; x=1776891608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W17fl6DlylZsqZw79dVwMj/l25sGnBeZjcx83IwMViI=;
        b=BOfa+G93GmrdgLNzoLTFiSoWK6mcZs0etIGjL6Fzxn2H2FEdI1Kkxz3WajmGmSV76R
         a/ivmN5u8Za1SGRf+/kOpM/LckUJm4BVKKLPfWdoM2zUKAd9cszGrnKGkpK8Sy+yAKHi
         7ywFYgsJF0KhDp1Whsbg2c1Mc/DPHr6/fvf7xwAikqGoIgJYajaFn7fTBOlu8lNiYouq
         XuLBdu/87L3j09xmaizLv+z12AF1+koKz+TadXQq8W52778TwRz9twq4L2muqi02C7ql
         dy33QMkWq+ZbRI+FvPLC9tj9DDFmnuWpH4OzCz+OclLqKvWQK0O0Bf7oGKTPie9kEg4+
         ce4A==
X-Forwarded-Encrypted: i=1; AFNElJ9DVcXw9j0ad28xR+7UakFdWbFmHbfOhhn4FCCM08Qq00OXzaDuToIqNyITzF2pgzt2X6GeBRip2oPr7F6UWw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPu4PQVGceEtdOuiGjVfiGtIDnylcT1wNwXVaA83gL5iFKk5+Q
	IHkFFZySnQ1Ay0hV68AIWkK6c9Z2Kkb0Az1b+v2arp5WZhMK+o53vCGsbL1ltKC5PmQ=
X-Gm-Gg: AeBDietwUPjJFesREsEMM/ozghZB5ratc4hUPC7ku5NL0vGGaP/u/LrTTIPm+PEQeHo
	tQADbY0JHRt9q6whGY+WBPnTykzEP+kTDgSayImyvjvB/CeNci4uzEpF3W36YSQdhIxafqnIzT/
	ATLCUqjgOWjAeEnqNR+iWysC1u9P+LdDxf0UEOA2zL+Xbmdw14mhpqzVdQjTycdmJUiweU7jPK4
	Dd5dKsg0aLpx+gJG1LfS2adEAEFs4FfgIiY+tPFWKH2fyTaQG6wEyGDIEgO30zalf8NNIHLyPtr
	srstLQpm7TlWYpTzYAFXzuGBNVSjIzJEGBWWTz1p8U+3qeN59RYiho1zNMJsj0KiEs60nj/sFDS
	NE2N4cBmLkrjnfwLnSCssyldK7jPywqstmyFtL8twkmcW4fkt/ncP13Mkc0fi7pPuVPKBBiMTQ7
	me25c9TbWiLhg=
X-Received: by 2002:a05:600c:8706:b0:488:b9c6:11ba with SMTP id 5b1f17b1804b1-488d6890cf9mr322699135e9.28.1776286807486;
        Wed, 15 Apr 2026 14:00:07 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e630143sm5097630c88.6.2026.04.15.14.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 14:00:06 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 15 Apr 2026 17:59:28 -0300
Subject: [PATCH bpf-next v5 10/11] selftests/bpf: Skip tests whose objects
 were not built
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-selftests-bpf_misconfig-v5-10-03d0a52a898a@suse.com>
References: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
In-Reply-To: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1776286765; l=4693;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=lgzOSFWnfizXkJttevzQ4RKDDkBKg9+cgJB2nDOdEzA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QI6DqtYECtFIZePV7wEsQlMK4Xw7Pp9qXIgR8RtkUwkPTduEVxFa8hyszHy6EWsM+cqoBGPN3Ii
 pux/llp8Mtww=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When both run_test and run_serial_test are NULL (because the corresponding
.test.o was not compiled), mark the test as not built instead of fatally
aborting.

Report these tests as "SKIP (not built)" in per-test output and include
them in the skip count so they remain visible in CI results and JSON
output. The summary line shows the not-built count when nonzero:

  Summary: 50/55 PASSED, 5 SKIPPED (3 not built), 0 FAILED

Tests filtered out by -t/-n remain invisible as before; only genuinely
unbuilt tests are surfaced.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/test_progs.c | 44 ++++++++++++++++++++++++++++----
 tools/testing/selftests/bpf/test_progs.h |  1 +
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_progs.c b/tools/testing/selftests/bpf/test_progs.c
index 7fe16b5131b1..759e76d76c57 100644
--- a/tools/testing/selftests/bpf/test_progs.c
+++ b/tools/testing/selftests/bpf/test_progs.c
@@ -165,6 +165,7 @@ struct prog_test_def {
 	void (*run_test)(void);
 	void (*run_serial_test)(void);
 	bool should_run;
+	bool not_built;
 	bool need_cgroup_cleanup;
 	bool should_tmon;
 };
@@ -372,6 +373,8 @@ static void print_test_result(const struct prog_test_def *test, const struct tes
 	fprintf(env.stdout_saved, "#%-*d %s:", TEST_NUM_WIDTH, test->test_num, test->test_name);
 	if (test_state->error_cnt)
 		fprintf(env.stdout_saved, "FAIL");
+	else if (test->not_built)
+		fprintf(env.stdout_saved, "SKIP (not built)");
 	else if (!skipped_cnt)
 		fprintf(env.stdout_saved, "OK");
 	else if (skipped_cnt == subtests_cnt || !subtests_cnt)
@@ -1700,8 +1703,13 @@ static void calculate_summary_and_print_errors(struct test_env *env)
 	if (env->json)
 		fclose(env->json);
 
-	printf("Summary: %d/%d PASSED, %d SKIPPED, %d FAILED\n",
-	       succ_cnt, sub_succ_cnt, skip_cnt, fail_cnt);
+	if (env->not_built_cnt)
+		printf("Summary: %d/%d PASSED, %d SKIPPED (%d not built), %d FAILED\n",
+		       succ_cnt, sub_succ_cnt, skip_cnt, env->not_built_cnt,
+		       fail_cnt);
+	else
+		printf("Summary: %d/%d PASSED, %d SKIPPED, %d FAILED\n",
+		       succ_cnt, sub_succ_cnt, skip_cnt, fail_cnt);
 
 	env->succ_cnt = succ_cnt;
 	env->sub_succ_cnt = sub_succ_cnt;
@@ -1772,6 +1780,19 @@ static void server_main(void)
 		run_one_test(i);
 	}
 
+	/* mark not-built tests as skipped */
+	for (int i = 0; i < prog_test_cnt; i++) {
+		struct prog_test_def *test = &prog_test_defs[i];
+		struct test_state *state = &test_states[i];
+
+		if (test->not_built) {
+			state->tested = true;
+			state->skip_cnt = 1;
+			env.not_built_cnt++;
+			print_test_result(test, state);
+		}
+	}
+
 	/* generate summary */
 	fflush(stderr);
 	fflush(stdout);
@@ -2049,12 +2070,16 @@ int main(int argc, char **argv)
 		test->should_run = should_run(&env.test_selector,
 					      test->test_num, test->test_name);
 
-		if ((test->run_test == NULL && test->run_serial_test == NULL) ||
-		    (test->run_test != NULL && test->run_serial_test != NULL)) {
+		if (test->run_test && test->run_serial_test) {
 			fprintf(stderr, "Test %d:%s must have either test_%s() or serial_test_%sl() defined.\n",
 				test->test_num, test->test_name, test->test_name, test->test_name);
 			exit(EXIT_ERR_SETUP_INFRA);
 		}
+		if (!test->run_test && !test->run_serial_test) {
+			test->not_built = true;
+			test->should_run = false;
+			continue;
+		}
 		if (test->should_run)
 			test->should_tmon = should_tmon(&env.tmon_selector, test->test_name);
 	}
@@ -2106,9 +2131,18 @@ int main(int argc, char **argv)
 
 	for (i = 0; i < prog_test_cnt; i++) {
 		struct prog_test_def *test = &prog_test_defs[i];
+		struct test_state *state = &test_states[i];
 
-		if (!test->should_run)
+		if (!test->should_run) {
+			if (test->not_built && !env.get_test_cnt &&
+			    !env.list_test_names) {
+				state->tested = true;
+				state->skip_cnt = 1;
+				env.not_built_cnt++;
+				print_test_result(test, state);
+			}
 			continue;
+		}
 
 		if (env.get_test_cnt) {
 			env.succ_cnt++;
diff --git a/tools/testing/selftests/bpf/test_progs.h b/tools/testing/selftests/bpf/test_progs.h
index 1a44467f4310..6ee10360e314 100644
--- a/tools/testing/selftests/bpf/test_progs.h
+++ b/tools/testing/selftests/bpf/test_progs.h
@@ -125,6 +125,7 @@ struct test_env {
 	int sub_succ_cnt; /* successful sub-tests */
 	int fail_cnt; /* total failed tests + sub-tests */
 	int skip_cnt; /* skipped tests */
+	int not_built_cnt; /* tests not built */
 
 	int saved_netns_fd;
 	int workers; /* number of worker process */

-- 
2.53.0

