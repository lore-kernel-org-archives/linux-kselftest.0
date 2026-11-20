Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204888;
	b=DzDZwYaHNJYlUuNFpPV9tBc/1frXifgKOYmkLHDNcV15/iL5XBRRwPlHs8dieehWOLzk
	 tL/p6cjR9BWgCDjKT9awqvnZEerniaNoZzncWGSV6Ihel91/ElgGyqBg0pd4j6Ava5Jcz
	 d5ks+QrHx3B2ziheHdaDF7vPGuw3IZwdDsJvAmB7MGI6VUuk1od2Ogb+a51TGreRbbLK0
	 /u0wVfE3fzAUzLt8YoLBt1y8Cay3NcoRTMbmYI94zt+aRpSyD1CgwMbziiv6NwiX8Et1d
	 +lo/FYfZptNG+X7l5tlx8vLy2hda8jhbegLVGQwx4eoakCF5UgFr7quHhF8voIkVWwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=iSGO4LNksZXfBpmglfcOy2L8jlCLunM6n2azCj2uMuQ=;
	b=Obh/rbSi2cxf/Q4/HYAUyXWTwym7PzSHEq0nl72efo8WqbtBuQ+aJuT43lx8eb78g9HK
	 XTvHFqh5uZ11j7ZKRcOlf4Jaw+PGwaLhjN+b9wIwhvhPimHLYoXucAYpv3c7BwIifIcEZ
	 4e6lQVgIguFHXlFjdVPgQoHbQmTUu719R+TZUlzA8cRmlk3eVtCEP0vrv23jV6ETOaB8l
	 XWWKMa/mf/OZdLTxcHZLoFvhF0Fuo+QcwqXW+JWIsVrkDMYGtHHjojQp52FjTuNvGGXP7
	 GaYQFrm7IADPFro41CkMoLtj0ydxauRHihaPO2AA1FxfVjDxzzr/bUJB9GfXJXlv8Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=fDBnhl7y;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC426606A6FA
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 20:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC426606A6FA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=fDBnhl7y
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-717080a2d50so1198079eaf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 12:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795204886; x=1795809686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iSGO4LNksZXfBpmglfcOy2L8jlCLunM6n2azCj2uMuQ=;
        b=fDBnhl7y/DbSsOMl/RAnyGdtT6LuKWjdhBOA8/KRPGLuAlMzxz2vJ0MyTzF9vZR1XB
         l+yhPV5RlzKajGdl3BTOJpVuDiDfjd+dTpl1F2+7g4GllslwpYw2w6DvjLMe0IYgmSB+
         HClgl3YAPX+e+82/dscEH2F0dngNex9YhHcrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204886; x=1795809686;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSGO4LNksZXfBpmglfcOy2L8jlCLunM6n2azCj2uMuQ=;
        b=SUT8l0+45RUXpIzqDK+2MHXldMXWkQRR17/UiFAusgH/vGkPXe2x/NMtuIf656Jeh/
         se4j8p468bzzCEzQ5ehoh2DAS2tZNoHbRkAm/7ouGiXBrR3DmWd9jNQQEM1KxQDRYGS1
         ITSWcRYg/0h8PjFXTaUmCu8mnjr3q5/bH4Jx21E8ewTkgiZbUDkUkb8RdpJx1UL3c7OY
         ZCKiyAGmz69pid+GHmi7+b1oFf6EpziRcQ7S03mFwu3nAZt8MGFEE9OVZOlQB3ep5Lcm
         kTUZxUAy1mVWW57wSJ7kyd/GWPdbGTdQugYsjZQOjPJ67f06hfdGurMI/f/FBE37b0x9
         sdUw==
X-Gm-Message-State: APuU4Z+Hg3Qi7s5ug+PR6ncvI1iR8lpuucKXQY7ori5oNsOA7VjPvWsI
	T9guM+9uThUxwwgX8OThS3Zf4erH8+2FStBiwEEfPYe0aZENywLn5zC04OG5NDxyciQ8SEBgq/U
	agfrzBhA=
X-Gm-Gg: AYBFou2YwdsWIHUE3OtadgXBnMRJ4N8X9dp7pbLGjMbSzLRTRyYk1WsYgwDH+BHoivI
	1nc7zhP3BY5ENFPHRmtFeHcxNUrIfj1JvsE88m4BsDQVk7JAq/jW4lskvyzc0BdZKT1ZdEnjZxW
	CTFu15lYgRhUweXlxMlQnvSPKt1Cya6JgFSElfGVhN6NUxGuhWDLuvr8lEyqrE1ogCqDxcdfvGc
	o8AEeIeViN2XsPSTKOAJXl2RQwamfMqIZtn+4C6rj/sUw1TBSucjwqtDZxddv88UlgE6EbKin3p
	IY3+vDbAmklUnXiMrUbceq2v/GU8ArSgsClAtmLcc13C7CdIT0kELp8pm3D5VdGJ9i9JWr7li2e
	6WymKy4S0peV/iS7bqdc4HgYVujnaVc+mM0GoEcDkf002pDf/Mh4cya8RboNE20giLW+DhHskzM
	hQvSi+RrtZFKB50Wot5w5YXdDGB42g3gCwC72fm6Qbgfgbd1YsCD6f+eQWldwxwhoUoK6IVfYPR
	/pyO+ELz/btKSmCB3uCMGkV6P43xg1wUfGoGJ9Q/gEsodOHzk19vzXuZvfKTB3tmMOPZ1gYTzEt
	DZwnR6aAF5JZybCyl8JHMXjELMRLJjhK0tZk7nnjn4VKqDDKUKhXKCz86biX
X-Received: by 2002:a05:6820:a511:10b0:6d7:d91d:d77d with SMTP id 006d021491bc7-71b395172a7mr2502103eaf.58.1795204885592;
        Fri, 20 Nov 2026 12:01:25 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631670c44dsm2751259a34.0.2026.11.20.12.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 12:01:24 -0800 (PST)
Message-ID: <f3bdc42c-8c28-4b5c-bfa0-41ac31b37a43@linuxfoundation.org>
Date: Fri, 20 Nov 2026 13:01:21 -0700
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] selftests: use local variables consistently in
 runner.sh
To: Jori Koolstra <jkoolstra@xs4all.nl>, Shuah Khan <shuah@kernel.org>,
 David Ahern <dsahern@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Hangbin Liu <hangbin.liu@linux.dev>,
 =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <ricardo@marliere.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
 <20261118-kselftest-run-timer-v1-1-53a838b2d62b@xs4all.nl>
 <8a436334-d306-4a34-bb7b-efc713aed0f8@linuxfoundation.org>
 <1254980601.2097872.1795173276553@kpc.webmail.kpnmail.nl>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <1254980601.2097872.1795173276553@kpc.webmail.kpnmail.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 04:14, Jori Koolstra wrote:
> 
>> Op 18-11-2026 11:13 EST schreef Shuah Khan <skhan@linuxfoundation.org>:
>>
>>   
>> On 11/18/26 06:40, Jori Koolstra (CIQ) wrote:
>>> run_one() and run_many() assign their working variables without
>>> declaring them local, so they leak into the global namespace of
>>> whichever shell sources runner.sh, i.e. run_kselftest.sh or the
>>> RUN_TESTS recipe in lib.mk.
>>>
>>
>> Hmm. so if a timeout value of say 60 seconds comes from a test
>> settings file, does it persist? Can you see that if you run a
>> few tests using TARGETS variable?
>>
> 
> No, because it is doing
> 
> 	export kselftest_timeout="$kselftest_default_timeout"
> 
> at the start of run_once(). I was just trying to get it to be a bit more
> consistent and less bug-prone. We could also add readonly, which is in
> POSIX. But that seemed too much.
> 
>>> Declare these variables local so that local is used consistently
>>> throughout the file and the sourcing shell's namespace is not polluted.
>>> This does not add a new requirement on the shell: local is already used
>>> in run_many(), in_netns() and run_in_netns().
>>
>> Makes sense.
>>
>>>
>>> Also, obey the convention to use upper case names for variables that are
>>> constant once assigned.
>>
>> Can you elaborate on this convention?
>>
> 
> It seems to be what was used for runner.sh, local variables set once are in
> uppercase.

Drop the change. There is no need to add churn to fix something
that doesn't need to be fixed. There is no strict convention here.

> 
>> I don't want to see these changes combined. We don't combine
>> cleanup and convention changes with real changes.
>>
> 
> I'll separate it out.

Send just the real change patch.

thanks,
-- Shuah
