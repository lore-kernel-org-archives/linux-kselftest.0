Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605466;
	b=KMwB0r7TyfuXJ6YZSvyMIaYK+sbyBtcJCQ5rpHkBkn1//TsYvBaiDsZo7rvntgZ6HpcH
	 7EeR16vtjak4MBQbrYMYE1K78zpE09rLZbpLGHFRoSmMPt+jd+1u1Sq7lP3ZJg1KJdk8O
	 qworIRYEJOvMfamtr5fwXu+xnl4EUqxbN8lF/KiX322D2pG/CoqurGPfHK6TPXLX34AL5
	 K4eMgkKpIzjjvqatu60Rri2JSnWYYfDpX+DIk2Jr0z0hakyR68fCsjnLjmqu0pgMAJ/9I
	 qSOukCsT5SuVmE76/ajTS80T1C6pMAZG34Sc/XqGGeO8J9jbfzjMm4m45hiY+wIWXTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=frsPb1t3Wa1UoN+W1OLcN+MUypjNEa6QpG2s8csovOc=;
	b=apkisi8EXHA4H3JwGtk4BeJo5cos/cLzErrNs9FecsuCjdlyMHzz+s5zECxQNXIiGBOp
	 96SxfoXHXvAaAUdPWW9478fgnraHCcKjsiivYcZWN02hYTw5IUjXszCzHGGfORWC8G3t9
	 qKiiluq7OdeevLjmvMwh2MyHRa5+gKfDShq0gncMEgNAWTtbKvkMvqbAUQCJj6NTzvmCe
	 JTaVBveVyrFFogK6NXkuRY3hyHW7bFnaiXqv9/qw9XxiNLgn1KZa/7vKzShHFNUOEtuGY
	 DMGrhpYOX/8VYHcnEpGc/gbm0vrGkZngVmLG63cZePGqX0chbr9eXP4OhEIWUuOzWyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJ+cDcAL;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBD6606A33F
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 07:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFBD6606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJ+cDcAL
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1806696f8f.0
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 23:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793605464; x=1794210264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=frsPb1t3Wa1UoN+W1OLcN+MUypjNEa6QpG2s8csovOc=;
        b=HJ+cDcALq3xnIfz5alX6NrO8pJjmgk2lptN87Lv9/jmTYd0C8pjGqWCsPnsQnEFfIc
         5euRxL2BrUL2aSUkgYwLXwRP7ZCctu5IrmPKpKW7GynqOLnaZjgXlQIjlNqBhnP4mwL1
         +cvQ0Nv/F8WdxDo/MjyDGNymVkwMk6SquY8auEWQeUPjHYtExMe3rW5GAI2oF+uj9mp0
         bq2EjuUjcX7F3xx/ZrsCS+rEbt6D1tAk8pJmoWTlYIiPr2j67fUb7zHy45fa7Z7HpP4q
         e4646eu7GoZcH6b//6E1PYX57Ce4wYme0SB7JDWYm+WVcBBdWd+sdhipZELs0I2Y/uLC
         fMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793605464; x=1794210264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=frsPb1t3Wa1UoN+W1OLcN+MUypjNEa6QpG2s8csovOc=;
        b=BpInkFC6YLI1VNEnAh4OTt29wP8n2k5tsSNwHA/8QLUL+pttgIK6D2lU6aPK0dQlWz
         pFl1o7n4dU8KNqq95Ue5NSxEwRwmW06B9AuQuskmgkox+5ZuzkPgYUGQP3Cl7QadUihb
         KKHuIdAyO7+6RlTAknfcH+ha6yPrwP7fKdvUbA5a4VoXL9Qm5NVQwnHYSWhVCG8A5K1S
         lAwUZ4w5RHt0nAb2o9lE36eOpx1dAIdJg9j/NlZvHRZXL4we1EDFh594ChVEaVOoR61/
         NtwaVkdk6SkkFgcWQ5aOpiw6UY6Vyg+KVWaml4VvrFIv0cu/JWRPVTLHymDaYlSc9lVH
         Ajbw==
X-Forwarded-Encrypted: i=1; AKwUvBxQHPg4/MmsP6O0z3c1Gn8f9HxEZ6fFzYxWIIis80ChQa73t9Mh8ONCbQwTyPRFC33Y9FiozRQJ7g3B55RJN7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYILW6lTKw73aowjd9/sdsH9fJSSKaAiYq+ZYar6M2/A6qvgbJ3M
	dI78Gd6Ux3hHMUzR64rWv/pgSbK4+lWBQpekbyq+NcwCJRxBoq8MSmrA
X-Gm-Gg: AYBFou0daSOOtwcZ1rJF7OvcyZUCFgUj7df65zMfp1UAi5NSI5gKWtQeObpGRBG/G7w
	Trf4zxUpwcLfOHaett9N7+OghSnR+w17qczyN/IGjOf+93XuTULwzvYu8d7sqmNIWnb9pHDUuiG
	ZSfPW9Uy8SjPFOWOXnUbKrnMKFploAmLz09j3oIPO8MZri74jXL6BHSC9Vuubg5n3oPGzbiS1RC
	+tdVTcOjfjasNpyHq6jupVM9FvBe+h45vwfZ3BCRGInXd+PtNTxMbJOsLSxMUgyKzG6mrjhXE/0
	1v4i8Rl+xlcUeeuN065WUqh4xrGBwrUr0/yYCoPZn2kLs8I4ETirRIzh+RjcofOIhiou9KrP0kn
	pSb+KVY4+FsXUNJck6uztS9eUQ4aLnPTw7YwU62fVTbWuAi7oDnAHlTXe200IBIQ77x0AdnCgW7
	wOyUZYZcf8ZabG7SZlr99TCBabmviD2sy6Kg8Ot1Fhe5ep1XM9eTn0BWQptwOlxyeJmZmf51whH
	XBiDCGU5orbWTn6yQfRLC5a2NfXgbFjxRCufj/5WMRpisMu26B3+Ym2BMkw1NAYnypbK2eXPNVj
	MDrsof7HJRHHeQ==
X-Received: by 2002:a05:600c:1907:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4ac16fa15edmr211678515e9.0.1793605464208;
        Sun, 01 Nov 2026 23:44:24 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm18050374f8f.36.2026.11.01.23.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:44:23 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	ts930@dgu.ac.kr,
	alx@kernel.org,
	linux-api@vger.kernel.org,
	linux-man@vger.kernel.org,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH RESEND 2/3] mm/mlock: reject ranges that cannot be represented
Date: Mon,  2 Nov 2026 08:44:00 +0100
Message-ID: <20261102074412.189554-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102074412.189554-1-azpijr@gmail.com>
References: <20261102074412.189554-1-azpijr@gmail.com>
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

A length within a page of ULONG_MAX wraps when mlock() and munlock()
round the range to pages.  At an aligned address the length becomes 0 and
the call is a silent success; at an unaligned one it becomes a single
page, which is then locked or unlocked.  An overflowing start + len is
only caught in apply_vma_lock_flags(), after the RLIMIT_MEMLOCK check, so
mlock() returns -ENOMEM without CAP_IPC_LOCK and -EINVAL with it.

Return -EINVAL, as man 2 mlock documents, when start + len overflows or
the end overflows when rounded up to a page.  Doing this before
can_do_mlock() also avoids making the result depend on
RLIMIT_MEMLOCK/CAP_IPC_LOCK.  Requests that get a silent success today
now fail.

Reported-by: Park Tae-sun <ts930@dgu.ac.kr>
Closes: https://lore.kernel.org/all/179066531783.50175.13377521828379196177@dgu.ac.kr/
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 mm/mlock.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/mm/mlock.c b/mm/mlock.c
index 673a8433a0a9..0e9d8c110152 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -608,6 +608,7 @@ static __must_check int do_mlock(unsigned long start, size_t len,
 {
 	unsigned long locked;
 	unsigned long lock_limit;
+	unsigned long end;
 	int error = -ENOMEM;
 
 	start = untagged_addr(start);
@@ -615,12 +616,19 @@ static __must_check int do_mlock(unsigned long start, size_t len,
 	if (!len)
 		return 0;
 
+	/* Reject a wrapping range before can_do_mlock() and the rlimit check. */
+	end = start + len;
+	if (end < start)
+		return -EINVAL;
+	end = PAGE_ALIGN(end);
+	if (!end)
+		return -EINVAL;
+	start &= PAGE_MASK;
+	len = end - start;
+
 	if (!can_do_mlock())
 		return -EPERM;
 
-	len = PAGE_ALIGN(len + (offset_in_page(start)));
-	start &= PAGE_MASK;
-
 	lock_limit = rlimit(RLIMIT_MEMLOCK);
 	lock_limit >>= PAGE_SHIFT;
 	locked = len >> PAGE_SHIFT;
@@ -676,6 +684,7 @@ SYSCALL_DEFINE3(mlock2, unsigned long, start, size_t, len, int, flags)
 
 SYSCALL_DEFINE2(munlock, unsigned long, start, size_t, len)
 {
+	unsigned long end;
 	vma_flags_t flags = EMPTY_VMA_FLAGS;
 	int ret;
 
@@ -684,8 +693,14 @@ SYSCALL_DEFINE2(munlock, unsigned long, start, size_t, len)
 	if (!len)
 		return 0;
 
-	len = PAGE_ALIGN(len + (offset_in_page(start)));
+	end = start + len;
+	if (end < start)
+		return -EINVAL;
+	end = PAGE_ALIGN(end);
+	if (!end)
+		return -EINVAL;
 	start &= PAGE_MASK;
+	len = end - start;
 
 	if (mmap_write_lock_killable(current->mm))
 		return -EINTR;
-- 
2.56.0

