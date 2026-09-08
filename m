Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F6B3F9287;
	Tue,  8 Sep 2026 21:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903620; cv=none; b=u1QQ9HeWkzQkuHoSYYxU4XJ6J5ItrhGrwDiMhWaLDTbf+sNw2HAgTH1QEbcX3VrODFRa3MSpHsBdfOyK3CRdoc9HDWS9dzEnDxzEnRBf7g7pyU9z5zWFlYwECP1P76LzbEXKqI9FnVPgfyGXj/+Kg43Q45XcWwn2z1WY188nYxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903620; c=relaxed/simple;
	bh=ICrXzBqfPMyThmyYNTa/Dg+VKyisn03IXS+pce9U35E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eufmtx+3lP26g79RxTAWPgN/duOlQ8DrxGfVl0DQTmQtwaEgRsofBQDD84kjBM5L+ubTgX177oTvwAhYtZRZ4QIp15dQm4BGEWWerjSj3lbg2sDxV52Vh4ZUfCxaWnl9RxoGx0GB7TnOAqpTxOqfyEWYNBr1Gufnrl+eD6UC5ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=jvZOycea; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="jvZOycea"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=+pqJ5h/gVv5Dhpl+bdkK6SiuAijwnlSUNM6EAKnflhc=; b=jvZOyceaFEm+
	B1yqjSgMpSh7uyCn7t7IUlvOOoGoNCR3wEnCMmuTR7YCNImjfWKhmcZa2PIikQt93F+6QOtqcLqsT
	9nUp3UMd3amoCMJDrHiU9oVHhGSj/CfRFqyilC4F2kT7xm9zgHg0rMWp7P7yrToOcYxuypUDJIZnf
	G6HV0ngLBf3OrWO57KSl89V5dfE8CSro0hgkENtFik0TjuMfVA8vDib4wftumz2QtsXRy9reW22xl
	vB9SehCdlFlnI1GnApHkiTROPSGg1DpKeike8w5SS/+H0snOs1shLx14PLd7oRurNn0sOD6/CznLC
	cggpc9VzQhvcuaQa8oFNJQ==;
Received: from ch-vpn.virtuozzo.com ([130.117.225.6] helo=LekKit-T14)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <eva.kurchatova@virtuozzo.com>)
	id 1x43VT-002fKl-28;
	Tue, 08 Sep 2026 23:40:00 +0200
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests: syscall_user_dispatch: keep the frame pointer in sud_benchmark
Date: Wed,  9 Sep 2026 00:40:00 +0300
Message-ID: <20260908214001.2679479-1-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SIGSYS handler in sud_benchmark returns by hand: it loads
__NR_rt_sigreturn, runs leaveq to drop its frame, adjusts the stack and
issues the syscall. leaveq restores the stack from the frame pointer, so
the sequence only works in a function that has one.

gcc omits the frame pointer from -O1 up, so the handler restores a stack
that is not the signal frame and rt_sigreturn resumes at a bogus address:

  Caught sys_ff00
  Segmentation fault

The Makefile passes no -O, so a default build gets -O0 and works. A
distribution building the selftests with its own optimisation flags does
not: -O1 and -O2 both fault, and both pass again with
-fno-omit-frame-pointer.

Ask for the frame pointer, which is what the assembly needs. sud_test
does not use it and is unaffected.

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 tools/testing/selftests/syscall_user_dispatch/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/syscall_user_dispatch/Makefile b/tools/testing/selftests/syscall_user_dispatch/Makefile
index 03c120270953..249d9ed30c5c 100644
--- a/tools/testing/selftests/syscall_user_dispatch/Makefile
+++ b/tools/testing/selftests/syscall_user_dispatch/Makefile
@@ -3,7 +3,7 @@ top_srcdir = ../../../..
 INSTALL_HDR_PATH = $(top_srcdir)/usr
 LINUX_HDR_PATH = $(INSTALL_HDR_PATH)/include/
 
-CFLAGS += -Wall -I$(LINUX_HDR_PATH)
+CFLAGS += -Wall -fno-omit-frame-pointer -I$(LINUX_HDR_PATH)
 
 TEST_GEN_PROGS := sud_test sud_benchmark
 include ../lib.mk
-- 
2.55.0

