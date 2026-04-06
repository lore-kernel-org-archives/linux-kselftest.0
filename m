Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B98381AE1;
	Mon,  6 Apr 2026 14:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485217; cv=none; b=jW/xiKClEa2tJymqdKL5WPVkOcooMMiVt37ZswExmpuJsrkt6r0vK3k1cG22FCfli3lGe0q5iVd2Q0QvJrnoki6PKF9YVHHHFqQ4j4VcZf1a84MQBfNI5oE8VcLDlsHYkI2W3sBQCgiQ4Hc9LuDQWmKluDXrYwyLuHfbYAeCdO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485217; c=relaxed/simple;
	bh=uOk/wAXtSYozRkV6PC7dCLvIk2f3cksuzUZUEbVUqsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7+dF3UNVhlOWmRTaHdOiCVTP1PxYlgUNvYDNx+uHbXgX0GA7J/yNzZuoSssDL0CaszBsPkG6E69sTI/1T2PVtKuJoxpPWePjKGr61M51ENfdbnY0/6t3fsNsc4G8SH8/oRxMHlJH0J82WtEbgQPf6YKEGnmxhW4wX3L/BDfR5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DunkWWd2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DunkWWd2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8F9C4CEF7;
	Mon,  6 Apr 2026 14:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485217;
	bh=uOk/wAXtSYozRkV6PC7dCLvIk2f3cksuzUZUEbVUqsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DunkWWd2ts2IPlOOfFbg/CuY+qeprPXKT7cKrxJoIq0GnNayggZlB6z+6r1vEtJ0Y
	 i5K8GZwJctvEYhOSIetlR9m0/SK0js9RWFXgUnBNLKDqRKIMHPyInL3g/a6bWkCnYm
	 v4oVV/XjXOjMA+sxpbMZEJOac7tZGlu+3lE/yCFhEuDQ2IbQVQVUMXWD1y47HDW/Ip
	 n7fMBVKeEOJ0C/RVd3Qk5w5AzQjD/nQ3ANGDoVGnAaPAzWz/oqRXw++Dm1rvUKHUo+
	 T4SnPD9RHof37EjSqtiPVXVqhVrYXCpyWTEuVZZYlxsS3i8rFAiOGku7fQdOrsyIui
	 1dTsiErU0oEHA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nico Pache <npache@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 26/53] selftests/mm: hugepage_settings: add APIs for HugeTLB setup and teardown
Date: Mon,  6 Apr 2026 17:17:08 +0300
Message-ID: <20260406141735.2179309-27-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406141735.2179309-1-rppt@kernel.org>
References: <20260406141735.2179309-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

A lot of tests require free HugeTLB pages. Some need just a few default
huge pages, some need a certain amount of memory available as HugeTLB, and
some just skip lots of tests if huge pages of all supported sizes are not
available.

This all resulted in a huge mess in run_vmtests.sh that sets up some huge
pages, adjusts them later and restores some of the settings if the stars
align.

Add APIs that allow saving the state of HugeTLB and setting up the desired
amount of HugeTLB pages.

Saving the state also registers atexit() callback and signal handler that
will ensure restoration of HugeTLB state.

Since many tests use both HugeTLB and THP, the atexit() callbacks and
signal handler are restoring both.

For kselftest_harness tests that run fixture setups and test in child
processes add a constructor that will save and restore settings in the main
process.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 .../testing/selftests/mm/hugepage_settings.c  | 176 +++++++++++++++---
 .../testing/selftests/mm/hugepage_settings.h  |  30 ++-
 2 files changed, 181 insertions(+), 25 deletions(-)

diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
index 4ae7332b5e1b..3eef87e812ba 100644
--- a/tools/testing/selftests/mm/hugepage_settings.c
+++ b/tools/testing/selftests/mm/hugepage_settings.c
@@ -306,31 +306,12 @@ void thp_restore_settings(void)
 		thp_write_settings(&saved_settings);
 }
 
-static void thp_restore_settings_atexit(void)
+static void __thp_save_settings(void)
 {
-	thp_restore_settings();
-}
-
-static void thp_restore_settings_sighandler(int sig)
-{
-	/* exit() will invoke the thp_restore_settings_atexit handler. */
-	exit(KSFT_FAIL);
-}
+	if (!thp_available())
+		return;
 
-void thp_save_settings(void)
-{
 	thp_read_settings(&saved_settings);
-
-	/*
-	 * setup exit hooks to make sure THP settings are restored on graceful
-	 * and error exits and signals
-	 */
-	atexit(thp_restore_settings_atexit);
-	signal(SIGTERM, thp_restore_settings_sighandler);
-	signal(SIGINT, thp_restore_settings_sighandler);
-	signal(SIGHUP, thp_restore_settings_sighandler);
-	signal(SIGQUIT, thp_restore_settings_sighandler);
-
 	thp_settings_saved = true;
 }
 
@@ -399,11 +380,31 @@ bool thp_is_enabled(void)
 	return mode == 1 || mode == 3;
 }
 
+#define HUGETLB_MAX_NR_PAGESIZES 10
+struct hugetlb_settings {
+	unsigned long free_hugepages[HUGETLB_MAX_NR_PAGESIZES];
+	unsigned long nr_hugepages[HUGETLB_MAX_NR_PAGESIZES];
+	unsigned long sizes[HUGETLB_MAX_NR_PAGESIZES];
+	unsigned long default_size;
+	int nr_sizes;
+};
+
+static struct hugetlb_settings hugetlb_saved_settings;
+bool hugetlb_settings_saved;
+
 int detect_hugetlb_page_sizes(unsigned long sizes[], int max)
 {
-	DIR *dir = opendir("/sys/kernel/mm/hugepages/");
+	static struct hugetlb_settings *settings = &hugetlb_saved_settings;
+	DIR *dir;
 	int count = 0;
 
+	if (settings->nr_sizes) {
+		for (count = 0; count < settings->nr_sizes; count++)
+			sizes[count] = settings->sizes[count];
+		return settings->nr_sizes;
+	}
+
+	dir = opendir("/sys/kernel/mm/hugepages/");
 	if (!dir)
 		return 0;
 
@@ -427,11 +428,16 @@ int detect_hugetlb_page_sizes(unsigned long sizes[], int max)
 
 unsigned long default_huge_page_size(void)
 {
+	static struct hugetlb_settings *settings = &hugetlb_saved_settings;
 	unsigned long hps = 0;
 	char *line = NULL;
 	size_t linelen = 0;
-	FILE *f = fopen("/proc/meminfo", "r");
+	FILE *f;
+
+	if (settings->default_size)
+		return settings->default_size;
 
+	f = fopen("/proc/meminfo", "r");
 	if (!f)
 		return 0;
 	while (getline(&line, &linelen, f) > 0) {
@@ -479,3 +485,125 @@ unsigned long hugetlb_free_pages(unsigned long size)
 
 	return read_num(path);
 }
+
+bool hugetlb_setup_default(unsigned long nr)
+{
+	unsigned long size;
+
+	hugetlb_save_settings();
+
+	size = default_huge_page_size();
+	hugetlb_set_nr_pages(size, nr);
+
+	return hugetlb_free_pages(size) == nr;
+}
+
+unsigned long hugetlb_setup(unsigned long nr, unsigned long sizes[],
+			    int max)
+{
+	unsigned long enabled[10];
+	int nr_sizes = 0;
+	int nr_enabled;
+
+	nr_enabled = detect_hugetlb_page_sizes(enabled, ARRAY_SIZE(enabled));
+	if (!nr_enabled)
+		return 0;
+
+	if (nr_enabled > max) {
+		ksft_print_msg("detected %d huge page sizes, will only test %d\n", nr_enabled, max);
+		nr_enabled = max;
+	}
+
+	/* If HugeTLB is supported, request 2 HugeTLB pages of every size. */
+	for (int i = 0; i < nr_enabled; i++) {
+		hugetlb_set_nr_pages(enabled[i], nr);
+		if (hugetlb_free_pages(enabled[i]) < nr)
+			continue;
+
+		sizes[nr_sizes++] = enabled[i];
+	}
+
+	return nr_sizes;
+}
+
+static void __hugetlb_save_settings(void)
+{
+	struct hugetlb_settings *settings = &hugetlb_saved_settings;
+	int nr_sizes;
+
+	settings->default_size = default_huge_page_size();
+	if (!settings->default_size)
+		return;
+
+	nr_sizes = detect_hugetlb_page_sizes(settings->sizes,
+					     HUGETLB_MAX_NR_PAGESIZES);
+	if (!nr_sizes) {
+		settings->default_size = 0;
+		return;
+	}
+
+	for (int i = 0; i < nr_sizes; i++) {
+		unsigned long sz = settings->sizes[i];
+
+		if (!sz)
+			continue;
+
+		settings->free_hugepages[i] = hugetlb_free_pages(sz);
+		settings->nr_hugepages[i] = hugetlb_nr_pages(sz);
+	}
+
+	settings->nr_sizes = nr_sizes;
+	hugetlb_settings_saved = true;
+}
+
+void hugetlb_restore_settings(void)
+{
+	struct hugetlb_settings *settings = &hugetlb_saved_settings;
+
+	if (!hugetlb_settings_saved || !settings->default_size)
+		return;
+
+	for (int i = 0; i < HUGETLB_MAX_NR_PAGESIZES; i++) {
+		unsigned long sz = settings->sizes[i];
+
+		if (!sz)
+			continue;
+
+		hugetlb_set_nr_pages(sz, settings->nr_hugepages[i]);
+	}
+}
+
+static void hugepage_restore_settings_atexit(void)
+{
+	if (thp_settings_saved)
+		thp_restore_settings();
+	if (hugetlb_settings_saved)
+		hugetlb_restore_settings();
+}
+
+static void hugepage_restore_settings_sighandler(int sig)
+{
+	/* exit() will invoke the hugetlb_restore_settings_atexit handler. */
+	exit(KSFT_FAIL);
+}
+
+void hugepage_save_settings(bool thp, bool hugetlb)
+{
+	if (!thp && !hugetlb)
+		return;
+
+	if (thp)
+		__thp_save_settings();
+	if (hugetlb)
+		__hugetlb_save_settings();
+
+	/*
+	 * setup exit hooks to make sure THP settings are restored on graceful
+	 * and error exits and signals
+	 */
+	atexit(hugepage_restore_settings_atexit);
+	signal(SIGTERM, hugepage_restore_settings_sighandler);
+	signal(SIGINT, hugepage_restore_settings_sighandler);
+	signal(SIGHUP, hugepage_restore_settings_sighandler);
+	signal(SIGQUIT, hugepage_restore_settings_sighandler);
+}
diff --git a/tools/testing/selftests/mm/hugepage_settings.h b/tools/testing/selftests/mm/hugepage_settings.h
index 57fbf2f57e13..d6a1b4e5f734 100644
--- a/tools/testing/selftests/mm/hugepage_settings.h
+++ b/tools/testing/selftests/mm/hugepage_settings.h
@@ -6,6 +6,8 @@
 #include <stddef.h>
 #include <stdint.h>
 
+void hugepage_save_settings(bool thp, bool hugetlb);
+
 /* Transparent Huge Pages (THP) */
 
 enum thp_enabled {
@@ -79,7 +81,11 @@ struct thp_settings *thp_current_settings(void);
 void thp_push_settings(struct thp_settings *settings);
 void thp_pop_settings(void);
 void thp_restore_settings(void);
-void thp_save_settings(void);
+
+static inline void thp_save_settings(void)
+{
+	hugepage_save_settings(/* thp = */ true, /* hugetlb = */ false);
+}
 
 void thp_set_read_ahead_path(char *path);
 unsigned long thp_supported_orders(void);
@@ -97,6 +103,13 @@ unsigned long hugetlb_nr_pages(unsigned long size);
 void hugetlb_set_nr_pages(unsigned long size, unsigned long nr);
 unsigned long hugetlb_free_pages(unsigned long size);
 
+static inline void hugetlb_save_settings(void)
+{
+	hugepage_save_settings(/* thp = */ false, /* hugetlb = */ true);
+}
+
+void hugetlb_restore_settings(void);
+
 static inline unsigned long hugetlb_nr_default_pages(void)
 {
 	unsigned long size = default_huge_page_size();
@@ -127,4 +140,19 @@ static inline unsigned long hugetlb_free_default_pages(void)
 	return hugetlb_free_pages(size);
 }
 
+static inline bool hugetlb_available(void)
+{
+	return default_huge_page_size() != 0;
+}
+
+bool hugetlb_setup_default(unsigned long nr);
+unsigned long hugetlb_setup(unsigned long nr, unsigned long sizes[],
+			    int max);
+
+#define HUGETLB_SETUP_DEFAULT_PAGES(nr_pages) \
+static void __attribute__((constructor)) __hugetlb_setup_default(void)	\
+{									\
+	hugetlb_setup_default((nr_pages));				\
+}
+
 #endif /* __THP_SETTINGS_H__ */
-- 
2.53.0

