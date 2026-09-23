Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0613BFACE
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 09:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155614; cv=none; b=TiZ47Y1iB4cpI0X0/g/z5BWSwAm2H+e+yiGU9Wa3YBYp3Z8WdgVPoH07K4YaoP+RCiGCjELF3qwK4eSA8cHiJV+u8WXSFhvJlxmOl2Q9Sz7RfqgLOCiKi7ZmL9mSW33vatew8qUQ2IrKhBEXIyzC3wTj2bmbLO0Xd6NIC5L+HhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155614; c=relaxed/simple;
	bh=s75KvWE24ACqU/D0lXSq4RnV/kms7EYfzgTwBY4+qTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G2o/cx1unYpuYGxy7Kc49JXl7BYeH4MYULovGwJrdd6PDXvhLRx+gf8EVAkhCBSKarWHzDjxArNVC9Xb6vMGV6z4LIQq3bNeV4ThcqKVQeTKRuVozd/se6izn8qG22x45WKsN0thLJ0K9F1JuLsbOx5lVwB720b2h3yOA3CAD1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dgu.ac.kr; spf=pass smtp.mailfrom=dgu.ac.kr; dkim=pass (2048-bit key) header.d=dgu-ac-kr.20251104.gappssmtp.com header.i=@dgu-ac-kr.20251104.gappssmtp.com header.b=dJjyaU9H; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dgu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dgu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dgu-ac-kr.20251104.gappssmtp.com header.i=@dgu-ac-kr.20251104.gappssmtp.com header.b="dJjyaU9H"
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2db39df9c51so2412615ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 02:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dgu-ac-kr.20251104.gappssmtp.com; s=20251104; t=1790155612; x=1790760412; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kbAvaMWrcoRy0leTu4ezLZwt2MJV9tZljW/jEJUkEkc=;
        b=dJjyaU9Hz0efuh7f1rxVUPWbwxwAA/tk7TSoeoWr9L/naOys9DKSLkwBp1g3PWqjMA
         zEzi19OxN245IuEO3nWbwA2J/xI2a5HTQyjOZ+9GROEduSDBlAX10k7IvsHyCxFLVrxB
         gwoz1BIqE8L61/zxZ85vc+Ei8I7oH3wJC6sZT4pmoS836jXO6PdA+OQwVy0zVp0K3OU+
         mbLK6JHGgyYxtKGViJvM0cQ7utgj5Yb5tcR07KNmVMEL+mkc2YVsQRezrp4c69VM47Gh
         0NDrND5V76wqQDvi83t0etKuJSbosnPKtSN96iXe6cgaWPh/5JxmLdcGxKsiKgh7a9Cu
         MpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790155612; x=1790760412;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kbAvaMWrcoRy0leTu4ezLZwt2MJV9tZljW/jEJUkEkc=;
        b=AV2LG+r2xg3psHKEUP7Y5ecFBgCCxjJBa1dq5F7U3JyfHgllaEjsND+PDplcYmz0P6
         2f8e910X8bMauJ6mDdaNn73/4AuB1zU24gkGaRLgzjo5Tze4SF5fVe+5xI6qxYTpQIgH
         gZ4+Vw650B55wQKbTRogPBDEGvfZIfP8Y/dGebgRjde/4IcFmSFHb2VpWq1Y3upk4u1L
         BDSgwXV96r99AhRmL0vTqqtzwREnFWJtTCICyEBr03F0iL9VsOBVmIGhEgkgv8e+cr9V
         ASvF+j//y6nN6C5NJu43d+3ZPHtvvVghzBjGDcbpQoHuAsWoeADBgtOpzdfYFhamihRX
         1AvA==
X-Forwarded-Encrypted: i=1; AKwUvBxrOquVtPTvJ0yGUBGxYmPxgkCN0sc/vkS/eZUM7JfbI1qQwzvc19pM6kEhiVM1Zr3vZsn/I6rxB+WsegjEeBc=@vger.kernel.org
X-Gm-Message-State: AFuF++myKz7X36HZ+ViMJrcB/iVRPgwPkQAcg4xiqWx2nB9Lmw175kWE
	pCHDZjgpNzjzJs2g3GoUH/4UYlEi1PRN6AOE7prtcaa4gxzuxDkVTHIbkHmTJJgX9e8=
X-Gm-Gg: AYBFou001evsotT5iLAA8hNh7XCnuL9dyl3m5n8Ns8bsxix21sbIGQJVtvpPYnKPZFr
	6Q1N5qysODK38hHrZJItSK3E+NaFqd7rGII/XdiXtAbqj/jlv7PVjWNTwLwe50B6vblCZw1dxfG
	FxsTD3wvhLcKiocO9cfoujdrkGDwr5EkpIUEpUGNsVoz+lMFyEYz84bf+BhtQwWx0m7APQpkCRA
	Yb7lznhlZ3rx6z/TZgN2wH4V6ESBHjyFohw6YcCDFpSWam66MOqjk1wv5raoAn13RUsYRpWzqrb
	GfECHmfyyHCkMrA1yZVrRcpQptlM24vdO29bO77uWXu7JFkV5Qj+4ap4Thc8DcBValsU9tSJeaD
	PAnxM8iu8wW0qbU2V1E3AJi5d3m3uqErQwR3T8njOWDnACCxNChLnfW4FkNZSUwPf1ug9/FtHKv
	5UKZ5F2MOZRJRGha6cpCd8dp76gbnmXHEZ1Zcl5f9aW1UqigI+0stBwhw=
X-Received: by 2002:a17:903:1b04:b0:2dd:ad74:ac32 with SMTP id d9443c01a7336-2df69d664c1mr17892785ad.27.1790155612220;
        Wed, 23 Sep 2026 02:26:52 -0700 (PDT)
Received: from PC2. ([175.193.106.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a60c741sm7677995ad.80.2026.09.23.02.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:26:51 -0700 (PDT)
From: Park Tae-sun <ts930@dgu.ac.kr>
Date: Wed, 23 Sep 2026 18:26:48 +0900
Subject: [PATCH] selftests/mm: fix mlock2 errno handling and false PASS on
 ENOSYS
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-selftests-mm-mlock2-fix-v1-1-750b627854c6@dgu.ac.kr>
X-B4-Tracking: v=1; b=H4sIAFebs2oC/x2MzQqDMBAGX0X27IJZtWBfpXjw54tdarRkQymI7
 27wOAMzBxmiwuhZHBTxU9N9y+DKgqb3sC1gnTOTVPKoOqnZsPoES8YhcFj36SPs9c8eaLu5dqO
 ThnL9jcj6Pr/687wATq34PWkAAAA=
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Park Tae-sun <ts930@dgu.ac.kr>
X-Mailer: b4 0.13.0

While inspecting selftests/mm syscall wrappers, I noticed that mlock2_()
in mlock2.h handles the syscall return value differently from other
wrappers:

    int ret = syscall(__NR_mlock2, start, len, flags);
    if (ret) {
        errno = ret;
        return -1;
    }

Commit 1ddae9d67ee1 ("selftests/mm/mlock: print error on failure")
introduced this intending to make mlock2_() behave like libc by setting
errno and returning -1. However, glibc syscall(2) already returns -1 on
failure and sets positive errno. Assigning "errno = ret;" overwrites
errno with -1.

To verify this, mlock2 was disabled in the kernel (via sys_ni_syscall) to
return -ENOSYS. Testing revealed two interrelated defects:

1. In the unmodified test, mlock2_() clobbered errno to -1. The check
   "if (ret && errno == ENOSYS)" in main() was bypassed, resulting in an
   immediate crash in the first test:

       ~ # ./mlock2-tests
       TAP version 13
       1..15
       Bail out! mlock2(0): Unknown error -1
       # Planned tests != run tests (15 != 0)
       # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
       (exit code: 1 - FAIL)

2. After restoring mlock2_() to directly return syscall(), errno correctly
   retained ENOSYS (38), entering the ENOSYS check in main(). However, it
   then called ksft_finished():

       ~ # ./mlock2-tests
       TAP version 13
       # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
       ~ # echo $?
       0

   Because ksft_set_plan() had not been called yet (ksft_plan == 0) and
   zero tests ran (ksft_pass == 0), ksft_finished() evaluated 0 == 0 as
   success and exited with KSFT_PASS (code 0) without any TAP skip header.

Fix both issues by:
1. Returning the syscall() result directly in mlock2_() so that errno is
   preserved.
2. Calling ksft_exit_skip() on ENOSYS so unsupported kernels report a TAP
   skip ("1..0 # SKIP ...") and exit with KSFT_SKIP (code 4).

Verification on the mlock2-disabled kernel:

    ~ # ./mlock2-tests
    TAP version 13
    1..0 # SKIP mlock2() syscall is not supported
    ~ # echo $?
    4

Re-enabling mlock2 in the kernel confirmed all 15 tests pass cleanly:

    ~ # ./mlock2-tests
    TAP version 13
    1..15
    ok 1 test_mlock_lock: Locked
    ...
    ok 15 test_mlockall_future_droppable: droppable memory not locked
    # Totals: pass:15 fail:0 xfail:0 xpass:0 skip:0 error:0
    ~ # echo $?
    0

Fixes: 1ddae9d67ee1 ("selftests/mm/mlock: print error on failure")
Fixes: 65c89684896d ("selftests/mm: mlock2-tests: conform test to TAP format output")
Signed-off-by: Park Tae-sun <ts930@dgu.ac.kr>
---
 tools/testing/selftests/mm/mlock2-tests.c | 2 +-
 tools/testing/selftests/mm/mlock2.h       | 8 +-------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mm/mlock2-tests.c b/tools/testing/selftests/mm/mlock2-tests.c
index e16e288cc7c1..144b550813a6 100644
--- a/tools/testing/selftests/mm/mlock2-tests.c
+++ b/tools/testing/selftests/mm/mlock2-tests.c
@@ -502,7 +502,7 @@ int main(int argc, char **argv)
 
 	ret = mlock2_(map, size, MLOCK_ONFAULT);
 	if (ret && errno == ENOSYS)
-		ksft_finished();
+		ksft_exit_skip("mlock2() syscall is not supported\n");
 
 	munmap(map, size);
 
diff --git a/tools/testing/selftests/mm/mlock2.h b/tools/testing/selftests/mm/mlock2.h
index 81e77fa41901..4417eaa5cfb7 100644
--- a/tools/testing/selftests/mm/mlock2.h
+++ b/tools/testing/selftests/mm/mlock2.h
@@ -6,13 +6,7 @@
 
 static int mlock2_(void *start, size_t len, int flags)
 {
-	int ret = syscall(__NR_mlock2, start, len, flags);
-
-	if (ret) {
-		errno = ret;
-		return -1;
-	}
-	return 0;
+	return syscall(__NR_mlock2, start, len, flags);
 }
 
 static FILE *seek_to_smaps_entry(unsigned long addr)

---
base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
change-id: 20260923-selftests-mm-mlock2-fix-fee59d31b124

Best regards,
-- 
Park Tae-sun <ts930@dgu.ac.kr>

