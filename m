Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B530396D0C
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 23:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419949; cv=none; b=F/V5FAUakC5/ZG/1dDh0twkhUHRQrbP8c1dS/SabMSGzh7Uv2apfX0uEKwkx7VSykgmLiZkGQRNXBDaiQvVBgCZk9Gq3KEBChEj/y3YInRVG5ifVhuYwNYoxkk0NqGNYn/YlBELfzQ0JWXpPwZ5XHki69KDGzdjlOh0o3ITfDSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419949; c=relaxed/simple;
	bh=M6OJfT3qSdP4lnrHz8anqee8kUQRnD0Hidbc1/0+8Oc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VLBfzIoDQG9ZSMZvuu1HgUrND5b9Q0sPl6TNRU83r4OtsV6PTr1RYyce4OASw28EjZ5jnyiA10/0mcQQPPgWhz0YYq3KkwJObny5ozeaZZCOUkMgYXnjostZhin4HmCa6IiF9NmSIi/jXrqu0B0RsWdJbqNuw/bljIUWJ/EFg+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q1q6gSE/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q1q6gSE/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891b0786beso86583135e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 16:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777419946; x=1778024746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvXdowVtyuI/sQdPSdYXchM5M1PBQ4p+rahyvFeZ5AI=;
        b=Q1q6gSE/yOB9uZkLeFW3arVCZ+xW55fDpp2tUcBds91phrNsMTj90wfQh4psEpR/rR
         wznLeD7oC9JyesXkvz+rYNTuh12uXcVShi9Il0PM1sHsuZAAudZauM/a+rtIxxxMPMEd
         EwCOCI7iec6OKZtimTH1Ke5Huc6KcCKChJUvXqxkJxOl0ngC9jtablCWwyQOVEJZI5Sl
         LTv4cJZA9GxS2rhbplJiNvo2dJt0pcNzETUbZ4rvLfPn7SPf0fFGb1bmIDK0yILTdrqj
         pNgvbKFXWPR4ZxYA8DtN6Ta6a/ZyiZBZ3t6l9McxdDu990CvV8xxYAPMczWNLrvuGJY4
         Dp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419946; x=1778024746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gvXdowVtyuI/sQdPSdYXchM5M1PBQ4p+rahyvFeZ5AI=;
        b=AcORV+aqypBJ+e+Jmj+Fqe42zPB3+RgiQJPcpblCZTZ6dMrr7BcGlhIve4fydzdZ8J
         x6PToUwEOQCBQdSF6i/SRBZDorpOhUl1mGF/zBbTZKCFTSS3BGnyQqElfFaIsw2rUZgF
         FsvAzdOOFiMWFtIz2QrKB7k5UWfbIlRf1mnQeICh6RkOl0grshihm/8f2mZ5VBPl9SEA
         1b1Gyoem9UT3NNvor9lRNgxY0P26xKngPweqpw9KPPRAUHVfrUSWfd5JHDnJg1GAUDwg
         IpcmB5wPEl3sJFEyxRlbsvgwpQQ5rb5eN+BERuBlihzNsa+Cmucp+rBP729AnFVFeWzu
         87wg==
X-Forwarded-Encrypted: i=1; AFNElJ99e+9OZug+M1ObNVkxZf5UIAVX6FLArgY6DqlaPGrkZolkpYkPKaNECrNlOxjlOCF8avwDoOArvbkCVocikEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YydrZXCxDs4oXoWYDy56KdyQZm7M071/N8gMdGPTg1MxAj0/LDw
	HrDNa2QSM8HmuCNoqHgHjH+Foj9G+Ih2fWEjR50F1keFmQuZbOXSbjCLuf4Ax1ThBso=
X-Gm-Gg: AeBDietnjGFaF0eV6WY2aT+ZC562M5Il+53t7cwr9I0npe49PR+CqZynIDgYmODoJWX
	YyWeILttT9M34w0FbxaQhyKvVZRxpOjDmhk6VBWOog2HpV1wBJJB3bHn3Mm9Nvda1CdremMdrab
	xyg3w+ceLeemEMLZpWtb0zT6kdOEU7ebRmOBWc00dqSIGfANkZ/nUFCHVCcuKG0kiTg6CYlZpWG
	+sN4FEF/9jwgnOSBW/V4VhyD/+F58y2bakWkaZ2M9dVUc5vj7APZm+44bjanVwGzxeeEJUUlBtY
	CTat5eSi6/fcnoFBDbD6n7guzN8c2daDjbYXUaioJYtNekoFidrfpNB+olaEMS5AfodkQPsFerl
	+Y+P4PcOVDzyEkYDVtBK/19n6nM7l/jjVrVOKHtob+MWIRHPkLvg3LA92//zx/CWRSoHTvo+KKe
	t4KIpjOyRhVBLZ5f8G/C1bHIMS
X-Received: by 2002:a05:600c:138e:b0:488:c014:34da with SMTP id 5b1f17b1804b1-48a7b549000mr27416645e9.26.1777419946495;
        Tue, 28 Apr 2026 16:45:46 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6297f4e2345sm240138137.0.2026.04.28.16.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 16:45:45 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 28 Apr 2026 20:45:08 -0300
Subject: [PATCH bpf-next v8 07/11] selftests/bpf: Skip tests whose objects
 were not built
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-selftests-bpf_misconfig-v8-7-bf02cf97dbcb@suse.com>
References: <20260428-selftests-bpf_misconfig-v8-0-bf02cf97dbcb@suse.com>
In-Reply-To: <20260428-selftests-bpf_misconfig-v8-0-bf02cf97dbcb@suse.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777419912; l=5462;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=M6OJfT3qSdP4lnrHz8anqee8kUQRnD0Hidbc1/0+8Oc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QI/vJASeufP/GKj/nGjA7NK3YrtbiPXcNZjGrVzqGLi3qIuwk2Ice1ZXUoucXS4Y60laEqLz2DX
 7NMQAnH274gs=
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
 tools/testing/selftests/bpf/test_progs.c | 53 +++++++++++++++++++++++++++-----
 tools/testing/selftests/bpf/test_progs.h |  1 +
 2 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_progs.c b/tools/testing/selftests/bpf/test_progs.c
index cc14b13e23fe..7ba82974ee78 100644
--- a/tools/testing/selftests/bpf/test_progs.c
+++ b/tools/testing/selftests/bpf/test_progs.c
@@ -165,6 +165,8 @@ struct prog_test_def {
 	void (*run_test)(void);
 	void (*run_serial_test)(void);
 	bool should_run;
+	bool not_built;
+	bool selected;
 	bool need_cgroup_cleanup;
 	bool should_tmon;
 };
@@ -372,6 +374,8 @@ static void print_test_result(const struct prog_test_def *test, const struct tes
 	fprintf(env.stdout_saved, "#%-*d %s:", TEST_NUM_WIDTH, test->test_num, test->test_name);
 	if (test_state->error_cnt)
 		fprintf(env.stdout_saved, "FAIL");
+	else if (test->not_built)
+		fprintf(env.stdout_saved, "SKIP (not built)");
 	else if (!skipped_cnt)
 		fprintf(env.stdout_saved, "OK");
 	else if (skipped_cnt == subtests_cnt || !subtests_cnt)
@@ -1641,6 +1645,7 @@ static void calculate_summary_and_print_errors(struct test_env *env)
 	json_writer_t *w = NULL;
 
 	for (i = 0; i < prog_test_cnt; i++) {
+		struct prog_test_def *test = &prog_test_defs[i];
 		struct test_state *state = &test_states[i];
 
 		if (!state->tested)
@@ -1651,7 +1656,7 @@ static void calculate_summary_and_print_errors(struct test_env *env)
 
 		if (state->error_cnt)
 			fail_cnt++;
-		else
+		else if (!test->not_built)
 			succ_cnt++;
 	}
 
@@ -1700,8 +1705,13 @@ static void calculate_summary_and_print_errors(struct test_env *env)
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
@@ -1772,6 +1782,19 @@ static void server_main(void)
 		run_one_test(i);
 	}
 
+	/* mark not-built tests as skipped */
+	for (int i = 0; i < prog_test_cnt; i++) {
+		struct prog_test_def *test = &prog_test_defs[i];
+		struct test_state *state = &test_states[i];
+
+		if (test->not_built && test->selected) {
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
@@ -2046,15 +2069,20 @@ int main(int argc, char **argv)
 		struct prog_test_def *test = &prog_test_defs[i];
 
 		test->test_num = i + 1;
-		test->should_run = should_run(&env.test_selector,
-					      test->test_num, test->test_name);
+		test->selected = should_run(&env.test_selector,
+					    test->test_num, test->test_name);
+		test->should_run = test->selected;
 
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
@@ -2106,9 +2134,18 @@ int main(int argc, char **argv)
 
 	for (i = 0; i < prog_test_cnt; i++) {
 		struct prog_test_def *test = &prog_test_defs[i];
+		struct test_state *state = &test_states[i];
 
-		if (!test->should_run)
+		if (!test->should_run) {
+			if (test->not_built && test->selected &&
+			    !env.get_test_cnt && !env.list_test_names) {
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
index 37955a8ad385..2cf950afcd85 100644
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
2.54.0

