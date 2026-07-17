Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF782641EE;
	Fri, 17 Jul 2026 08:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278616; cv=none; b=GLVIJY8b5Eh2Jy9+Z59IJlyNUUgDp6L3XEMr9uulLTKuVXtaBjM8uQsjwheP3R0vuUzwYAYYTeBWXRj6OyLHSjvWeMmuAa8rsLeL+Bm3+QP5axcgVXEBOHX0MgtnpWfUr/dLAqPmBa5rL87uVOApqY4Mq/LfUxagIK2p75j6uu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278616; c=relaxed/simple;
	bh=OiNKwJaQ0fWF24hAiSEa0H1bEhzEXcUOZuyEx+yVPk4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QZbGH2R8q4Mlso5LLungv0K3MpZpF5lhIS+fgvqklKm24MG8TmgVnWXK7tqEVSGGIPf1dyBIpXTepe65otWYMIeaXhl0XaFhkHpV/0JggJ4aH8UA5rs7wUt87onYrlHiF3gdC8TGwqdTHvzZHBlvj0aYO4nKwQSwwYMXzIpNAlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=hyXUlhrF; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="hyXUlhrF"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fnWWKY3jUyvFAVGnDhy667vWqgMgOhf/RxaMoH5KneI=;
	b=hyXUlhrFwbquaS8RoR87XIRNROzKPpzzdr+iK2dVUPXUc2UyDJwfa06aM+cVQI27IQowhZBIk
	hHvXfd0jygON+SrJxlCnf/Iyoprgl6hytUQUxlc5gTzyXoeCxaiOihrL+PSQd4KJprzhrF6VUYr
	LD/GMhcvOgKkzR9Nxy8ENs8=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4h1k7R15KqzRhQR;
	Fri, 17 Jul 2026 16:47:31 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7F31620333;
	Fri, 17 Jul 2026 16:56:49 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 17 Jul
 2026 16:56:48 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<kees@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 0/2] kselftest/arm64: Add two arm64 kselftests for orig_x0 issue
Date: Fri, 17 Jul 2026 16:56:55 +0800
Message-ID: <20260717085657.3600248-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)

Recently, a security issue related to orig_x0 was discovered and fixed
in arm64, but there are still no test cases covering it. Seccomp,
tracepoints, and audit can observe a stale value for x0 after a ptracer
or SECCOMP_RET_TRACE modifies x0.

As Kees suggested, this series adds two kselftests for arm64 that validate
the orig_x0 re-synchronisation fix in ptrace, the first one is for ptrace
update, the second one is for SECCOMP_RET_TRACE update.

Link: https://lore.kernel.org/all/20260716120640.6590-1-will@kernel.org/
Link: https://lore.kernel.org/all/202607152004.DEA95D63@keescook/

Jinjie Ruan (2):
  kselftest/arm64: Add seccomp ptrace x0 bypass test
  kselftest/arm64: Add SECCOMP_RET_TRACE x0 bypass test

 tools/testing/selftests/arm64/abi/.gitignore  |   2 +
 tools/testing/selftests/arm64/abi/Makefile    |   2 +-
 .../arm64/abi/seccomp_ptrace_x0_bypass.c      | 181 +++++++++++++
 .../arm64/abi/seccomp_ret_trace_x0_bypass.c   | 249 ++++++++++++++++++
 4 files changed, 433 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c
 create mode 100644 tools/testing/selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c

-- 
2.34.1

