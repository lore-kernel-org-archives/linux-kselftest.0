Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282224;
	b=BP6Mm2vPBQsSxshYkF6pP6PPhKw65XMZewuxj64cmDV0xjkQlGVa6AYD7os6LC7nd2ff
	 o0G4JTAnixkp/IEraAct/JZq0HILtJsbrg/NmZP2zFGppB/4ddRre7Pdp4/h9Cg4EvJJx
	 u86sv/sG4TJuhMojQZ/rUPRpRjaZTrop2x8veWh4qYiK4qX4sALsd9R9lvag1wZiYxT0D
	 0ajMsxp1K9g7ekxCyeg3H6YGIWLa6PBz+HL1j87y06Y+129uTmLBNRqlDWg45WGOAWtod
	 B+FU3Wj6ztNZwoo3qVuOiM4gFUWBUJ6rXoic0WUJEgwQTmveZbDtbmJ9/7zaZGVaFiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282224;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2A7V5uXRVVXdgCLxtu5YP48w4tDFdMxOh5/E4y/HUvQ=;
	b=Bx1yFka9b+G0DqjU5UmlQalJG44jdU5+pp10PAsL38JQNA5liSvAV1QALagAuGWCf2mf
	 FvPhDsZy6kmdQgSpshIXoYN6HMU211S+sUuzzWtJXRDADDGlpjBLUU88T35TVan1p8Hb1
	 pXccMpNzlrvD/fi74MZ0GVyCufVEJljfKt5rd1hrAFaoaxyqSTU2uUnQ/cT5BFu9airp+
	 wKz+8fEFu9m29G6FHZpRwEKmIkqgCYBk/u9+dN9fIo3lOF1kuGZvEItMuFxC/JWBG3BYY
	 tMld7tsAOiVPbSfCtboYjl14syrqywNAEF46yIcE10to3Z4HM/Z8812ctM12UCO8rXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RjzUhG4S;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6885860A261E;
	Tue, 10 Nov 2026 03:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6885860A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RjzUhG4S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794282223; x=1825818223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wlm0Rs5tZVVRo/suAbIN9DZDu1ytGx7eHz/kATAM0xQ=;
  b=RjzUhG4Sl589++6AQ26a2GcOYnuwqYMtT+xcLxGpF2UbHc9y2z4ib9/t
   fYhuAjH6jhQLJtaILCYBYt2x/QymJHQ3jWkmHJtyPBOlGoU6ZCUjSbFNg
   wC8dVQCC2vlZaD839JjexFzFbVFTW1gbkLYSrMqqiGp44KqQmqdeV3EPz
   LfMBkNmy7otdB6VAxUA+9d4+LBbNzNVVM0aQ2ByLlfiAI9D7yOAF0C1wv
   5IYwJzp78tt0fYgVTzc1FvpwrwSfL7Ja8cU2sY35DzNOtcPIdFhCBLJcy
   qi8eKdrsugkmto9XR19dwbrMtxFit4ac2ctZuX154VG+ao5uaYRRnVV5t
   w==;
X-CSE-ConnectionGUID: DKKixQb6SbO9zObQCg9JzQ==
X-CSE-MsgGUID: /iZnafTDR2OhG+Zc+E0UvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3018044"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3018044"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 19:43:43 -0800
X-CSE-ConnectionGUID: /u3xJWqOSniyn9Ic0kXyvQ==
X-CSE-MsgGUID: xBN6Wac7Q5OiUdR6CxMquA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8218918"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa003.fm.intel.com with ESMTP; 09 Nov 2026 19:43:42 -0800
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: x86@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	shuah@kernel.org,
	chang.seok.bae@intel.com
Subject: [PATCH 6/6] selftests/mm: Add coredump test for x86
Date: Tue, 10 Nov 2026 03:16:03 +0000
Message-ID: <20261110031603.698635-7-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110031603.698635-1-chang.seok.bae@intel.com>
References: <20261110031603.698635-1-chang.seok.bae@intel.com>
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

There is currently no test covering the coredump path for PKRU. Add one
by reusing the helpers from the x86 selftests.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
Note: The test fails right now. So the fix [*] should get in first.

[*] https://lore.kernel.org/lkml/20261015210545.48208-1-chang.seok.bae@intel.com/
---
 tools/testing/selftests/mm/Makefile           |  2 +-
 tools/testing/selftests/mm/pkey-x86.h         |  1 +
 .../selftests/mm/pkey_coredump_tests.c        | 89 +++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh     | 11 +++
 4 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/mm/pkey_coredump_tests.c

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 0ea72e997934..d687936c8144 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -116,7 +116,7 @@ CAN_BUILD_X86_64 := $(shell ./../x86/check_cc.sh "$(CC)" ../x86/trivial_64bit_pr
 CAN_BUILD_WITH_NOPIE := $(shell ./../x86/check_cc.sh "$(CC)" ../x86/trivial_program.c -no-pie)
 
 VMTARGETS := protection_keys
-VMTARGETS += pkey_sighandler_tests
+VMTARGETS += pkey_sighandler_tests pkey_coredump_tests
 BINARIES_32 := $(VMTARGETS:%=%_32)
 BINARIES_64 := $(VMTARGETS:%=%_64)
 
diff --git a/tools/testing/selftests/mm/pkey-x86.h b/tools/testing/selftests/mm/pkey-x86.h
index f7ecd335df1e..5b16e9ebcb2d 100644
--- a/tools/testing/selftests/mm/pkey-x86.h
+++ b/tools/testing/selftests/mm/pkey-x86.h
@@ -112,6 +112,7 @@ static inline u32 pkey_bit_position(int pkey)
 #define XSTATE_PKEY_BIT	(9)
 #define XSTATE_PKEY	0x200
 #define XSTATE_BV_OFFSET	512
+#define XSTATE_SW_BYTES_OFFSET	464
 
 static inline int pkey_reg_xstate_offset(void)
 {
diff --git a/tools/testing/selftests/mm/pkey_coredump_tests.c b/tools/testing/selftests/mm/pkey_coredump_tests.c
new file mode 100644
index 000000000000..1afb40b71800
--- /dev/null
+++ b/tools/testing/selftests/mm/pkey_coredump_tests.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <sys/wait.h>
+
+#include "pkey-helpers.h"
+
+#if defined(__i386__) || defined(__x86_64__)
+#include "../x86/coredump.h"
+
+static bool validate_corefile_pkru(u64 *xsave, u32 pkru)
+{
+	bool ret = false;
+
+	if (!(xsave[XSTATE_SW_BYTES_OFFSET / sizeof(u64)] & XSTATE_PKEY))
+		goto out;
+
+	if (!(xsave[XSTATE_BV_OFFSET / sizeof(u64)] & XSTATE_PKEY))
+		goto out;
+
+	if (*(u32 *)(xsave + pkey_reg_xstate_offset() / sizeof(u64)) != pkru)
+		goto out;
+
+	ret = true;
+out:
+	return ret;
+}
+
+static void test_x86_coredump(void)
+{
+	u64 *corefile_xsave;
+	u32 new_pkru;
+	pid_t child;
+	int status;
+
+	if (!coredump_prepare())
+		return;
+
+	new_pkru = ~__read_pkey_reg();
+	new_pkru &= ~3;
+
+	child = fork();
+	if (child < 0) {
+		coredump_exit_fail_msg("fork() failed.");
+	} else if (!child) {
+		if (chdir(core_dir)) {
+			printf("\tchdir() failed.\n");
+			_exit(1);
+		}
+		__write_pkey_reg(new_pkru);
+		coredump_trigger();
+		_exit(1);
+	}
+
+	if (waitpid(child, &status, 0) != child ||
+	    !WIFSIGNALED(status) || WTERMSIG(status) != SIGSEGV)
+		coredump_exit_fail_msg("child didn't SIGSEGV successfully.");
+
+	corefile_map(child);
+	corefile_xsave = (u64 *)retrieve_corefile_xbuf();
+
+	if (validate_corefile_pkru(corefile_xsave, new_pkru))
+		ksft_test_result_pass("PKRU was correctly core-dumped\n");
+	else
+		ksft_test_result_fail("PKRU was not correctly core-dumped\n");
+
+	coredump_cleanup();
+}
+#endif
+
+static void (*pkey_tests[])(void) = {
+#if defined(__i386__) || defined(__x86_64__)
+	test_x86_coredump,
+#endif
+};
+
+int main(int argc, char *argv[])
+{
+	ksft_print_header();
+
+	if (!is_pkeys_supported())
+		ksft_exit_skip("pkeys not supported\n");
+
+	ksft_set_plan(ARRAY_SIZE(pkey_tests));
+
+	for (test_nr = 0; test_nr < ARRAY_SIZE(pkey_tests); test_nr++)
+		(*pkey_tests[test_nr])();
+
+	ksft_finished();
+}
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index a1b45a3dedae..bf7c8aa0b098 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -373,6 +373,17 @@ then
 	CATEGORY="pkey" run_test ./protection_keys_64
 fi
 
+# pkey_coredump tests
+if [ -x ./pkey_coredump_tests_32 ]
+then
+	CATEGORY="pkey" run_test ./pkey_coredump_tests_32
+fi
+
+if [ -x ./pkey_coredump_tests_64 ]
+then
+	CATEGORY="pkey" run_test ./pkey_coredump_tests_64
+fi
+
 CATEGORY="soft_dirty" run_test ./soft-dirty
 
 CATEGORY="pagemap" run_test ./pagemap_ioctl
-- 
2.53.0

