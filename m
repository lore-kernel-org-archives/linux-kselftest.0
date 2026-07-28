Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B9D1A9FBD;
	Tue, 28 Jul 2026 02:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785204667; cv=none; b=eiWZv3yXR5StoyTgGBJr0RZP23r3z7gf3X6ue0WcUpwunZ1AJ0jHRT8LfYFA1VfgKVq+aN6E+xd5M+9aq87Wo192AX4lj3dhVCIseUvRbakkbTM1p1k0sslnaQjeHIrp5aLeWrDMhBnYyyQXxdKmsYshUJ9XYvI1zkLahaj8GEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785204667; c=relaxed/simple;
	bh=6zU0MuThfjPufJv/8wuKrSMcmiYwdcbqzVVXHd7JSL0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dSOu/qYoXJZtwawF0LxjocujrsZsvhzhTPZmZzM6UHv5TtB7Fy+tvJ3YYLaNNLE1eXUYFvrWLHftnkpjQsBLsYU4l109+TIcxuH9/9UU2RKfiPgKkz1lRSF/8gukMfJ+lYe7yWpTFo8K6sizuekOhe9lCgwATek4yV5dTzIq/8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=F0gyrv5O; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="F0gyrv5O"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0g6CbC5gObhDGQMMDEnW8zUWbV2GBVrKDUZHev+in3Q=;
	b=F0gyrv5OE7RBZwUbMDneReqJEx0rdDanoHk21XVp2DY8CPucSL7Zb95x/Jk6rytLHMZpSTGYd
	Gqb1aKlGHIRJeV2LkU1+aJvWSUELw1vKI7X7Ln+neiemO4VDLW/hZS/tE1ab3jFNkOYuUt72+BV
	4aOhX0/KF6YrjQlbswzp9pw=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4h8Jbw50fxzRhV4;
	Tue, 28 Jul 2026 10:01:32 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B3A2E40538;
	Tue, 28 Jul 2026 10:10:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 28 Jul
 2026 10:10:57 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3 0/2] kselftest/arm64: Add two arm64 kselftests for orig_x0 issue
Date: Tue, 28 Jul 2026 10:11:20 +0800
Message-ID: <20260728021122.2640104-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)

Recently, a security issue related to orig_x0 was discovered and fixed
in arm64, but there are still no test cases covering it. Seccomp,
tracepoints, and audit can observe a stale value for x0 after a ptracer
or SECCOMP_RET_TRACE modifies x0.

As Kees suggested, this series adds two kselftests for arm64 that validate
the orig_x0 re-synchronisation fix in ptrace, the first one is for ptrace
update, the second one is for SECCOMP_RET_TRACE update.

Link: https://lore.kernel.org/all/20260717182758.17111-1-will@kernel.org/
Link: https://lore.kernel.org/all/20260716120640.6590-1-will@kernel.org/
Link: https://lore.kernel.org/all/202607152004.DEA95D63@keescook/

Changes in v3:
- Fix Big Endian issues.
- Add missing fork error check.
- Fix error BPF branch offset.
- Tighten exit status checks to ensure the child was terminated
  precisely by the expected SIGSYS signal.

Link: https://sashiko.dev/#/patchset/20260720085145.247690-1-ruanjinjie%40huawei.com

Changes in v2:
- Update the 2st testcase to cover the corner case pointed out
  by Sashiko[1].

[1]: https://sashiko.dev/#/patchset/20260716120640.6590-1-will@kernel.org

Jinjie Ruan (2):
  kselftest/arm64: Add seccomp ptrace x0 bypass test
  kselftest/arm64: Add testcase for SECCOMP_RET_TRACE orig_x0 bypass

 tools/testing/selftests/arm64/abi/.gitignore  |   2 +
 tools/testing/selftests/arm64/abi/Makefile    |   2 +-
 .../arm64/abi/seccomp_ptrace_x0_bypass.c      | 195 +++++++++++++++++
 .../arm64/abi/seccomp_ret_trace_x0_bypass.c   | 204 ++++++++++++++++++
 4 files changed, 402 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c
 create mode 100644 tools/testing/selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c

-- 
2.34.1

