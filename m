Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF4C54723;
	Sun, 26 Apr 2026 11:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777201715; cv=none; b=Or2iUIDvGfWTG2JROI7JcutpkbIjiEdtwIkVWfg6P5YtEp+SjvLfdTQxe93E1cjAMXYtWFqKkXIQQyA/uUTvH4JaS0RP6U6gLdAHcU7QWKAh0pkVnx6aZvhnzf3ht6jfsYYqGOeddgukPI5Uoy4z8xCquxzd6EUuxJFhYAC268k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777201715; c=relaxed/simple;
	bh=qjz9yydLXC4AU9DK+5vbKn3iltNv4XI0w0tlHIC1PK4=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=uOydKAPKm3I/NkfrjsrL0LfF5UAcU9isP+jfVl/ILqtFJfqNdJPeZvqw5bw/NsjmWZsitK4SwBWOaDvYRRl8a378IuCcOeIfynhhD20j1AI4ZzuN1pN9R1dwrbwuLk4JZNyj6LTng5E/p49ZOan50QgpP7i7rAMo7pGmnTktchw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=E3nYPyZi; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="E3nYPyZi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777201706; bh=YJoTltremD7Kya8CfcAZL7++rjFxHo615qsgHJhBL7k=;
	h=From:To:Cc:Subject:Date;
	b=E3nYPyZi/nF16AESo6Y1spzEVSpeDPC7BouJEU14Xiu79toRnPsKhOy4pRCqm3W57
	 CzQtqXFAhjbjqq4ktFBjMsEMYHcZraCkx4fsl6A+n1xE5PCBtY0b6d49PnFdpH2XJK
	 d/CI3onXaAnXu9FGk355PazR0npU5ukCwqxW4c6Y=
Received: from node68.. ([166.111.236.25])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 21735AF9; Sun, 26 Apr 2026 19:08:23 +0800
X-QQ-mid: xmsmtpt1777201703txxumchuu
Message-ID: <tencent_98F3571EF9236437E5165F5C08CF258A9E08@qq.com>
X-QQ-XMAILINFO: NC4p7XQIBeahjLyMy+mxShhJwheb0epV3omBl741iKBFUbGfcokmwWgbO66a+f
	 HdGjCKikyvlZpq3vJ47kYD7Xt3wEWLpJpE5ekGucYfRx2Mx0tcqEoWBI23wlnf0J7q/1N7M94QkR
	 WvqwRoFi6IuonuXBq1UnT/wf5aZsN2XSzyPbtnvugXKXFh1ddvMh1Lnj5oz5K13rLdnv75AVUgba
	 Yu5sud5JSuIlVfsT9XAsCCzdxmWqwO8sJCKz+ol9PLQvYM9VTyU5Hkzy0nAEQvjoxD+WDkqyDpjx
	 eUPfrmReCPvhvtoj0MBkMQoKoY7ewSY0L1yVzapwz1AW9HP1ZeoeWvSM3DJ1hzfUaJCWKra4/xaD
	 LcifQ1H10kW4yMsmD8dQz5kEH4gYFg0lojl023Qou7ywrEN0uxhA2T5MqpuS5dVbI5bEeZAwb8rS
	 hi/nM9pg4pZs1WVkIAaf1AXqmrxtW0UrM4bBmHZjMFmNsd2Gu6zhZR5MD3YHoDkdFz5xxnnmjiKW
	 0YSPABOoG/9eUV8x47gFw3qqBTITNc9BzGJGZvy2bv51wmTPG1FSxQ5bOKcixTFnlWlPmp5cVO53
	 2KBVfVDg0K/uIddWMKbxTQZ23VNzL/ks8GYX88R9hAj7AeDpX/aKbQQSAnrbiVHqAAW1hLW+Tyq7
	 BuO8K8nL9bwFphh9T2AbwU+dznVXTYnw2vKNa9Np+4fphNS+2CiSw418CGAueIr2/JZqbuhd1whI
	 LMtutB1YZdgC2cdl545YFKzvXMzHoPmn7myG8QrFaKfuxz+QiTYvS5AhNGyZBFXQwFMc8TsNVjHS
	 O89OXMz2ZFnJinPw/fgAEfk/xpsLgpq/ku8Xva+gq6QJJxVJff9Iwu5VhBQbIZEnexMnqP0UVVFm
	 meeqHtmKYEv4eEKhHMKKdqaGtXswShEQtqqQeB2Q06knSj6hJWb9k/pG7AqHMZhSU3fwcpC3Q7mr
	 AGNAB991WdLLTDGUT4quG8Vzs8L3xobL2JmdZqLZK9ojDvvBCR/sUrFGA3TTHOpXuhpEE+R+LD23
	 wht2/PX3/8eMWajK2Khpgp2h/r9BI=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: fujunjie <fujunjie1@qq.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	SeongJae Park <sj@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	fujunjie <fujunjie1@qq.com>
Subject: [PATCH] mm/madvise: reject invalid process_madvise() advice for zero-length vectors
Date: Sun, 26 Apr 2026 11:08:22 +0000
X-OQ-MSGID: <20260426110822.2750927-1-fujunjie1@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

process_madvise() validates the advice while walking the imported iovec.
If the iovec has zero total length, vector_madvise() never enters the
loop and returns 0 without checking whether the advice value is valid.

For a local mm, such as process_madvise(PIDFD_SELF, ...), the remote-only
process_madvise_remote_valid() check is skipped.  As a result, an invalid
advice can be reported as success when the vector has zero total length.
This differs from madvise(), which rejects an invalid advice before
returning success for a zero-length range.

Reject invalid advice before walking the vector.  Valid zero-length
requests remain no-ops and continue to return 0.

Add a selftest that covers invalid advice with a zero-length iovec and an
empty vector, while also checking that a valid zero-length request still
succeeds.

Fixes: 021781b01275 ("mm/madvise: unrestrict process_madvise() for current process")
Signed-off-by: fujunjie <fujunjie1@qq.com>
---
Testing:
- Built bzImage.
- Built tools/testing/selftests/mm/process_madv.
- Ran tools/testing/selftests/mm/process_madv in QEMU:
  # PASSED: 7 / 7 tests passed.

 mm/madvise.c                              |  3 +++
 tools/testing/selftests/mm/process_madv.c | 29 +++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/mm/madvise.c b/mm/madvise.c
index 69708e953cf56..83fe9e651a907 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -2046,6 +2046,9 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 
 	total_len = iov_iter_count(iter);
 
+	if (!madvise_behavior_valid(behavior))
+		return -EINVAL;
+
 	ret = madvise_lock(&madv_behavior);
 	if (ret)
 		return ret;
diff --git a/tools/testing/selftests/mm/process_madv.c b/tools/testing/selftests/mm/process_madv.c
index cd4610baf5d7d..9a7e2788fcc50 100644
--- a/tools/testing/selftests/mm/process_madv.c
+++ b/tools/testing/selftests/mm/process_madv.c
@@ -309,6 +309,35 @@ TEST_F(process_madvise, invalid_vlen)
 	ASSERT_EQ(munmap(map, pagesize), 0);
 }
 
+/*
+ * Test that invalid advice is rejected even when the iovec has zero total
+ * length. A zero-length advice is a no-op for valid advice, but invalid
+ * advice should still fail with EINVAL.
+ */
+TEST_F(process_madvise, invalid_advice_zero_length)
+{
+	struct iovec vec = {
+		.iov_base = NULL,
+		.iov_len = 0,
+	};
+	int pidfd = self->pidfd;
+	ssize_t ret;
+
+	errno = 0;
+	ret = sys_process_madvise(pidfd, &vec, 1, -1, 0);
+	ASSERT_EQ(ret, -1);
+	ASSERT_EQ(errno, EINVAL);
+
+	errno = 0;
+	ret = sys_process_madvise(pidfd, &vec, 1, MADV_DONTNEED, 0);
+	ASSERT_EQ(ret, 0);
+
+	errno = 0;
+	ret = sys_process_madvise(pidfd, NULL, 0, -1, 0);
+	ASSERT_EQ(ret, -1);
+	ASSERT_EQ(errno, EINVAL);
+}
+
 /*
  * Test process_madvise() with an invalid flag value. Currently, only a flag
  * value of 0 is supported. This test is reserved for the future, e.g., if

base-commit: 1b55f8358e35a67bf3969339ea7b86988af92f66
-- 
2.34.1

