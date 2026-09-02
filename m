Received: from smtph3-04.21cn.com (smtph3-04.21cn.com [150.223.194.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72221B808;
	Wed,  2 Sep 2026 03:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.223.194.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319035; cv=none; b=uQNajTrJkFiSmFRL02dzav9p2uJNjGLljcgnnUo6oLLf2taRYBgPT2pcwzdpX7uArb9WOUnHorx8LZaGrHz9beEh0P+omHhj2y+pNWkSKytfFsV1tNsRmmpdwFLjp124q75DwXCP8MVcasKAejxfXIDZOwsxe6qWSTr+8qszuns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319035; c=relaxed/simple;
	bh=unPnEQFg1MDzNYGypZCYeba5YYKs3uRrd/AnvSmBR4c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BL51cN2p5YXGTfbfS9ggaDFF5kSfE/ffuZ9v1FhL1ur1bOw3VQ7KeD4Ql6J8fudHjmLyZMGHUwXvuWiUplqBTqCisyF9FRwH7D5QBERIyD9Ly2tEL0jQoLbaJ4STb5WAylB9++RpnX6M9dzbI4m0tdV3Y4KNyJrCjn5JqYtFGB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chinatelecom.cn; spf=pass smtp.mailfrom=chinatelecom.cn; arc=none smtp.client-ip=150.223.194.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chinatelecom.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chinatelecom.cn
HMM_SOURCE_IP:172.27.0.100:0.1311608650
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-139.200.108.11 (unknown [172.27.0.100])
	by smtph3-04.21cn.com (HERMES) with SMTP id 2B896C00FA88;
	Wed,  2 Sep 2026 11:05:48 +0800 (CST)
X-189-SAVE-TO-SEND: +pengqh1@chinatelecom.cn
Received: from  ([139.200.108.11])
	by gateway-ssl-dep-7c9d777cd6-4x4jl with ESMTP id 2e805e01882d4cd8821156e5ff4c00ff for hangbin.liu@linux.dev;
	Wed, 02 Sep 2026 11:06:15 CST
X-Transaction-ID: 2e805e01882d4cd8821156e5ff4c00ff
X-Real-From: pengqh1@chinatelecom.cn
X-Receive-IP: 139.200.108.11
X-MEDUSA-Status: 0
Sender: pengqh1@chinatelecom.cn
From: Qianheng Peng <pengqh1@chinatelecom.cn>
To: hangbin.liu@linux.dev
Cc: broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	liuhangbin@gmail.com,
	pengqh1@chinatelecom.cn,
	rbm@suse.com,
	shuah@kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] selftests: runner.sh: avoid overriding kselftest_cmd_args with empty variable
Date: Wed,  2 Sep 2026 11:05:42 +0800
Message-Id: <20260902030542.532572-1-pengqh1@chinatelecom.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <apd8mqEoyk8_O8ar@fedora>
References: <apd8mqEoyk8_O8ar@fedora>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2026-09-02  1:32 UTC, Hangbin Liu wrote:
>On Tue, Sep 01, 2026 at 08:07:22PM +0800, Qianheng Peng wrote:
>> Hi Hangbin,
>> On Tue, 1 Sep 2026 17:46:14, Hangbin Liu wrote:
>> >Hi Qianheng
>> >On Tue, Sep 01, 2026 at 10:44:52AM +0800, Qianheng Peng wrote:
>> >> On Tue, 14 Jul 2026 14:34:43, Qianheng Peng wrote:
>> >> >Normally the value of kselftest_cmd_args can be read from settings file,
>> >> >but it will be overridden by KSELFTEST_TEST_KMOD_SH_ARGS which can be
>> >> >empty if user did not give it a real value.So it should be better to
>> >> >check if KSELFTEST_TEST_KMOD_SH_ARGS is emty before referring its
>> >> >value to kselftest_cmd_args.
>> >
>> >Where does KSELFTEST_TEST_KMOD_SH_ARGS from? kmod testing? If yes,
>> >can we fix it there?
>> 
>> Sorry for my confusing commit message and poor English.
>> In fact the problem is not KSELFTEST_TEST_KMOD_SH_ARGS but empty
>> kselftest_cmd_args_ref.
>> If user does not export "KSELFTEST_${BASENAME_SANITIZED}_ARGS" (the
>> ${BASENAME_SANITIZED} here can be anything like KMOD or RTCTEST) explicitly,
>> kselftest_cmd_args_ref will be empty by default and override kselftest_cmd_args.
>> So this patch will check whether kselftest_cmd_args_ref is empty before
>> starting one test.
>
>Oh, I see what you mean now.
>
>	kselftest_cmd_args_ref="KSELFTEST_${BASENAME_SANITIZED}_ARGS"
>
>This is used to retrieve parameters for a *specific* test. When a test does not
>require extra parameters, `KSELFTEST_${BASENAME_SANITIZED}_ARGS` is not set.
>This has the same effect as when a user exports it but does not assign a value.
>
>Therefore, I do not think we need to add a check for this case. Users should
>understand the semantics when exporting the `KSELFTEST_${BASENAME_SANITIZED}_ARGS`
>variable.
>
>Thanks
>Hangbin

Yes, if just only adding a check, that really makes no sense.
But there is a issue for the follow case:
---------------------------------------------------------------------------
User wrote "cmd_args=nice_value" in settings file and want to use the
`nice_value` as arguments for a test program.So the user didn't need to
export something like `KSELFTEST_XXXX_ARGS` because kselftest_cmd_args should
get the `nice_value` as we can see

    eval "kselftest_$field"="$value"

But in current runner.sh, kselftest_cmd_args has always been set up by
`KSELFTEST_XXXX_ARGS` as we can see

    kselftest_cmd_args_ref="KSELFTEST_${BASENAME_SANITIZED}_ARGS"
    eval kselftest_cmd_args="\$${kselftest_cmd_args_ref:-}"

As `KSELFTEST_XXXX_ARGS` was empty, the user unexpectedly lost `nice_value`
written in settings file.
---------------------------------------------------------------------------

According to the implement of runner.sh, it may want to give users two choices:
1) using arguments in settings file
2) or using arguments by export `KSELFTEST_${BASENAME_SANITIZED}_ARGS`
But now users has been forced to use `KSELFTEST_${BASENAME_SANITIZED}_ARGS`.

For the case above and making users happy, I did two things in the patch:
1) If `KSELFTEST_${BASENAME_SANITIZED}_ARGS was empty, keep the value from settings file
2) If not, set kselftest_cmd_args by `KSELFTEST_${BASENAME_SANITIZED}_ARGS` 

Thanks and regards,
Qianheng
