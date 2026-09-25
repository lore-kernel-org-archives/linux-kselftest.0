Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A9D346E58;
	Fri, 25 Sep 2026 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343124; cv=none; b=QhdFKXoVJDeY3xV87+m5g03I5+AsMX2EjVfIx9dIe/nyPBPAqw/0aCTX36hvziIyaiR8dTgSyXYsizLAbHYZhu4Uc92A1UWsNTwTpijBZi+6eLUDKE3qOf8RVhom7jd+tCvDek1mllCtBRNrCUvbmE2j0wpc/hL/gRwHGMhTnlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343124; c=relaxed/simple;
	bh=pfHHJN9mx7iaqPzkJ7OKmCMLSFn2Ivdn3IqFyfscjNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rxtCl1ZUO3Rgy9QlF/kWF3X2TmGTMecqIpmvy4h2S9OAGFabuRt93dgTrDVqkbWogBKo3+1mWBVooQw9vbHV1DElZxNFTIRVmZbHmMmRYK0f4CaOfZwxBtB51XoSGH/s4vnVyC6wbz1xukRSuuOc+vRqwVSiClsmmnEq0kHJE74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=u8KirY2H; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="u8KirY2H"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=6HAHGu4uIEli4DDfuSdZRC62h38knRyenkn6Pc+DmxQ=; b=u8KirY2H+1W3
	xabV403OYV99Cm9GP61rgfZ3ii1fGAGZ0vfGR9SHmB0Vnf+c9Ehgafm6/3XKxsUowLot8h+7P6aMh
	Gkk4UfxAUuIXxddOp7Rf48hwcjGlFPrPiCgZkTAd7gXb+65gOi0E62V2us+pzVmqGoKI1lmGT0pdb
	2W8EMBpnAQ8ISrM+LYJQA9ZSHmfs4pzTswIz2/ES9hYmxCSdNvm/Yetwidf81Q7VO5foOE464tVjO
	JNPH+m4T7NwhyOOObuIgYOM8CyCoHQs2PhJXWeUqB0GSFh/5PEyAZFlpe5Baa+W2vpNEmRPJ48Raz
	wScepjNbLpAKUMLjEe0Ubw==;
Received: from ch-vpn.virtuozzo.com ([130.117.225.6] helo=LekKit-T14)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <eva.kurchatova@virtuozzo.com>)
	id 1xA5wa-008MTh-34;
	Fri, 25 Sep 2026 15:29:29 +0200
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-kernel@vger.kernel.org,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/2] selftests: pstore: skip when no backend is registered
Date: Fri, 25 Sep 2026 16:29:05 +0300
Message-ID: <20260925132914.3633554-1-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An unregistered pstore backend reads back "(null)", and every later
check fails. This also contradicts the pstore_crash_test documentation.

pstore_crash_test has carried the comment

  # exit if pstore backend is not registered

Fix by skipping an unregistered backend in common_tests.

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 tools/testing/selftests/pstore/common_tests     | 17 ++++++++++++-----
 .../selftests/pstore/pstore_post_reboot_tests   |  3 ---
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/pstore/common_tests b/tools/testing/selftests/pstore/common_tests
index 4509f0cc9c91..8f140fa572af 100755
--- a/tools/testing/selftests/pstore/common_tests
+++ b/tools/testing/selftests/pstore/common_tests
@@ -55,6 +55,8 @@ operate_files() { # tested value, files, operation
 
 # Parameters
 TEST_STRING_PATTERN="Testing pstore: uuid="
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
 UUID=`cat /proc/sys/kernel/random/uuid`
 TOP_DIR=`absdir $0`
 LOG_DIR=$TOP_DIR/logs/`date +%Y%m%d-%H%M%S`_${UUID}/
@@ -74,10 +76,15 @@ prlog "=== Pstore unit tests (`basename $0`) ==="
 prlog "UUID="$UUID
 
 prlog -n "Checking pstore backend is registered ... "
-backend=`cat /sys/module/pstore/parameters/backend`
-show_result $?
+# No file at all where pstore is not loaded, "(null)" where none registered
+backend=`cat /sys/module/pstore/parameters/backend 2>/dev/null`
+if [ -z "$backend" ] || [ "$backend" = "(null)" ]; then
+    prlog "SKIP"
+    prlog -e "\tbackend=${backend:-<none>}"
+    prlog -e "\tcmdline=`cat /proc/cmdline`"
+    prlog "pstore backend is not registered, skipping"
+    exit $ksft_skip
+fi
+prlog "ok"
 prlog -e "\tbackend=${backend}"
 prlog -e "\tcmdline=`cat /proc/cmdline`"
-if [ $rc -ne 0 ]; then
-    exit 1
-fi
diff --git a/tools/testing/selftests/pstore/pstore_post_reboot_tests b/tools/testing/selftests/pstore/pstore_post_reboot_tests
index d6da5e86efbf..2edd48a87dda 100755
--- a/tools/testing/selftests/pstore/pstore_post_reboot_tests
+++ b/tools/testing/selftests/pstore/pstore_post_reboot_tests
@@ -7,9 +7,6 @@
 #  Written by Hiraku Toyooka <hiraku.toyooka.gu@hitachi.com>
 #
 
-# Kselftest framework requirement - SKIP code is 4.
-ksft_skip=4
-
 . ./common_tests
 
 if [ -e $REBOOT_FLAG  ]; then
-- 
2.55.0

