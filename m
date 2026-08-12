Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188F23749EE;
	Wed, 12 Aug 2026 08:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786522667; cv=none; b=OQfkH1kIu5bEBzX4Bd2aw7zRpSgwQEn9/7s3EUaL4kmMTnJc03JzhnhPgbdmIEuzQFc/BaBrywKvCaCQtmT/YQNC5YmwiFbYyEsz/mWb0k9xhmqK7hJpzJLJWMWeRi8LiHUgsXE8jDbp4v4QLgZKM9YHB8MaIpMj4uJivUFRX2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786522667; c=relaxed/simple;
	bh=DqYxEwSH3H4xVoQgu3Tgg5wdeAVi8k/bBFLSrF/uUDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HQhh3SnZQvXDSSuc+fLuyheNka+aO303KHQcRXGILNAK11miozntLSBHMGP5kiZM+bLmQrpoQB5LrmKarPhyGlCAJPFVqJmef+6209sQEoOu3bCuGGbd/2yrH7+TnzrBQwEqnWSHCc1svE51FmSa3jzzOMKpaUSI+fJyy0LNZ8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlrI6VGT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlrI6VGT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC57C1F00A3A;
	Wed, 12 Aug 2026 08:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786522665;
	bh=rUPKq19ute4e/df9ITifTzrOJePqrUKcOigGJrc6Xv4=;
	h=From:Date:Subject:To:Cc;
	b=jlrI6VGTznU6HDN4gGZLQRdHLaTVS+lRv3AYOoJ5HFdlC9BkzAFxkiVC/LXYs6Nf+
	 qHSSZY+Bh8HwtwWJIbykKRfCx9lEPEslje6v7NYdIDwzItNMuy5xqy+ySQYq87K8Vx
	 CJ03Xz+5+XRV8cV8WoYZZc1keHW5ojKGAA0vCl4cTN5juOP1PJln4L5z8ud362oPl4
	 EdS7BXA2ALfdxXa1eQXW3IRQSKzw1Y0O9ZxS2v8hQCJnTIgUdZH6vV4dEaEsMl82pk
	 MGbjU7GHrQu2NEyhR4q8CVu8mMC4vbQzdWTXGkY7KRAuingOuKed0NFV/nQuhO5Lxz
	 +pSg/C4lSa+0w==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Wed, 12 Aug 2026 11:17:40 +0300
Subject: [PATCH v2] selftests/mm: thuge-gen: fix test_shmget() for
 PAGE_SIZE check
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-selftests-thuge-gen-fix-v2-1-9adaa693e73b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOQQ7CIBREr2JYi9LWVuvKe5gugH4KWsDwaaNpe
 nehHsD81ZuZP5mFIAQDSK67hQSYDRrvEpT7HZGauwGo6ROTkpUNu7CWIowqAkakUU/JHsBRZd6
 05pLVqm4qdpYkfb8CJHlrvnc/xkk8QMZclxOCI1ARuJM6S9b6aI/W0slh5GKEnNEGow+fbd5c5
 K7/S+aCpmuLVp1E1Reluj0hOBgPPgykW9f1C6P/eDv1AAAA
X-Change-ID: 20260809-selftests-thuge-gen-fix-5ac05f56307c
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Sarthak Sharma <sarthak.sharma@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Vlastimil Babka <vbabka@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
X-Mailer: b4 0.17-dev

Commit 49a4e7186b08 ("selftests/mm: thuge-gen: add setup of HugeTLB pages")
changed thuge-gen test to use common functions for reading hugetlb
attributes from sysfs, but it missed that the original read_free() function
special cased PAGE_SIZE tests.

For PAGE_SIZE tests, failure to read sysfs was ignored and read_free()
returned 0.

This allowed test_shmget() to essentially skip the check of how many huge
pages was consumed when it ran with PAGE_SIZE.

Commit 3199b0c09efa ("selftests/mm: fix read_file() return value check")
fixed checks for read_file() return value and this exposed the issue in
test_shmget() that checks the number of free hugetlb pages even for
PAGE_SIZE test, tries to access

/sys/kernel/mm/hugepages/hugepages-<PAGE_SIZE>/free_hugepages

and obviously fails there.

Gate the checks for free huge pages on size != getpagesize() and initialize
before and after variables to values matching PAGE_SIZE test.

Fixes: 49a4e7186b08 ("selftests/mm: thuge-gen: add setup of HugeTLB pages")
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
v2 changes:
* Correct the commit message

v1: https://patch.msgid.link/20260809-selftests-thuge-gen-fix-v1-1-1919f4b3d12f@kernel.org
---
 tools/testing/selftests/mm/thuge-gen.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/mm/thuge-gen.c b/tools/testing/selftests/mm/thuge-gen.c
index 22b9c2f1c35d..50d0805b65db 100644
--- a/tools/testing/selftests/mm/thuge-gen.c
+++ b/tools/testing/selftests/mm/thuge-gen.c
@@ -71,12 +71,16 @@ void test_mmap(unsigned long size, unsigned flags)
 
 void test_shmget(unsigned long size, unsigned flags)
 {
-	int id;
-	unsigned long before, after;
+	/* values for PAGE_SIZE test */
+	unsigned long before = NUM_PAGES;
+	unsigned long after = 0;
 	struct shm_info i;
 	char *map;
+	int id;
+
+	if (size != getpagesize())
+		before = hugetlb_free_pages(size);
 
-	before = hugetlb_free_pages(size);
 	id = shmget(IPC_PRIVATE, size * NUM_PAGES, IPC_CREAT|0600|flags);
 	if (id < 0) {
 		if (errno == EPERM) {
@@ -97,10 +101,11 @@ void test_shmget(unsigned long size, unsigned flags)
 	shmctl(id, IPC_RMID, NULL);
 
 	memset(map, 0xff, size*NUM_PAGES);
-	after = hugetlb_free_pages(size);
+	if (size != getpagesize())
+		after = hugetlb_free_pages(size);
 
 	show(size);
-	ksft_test_result(size == getpagesize() || (before - after) == NUM_PAGES,
+	ksft_test_result((before - after) == NUM_PAGES,
 			 "%s: mmap %lu %x\n", __func__, size, flags);
 	if (shmdt(map))
 		ksft_exit_fail_msg("%s: shmdt: %s\n", __func__, strerror(errno));

---
base-commit: 17e5919bdca144d4e67337f53bf57d7811f62192
change-id: 20260809-selftests-thuge-gen-fix-5ac05f56307c

--
Sincerely yours,
Mike.

