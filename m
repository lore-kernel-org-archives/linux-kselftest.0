Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249513BFE34
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 21:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790370965; cv=none; b=uE7SA5R8oQ+b+f0aVU8zuwadmdcke3RCbTp9jJ4YspwDc5h89pDPqSwANFmf+SC4oqXPjLxDYf5uc3/Rul5DYzH5m/W9vWkKI2D2GvWuwfFjDWOfM+ABklkTfCbGNrVv60cEd35ThUsAKV6gNuDX4prN+Xl3KyaSUPE3/+vQhOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790370965; c=relaxed/simple;
	bh=pK9CkBADurJ3TQk2304lFhjwAUkCFus38zK6seCIVM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CRT3HhzPnPBCbn8ng33tdhEAFBpM3tiDc/s+/Af5DQLVzMqgmQiA8CTU27v2njwwiiXOw6gOJVvNmpwnQvB4UgWEyXiarfu50dBft38psZz5cuPZem8qOpBw8iXR0nbtG8yfWqAA2T/llg0BPKG4LJnYBYylRhVQSicfaqLuWBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEcRZr6i; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEcRZr6i"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccbd4773so544870fac.2
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 14:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790370963; x=1790975763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnh6yaJJMgo3tk2iOj4ZCEcBu2G6mNxaVghRd0egq9Q=;
        b=aEcRZr6iZW96FidiJY3RjAgV4NdcmjSrVZFE3jJC3GtnMjcfIuTqeDiDGxoxPNjW2W
         Lbu6zT3zGA0P7RkhMVDjIk+vgtHwBwrNpnZFMj0Psc4cxWjwpTMGtTnrly5fqBQgXtqD
         /3vMZuK+Uy3BkGgz46xKi0jJ7qCZHwPfsP19ofdsOW5XLebEQjfxN2X26TkLgeOM//O9
         1/YnyFBEut/OwddfC3PEKIBSo7orjrQRYvb2e3fJoBz8hI3T9Nj9rJIBOBb0Tkrtryt1
         /twd1lH5KcdKLDOpanJ8+Ehch1BqrEWGX9hBmWEaXsRun81lI/jM9O8U4ZtOxrWHzC5z
         numw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790370963; x=1790975763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnh6yaJJMgo3tk2iOj4ZCEcBu2G6mNxaVghRd0egq9Q=;
        b=GR+CFBrtVWaE+leHwffYf7BlG0+C0eYUpTutcNhVXKyK5Gj6E5hYSARXs4evwJvMDx
         cJUHplT+c7lG3OBM/aUzxXp2yNI6enBacDBndKE4FEbVYG1sUP5CbHnnulGbC3mFDUxL
         qVHiA6yVpA3xaki94tHOzKTuDbwroDo3D4yU+jCBoPqBA6m08BcJHxzOw+0XI9/PFvqo
         4EUuODtFN5sgaCFpHfYJsCY20lZkn1TT2xwXn94OxEEPRaUPE0ybQT9Ilk8loIAHzq4o
         TlhrLH0d2L8icDvm0rrEt4UMbv7A0ehpAuV3kXLZjmIbJBPYnN8YZO7LFFa0ksMcB8KD
         vvJw==
X-Forwarded-Encrypted: i=1; AKwUvBy5Qz0FY8rm4UdwgrTWhVTI1bs+UDumZUszwamcXKTtoq7vPYUz0W7JSRL2rAC5nJptWWfDODLMMz50cMrnndM=@vger.kernel.org
X-Gm-Message-State: AFuF++l8qmx+PjHr9zvEx6ABfFZNrAOpTPDj2BL6wrwxkXFIeE4YGhF5
	s9TccH+Q2lprXc6dPmlSwea6qfoLabm6ITIjJMRvrm/RXdQ5skfWEJlW
X-Gm-Gg: AYBFou0d2cY/9Gyxug0YWsIC5NL7wuRUTfn8gY5F1XnMZ+zdnPiHM5oKhvOXqYPqkDo
	t9bG/mtp2wMMV9fxX3hbnB/D6xmTExWVrmt6BgxMIyJQpEe9bZtjRZLfcbJEs91pAwDNiMNAmi4
	OJkf8BDKsxeQ25SOz/KP1ZNQ9Hn1gRY5c+lNECGEX+wxt29dRK1Q4aN2DDsr0kzxXegnjVug324
	12SZOpnm9X3uwaRchO4kmEicSBQwW5EWjyWenbepmRkAPlBvLIcqpFeMhxFXO2Qn/f5fl5Q7BMG
	753/AVfeyW9rSmQnGEKMzVu8Ex2P7Lp1aARpDVvvwUc8YdQVNHKnJywSCqoad3qos4MXeTQsZlB
	YqIJLW/rhChFmkGqaKUyIK+OurUcdx/8qv1ObDaUZBukWzVMP+jdk+wi8xIG6K/oFFc4B4CJNS6
	pHd5Ibe0o3ieviJqwe1pGcFyS6AdoCkhfsmiVR33or3xKNgaytU5xVO6aN7gkyPLTBbzu5OmDEb
	aK2uWVz3G+rGIxw8yhzcUa1P8/acbSOYQG4Yhor
X-Received: by 2002:a05:6808:1920:b0:4ce:a4fc:a848 with SMTP id 5614622812f47-4dc57e294d3mr4141411b6e.6.1790370962713;
        Fri, 25 Sep 2026 14:16:02 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d72057sm3066734b6e.6.2026.09.25.14.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:16:02 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v2 0/3] tools/nolibc: fix readdir_r() and the FD_* macros on 64-bit
Date: Fri, 25 Sep 2026 16:15:57 -0500
Message-ID: <20260925211600.119116-1-danishkhateeb03@gmail.com>
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
  select() on fd 40 fails with EBADF. Patch 2, with a test in patch 3.

There is no selftest for patch 1: it needs a directory with large
offsets, and nolibc-test only lists /proc/self, whose offsets are
small. I tested it with a small program that lists a directory with
readdir_r() instead.

Changes in v2:
- Dropped Cc: stable from patches 1 and 2, which are otherwise
  unchanged.
- Patch 3: dropped the select() test, and moved the FD_* test to the
  stdlib tests, with its helper in the same order as the test cases
  (Thomas). It is also shorter: FD_CLR() is now checked on a set
  filled with memset().
- Rebased on nolibc/for-next 6f114ae7b600.

v1: https://lore.kernel.org/all/20260924015222.31693-1-danishkhateeb03@gmail.com/

Testing, with GCC 16.2, on x86_64 and i386 natively and on arm, arm64
and sparc64 under qemu-user:

- nolibc-test, all tests: no failures before or after the series. The
  only difference is the new fd_set test, which passes, also with clang
  on x86_64 and against glibc (make libc-test).

- Without patch 2, fd_set fails on the 64-bit architectures: with the
  default UBSan flags the run stops at fd_set on the sanitizer trap,
  and without them the test reports [FAIL] (checked on x86_64 and
  arm64). It passes on i386 and arm, which are not affected.

- The readdir_r() program, on ext4, on x86_64, arm64 and sparc64:
  before, it fails on /etc after 4 of 215 entries, /usr/include after
  1 of 1467 and /usr/lib after 2 of 6229. After, it lists as many
  entries as glibc. A native i386 build was already correct.

- Built for x86_64 against nolibc from before commit 4ada5679f18d, the
  same program lists a directory holding "..", "code" and "." as "..",
  "code", "code".

Danish Khateeb (3):
  tools/nolibc: fix readdir_r() with 64-bit directory offsets
  tools/nolibc: fix FD_SET(), FD_CLR() and FD_ISSET() on 64-bit
  selftests/nolibc: test the FD_* macros

 tools/include/nolibc/dirent.h                |  7 ++++---
 tools/include/nolibc/sys/select.h            |  6 +++---
 tools/testing/selftests/nolibc/nolibc-test.c | 21 ++++++++++++++++++++
 3 files changed, 28 insertions(+), 6 deletions(-)


base-commit: 6f114ae7b6006ca7cf72e3e3348d263bbfec4525
-- 
2.55.0

