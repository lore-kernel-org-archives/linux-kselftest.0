Received: from smtph3-08.21cn.com (smtph3-08.21cn.com [150.223.194.133])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D259F3DB310;
	Tue, 14 Jul 2026 06:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.223.194.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011400; cv=none; b=qUPqJRxipSE8B2yb5Wgaga5t/dh/Duo/vnFkgSebReRk/ZTlnA8hF+AuPeYxXnO71FaJu73d8xunFZR/eQ2jD3mLRg+jbSBP4PEDBpdO7ez/IsM62thBVMJPJKBPUZAtuCDWDfpJqz+21hYKK1o3+GbwAcPS2wNx2HWNmzgmj3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011400; c=relaxed/simple;
	bh=hl2mc+SiuYGSLcFxilPqreeKz41deeqjQvPyMoshNwc=;
	h=From:To:Cc:Subject:Date:Message-Id; b=PiMiwq5FRSPqdKPwGzvkd+qJvG/9m3faxf4bGxOo7X9YmAcMZc0j+rUYPpYSWqW+Qmb+ii8Hsh4ks6MVE3gEYMcM3xRyRXMInEZvLcE7E2kId3YXT1RgzQwR9BhsTGUruqehLN6uFRQsVBYriSTWE9Kn7LZLzJ8AmNtM4QRg9vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chinatelecom.cn; spf=pass smtp.mailfrom=chinatelecom.cn; arc=none smtp.client-ip=150.223.194.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chinatelecom.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chinatelecom.cn
HMM_SOURCE_IP:172.27.0.98:0.1526737248
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-139.200.108.11 (unknown [172.27.0.98])
	by smtph3-08.21cn.com (HERMES) with SMTP id C358B1407C19D;
	Tue, 14 Jul 2026 14:35:16 +0800 (CST)
X-189-SAVE-TO-SEND: +pengqh1@chinatelecom.cn
Received: from  ([139.200.108.11])
	by gateway-ssl-dep-657b8df9db-d66cm with ESMTP id c120d3a4b3ba41ac9674a6a7513b7a17 for shuah@kernel.org;
	Tue, 14 Jul 2026 14:35:43 CST
X-Transaction-ID: c120d3a4b3ba41ac9674a6a7513b7a17
X-Real-From: pengqh1@chinatelecom.cn
X-Receive-IP: 139.200.108.11
X-MEDUSA-Status: 0
Sender: pengqh1@chinatelecom.cn
From: QianhengPeng <pengqh1@chinatelecom.cn>
To: shuah@kernel.org,
	broonie@kernel.org,
	jackmanb@google.com,
	liuhangbin@gmail.com,
	rbm@suse.com
Cc: skhan@linuxfoundation.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengqh1@chinatelecom.cn
Subject: [PATCH] selftests: runner.sh: avoid overriding kselftest_cmd_args with empty variable
Date: Tue, 14 Jul 2026 14:34:43 +0800
Message-Id: <1784010883-25386-1-git-send-email-pengqh1@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

Normally the value of kselftest_cmd_args can be read from settings file,
but it will be overridden by KSELFTEST_TEST_KMOD_SH_ARGS which can be
empty if user did not give it a real value.So it should be better to
check if KSELFTEST_TEST_KMOD_SH_ARGS is emty before referring its
value to kselftest_cmd_args.

Signed-off-by: QianhengPeng <pengqh1@chinatelecom.cn>
---
 tools/testing/selftests/kselftest/runner.sh | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 311811d..a99147a 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -103,6 +103,15 @@ run_one()
 		ktap_print_msg "timeout set to $kselftest_timeout" >> "$logfile"
 	fi
 
+	# Exported environment variable overrides the settings file
+	eval kselftest_eval_cmd_args="\$${kselftest_cmd_args_ref:-}"
+	if [ -n "$kselftest_eval_cmd_args" ]; then
+		kselftest_cmd_args=$kselftest_eval_cmd_args
+		ktap_print_msg "overriding cmd_args to $kselftest_cmd_args" >> "$logfile"
+	elif [ -n "$kselftest_cmd_args" ]; then
+		ktap_print_msg "cmd_args set to $kselftest_cmd_args" >> "$logfile"
+	fi
+
 	TEST_HDR_MSG="selftests: $DIR: $BASENAME_TEST"
 	echo "# $TEST_HDR_MSG"
 	if [ ! -e "$TEST" ]; then
@@ -113,7 +122,6 @@ run_one()
 		if [ -x /usr/bin/stdbuf ]; then
 			stdbuf="/usr/bin/stdbuf --output=L "
 		fi
-		eval kselftest_cmd_args="\$${kselftest_cmd_args_ref:-}"
 		if [ -x "$TEST" ]; then
 			cmd="$stdbuf ./$BASENAME_TEST $kselftest_cmd_args"
 		elif [ -x "./ksft_runner.sh" ]; then
-- 
1.8.3.1

