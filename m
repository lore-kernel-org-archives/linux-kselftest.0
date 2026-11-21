Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.35.192.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220191;
	b=FggGm+zGDBKu1JwISjQMPuYr01iOfC6HrODekadmHmYCUQaaKRK1Jeb65eg3q0Uem/3q
	 CFcxUHgd+lvXuC76OBSVh3EGQ9xgeY+pxl8XDFffgOfhN1/KSLY97eFj/oddp6vIeqBbL
	 K2Ohcc7s7qEx/YcPkQTtOmTQDrwo8FSmQlXdyoIudQf6jpEgr0kucYyYBimN3iD/2TbQD
	 oFWkPywroGLot639ZRCmlEhgMc4XWGIbxPf5xrkrnifJy/MApzphVhAHKT/JxaZKaB6Fq
	 EdEKd36A1JEZAkqBGLGIKtbmsI/Gs1xyYtf19RjesAIueF30AxAg5wrPsAe2Uv/ihqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220191;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=zaolOMHW0CD/iXJDEHtXGIo+GvckPXBYDZRcynG3p70=;
	b=PlSVPDN1rX2+WjNUfAdiDZ0Ev2SPAq078r6akueGiVp1cdhFZXrZi2L0M7+ut1iGfUHd
	 wy23Gsb9imztNkwuG97peVZXTTnTwrsJOX/jf72HSYyLVv6hYvY9XZErGLkvnmfgxjzrw
	 ewKVc635UEFK6Jrd8GGCQOc+r89oI479UTYN1+HCOvLNBy10gZF/CVTX0Fz+1CqBa9R0J
	 tg3eZYvAwvOHBwIczftaLK92M2bNr8uH03l9tiVPF6j6yz44ZnVw5VXOI8y5VokUdKBc5
	 YNbiRC5fBcpec4BnfyvXN56ed5RYoP/0NvfyyZyNwax6b9ugjln26siIMUGyaobY+wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Ee5QO1oq;
	arc=none smtp.remote-ip=52.35.192.45
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CF7606A6BE
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 00:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85CF7606A6BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Ee5QO1oq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1795220181; x=1826756181;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zaolOMHW0CD/iXJDEHtXGIo+GvckPXBYDZRcynG3p70=;
  b=Ee5QO1oqcVVFVk2s16E1luYn8Cs2wMcowup5LovNKUr3rC+QbXdZjlxW
   pYqW4lZKRZSIdqQlLAvRM8xSF0ccnyoqluJueYhqBTaw+hHjn+6n6zY14
   MpljsXVfPU65BBvZSI5TB0B7uPumTFR8uNInt5scawP2N05qtspvBE0N4
   QElsfBrycBFHIvBonZnTH/6iR+HJbtJK/peuvgg2x4ayZNnU55uMnpuXN
   rnRpq5p8DLIrhYURvbnjjFdCGnHUm43ijvYWqt9xNkEgm1r/KeqUWMPhf
   xyEbpFJbmxz+lwXsZX6NP6HDSoAI3W1XgutfsBs4bnf9Q9BbFUoQ5q/Jd
   Q==;
X-CSE-ConnectionGUID: ciokMMNcRg+YZJxOo6bjzg==
X-CSE-MsgGUID: KxsAB8nlRxmQ+VbL6Sqw0g==
X-IronPort-AV: E=Sophos;i="6.27,223,1787011200"; 
   d="scan'208";a="34467629"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 00:16:21 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:26172]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.13.177:2525] with esmtp (Farcaster)
 id c308471e-fdf2-4fca-a27e-3a02eee28a8e; Sat, 21 Nov 2026 00:16:20 +0000 (UTC)
X-Farcaster-Flow-ID: c308471e-fdf2-4fca-a27e-3a02eee28a8e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Sat, 21 Nov 2026 00:16:20 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Sat, 21 Nov 2026 00:16:19 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>, Joanne Koong
	<joannelkoong@gmail.com>
Subject: [PATCH v9 0/3] fuse: atomic open
Date: Sat, 21 Nov 2026 00:16:05 +0000
Message-ID: <20261121001608.996811-1-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Add FUSE_OPEN_ATOMIC, a request that combines FUSE_LOOKUP with FUSE_OPEN
or FUSE_CREATE. With this series, the kernel sends it from
->atomic_open(), so that an open() of a name that is not in the dcache
needs one request instead of two:

  open() of a name not in the dcache    today           with this series
  existing file                         LOOKUP + OPEN   OPEN_ATOMIC
  O_CREAT, new file                     LOOKUP + CREATE OPEN_ATOMIC
  O_CREAT, existing file                LOOKUP + OPEN   OPEN_ATOMIC
  missing name                          LOOKUP          OPEN_ATOMIC

The server must handle FUSE_OPEN_ATOMIC as one conditional operation:
open the name or return only its entry if it is a regular file, create
and open it for O_CREAT if it is missing, return only the entry for any
other file type, and report whether it created the file. The open
depends on the nodeid that the lookup finds, and the choice between
opening, creating and returning the entry depends on what the server
finds, so both steps need to run on the server in one request, as in
openat(2) (see also [6] on combined requests). Returning -ENOSYS
triggers fallback to the old behavior.

The series gives the request and reply their own structs, as suggested
by Bernd Schubert [5]. The request carries per-request flags
(atomic_flags). A server must ignore atomic_flags bits that it does not
implement and must return the bits it honored in the reply, so that
later variants of the request would need no FUSE_INIT flag. The series
defines the reply with a fixed size, explicit OPENED and CREATED flags,
and the attributes as struct fuse_statx, so that later variants could
return attributes that struct fuse_attr lacks.

With this series, if the server opens an existing file, the VFS checks
permissions only after the reply, as it does on other filesystems with
->atomic_open(). The kernel then sends FUSE_RELEASE for a file that the
server opened and that open() does not return, as it does for
FUSE_CREATE. The kernel clears O_TRUNC in the request and truncates with
FUSE_SETATTR after the permission check.

Not supported by this series, and unchanged:
- names that are already in the dcache (FUSE_OPEN);
- O_DIRECTORY, O_EXCL without O_CREAT, and O_TRUNC on a server with
  FUSE_ATOMIC_O_TRUNC (FUSE_LOOKUP, then FUSE_OPEN).

Earlier series also proposed one request for lookup and open in FUSE
[1][2], and one for open and getattr [3][4].

I used Claude Code and Sashiko to help write and review the code.
I reviewed and tested every change. Tested with a new selftest under
UML.

Changes in v9 (from Bernd Schubert's review of v8 [5]):
- Replace fuse_create_in and fuse_entry_out with fuse_open_atomic_in and
  fuse_open_atomic_out: per-request atomic_flags, fuse_statx attributes,
  and OPENED and CREATED reply flags. FOPEN_CREATED becomes
  FUSE_OPEN_ATOMIC_CREATED.
- Require the full reply size.
- A server must ignore atomic_flags bits that it does not implement and
  must report the bits it honored in the reply.
- Move the ->atomic_open() condition into fuse_use_open_atomic().
- Move fuse_statx_to_attr() up, in its own patch.
- Reject FUSE_OPEN_ATOMIC_CREATED without O_CREAT, and an opened
  existing file for O_EXCL.
- Drop cached pages on open as FUSE_CREATE does, and open an existing
  DAX file in ->open().

Changes in v2-v8: see the earlier versions below.

On truncation in the request without default_permissions (Bernd's
question): the VFS can still refuse the open after the reply, for
example with -EROFS on a read-only bind mount, for an append-only file,
or from an LSM, so this series clears O_TRUNC in the request and
truncates after the checks.

v8: https://lore.kernel.org/fuse-devel/20261110204421.1251726-1-jamz@amazon.com/
v7: https://lore.kernel.org/fuse-devel/20261110155219.2175318-1-jamz@amazon.com/
v6: https://lore.kernel.org/fuse-devel/20261029130758.818617-1-jamz@amazon.com/
v5: https://lore.kernel.org/fuse-devel/20261028200459.2922951-1-jamz@amazon.com/
v4: https://lore.kernel.org/fuse-devel/20261026221639.628325-1-jamz@amazon.com/
v3: https://lore.kernel.org/fuse-devel/20261026190747.2373775-1-jamz@amazon.com/
v2: https://lore.kernel.org/fuse-devel/20261026151828.562870-1-jamz@amazon.com/
v1: https://lore.kernel.org/fuse-devel/20261020141647.3271341-1-jamz@amazon.com/

[1] Dharmendra Singh, "FUSE: Implement atomic lookup + open/create"
    https://lore.kernel.org/all/20220517100744.26849-1-dharamhans87@gmail.com/
[2] Bernd Schubert, "fuse: full atomic open and atomic-open-revalidate"
    https://lore.kernel.org/all/20231023183035.11035-1-bschubert@ddn.com/
[3] Joanne Koong, "fuse: add FOPEN_FETCH_ATTR flag for fetching
    attributes after open"
    https://lore.kernel.org/all/20240813212149.1909627-1-joannelkoong@gmail.com/
[4] Bernd Schubert, "fuse: Add open-gettr for fuse-file-open"
    https://lore.kernel.org/all/20240820211735.2098951-1-bschubert@ddn.com/
[5] https://lore.kernel.org/fuse-devel/fa582b7f-23ba-449d-b311-20f6ac8e867c@bsbernd.com/
[6] Miklos Szeredi, on combined requests and compounds
    https://lore.kernel.org/all/CAJfpegshcrjXJ0USZ8RRdBy=e0MxmBTJSCE0xnxG8LXgXy-xuQ@mail.gmail.com/

Jimmy Zuber (3):
  fuse: move fuse_statx_to_attr() up
  fuse: add FUSE_OPEN_ATOMIC
  selftests/fuse: add test for FUSE_OPEN_ATOMIC

 fs/fuse/dir.c                                 | 321 +++++-
 fs/fuse/fuse_i.h                              |   3 +
 fs/fuse/fuse_trace.h                          |   1 +
 include/uapi/linux/fuse.h                     |  75 +-
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +-
 .../filesystems/fuse/atomic_open_test.c       | 920 ++++++++++++++++++
 7 files changed, 1302 insertions(+), 22 deletions(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/atomic_open_test.c


base-commit: ab9787d7e66ac7e6e94fc975b37c5b56fff98ca9
-- 
2.50.1

