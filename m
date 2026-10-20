Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.12.53.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505822;
	b=kyhfupCAGJA/0AyT3UKlrb5cGwTGpOS+LGdKSoUhl0bimbTVsIq7AU0aDbJU8poex8ZB
	 iRm3eBNLWPvK2J+vGdwdYDsd5W2aZvKqkbQNaXCMBrufQxsTteLotO7BCCXScp3+X/V/Z
	 0Avyawwx2F+bRVqiWQNarNyrHdwRxNVDFT/sHBmDoZ0cvzPz2x7w63OSU0zUTFR8MEZq5
	 tLazkZvtSMg+DccD5dCs5czVixuRchr5VZtRRKFB9SGYhzYq7Hyjmwja+q1mfcw7S0WVM
	 QTssQB7PHms7QgD5kPSmDU/2QdxTg9GN/r5MMF0LMsaIS2p2wus96OVyeDJmtcsTJjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505822;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=1/j36Ns/xac6BrGBytJDMDA9qFd8s+VQODaLnVagTk8=;
	b=QdtlGtVgqgKPaCutI42yVEXz//KL+rINp9lrEIpXXl2KhzlVQz38bDsNhHjxXYWa/44U
	 9zgNRswvI264jbbeTbc/AgDjkk/p5U3eW5ytO8M8c+B4QAw46mNy7STozE0nWWe2xtUGl
	 zxp/IvfKV1tfqlyXDwQLQmLOOC2hI1g/6zrGU+fXo7O72ASC/tURRRVyg98MAJcWKL8vW
	 DyXBCfZ3dz/AjnBa2h8Kb4INFH5lwM3r+MXNnqotleZ+5/Z3zqKIAhkIDXqwOwNVQ/Em7
	 sht9SJe25zPcN9kQkDIKyYVL269LoOj77zAzMT7jZNjGELEKv4na0/565WYPl9X1TZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=nT9lBKWR;
	arc=none smtp.remote-ip=52.12.53.23
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06AA606AA07
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D06AA606AA07
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=nT9lBKWR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792505821; x=1824041821;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1/j36Ns/xac6BrGBytJDMDA9qFd8s+VQODaLnVagTk8=;
  b=nT9lBKWRl6P2rvpvmzbXiz+wLalB3QIOssHtR1Q8kJq2wvoAFF1qbm/L
   xvNeYrwMv7ByK3stKAPMLvtOSYwnsgMCKGE+K2VL+4FTYcAPoVeXyacIo
   e1ko/NPQUssf84Nv/ZC7M62BcX3S39RRT9sP5FH2ZVC6tydCHG5fuSEf4
   Fzinyrke1PvCjIFgDcb3l7sB3OIAQHQZM5McqegegTxuvJu5YWM2+aDCr
   mdhmjykKd1CvsiNbsDRC4C/g2kq5ExiyUmIlARbbw/NDZKOs4LfZr8L+b
   9fAEv3vYxKyDjc+bthor9MZUMBvfqyuBL8DpbiWotNndLE/zSApZ0D05V
   A==;
X-CSE-ConnectionGUID: 3jHFcu75S9Sw7ct6Y+lgsg==
X-CSE-MsgGUID: TTft6wITQVK3lyoFD3fkGA==
X-IronPort-AV: E=Sophos;i="6.27,168,1787011200"; 
   d="scan'208";a="31620176"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:17:01 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:23039]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.19.38:2525] with esmtp (Farcaster)
 id c73c3737-0fb0-4e2b-8039-b70441fecfb3; Tue, 20 Oct 2026 14:17:01 +0000 (UTC)
X-Farcaster-Flow-ID: c73c3737-0fb0-4e2b-8039-b70441fecfb3
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 20 Oct 2026 14:17:00 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Tue, 20 Oct 2026 14:16:59 +0000
From: jamz <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: Jimmy Zuber <jamz@amazon.com>, <fuse-devel@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, "Bernd
 Schubert" <bernd@bsbernd.com>, Jim Harris <jiharris@nvidia.com>, "Horst
 Birthelmer" <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>,
	NeilBrown <neil@brown.name>
Subject: [PATCH 0/3] fuse: atomic open
Date: Tue, 20 Oct 2026 14:16:44 +0000
Message-ID: <20261020141647.3271341-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

From: Jimmy Zuber <jamz@amazon.com>

Add FUSE_OPEN_ATOMIC, allowing the kernel to skip LOOKUP to improve
performance. A server implementing FUSE_OPEN_ATOMIC will look up
the name, create it if O_CREAT is supplied, and open it in one request.

The reply says whether the file was created, as Miklos suggested in [1].
The overall pattern follows his sketch in [2]. For a cached
name, the kernel compares the returned nodeid with the cached one and
looks the name up again on a mismatch.

A server without FUSE_OPEN_ATOMIC replies -ENOSYS and keeps today's
behaviour.

Tested with a new selftest under UML and KVM.

[1] https://lore.kernel.org/all/CAJfpeguEK4JsFo60=yHkpLL6XkDGS7cQ5GOhiFL379KsYk0TsQ@mail.gmail.com/
[2] https://lore.kernel.org/all/CAJfpegvXtXY=Pbxv+dMGFR8mvWN0DUwhSo6NwaVexk6Y6sao+w@mail.gmail.com/


Jimmy Zuber (3):
  fuse: add FUSE_OPEN_ATOMIC
  fuse: open cached files with FUSE_OPEN_ATOMIC
  selftests/fuse: add test for FUSE_OPEN_ATOMIC

 fs/fuse/dir.c                                 | 359 +++++++++++--
 fs/fuse/file.c                                |   4 +-
 fs/fuse/fuse_i.h                              |   4 +
 include/uapi/linux/fuse.h                     |   8 +-
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +-
 .../filesystems/fuse/atomic_open_test.c       | 473 ++++++++++++++++++
 7 files changed, 797 insertions(+), 55 deletions(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/atomic_open_test.c


base-commit: b776cbe24cc1b79c7f5101762b0069b3f48b6a4b
-- 
2.50.1

