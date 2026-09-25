Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92A325B091;
	Fri, 25 Sep 2026 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343677; cv=none; b=KDsHZ2j0YYiqMYgni4DlmjLwwFKID4DdFjMkuvurt06rQBiG3tzNAFLlgvU9LRNQ+p/sPG+g/74iLN5rw8SSQwW1xa7VzS2HmdLQjQ7VMtNm+hzM8QTzNzIXZvxnRSGAeZDRUBZFo9q+rA/TtDJ8ecYXTCKvXjYa/UFnyj6bJOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343677; c=relaxed/simple;
	bh=cF7jc1nVYRIWGVc/b+yVIIHibDRKSv908JY2L+yakdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iu3EGW4xNJEzxxK5IPhnvUfq5C1CSNcchQ2K59uJ00az/RSLq0/Xx+vUPlgn2Xsk/SENY18v2EnVOsn5kXtFDIOzecKoN1QJDUNs7H8VhQbA4nvwU7B5LD76ml7VITDVZs0usPZR1yAxQ9gX/OeR8ApT7Ir2Jpb32SRc8VYmxFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=jqJ7jAqd; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="jqJ7jAqd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=GMeDjkmrnv5U67T0HjGa2Rn2lljMP+XcyMR8GGFZPnY=; b=jqJ7jAqdFml+
	/DYafl50UMAqEjBe86u/X2XU2/XhUl6Fp/8HI4+zhUXw/c1VobS/y6pMwWhDVTFHin15/cZEgjCwx
	/VEA7Mz9sKIuT7LZ6ixJ5Cw9CabzQwfkN7H5CzHiXNZkQ7WcuYTz2yhuyVOPvzFM2AhLXlbMkZHeA
	Izei1tDHsZzH+ZYCAItnnfBCDsxXvBdtYgRXbFMgrYtODi+rNRInGzX63DYSwopdY0Rr2YWqGmT4S
	UAswVIgoVFBViXpEMR5h8b9fxJBe96KVv71BGGL1wvT3vuw+wUe0kTrbK/jdvGMXjb90w2JgMV8lH
	h1AjqTugw3XZy6P+VZbcxQ==;
Received: from ch-vpn.virtuozzo.com ([130.117.225.6] helo=LekKit-T14)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <eva.kurchatova@virtuozzo.com>)
	id 1xA67s-008akx-2u;
	Fri, 25 Sep 2026 15:41:09 +0200
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: Bamvor Jian Zhang <bamv2005@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/gpio: skip when gpio-mockup is not available
Date: Fri, 25 Sep 2026 16:37:10 +0300
Message-ID: <20260925134103.3636519-1-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test drives the gpio-mockup debugfs interface, but checks only that
debugfs is mounted. On a kernel built without the driver every case
fails on a missing device rather than reporting that the driver is not
there:

  # ls: cannot access '/sys/kernel/debug/gpio-mockup': No such file
  # GPIO gpio-mockup test FAIL

Skip instead. Accept the driver either as a module modinfo can find, or
as one already loaded or built in, which /sys/module/gpio-mockup reports;
the test runs perfectly well in the built-in case.

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 tools/testing/selftests/gpio/gpio-mockup.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/gpio/gpio-mockup.sh b/tools/testing/selftests/gpio/gpio-mockup.sh
index fc2dd4c24d06..b13ccecd4a71 100755
--- a/tools/testing/selftests/gpio/gpio-mockup.sh
+++ b/tools/testing/selftests/gpio/gpio-mockup.sh
@@ -51,6 +51,9 @@ prerequisite()
 	DEBUGFS=$(grep -w debugfs /proc/mounts | cut -f2 -d' ')
 	[ -d "$DEBUGFS" ] || skip "debugfs is not mounted"
 
+	modinfo $module >/dev/null 2>&1 || [ -d /sys/module/$module ] ||
+		skip "$module module is not available"
+
 	GPIO_DEBUGFS=$DEBUGFS/$module
 }
 
-- 
2.55.0

