Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0A125B091;
	Fri, 25 Sep 2026 13:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343129; cv=none; b=efgaWdanXooQojnWXYmT0O5ssb5y1PkODBKucckw5MW0aOBg+8HSR6NSCb0k7fnQCwBKmB1fcAtTrlqWY67zrVO7grAXqZ7LOzbGzRToepOAwZ7HF4VpafocUDycxkpYusyoAFKH8jn/VDC5KNq5JFMVez/FSk84oxLounHN0lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343129; c=relaxed/simple;
	bh=CBR6+Jt57BFP86JgXwJd4YSe6HclyFGg9BQiulTvvWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TO1/sCTnyUSMdUryE6E+FSB1kSwLwOZBu9taJ0ZIqJJZjuWtWDkKxQyyd+gzsB2yceBNXOGsDfBj13nRbXFVj2EFEjiDhyZW0PsjvtzPCV5DojvWl3GPLts6EXBP4wJ75DO5l12EqBqOS0jw/3lB0dOCOHPFms0R1CmPHEQqQwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=i/xZiryJ; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="i/xZiryJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=MhpEfgfXmtazN8wFvo8Yvv2VRSX7LXsFe4toP7UM+DQ=; b=i/xZiryJlein
	e9DkyXoWRUKgTV2fLi/3St7x5Yx7xWuxt1TTdKfoFUaxoeZ8zBW/b7jW76n2tEh6HywQpyZy+P+z2
	6npo0eij/FC6jAjgvsxyZ7LrO1Nrcp5ie+pT/PcpmxGgqBZAX7JRGiDgxM3P/WR4tl9CXkDXUL2wH
	Q517TNEVtTc04hTwk/P8r3P6WvVgHP5qO6mChiJmDiGbOdaRftj2V0qSh/xvR4SJMsBhb/8ERjuBX
	wKOtSxTQyxAViED3pt6kx/+4P18PLYBKCNbPlqtZvcE461eV1BsZCnRKwczqaj0aQOdTwVJtR7F0+
	siXyo+OIJncj5gdiqpGISA==;
Received: from ch-vpn.virtuozzo.com ([130.117.225.6] helo=LekKit-T14)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <eva.kurchatova@virtuozzo.com>)
	id 1xA5wb-008MTh-2Y;
	Fri, 25 Sep 2026 15:29:30 +0200
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-kernel@vger.kernel.org,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/2] selftests: pstore: skip the frontends the kernel does not have
Date: Fri, 25 Sep 2026 16:29:06 +0300
Message-ID: <20260925132914.3633554-2-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925132914.3633554-1-eva.kurchatova@virtuozzo.com>
References: <20260925132914.3633554-1-eva.kurchatova@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The console and pmsg frontends are separate options from the backend:
CONFIG_PSTORE_CONSOLE and CONFIG_PSTORE_PMSG can both be off on a kernel
that registers one. pstore_tests checks for both regardless and fails
where they are absent.

Report them as skips instead.

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 tools/testing/selftests/pstore/pstore_tests | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/pstore/pstore_tests b/tools/testing/selftests/pstore/pstore_tests
index 2aa9a3852a84..ac11988888a6 100755
--- a/tools/testing/selftests/pstore/pstore_tests
+++ b/tools/testing/selftests/pstore/pstore_tests
@@ -9,13 +9,20 @@
 
 . ./common_tests
 
+# The frontends are separate options, a backend does not bring them in
 prlog -n "Checking pstore console is registered ... "
-dmesg | grep -Eq "console \[(pstore|${backend})"
-show_result $?
+if dmesg | grep -Eq "console \[(pstore|${backend})"; then
+    show_result 0
+else
+    prlog "SKIP (no pstore console, needs CONFIG_PSTORE_CONSOLE)"
+fi
 
 prlog -n "Checking /dev/pmsg0 exists ... "
-test -e /dev/pmsg0
-show_result $?
+if [ -e /dev/pmsg0 ]; then
+    show_result 0
+else
+    prlog "SKIP (no /dev/pmsg0, needs CONFIG_PSTORE_PMSG)"
+fi
 
 prlog -n "Writing unique string to /dev/pmsg0 ... "
 if [ -e "/dev/pmsg0" ]; then
@@ -23,8 +30,7 @@ if [ -e "/dev/pmsg0" ]; then
     show_result $?
     echo "$UUID" > $TOP_DIR/uuid
 else
-    prlog "FAIL"
-    rc=1
+    prlog "SKIP (no /dev/pmsg0)"
 fi
 
 exit $rc
-- 
2.55.0

