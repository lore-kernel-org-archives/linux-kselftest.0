Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CB34229C6
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 08:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128582; cv=none; b=AbPr9qJrZEF0Dsp3Q1f01OOPjQkzeFNOd6icW7GVds7qOqV8T7RzhAUPUn/Dygfq+cJ6xy7Zh2YsQcEiqW+ekqagQ6UXuNd9Nj1B7A65NvdH880sJgWtHiQ4sqessHaVZllqRXxrMu48l7ez6P2jnCbvY9qMx8NCv1aYxyWHTFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128582; c=relaxed/simple;
	bh=3UXWrQt3nPal1M5oiy154T5Gr08VLE54jxv0n6xnO+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pw0L9D//cYgoF3QLxbZOUlS1k6iX5kAGc4e6NEOgVY67eLvCqLUcyVkGueqfuNzOTNJ3Pk6/6IuMOSlwctuHSX0zR/vGAGzAhfd6riiSy5X95OvkrHIGXX6tcJQZq34m+AXTe/CXeGupTkAw2Wh6jjH65iLHShHC77J9SH6ad10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OANRdORJ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OANRdORJ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ceab75934dso8477015ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 01:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787128580; x=1787733380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NjK48y+gInVL/DFMKlcFgreu40jMGHPWay1upkkwKro=;
        b=OANRdORJEtwOwZBAlZjSKB3zK8qW6QKLbASy9A3Yd7FeiJESUIpG9OFKiz56I5Tr3S
         u8rYZESD1j4sgvfXUzBuPRnGGp8P7yeVald3svwZGEeZEw3TgqatckQb/sylxXKyOfHs
         Z5r7xL1byDE3ozBKzu5GzlSCb56x/3Wnixtoj0+P0rZ1szJD7eg21WFE0Gyz4slnPzMh
         90GBsnRQfw1TdzaZ0xPpxrKyf0YoypujGsXQqC7gjmF3MQ7+SFRYhsfG5lCKBbPaU5h4
         nNynvebsFHMlMxa9C2+/KedtFsCcKYHt4H7OPQCH83Fh++5uDG/sCwJ1o6Vg/nvA08r1
         0Dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787128580; x=1787733380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjK48y+gInVL/DFMKlcFgreu40jMGHPWay1upkkwKro=;
        b=XlA4aPRh8zT3lkp1Nj1i36w1uyoVbRgC6Z0ARQMPL8qEG6r+lT9JLBLw77Tc5Rf0qM
         2wfBA+91T6sjLY+YFO2XiDROprBaNCTgX1mRtZl8Mtol9dYQs1G4WC+/aE3Ov8mUX2S+
         aDgjscU8PcUQRexy8EMsvk6Ery0+KoQWu4tHgOnCeKLAaGVdxrJHG8Rrca5gI9Yf/gQR
         WY6lLOr/dPx0BV1pscD9weXzE2jfP6FgDV1dG+0cAdrgvwJFjhpLFdshr7FhaRS6PD0W
         LkzepJYUh98zXUIJPYg2TdKuvupZ+G9ZDTFP24qye3pa2DoNWFIVqwZeyv81uQbFrDJd
         ezeA==
X-Forwarded-Encrypted: i=1; AHgh+RrcLsnEFqPYaSqi+9koIK8jBJ18JdtzJ+O0Mt3XppqvkoduMcH3LmPjf8lvYnMx+JK3ivvTeiV7+2T5KHZl8R4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA0cQ8nIRoegh+WT9vnRSywKPWhCuzDTw+T8aBRo+LCyrEgSue
	FQ5eayBr1xo34R+6fx2LzBa9h2mGG95Yk2Kg7F5Ogrx6KYWTBSTSylxI
X-Gm-Gg: AR+sD108/tB5zhJOenUghDlH+btSfFYXMFX5iW283/X6Lh1fCe3bi5AdgHcIJlGeuYB
	zgvkf6d0Ldc+Qie2iaeAWXaeC3pqy0utr1dGFVFwCrSB9x+FIkRpiF9X3mBATDBhz3Wx4roZGqL
	YIhGtBWLnylcKve7N8aRlAi2D5lPLZT+0sbFGe2MPn0AA9rq+RZJ3FJdPYkimjo4/ilPKgUZX56
	+3mH0BMUsLETDrIWZcaXxfC8fkvIglhV0Hux1Fs6mJOQ7zvQV7nj18F5PDOZVuhPLoRejWHl7q0
	jw0jf7sOYra44GCCh4MXxlexEM28wQVyUcgchDAmQmBqa2+4nIqcWGYmGJYt77R0AOJyzX8BBMF
	Y7JzJocPxDTPWrHFg6k4fKVc9kPu9+dJ18tk49n+UNx44SGdDTnttkklxBNHRW+2Sh1dACrKQND
	yVaS3S85fKO0s3erG0QP9BiY8E97Kt27roPXf2GqXzd+/cPGAdVr5VDLvITKtO8kJSoP/lNjLds
	5x8UWFEc+I=
X-Received: by 2002:a17:903:2bce:b0:2d5:ccb7:12c3 with SMTP id d9443c01a7336-2d5fd59f837mr58430075ad.2.1787128579467;
        Wed, 19 Aug 2026 01:36:19 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf143775sm5089413eec.23.2026.08.19.01.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 01:36:19 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Koutny <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Guopeng Zhang <zhangguopeng@kylinos.cn>,
	Sebastian Chlad <sebastian.chlad@suse.com>,
	Waiman Long <longman@redhat.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Hemanth Selam <hemanth.selam@gmail.com>
Subject: [PATCH] selftests/cgroup: set the test plan after the setup checks
Date: Wed, 19 Aug 2026 14:06:00 +0530
Message-ID: <20260819083600.1351711-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cgroup tests announce their plan before checking whether cgroup v2 is
available, so on a host without it they promise a number of results and
then skip out after the first one:

	TAP version 13
	1..3
	ok 1 # SKIP cgroup v2 isn't mounted
	# Planned tests != run tests (3 != 1)
	# Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0

ksft_exit_skip() can only emit a well formed "1..0 # SKIP" line while no
plan has been printed, as the comment above it in kselftest.h points out.

Move ksft_set_plan() below the setup checks that can skip, so that a
skipped run reports:

	TAP version 13
	1..0 # SKIP cgroup v2 isn't mounted

Several of the tests skip more than once while setting up, for a missing
or unwritable controller as well, so the plan goes after the last of
them.  test_core joins its two setup paths at the post_v2_setup label and
sets the plan there.

Reporting each planned test as skipped instead would keep the plan where
it is, but the setup failures here mean the whole test cannot run rather
than its individual cases being skipped, which is what "1..0 # SKIP" is
for.

Fixes: 1dc830ee4c15 ("selftests/cgroup: conform test to KTAP format output")
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/cgroup/test_core.c       | 2 +-
 tools/testing/selftests/cgroup/test_cpu.c        | 2 +-
 tools/testing/selftests/cgroup/test_cpuset.c     | 2 +-
 tools/testing/selftests/cgroup/test_freezer.c    | 2 +-
 tools/testing/selftests/cgroup/test_kill.c       | 2 +-
 tools/testing/selftests/cgroup/test_kmem.c       | 2 +-
 tools/testing/selftests/cgroup/test_memcontrol.c | 2 +-
 tools/testing/selftests/cgroup/test_pids.c       | 2 +-
 tools/testing/selftests/cgroup/test_zswap.c      | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_core.c b/tools/testing/selftests/cgroup/test_core.c
index 88ca832d4fc1..64f4962a4659 100644
--- a/tools/testing/selftests/cgroup/test_core.c
+++ b/tools/testing/selftests/cgroup/test_core.c
@@ -927,7 +927,6 @@ int main(int argc, char *argv[])
 	int i;
 
 	ksft_print_header();
-	ksft_set_plan(ARRAY_SIZE(tests));
 	if (cg_find_unified_root(root, sizeof(root), &nsdelegate)) {
 		if (setup_named_v1_root(root, sizeof(root), CG_NAMED_NAME))
 			ksft_exit_skip("cgroup v2 isn't mounted and could not setup named v1 hierarchy\n");
@@ -940,6 +939,7 @@ int main(int argc, char *argv[])
 			ksft_exit_skip("Failed to set memory controller\n");
 
 post_v2_setup:
+	ksft_set_plan(ARRAY_SIZE(tests));
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		switch (tests[i].fn(root)) {
 		case KSFT_PASS:
diff --git a/tools/testing/selftests/cgroup/test_cpu.c b/tools/testing/selftests/cgroup/test_cpu.c
index 7a40d76b9548..8f96bfd19ab9 100644
--- a/tools/testing/selftests/cgroup/test_cpu.c
+++ b/tools/testing/selftests/cgroup/test_cpu.c
@@ -799,7 +799,6 @@ int main(int argc, char *argv[])
 	int i;
 
 	ksft_print_header();
-	ksft_set_plan(ARRAY_SIZE(tests));
 	if (cg_find_unified_root(root, sizeof(root), NULL))
 		ksft_exit_skip("cgroup v2 isn't mounted\n");
 
@@ -807,6 +806,7 @@ int main(int argc, char *argv[])
 		if (cg_write(root, "cgroup.subtree_control", "+cpu"))
 			ksft_exit_skip("Failed to set cpu controller\n");
 
+	ksft_set_plan(ARRAY_SIZE(tests));
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		switch (tests[i].fn(root)) {
 		case KSFT_PASS:
diff --git a/tools/testing/selftests/cgroup/test_cpuset.c b/tools/testing/selftests/cgroup/test_cpuset.c
index c5cf8b56ceb8..52ed8fba685a 100644
--- a/tools/testing/selftests/cgroup/test_cpuset.c
+++ b/tools/testing/selftests/cgroup/test_cpuset.c
@@ -250,7 +250,6 @@ int main(int argc, char *argv[])
 	int i;
 
 	ksft_print_header();
-	ksft_set_plan(ARRAY_SIZE(tests));
 	if (cg_find_unified_root(root, sizeof(root), NULL))
 		ksft_exit_skip("cgroup v2 isn't mounted\n");
 
@@ -258,6 +257,7 @@ int main(int argc, char *argv[])
 		if (cg_write(root, "cgroup.subtree_control", "+cpuset"))
 			ksft_exit_skip("Failed to set cpuset controller\n");
 
+	ksft_set_plan(ARRAY_SIZE(tests));
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		switch (tests[i].fn(root)) {
 		case KSFT_PASS:
diff --git a/tools/testing/selftests/cgroup/test_freezer.c b/tools/testing/selftests/cgroup/test_freezer.c
index 0569e93fa6b0..f28bb02e9783 100644
--- a/tools/testing/selftests/cgroup/test_freezer.c
+++ b/tools/testing/selftests/cgroup/test_freezer.c
@@ -1491,9 +1491,9 @@ int main(int argc, char *argv[])
 	int i;
 
 	ksft_print_header();
-	ksft_set_plan(ARRAY_SIZE(tests));
 	if (cg_find_unified_root(root, sizeof(root), NULL))
 		ksft_exit_skip("cgroup v2 isn't mounted\n");
+	ksft_set_plan(ARRAY_SIZE(tests));
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		switch (tests[i].fn(root)) {
 		case KSFT_PASS:
diff --git a/tools/testing/selftests/cgroup/test_kill.c b/tools/testing/selftests/cgroup/test_kill.c
index f6cd23a8ecc7..99cafd9dc013 100644
--- a/tools/testing/selftests/cgroup/test_kill.c
+++ b/tools/testing/selftests/cgroup/test_kill.c
@@ -278,9 +278,9 @@ int main(int argc, char *argv[])
 	int i;
 
 	ksft_print_header();
-	ksft_set_plan(ARRAY_SIZE(tests));
 	if (cg_find_unified_root(root, sizeof(root), NULL))
 		ksft_exit_skip("cgroup v2 isn't mounted\n");
+	ksft_set_plan(ARRAY_SIZE(tests));
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		switch (tests[i].fn(root)) {
 		case KSFT_PASS:
diff --git a/tools/testing/selftests/cgroup/test_kmem.c b/tools/testing/selftests/cgroup/test_kmem.c
index 1db0ba1226b9..cb47561b4b44 100644
--- a/tools/testing/selftests/cgroup/test_kmem.c
+++ b/tools/testing/selftests/cgroup/test_kmem.c
@@ -426,7 +426,6 @@ int main(int argc, char **argv)
 	int i;
 
 	ksft_print_header();
-	ksft_set_plan(ARRAY_SIZE(tests));
 	if (cg_find_unified_root(root, sizeof(root), NULL))
 		ksft_exit_skip("cgroup v2 isn't mounted\n");
 
@@ -441,6 +440,7 @@ int main(int argc, char **argv)
 		if (cg_write(root, "cgroup.subtree_control", "+memory"))
 			ksft_exit_skip("Failed to set memory controller\n");
 
+	ksft_set_plan(ARRAY_SIZE(tests));
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		switch (tests[i].fn(root)) {
 		case KSFT_PASS:
diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
index 0ebf796f3cff..3a84d068fbf3 100644
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@ -1798,7 +1798,6 @@ int main(int argc, char **argv)
 		page_size = BUF_SIZE;
 
 	ksft_print_header();
-	ksft_set_plan(ARRAY_SIZE(tests));
 	if (cg_find_unified_root(root, sizeof(root), NULL))
 		ksft_exit_skip("cgroup v2 isn't mounted\n");
 
@@ -1823,6 +1822,7 @@ int main(int argc, char **argv)
 		ksft_exit_skip("Failed to query cgroup mount option\n");
 	has_localevents = proc_status;
 
+	ksft_set_plan(ARRAY_SIZE(tests));
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		switch (tests[i].fn(root)) {
 		case KSFT_PASS:
diff --git a/tools/testing/selftests/cgroup/test_pids.c b/tools/testing/selftests/cgroup/test_pids.c
index 9a387c815d2c..710109b53dfe 100644
--- a/tools/testing/selftests/cgroup/test_pids.c
+++ b/tools/testing/selftests/cgroup/test_pids.c
@@ -148,7 +148,6 @@ int main(int argc, char **argv)
 	char root[PATH_MAX];
 
 	ksft_print_header();
-	ksft_set_plan(ARRAY_SIZE(tests));
 	if (cg_find_unified_root(root, sizeof(root), NULL))
 		ksft_exit_skip("cgroup v2 isn't mounted\n");
 
@@ -163,6 +162,7 @@ int main(int argc, char **argv)
 		if (cg_write(root, "cgroup.subtree_control", "+pids"))
 			ksft_exit_skip("Failed to set pids controller\n");
 
+	ksft_set_plan(ARRAY_SIZE(tests));
 	for (int i = 0; i < ARRAY_SIZE(tests); i++) {
 		switch (tests[i].fn(root)) {
 		case KSFT_PASS:
diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index 49b36ee79160..6e7b89315bbf 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -810,7 +810,6 @@ int main(int argc, char **argv)
 		page_size = BUF_SIZE;
 
 	ksft_print_header();
-	ksft_set_plan(ARRAY_SIZE(tests));
 	if (cg_find_unified_root(root, sizeof(root), NULL))
 		ksft_exit_skip("cgroup v2 isn't mounted\n");
 
@@ -827,6 +826,7 @@ int main(int argc, char **argv)
 		if (cg_write(root, "cgroup.subtree_control", "+memory"))
 			ksft_exit_skip("Failed to set memory controller\n");
 
+	ksft_set_plan(ARRAY_SIZE(tests));
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		switch (tests[i].fn(root)) {
 		case KSFT_PASS:
-- 
2.43.7

