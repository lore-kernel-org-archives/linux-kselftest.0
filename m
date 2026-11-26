Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655944;
	b=BsjkagXsoPvBGfBtrDAQJz39IyqMJGp4ZcAymCJ0x4io2jGsBicWpCPrQiB4M/kUkzLz
	 BDQwYGma98X8tNkO3q2U6kPWcI8fmsCpf/hpKibyQLs2oc0u7+fHFQWkFSzCfIax6cgV/
	 vgftQ9Yhtx5iwxmQJKQCvTsHfxBwocvJCQf+yd8QMoxCo+CZiRZdUKTT+s78EZaVMMtG6
	 g45zCqnloke9sqQeSwHF4coMM2lbMo+c6ulPZ/mdoPqkMyM5zZRBafk0IKY53FhH0GWRg
	 Lrzfz6RJw86zpG8EsamSIMwbELxrtlsIesk+vXHJnEX49uO5rWyVsg5hv0jNTu0Ok0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655944;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/bP0dHnKGr+2Tueqse6iudbEche5N89ZiaGs3zV4IFA=;
	b=utcC1ozYRjDDERBa4nZRW097NLQq24QrIEH3FG8lusImV6PYJSjM812LbNnSit6d4/hu
	 ONySigM6CK9ftVSK5yOdhohcUGd/d00jK9E7ksZYr7B1kGUaTXywui8f0tCsRloDZgwfO
	 yMt3XcjjHPvjt0FD4hptfvoHptwzPxwWE5rICUB63fok5tSSMabLYnOe+g0tXLKBwMCqv
	 7uVxVqh9fUYii96DVgKWH2pBx+bSqZN1OejAA1zTcTfm9jhAaOu/1zStYN0QIsVmFRmuE
	 l5M2dktBy205YQZCHpUKCnkt3N+m+fGRisP7RVga68+3ug1s08DtOa8ciOPYpK7Vjmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=FfrJVv9m;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6045C606A339;
	Thu, 26 Nov 2026 01:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6045C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=FfrJVv9m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=FfrJVv9mTW7QVFhOgmELvlZsxM3ygecgmrFKsbWzT7hMSuXVwT/XLMPnEffO84IqI0T7W1E89m/rM
	 rEUj5+Iy0qd7s4iNKNOBcrjKpmjqIj8ksQzLGwWGDMWxHnrJheewUYGeHP7OBoehfZfg1QLEnVEekX
	 CgcH4Mpz7sLBfAoc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86b078903bd1-f5624;
	Thu, 26 Nov 2026 09:18:59 +0800 (CST)
X-RM-TRANSID:2ee86b078903bd1-f5624
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96b0789004cd-56c91;
	Thu, 26 Nov 2026 09:18:58 +0800 (CST)
X-RM-TRANSID:2ee96b0789004cd-56c91
From: tongzhiwei <tongzhiwei@cmss.chinamobile.com>
To: Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Shuah Khan <shuah@kernel.org>
Cc: tongzhiwei@cmss.chinamobile.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/cachestat: clean up the mmap test scratch file
Date: Thu, 26 Nov 2026 09:18:15 +0800
Message-ID: <20261126011818.417-1-tongzhiwei@cmss.chinamobile.com>
X-Mailer: git-send-email 2.45.0.windows.1
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

NOTE: This fix is found and coded by llm, but it has been
reviewed by human.

run_cachestat_test() creates its FILE_MMAP scratch file with open() but
cleans it up with shm_unlink(), which only removes a POSIX shared-memory
object under /dev/shm.  The regular file "tmpshmcstat" is therefore left
behind in the working directory after every run.

The leftover file was previously worked around by adding its name to
.gitignore in commit b90cafb43887 ("selftests/cachestat: add
tmpshmcstat file to .gitignore"); the entry remains as a safety net
for runs interrupted mid-test, but the test itself should not leave
the file behind in the first place.

Use remove() for the mmap case and keep shm_unlink() for the FILE_SHMEM
case only, matching the cleanup the sibling test_cachestat() helper
already does for its own temp file.

Remove the file unconditionally, by design: the name "tmpshmcstat" is
test-specific so a real collision is implausible, and gating removal on
whether this run created the file would preserve stale files left by a
crashed previous run instead of cleaning them up.

Assisted-by: LLM
Signed-off-by: tongzhiwei <tongzhiwei@cmss.chinamobile.com>
---
For context: the same leftover file was previously discussed in a
related but different proposal from Madhur Kumar, which took the
EXTRA_CLEAN approach (removing the file in "make kselftest-clean")
and has not been applied so far:
https://lore.kernel.org/r/20250927161141.778631-1-madhurkumar004@gmail.com/
This patch instead removes the leftover inside the test itself, so
the file is cleaned up whether or not the test builds/runs via make.

 tools/testing/selftests/cachestat/test_cachestat.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cachestat/test_cachestat.c b/tools/testing/selftests/cachestat/test_cachestat.c
index 542cd09..5e62c49 100644
--- a/tools/testing/selftests/cachestat/test_cachestat.c
+++ b/tools/testing/selftests/cachestat/test_cachestat.c
@@ -289,7 +289,10 @@ bool run_cachestat_test(enum file_type type)
 	}
 
 close_fd:
-	shm_unlink(filename);
+	if (type == FILE_SHMEM)
+		shm_unlink(filename);
+	else
+		remove(filename);
 out:
 	return ret;
 }
-- 
2.33.0



