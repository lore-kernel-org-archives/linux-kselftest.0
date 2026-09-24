Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A172DF6E9
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 01:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790214748; cv=none; b=e0kBY3V/97s3YXGWBI8p9POazHD1DgXUx12JOFipLtNvcflUnsS9l3KU6ffIO66quq4OfpspUvnSXuO48GIhBkVGVQcx1VAdmo+jHsJJgfAj/XX8G/zEsf9VLgph7g0L5eyinKbuSeg85XNw+l92XT74ThE4e7nutDSFfqgp0uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790214748; c=relaxed/simple;
	bh=2AN5JDexXR0M5Ug219+5M3aW0kSIne4l8lhwTAqdt58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jZZqbhVc4tot2dG0F4786e19mDndVBg9pMFVzrwh2ReI2CSPZvJOHqsNKkOROGq6zwv+UZC9mCdNUXa115N85qhqt2bp+vMXx8SVB9z0tJ004YyqKSaR1DOxsfoxLqLAy9dZG1RaBHAYXWTv4Yg38MLSU6TmsrWXYn7cBTXILvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKJkSc4p; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKJkSc4p"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc88a0d7so1102648fac.2
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 18:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790214745; x=1790819545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t12Cm9dzTRFqVp9C1qDd5ZGEFH0SLV6oC9VZTij9C0k=;
        b=FKJkSc4pf2h9W646Wn4nJIa1ZNJUnAs/RtmGaWSQmd3D6wdGiGXQxA/fF9v4z8RL6N
         q6E3h4qrcbKsk/W20sJw0Od6cncOpaXBZh2DFZtv2js/0zvobPDXn9hg0uT43wdegWjE
         sinyWFjGHsQ8lhl4mUI/ICtFXPiUyg7hDvBudBfyVKyGq/U3TKbYb/Zb6xCs04Wx2dz3
         QNKWOIh7ciP9lz+B/HC9QlFz27vz83Tfv0ID45YjrMr8BYE84sPwa0AcE6+iGk2YK1rq
         x+v/8G1fwsGUMRk/oNoyv1cfVYHOkZQK8ptEJFrxSIt2EB7K13XSQYjGbH6cWThfo08t
         sONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790214745; x=1790819545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t12Cm9dzTRFqVp9C1qDd5ZGEFH0SLV6oC9VZTij9C0k=;
        b=VtZYN3+MbOaSm5ieUqICl5HsXW9Qd2iF8gpJtcgbRAs5pCET4YQ4UXzwzlotd/PtNf
         8NlD8BGo91ryjbMvjJci7Lq5MLu6KYhuM42MYW5fbG1XEjjm2PmfHK7rwEPCtU5V1bWv
         OYRX+Fir83k5R8JptF9i1gABG14CeFqadYyx1KRvG2NYDuwYMFQPAXXfwRV0TuhsyYgI
         ATksi8f9NtgKPLXbrBjnk4zGZecBYQ6L1zR6MA3X+fVROgJbcj9YWJZujTBDAdjVRnPt
         dYp9dXZFYhql7z6yJU27n2/1gDGzyI2I2Cobp3Nh5Gp6QBD7UG28AsVVXmqZ7+Bj7+wJ
         pxwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpX8tRxwufhJx0rgSsLvF+asdBoOUefSyo3PdB9WIRkZPuIhc7wcR3Ibf3As+W0W9vDa3nPuTLk7GT3TX54T8=@vger.kernel.org
X-Gm-Message-State: AFuF++lXvAtS3dY/YgtQp55J6O5Y/u0eNWmlpu4nlrGnCcsvnHP+0hZF
	X41DyrzvEPIr6yCZ7SKEO4irpGnappWnCD77SgPMM6L77FuNvT+f2c16
X-Gm-Gg: AYBFou1ff9BTbJ7UmtGrxdiDdJP29CjDF6eA0IM3jlhGRLvLbqZd7LpQ4qOYQQzeVhq
	BiILjhUaDga4zxGPNNq8ggiCY8HY19mB9KQEXnqX+t40YLwOnu+eNlhZJq58g39/LYkB8bGUC6n
	GwDN1QSDBo70s6NdWnwY44/+ne3mv2TSaSWkg1YHDCksdwQr5rt4sBhC6iIEbJy0H+yuPBVLEKi
	wj3/WVQDZUQ+W9xqACQ1jJxT9oDjLWDQuZMIpLWavemO3hNRQsC5NwWn37DOiBFuV+da7NVmQf4
	G6iWeIJIa+uLgUdUglnBDZDMu5dn5DfdBbzsxmgDpsegfOkHbWsT8oNs6f1hbvMnHb30ENWqsEl
	dEP8Awmoa5bpT7krnV8p/Igq0UVCXjmkZgyTx/GNYOE/2wZMcXCqPmGlcqaX6Up9xRIis1569JN
	XbcmrfLDV4KcNdWPnwhX9v+1V0ZDUIMMJ3miY1E8ufBtsCkAIMmakElEtzAQNjfuXa7VImgcpwK
	RiFrs9u9f5QVDtwgnftfn2ewd6iD7zqfjXKpf/R
X-Received: by 2002:a05:6870:ad0f:b0:491:47e1:6283 with SMTP id 586e51a60fabf-491e59d1afdmr1152781fac.27.1790214745549;
        Wed, 23 Sep 2026 18:52:25 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-491ed1ebc62sm1057379fac.3.2026.09.23.18.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:52:24 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 0/3] tools/nolibc: fix readdir_r() and the FD_* macros on 64-bit
Date: Wed, 23 Sep 2026 20:52:19 -0500
Message-ID: <20260924015222.31693-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two bugs that only show up on 64-bit architectures:

- readdir_r() truncates the directory offset to an int. On ext4 it
  fails within the first few entries of almost every directory (since
  v6.19), or returns the next-to-last entry twice and never the last
  one (v6.15 to v6.18). Patch 1.

- FD_SET(), FD_CLR() and FD_ISSET() build their masks from an int, so
  they use the wrong bits for fds 31-63 of each 64-bit word, and
  select() on fd 40 fails with EBADF. Patch 2, with tests in patch 3.

There is no selftest for patch 1: it needs a directory with large
offsets, and nolibc-test only lists /proc/self, whose offsets are
small. I tested it with a small program that lists a directory with
readdir_r() instead.

The series applies to nolibc/for-next f2212892b6a0 and is independent
of my WIFSIGNALED() series [1]; the two merge cleanly.

Testing, with GCC 16.2, on x86_64 and i386 natively and on arm, arm64
and sparc64 under qemu-user:

- nolibc-test, all tests: no failures before or after the series. The
  only difference is the two new tests, which pass. They also pass
  against glibc (make libc-test).

- On x86_64 without patch 2, fd_set and select_high_fd fail (select()
  returns EBADF). With the default UBSan flags the run stops with
  SIGILL at fd_set instead.

- The readdir_r() program, on ext4, on x86_64, arm64 and sparc64:
  before, it fails on /etc after 4 of 213 entries, /usr/include after
  1 of 1454 and /usr/lib after 2 of 6186. After, it lists as many
  entries as glibc, and on x86_64 the same names. A native i386 build
  was already correct. The arm build failed too, but only because
  under qemu-user the kernel sees a 64-bit process and hands it
  64-bit offsets.

- Built for x86_64 against nolibc from before commit 4ada5679f18d, the
  same program lists a directory holding "..", "code" and "." as "..",
  "code", "code".

[1] https://lore.kernel.org/all/20260923205622.1123270-1-danishkhateeb03@gmail.com/

Danish Khateeb (3):
  tools/nolibc: fix readdir_r() with 64-bit directory offsets
  tools/nolibc: fix FD_SET(), FD_CLR() and FD_ISSET() on 64-bit
  selftests/nolibc: test the FD_* macros and select() on a high fd

 tools/include/nolibc/dirent.h                |  7 +--
 tools/include/nolibc/sys/select.h            |  6 +--
 tools/testing/selftests/nolibc/nolibc-test.c | 54 ++++++++++++++++++++
 3 files changed, 61 insertions(+), 6 deletions(-)


base-commit: f2212892b6a0c2adab438783e9fa8093c90786d7
-- 
2.55.0

