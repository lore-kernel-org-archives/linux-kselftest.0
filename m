Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97D137B032;
	Fri, 31 Jul 2026 20:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.68.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785530337; cv=none; b=kWa6kHd8Jr+s6eSOXhdI41cjlF7EuQPXLcOjoCf+Sk8GF3D1r7tJINoTSGH5Oniuuz+oisfcZ36sHlU1UmMqakU7bMToZxGfXkul3X2D/MhNRgG1GpPFw/YFACqMhNyoUbHr+C26yWg7iIGx2hAOeqWlGQW6k4onF8+DLGVNJo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785530337; c=relaxed/simple;
	bh=taS6rUdv5gSiPxqmImB/coa9UsW48A6kRT5CAj9t/V4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZhUF+R6sWM1a29fE7oRcZ68q8WKisl0bHGR406Ee0HoY7Foi2QxUJS7s3JNb6IoBq0iy5FIpIprYdZmd1R4X6n+KyMptKwaR4RP3pQDrxSn6BFZ1OK+e3kViBhfyVsCa7Vry8mWZ8eI4DMxZ0JWqAOlNqPstVdYMfRYhuT+3Z5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Zi6l71Ca; arc=none smtp.client-ip=44.246.68.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Zi6l71Ca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785530335; x=1817066335;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SnLOtL6OfB2jJTAGaU2rbvIii1GYRI8Lg0cDOKcF0mw=;
  b=Zi6l71CaYwK9vlvYBu8XfwWuyA/hvt5RjkkvxsBi17m84qMmoAslNMot
   QK9/pZz4P1MSsDwldIYrL1i5rGORNQAlhBa78ga8cjo3fmT6Y9R69Js6f
   j6sAHc2F4rrfLQwHDGrDY4w/LU6Wr+JaNJStIaloSR98L87PofnL6qnkY
   uqQ0nTzBd9loQaW4xBtyEItricZBc2bFFdS8aQLGqOthHuRSRlc93fsfm
   xuuulA9BJSI0Y+VJSpCh1mpp/v6LcC/SF3iVYr9wVk8zcBbkskaXWQXhS
   m4mTFcr4ls0Oijy+QRgp1KpdN8i7tMztfLuoH9sB/ME2bD3uxxvU2Gr8N
   A==;
X-CSE-ConnectionGUID: bz6HU1t+SO6baJcNZaqujA==
X-CSE-MsgGUID: 7urMvQkdQwyfJwIVGlX91w==
X-IronPort-AV: E=Sophos;i="6.25,197,1779148800"; 
   d="scan'208";a="24812452"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 20:38:55 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:9604]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.47.97:2525] with esmtp (Farcaster)
 id 50979d40-255f-4bf0-8f91-511eeb35044b; Fri, 31 Jul 2026 20:38:55 +0000 (UTC)
X-Farcaster-Flow-ID: 50979d40-255f-4bf0-8f91-511eeb35044b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Fri, 31 Jul 2026 20:38:55 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Fri, 31 Jul 2026 20:38:54 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Shuah Khan <shuah@kernel.org>
CC: <fuse-devel@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
Subject: [PATCH 0/2] fuse: zero the partial EOF page when extending a file
Date: Fri, 31 Jul 2026 20:38:40 +0000
Message-ID: <20260731203842.540798-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D033UWC003.ant.amazon.com (10.13.139.217) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Extending a fuse file past a non-page-aligned EOF does not zero the tail of
the old last page.  When that page is cached and has been mmap-dirtied
beyond the old EOF, the now in-bounds tail is served to later reads as stale
data rather than zeros, which violates POSIX file-extension semantics.

This is the same class of bug that commit b1817b18ff20 ("NFS: Protect
against 'eof page pollution'") fixed for the NFS client; fuse has the
equivalent gap on its non-writeback_cache, FOPEN_KEEP_CACHE path.
pagecache_isize_extended() cannot be reused because it is a no-op when
i_blocksize() >= PAGE_SIZE, which always holds for a non-fuseblk mount, so
patch 1 open-codes the zeroing and calls it from all three paths that extend
a file: buffered write, setattr/truncate, and fallocate.  Patch 2 adds a
self-contained raw /dev/fuse selftest covering each path; every case fails
without patch 1 and passes with it.

Tested by booting the patched kernel under User-Mode Linux and running the
new selftest (4/4 pass; 4/4 fail without patch 1), and reproduced against
libfuse's passthrough_ll example daemon (-o cache=always,no_writeback).

Jimmy Zuber (2):
  fuse: zero the partial EOF page when extending a file
  selftests/fuse: test post-EOF page zeroing when a file is extended

 fs/fuse/dir.c                                 |   3 +
 fs/fuse/file.c                                |  56 +++
 fs/fuse/fuse_i.h                              |   1 +
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +
 .../filesystems/fuse/write_extend_eof_test.c  | 368 ++++++++++++++++++
 6 files changed, 432 insertions(+)
 create mode 100644 tools/testing/selftests/filesystems/fuse/write_extend_eof_test.c


base-commit: 7d87a5a284bb34edb3f4e7e312ef403b3385a7b7
-- 
2.50.1

