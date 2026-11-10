Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282216;
	b=pFWZPq+tenr1OFh3LDwCgLdyzlYrxQuzj/oRldeHWhDZrd8pMUcD9L+fEUFvvk5Oroqu
	 ccAfMPDhyrNh6sbc+0XvKwqltkEeDxWIGIA602prWf4qsqN0XOk9KyYeefTd4Z+YwNreK
	 cBLEV6PMwtLmhXDWZ5YP1d4DLCdRSAH8I5Dr3Af+kLMbwd0Zd81aVXJI0qBKcsaSCEFfQ
	 q7SHe5Ka8yQmdk8Apmpkyz5f+SrhhH1hpkUwnOFC+MzEqaEJ2WaVt00Tu8FiiOi93ORjo
	 WMyHgkNBtlYSoIDgQahhUq2uqC4ygBnODrfZLhNXIu4GV5RDessG10bG38+n7QrN+Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282216;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Bav/40H/S37c1QAsHxkHM2/LMNaxJO9wnIP5q1tCW/s=;
	b=DQmtBgrToTSwJnJvyOaeA9mwrvsXIPpR6EvkEWilKPQiR9nnEdxApbU2Hiigvg5oJd5D
	 1n4gwB4HvbkGhy9ERm5eID54cEex208DW8lVNlyv95kssr52RfqghZlrknoHTYEkODqxc
	 fo3w3VY+mn82EQQ47nJ8UpvDUAw9dD68qaPyMH57gdnXiPhDq6Ph3pQOqez1uNJOIoVeE
	 xeNl3cJlpoIsIhdKIP1Tp6gfwx8Z8fzlDKBmrDkoP/Gs7xMdzmBYng14ErfUVHLNcWJet
	 x9XSzFTc3ekbXd4DtYd/GWGETz4sYy+qgf7qloNRCxGvUd4yZnXw69RjOcCD88WZ/FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iICUBOjB;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43038606A321;
	Tue, 10 Nov 2026 03:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43038606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iICUBOjB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794282214; x=1825818214;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LIGJJ4oHIy/B5pdpOX+0unFwSD5swiSG6r4UJrHoZ/U=;
  b=iICUBOjBfEuuNMPpQdgnxloLKEoH3GDBUPBn/DWHJGzXdhKycegG6vcb
   5edq8q1uEjXh+a8/UlubiF2KL00p2s0Kvf41NgAOBHZlO8VTperExkTrW
   jUBwL5thRJjLkO5LNPEouRbT7GgmYhPtFdxbW1GcqMrPY/1m/kjcdymV4
   anUIN6CEvytbSYT2sPZssncXTzkZxh279xYfqTGhNTkDdB8CQgmvtugJq
   cqoO/j2j0mus0g8ixKtsFX8oYT4g+lYPDllwdDY+/jfDPgHVFpI8LEVvU
   l3Gs/i4bYnHzJOGPVF0L592f6yzclEtderVnHwyhH/Vqbz3p97aat0MRB
   Q==;
X-CSE-ConnectionGUID: MXNpyxKvTKKnS3imvs6oTQ==
X-CSE-MsgGUID: EIZ3dfDtTV+SlRyQ953UcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3018010"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3018010"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 19:43:33 -0800
X-CSE-ConnectionGUID: Z/savf8DSuWG8RpAHDJAHQ==
X-CSE-MsgGUID: T4o/ZBpHSwKSZEFnr/+t+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8218823"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa003.fm.intel.com with ESMTP; 09 Nov 2026 19:43:33 -0800
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: x86@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	shuah@kernel.org,
	chang.seok.bae@intel.com
Subject: [PATCH 0/6] selftests/x86/xstate: more test cases for coredump and ptrace
Date: Tue, 10 Nov 2026 03:15:57 +0000
Message-ID: <20261110031603.698635-1-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
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

The recent PKRU bugfix [*] has motivated to address the missing test
coverage for the case.

Since other XSTATE tests do not cover the coredump path either, ad x86
tests with shareable helpers and then include the PKRU test by reusing
them.

While doing so, I also found a few missing ptrace cases and the gap
of inefficient error tracking to those common tests. So the series ended
up growing to address those things.

Thanks,
Chang

[*] https://lore.kernel.org/lkml/20261015210545.48208-1-chang.seok.bae@intel.com

Chang S. Bae (6):
  selftests/x86/xstate: Track testing status by kselftest API
  selftests/x86/xstate: Pre-allocate ptracee XSAVE buffer
  selftests/x86/xstate: Validate XSTATE_BV in ptrace test
  selftests/x86/xstate: Validate state reset in ptrace test
  selftests/x86/xstate: Add coredump test
  selftests/mm: Add coredump test for x86

 tools/testing/selftests/mm/Makefile           |   2 +-
 tools/testing/selftests/mm/pkey-x86.h         |   1 +
 .../selftests/mm/pkey_coredump_tests.c        |  89 +++++++
 tools/testing/selftests/mm/run_vmtests.sh     |  11 +
 tools/testing/selftests/x86/amx.c             |   5 +-
 tools/testing/selftests/x86/apx.c             |   2 +-
 tools/testing/selftests/x86/avx.c             |  33 ++-
 tools/testing/selftests/x86/coredump.h        | 229 ++++++++++++++++
 tools/testing/selftests/x86/xstate.c          | 246 ++++++++++++++----
 tools/testing/selftests/x86/xstate.h          |   2 +-
 10 files changed, 561 insertions(+), 59 deletions(-)
 create mode 100644 tools/testing/selftests/mm/pkey_coredump_tests.c
 create mode 100644 tools/testing/selftests/x86/coredump.h


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

