Received: from smtph3-05.21cn.com (smtph3-05.21cn.com [150.223.194.107])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E917B425CC6;
	Tue,  1 Sep 2026 02:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.223.194.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231355; cv=none; b=nKpU5l+L5LUZ79TeS7u7NaR6xkw8CGkVdk534qFB/aKnMCpt9/E5ih2whTyxXwPZdsD1g1i6k2t3oGtmAKFgn74lG32vHGdPQCmCRk0GGASQCzR8GSkyiG8MlSj/Jr7EO70dR2vStE8o7zIvccaYH3zF/f+NEsBVt5XMvYp0ppg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231355; c=relaxed/simple;
	bh=FK0oujqZrzfmpznB4R4N8bIo1NBQAuZJk7/i6Wh/YnU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LzlMxXGSnaAtQbA/bQUedXqjomZGaM9mdhgQ6fHTmzCqKln+q5dKk2m50A52UcwstPTuHS3dzxFihPYWtZbsZceJobP3wxyoF5qzur1JrQ33dMXhoLprh631VyjLpEHX3f2THKNPu64ip9ELAHNfPrIfFMahuzrkENyu64ow+7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chinatelecom.cn; spf=pass smtp.mailfrom=chinatelecom.cn; arc=none smtp.client-ip=150.223.194.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chinatelecom.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chinatelecom.cn
HMM_SOURCE_IP:172.27.0.101:0.173858605
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-139.200.108.11 (unknown [172.27.0.101])
	by smtph3-05.21cn.com (HERMES) with SMTP id 014B31402F0E4;
	Tue,  1 Sep 2026 10:44:54 +0800 (CST)
X-189-SAVE-TO-SEND: +pengqh1@chinatelecom.cn
Received: from  ([139.200.108.11])
	by gateway-ssl-dep-7c9d777cd6-x28fn with ESMTP id b78d24f82f2d490791e3e49d533111c6 for shuah@kernel.org;
	Tue, 01 Sep 2026 10:45:18 CST
X-Transaction-ID: b78d24f82f2d490791e3e49d533111c6
X-Real-From: pengqh1@chinatelecom.cn
X-Receive-IP: 139.200.108.11
X-MEDUSA-Status: 0
Sender: pengqh1@chinatelecom.cn
From: Qianheng Peng <pengqh1@chinatelecom.cn>
To: shuah@kernel.org,
	broonie@kernel.org,
	jackmanb@google.com,
	liuhangbin@gmail.com,
	rbm@suse.com
Cc: skhan@linuxfoundation.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengqh1@chinatelecom.cn
Subject: Re: [PATCH] selftests: runner.sh: avoid overriding kselftest_cmd_args with empty variable
Date: Tue,  1 Sep 2026 10:44:52 +0800
Message-Id: <20260901024452.485159-1-pengqh1@chinatelecom.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1784010883-25386-1-git-send-email-pengqh1@chinatelecom.cn>
References: <1784010883-25386-1-git-send-email-pengqh1@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 14 Jul 2026 14:34:43, Qianheng Peng wrote:
>Normally the value of kselftest_cmd_args can be read from settings file,
>but it will be overridden by KSELFTEST_TEST_KMOD_SH_ARGS which can be
>empty if user did not give it a real value.So it should be better to
>check if KSELFTEST_TEST_KMOD_SH_ARGS is emty before referring its
>value to kselftest_cmd_args.
>
>Signed-off-by: QianhengPeng <pengqh1@chinatelecom.cn>
>---
> tools/testing/selftests/kselftest/runner.sh | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)
>
>diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
>index 311811d..a99147a 100644
>--- a/tools/testing/selftests/kselftest/runner.sh
>+++ b/tools/testing/selftests/kselftest/runner.sh
>@@ -103,6 +103,15 @@ run_one()
> 		ktap_print_msg "timeout set to $kselftest_timeout" >> "$logfile"
> 	fi
> 
>+	# Exported environment variable overrides the settings file
>+	eval kselftest_eval_cmd_args="\$${kselftest_cmd_args_ref:-}"
>+	if [ -n "$kselftest_eval_cmd_args" ]; then
>+		kselftest_cmd_args=$kselftest_eval_cmd_args
>+		ktap_print_msg "overriding cmd_args to $kselftest_cmd_args" >> "$logfile"
>+	elif [ -n "$kselftest_cmd_args" ]; then
>+		ktap_print_msg "cmd_args set to $kselftest_cmd_args" >> "$logfile"
>+	fi
>+
> 	TEST_HDR_MSG="selftests: $DIR: $BASENAME_TEST"
> 	echo "# $TEST_HDR_MSG"
> 	if [ ! -e "$TEST" ]; then
>@@ -113,7 +122,6 @@ run_one()
> 		if [ -x /usr/bin/stdbuf ]; then
> 			stdbuf="/usr/bin/stdbuf --output=L "
> 		fi
>-		eval kselftest_cmd_args="\$${kselftest_cmd_args_ref:-}"
> 		if [ -x "$TEST" ]; then
> 			cmd="$stdbuf ./$BASENAME_TEST $kselftest_cmd_args"
> 		elif [ -x "./ksft_runner.sh" ]; then
>-- 
>1.8.3.1
>

Gentle ping. This patch has been sent on July and has not got response since then.
The patch still applies cleanly to current mainline.Glad to resend if it's preferable.

Thanks and Regards,
Qianheng
