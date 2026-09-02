Received: from smtph3-05.21cn.com (smtph3-05.21cn.com [150.223.194.107])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F08A41684A;
	Wed,  2 Sep 2026 09:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.223.194.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341077; cv=none; b=r1bbrV1GMcIJhpxWpDb80Qz5qcArVc3CBbua7Bo3g4aytN2D/RXuEgv+qYx1KPyatxWVosjJOzH5ZaesMLkqzx+TqwUrLXjncj5TsBPAw/JZyx3WWPUXYgPNIq7QKUuBwlRljK7wQxvunT9gjC+az6AbvZJCa4LqZbg1wB1VXfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341077; c=relaxed/simple;
	bh=Hk9PncUX78o+Z3x1c1F+sVM7U9AlFTJxz/WKfIrbhuM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TutgSWJZ3uXfs6WrKeZXD02/hDeezjT4t4e7WZab2HkSL4qj+WauKoiHXrdRZSUQyFw2f7iioA7Oz6qKaiy+UGjBbzGXMgAyLbSjC583JxYVuPjOGN+uCWMZ7T2uzsuD5Vv1PTXBl+NGynXNnfRX/Et30MouNN1Wq48xGYTbatc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chinatelecom.cn; spf=pass smtp.mailfrom=chinatelecom.cn; arc=none smtp.client-ip=150.223.194.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chinatelecom.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chinatelecom.cn
HMM_SOURCE_IP:172.27.0.100:0.404078716
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-139.200.108.11 (unknown [172.27.0.100])
	by smtph3-05.21cn.com (HERMES) with SMTP id E0FF51402F0DF;
	Wed,  2 Sep 2026 17:24:16 +0800 (CST)
X-189-SAVE-TO-SEND: +pengqh1@chinatelecom.cn
Received: from  ([139.200.108.11])
	by gateway-ssl-dep-7c9d777cd6-4x4jl with ESMTP id 177ced25826e43ab9a4f0348442c340c for hangbin.liu@linux.dev;
	Wed, 02 Sep 2026 17:24:26 CST
X-Transaction-ID: 177ced25826e43ab9a4f0348442c340c
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
Date: Wed,  2 Sep 2026 17:24:15 +0800
Message-Id: <20260902092415.1459044-1-pengqh1@chinatelecom.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <apfAjBBaSG6Bs2M9@fedora>
References: <apfAjBBaSG6Bs2M9@fedora>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 14:22:04 +0800, Hangbin Liu wrote:
>Hi Qianheng,
>On Wed, Sep 02, 2026 at 11:05:42AM +0800, Qianheng Peng wrote:
>> >Oh, I see what you mean now.
>> >
>> >    kselftest_cmd_args_ref="KSELFTEST_${BASENAME_SANITIZED}_ARGS"
>> >
>> >This is used to retrieve parameters for a *specific* test. When a test does not
>> >require extra parameters, `KSELFTEST_${BASENAME_SANITIZED}_ARGS` is not set.
>> >This has the same effect as when a user exports it but does not assign a value.
>> >
>> >Therefore, I do not think we need to add a check for this case. Users should
>> >understand the semantics when exporting the `KSELFTEST_${BASENAME_SANITIZED}_ARGS`
>> >variable.
>> >
>> >Thanks
>> >Hangbin
>> 
>> Yes, if just only adding a check, that really makes no sense.
>> But there is a issue for the follow case:
>> ---------------------------------------------------------------------------
>> User wrote "cmd_args=nice_value" in settings file and want to use the
>> `nice_value` as arguments for a test program.So the user didn't need to
>> export something like `KSELFTEST_XXXX_ARGS` because kselftest_cmd_args should
>> get the `nice_value` as we can see
>> 
>>     eval "kselftest_$field"="$value"
>
>AFAIK, the setting file is usually used for setting timeout value. As
>you can see in runner.sh, it checks kselftest_timeout after reading setting
>file.
>
Yes, I see it. Basically I did similar things to kselftest_cmd_args like things that
runner.sh did to kselftest_timeout.
>> But in current runner.sh, kselftest_cmd_args has always been set up by
>> `KSELFTEST_XXXX_ARGS` as we can see
>> 
>>     kselftest_cmd_args_ref="KSELFTEST_${BASENAME_SANITIZED}_ARGS"
>>     eval kselftest_cmd_args="\$${kselftest_cmd_args_ref:-}"
>> 
>> As `KSELFTEST_XXXX_ARGS` was empty, the user unexpectedly lost `nice_value`
>> written in settings file.
>> ---------------------------------------------------------------------------
>> 
>> According to the implement of runner.sh, it may want to give users two choices:
>> 1) using arguments in settings file
>
>I’m not sure if this was the original intention. The configuration file
>lives under the test directory, which typically holds multiple tests.
>What if individual tests require different parameters? How would you
>supply distinct arguments in the config file using only a single
>`cmd_args` variable?
>
Yeah, settings file can't cover every different parameter(maybe neither timeout).
So `cmd_args` in settings file is only fit for single test which needs special
parameter such as setting `test_range=1,976` for test_kmod.sh of bpf directory,
however other bpf tests can ignore the parameter.
>> 2) or using arguments by export `KSELFTEST_${BASENAME_SANITIZED}_ARGS`
>> But now users has been forced to use `KSELFTEST_${BASENAME_SANITIZED}_ARGS`.
>
>In contrast, `KSELFTEST_${BASENAME_SANITIZED}_ARGS` can target each specific
>test case individually.
>
>Perhaps I have misunderstood the design. Please feel free to correct me.
>
I think you are right. I am also not sure the original intention as I just found
current runner.sh had the feature which can retrieve cmd_args from settings file.
This feature made me think it can be convenient for users who didn't want to
export `KSELFTEST_${BASENAME_SANITIZED}_ARGS` everytime they start one test.

Anyway, glad to recieve more advice whatever next step has more work to do or
nothing to do.

Thanks and regards,
Qianheng

>Thanks
>Hangbin
>> 
>> For the case above and making users happy, I did two things in the patch:
>> 1) If `KSELFTEST_${BASENAME_SANITIZED}_ARGS was empty, keep the value from settings file
>> 2) If not, set kselftest_cmd_args by `KSELFTEST_${BASENAME_SANITIZED}_ARGS` 
>> 
>> Thanks and regards,
>> Qianheng
