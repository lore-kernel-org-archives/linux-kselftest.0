Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EDD34EF04
	for <linux-kselftest@vger.kernel.org>; Mon,  5 Oct 2026 06:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183188; cv=none; b=ZayX1TPgxqs1yCJKOfXgNnqM0br+Im79Tex7fpGkeqRGlxHBrR6LjoxGZ8DmKzA1Bow3LL0SGY4rbDhu/VEdY4s1skUXr3lX/go/yU9eiO9czuxhroOTMpR8pJzvIahoML4U1N28Bg+4wCg3RVqzOmTYlKgAumLLQTGzC5vxd6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183188; c=relaxed/simple;
	bh=kzrMF3ZVCeJ+AX/Q0Wt8VSe/IHVxnFDYfEawSK8ROl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sp1jNZbqv0QbhA+1ewnAjABk0nH6eW0csvce8Y/rV7upJdg/ULCcQP5TWHxyUye1najrV2L/2PgThmviH+Myxm4AxSJFlxbybrnBRO+JSwuBCCC0w9V+NoELh0+Qsv56H6WrUOpzcZgwBr9kqyZO+q/UOleHkwSrU14egtyY6ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IH7pAhwO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IH7pAhwO"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1626d6a6cso7894735e9.0
        for <linux-kselftest@vger.kernel.org>; Sun, 04 Oct 2026 23:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791183185; x=1791787985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3qCoCe5HgkC4I11/aszYLTcw78qjIhlSBPgmqbtI6o=;
        b=IH7pAhwO4c/ZHHo6Z1nFbvh8MJQzvRh8i2GB9yrpMXmKHWfv0L7nfbg6M9NeBcHM+J
         ySDp5PVsNvFBlAwPHhrVvZurrNChGJxHo3EUCmiN7+n3uT/1VLWEeH6zrLSm+zh34F22
         jGLp77SL6lBvNWm7oJ5jizqsIdf8WMEAPxmi1/+StpQsRa/05kYg6ItVu+2qgb8AL55T
         VHTNO7TZ+MRsj8Q3DEB/hl0B2ZOnE31bbAUB9L+OQyMQTmiitavNnxL3DAOfxeN4rtkx
         3yk7qbrWaLDc3RQeGxFh98w21p6g5MXbzZKHfooR6OQoH7aGdZIJA0Zm13oaQEzt5e5D
         T7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183185; x=1791787985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3qCoCe5HgkC4I11/aszYLTcw78qjIhlSBPgmqbtI6o=;
        b=IMlBxRionc7XXJYQmEzCfW3YqjQFhFhRmxCLFec5yRlOy7pvKRE1zSK/8s6/FdkYgh
         K4S7ioU8ubtQBhOUdmcfX5YuaVf/V8/0mEBYSya649saO3RIVktvM8t0w820utBiJ6B1
         1C07QQ0XDFnQ9z+QhsyLxkEwGSYznCXL07lU0eX7B9h2A6uCe3G8w071ERE3JFH3/b+n
         Defk5owNGjb0jRiOWcQgKNrN35/f7bDnp0ys+iRrHPqLTS63bIXVTvBqYf3xG/Ytuod7
         KmTp0xaw0V8XEJVo/HMQD8XzjeD1HtGzEVpX9sUc62CZlUVwLFgjFBx81zo8wXr2A5sj
         uWOQ==
X-Forwarded-Encrypted: i=1; AKwUvByQhB6dG7NgXC7NQcisdl8J7VRBvy1/CDdG36VvQgfsmj3c9ywr2uDwQuxfvHYljeXGmghlLfrYYvnK5eB2EJU=@vger.kernel.org
X-Gm-Message-State: AFuF++lf589WPOC/BVMD6ei9l6bGFXyOd+/lsSXnN4WKban6V3oXX0mN
	YTsnuF5Ofg0rmRl/NQ5Y0c1ly1Gm0+8t0uWt2/gOzvX5p1IP4ERMxXoe
X-Gm-Gg: AYBFou3TBi8v/t/VG1KRp7tgcK/LTJToEz7nBgRP+1+Poqivnl3oDdk+SIoMTaEiait
	lsXyM/9THRwtAlDwDXa0gNZvrPfjoBuVpblyjWcz5GL42EJlePS54e4CprUPTLq34VyASOMeM98
	Q/hGi94yYdnv0LBPs4hRhZ6PCTxGGY5NSQ5lX1I1yxljJdqxntcuAoVBRo2qNHhis3VElkQCRKA
	rCC8yioEdqU14SqMLOODZa5H2zA1aCKmqhNi95a4GvNHpeI4zdXmIcgx0ElLoABwRZjTYDzoGmi
	Pc8XnW3O0ocUfLGTA1q443hG4LWk6a3id2fzjoh1lV+MOz1oV6MjGsgkeHYX07p1FqQXSQPn1gm
	AWlDZcI/3XyriZHsKVhejoFSmV+QS3p5jIEM/3D/WrAQ9ydkZhnD1GbJLIAmu7jWM7XghvNCU1c
	ARHtuUwXEkFRL/WFVViEK8hu21JL3o2Xxmx2EjaHIbWzPOpewrluNswIk=
X-Received: by 2002:a05:600c:a116:b0:4a1:6517:ccf1 with SMTP id 5b1f17b1804b1-4a1680e9524mr72604545e9.9.1791183185355;
        Sun, 04 Oct 2026 23:53:05 -0700 (PDT)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6308481dsm1247436f8f.3.2026.10.04.23.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:53:04 -0700 (PDT)
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
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Park Tae-sun <ts930@dgu.ac.kr>
Subject: [PATCH 2/3] mm/mlock: reject ranges that cannot be represented
Date: Mon,  5 Oct 2026 08:46:30 +0200
Message-ID: <20261005065244.6935-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005065244.6935-1-azpijr@gmail.com>
References: <20261005065244.6935-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A length within a page of ULONG_MAX wraps when mlock() and munlock()
round the range to pages. At an aligned address the length becomes 0 and
the call is a silent success; at an unaligned one it becomes a single
page, which is then locked or unlocked. An overflowing start + len is
only caught in apply_vma_lock_flags(), after the RLIMIT_MEMLOCK check, so
mlock() returns -ENOMEM without CAP_IPC_LOCK and -EINVAL with it.

Return -EINVAL, as man 2 mlock documents, when start + len overflows or
the end overflows when rounded up to a page. Doing this before
can_do_mlock() also avoids making the result depend on
RLIMIT_MEMLOCK/CAP_IPC_LOCK. Requests that get a silent success today
now fail.

Reported-by: Park Tae-sun <ts930@dgu.ac.kr>
Closes: https://lore.kernel.org/all/179066531783.50175.13377521828379196177@dgu.ac.kr/
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 mm/mlock.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/mm/mlock.c b/mm/mlock.c
index cc28e5d7413a..a9e2b90c058f 100644
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
2.55.0

