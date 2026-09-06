Received: from out-2uec-a117.jellyfish.systems (out-2uec-a117.jellyfish.systems [63.250.43.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE6230C177
	for <linux-kselftest@vger.kernel.org>; Sun,  6 Sep 2026 14:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788705687; cv=none; b=gJeXJLINR8mtto9TV0trsbpyhrh5MvrhC8PDBYdbffP01LgQq9E7vU42UHO0SVABECAZKHP7OSHs1VMTBUH5dbnfdEXvCC3nKQcQ2n8NmRNIX02VaMrcK21COWE4V4ppaLgJb+DjrM9prPGfjzOvwDBIeBtw3jY8QChiMRPygLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788705687; c=relaxed/simple;
	bh=kBziXRb4xkro2U105NfHH7Bc5Xtf9RDCbcH+RfIsoKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JmU4e0De8gbTvb+anDduqfSZANJnACHMdgmJ0HjEeEuTm85vNbIpyEuefCIyN2LvEVQMibZhqBgdHJxsGEhjFj09v2SW/4s7K7Ek+r0j5y72zjILzFvhpBLvwd3w7Kne9yXWGm91zv7qk6IcPoafUxrN+gqbHGf8PNSEYm98ej0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=nIQTjkzh; arc=none smtp.client-ip=63.250.43.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="nIQTjkzh"
Received: from fedora (unknown [69.5.53.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hdBY20MYsz8sWS;
	Sun, 06 Sep 2026 13:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788702921;
	bh=71YrgSHuZLndedm9wwmiiZbkg6WKcS9DSEAI9LncDTA=;
	h=From:To:Cc:Subject:Date:From;
	b=nIQTjkzhP3mMxcgtv6hVEzKICczIiefvHU4djych37cg90+VGYIyc0ou8z5MaugC8
	 Re6WO/iM60BC1ZcJXWNeOZyHgRYWhzni1+3yuGX0Tqf2sItqkrcQ6CC21V/NifByuv
	 MrcyMewg9qJSrw7VoetNH3jNb9BbwiDm/hsNE2GcYRPTvFXx5zyarQ35UvttyJcUQm
	 lldSXbHfRuaFd3nN/tL/TZD0eOfcuh3g/PBTuM74ddRAIhKtdV63r161tvUtW7lnZx
	 kxsdTEEJxAlGF8wc+JMuM1GMPHv/nCxrxdAvTFi/lgaHnf27WNKoh4xq9EJLncVD43
	 MBQm2xpamxSqA==
From: Tianyi Chen <hi@tychen.cc>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>
Cc: Tianyi Chen <hi@tychen.cc>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Shuah Khan <shuah@kernel.org>,
	sched-ext@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cheng-Yang Chou <yphbchou0911@gmail.com>
Subject: [PATCH] selftests/sched_ext: Fail interrupted test runs
Date: Sun,  6 Sep 2026 21:54:55 +0800
Message-ID: <20260906135507.749280-1-hi@tychen.cc>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

SIGINT and SIGTERM set exit_req, causing the runner to stop before
executing the remaining tests. However, the exit status only reflects
the number of failed tests, so an interrupted run returns success when
none of the completed tests failed.

Include exit_req in the failure condition so callers can distinguish
an interrupted run from a successful run. Keep the result counts
limited to the tests that actually ran.

Tested the actual runner under GDB, delivering each signal before the
first test and after the example test passed. The original runner
returns 0 in all four cases; the fixed runner returns 1. Normal -h,
-l and -t example invocations still return 0.

Fixes: 9d851afa4826 ("selftests/sched_ext: Abort test loop on signal")
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/selftests/sched_ext/runner.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/sched_ext/runner.c b/tools/testing/selftests/sched_ext/runner.c
index c264807caa9..57dda75384f 100644
--- a/tools/testing/selftests/sched_ext/runner.c
+++ b/tools/testing/selftests/sched_ext/runner.c
@@ -243,7 +243,7 @@ int main(int argc, char **argv)
 			printf("  - %s\n", failed_tests[i]);
 	}
 
-	return failed > 0 ? 1 : 0;
+	return failed > 0 || exit_req ? 1 : 0;
 }
 
 void scx_test_register(struct scx_test *test)
-- 
2.55.0

