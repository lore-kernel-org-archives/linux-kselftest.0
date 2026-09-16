Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A574E06E5;
	Wed, 16 Sep 2026 20:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789591832; cv=none; b=pEOBBhMlz1AFc7BeANKEAPux7b4rdGPTUxj3CaljQIjc04HqRya6pEyVLE/oCygKcu1WUFP2boJRAM965HJfoNhJgHL5y1YTQZqLb2Qc8MWdoIwnmgQKpSK+AeKKLxSexRGbPHHOuoaTOvicpsNOHmOcqM+ZJ7yb/2fgrcaQ5D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789591832; c=relaxed/simple;
	bh=hN39DPrceczeiOT9/MPgWeZTqKMJCZNfoFUibqz6o38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BtbM5nyInIKzp7/5btus+PpqwDmhvmp7SzZZt9z79PrzA+ImxtDs0qdV9BwBQNSQF+b75v5O5GRcCjOr3Ord0HUUIwRBPWimKgT8X+Jq63Z9ZpDjT83Pp8QV12UeXrdkhuYUhANS3h0X5oRvhy9jVBkQEvGhghssIAGk21ZFvvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=AMAl9QJd; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="AMAl9QJd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=B/jUuH40yCXAgR383WQv9aqk10dUHBpNo4ONwhWZDC8=; b=AMAl9QJdwmxl
	gs1NQ956C/U1qh1cKooBeal9yBA3MBZ0h4zmfidKMPMyG1rwrOZKfd0F5nmkHr7darUeXXiuW63Gw
	fCG8lhYcEWJMdIpa4SfTepIcmTRRs+UPuclz0Dt18SbS6HgU/c6XvadnspSJgsCt5kmNa9BHo9QJZ
	mg+W3Z7vGNHsMUr7ZEJotWY65FQwvYn8SKQ4gQVN9N3oZE8lEe50c8CRDv6D7BYW7AWoiOaw55LUJ
	PioaN4IgYPXbJUSvujxqq7f6+r4TW1b1qGdmI+oJXei9rYwpfZCVIc2+mzmZz4hA+/OKQIXIPt/6p
	knwJ/HrGZdju/N+h+u7Ccg==;
Received: from ch-vpn.virtuozzo.com ([130.117.225.6] helo=LekKit-T14)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <eva.kurchatova@virtuozzo.com>)
	id 1x6wXL-00Cmfg-2V;
	Wed, 16 Sep 2026 22:50:13 +0200
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests: prctl: skip anon VMA naming test when unsupported
Date: Wed, 16 Sep 2026 23:50:07 +0300
Message-ID: <20260916205008.822717-1-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PR_SET_VMA_ANON_NAME returns EINVAL on a kernel built without
CONFIG_ANON_VMA_NAME, and every case in the renaming test then fails on
a feature that is not there.

Probe once in the fixture setup with a throwaway mapping and skip when
the kernel answers EINVAL. Only that error means the feature is
missing; the test still checks that an invalid name is refused with
EINVAL later, on a kernel that has it.

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 .../testing/selftests/prctl/set-anon-vma-name-test.c  | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/prctl/set-anon-vma-name-test.c b/tools/testing/selftests/prctl/set-anon-vma-name-test.c
index 5f9589534da8..2d49a5114497 100644
--- a/tools/testing/selftests/prctl/set-anon-vma-name-test.c
+++ b/tools/testing/selftests/prctl/set-anon-vma-name-test.c
@@ -80,6 +80,17 @@ FIXTURE(vma) {
 
 FIXTURE_SETUP(vma) {
 	char template[] = "./set-anon-vma-test-XXXXXX";
+	void *probe;
+	int res;
+
+	/* Naming anonymous VMAs needs CONFIG_ANON_VMA_NAME. */
+	probe = mmap(NULL, AREA_SIZE, PROT_READ | PROT_WRITE,
+					MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(probe, MAP_FAILED);
+	res = rename_vma((unsigned long)probe, AREA_SIZE, GOOD_NAME);
+	munmap(probe, AREA_SIZE);
+	if (res == -EINVAL)
+		SKIP(return, "CONFIG_ANON_VMA_NAME is not enabled");
 
 	self->ptr_anon = mmap(NULL, AREA_SIZE, PROT_READ | PROT_WRITE,
 					MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-- 
2.55.0

