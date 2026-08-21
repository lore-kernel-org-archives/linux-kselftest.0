Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DDD36B90A;
	Fri, 21 Aug 2026 03:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787281902; cv=none; b=Fwg31sqNbkMmC6x7b5jA2/Undai7ti5bz6TQaf0JTmcy9R0U239MKzSixt0m0DzBD+5gswmdC+EGXA22sIUxdgftL4HB3YZoqlrEu9kY717ege5OKOwfaPq5GxkooLhaAWkNYb/z/oDYVYbAnjce79lQe+mZPcjp83C/uUUjrlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787281902; c=relaxed/simple;
	bh=ULWw9P8PQtOL17OVEoPrEw2m1rlVneBFqVkGwLJQ5lM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ixv42l4OdjHG50oTei7zJ1NehaBu8Xx8d+fidcGA0vN7rNQrzdRL7B1cslOEhQHMRNTmE2e0hDrcnBw4E00TWu/Fu5xaoscWCnEirHDlY27YzRa3jOcNxNCH7GoN08TjGaA0oyXQzjn40uweAfvADV7xYgo4by1frHX9w5U+2DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mRCOhg4P; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mRCOhg4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=CJ
	DqKnCCgk/tXLbGk7PJa6zjqhwpfpvDDFZKt8Jz/V8=; b=mRCOhg4PPhQeu9kw4V
	ZOSaiUbFCRPjLV7VYFNH7Qno2fXBadtpbIvCJwPAe4vLkG919GUDRpJzVt7Tgf2F
	xHo7KmYPYhQ90v8LTcAmK0OMbIIPip+RlR8h7kQC50CfILGr5KkCtPX0GRCjXwbz
	HqfA4Cs4LAMgfEHPMrrcp934U=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgC3xOqKwYdqFwR9NQ--.29954S2;
	Fri, 21 Aug 2026 11:10:04 +0800 (CST)
From: Qingshuang Fu <fffsqian@163.com>
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	SeongJae Park <sjpark@amazon.de>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>,
	Qingshuang Fu <fffsqian@163.com>
Subject: [PATCH net v2 0/2] selftests/net: fixes for fin_ack_lat
Date: Fri, 21 Aug 2026 11:09:20 +0800
Message-Id: <20260821030922.1123754-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgC3xOqKwYdqFwR9NQ--.29954S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtry5uw18KF13ZrW5urykZrb_yoWkGwbE9r
	W8tas3Jrs8ur1qvan2gFnxAFW5C34rKFy8tws5Wa13X348Zr1kJFykAryrAFn2g3Z0kFy3
	XrsY9FWIyr12qjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRtkuUUUUUU==
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbCwg0Q2mqHwY3bRgAA35

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

This series fixes two bugs in the fin_ack_lat self-test.

Patch 1 fixes the swapped kill() arguments in sig_handler(), so the
server actually forwards SIGTERM to the client.  It also makes the
wrapper script's cleanup tolerant of ESRCH, since the client may now
exit before the kill command reaches its PID.

Patch 2 adds a missing fork() error check: on failure the code falls
into server()'s infinite accept loop, producing empty output that the
wrapper script treats as a passing test.

Qingshuang Fu (2):
  selftests/net: fix kill() argument order and wrapper cleanup in fin_ack_lat
  selftests/net: check fork() return value in fin_ack_lat

 tools/testing/selftests/net/fin_ack_lat.c  | 5 +++-
 tools/testing/selftests/net/fin_ack_lat.sh | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)
---
v1: https://lore.kernel.org/all/20260817091017.281104-1-fffsqian@163.com/

v2:
- Split into two patches
- Add shell cleanup tolerance for ESRCH per Sashiko-AI review
- Add missing fork() error check per Sashiko-AI review
-- 
2.25.1

