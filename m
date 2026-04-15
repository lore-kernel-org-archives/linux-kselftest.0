Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3EC3D1CDF
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 15:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776268400; cv=none; b=R9AxdaeZ8jiWVQjUa361n9Ijfq0/PBbm4kYW1YR0s7L/ADoDKhQZrwm/Puvoabh70vw0YqlEWrs0wCqevVq4K49kxSO9huhrxSBtMd/R5iUYQWZGGzylrlXiI0dK9+Ut0b/0WCTjh6Bpxg7jNOLyZC2j1mthaTHGgnwBTqXHavo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776268400; c=relaxed/simple;
	bh=/5ltL6PoBykT0TuZtMt1PN3HrYWzk/ZrMwLqarywdB0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=H0JB5Wv/hIL1arHfi+Gs0Tt1Kh/5qcCDS1VUajv2nPUZzDb1Ivkym2yYvqWk+85r4U5g/q35DcpTpbujFQ4vl7CDOa9jvQEcWESmig0tcv359Im8g120SZekJeJGxWGf6g6HU22JScwCN59caVo38c+LcmYETNePIA9ppjeqHSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=axdm5dTa; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="axdm5dTa"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso68789785e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 08:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776268397; x=1776873197; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGwIYx0sLKOmJeXxnXDHEsG54pTXYshNLOsLNJZdtXE=;
        b=axdm5dTav/I0n75TWwAi5qFPLaywg4ISONsnM+TuWTGtfPPJko9RdY/vj903G102v0
         yQYmZPGC7UELDntRUycMVNYSghLAVyzhXZKXQtDZuZZ1M9H9DIFLMG2zpaDGpTdtCLPU
         fMSbxxYeDz0iEzxNEtUfo/lV/si/rlCvy6XOYL5rfFZ+BS0DMuB+sEqjnFJDmPyhjJUN
         mV045WKvhD+siJTLC3jj10aKaSfyLIZqq9SUnc9DCHXNhsjmlfXMCwilv2v2Ma+qSrow
         UC4sHAFHAJamBJG1EkhmwHQBdtelFlSQOV1Bk0GPxCeo5j3VK/rApdwtrGJ/ISAjpjNv
         i3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776268397; x=1776873197;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IGwIYx0sLKOmJeXxnXDHEsG54pTXYshNLOsLNJZdtXE=;
        b=bPlXuZ5J3ZgPubw8UJEUi9MF/o1QCoE4u8yd+8foduA+pHkJOWWYFwt7AGti+X4ZOr
         TLNhLb9r4INLSK098HdOpshMQBrg7MHYXSKXUpr3/GcIdWZsra/6Myar9Y7RACIKOgQD
         dVHI7lvlptR9Rq/afpUdeBSDU/XxLl7xax1hgzPqJWUErFreSMBJvcVoJHJBGFA+cds2
         4PG/G+r5FtdPGaRFKtKYWdAScVyHltq62Xa9wZBoF1Ty8zJmqw/cq5gQSVXOe/0k7c21
         h6GwodLUI9+CXkOs8E7dBNXs00wyw09RkHy7c3zb+8LQDU4FP76WuAW1qK5JGal66pyc
         BQCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Qc85Xx+iUOiU4jk+VxmmfgZIX6j31OGTYDXmiqwOPO6MvdRxvN8DgtBZTSZ182XlJC9ltPTuCGsz1MTcTsis=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3+t4t/GU0xIbx/qit6FWZe11kOmxe0HmzN5bcr4U/YWkcKDP7
	WQcLxFFiIWJOLGLvy9K7IBtDgd0hOoc+dt9Dh016lXggkSSiiiTgsI9X9P7WsUZTico=
X-Gm-Gg: AeBDievy/Ca0xCbbWmL7I6+dNln90XCPT3GRdxxajpCzkoADpLoo2oL0wowfOllTHX3
	CEZgS76IeDgWSF/UcYiC7ys34kP+F9bS8Ux1Cv/aN1Rhe1gb6ZaeycXj9Y/Ef9hpUlGABMRSgd/
	2l7N9gzCjz5LEjcCe+wJksm5uxx/Keueb8SvePZCFe9gRbngBLBHNy9rc67GctpWPlcUkN3+xpo
	d47bI/K62l25gJCArsECGeDd4P2L7rmrSH3yU92M07+WfE13Wk8TngBYb6hOGZNWCnvUVlcVJbv
	jTffAfjXcmk6sLcgOEHJS6yPth3mw6qeNY1e9hHd6m685aKwMLa4OeC3KA/t5b4hWqDNqEp7p+0
	9w8eeSyawiVvyA6xnWZehy74sC8X/TlfbG31qcFnri8w4tzJbDMpFu0qDBSAp1O3N5TSHL3/hEX
	BUaj8xjnPlBMI1W3/ItA/S
X-Received: by 2002:a05:600c:a010:b0:471:700:f281 with SMTP id 5b1f17b1804b1-488d68af20cmr300724725e9.25.1776268396965;
        Wed, 15 Apr 2026 08:53:16 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:8620:c31f:89a6:1fe0])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6932ac8b8fbsm1091791eaf.1.2026.04.15.08.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 08:53:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 12:53:13 -0300
Message-Id: <DHTULEYO8FZN.2ED1TKXOSFJ1Y@suse.com>
Subject: Re: [PATCH 5/6] selftests: Preserve subtarget failures in
 all/install
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nsc@kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
 <Aishwarya.TCV@arm.com>, <ben.copeland@linaro.org>,
 <kernelci@lists.linux.dev>
To: "Shuah Khan" <skhan@linuxfoundation.org>,
 =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>, "Mark Brown"
 <broonie@kernel.org>, <torvalds@linux-foundation.org>, "Shuah Khan"
 <shuah@kernel.org>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
X-Mailer: aerc 0.21.0-120-g22b95d38161f
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
 <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
 <DHTUDCIYT34R.3VKGNDGUUKS84@suse.com>
 <b80e905d-67bf-4c52-9b61-e52f3acc5b35@linuxfoundation.org>
In-Reply-To: <b80e905d-67bf-4c52-9b61-e52f3acc5b35@linuxfoundation.org>

On Wed Apr 15, 2026 at 12:52 PM -03, Shuah Khan wrote:
> On 4/15/26 09:42, Ricardo B. Marli=C3=A8re wrote:
>> On Wed Apr 15, 2026 at 12:40 PM -03, Shuah Khan wrote:
>>> On 4/15/26 07:58, Mark Brown wrote:
>>>> On Fri, Mar 20, 2026 at 03:29:20PM -0300, Ricardo B. Marli=C3=A8re wro=
te:
>>>>> Track failures explicitly in the top-level selftests all/install loop=
s.
>>>>>
>>>>> The current code multiplies `ret` by each sub-make exit status. For
>>>>> example, with `TARGETS=3Dnet`, the implicit `net/lib` dependency runs=
 after
>>>>> `net`, so a failed `net` build can be followed by a successful `net/l=
ib`
>>>>> build and reset the final result to success.
>>>>>
>>>>> Set `ret` to 1 on any non-zero sub-make exit code and keep it sticky,=
 so
>>>>> the top-level make returns failure when any selected selftest target
>>>>> fails.
>>>>
>>>> This patch, which is now in mainline as 7e47389142b8, is breaking a
>>>> bunch of CI systems - at least KernelCI, our Arm internal CI and my
>>>> personal stuff.  It causes the equivalent of FORCE_TARGETS behaviour i=
n
>>>> the top level Makefile, the prior behaviour where the exit status of t=
he
>>>> top level Makefile ignores failures from individual directories is
>>>> desirable since by default we try to build almost all the selftests bu=
t
>>>> between quality issues and build time dependencies it's very common fo=
r
>>>> at least one of them to fail.  With this commit unless the user has
>>>> configured a more restricted set of selftests it would be surprising i=
f
>>>> we manage to get a successful build and install.
>>>>
>>>> As well as being a poor default due to the very high likelyhood of bui=
ld
>>>> failures this also has the undesirable effect of causing a build failu=
re
>>>> in one selftest to cause the whole install target to fail, meaning tha=
t
>>>> the build failure is escallated to a complete lost of coverge for all
>>>> selftests in common CI usage.
>>>>
>>>> This wasn't showing up in my -next build tests since I set FORCE_TARGE=
TS
>>>> and explicitly choose a restricted set of kselftests which actually
>>>> build with my system and configuration.  It was less obvious than it
>>>> should have been with the other systems since they did not expect ther=
e
>>>> to be a complete failure to generate a kselftest tarball and variously
>>>> masked the error or reported it in a manner that looked like an
>>>> infrastructure issue.
>>>
>>> I didn't see it when I did test on linux-next and my repo. I did instal=
l
>>> to catch problems.
>>>
>>> Sorry for not catching this. We can drop this patch.
>>>
>>>>
>>>> It would be really nice to get to the point where we can reasonably do
>>>> this but we're simply not there at the current time.  At the moment if
>>>> people want to see build failures reported at the top level that reall=
y
>>>> needs to be opt in, we have FORCE_TARGETS for that.
>>>
>>> Good point - I will go look and see if we document this in kselftest do=
c
>>> and add it.
>>=20
>> It's not documented. It would have solved my issue, sorry for
>> overlooking this!
>
> Ricardo, Would you like to send me doc patch for this?

Sure, thanks!

>
> thanks,
> -- Shuah

