Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709075;
	b=p7yNVYztwAj0Z/nhXkdBShWZY3pgPdajy2RwOJnnbD9FthpqWHOFVAHVWRXkmt4Fat2r
	 ZoihRZBf318gDm0Bp5/EtRjKgbp1CoRfozJaTr5Ci92+kiZ2fy2R07hltDZot35wpFY/H
	 YKPE1QA2pGBkhpPa/u7cMWAujMcD8ULxXDNFwKNTc6wT8QWLwHubnbBNX9GPghiBeVrwc
	 QajuJ6k7NzPF9AQV4cn9kIk4PeUx464Hkh5krzgkHGMjhtcEJBcPlmFgAqLXT7a8dwbMW
	 mjEZimhe8VbMtOKTaHfdUcY1s8YsUfCGPaQMJEEKGwkL4S8dOxfS0ceFHXyyhQh551g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B3OEB06UVVzOvWWD1IBOYqe74IAlLNlNvzCjs2X2cFE=;
	b=3yWU8dKiLPZ560lO2/WzdWHIVjN0F5BSQW+/7GcpO/sEPq467WzYCJgbiAVqRzAgdUzr
	 jd8SsGB9B0h6RcF8dOx36GGS3TF4cj04FjB/4zp4E51PPBWPW3RsWHzR5knWvV9hWeDJa
	 KBcBlU21ghitNX7Nn6eFEtyhA9Yt/lNWosr8Jt/3/yjO12/ycgrjxL3/YQDPSMyDyrYIM
	 WYuGu98pinNFveEo/hT4Ww5KmvchhAUHdYIRrYjAFRRuKyIskuuYK2/7Xh5FoUR+vyAwv
	 CvGp/cL0G/EQ7sRrs82+VpdFdXqIpuZ8xM0s/3hCGLha15nPjS0V3zsoNkcW1sLbIzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qY5q0eZS;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCAF606A31B
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 22:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BCAF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qY5q0eZS
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e812e2b31bso1340195ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792709075; x=1793313875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B3OEB06UVVzOvWWD1IBOYqe74IAlLNlNvzCjs2X2cFE=;
        b=qY5q0eZSZmkZ1MHYRk6v4pq+fQFT+QrkFP/iAVsubrsTz74hiIfQZsLmiDG/Xi5maE
         p+gKWitq1OM9aybevrEPPTpNRm+2Ttce45+vVMksQsAAkHm3UdZC7uf8/+53PpmRYU8j
         mHpV2+RbgHzHTMIcmt5D7XcN9aKJwmU8oxq/R2cfxl6Ujsv6PwZG3OHfd6wan4qDhFA9
         UP9KPsmuqfQ+jL1EmgF/Fp7u1P6QYqDy13eTB6cByNr1PKvtrQIwK/xKDxWe8qZOVovh
         PtOXgeVaLpQpmlg7vlV8YKSF8flw1I9RDEUiDE7UeLNmbxaS3f2k7iLhp00X2Jwdx0yJ
         Qipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709075; x=1793313875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3OEB06UVVzOvWWD1IBOYqe74IAlLNlNvzCjs2X2cFE=;
        b=S0ljvmBAmOBiAXQqEvSfu99/3wAjG3h5NgjG8PnDWpQD1zgagTwgKRZRsLc/s4jtJi
         JEs+S8FzH149afQmuI4ayQe5PdMS0p3ato3j/gwFf2Q1sxm5yeora1dgXWdRJ77V4UlD
         BWPUF61R29k59yUAPCCU4rUGRxIGhOYYodSiXets5JyLh8fLWmxu03WVWqZloY8P9CXu
         n1hLlwaLxloEpvDKEQEhZSMLYq2fTcpAT6HpQpIxxdNnzV4NJm3hjHLA3rzgUGWFzFck
         RmAqgBNhUgPE+YjiDDdvBjvnzWXTn4EHlaRcPo7a0A59bbXJJiMXmvE4KCDfHBNwV29X
         wO7g==
X-Forwarded-Encrypted: i=1; AKwUvByFsJG5fPuBm2FewNchFtl1gqnACE6wHj0GxWAn71OeZkNjEhsmM3B6/2uIrw4ePVfFVuTeCm3P2FMJzGuaPL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2fqVIDmS+LbJBG9mzrKw8ihaX4JffM7QQw4v2U79DDcL12P+g
	aF2ENPwHGa9Q882sapQ6XHWA20kBM5vpLmwBxlWEiuf2/51qy/kh+Mkd
X-Gm-Gg: AYBFou1BWNWIjiqOTBN8dkFp5f/G6bkL8beJ/ny8OPcChL8OMYMSGodwAZDL0aNlV2P
	SCglxGA75Iezaddy+rqBoRmZu9czmpGJxmNnNb1Ge/p6QyexZqx74aubmAjxJNN7DgEp7EZqaYz
	+hl3lk6zwVu/Ybeb+hccN2bvDnNeCIUO7kT0MyywkyzNW4AoJh9Ys2eXj0ytMk/9Hd15yFtK5yA
	N0tO++tCxV6Y/7UTC+UN9g0htHRacWX8inkwXsav+bsgF3LvOSP5LIrOwydgBbGzsNFCtW99fNq
	ea+83NQV1XJxAvoEycPnsDiexBe2uxzOpjxAacBxd21LpSEgyZCOJjLi/B2EGL4MAoEqOgSgdlM
	QBYSssscYZN8QexOv37oGkh3bIULlkB32GUuPwI2gDR1cGHRpALOoMn7vDpZ2oN2NyoJjV0Ix/a
	/apbHwutI8MY8hhS6P3RsrDCrR/9b01NMwRpNEmtm756sbKYkz1uPus3uxafZmok9iIp//R6mpV
	6VOTp5ZJvyzoLhZTzPc3ptKZUaBY67Af4KvjG8nrn+mYD/WhfYikGd/m8ExWqadAfektweDwTY=
X-Received: by 2002:a17:90b:264e:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3adce090fe6mr281032a91.44.1792709074523;
        Thu, 22 Oct 2026 15:44:34 -0700 (PDT)
Received: from kir-tp1.lan ([67.185.120.12])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8e6678sm192717a12.30.2026.10.22.15.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:44:34 -0700 (PDT)
From: Kir Kolyshkin <kolyshkin@gmail.com>
To: Joe Perches <joe@perches.com>,
	Andy Whitcroft <apw@canonical.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kir Kolyshkin <kolyshkin@gmail.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] checkpatch: skip more kernel-only checks for userspace code
Date: Thu, 22 Oct 2026 15:44:19 -0700
Message-ID: <20261022224426.2756960-1-kolyshkin@gmail.com>
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

Commit 99b70ece33d8 ("checkpatch: suppress strscpy warnings for
userspace tools") added is_userspace() to skip checks which only make
sense for the kernel. This series extends that to a few more checks
which produce false positives for userspace code under tools/:

 - ENOSYS: the "ENOSYS means invalid syscall nr" rule is about the
   kernel ABI; in userspace, errno == ENOSYS is the standard way to
   detect a missing syscall (e.g. to skip a selftest on older kernels);
 - AVOID_BUG: "Do not crash the kernel" does not apply to userspace,
   where BUG()/BUG_ON() are assert-like shims;
 - SSCANF_TO_KSTRTO: kstrto<type> is not available in userspace.

Running "checkpatch.pl -f" (with --strict for AVOID_BUG, which is
a CHECK in file mode) on the files under tools/ that use ENOSYS, BUG()
or sscanf() gives 699 such warnings before this series (ENOSYS: 188,
AVOID_BUG: 491, SSCANF_TO_KSTRTO: 20), and none after.

Since tools/ also contains some kernel code (test modules, Kbuild-built
mocks, rvgen templates), patch 1 makes is_userspace() return false for
those locations, so they are still subject to all the kernel checks
(this also applies to the existing strcpy/strlcpy/strncpy checks).

Kir Kolyshkin (4):
  checkpatch: is_userspace: exclude kernel code under tools/
  checkpatch: don't warn about ENOSYS in userspace code
  checkpatch: don't warn about BUG() in userspace code
  checkpatch: don't suggest kstrto<type> in userspace code

 scripts/checkpatch.pl | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)


base-commit: f47d223627f80cb7a1eb14c585fe6cb35de5e984
-- 
2.56.0

