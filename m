Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CE019CD1D;
	Thu, 30 Jul 2026 14:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421689; cv=none; b=e5ZNQkCSEHN8cNAw1/wdav0BuwbWtT3khUBB0oCfcbOCT805+Or0JJjc51nWWMGSm73MysSpPx/d3LlCM20FTKOsaQF/A1ULS2TfiEu9P9iGgGLjUrHEl7hCo1txsubxYko0Mwy0OYSIPdrsFSf6lmWh6qXoNvZwUnx051UDEjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421689; c=relaxed/simple;
	bh=t94t8KtJ61N2TsEAJHjQF3Mlc9AtBsJrlCNd8l/F6eY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mK0pwEfOMB5tZPbAC3dwbSlGwtKu3+pSCHMEDW3bdc7pFGRA+JMW9aQQCfrHK5rBxi5BDPdugKO7lpsGQ8YJ30/oDyd8vfv2v8NmAXrAUiTajQxVH45wMC0RudPP0jNSZw55ONHWengQBXTLLTKVZ+LrXuwjHibJhVcZvrve2Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d781e4528c2211f1aa26b74ffac11d73-20260730
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD
	CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD
	ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:516c430b-7fe1-49d7-9a66-939a5b14d875,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:15
X-CID-INFO: VERSION:1.3.12,REQID:516c430b-7fe1-49d7-9a66-939a5b14d875,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:15
X-CID-META: VersionHash:e7bac3a,CLOUDID:da6d92cb45a1abfbac2444a16ceb26d2,BulkI
	D:26073022275497LA2ENX,BulkQuantity:0,Recheck:0,SF:10|38|66|78|102|127|850
	|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:ni
	l,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE
	:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d781e4528c2211f1aa26b74ffac11d73-20260730
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1917665023; Thu, 30 Jul 2026 22:27:49 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: akpm@linux-foundation.org,
	david@kernel.org,
	shuah@kernel.org
Cc: ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	13667453960@163.com,
	Jiangshan Yi <yijiangshan@kylinos.cn>
Subject: [PATCH] selftests/mm: make libnuma-dependent tests optional
Date: Thu, 30 Jul 2026 22:27:22 +0800
Message-Id: <20260730142722.874189-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mm selftests Makefile unconditionally builds three test binaries
that depend on libnuma (migration, ksm_tests, rmap). When libnuma-dev
is not installed, the build fails with a hard error, inconsistent with
how the optional liburing dependency is already handled via
check_config.sh.

These three tests hard-depend on libnuma at both compile time
(#include <numa.h>) and link time (-lnuma), confirmed by grepping all
.c files under tools/testing/selftests/mm/ for numa.h/numaif.h, which
matches exactly ksm_tests.c, migration.c, and rmap.c.

Extend check_config.sh to probe for libnuma via a compile-plus-link
check (the link check needs a main() symbol), gate the three tests in
TEST_GEN_FILES behind NUMA_EXTRA_LIBS, and print a warning when
libnuma is missing. The liburing section is switched from ">" to ">>"
writes and both output files are truncated once at the top, so the new
libnuma section can append without overwriting the liburing section.

Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 tools/testing/selftests/mm/Makefile        | 21 +++++++++--
 tools/testing/selftests/mm/check_config.sh | 44 +++++++++++++++++++---
 2 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index e6df968f0971..235c8ec788a7 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -75,7 +75,9 @@ ifneq (,$(filter $(ARCH),arm64 riscv riscv64 x86 x86_64 loongarch32 loongarch64)
 TEST_GEN_FILES += memfd_secret
 endif
 TEST_GEN_FILES += memory-failure
+ifneq ($(NUMA_EXTRA_LIBS),)
 TEST_GEN_FILES += migration
+endif
 TEST_GEN_FILES += mkdirty
 TEST_GEN_FILES += mlock-random-test
 TEST_GEN_FILES += mlock2-tests
@@ -94,7 +96,9 @@ TEST_GEN_FILES += uffd-stress
 TEST_GEN_FILES += uffd-unit-tests
 TEST_GEN_FILES += uffd-wp-mremap
 TEST_GEN_FILES += split_huge_page_test
+ifneq ($(NUMA_EXTRA_LIBS),)
 TEST_GEN_FILES += ksm_tests
+endif
 TEST_GEN_FILES += ksm_functional_tests
 TEST_GEN_FILES += mdwe_test
 TEST_GEN_FILES += hugetlb_fault_after_madv
@@ -103,7 +107,9 @@ TEST_GEN_FILES += hugetlb_dio
 TEST_GEN_FILES += droppable
 TEST_GEN_FILES += guard-regions
 TEST_GEN_FILES += merge
+ifneq ($(NUMA_EXTRA_LIBS),)
 TEST_GEN_FILES += rmap
+endif
 TEST_GEN_FILES += folio_split_race_test
 
 ifneq ($(ARCH),arm64)
@@ -256,11 +262,11 @@ $(OUTPUT)/gup_longterm: LDLIBS += $(IOURING_EXTRA_LIBS)
 
 $(OUTPUT)/mlock-random-test $(OUTPUT)/memfd_secret: LDLIBS += -lcap
 
-$(OUTPUT)/ksm_tests: LDLIBS += -lnuma
+$(OUTPUT)/ksm_tests: LDLIBS += $(NUMA_EXTRA_LIBS)
 
-$(OUTPUT)/migration: LDLIBS += -lnuma
+$(OUTPUT)/migration: LDLIBS += $(NUMA_EXTRA_LIBS)
 
-$(OUTPUT)/rmap: LDLIBS += -lnuma
+$(OUTPUT)/rmap: LDLIBS += $(NUMA_EXTRA_LIBS)
 
 local_config.mk local_config.h: check_config.sh
 	$(call msg,CHK,config,$@)
@@ -277,6 +283,15 @@ warn_missing_liburing:
 	echo
 endif
 
+ifeq ($(NUMA_EXTRA_LIBS),)
+all: warn_missing_libnuma
+
+warn_missing_libnuma:
+	@echo ; \
+	echo "Warning: missing libnuma support. Some tests (migration, ksm_tests, rmap) will be skipped." ; \
+	echo
+endif
+
 ifneq ($(PAGE_FRAG_WARNING),)
 all: warn_missing_page_frag
 
diff --git a/tools/testing/selftests/mm/check_config.sh b/tools/testing/selftests/mm/check_config.sh
index 32beaefe279e..8e6d1616561b 100755
--- a/tools/testing/selftests/mm/check_config.sh
+++ b/tools/testing/selftests/mm/check_config.sh
@@ -7,10 +7,17 @@
 OUTPUT_H_FILE=local_config.h
 OUTPUT_MKFILE=local_config.mk
 
+# Truncate output files so that re-running this script does not
+# accumulate duplicate content (all writes below use append ">>").
+: > $OUTPUT_H_FILE
+: > $OUTPUT_MKFILE
+
 tmpname=$(mktemp)
 tmpfile_c=${tmpname}.c
 tmpfile_o=${tmpname}.o
 
+trap 'rm -f ${tmpname} ${tmpname}.*' EXIT
+
 # liburing
 echo "#include <sys/types.h>"        > $tmpfile_c
 echo "#include <liburing.h>"        >> $tmpfile_c
@@ -19,12 +26,39 @@ echo "int func(void) { return 0; }" >> $tmpfile_c
 $CC $CFLAGS -c $tmpfile_c -o $tmpfile_o >/dev/null 2>&1
 
 if [ -f $tmpfile_o ]; then
-    echo "#define LOCAL_CONFIG_HAVE_LIBURING 1"  > $OUTPUT_H_FILE
-    echo "IOURING_EXTRA_LIBS = -luring"          > $OUTPUT_MKFILE
+    echo "#define LOCAL_CONFIG_HAVE_LIBURING 1"  >> $OUTPUT_H_FILE
+    echo "IOURING_EXTRA_LIBS = -luring"          >> $OUTPUT_MKFILE
 else
-    echo "// No liburing support found"          > $OUTPUT_H_FILE
-    echo "# No liburing support found, so:"      > $OUTPUT_MKFILE
+    echo "// No liburing support found"          >> $OUTPUT_H_FILE
+    echo "# No liburing support found, so:"      >> $OUTPUT_MKFILE
     echo "IOURING_EXTRA_LIBS = "                >> $OUTPUT_MKFILE
 fi
 
-rm ${tmpname}.*
+rm -f $tmpfile_o
+
+# libnuma
+echo "#include <numa.h>"            > $tmpfile_c
+echo "#include <numaif.h>"         >> $tmpfile_c
+echo "int func(void) { return 0; }" >> $tmpfile_c
+echo "int main(void) { return 0; }" >> $tmpfile_c
+
+$CC $CFLAGS -c $tmpfile_c -o $tmpfile_o >/dev/null 2>&1
+
+if [ -f $tmpfile_o ]; then
+    tmplink=${tmpname}.bin
+    # Also check linking, not just compilation, because <numa.h> may be
+    # available without the shared library (libnuma-dev vs libnuma)
+    if $CC $CFLAGS $tmpfile_c -o $tmplink -lnuma >/dev/null 2>&1; then
+        echo "#define LOCAL_CONFIG_HAVE_LIBNUMA 1"  >> $OUTPUT_H_FILE
+        echo "NUMA_EXTRA_LIBS = -lnuma"             >> $OUTPUT_MKFILE
+    else
+        echo "// No libnuma support found"          >> $OUTPUT_H_FILE
+        echo "# No libnuma support found, so:"      >> $OUTPUT_MKFILE
+        echo "NUMA_EXTRA_LIBS = "                   >> $OUTPUT_MKFILE
+    fi
+else
+    echo "// No libnuma support found"              >> $OUTPUT_H_FILE
+    echo "# No libnuma support found, so:"          >> $OUTPUT_MKFILE
+    echo "NUMA_EXTRA_LIBS = "                       >> $OUTPUT_MKFILE
+fi
+
-- 
2.25.1

