Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3D7149C7B;
	Mon, 20 Jul 2026 08:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537498; cv=none; b=OI+mIGYgeLE8o8DDM9junV5i+1h4g5P2vasaB3vdcF2Vhn1P4uYddBSJ3/5RtONgZp/UQf4fJzR/bBsLNZ2k17u3PUh0LSfA7AanK03meNo4B0+ZfwSJ+7nsBNc4hGwhZQgC81uwhS2goasIshSdrmYAtgaLeDOctRFk9xvxpaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537498; c=relaxed/simple;
	bh=5W+uMnKvEBO8ltrhoxU60smIP8nmXqhDyPHGLK+dZKA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q+069VVm+llI0+lBB+fCYDyhD7QvEtWgQ1FgPlW9O37so5Jd/brgjL2UAja4c5g9EbHA4L+dynwhsE8uroASyxeHhH8d1Ssg2pBTrat3hVZXgB45gA/XCAFawFLArVwpUEA8ljy4ZDUirjjXR1/4eS7K+RvozMLcmiT1/4Cbgpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=y59Qo9EL; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="y59Qo9EL"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uJ79qPzp8tIhAiU3rMgJbhgxhoX8UnanAQA0Qwctxmg=;
	b=y59Qo9ELPLHaCjmtQS81az0HA0Er+BT/T4LY5yq7gfu0/V6q5t80pOUq50pJRwrwdDkhuhiSZ
	IhSNIoT3cI8tyF/yxZGEgzag9JgRhU8M6AcQLnKOhXZQ63rm9g6pVSCRjEdYhHLv3W/oDb5w6ZO
	rp2/03W+Wa30WZLPRhgP4zk=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4h3Ysv4HTbzRhWS;
	Mon, 20 Jul 2026 16:42:11 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id CB1844056E;
	Mon, 20 Jul 2026 16:51:31 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 20 Jul
 2026 16:51:28 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 0/2]  kselftest/arm64: Add two arm64 kselftests for orig_x0 issue
Date: Mon, 20 Jul 2026 16:51:43 +0800
Message-ID: <20260720085145.247690-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
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

Changes in v2:
- Update the 2st testcase to cover the corner case pointed out by Sashiko[1].

[1]: https://sashiko.dev/#/patchset/20260716120640.6590-1-will@kernel.org

Jinjie Ruan (2):
  kselftest/arm64: Add seccomp ptrace x0 bypass test
  kselftest/arm64: Add testcase for SECCOMP_RET_TRACE orig_x0 bypass

 tools/testing/selftests/arm64/abi/.gitignore  |   2 +
 tools/testing/selftests/arm64/abi/Makefile    |   2 +-
 .../arm64/abi/seccomp_ptrace_x0_bypass.c      | 181 ++++++++++++++++
 .../arm64/abi/seccomp_ret_trace_x0_bypass.c   | 196 ++++++++++++++++++
 4 files changed, 380 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c
 create mode 100644 tools/testing/selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c

-- 
2.34.1

