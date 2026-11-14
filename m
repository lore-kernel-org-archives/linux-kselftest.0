Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794662531;
	b=5WiOnewor4kNw1ftwt4OrJdUIId8tGDOB7+5WuEDf2rx3/vTW8mgSARV7stlDj0P1fqx
	 +YdGB3gIKXqQ7Cmk8zAO0ReNcE+nN7kV4Yuov3Gn/PWHppDPkT3m3InvyapkrrlCD1Bq+
	 h5h5k0j36bVV2qBTH4pBt2CZ2YK0tCy+yYALMH0eKtrudDsa69eQbD+mYOzw182e1LAhS
	 o5o/NUy2RJyTXvsD1uPkU5948zS4syUTBIu1xjLroaQUm/4CYcFf9lOq6ROxJsrIqhSfa
	 pYf4qUL+v5fZsmdPjLNXbV8pixL2aJJTcsrozeGFI59KDPMXineOeAWJNTWFSnzwRVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pN4ZcmtD5T7DHmE5T604efl83rlHyVSi4cy6tZsfBH0=;
	b=aU/fk67WDGfZLfxBCBIGHAdxdrTwMRTPL7pKHh595Wen6cWxKVTHzdnNan6mNn4DDSiS
	 odUGUiuWyTWLkksuhqBEF5zBjlpZhCY0RIM5x00ppG9d1f9kvwjgsLeHknySsdvdJ87sz
	 cAzXA2uf1q7jk5zN9E6b43zcN5hyafJf5diX5ZMGY3FaCYw3XM05W1oXJ5rGMQE0Vbei+
	 XkEafMCcA0Q4dKTuhPl+oAu61ooiixhmYumvWGHOiGKPSsAgFHSbt6cbn8slTeJ4vbUKF
	 F+pMBtq3MRUO/m9/otzgY3P6KenU7GlXAOKNe1S/wwskxrmD84Z0zbRhq78LXToSqZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aaronlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JK8bUT9n;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA2B606A898
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 13:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECA2B606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aaronlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JK8bUT9n
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so2950644eec.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 05:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794662530; x=1795267330; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pN4ZcmtD5T7DHmE5T604efl83rlHyVSi4cy6tZsfBH0=;
        b=JK8bUT9nqR3Zlw5Aot99pHkGdBdQmu2SX/sB5QE5AqYxzm2R1YZ23uGG4SUtff3Qz5
         VC8EFIsLfTh3xiPEtbpYRFiuzhH1p78t9vXFMryZ/rsVkJMOW3ycqyp5Hv3I3R0KM0y/
         SCFolDQ8VOLbyZ7JM6BCTmaHd9BU7Bmjf4qpwZ45e0ZnOv6k+eWykAnIDq9trSPELzwl
         yFG8qAwhjJrMmJ1j4JLjPyxcOembSIuGhZWjxAhZM/vazppI5mSHCkWum6DaI8kDkkaj
         Exvkd5Q3eaZIypLGNnaX4aEWTiXyss4lfprBRRJMOJRYVWhpNjL6bHeNEelBQP9vdpe4
         HIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662530; x=1795267330;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pN4ZcmtD5T7DHmE5T604efl83rlHyVSi4cy6tZsfBH0=;
        b=m/ug8qtTP06P8OMMSXDsBGGOkNDiif8VV1wQCf70CczDcuMU5mrISKwGOgEFrjTxPe
         Byo4xB1dXAyt9aPU6GlO2ktgJSKbUEaaohtB6njELvgoG/MWlI3OFRU8fAk9Mw/8M3fK
         on7A2mdkA61o7SF/469+s3LdLC6DYetdJYsi0ZQNXIBMdBWNSq70u6xxqGFLllw2ODuk
         ksHonBgjVEdnxKL30qBEMfoosutDfisTfwmpi4oe1HW2Bzd+RghQnH3+mi99BMVSbYpH
         k2/cM0DZaJloQXHgPfJ8oLiMPAz+IgcrgB5U0MrabX6KgfttzzGN//SN7+gkyd3RPU2M
         uYYQ==
X-Forwarded-Encrypted: i=1; AL+hErEXd8ihDN3kGSRu4tAbq7Dg4+0OAV7PQUSyPFt/T3DH7slLaIczJhSAc82iix9BHxEdJ4GMxJZVk4ZfWY0Z/pc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GVH5lXPp+GNFp4Yq5JIjtOLvTNnK6/8IOHoIqPbuy/Z9QqIhb
	bmTmYF2rx7LTt5bQA9hA+41CwB4d2AU1ExopTUq33wtW9o3ZnvHSi0UuR0NQCtxwxjum/3/tW1B
	Q3V6oXYmGsJVDlWjZcUPbvA==
X-Received: from dyaz3-n1.prod.google.com ([2002:a05:693c:6383:10b0:358:2c8e:30e3])
 (user=aaronlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:414d:20b0:36c:d1fe:84ce with SMTP id 5a478bee46e88-3796740e475mr5955566eec.33.1794662529963;
 Sat, 14 Nov 2026 05:22:09 -0800 (PST)
Date: Sat, 14 Nov 2026 13:21:59 +0000
In-Reply-To: <20261114132200.113697-1-aaronlewis@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261114132200.113697-1-aaronlewis@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261114132200.113697-5-aaronlewis@google.com>
Subject: [PATCH v4 4/5] selftests: harness: Support custom command-line options
From: Aaron Lewis <aaronlewis@google.com>
To: kvm@vger.kernel.org
Cc: alex@shazbot.org, dmatlack@google.com, jgg@nvidia.com, 
	Aaron Lewis <aaronlewis@google.com>, Kees Cook <kees@kernel.org>, 
	Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Because the selftest harness parses command-line parameters directly,
adding custom options to individual tests requires the test harness to
recognize them.

Add support to kselftest_harness.h for custom command-line options via
struct test_harness_cli_opts and test_harness_run_opts(), allowing tests
to register a custom getopt optstring, option handler, and optional help
callback while keeping test_harness_run() unchanged for existing callers.

Assert if the custom options string is problematic (e.g. conflicting
with built-in options or exceeding the buffer limit). This should only
happen when developing a test, and asserting makes the issue immediately
obvious to the developer.

Also update test_enabled() to match exact option characters rather than
tolower(opt) so custom options that differ only by case (such as 'R') do
not mistakenly match built-in single-case options like '-r'.

Signed-off-by: Aaron Lewis <aaronlewis@google.com>
---
 tools/testing/selftests/kselftest_harness.h | 127 +++++++++++++++-----
 1 file changed, 94 insertions(+), 33 deletions(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 29a19bc87084..562d4c0edac5 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -54,6 +54,7 @@
 #define _GNU_SOURCE
 #endif
 #include <asm/types.h>
+#include <assert.h>
 #include <ctype.h>
 #include <errno.h>
 #include <linux/unistd.h>
@@ -76,6 +77,18 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
 		memset(s, c, n);
 }
 
+/**
+ * struct test_harness_cli_opts - Custom command-line options for test harness
+ * @optstring: getopt option string; must not conflict with harness options.
+ * @handler: Callback to handle custom options; returns KSFT_PASS or KSFT_FAIL.
+ * @help: Optional callback to print custom option help text.
+ */
+struct test_harness_cli_opts {
+	const char *optstring;
+	int (*handler)(int opt, char *optarg);
+	void (*help)(void);
+};
+
 #define KSELFTEST_PRIO_TEST    20000
 #define KSELFTEST_PRIO_XFAIL   20001
 
@@ -1097,11 +1110,60 @@ static void test_harness_list_tests(void)
 	}
 }
 
-static int test_harness_argv_check(int argc, char **argv)
+#define OPTSTRING_LEN 128
+
+static void optstring_append_custom(char *optstring, size_t size,
+				    const struct test_harness_cli_opts *opts)
+{
+	const char *c;
+
+	if (!opts || !opts->optstring)
+		return;
+
+	assert(strlen(optstring) + strlen(opts->optstring) < size);
+
+	for (c = opts->optstring; *c; c++) {
+		if (isalnum(*c))
+			assert(!strchr(optstring, *c));
+	}
+
+	strncat(optstring, opts->optstring, size - strlen(optstring) - 1);
+}
+
+static void test_harness_usage(const char *prog,
+			       const struct test_harness_cli_opts *opts)
+{
+	fprintf(stderr,
+		"Usage: %s [-h|-l|-d] [-t|-T|-v|-V|-f|-F|-r name]\n"
+		"\t-h       print help\n"
+		"\t-l       list all tests\n"
+		"\t-d       enable debug prints\n"
+		"\n"
+		"\t-t name  include test\n"
+		"\t-T name  exclude test\n"
+		"\t-v name  include variant\n"
+		"\t-V name  exclude variant\n"
+		"\t-f name  include fixture\n"
+		"\t-F name  exclude fixture\n"
+		"\t-r name  run specified test\n"
+		"\n"
+		"Test filter options can be specified multiple times. The filtering stops\n"
+		"at the first match. For example to include all tests from variant 'bla'\n"
+		"but not test 'foo' specify '-T foo -v bla'.\n", prog);
+
+	if (opts && opts->help) {
+		fprintf(stderr, "\nCustom options:\n");
+		opts->help();
+	}
+}
+
+static int test_harness_argv_check(int argc, char **argv, const char *optstring,
+				   const struct test_harness_cli_opts *opts)
 {
 	int opt;
 
-	while ((opt = getopt(argc, argv, "dhlF:f:V:v:t:T:r:")) != -1) {
+	optind = 1;
+	while ((opt = getopt(argc, argv, optstring)) != -1) {
 		switch (opt) {
 		case 'f':
 		case 'F':
@@ -1118,35 +1180,21 @@ static int test_harness_argv_check(int argc, char **argv)
 			ksft_debug_enabled = true;
 			break;
 		case 'h':
+			test_harness_usage(argv[0], opts);
+			return KSFT_SKIP;
 		default:
-			fprintf(stderr,
-				"Usage: %s [-h|-l|-d] [-t|-T|-v|-V|-f|-F|-r name]\n"
-				"\t-h       print help\n"
-				"\t-l       list all tests\n"
-				"\t-d       enable debug prints\n"
-				"\n"
-				"\t-t name  include test\n"
-				"\t-T name  exclude test\n"
-				"\t-v name  include variant\n"
-				"\t-V name  exclude variant\n"
-				"\t-f name  include fixture\n"
-				"\t-F name  exclude fixture\n"
-				"\t-r name  run specified test\n"
-				"\n"
-				"Test filter options can be specified "
-				"multiple times. The filtering stops\n"
-				"at the first match. For example to "
-				"include all tests from variant 'bla'\n"
-				"but not test 'foo' specify '-T foo -v bla'.\n"
-				"", argv[0]);
-			return opt == 'h' ? KSFT_SKIP : KSFT_FAIL;
+			if (opts && opts->handler &&
+			    opts->handler(opt, optarg) == KSFT_PASS)
+				break;
+			test_harness_usage(argv[0], opts);
+			return KSFT_FAIL;
 		}
 	}
 
 	return KSFT_PASS;
 }
 
-static bool test_enabled(int argc, char **argv,
+static bool test_enabled(int argc, char **argv, const char *optstring,
 			 struct __fixture_metadata *f,
 			 struct __fixture_variant_metadata *v,
 			 struct __test_metadata *t)
@@ -1156,24 +1204,28 @@ static bool test_enabled(int argc, char **argv,
 	int opt;
 
 	optind = 1;
-	while ((opt = getopt(argc, argv, "dF:f:V:v:t:T:r:")) != -1) {
-		if (opt != 'd')
-			has_positive |= islower(opt);
-
-		switch (tolower(opt)) {
+	while ((opt = getopt(argc, argv, optstring)) != -1) {
+		switch (opt) {
 		case 't':
+		case 'T':
+			has_positive |= islower(opt);
 			if (!strcmp(t->name, optarg))
 				return islower(opt);
 			break;
 		case 'f':
+		case 'F':
+			has_positive |= islower(opt);
 			if (!strcmp(f->name, optarg))
 				return islower(opt);
 			break;
 		case 'v':
+		case 'V':
+			has_positive |= islower(opt);
 			if (!strcmp(v->name, optarg))
 				return islower(opt);
 			break;
 		case 'r':
+			has_positive = true;
 			if (!tlen) {
 				flen = strlen(f->name);
 				vlen = strlen(v->name);
@@ -1262,8 +1314,10 @@ static void __run_test(struct __fixture_metadata *f,
 			      diagnostic ? "%s" : NULL, diagnostic);
 }
 
-static int test_harness_run(int argc, char **argv)
+static int test_harness_run_opts(int argc, char **argv,
+				 const struct test_harness_cli_opts *opts)
 {
+	char optstring[OPTSTRING_LEN] = "dhlF:f:V:v:t:T:r:";
 	struct __fixture_variant_metadata no_variant = { .name = "", };
 	struct __fixture_variant_metadata *v;
 	struct __fixture_metadata *f;
@@ -1274,7 +1328,9 @@ static int test_harness_run(int argc, char **argv)
 	unsigned int count = 0;
 	unsigned int pass_count = 0;
 
-	ret = test_harness_argv_check(argc, argv);
+	optstring_append_custom(optstring, sizeof(optstring), opts);
+
+	ret = test_harness_argv_check(argc, argv, optstring, opts);
 	if (ret != KSFT_PASS)
 		return ret;
 
@@ -1283,7 +1339,7 @@ static int test_harness_run(int argc, char **argv)
 			unsigned int old_tests = test_count;
 
 			for (t = f->tests; t; t = t->next)
-				if (test_enabled(argc, argv, f, v, t))
+				if (test_enabled(argc, argv, optstring, f, v, t))
 					test_count++;
 
 			if (old_tests != test_count)
@@ -1301,7 +1357,7 @@ static int test_harness_run(int argc, char **argv)
 	for (f = __fixture_list; f; f = f->next) {
 		for (v = f->variant ?: &no_variant; v; v = v->next) {
 			for (t = f->tests; t; t = t->next) {
-				if (!test_enabled(argc, argv, f, v, t))
+				if (!test_enabled(argc, argv, optstring, f, v, t))
 					continue;
 				count++;
 				t->results = results;
@@ -1324,6 +1380,11 @@ static int test_harness_run(int argc, char **argv)
 	return KSFT_FAIL;
 }
 
+static inline int test_harness_run(int argc, char **argv)
+{
+	return test_harness_run_opts(argc, argv, NULL);
+}
+
 static void __attribute__((constructor(KSELFTEST_PRIO_TEST))) __constructor_order_first(void)
 {
 	__constructor_order_forward = true;
-- 
2.56.0.611.g1030f0b940-goog

