Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.245.243.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299822;
	b=YSU1at9iCrF5R52GWpURqpwPWszgJs3Pu9pOjqF0fhQWEjy+cy90VJ96UljaWRyyU111
	 irdRn1hnDOegp2022g+aki87j0dEBKskbs0/hygoBWSCPCd/mBNT9JKhqTk7eZb/ctsiM
	 CsT/TkTrNnh71cqRFhA8NsYFSx6VIZlTIAnQFTijMZlAKe8HfojhP4JPGT/MyrNssfnOd
	 NBQbaIiZ+zwm5/+k3LIMQ6Ud3iMbzNpnpNoIsl70TN2UQv2B3tdFB/8u+jzYlcnS+xtx4
	 CJyKsrWzop6+tKUfa7U5870gK02sPN+yzhqVyUTre6/CpR7oM5xO69i6P8RZ+5ik9lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299822;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=dFQkIRXdqN/mm+HPVBnBxPUgwZQzzCyijE7O/EObV7Y=;
	b=3Vec0i7WwpvEoBC2Mkw7CLUppG0yl0z7jl4n9dSybrgKcrZjgNSuOYJIOj+68KZrfMx1
	 kdtPBJSvYl4DyK4J3vyVV8wvlKmkdSncrhK/Oue4z2S89AzpCZU92cuua01KGAbHDbK1v
	 nQXHjgwzSZq41iRFVNgQl4HCFTjlLC25etmbw0n6LIcj03kLBxGSNNBpnwIyUNrxsresK
	 Vzh5DwlBtZFnvjMVPmDXDfymHM/BHi3kDVxWRXfl818Y3f1cDuhTjPLrfK3XXmx39/6me
	 AAQblycbDcqe2whiYiHtvUWqe7AtaUroHoE+DefAq0GGWJYI/tjzhaFN3hCvU9D3DXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=XJHJdS5t;
	arc=none smtp.remote-ip=44.245.243.92
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA6F606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 18:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AA6F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=XJHJdS5t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793299822; x=1824835822;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dFQkIRXdqN/mm+HPVBnBxPUgwZQzzCyijE7O/EObV7Y=;
  b=XJHJdS5tBFXVPVcgZNm+ZTTxpJFTpbi3lO2K3iDoR+wOUxqpDPpkv54F
   x5jES50kVRh330QiTONKfKT2Pl/IoVi2SpwH6xhROtsM65a8tX1JZuiS4
   czT0+mlEG39bjt36cvBIgCUh+dimV41lefNwFQ4FkNBtrS1iqnpcOKqay
   mL2TyTciu2duhzZP71Gu15YnzLc8iHLGQxbsD3+CyCCJ5jXxZ4baPQZau
   UXdEh1ZKBqqJK1nupbV0rxggGnGpPb5Fad9KKo6xFAqBCAHQsaqQlEs0p
   QobuDkFLmPoi28sveRdzd7owUR4nCGQtxRzDZXHjIPnBy9rO71LuLwOu7
   g==;
X-CSE-ConnectionGUID: PEgmo8sFTi2Ay+tuDmlHOg==
X-CSE-MsgGUID: RBcYlA2MR/mcqFnr2Rb+rQ==
X-IronPort-AV: E=Sophos;i="6.27,184,1787011200"; 
   d="scan'208";a="32109494"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 18:50:21 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:16316]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.7.65:2525] with esmtp (Farcaster)
 id 1d71a4e2-3b74-4611-8e3a-f7dd612b7bd4; Thu, 29 Oct 2026 18:50:21 +0000 (UTC)
X-Farcaster-Flow-ID: 1d71a4e2-3b74-4611-8e3a-f7dd612b7bd4
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 29 Oct 2026 18:50:21 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 29 Oct 2026 18:50:20 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>
Subject: [PATCH v2 0/2] fuse: skip LOOKUP before exclusive create
Date: Thu, 29 Oct 2026 18:50:08 +0000
Message-ID: <20261029185010.3080336-1-jamz@amazon.com>
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

This series is independent of "fuse: atomic open" [1], which covers
open(). Both add a 7.48 entry to the uapi changelog.

Tested with the new selftest under UML and KVM.

Changes in v2 (from the Sashiko review of v1 [2]):
- Use INIT bit 46; bit 45 is FUSE_PASSTHROUGH_V2.
- Document that an existing name can fail with the error of a VFS check
  that runs before the request, such as -EROFS.
- Keep the test server's state mapped at teardown, where the server
  thread may still read it, and mount in a private mount namespace.
  Skip without /dev/fuse or kernel support. Test mknod() and link() of
  an existing name, and the dcache after each request.
- Rebase onto fuse for-next.

v1: https://lore.kernel.org/fuse-devel/20261020153432.3812719-1-jamz@amazon.com/

[1] https://lore.kernel.org/fuse-devel/20261029130758.818617-1-jamz@amazon.com/
[2] https://sashiko.dev/#/patchset/20261020153432.3812719-1-jamz@amazon.com

Jimmy Zuber (2):
  fuse: skip LOOKUP before exclusive create
  selftests/fuse: test FUSE_EXCL_CREATE

 fs/fuse/dir.c                                 |  10 +
 fs/fuse/fuse_i.h                              |   6 +
 fs/fuse/inode.c                               |   4 +-
 include/uapi/linux/fuse.h                     |  12 +-
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +-
 .../filesystems/fuse/excl_create_test.c       | 386 ++++++++++++++++++
 7 files changed, 419 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/excl_create_test.c


base-commit: 9b1da7b4a4e197072e630c3b85d4100a399752ff
-- 
2.50.1

