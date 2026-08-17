Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5CE3264D6;
	Mon, 17 Aug 2026 11:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965451; cv=none; b=BtaMzT+QlfW9Eybpjoy75z3aEKTAatJDs0VeqmuiaauP6UU6aFS2hGs8zEPzaoahUkM+KzG+P3cjd1JFHJ6p8BiM4f30HYxkfbMmmL7LL1UVIrzzwCbtPSJgt3k7hT4uDdtRi8tvK3gu4O32bLkeFlrCslQkrGyBw2EliWSwOV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965451; c=relaxed/simple;
	bh=Ihaz1lvEWL7Y8D1yiNDDGHVJcGEGy6cnTDk23qn6VkI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PmyEOGmsr5++ZfG6J5k/8samWsd8Uu2ViOaNAjydEIJSbxeEczmvLIspRdIvUVB1WscRROIYFdd36IfXluRk4/sMiNRcYxnbB3HVIt8/ei9BuiIBnQ7iZHEPUcPom6nKj3BTZcwJv5wsI5WyrJ/zg7QvgmWsjcX3+kyylHiD19E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Y0B/COY/; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Y0B/COY/"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 442961655;
	Mon, 17 Aug 2026 04:17:23 -0700 (PDT)
Received: from e127648.cambridge.arm.com (e127648.arm.com [10.1.39.91])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B62053F66F;
	Mon, 17 Aug 2026 04:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786965447; bh=Ihaz1lvEWL7Y8D1yiNDDGHVJcGEGy6cnTDk23qn6VkI=;
	h=From:To:Cc:Subject:Date:From;
	b=Y0B/COY/oPRfw9bUrSkFf7ewwB6s6B3IZArI/ntGGbcSrH4dr/8pJ1Lup0WakkNI6
	 CL5AAfqeINTfddxzAZjfieHrXynsK2jcb5G+eiC4jiAxjCXcYjNZwBxRLVGcWX9K2p
	 Z+mQYmHAsJVfPcozLdgcKu2PTbou8MHDRHRUqMWw=
From: Christian Loehle <christian.loehle@arm.com>
To: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Cc: Rama Krishna Katta <ramakrishna.katta@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Gregory Price <gourry.memverge@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Gabriel Krisman Bertazi <krisman@collabora.com>,
	linux-kernel@vger.kernel.org,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH 0/3] selftests: Skip SUD tests when unsupported
Date: Mon, 17 Aug 2026 12:16:08 +0100
Message-Id: <cover.1786965107.git.christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syscall User Dispatch (SUD) is unavailable on architectures without
generic syscall entry. Such architectures return -EINVAL for otherwise
valid SUD prctl and ptrace requests, which the SUD selftests currently
report as failures.

Probe SUD with a valid disabled configuration and skip the affected tests
when that probe returns EINVAL. Unexpected errors remain failures, and the
existing coverage is unchanged on kernels that support SUD.

Christian Loehle (3):
  selftests/ptrace: Skip get_set_sud if SUD is unsupported
  selftests/syscall_user_dispatch: Skip tests if SUD is unsupported
  selftests/syscall_user_dispatch: Skip benchmark if SUD is unsupported

 tools/testing/selftests/ptrace/get_set_sud.c  |  8 +++++
 .../syscall_user_dispatch/sud_benchmark.c     |  9 +++++
 .../syscall_user_dispatch/sud_test.c          | 36 +++++++++++++++++++
 3 files changed, 53 insertions(+)


base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
-- 
2.34.1
