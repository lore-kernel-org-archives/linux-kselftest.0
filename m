Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8E839C62F;
	Mon, 17 Aug 2026 06:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786947126; cv=none; b=Ms+YPT19Fgk3MwPjThrG2uBu8iyxp+pSPD9MlHGNOnCktPvBGRZqhjGvFbw7cCDdb+qHK2iwOFYYoT7gDbk3US+VK7RPLItbFYYID1MD7NvNh2LOzJPwWFyPUKddKyQvSfSg8H6hfzHx7fF/vrlOsMeiyINy9sohJfDknh8nwbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786947126; c=relaxed/simple;
	bh=W1pIeZ6yJ3YawGBypxzJvcCnrAdwLJPxb4ID/ox0lWo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hxr7n23/+tXmbIxPAnvSeISUSCAdW1rLOxAQlgeUprf1RbN+FRDicig+SyzFBlIkqstGnULZYd6CeH506Hy3GssX4cQ/bsThtg84+AKGUfZhYwPopCgGchyFyOMfLg48/oeuJBmCGBVRX4r+fIkQ4/V3lTop9GazP351M3Lzexk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fmNL1X4E; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fmNL1X4E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=RF
	td/m5mm6PTDwnu/HoiqLPdGul31jJA7KSTIIBGKd4=; b=fmNL1X4E2UZWBBgmXt
	CA14bj/tuIIYCB0B9oeuCiOM/e1v4/2mfsf1fw8kVzfSEwW4bx3MhXCmcGAS3ST6
	pLw9dNrnMFyGHNAkpd1jwYWMTA+iPogXqmbo/diMwPtTmYB9ijmrGZ9RepmAVNJj
	ABPGL5on1+OQVhjGgohNAIkIk=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDnH_cJpoJq4trELg--.19700S2;
	Mon, 17 Aug 2026 14:11:21 +0800 (CST)
From: Lei Zhu <zhulei_szu@163.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: kuniyu@google.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	zhulei_szu@163.com
Subject: [PATCH net] selftests: af_unix: verify SCM_PIDFD pidfd in cmsg_check_dead()
Date: Mon, 17 Aug 2026 14:11:21 +0800
Message-Id: <20260817061121.239648-1-zhulei_szu@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgDnH_cJpoJq4trELg--.19700S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CryrGr1DWF48GF1UZF13Arb_yoW8XF1xpa
	4xJ3WfWF1FqFW2ka1Skr4kXF45ZFn3AFW0yr17GFyrArs5Gr93tr93Ka48AF1fGrZ0qws3
	uFySgayavF1DZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUwIfUUUUU=
X-CM-SenderInfo: x2kxzvxlbv63i6rwjhhfrp/xtbC7wnmNGqCpgmDcAAA3A

From: Lei Zhu <zhulei@kylinos.cn>

The cmsg_check_dead() function receives an expected_pid parameter but never
actually verifies that the pidfd received via SCM_PIDFD corresponds to that
PID. It only checks the child's exit code via PIDFD_GET_INFO.

Add a PID verification step using get_pid_from_fdinfo_file() to confirm
that the pidfd indeed points to the expected process, matching the
behavior already present in cmsg_check().

Fixes: 861bdc6314a4 ("selftests: net: extend SCM_PIDFD test to cover stale pidfds")
Signed-off-by: Lei Zhu <zhulei@kylinos.cn>
---
 tools/testing/selftests/net/af_unix/scm_pidfd.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/af_unix/scm_pidfd.c b/tools/testing/selftests/net/af_unix/scm_pidfd.c
index 2c18b92a2603..bfc99d0c5ac0 100644
--- a/tools/testing/selftests/net/af_unix/scm_pidfd.c
+++ b/tools/testing/selftests/net/af_unix/scm_pidfd.c
@@ -276,8 +276,15 @@ static int cmsg_check_dead(int fd, int expected_pid)
 		return 1;
 	}
 
+	/* pidfd from SCM_PIDFD should point to the client_pid */
+	pid_t pid = get_pid_from_fdinfo_file(*res.pidfd, "Pid:", sizeof("Pid:") - 1);
+	if (pid != expected_pid) {
+		log_err("wrong SCM_PIDFD %d != %d", pid, expected_pid);
+		close(*res.pidfd);
+		return 1;
+	}
+
 	/*
-	 * pidfd from SCM_PIDFD should point to the client_pid.
 	 * Let's read exit information and check if it's what
 	 * we expect to see.
 	 */
-- 
2.25.1

