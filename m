Received: from smtph3-03.21cn.com (smtph3-03.21cn.com [150.223.194.104])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1AE18FDDE;
	Tue,  1 Sep 2026 12:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.223.194.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265107; cv=none; b=EXTYENUt0VPyeHmvXlt3AsVXWbTmmrgk3YRBRp7JUJ9QomdUt+0t2JOUEXmChsy/5XCC5Jjwj0pGc8KC9WQu2ZWEtt/+gSITlIcX2KqZZNLg6fvRomJN+Ghk8bWt9uaUjQnRhcnhNQG1xhAZ87WOhCKTqPQelEIj91ho0s3TSeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265107; c=relaxed/simple;
	bh=kSLa8JMeKs1Irxes2vMKhgggHFU9SA5IjVOCi4sk2dE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jgwBowgpVJqOpWg07wM7HZDaYCaA1OrUO+eNfTX73adQmMkrgcxwOVmr1RT/WKSA0+9/IT3m6nCv4M/IMb9dzmSw3HpPrdv0myIdC5KJvvu4YsHEZ4MZVLosojNz/YKqpOxGX0WE+9g5ZJzxjLLvSyZOB2ACrRQOrvI1IxauFZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chinatelecom.cn; spf=pass smtp.mailfrom=chinatelecom.cn; arc=none smtp.client-ip=150.223.194.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chinatelecom.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chinatelecom.cn
HMM_SOURCE_IP:172.27.0.98:0.1489982587
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-139.200.108.11 (unknown [172.27.0.98])
	by smtph3-03.21cn.com (HERMES) with SMTP id 71292C02D043;
	Tue,  1 Sep 2026 20:07:23 +0800 (CST)
X-189-SAVE-TO-SEND: +pengqh1@chinatelecom.cn
Received: from  ([139.200.108.11])
	by gateway-ssl-dep-7c9d777cd6-vsjrc with ESMTP id 3cf9ec87b8614342b25ff0f249a5d641 for hangbin.liu@linux.dev;
	Tue, 01 Sep 2026 20:07:39 CST
X-Transaction-ID: 3cf9ec87b8614342b25ff0f249a5d641
X-Real-From: pengqh1@chinatelecom.cn
X-Receive-IP: 139.200.108.11
X-MEDUSA-Status: 0
Sender: pengqh1@chinatelecom.cn
From: Qianheng Peng <pengqh1@chinatelecom.cn>
To: hangbin.liu@linux.dev
Cc: broonie@kernel.org,
	jackmanb@google.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	liuhangbin@gmail.com,
	pengqh1@chinatelecom.cn,
	rbm@suse.com,
	shuah@kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] selftests: runner.sh: avoid overriding kselftest_cmd_args with empty variable
Date: Tue,  1 Sep 2026 20:07:22 +0800
Message-Id: <20260901120722.1875597-1-pengqh1@chinatelecom.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <apae5q5R546M6283@fedora>
References: <apae5q5R546M6283@fedora>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hangbin,
On Tue, 1 Sep 2026 17:46:14, Hangbin Liu wrote:
>Hi Qianheng
>On Tue, Sep 01, 2026 at 10:44:52AM +0800, Qianheng Peng wrote:
>> On Tue, 14 Jul 2026 14:34:43, Qianheng Peng wrote:
>> >Normally the value of kselftest_cmd_args can be read from settings file,
>> >but it will be overridden by KSELFTEST_TEST_KMOD_SH_ARGS which can be
>> >empty if user did not give it a real value.So it should be better to
>> >check if KSELFTEST_TEST_KMOD_SH_ARGS is emty before referring its
>> >value to kselftest_cmd_args.
>
>Where does KSELFTEST_TEST_KMOD_SH_ARGS from? kmod testing? If yes,
>can we fix it there?

Sorry for my confusing commit message and poor English.
In fact the problem is not KSELFTEST_TEST_KMOD_SH_ARGS but empty
kselftest_cmd_args_ref.
If user does not export "KSELFTEST_${BASENAME_SANITIZED}_ARGS" (the
${BASENAME_SANITIZED} here can be anything like KMOD or RTCTEST) explicitly,
kselftest_cmd_args_ref will be empty by default and override kselftest_cmd_args.
So this patch will check whether kselftest_cmd_args_ref is empty before
starting one test.

Thanks,
Qianheng

>
>Thanks
>Hangbin
>
>> >
>> >Signed-off-by: QianhengPeng <pengqh1@chinatelecom.cn>
>> >---
>> > tools/testing/selftests/kselftest/runner.sh | 10 +++++++++-
>> > 1 file changed, 9 insertions(+), 1 deletion(-)
>> >
>> >diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
>> >index 311811d..a99147a 100644
>> >--- a/tools/testing/selftests/kselftest/runner.sh
>> >+++ b/tools/testing/selftests/kselftest/runner.sh
>> >@@ -103,6 +103,15 @@ run_one()
>> > 		ktap_print_msg "timeout set to $kselftest_timeout" >> "$logfile"
>> > 	fi
>> > 
>> >+	# Exported environment variable overrides the settings file
>> >+	eval kselftest_eval_cmd_args="\$${kselftest_cmd_args_ref:-}"
>> >+	if [ -n "$kselftest_eval_cmd_args" ]; then
>> >+		kselftest_cmd_args=$kselftest_eval_cmd_args
>> >+		ktap_print_msg "overriding cmd_args to $kselftest_cmd_args" >> "$logfile"
>> >+	elif [ -n "$kselftest_cmd_args" ]; then
>> >+		ktap_print_msg "cmd_args set to $kselftest_cmd_args" >> "$logfile"
>> >+	fi
>> >+
>> > 	TEST_HDR_MSG="selftests: $DIR: $BASENAME_TEST"
>> > 	echo "# $TEST_HDR_MSG"
>> > 	if [ ! -e "$TEST" ]; then
>> >@@ -113,7 +122,6 @@ run_one()
>> > 		if [ -x /usr/bin/stdbuf ]; then
>> > 			stdbuf="/usr/bin/stdbuf --output=L "
>> > 		fi
>> >-		eval kselftest_cmd_args="\$${kselftest_cmd_args_ref:-}"
>> > 		if [ -x "$TEST" ]; then
>> > 			cmd="$stdbuf ./$BASENAME_TEST $kselftest_cmd_args"
>> > 		elif [ -x "./ksft_runner.sh" ]; then
>> >-- 
>> >1.8.3.1
>> >
>> 
>> Gentle ping. This patch has been sent on July and has not got response since then.
>> The patch still applies cleanly to current mainline.Glad to resend if it's preferable.
>> 
>> Thanks and Regards,
>> Qianheng
