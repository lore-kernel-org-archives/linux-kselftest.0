Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D45C46A5E5
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 16:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791561746; cv=none; b=RJywqMNhDUFp8Uiq4XUWY4BDeH0Htt5UQeRTK09pTgY1T4QTRTCrr9wAuZRSqMLv2n/N41XA2tDg7B0imbiKoyxilm95h/Qyo/yJcVl6F0H5eQo3s5gkrKbHGKWHoJEZVRWYbLCWjGHtzcqwqnuHrqEABsurvYBwQGGBOhMMxl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791561746; c=relaxed/simple;
	bh=2jNv7WlJmkHJXz2nspNd3pM9ZdTBRiPQhxwoyRpjBCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pj24B16KWi5GPauA2l09UU6KW+SAJz1fgBFJHankWfS2Wx9MQlWa4EHolJClJLORjOCYPg08FmJ/gVfo0vTV6H4p4pWxEpQP0CV81hvm6Jj9Ln3qLKH5+KP/Ia/8lkU8dp4PZma8sbXzdI6jv0eHlcrqZlnR39t0exS4fZFc/+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oEooaUO0; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oEooaUO0"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso2964240a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 09:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791561743; x=1792166543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klwXT5KO4G/mFuH2rpvA5zoaMm3s8XmiN5JQne2Xafw=;
        b=oEooaUO0nK7hfoix6DCajq9BAxETj9ZLbrPMloE6RhScG1oy88PTNoIQlxfXFjQsV9
         JjMbn6mr3fITj5ErezQQyvmr5uo/U7fTLGunw0L0pStG+/jT00l2pEk+0kdeqA5Yp6WF
         1ldu1gvPevKa98wOEoYwceuLx3WtyBsdsSVmPY6F7stLaHHdGfuovZS+vSTMDqXGhFZJ
         ibWAHZ3wwcG+Kcj9NNHgHMQwQcrUwJucqHxlJCqw54k8+M9bj2y1DIi3Nj6tnyYUEZQN
         fKrDj9GZR2Npb2RwVOjMkzew7CL28727IXbbUnaz1uXl4uF598VgBgdI6senIw84bBDj
         mrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791561743; x=1792166543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klwXT5KO4G/mFuH2rpvA5zoaMm3s8XmiN5JQne2Xafw=;
        b=nrE15WgggYdVNCWGJ6hCp4fTJxMQtFgmuT64F+ssrRw2Z4AqB7jRLZRRYQo3EuXWft
         vdNTLhT2JGnmsUHAGIfz8vZtmfvOn9GFhl48edI5XjhuhhBLkuCwKCFN8+HjfmtCM18W
         FUlhXQ5i1IR/gtkJxGNtiIdad5pccwxRYWc3b172DuxinghcLb5s4JT8AilSF4cJwe9u
         8/S0yYPwt9HcA39V3oofHQ7dj6M6PxT+IWa9TTn9bonxptnIZaoxOJV5RQ7VrzpPkrpv
         KnRuIw9wS9bm9WXDlSGNGuftHY0uzm7U7OsA1wjdaxKo2AwNvWsZb7qBvlJucJk6SxDj
         Q9MA==
X-Forwarded-Encrypted: i=1; AKwUvBxgQtSwaxdjsVprysIANUq4v5TMjtPkXHc2D7K9dxiER9zpQs9Dum7YME5kt8s1d/+DCtaAaox4vB50nvezKWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ+hOSMj7AmdH7dP0a+DX8Y4YHmeeXG49PARXxoXlHvda0WdK8
	pPvDEVylagK2Ek8rgZKgiAPw2khML26UtDzAhtU3ttJVxA9wEWJoMk8y
X-Gm-Gg: AYBFou1aQvje0vMdMd5YP1vB4JdyYvV1QxpP31hbzI4UsM5NBQwUiUIhNhs2jYlyrg/
	oneMr/RuhD8EF/E8On5InLU+HnEMDw062IjqN7xgJ0u4StU3oFfaw4H6O6YuaoHh37grzZmxVin
	tG/cD/wWRfjc3FZJFCuJehTGYId8ZJIHXAQWMW1rkbZPGDuKufiW1noDbmJbEAAjwfVIfIxbSAN
	BNcXxL96kgh6SZQsPApaj7LkxIQlH2jmpmmRVJxNoS6E23iGRKWlEJfyuXavwOCXLomR0gpF36T
	masLUxZ848WaKkr9VuCXP3xSvK1jWQRlJxHOUqxoMkUpffcZP4YVCO2419MkUAwtz4FNm6r8cSM
	5epa27L8vzQVi9/TXXKshKJpqHiKZX7WXjkctxBMmMreHOuQa/uktZxahrSlWx5EhvXz513ff7E
	ki2eTJHUMBOB9o3yRhwUL/N33q9eOXJf3YLfP2cFnTfycJl8vu9vZ/4ASDmluFsF5mx4Aj6ZxF4
	pMLJXj/i66lJimw+SbxUTA81Er1AJ8=
X-Received: by 2002:a17:903:98f:b0:2dd:c100:a5da with SMTP id d9443c01a7336-2e842ce8e5amr19233695ad.46.1791561742241;
        Fri, 09 Oct 2026 09:02:22 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cb6sm12333235ad.60.2026.10.09.09.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:02:21 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org
Cc: sj@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	akpm@linux-foundation.org,
	lianux.mm@gmail.com,
	kunwu.chan@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 5/5] selftests/perf_events: add AUX kernel API selftest script
Date: Fri,  9 Oct 2026 23:59:52 +0800
Message-ID: <20261009160010.1829642-6-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009160010.1829642-1-kunwu.chan@gmail.com>
References: <20261009160010.1829642-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a shell script that runs the perf_aux_kernel KUnit suite through
debugfs, builds and runs the userspace regression program, and
performs static-analysis checks on the source tree (memory barriers,
refcount types, boundary validation, EXPORT_SYMBOL_GPL coverage).

When an AUX-capable PMU is present, the script also runs a live
perf record and checks dmesg for errors.

The script works both in-tree and from an installed selftest location:
the source-level static checks are SKIPped when no kernel source tree
is found instead of failing, the installed userspace binary is run
as-is when its source is absent, and runtime rebuilds honour $CC
instead of hardcoding gcc.  Results go to a mktemp(1)-created
directory rather than a predictable PID-suffixed path
(a symlink-overwrite hazard when run as root).

Usage:  sudo ./aux_kernel.sh [--pmu arm_spe_0]

Co-developed-by: Lian Wang (Processmission) <lianux.mm@gmail.com>
Signed-off-by: Lian Wang (Processmission) <lianux.mm@gmail.com>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 tools/testing/selftests/perf_events/Makefile  |   1 +
 .../selftests/perf_events/aux_kernel.sh       | 635 ++++++++++++++++++
 2 files changed, 636 insertions(+)
 create mode 100755 tools/testing/selftests/perf_events/aux_kernel.sh

diff --git a/tools/testing/selftests/perf_events/Makefile b/tools/testing/selftests/perf_events/Makefile
index fbafbd43f097..9b82c7ee1238 100644
--- a/tools/testing/selftests/perf_events/Makefile
+++ b/tools/testing/selftests/perf_events/Makefile
@@ -4,4 +4,5 @@ LDFLAGS += -lpthread
 
 TEST_GEN_PROGS := sigtrap_threads remove_on_exec watermark_signal mmap
 TEST_GEN_PROGS += aux_kernel_usermode
+TEST_PROGS += aux_kernel.sh
 include ../lib.mk
diff --git a/tools/testing/selftests/perf_events/aux_kernel.sh b/tools/testing/selftests/perf_events/aux_kernel.sh
new file mode 100755
index 000000000000..af7f2e8d5d09
--- /dev/null
+++ b/tools/testing/selftests/perf_events/aux_kernel.sh
@@ -0,0 +1,635 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Perf AUX Kernel-Consumer API - Comprehensive Selftest
+#
+# Validates the perf-core AUX kernel-consumer API added by the
+# perf_aux_support patch series:
+#   - perf_event_setup_aux() / perf_event_release_aux()
+#   - perf_event_aux_head() / perf_event_aux_tail_set() / perf_event_aux_copy()
+#
+# Test layers:
+#   1. Build-time checks (Kconfig, Makefile, symbol exports, source)
+#   2. KUnit suite (API contract: error paths, lifecycle, validation)
+#   3. Userspace AUX regression (mmap AUX still works, aux_mmap_count
+#      independent, userspace+kernel coexistence)
+#   4. Hardware AUX live test (if ARM SPE or Intel PT is available)
+#   5. DAMON integration verification
+#   6. Memory ordering/barrier static analysis
+#   7. Boundary validation static analysis
+#   8. Concurrency safety checks
+#   9. User/kernel AUX isolation checks
+#
+# Usage:  sudo ./aux_kernel.sh [--pmu arm_spe_0|intel_pt]
+#
+# The script also works from an installed selftest location (make
+# install): when no kernel source tree is found, the source-level
+# static checks (sections 1 partial, 6-9) are SKIPped rather than
+# failed, and the prebuilt aux_kernel_usermode binary is used as-is.
+# Source-only rebuilds honour $CC (and $CROSS_COMPILE) instead of
+# hardcoding gcc.
+#
+# Requirements:
+#   - CONFIG_PERF_EVENTS=y
+#   - CONFIG_PERF_AUX_KERNEL_KUNIT_TEST=y and CONFIG_KUNIT_DEBUGFS=y
+#   - Root privileges for most sections
+
+set -e
+PASSED=0; FAILED=0; SKIPPED=0
+pass() { echo "  [PASS] $*"; PASSED=$((PASSED + 1)); }
+fail() { echo "  [FAIL] $1"; FAILED=$((FAILED + 1)); }
+skip() { echo "  [SKIP] $*"; SKIPPED=$((SKIPPED + 1)); }
+
+# mktemp(1) creates an unpredictable, collision-free directory, so a
+# local user cannot pre-create a symlink at the expected path and have
+# this (possibly root-run) script overwrite a file of their choosing.
+RESULTS_DIR=$(mktemp -d /tmp/perf_aux_kernel_test.XXXXXX)
+exec > >(tee "$RESULTS_DIR/output.log") 2>&1
+
+SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
+ROOT="$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel 2>/dev/null || true)"
+
+if [[ -n "$ROOT" && -f "$ROOT/kernel/events/core.c" ]]; then
+	HAVE_SRC=1
+else
+	HAVE_SRC=0
+	ROOT=""
+fi
+
+# Compiler for the runtime rebuild of the userspace program; the
+# kselftest build system exports CC (with CROSS_COMPILE prefixed).
+CC="${CC:-gcc}"
+
+PMU_ARG="${1:-}"
+if [[ "$PMU_ARG" == "--pmu" ]]; then
+	PMU_NAME="${2:-arm_spe_0}"
+elif [[ -n "$PMU_ARG" ]]; then
+	PMU_NAME="$PMU_ARG"
+else
+	PMU_NAME="arm_spe_0"
+fi
+
+echo "=========================================="
+echo " Perf AUX Kernel-Consumer API Test"
+echo "=========================================="
+echo "Kernel tree:  $ROOT"
+echo "Results dir:  $RESULTS_DIR"
+echo "Target PMU:   $PMU_NAME"
+echo "Script dir:   $SCRIPT_DIR"
+echo ""
+
+# ---- Section 1: Build-time checks ----
+echo "--- 1. Build-time Configuration ---"
+
+# Check that the KUnit test is built
+KUNIT_SUITE="/sys/kernel/debug/kunit/perf_aux_kernel"
+if [[ -d "$KUNIT_SUITE" ]]; then
+	pass "KUnit suite 'perf_aux_kernel' is registered"
+else
+	skip "KUnit suite 'perf_aux_kernel' not registered" \
+		"(CONFIG_PERF_AUX_KERNEL_KUNIT_TEST not set)"
+fi
+
+# Check that required symbols are exported
+SYMBOLS_FILE="/proc/kallsyms"
+if [[ -r "$SYMBOLS_FILE" ]]; then
+	for sym in perf_event_setup_aux perf_event_release_aux \
+		perf_event_aux_head perf_event_aux_tail_set perf_event_aux_copy; do
+		if grep -q "$sym" "$SYMBOLS_FILE" 2>/dev/null; then
+			pass "Symbol exported: $sym"
+		else
+			fail "Symbol not exported: $sym (patch not applied?)"
+		fi
+	done
+else
+	skip "Symbol check" "/proc/kallsyms not readable"
+fi
+
+# Check that the source files exist (in-tree runs only; installed
+# environments have no kernel source, which is a skip, not a failure)
+SRC_EVENTS="$ROOT/kernel/events"
+if [[ "$HAVE_SRC" -eq 1 ]]; then
+	for f in core.c ring_buffer.c internal.h; do
+		if [[ -f "$SRC_EVENTS/$f" ]]; then
+			pass "Source file: kernel/events/$f"
+		else
+			fail "Source file: kernel/events/$f missing"
+		fi
+	done
+
+	# Check that the KUnit test source exists
+	if [[ -f "$SRC_EVENTS/aux_kernel_test.c" ]]; then
+		pass "Source file: kernel/events/aux_kernel_test.c"
+	else
+		skip "Source file: kernel/events/aux_kernel_test.c not found"
+	fi
+else
+	skip "Source tree" "kernel source not available (installed run)"
+fi
+
+# Check that aux_kernel_count is in internal.h
+if [[ "$HAVE_SRC" -eq 1 ]] && grep -q 'aux_kernel_count' "$SRC_EVENTS/internal.h" 2>/dev/null; then
+	pass "struct perf_buffer: aux_kernel_count field present"
+elif [[ "$HAVE_SRC" -eq 1 ]]; then
+	fail "struct perf_buffer: aux_kernel_count field missing"
+fi
+
+# Check that aux_kernel_count is used in perf_aux_output_begin()
+if [[ "$HAVE_SRC" -eq 1 ]]; then
+	if grep -q 'aux_kernel_count' "$SRC_EVENTS/ring_buffer.c" 2>/dev/null; then
+		pass "ring_buffer.c: aux_kernel_count guard in perf_aux_output_begin()"
+	else
+		fail "ring_buffer.c: aux_kernel_count guard missing in perf_aux_output_begin()"
+	fi
+fi
+
+# Check that the new API functions are in core.c / ring_buffer.c
+if [[ "$HAVE_SRC" -eq 1 ]]; then
+	for func in perf_event_setup_aux perf_event_release_aux; do
+		if grep -q "int $func\|void $func" "$SRC_EVENTS/core.c" 2>/dev/null; then
+			pass "core.c: $func() defined"
+		else
+			fail "core.c: $func() not found"
+		fi
+	done
+	for func in perf_event_aux_head perf_event_aux_tail_set perf_event_aux_copy; do
+		if grep -q "$func" "$SRC_EVENTS/ring_buffer.c" 2>/dev/null; then
+			pass "ring_buffer.c: $func() defined"
+		else
+			fail "ring_buffer.c: $func() not found"
+		fi
+	done
+fi
+
+# Check that EXPORT_SYMBOL_GPL is present
+if [[ "$HAVE_SRC" -eq 1 ]]; then
+	for func in perf_event_setup_aux perf_event_release_aux \
+		perf_event_aux_head perf_event_aux_tail_set perf_event_aux_copy; do
+		if grep -q "EXPORT_SYMBOL_GPL($func)" "$SRC_EVENTS/core.c" \
+			"$SRC_EVENTS/ring_buffer.c" 2>/dev/null; then
+			pass "EXPORT_SYMBOL_GPL: $func"
+		else
+			fail "EXPORT_SYMBOL_GPL: $func not found"
+		fi
+	done
+fi
+
+# ---- Section 2: KUnit API contract tests ----
+echo ""
+echo "--- 2. KUnit API Contract Tests ---"
+
+KUNIT_DIR="/sys/kernel/debug/kunit/perf_aux_kernel"
+if [[ -d "$KUNIT_DIR" ]]; then
+	if [[ -f "$KUNIT_DIR/run" ]]; then
+		echo run > "$KUNIT_DIR/run" 2>/dev/null || true
+	fi
+	RES="$KUNIT_DIR/results"
+	if [[ -f "$RES" ]]; then
+		cp "$RES" "$RESULTS_DIR/kunit-results.log"
+
+		if grep -Eq "^[[:space:]]*not ok" "$RES"; then
+			fail "KUnit API contract suite has failing cases"
+			grep -E "^[[:space:]]*not ok" "$RES" | sed 's/^/    /'
+		elif grep -Eq "^[[:space:]]*ok " "$RES"; then
+			pass "KUnit API contract suite: all cases pass"
+		else
+			fail "KUnit API contract suite produced no completed cases"
+		fi
+		echo "    $(grep '# Totals:' "$RES" | tail -1)"
+
+		# Spot-check all 39 test cases (deterministic, dummy PMU)
+		for c in "test_setup_rejects_non_power_of_two" \
+			"test_setup_accepts_power_of_two" \
+			"test_setup_rejects_double" \
+			"test_setup_parent_event_rejected" \
+			"test_setup_rejects_negative_watermark" \
+			"test_setup_with_explicit_watermark" \
+			"test_writer_admitted_after_setup" \
+			"test_writer_blocked_after_release" \
+			"test_release_noop_without_rb" \
+			"test_setup_release_roundtrip" \
+			"test_multi_setup_release_cycle" \
+			"test_double_release_clean" \
+			"test_two_events_independent" \
+			"test_release_one_does_not_affect_other" \
+			"test_user_kernel_coexistence" \
+			"test_concurrent_release" \
+			"test_head_initial_zero" \
+			"test_head_advances_after_produce" \
+			"test_head_no_rb_zero" \
+			"test_copy_full_window" \
+			"test_copy_wrap" \
+			"test_copy_zero_len" \
+			"test_copy_data_correctness" \
+			"test_copy_rejects_rewound" \
+			"test_copy_rejects_future" \
+			"test_copy_rejects_oversized" \
+			"test_copy_rejects_null_buf" \
+			"test_copy_rejects_already_consumed" \
+			"test_copy_no_rb_enoent" \
+			"test_tail_set_valid_frees_space" \
+			"test_tail_set_rejects_future" \
+			"test_tail_set_accepts_within_ring_window" \
+			"test_tail_set_rejects_behind_ring" \
+			"test_tail_set_noop" \
+			"test_tail_set_consume_all" \
+			"test_tail_set_no_rb_enoent" \
+			"test_multi_produce_copy_cycle" \
+			"test_output_end_zero_size" \
+			"test_buffer_full_stops_producer"; do
+			if grep -Eq "^[[:space:]]*ok .*$c" "$RES"; then
+				pass "KUnit case: $c"
+			else
+				fail "KUnit case: $c"
+			fi
+		done
+	else
+		skip "KUnit results" "no results file (suite did not run)"
+	fi
+else
+	skip "KUnit API contract" "CONFIG_PERF_AUX_KERNEL_KUNIT_TEST" \
+		"or CONFIG_KUNIT_DEBUGFS missing"
+fi
+
+# ---- Section 3: Userspace AUX regression (C program) ----
+echo ""
+echo "--- 3. Userspace AUX Regression (api-level) ---"
+
+# Run the C regression test program.
+#
+# Prefer an existing (installed or prebuilt) binary; make install
+# installs TEST_GEN_PROGS binaries but not their sources, so requiring
+# the source would skip the test exactly in CI pipelines that install
+# selftests.  Rebuild only in-tree, when the source is newer than the
+# binary or the binary is missing, and honour $CC then.
+UMODE_SRC="$SCRIPT_DIR/aux_kernel_usermode.c"
+UMODE_BIN="$SCRIPT_DIR/aux_kernel_usermode"
+
+if [[ -x "$UMODE_BIN" && ( ! -f "$UMODE_SRC" || ! "$UMODE_SRC" -nt "$UMODE_BIN" ) ]]; then
+	:
+elif [[ -f "$UMODE_SRC" ]]; then
+	echo "  Building aux_kernel_usermode with ${CC}..."
+	if "$CC" -o "$UMODE_BIN" "$UMODE_SRC" -Wall -Wextra -O2; then
+		:
+	else
+		echo "  $CC build failed"
+		UMODE_BIN=""
+	fi
+else
+	UMODE_BIN=""
+fi
+
+if [[ -n "$UMODE_BIN" && -x "$UMODE_BIN" ]]; then
+	"$UMODE_BIN" "$PMU_NAME" 2>&1 | tee "$RESULTS_DIR/usermode.log"
+	UMODE_RET=${PIPESTATUS[0]}
+
+	UMODE_PASS=$(grep -c '\[PASS\]' "$RESULTS_DIR/usermode.log" || true)
+	UMODE_FAIL=$(grep -c '\[FAIL\]' "$RESULTS_DIR/usermode.log" || true)
+	UMODE_SKIP=$(grep -c '\[SKIP\]' "$RESULTS_DIR/usermode.log" || true)
+
+	if [[ "$UMODE_RET" -ne 0 ]]; then
+		fail "Userspace API regression: C program failed"
+	else
+		pass "Userspace API regression: $UMODE_PASS passed, $UMODE_FAIL failed,"
+			" $UMODE_SKIP skipped"
+		if [[ "$UMODE_FAIL" -gt 0 ]]; then
+			fail "Userspace API regression: $UMODE_FAIL failures"
+		fi
+	fi
+else
+	skip "Userspace API regression" "binary or source not available"
+fi
+
+# Check that aux_mmap_count refcount is not affected by aux_kernel_count
+# (static analysis: verify the two refcounts are separate in internal.h)
+if [[ "$HAVE_SRC" -eq 1 ]]; then
+	if grep -q 'aux_mmap_count' "$SRC_EVENTS/internal.h" 2>/dev/null && \
+	   grep -q 'aux_kernel_count' "$SRC_EVENTS/internal.h" 2>/dev/null; then
+		pass "Refcount separation: aux_mmap_count and aux_kernel_count are distinct"
+	else
+		fail "Refcount separation: aux_mmap_count or aux_kernel_count missing"
+	fi
+fi
+
+# ---- Section 4: Hardware AUX live test ----
+echo ""
+echo "--- 4. Hardware AUX Live Test ---"
+
+PMU_DIR="/sys/bus/event_source/devices/$PMU_NAME"
+PERF_BIN=$(which perf 2>/dev/null || true)
+if [[ -d "$PMU_DIR" ]]; then
+	PMU_TYPE=$(cat "$PMU_DIR/type" 2>/dev/null || true)
+	if [[ -n "$PMU_TYPE" ]]; then
+		pass "AUX PMU $PMU_NAME present (type=$PMU_TYPE)"
+
+		if [[ -f "$PMU_DIR/caps/aux_output" ]]; then
+			pass "PMU $PMU_NAME: aux_output capability present"
+		else
+			skip "PMU $PMU_NAME: aux_output capability not found"
+		fi
+
+		if [[ -n "$PERF_BIN" ]]; then
+			DMESG_BEFORE=$(dmesg 2>/dev/null | wc -l)
+			# Intel PT is a tracing PMU that does not accept
+			# a sampling period; use a bare event specification.
+			if [[ "$PMU_NAME" == intel_pt ]]; then
+				PERF_EVENT="$PMU_NAME//"
+			else
+				PERF_EVENT="$PMU_NAME/period=100000/"
+			fi
+			if "$PERF_BIN" record -e "$PERF_EVENT" \
+				-o "$RESULTS_DIR/perf_hw.data" -- sleep 0.5 2>/dev/null; then
+				pass "Hardware AUX: perf record with $PMU_NAME succeeded"
+			else
+				fail "Hardware AUX: perf record with $PMU_NAME failed"
+			fi
+
+			DMESG_AFTER="$RESULTS_DIR/dmesg-hardware.log"
+			dmesg 2>/dev/null > "$DMESG_AFTER" || true
+			DMESG_LINES_AFTER=$(wc -l < "$DMESG_AFTER")
+			if [[ "$DMESG_LINES_AFTER" -ge "$DMESG_BEFORE" ]]; then
+				NEW_DMESG=$(tail -n "+$((DMESG_BEFORE + 1))" "$DMESG_AFTER")
+			else
+				NEW_DMESG=$(cat "$DMESG_AFTER")
+			fi
+			FAIL_LINES=$(printf '%s\n' "$NEW_DMESG" | \
+				grep -Ei "perf.*(fail|warn|error).*aux|"\
+"WARNING:|BUG:|Oops:|lockdep" || true)
+			if [[ -n "$FAIL_LINES" ]]; then
+				fail "dmesg: errors during hardware AUX test"
+				echo "$FAIL_LINES" | sed 's/^/    /'
+			else
+				pass "dmesg: clean during hardware AUX test"
+			fi
+		fi
+	else
+		skip "Hardware AUX" "PMU type not readable"
+	fi
+else
+	skip "Hardware AUX" "PMU $PMU_NAME not available"
+fi
+
+# ---- Section 5: DAMON integration check ----
+echo ""
+echo "--- 5. DAMON Integration Verification ---"
+
+DAMON_ADMIN="/sys/kernel/mm/damon/admin"
+if [[ -d "$DAMON_ADMIN" ]]; then
+	pass "DAMON sysfs interface available"
+
+	if [[ -d "$DAMON_ADMIN/kdamonds/0/contexts/0/monitoring_attrs/sample/perf_events" ]] || \
+	   [[ -d "/sys/kernel/debug/damon/perf_stats" ]]; then
+		pass "DAMON perf observe infrastructure detected"
+	else
+		skip "DAMON perf observe" "debugfs or sysfs interface not available"
+	fi
+
+	DAMON_TEST_DIR="$ROOT/tools/testing/selftests/damon"
+	if [[ -d "$DAMON_TEST_DIR" ]]; then
+		pass "DAMON selftest directory present"
+	else
+		skip "DAMON selftest directory" "not found at $DAMON_TEST_DIR"
+	fi
+else
+	skip "DAMON integration" "DAMON admin interface not available"
+fi
+
+# ---- Section 6: Memory ordering and concurrency checks ----
+echo ""
+echo "--- 6. Memory Ordering & Concurrency ---"
+
+if [[ "$HAVE_SRC" -ne 1 ]]; then
+	skip "Memory ordering checks" "kernel source not available (installed run)"
+else
+
+# Verify smp_rmb() in perf_event_aux_head()
+if grep -q 'smp_rmb' "$SRC_EVENTS/ring_buffer.c" 2>/dev/null; then
+	pass "perf_event_aux_head(): smp_rmb() barrier present"
+else
+	fail "perf_event_aux_head(): smp_rmb() barrier missing"
+fi
+
+# Verify smp_mb() in perf_event_aux_tail_set()
+if grep -A30 'perf_event_aux_tail_set' "$SRC_EVENTS/ring_buffer.c" 2>/dev/null | \
+	grep -q 'smp_mb'; then
+	pass "perf_event_aux_tail_set(): smp_mb() barrier present"
+else
+	fail "perf_event_aux_tail_set(): smp_mb() barrier missing"
+fi
+
+# Verify aux_refcount protection in perf_event_aux_copy()
+if grep -A80 'perf_event_aux_copy' "$SRC_EVENTS/ring_buffer.c" 2>/dev/null | \
+	grep -q 'aux_refcount'; then
+	pass "perf_event_aux_copy(): aux_refcount protection present"
+else
+	fail "perf_event_aux_copy(): aux_refcount protection missing"
+fi
+
+# Verify mmap_mutex serialization in setup/release
+if grep -A30 'perf_event_setup_aux' "$SRC_EVENTS/core.c" 2>/dev/null | \
+	grep -q 'mmap_mutex'; then
+	pass "perf_event_setup_aux(): mmap_mutex serialization present"
+else
+	fail "perf_event_setup_aux(): mmap_mutex serialization missing"
+fi
+if grep -A30 'perf_event_release_aux' "$SRC_EVENTS/core.c" 2>/dev/null | \
+	grep -q 'mmap_mutex'; then
+	pass "perf_event_release_aux(): mmap_mutex serialization present"
+else
+	fail "perf_event_release_aux(): mmap_mutex serialization missing"
+fi
+
+# Verify aux_mutex protection in release
+if grep -A60 'perf_event_release_aux' "$SRC_EVENTS/core.c" 2>/dev/null | \
+	grep -q 'aux_mutex'; then
+	pass "perf_event_release_aux(): aux_mutex protection present"
+else
+	fail "perf_event_release_aux(): aux_mutex protection missing"
+fi
+
+fi
+
+# ---- Section 7: Boundary validation checks ----
+echo ""
+echo "--- 7. API Contract: Boundary Validation ---"
+
+if [[ "$HAVE_SRC" -ne 1 ]]; then
+	skip "Boundary validation checks" "kernel source not available (installed run)"
+else
+
+# perf_event_setup_aux() rejects non-power-of-2
+if grep -q 'is_power_of_2' "$SRC_EVENTS/core.c" 2>/dev/null; then
+	pass "perf_event_setup_aux(): is_power_of_2() check present"
+else
+	fail "perf_event_setup_aux(): is_power_of_2() check missing"
+fi
+
+# perf_event_setup_aux() checks is_kernel_event()
+if grep -q 'is_kernel_event' "$SRC_EVENTS/core.c" 2>/dev/null; then
+	pass "perf_event_setup_aux(): is_kernel_event() check present"
+else
+	fail "perf_event_setup_aux(): is_kernel_event() check missing"
+fi
+
+# perf_event_setup_aux() checks event->parent
+if grep -A20 'perf_event_setup_aux' "$SRC_EVENTS/core.c" 2>/dev/null | \
+	grep -q 'event->parent'; then
+	pass "perf_event_setup_aux(): event->parent check present"
+else
+	fail "perf_event_setup_aux(): event->parent check missing"
+fi
+
+# perf_event_aux_copy() validates window size
+if grep -A80 'perf_event_aux_copy' "$SRC_EVENTS/ring_buffer.c" 2>/dev/null | \
+	grep -q 'available.*aux_size'; then
+	pass "perf_event_aux_copy(): window bounds check present"
+else
+	fail "perf_event_aux_copy(): window bounds check missing"
+fi
+
+# rb_has_kernel_aux() helper
+if grep -q 'rb_has_kernel_aux' "$SRC_EVENTS/ring_buffer.c" 2>/dev/null; then
+	pass "ring_buffer.c: rb_has_kernel_aux() helper defined"
+else
+	fail "ring_buffer.c: rb_has_kernel_aux() helper missing"
+fi
+
+# perf_event_aux_tail_set() validates advance <= head - old_tail
+if grep -A20 'perf_event_aux_tail_set' "$SRC_EVENTS/ring_buffer.c" 2>/dev/null | \
+	grep -q 'advance.*head.*old_tail'; then
+	pass "perf_event_aux_tail_set(): advance bounds check present"
+else
+	fail "perf_event_aux_tail_set(): advance bounds check missing"
+fi
+
+# perf_event_aux_copy() validates from/to in [tail, head]
+if grep -A80 'perf_event_aux_copy' "$SRC_EVENTS/ring_buffer.c" 2>/dev/null | \
+	grep -q 'start.*available\|len.*available.*start'; then
+	pass "perf_event_aux_copy(): from/to bounds check present"
+else
+	fail "perf_event_aux_copy(): from/to bounds check missing"
+fi
+
+fi
+
+# ---- Section 8: Concurrency safety checks ----
+echo ""
+echo "--- 8. Concurrency Safety ---"
+
+if [[ "$HAVE_SRC" -ne 1 ]]; then
+	skip "Concurrency safety checks" "kernel source not available (installed run)"
+else
+
+# Check that aux_kernel_count uses refcount_t (atomic)
+if grep -q 'refcount_t.*aux_kernel_count' "$SRC_EVENTS/internal.h" 2>/dev/null; then
+	pass "aux_kernel_count: refcount_t (atomic) type"
+else
+	fail "aux_kernel_count: not refcount_t"
+fi
+
+# Check that release drops the kernel-owner refcount under mmap_mutex
+# (serialising concurrent perf_event_release_aux() callers)
+if grep -A60 'perf_event_release_aux' "$SRC_EVENTS/core.c" 2>/dev/null | \
+	grep -q 'refcount_dec_and_test(&rb->aux_kernel_count)'; then
+	pass "aux_kernel_count: owner refcount dropped in release"
+else
+	fail "aux_kernel_count: owner refcount not dropped in release"
+fi
+
+# Check that aux_refcount is incremented in copy
+if grep -A80 'perf_event_aux_copy' "$SRC_EVENTS/ring_buffer.c" 2>/dev/null | \
+	grep -q 'refcount_inc_not_zero.*aux_refcount'; then
+	pass "perf_event_aux_copy(): aux_refcount_inc_not_zero() present"
+else
+	fail "perf_event_aux_copy(): aux_refcount_inc_not_zero() missing"
+fi
+
+# Check that rb_free_aux is called at end of copy (release refcount)
+if grep -A80 'perf_event_aux_copy' "$SRC_EVENTS/ring_buffer.c" 2>/dev/null | \
+	grep -q 'rb_free_aux'; then
+	pass "perf_event_aux_copy(): rb_free_aux() at exit (balanced refcount)"
+else
+	fail "perf_event_aux_copy(): rb_free_aux() missing at exit"
+fi
+
+# Check that is_kernel_event guard is on both setup and release
+if grep -A20 'perf_event_setup_aux' "$SRC_EVENTS/core.c" 2>/dev/null | \
+	grep -q 'is_kernel_event'; then
+	pass "setup side: is_kernel_event() guard present"
+else
+	fail "setup side: is_kernel_event() guard missing"
+fi
+if grep -A20 'perf_event_release_aux' "$SRC_EVENTS/core.c" 2>/dev/null | \
+	grep -q 'is_kernel_event'; then
+	pass "release side: is_kernel_event() guard present"
+else
+	fail "release side: is_kernel_event() guard missing"
+fi
+
+# Check that event->parent guard is on both setup and release
+if grep -A20 'perf_event_setup_aux' "$SRC_EVENTS/core.c" 2>/dev/null | \
+	grep -q 'event->parent'; then
+	pass "setup side: event->parent guard present"
+else
+	fail "setup side: event->parent guard missing"
+fi
+if grep -A20 'perf_event_release_aux' "$SRC_EVENTS/core.c" 2>/dev/null | \
+	grep -q 'event->parent'; then
+	pass "release side: event->parent guard present"
+else
+	fail "release side: event->parent guard missing"
+fi
+
+fi
+
+# ---- Section 9: User/kernel AUX isolation ----
+echo ""
+echo "--- 9. User/Kernel AUX Isolation ---"
+
+if [[ "$HAVE_SRC" -ne 1 ]]; then
+	skip "User/kernel isolation checks" "kernel source not available (installed run)"
+else
+
+if grep -A30 'perf_event_setup_aux' "$SRC_EVENTS/core.c" 2>/dev/null | \
+	grep -q 'EBUSY'; then
+	pass "setup_aux: -EBUSY when event->rb exists (user+kernel exclusion)"
+else
+	fail "setup_aux: missing -EBUSY guard"
+fi
+
+if grep -q 'aux_mmap_count' "$SRC_EVENTS/internal.h" 2>/dev/null && \
+   grep -q 'aux_kernel_count' "$SRC_EVENTS/internal.h" 2>/dev/null; then
+	pass "aux_mmap_count and aux_kernel_count are distinct fields"
+else
+	fail "aux_mmap_count or aux_kernel_count missing"
+fi
+
+if grep -B2 -A2 'aux_mmap_count' "$SRC_EVENTS/ring_buffer.c" 2>/dev/null | \
+	grep -q 'aux_kernel_count'; then
+	pass "perf_aux_output_begin: checks both owner counts"
+else
+	fail "perf_aux_output_begin: does not check both counts"
+fi
+
+if grep -q 'aux_kernel_count' "$SRC_EVENTS/core.c" 2>/dev/null; then
+	pass "release_aux: checks aux_kernel_count ownership"
+else
+	fail "release_aux: missing aux_kernel_count check"
+fi
+
+fi
+
+# ---- Summary ----
+echo ""
+echo "=========================================="
+echo " SUMMARY: $PASSED passed, $FAILED failed, $SKIPPED skipped"
+echo "=========================================="
+echo "Results saved to: $RESULTS_DIR"
+
+if [[ "$FAILED" -gt 0 ]]; then
+	echo "Overall: FAIL"
+	exit 1
+else
+	echo "Overall: PASS"
+	exit 0
+fi
-- 
2.43.0

