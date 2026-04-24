Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5683CAE85;
	Fri, 24 Apr 2026 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033485; cv=none; b=bf/6WE0kTUstqSyhnhbb4HaGJZ00GaBg2rP41enSvTO1IifXu/KneeyHpwXZKzJU4z+aVd35cbha5tm1N5oSIfU+1wrG/vr+C+bEqDNj+csreFUy71zIyDRu9/OrpcDjynMisgBWrhiicHy4CQ6BgkR1EPCKoXP4zv8DcYms01A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033485; c=relaxed/simple;
	bh=Ju4F+y15N/15YSKcoOoe8hecUCP4Fg5cxAM43INPgiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mXiRESmQW6juTuaB3YDiIB2SFM2zcL0CRRczyRL+axh20likMgTQxg4al87KjlsTlUQr39nkOlrF3OJrALSGxvsaz6kt4HhLb0pRwNLEe0s1A+J7J/0i+pZpFkE8MBE/7TOVm1P1bZP6XgVgdiA91SSAXIuratGbuAEWo7MTy00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=YN3rWZLc; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="YN3rWZLc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=VJ09Jo0h/vP/hOFzbwH4NhaWc8BN8qSSaNGeuLFDRBg=; b=YN3rWZLc23qtp4id7Che7GivgN
	LF8Am2+CC2mxHoaRu6hOkF4Usj7eEN2lt36BXtrcuCZHr0CRb9M/FG1Ww3J3kohVSyInyp1hyL3l8
	jmn1ipXgtFzxQbSUpXrTbw/mbQ+J+IJEd4kqeE0PHYxGWcyJ+fP89PpGplBbNJHZOXBwEkJj3Fzpk
	i4TlXPfLlVClj7Wn0MhbDkO47SINKJMlIMr/IoiGn9+3pBC/cZIqOhfVroRDtO6al8t/eMyO4IdXQ
	Ii9j6FATtWNS92NqCAPLU5EhlNwANxF4onx6QHwt5toxqK3JS82KjsNx1Dhj1Edw7p3Xiy8qS2hGG
	BToyHnJw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wGFaK-003AQL-1h;
	Fri, 24 Apr 2026 12:24:40 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 24 Apr 2026 05:24:02 -0700
Subject: [PATCH v5 4/4] selftests/mm: regression test for
 panic_on_unrecoverable_memory_failure
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260424-ecc_panic-v5-4-a35f4b50425c@debian.org>
References: <20260424-ecc_panic-v5-0-a35f4b50425c@debian.org>
In-Reply-To: <20260424-ecc_panic-v5-0-a35f4b50425c@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=3929; i=leitao@debian.org;
 h=from:subject:message-id; bh=Ju4F+y15N/15YSKcoOoe8hecUCP4Fg5cxAM43INPgiw=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp62Duu02nZb1HcgkNBUxR/EIf1G8rz/XDjppUT
 a5iK2aM0haJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaetg7gAKCRA1o5Of/Hh3
 bWsDD/9hAKxJHJJVVYekL9J7smIGLipCaTr4t1HTbxP1YFDcRGht3rB9LvffgMAKZ62PgQoIP3k
 Wv5fIbdL4Wqec2gvXjLyr+VE5aQxBiIZSpqsTJx8iKAsQIBI4xpXpjy+T/j7Du+BP2EElYhXjKD
 +f9SEYoqgOYL8XCgucawSJQ2yzGSykz0pj4Cp2JqGqTTMVNSNn+P0bf6j0/fHRNdKclHBz6rL+f
 5tHOkvT9UyD5FQwvuxJ/lDyT5b0D3PYChXL5Och1JmS33EzDyKZtKclj4qtaEgaI2PlToBApaTW
 nHOlSx4tDt0Xyh55JRMqCAKvHLWUw52QeABwgugBgR/CM4vlbct8Ep71GfT9AGwjz/sR6yqEZRh
 w03TG61wtVlT6gNdaYhCeX4t7fu/EpivZfdO2/qaB5A3QPAPtijmolOVwjlZGVixcPDnQGppcog
 6uZyckkp4wLCspqDn8TfZ1gJp24FSSVZs4RKaFLUtuWzfNWKiN38ZwoZ+XU/96usP8yHOt7OuBB
 g66OGBDe5NJJUju6idlaxWnnowQ7TdpfNYWq8QpLQGEtDn2IU2DHrqD3L1Zb7VdCicDrnEnSqb+
 iiiuXHHejKuVCcRSHbwdxDE6P8smOYx45fIXYbcu+sfSSyscZ+RyQ7hTORpdAHkVC1vYSVwveVr
 giSdM36EMaw2/hg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Add a test that enables vm.panic_on_unrecoverable_memory_failure and
injects MADV_HWPOISON on a userspace anonymous page. The page must
still be recovered via SIGBUS — it must not trigger a kernel panic.

This is the regression test for the panic_on_unrecoverable_mf()
recheck: a buddy page being concurrently allocated to userspace can
briefly land on the MF_MSG_KERNEL_HIGH_ORDER branch (refcount 0, not in
buddy), and without the recheck the kernel would panic on what is
actually a recoverable userspace page.

Run in a forked child so the SIGBUS path is fully exercised; if the
kernel ever regresses and panics, the host VM dies and the harness
reports the binary as never returning, which is itself a clear
failure signal.

Skips when the sysctl is not present (feature not built in) or when
the test cannot write to it (insufficient privilege). Saves and
restores the original sysctl value.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 tools/testing/selftests/mm/memory-failure.c | 84 +++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/tools/testing/selftests/mm/memory-failure.c b/tools/testing/selftests/mm/memory-failure.c
index 032ed952057c6..9cb8d694aee94 100644
--- a/tools/testing/selftests/mm/memory-failure.c
+++ b/tools/testing/selftests/mm/memory-failure.c
@@ -17,9 +17,13 @@
 #include <sys/vfs.h>
 #include <linux/magic.h>
 #include <errno.h>
+#include <sys/wait.h>
+#include <stdlib.h>
 
 #include "vm_util.h"
 
+#define PANIC_SYSCTL "/proc/sys/vm/panic_on_unrecoverable_memory_failure"
+
 enum inject_type {
 	MADV_HARD,
 	MADV_SOFT,
@@ -355,4 +359,84 @@ TEST_F(memory_failure, dirty_pagecache)
 	ASSERT_EQ(close(fd), 0);
 }
 
+static int read_sysctl_int(const char *path, int *out)
+{
+	char buf[16];
+	int fd, n;
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0)
+		return -1;
+	n = read(fd, buf, sizeof(buf) - 1);
+	close(fd);
+	if (n <= 0)
+		return -1;
+	buf[n] = '\0';
+	*out = atoi(buf);
+	return 0;
+}
+
+static int write_sysctl_int(const char *path, int val)
+{
+	char buf[16];
+	int fd, len, ret = 0;
+
+	fd = open(path, O_WRONLY);
+	if (fd < 0)
+		return -1;
+	len = snprintf(buf, sizeof(buf), "%d\n", val);
+	if (write(fd, buf, len) != len)
+		ret = -1;
+	close(fd);
+	return ret;
+}
+
+/*
+ * Regression test for vm.panic_on_unrecoverable_memory_failure.
+ *
+ * With the sysctl on, hwpoison injection on a userspace anonymous page
+ * must still be recovered via SIGBUS — it must not trigger a kernel
+ * panic. This guards the panic_on_unrecoverable_mf() recheck that rules
+ * out concurrent buddy allocations being misclassified as unrecoverable
+ * kernel pages (MF_MSG_KERNEL_HIGH_ORDER).
+ *
+ * If the kernel regresses and panics, the host VM dies and the test
+ * harness will report the binary as never having returned — which is
+ * itself a clear failure signal.
+ */
+TEST(panic_on_unrecoverable_user_page)
+{
+	unsigned long page_size;
+	int saved, status;
+	void *addr;
+	pid_t pid;
+
+	if (read_sysctl_int(PANIC_SYSCTL, &saved))
+		SKIP(return, "%s not available\n", PANIC_SYSCTL);
+	if (write_sysctl_int(PANIC_SYSCTL, 1))
+		SKIP(return, "cannot enable %s (need root?)\n", PANIC_SYSCTL);
+
+	page_size = sysconf(_SC_PAGESIZE);
+
+	pid = fork();
+	ASSERT_NE(pid, -1);
+	if (pid == 0) {
+		addr = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+			    MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+		if (addr == MAP_FAILED)
+			_exit(1);
+		*(volatile char *)addr = 1;
+		if (madvise(addr, page_size, MADV_HWPOISON))
+			_exit(2);
+		FORCE_READ(*(volatile char *)addr);
+		_exit(0); /* unreachable: SIGBUS expected */
+	}
+
+	ASSERT_EQ(waitpid(pid, &status, 0), pid);
+	write_sysctl_int(PANIC_SYSCTL, saved);
+
+	ASSERT_TRUE(WIFSIGNALED(status));
+	ASSERT_EQ(WTERMSIG(status), SIGBUS);
+}
+
 TEST_HARNESS_MAIN

-- 
2.52.0

