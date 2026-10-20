Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.68.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510487;
	b=GB8CXcWV+/wXZHNUaZT3cS5GJZGN4CGOSJE2kgLqGn8VgRCQnOHNnZJlfzw7g/B8Zwz2
	 x30b52YMt6kKTXTpo/H5aZ244GFSXhvObeJfoOnCKarCUkRuPlNShisnafQNlCz37ZeEE
	 g23rPY6zkfTTpMXHUygGA63pDBEnYVPleEFcgqQMxGbfwpJ45Ml/yy3SjKo68BlgYadeS
	 iDjuryfEN+j9hJRPDN8VWP+ONZYplJymUBldfMyjsAOptkGYXJhJW8Cr50N6bctK/0JmL
	 1S2t4N0DHlzyPexlgXErHYI/GJQIJus1TOM8d0jUvSQjm46PqmPinRu/bxxGCBgu8Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510487;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=jY/RYDNZQKLWWuVjcLPzBjF1+mi9bZRTEHR8KKJX5FU=;
	b=LeFXT+QGMYR1mXsthLo4S0c0SlKx8K3tnzKXc0YbRVdx3ScW5jkHgyJrJ+9Lez95g6HT
	 avuoBEFxh7CMKCNAiAWWuKZXZVHqD1SXPd63Mt3iRw9yA1NK/I5I9oPI2+arWfWUISoXS
	 iMaRyEwRhQb7tJC/JI8vsilEKn1BchJdUQFl1JJ8NnR8Ra8/n0Yuhy+ENSKxrrI8tyxvN
	 6kDnT8hX31M4nHoJDUoz6vDNNsXNYng0o93GEuxj2VqOMexexCfwYh0K5tp6zhCY2JyyZ
	 3GK76x18RhHG8BdfuVBaBfs64X2osuhlDZ7oPLfLqmoTQVayAZzDNwnNA9God5MsFTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=l6Zl9qxv;
	arc=none smtp.remote-ip=44.246.68.102
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF72606A31A
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 15:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EF72606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=l6Zl9qxv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792510487; x=1824046487;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jY/RYDNZQKLWWuVjcLPzBjF1+mi9bZRTEHR8KKJX5FU=;
  b=l6Zl9qxv74oamOFQyXf7fN3TaBS1RP6Xx6/WXG13asFgVex8TYsXwoOM
   JzFX7Q7EC/wh72TMBRAaAKvnXJt3EknGR8bYlpJ5nsBWDr6xFoQRrIfMY
   0ksLCjJ+a4pBhG6oqPGjDJchYADlGD6UAr+uK1fMH71zn8oO2PxClG6ju
   19ZKDNJ1BPmXePFQQ5CqCMTt8YLj395GUBMwXMY1E+Ixfk32Ix8tZVc65
   F6Rt9R59z6EDWEbWDWW+xVraewSjQm2Y5LmwvVy4uzHx8h9J8cF3tv1Es
   DZNO3CAVv3tnKJJmJmBvQv7kxCtsbZriMEV7mNqE1KoN06/58swugBbIU
   g==;
X-CSE-ConnectionGUID: f/+S0pvbRhC6EDMnCMdCQQ==
X-CSE-MsgGUID: ajvgQGzbTdmURAd6Y4zJBQ==
X-IronPort-AV: E=Sophos;i="6.27,168,1787011200"; 
   d="scan'208";a="31668898"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 15:34:46 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:11818]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.1:2525] with esmtp (Farcaster)
 id ae251e3d-0861-4860-beb1-ced817c03ec4; Tue, 20 Oct 2026 15:34:46 +0000 (UTC)
X-Farcaster-Flow-ID: ae251e3d-0861-4860-beb1-ced817c03ec4
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 20 Oct 2026 15:34:46 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Tue, 20 Oct 2026 15:34:45 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>
Subject: [PATCH 0/2] fuse: skip LOOKUP before exclusive create
Date: Tue, 20 Oct 2026 15:34:30 +0000
Message-ID: <20261020153432.3812719-1-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

mkdir(), mknod(), symlink(), link() and renameat2() with RENAME_NOREPLACE
look the new name up with FUSE_LOOKUP before sending the request. This
series adds an INIT flag, FUSE_EXCL_CREATE, with which the server fails
these requests with -EEXIST for an existing name, so the kernel can skip
the LOOKUP.

Tested with the new selftest under UML and KVM.


Jimmy Zuber (2):
  fuse: skip LOOKUP before exclusive create
  selftests/fuse: test FUSE_EXCL_CREATE

 fs/fuse/dir.c                                 |  10 +
 fs/fuse/fuse_i.h                              |   3 +
 fs/fuse/inode.c                               |   4 +-
 include/uapi/linux/fuse.h                     |  10 +-
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +-
 .../filesystems/fuse/excl_create_test.c       | 339 ++++++++++++++++++
 7 files changed, 367 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/excl_create_test.c


base-commit: b776cbe24cc1b79c7f5101762b0069b3f48b6a4b
-- 
2.50.1

