Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620BD311975
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 18:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462831; cv=none; b=XO9USXfirnpJe21RWpqoGdFOm7GoJ2v/R873dtndRy+FgweuRZyremxl+QVc8vGJuNp1/eDE29c2WsKpxzuVud/TtII+Ofzo/AfVGSu9/8DNCsmUCn9df5mXdwcq8DGa9jo7LRglG3U2KTgNiRReEB+wyqlvKWlQw0LFIRPFL5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462831; c=relaxed/simple;
	bh=L2PB5d/uY1QhYwJSrKU61wGxYLAXlUnV00D7v0MpvC4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=DdomK2ddmbsEONvIpl0syBipLvkyFWdjyEU5/HDDP5UTn0BjSGeZZRoF/qH5WuMqummne9X2uG8doikHzyd3O2w6Ffz+4rTEC97MTrkiQs0g88sG1Ax802hKguV4nXJ9A99PYfkeyXglXF0ai+9znY0lhjYKHYWSNjTfVPmunyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=MSaNaeEa; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="MSaNaeEa"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8d00cf835b7so28403985a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 11:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1774462829; x=1775067629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pqftG1ACYGHV/eDENSIw/7Bl2OYrvdNvfOznXOuZm8E=;
        b=MSaNaeEa3wS+tLfckpFBVWoRMrMrY+TnOxs8y/Lk1OMwQsSah4PYc6pxINVFxBxhC/
         Par7i24gJ1EUum53hDxRMlaatW2E5NKRYutPezGsSvi2pLVlvhU9oWWDFwgA1iXGLwWa
         s7cUTmmkx3wis/S84Zd0WhldjwojdCXOxO3PZ2tHco/wvywfhLg3br9/fkxZs4Rc6elk
         aSGwZ6XqKyn/kdalksoxwki41l2ggAYVzT+oXRkOO7Li0K6MPx4dRZLN54VYf9JwNK7S
         O0qs/99otQPnQPmAM8hgJIsyLvX3PXu+KseJs4eYz0beTXibzX0mcaJw8lBe9CsTpUrD
         nBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462829; x=1775067629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pqftG1ACYGHV/eDENSIw/7Bl2OYrvdNvfOznXOuZm8E=;
        b=hN4UYJGLpiBimjxx5h1zijGJ7Y9nfRnhFKkeDC0Ba15+LoVlaA93XfUJe9IJqMA5zx
         n/xV8eoldHb2Uvdyajvyo9ECb1eYVWvPbCXh13qfRSH3nr8iB2Q05cKEjUZwhIoI03u7
         GcFuPWDiEIfl61QYfHWcWXgC8mADzL18l0KgQetTudasZj44H+3dcmWZ6xskox0PfqP1
         z7iWliOtgL5dwz9JfMS+Nfwp/I+tVkWpjcysfkzKXgmWf4REWOzwZQe34AL7k1xZf9vN
         7Dbg6xC+1mnJacIkcotsYXhBv3lyEQpdbuKxjBeyQpyHDIjMm3NHfnn2NC1b6OXcE8Ok
         7UJg==
X-Gm-Message-State: AOJu0Yxcb8ZEfMtky4OJgUDVP1OLghsLcZ5XXesFafK7a+inlxzbnjdH
	3U9tN9LLylwgdI1VpUKZKum9AsWNMULhcITVQdGb/f9vKcWhny6lXk2VqPGkdEtCTLaPHO1ptsM
	WAbKy
X-Gm-Gg: ATEYQzwPBIHbMHXIuDD82Dc5u2Ig0I2eL2VlamQ6Cjk+GibCha9L1k6HBtr/bL9HX1P
	kcAcYQ/Svh7lHy23tEIB7wUvwP0YAV6OblIQuMr5Q6vEPDzOcSmvUujuoRBug2Dn1mRXF71IBPp
	Ta9olas8HZ9dwNmCLtrczO81gCPbFPTAdEhz/5ZPV5E+zJ5FzWW1uGHS3RqLK8LPOy6AbmmN0hm
	LLePk013yW3LfAk4jOPaWJB4MNgTnWjHCtWHFbdjQ3zd+73Q1vahI99PWWFjHiuDAYYvdSYrRdS
	BbYHnwh5CeQJM/mUwj5E4a8CoeYhvEyNl25Utm4PJod1KomUe/tHCPUL0KphUrEF9LU9f2lm9C8
	c/AMsmcbO41QDSnUxSBvsu2d4zcoxrMbH3+DtF5X6SUdgrPeIsfd1TYtHJNIkhETVgwxqdTzrPt
	G0b2DWkLwiLNiIB0HTbhSyaoG4Ana87r3sAc0Wsceg0OnLEdjd0+jH/tnzwZYW70gjZQ==
X-Received: by 2002:a05:620a:2584:b0:8cd:94a5:2f32 with SMTP id af79cd13be357-8d000f55d0fmr631636185a.27.1774462828756;
        Wed, 25 Mar 2026 11:20:28 -0700 (PDT)
Received: from plex.localdomain ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d00e250556sm64225385a.0.2026.03.25.11.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:20:28 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	pratyush@kernel.org,
	skhawaja@google.com
Subject: [PATCH v3 0/2] liveupdate: prevent double preservation
Date: Wed, 25 Mar 2026 18:20:24 +0000
Message-ID: <20260325182026.467307-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, LUO does not prevent the same file from being preserved twice
across different active sessions.

Because LUO preserves files of absolutely different types: memfd, and
upcoming vfiofd [1], iommufd [2], guestmefd (and possible kvmfd/cpufd).
There is no common private data or guarantee on how to prevent that the
same file is not preserved twice beside using inode or some slower and
expensive method like hashtables.

[1] https://lore.kernel.org/all/20260129212510.967611-1-dmatlack@google.com
[2] https://lore.kernel.org/all/20260203220948.2176157-1-skhawaja@google.com

Changelog:
v3:
 - Renamed luo_preserved_files_xa to luo_preserved_files (Mike)
 - Added xa inserts during restoration, so a file that is not yet finished is
   not preserved at the same time. (Sashiko)
v2:
 - Because inodes of preserved files can be shared, we cannot rely on a
   flag in the inode. Therefore, use an xarray to prevent preserving
   duplicated files.

Pasha Tatashin (2):
  liveupdate: prevent double management of files
  selftests: liveupdate: add test for double preservation

 kernel/liveupdate/luo_file.c                  | 26 ++++++++++--
 .../testing/selftests/liveupdate/liveupdate.c | 41 +++++++++++++++++++
 2 files changed, 64 insertions(+), 3 deletions(-)


base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
-- 
2.43.0

