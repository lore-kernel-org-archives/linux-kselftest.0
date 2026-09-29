Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D25D4F96AD
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 23:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790726237; cv=none; b=o1eErsK8q5PUPbIunX+wGWVKhG3v/Ia1VTDPBL8D0K4jPFb2kR4hwE8jWyNsLLDKpx/xAZf0u+5wT5YzTplEf5EEywAbghkE71Iim06Qz+UL6x5wT3sIiXrWnjqlLzrIo04IRVetzpDw4Tz3z81v5UCZY5rnkKRynZoKSeWiPVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790726237; c=relaxed/simple;
	bh=DS40NvQnq+bJTp9O1S5W9GAElyxc9uZ2KsMaPSuLgGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pp/xYlx6pC/xvXTVFn/tKmsO0RpC+AxZR60ZDwJMJkTXxh6kB3FhG6+BGApOHikyZHVnnxMzmbBpOfMmPlioxZjfY1YzCeASW3GO/usDCYmNtVPmvGnDaXeqJXHZQkQSdO3MwD+q52JW3O5cF13bWY1PVY+e8RHuQe/RTFty3BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXG3t8bb; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXG3t8bb"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc4c3304833so1830765a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 16:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790726235; x=1791331035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d2OlJ3pOFLYukF5tQBlnlNk14VTvFLw29xsc+/lj80E=;
        b=jXG3t8bbA1U8D+FDQvXB12QuGFJeWrB41O2zXvwKmoeaiYHn1bk/cOMESycWPkdFcw
         KEmqfh2JaPOAdIbhGl3LzZw6vW7OS83mFOf7TElMfoJEaMfiuHeCf6r9w30k05HJVO8c
         Vs4OmX//Vwk5K/4c5rbOjwNBuBtJKZ01LIr0l00y0XfzN9EQHAksY7gUlVpO3RtKYVcd
         +tsYLShJJJdcQ92Z4nJOZLZpYDA0YqQodpA6DVlSU4DhIRfLEYpwCzYJe2dy0yKBiIj+
         ngDrqibHCH18/GMJCJMCESZc4BPqem4ZUFwcXmK3hOFCMIjSfVh9T8yZg5OVicdOJ7Ig
         h3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790726235; x=1791331035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d2OlJ3pOFLYukF5tQBlnlNk14VTvFLw29xsc+/lj80E=;
        b=ufUOefiYW5SzVWSaVRaQXxGM7Rcy+tRrCvfflhNhUiUSURtKSaRxcEUyxdhRYzQrMK
         E6IrC7u6cMHCqm8DH5nfmLMitGawMKthAq+fvss1SxUEXt8lf+fiNifyg5evQLOzRGOA
         LjZCNr1vROm2QwfuBpfIfFObDYmu7x1QSdYNFXqxlrYSQc3ysoQCBeGKDyUFF9Cv/AhY
         xu/i1bVJn+mriZQwVJD9lih/dtWbODAErIvhCKuMXTgurbbRvpmva3VD2d9VMAcISqjQ
         1BxAo6zoLMOGcGsOe6ryaNfgX8+D/03IJL7wweeePVSBm5jYaPfPnaUTdLBYwWnqj9ju
         RMcA==
X-Forwarded-Encrypted: i=1; AKwUvBxXJWRa+3RpJH4QT6l7oIfnn/hS2LnhC+Dicg8VK8icb+Xem5XmEx53dDtB4S1+dTKotM7u71W/4qaNbPHlxMY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLP6SHTTaPMKPmBwORMCQR1hAJ8PdWqs2EUWQiSkf7bkyeZAK9o
	3WcpaQ44rp5WsTNO4zAjrk5mLQobneLczak/pxy2Rmrh0hu37jazMPS+
X-Gm-Gg: AYBFou2Yl3Kj7GViYTcC9AtVBCRHyTjDcYN8HNqFs8cv1o/eeBhap4ku72F3UE7u/hC
	sMost7M7tCLOj63iyFOeVvxXT5H5/z3h08mx257e3MqD4gfgQFKxoHQ70FPzWE5E56KHCg2DoKg
	UAnt5RvvKW9JI27qBFtfd/jxARVr5+Mm7vszBEpnnkqT3MDhMRAQVjaQz4dQCA5zcrnqR0xN90h
	539Vv3tiNqGXCw9Dn/Yu0ZCNLaQfr6XD7uULnub+J0E3LlfP5eS2stY/q+pr+lze5OgEPYgXT1V
	axpbFaNIdtTZ1yPuY6wX1+5hj6i/MbYCHrQ1shaYzVvBxw5ZgITjylMiX/0+9ob1Y3WeSGGggvY
	s3qE+WyKS73/a8dZCQI7GnJYU7TUCH+8FvzlFK2T/7qNKyIbkYyKMgbsNpESgG+4DARdERt5PVX
	ADuvviiLMWzwVngJkZmLneo4+X3/0fkNLBNX5FfMLmlAfVZzGPEnjKlvSOC6CEEjqI/q3Prj4nb
	qQKkS3I67qQ93EWw0anosSzMKsXKysqhsyMopKw4n6jqf1dNKTUlL2GK2fWRswXFCqU1dN7ffJX
	evA6slUVFzYtEjTpV8wGswOhsVWEovmUHi9VbSEs/lYhD1U733GZjIuXSZ5k
X-Received: by 2002:a17:90b:1b03:b0:3a4:b50a:1113 with SMTP id 98e67ed59e1d1-3a4bfe8a0e8mr825389a91.37.1790726235201;
        Tue, 29 Sep 2026 16:57:15 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ca78102csm242607a91.4.2026.09.29.16.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 16:57:14 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 2360016DC6A0; Wed, 30 Sep 2026 08:57:13 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	david@kernel.org,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	ljs@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org
Cc: geert@linux-m68k.org,
	daniel@thingy.jp,
	Hajime Tazaki <thehajime@gmail.com>
Subject: [PATCH v4 0/2] support kselftest on nommu platform
Date: Wed, 30 Sep 2026 08:57:09 +0900
Message-ID: <20260929235711.2287931-1-thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds an ability to execute kselftest on nommu platforms.

Currently there are several issues if we wish to run kselftests on nommu
targets:

- it cannot compile/build test binaries because the current files mainly
  assume to build with glibc,
- some of the tests are not able to run on nommu targets as there are no
  fork(2) syscall.

The first issue can be avoided if we can build static PIE binaries (if
targets support it), but in our case (build on ubuntu/glibc and run on
alpine/musl-libc), it fails to invoke due to lack of the GNU ifunc
mechanism.  Thus, we need to cross-compile with musl toolchain, which
needs to be solved the first issue.

The second issue is the lack of fork(2) syscall on those platforms.
Especially the test harness helper (kselftest_harness.h) uses the
syscall, which cannot be simply with vfork(2).  `timeout` command used
in `runner.sh` never works for nommu platform as it uses fork(2).

nommu component in the mm subsystem has several known issues and having
test cases should help this situation, thus this patchset is very first
step toward enriching test environment which has not been well tested
for a while.  The test cases is implemented based on the document
(Documentation/admin-guide/mm/nommu-mmap.rst).

Initial shape for this patches is implemented as an opt-in TARGET, not
built/invoked automatically if users don't specify this nommu target.

- v3:
https://lore.kernel.org/linux-mm/20260926010819.604346-1-thehajime@gmail.com/
- v2:
https://lore.kernel.org/linux-mm/20260825015945.141739-1-thehajime@gmail.com/
- rfc:
https://lore.kernel.org/linux-mm/20260813063401.1786548-1-thehajime@gmail.com/

Hajime Tazaki (2):
  selftests: run tests on nommu architecture
  selftests/nommu: add nommu mmap and mremap behavior tests

 Documentation/dev-tools/kselftest.rst         |  14 +
 tools/testing/selftests/kselftest/runner.sh   |   6 +-
 tools/testing/selftests/nommu/Makefile        |   8 +
 tools/testing/selftests/nommu/local.mk        |   7 +
 .../testing/selftests/nommu/nommu_mmap_test.c | 261 +++++++++++++
 .../selftests/nommu/nommu_mremap_test.c       | 366 ++++++++++++++++++
 6 files changed, 661 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/nommu/Makefile
 create mode 100644 tools/testing/selftests/nommu/local.mk
 create mode 100644 tools/testing/selftests/nommu/nommu_mmap_test.c
 create mode 100644 tools/testing/selftests/nommu/nommu_mremap_test.c


base-commit: e8d0f6a1b2a447d02845984fa6288787543cb03c
-- 
2.43.0

