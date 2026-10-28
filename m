Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218067;
	b=2MqaFRnIUi/W0G8p/raqyhWe/aAfH2By5I9UfLqUL3rGQYilX08UtvIYsEnH0la0cm3G
	 z7hioduBLYIPPV1qoIlqo0ZQSKr+OG9wQdYv9evILhQRTpaEsa++Xo6BpX6o4uxd4Csgm
	 5UmJXAKgzeBSqkYqcmUaTJU6bFWLBzZrqqydWMfJHhFj5LORHjikGX2n0EF4sw3C5FdPN
	 QQtlZ0mmWloM7gXfDiKzVQkSg+OwUNb631h8cCq+p9bdzAyJBPAkINm1rUloSBBMIgH5Q
	 uRzZUCHvjNO5PyWZqyYtNX+goghAiyAAqLWde6R6ubdiRXp6QJi9dpJQpuYqys/oVuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ED2rbpiFDY/9XXMCuu1u7PPv2hXtvz6t2MsO7HwHCvo=;
	b=LUSXHeLtROVhTaxKgONRIK+T1i6TQDRvFzK2dnkHooir888EFCclHlq8Ce1vi8HOlq2P
	 OgL4ykl3K9zYIIVFv1YcLJoU5hHECIXhnUp70Kek5yVHtHpvcV5qyyoed452+w0xz5IV1
	 D9iLQ85PzMEB1S97f5kup5rsUOBFPGu/A1haB+ZzNwYmQ/0iUFSz7XUcl3Ph22cnyyCgz
	 VjvLTlCy2VYTK/SZBeSP2ORbaeTptrK6CGqtIz87D8WdLRC0pW2PSy8rDk8ij8ZVA7G8a
	 59UIGdtMZHKJDukCtiJJiDXwllW9T5lmDrospmHkkcexf50fjZ/fpNbqZjpA3nKQnTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPh76Kdi;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0771606A31D
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 20:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0771606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPh76Kdi
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-705cb6ceebaso924665eaf.3
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 13:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218066; x=1793822866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ED2rbpiFDY/9XXMCuu1u7PPv2hXtvz6t2MsO7HwHCvo=;
        b=OPh76KdiZQKzry4Jqau0yFJ65ZQBUnPTjrYGusysxGpQ3ESNQcQ5Dk4FA64sCq0bjb
         JpIv9mfRCyVN1pN7VUzVlRDAMKCGRuRymWPchH4YYhFX4LmMhbFt5mLw2vkIMFTNhQWQ
         QbDwmGthM6RxInXztn+z/UDpeTWB9NpA5xYEWHaF7/RBbKIc0M13KQYqsRmqlSjbTie4
         IMOUokuYdYkSha4miLFMBifcYX7zYr0WouOfIL8TtAuhhanCKMsuie2FCsWer8xtWdgS
         IPAhJH05SfUw3b1v+H4yk2qpyVvfbKiX5bHqN4u6fGDnKmKcsZ9CkN4jTJ9EdTN5QvPj
         va9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218066; x=1793822866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ED2rbpiFDY/9XXMCuu1u7PPv2hXtvz6t2MsO7HwHCvo=;
        b=TbT/0rIiDCyt7ZCuL5tV4Q32G5JkuzGZutczuewd+qgwND865YibK6842213XbFpr8
         p0QdSSfNJZ8rRnxi4BFdQb8EHUWf0wkKdsEbqGVRGnFuAJ/kO73ZNAM1FrNKO1ctaMUu
         L7WBKDaslMPXTE5+KflfHiFjduKZVjdG7ymDwAuWpnW6T4Nwp2hr1OBEYjFW6nfSrdYI
         POAz9wvCzw0bwVW9nZQvj5Hv8M1QC+A3nKOzt5Dr4huf7XtBvyVwqDiiWhUOE55mF9hd
         g5S0EiRuSYMy09vYy9hN1Q6mR/y954u/mBqw5jhHdn5iwUOlLICudXzLd4mhME1CrGku
         8aBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzguSAEKtQlhvR71Vvy7eyuabjmai2MIfx/XFsFEW9ncLZi5okgSq5c61waadu++iUgO5R+f0yKy5ZOP9gOQUY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzUGIKwX9m6ic6ll70kf/+V3uhdib6seZkLheolUYD6wAwTvTf
	Q8Hd4jAj1Er3jibOYxy2I+Q3TSt8Y56fRkLG1Pnx7+YEUlrNgmubxd1D
X-Gm-Gg: AYBFou2j4ycI75G61LoS/nGYjXOtQS4EN3EejZybS2170rjVKhWDiDl7HVuBrdE7RMS
	i5EjjYLHanto6SVO1/ddFH0Pgh0B2b75nTsB3EGfHW3kgE3MXdQfobz/95RhZtCXEeqbIZTrhuY
	xnwlb51Mav6RDGcvumUtQaXVPuEclZXSLC0I20A2SRCyUJJeod69bOkVZoj/3p60r66IPM6B71y
	Dnqb2oFZ76zebWXv3SsatBQZovaloqZ2Y817AgIh1NovIHT1BZNgTZfnE1AhETfnhoM+svMs4GH
	rbCeC8rOursRqSPZGnG/sDOXU3ylBcWUyWcC6q2PFd56nE9CtjCikBCmY8bDrH9SUm67ff9tHgd
	m7J1du7wvDPUPouoLmcpGHbuRoo3gLBmcHADWtwWPhRG693yaR7tNE8SZ0qTMAjlkU5H7dIjDZm
	Co1tbW9BWAr3unh4R8zmSYhJpuEc6AuZQSDPKS/QtvMGpLNwa9TboQWjLQIxkCmNbcRLRtKFSJH
	U26o47fEcUjzGBdw2xOP2xfQmaiGgLhluL8aeV3p8SR8xM1XJqU7qR/op3PErlZS2/3la9Nj6+s
	pfAadlqjtrocHjPZv2WPPXh9i00DwsFmioQLujEPV39qIbGPQeLnoy2ABlNH94CVA+rT46vD8Ls
	KZWSGh/eCn0tK446+
X-Received: by 2002:a05:6820:3401:20b0:6f8:92ab:bb53 with SMTP id 006d021491bc7-713ef52f25amr1407644eaf.41.1793218065857;
        Wed, 28 Oct 2026 13:07:45 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142cc3982esm2275539eaf.11.2026.10.28.13.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:07:44 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 0/3] tools/nolibc: fix fopen() errno and "rb+" modes
Date: Wed, 28 Oct 2026 15:07:40 -0500
Message-ID: <20261028200743.154151-1-danishkhateeb03@gmail.com>
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

fopen() has two bugs:

- When open() fails, fopen() overwrites its errno with EBADF, so a
  missing file is reported as EBADF instead of ENOENT.

- "rb+", "wb+" and "ab+" are not recognised as update modes, so the
  stream is opened read-only or write-only.

Patches 1 and 2 fix them. Patch 3 adds nolibc-test cases for both.

Tested on top of nolibc/for-next 700ce4da6f6f, on x86_64 (GCC and
clang) and i386, and on arm, arm64 and sparc64 under qemu-user:

- nolibc-test, all tests: no failures with the series. The only
  difference from before is the three new tests, which pass. They also
  pass against glibc (make libc-test).

- Without patches 1 and 2, all three new tests fail on every build.

- On x86_64, a separate program opening a file with each of the twelve
  C mode strings now gets the same access mode from nolibc as from
  glibc, and the same errno for ENOENT and EACCES failures.

An LLM was used to help with this series.

Danish Khateeb (3):
  tools/nolibc: fix fopen() errno when open() fails
  tools/nolibc: fix fopen() with the "rb+", "wb+" and "ab+" modes
  selftests/nolibc: test fopen() errors and update modes

 tools/include/nolibc/stdio.h                 |  5 +++-
 tools/testing/selftests/nolibc/nolibc-test.c | 24 ++++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)


base-commit: 700ce4da6f6f172435349b687d2d916e791c6330
-- 
2.56.0

