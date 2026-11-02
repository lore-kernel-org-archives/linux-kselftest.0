Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605460;
	b=eRZ/z4y5vRZVDfnXG7FcpH7hs+pNUXsuMwvaJb000SsXsUr4zu0ankT4Gd8DJToW9R83
	 VSMyqonYknmsithhLw6Zbog/8EjiSMkp2tm5PECfsYZF+zyND7VJtP+s5OUCXYPDgS6rJ
	 5pqvhjghublH1Yupy4KBW2XJ4Qfhkhvx8qkMQc5oApTXMVy0a8bBBUTjjVKaKJW7lDpVZ
	 FXh7411r9B48fYHSQAw8pbomwJiUPHlPlwuTHriOEXIUQHIptEyE17BnscOJ9QPLWSTkd
	 ReAXjxOfeqD0WU3KPAqq+yOJU4cte4/Kp7JJqEbRzRdjSAuHzI8A6tYZRzK24PXEqbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GMp9mcTTKC9DHoWvLxRWF3MR+m0EkCxt9LMLL8huxSQ=;
	b=e7Nd5nl1GmUfWHrg4MEINfmHmIcoNpwDQaGAxWnHE8EKlhiYvd/cxdW5ESLMzF38xk0E
	 +Agn9wUU+nKJbqNnC2s6bU198xrdI5goN/Vud4SnSXpe5Ox23ykPoUYJ4GNHWWTqjQwai
	 Csy7PI1y7aQgHKnTJj2VktPUp5GNjYXeDWO/bjoTtY0sOywwn2N6Z9ZTHE1AdKfW76Kj5
	 ve5c1Q7guWYWZdIvtHAk8DOTDHVnuzK7uzbitbM/Nva+Bt8J2jGG9YlrFLAy9osHtnXVV
	 6UwsKU/JHckiAqmQBNIwkLsuf0Iu8qYIHYlsFAFn96bxhMmGLlBd/R5+OX4RBjTQpKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OYjCNJ4Y;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDB2606A327
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 07:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EDB2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OYjCNJ4Y
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1802175f8f.1
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 23:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793605458; x=1794210258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMp9mcTTKC9DHoWvLxRWF3MR+m0EkCxt9LMLL8huxSQ=;
        b=OYjCNJ4YGN418aOh4vtw14+7AbwL7A3Ew1CDtb+YSuxsqDbyN3W3NuNSwtJa2wrcK+
         /0DbK6/gccivSLcebaEXKX+PuviBnQdEZl5rWvIUJE0+unubt6dYmDsFeZl5JUyTPfJA
         eb5cfsbZTdDxFpV9Z2S2YwoHdgZgDyswjQ9g1w13yyKdN9fbW7JBUGkDsTW8DY8T4vrO
         vxyyS3wp/hibMOyq4jZ+uN+QFFFQYYKjWb/9TtDlU0VZ5kIriHuMnnVNtNup9Q+7OoJQ
         uGL5ABBYMspVQzy6ukvZB69Smvf1uU8UokxPfb3jSB6aTAWGnHCzZPdyzW+aWE7smNI9
         qv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793605458; x=1794210258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMp9mcTTKC9DHoWvLxRWF3MR+m0EkCxt9LMLL8huxSQ=;
        b=xzEcR46o2h/SBZOhWmbQe5j+NDjN6ShwfLPJqAzWMb3XtGrFxpUU2v2E4ES9EbX5mq
         c96pFrodSWbvugXe/L35ebtUkQfYVLQrl0gfHuyD1ppvD1K/LGVcXoAyKQGneAwFSYkU
         zecxNCoXC762MHWd1pcOjAuQN8Sm6JjJe3El+Jzc0fL9WbpUCFbQZ0ClOx+CP9aMe0NB
         bwhav8Vg6t+4rGDLga5sJ7hYH55b1z73pNJ0wUQtKJU0Z3FAS6Vni8QK/rW8i6n3AuX4
         zNB7QMt9bW5uT67T26fj4E1x7pfEOgXeVMHoZcz1Inl/YbmA1y3DBUv0yvE1s1lpT4Sx
         nDmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuCQ2puvQ93V36/MkTeFqgs/4eU1lPPnkXNkAccN6K5jFQEnDl7GgWefV32ybSAfagaRSukcci36qrNlJBF0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z89pj6uf8GiGQNe3ZsD8v6mTrMyD61NR7cKrXrlDQ3ZFW2zQ0NI
	Srz/7PdIZ63SIz+OlnME1+9QgtCpcKcDDYRPD9L0OdE9z6ihqwbLjFsL
X-Gm-Gg: AYBFou0eI+lT5R2chdZOZworYw5o/vkrAiiJ7acZCxNjFIFDi9THHDPvT6jMUsjRoN5
	633Fiz1Oyksk7KhkgNk31M2LbLFDeFEzDm51UTAw+AIRR0HBV2Q0SYjB+NFkGHuAkMDFf2SNLgs
	OY3ZTbzuVbQLaRaXymz0UByOteK9FuQ3Qmfdu6EMt9+g226h8eMV+RER1f+PDNrD27Dvf4KLk39
	yyYiFzzSw4/g1/hUEo2PFpnHeECOB3uF6ZtnivyacU9XYo70TtxHi2nolbvCNl/1vAQY2qCft7q
	mn1HtMprfdR+Km+s7VL4neXAVdrhMugQ+S2dcZ+A2LYR0+QiXZ0lNB9OzZ51O6qnqyDG7MEHecA
	JIa87dIm3kMjq+fDju2+ur6CaHRwDAEPEaWHMQObOZ+fCwT/jrhMQ0CN4lxRO1xMsUqpT0+8Qmo
	k/OGUJo7A+mNa6Jox3WMH5h2GAQ3RpSNR5ROnq6uymFKSxFUCYYx6VZjMLQIPkMMg0EXMK4Otn+
	QjtHJ6bBA3hUNu0zn0/KkBen1qg8bBmo8fcbSNZPyvRPx+ibDLSVwsaFWbcSls7c4uq/26kxBZD
	FdNsF3pHzH5+Dw==
X-Received: by 2002:a05:6000:2387:b0:48e:20f9:8d75 with SMTP id ffacd0b85a97d-48e6e50b79cmr21195080f8f.48.1793605457581;
        Sun, 01 Nov 2026 23:44:17 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm18050374f8f.36.2026.11.01.23.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:44:16 -0800 (PST)
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
Subject: [PATCH RESEND 0/3] mm/mlock: make zero length requests a no-op and reject wrapping ranges
Date: Mon,  2 Nov 2026 08:43:58 +0100
Message-ID: <20261102074412.189554-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
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

No changes, rebased on mm-new, Cc fixed.

Follow-up to Park Tae-sun's patch [1], which was dropped. David asked
which of the cases it raised can actually be triggered, and for selftests
that show them. Two can.

Patch 1 makes a zero length mlock()/munlock() a no-op before the address
is rounded. Today mlock(addr + 5, 0) locks a page and munlock(addr + 5, 0)
unlocks one.

Patch 2 rejects ranges where start + len overflows, or where the end
overflows when rounded to a page. Today these get a silent success, act
on a single page, or get -ENOMEM/-EINVAL depending on CAP_IPC_LOCK.

Patch 3 adds both cases to mlock2-tests.

I could not find the commit that introduced either behaviour in the git
history. Both are already present in the earliest history I could find,
so they may predate the imported git history. There is therefore no
commit to use for a Fixes tag. I have not added Cc: stable since these
changes intentionally alter UAPI-visible behaviour.

The mlock-random-test failure CI reported on [1] came from that patch,
not the test: it assigned 0 to do_mlock()'s error, which has to stay
-ENOMEM for the over-limit case, so mlock() over RLIMIT_MEMLOCK without
CAP_IPC_LOCK returned 0 without locking anything. With [1] applied the
test fails 40 runs out of 40; with error set back to -ENOMEM after the
check_mlock_range() call it passes all 40, as it does with this series.

Tested on x86_64 (KASAN, lockdep) in QEMU: mlock2-tests 31/31 as root and
as nobody, 24/31 and 23/31 on mm-unstable; mlock-random-test and
on-fault-limit pass.

[1] https://lore.kernel.org/all/179066531783.50175.13377521828379196177@dgu.ac.kr/

Jose A. Perez de Azpillaga (3):
  mm/mlock: make a zero length request a no-op whatever the alignment
  mm/mlock: reject ranges that cannot be represented
  selftests/mm: test mlock() and munlock() range normalisation

 mm/mlock.c                                |  29 +++-
 tools/testing/selftests/mm/mlock2-tests.c | 191 +++++++++++++++++++++-
 2 files changed, 215 insertions(+), 5 deletions(-)


base-commit: afb4eea28037fa55c4560313ecbd8a1e1da8369a
-- 
2.56.0

