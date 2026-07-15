Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E272D6E64
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 21:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784151664; cv=none; b=D9UW2mCwH3yESXO5OCvM7xJw/P0M59V+51G1aLB/nmG0ZyEdGZ/aSvEjyMToT1jry32twEQLezcQ4NNaWDeY2Z4w/vKozHwiYpZhzutj9TI6L3mab/ciXMfmqqwDyqZ8cZAf8uKbMTySGXhGY5L2aciqJFFfOYVVJCg5PZS2O+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784151664; c=relaxed/simple;
	bh=zq0I5qk5hP0VPhPf04laI8HrhxkLl8p5PZFWdIVIm5c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=FH76/9T2v9SiieJgq1AI9bxwRskTozCPz1UCaHuummTLW2WQN1CEaOb43EGGdy7FQFgwLWM0iC8Mo1XezCKAajB0t0mCsi0Xs7sDJIgCBhCYunqpaCbVkxar8kJEXQHarUdxdKpaQtyrw0iPUXRv7tBdYnQfvYlMOhhqr4C6WEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gs0SpCTa; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gs0SpCTa"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47df440fcd5so3331884f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 14:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784151661; x=1784756461; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VBgodXPKQuUMriRytvZ6LOP5ecvhprUS0jAzk/7/d7Q=;
        b=gs0SpCTaOtu3KRuh3o00He8U4z38artp7UeNda4FqDGczd/RLQVOA4/w+HB5qc38jr
         SycTd210TUmvkMXfsHUvUE7AlFBPzbOeCaCOajbo+JM1yUaez2JWdB3fdNgFUdFc7vW7
         fvCtQvnh97kjod5ptDU5zQxBNOXperFmcECku05gcfryEx6kn/y3k1bWqnRaqKjKkL9u
         Ry9XoKwUlmhciFr9N7JEdj9Lj+Z7sdg2+r45jUvlwibyBEcbiLQ/X3JtfymHPmWK2/vB
         iG3442iBSHN37HqL+7DUlJDHNVwqqFlnVCw6roKE3fZCPFEZGGNS2L97otClIPNXJJP3
         SLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784151661; x=1784756461;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBgodXPKQuUMriRytvZ6LOP5ecvhprUS0jAzk/7/d7Q=;
        b=HOHbY+X4Izm8rFxgu8wJdTl2n0Y1emXegbajsmPPWPpV/TbhaI69FMsVOMlxRuELSH
         k9h66dBQJwFmHxQwpc21pE503Gjhm2jQBMeN/DyXFN+wa6HC9bmMoy5rKxyv43pUavSX
         XvlioIFSl7APIPYytxyiyL0qu5aFCbAd5GMh6KBH2acPmW8Kk/o9npmF+TVK6mZm5+qL
         zssrNwi8rmUALcwOpK7zz0Wdgap37X1eO5ifgmstOmTbU6NOZDbByJcE3lS5GgH9MNR1
         etSrRP3QKUJo2tyCajrNxZRn1Z9Qnig6sxgh6nbDSZP95Vv1bnwLRxFI0wfLy2HRp0Xe
         SJBg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7BBQb0SGDD+h5vKnGcpC0ZIGFADd2LzeaKjyvkQKc9OKfarZRLOk+dRe7jN1nq6THSyYNPw30xRUeFjXON2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDhArcF5w7Pi2x9+mq+EBWIJ/UmTcG3ZUcNQs66TLR9dOHn1V4
	FnLUUd/auTFr2aOhUJrOpp8hiSq/POLVFm0mNjTlP6oL/f+51KBAOBHVLRm/H4BhNn8=
X-Gm-Gg: AfdE7cmnequOxJ+buvEefsGWn6sl7mVxABnPa0XTauz6GEaX33r0vN2i9PFX8nN2aaK
	2QohpHXzD02ebtK0PviG+dHRYp2xxaHBcv6XQOatQZ8l6qMFyrdctawEIoLA4Q3Rw3CTBqRoUQU
	V4VEC4QJeltadsmD125M6+KA61BoCgxKhgZAk9XUAPTc6eca1mE6Xvm2Ipab/OwGPQhCIMqxXO6
	d/TBkOoTbjJIFWyz2MobomAaW8dBgZtgTBlumT+sHP8UD6wvQEVBLP4TKv1gyIZau9CUl2trKCV
	cSPmj3gf4kp78Q78VaIXCCNv5xpuwaYjhbeGD7nE6D2GUTxyOdafFnOwHVF9N6W6Pu+GHBkMi5p
	MarpArwhLC2SYuORWrEViJm6lFUInHVtZX1hhSda082NkNwsUjQTC0KNcvcQaqxkp
X-Received: by 2002:a05:600c:350a:b0:493:bb23:152a with SMTP id 5b1f17b1804b1-4953c28868emr49257555e9.34.1784151660586;
        Wed, 15 Jul 2026 14:41:00 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:c3e:eeab:5970:313d:2132])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e7cb44c06sm155311497b3.25.2026.07.15.14.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 14:40:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 18:40:57 -0300
Message-Id: <DJZGZ8AG04SO.1G3LGDU8VGRI0@suse.com>
Subject: Re: [PATCH 1/4] selftests/bpf: Install bpftool where test_progs
 expects to find it
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>, "Alexei
 Starovoitov" <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Christian Brauner"
 <brauner@kernel.org>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
X-Mailer: aerc 0.21.0-146-g87073a0460e3
References: <20260710-selftests-bpf_fixes-v1-0-aa24dfd6f4f9@suse.com>
 <20260710-selftests-bpf_fixes-v1-1-aa24dfd6f4f9@suse.com>
 <DJXJWE3X286K.16LM4LUS201ZP@bootlin.com>
In-Reply-To: <DJXJWE3X286K.16LM4LUS201ZP@bootlin.com>

On Mon Jul 13, 2026 at 12:32 PM -03, Alexis Lothor=C3=A9 wrote:
> Hi,
>
> On Sat Jul 11, 2026 at 12:09 AM CEST, Ricardo B. Marli=C3=A8re wrote:
>> bpftool_helpers.c looks for bpftool at "tools/sbin/bpftool" or
>> "../tools/sbin/bpftool" relative to the running test_progs binary, match=
ing
>> the build directory layout where bpftool sits at
>> $(OUTPUT)/tools/sbin/bpftool.
>>
>> INSTALL_RULE installs bpftool through the generic TEST_GEN_PROGS_EXTENDE=
D
>> mechanism, which flattens it straight into $(INSTALL_PATH) and loses the
>> tools/sbin/ prefix. After "make install", every flavor of test_progs,
>> including the default one, fails to locate bpftool, and bpftool_maps_acc=
ess
>> and bpftool_metadata error out with "Failed to detect bpftool path", eve=
n
>> though bpftool itself built and installed fine.
>>
>> Explicitly install bpftool under tools/sbin/ in the installed tree
>> so its relative location matches what detect_bpftool_path() already
>> expects, restoring the pre-install layout instead of introducing a
>> new one.
>>
>> Fixes: f21fae577446 ("selftests/bpf: Add a few helpers for bpftool testi=
ng")
>> Signed-off-by: Ricardo B. Marli=C3=A8re <rbm@suse.com>
>
> I did not face the issue because I am running the selftests in-tree, and
> the CI seems to do the same, but for users using selftests after running
> `make install`, I guess the change makes sense.
>
> That's not the first fix aiming to improve bpftool
> detection/installation (eg the BPFTOOL env variable, see [1]), so it
> makes me wonder if we shouldn't just make bpftool part of
> TRUNNER_EXTRA_FILES for all flavours of test_progs, similarly to other
> binaries needed during tests (eg: urandom_read), instead of just adding
> some bpftool-specific details in this generic install rule, and just
> make the test runners assume that the needed binary is in the same
> directory.

I'm not sure TRUNNER_EXTRA_FILES can be used like that, because it gets
reset in test_maps definition. But maybe we can use a symlink like
what's done in $(USE_BOOTSTRAP)bpftool

>
> Alexis
>
> [1] https://lore.kernel.org/all/20260223191118.655185-2-ihor.solodrai@lin=
ux.dev/
>
>> ---
>>  tools/testing/selftests/bpf/Makefile | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selfte=
sts/bpf/Makefile
>> index b642ee489ea6..47911c9b4977 100644
>> --- a/tools/testing/selftests/bpf/Makefile
>> +++ b/tools/testing/selftests/bpf/Makefile
>> @@ -1055,6 +1055,8 @@ endif
>>  DEFAULT_INSTALL_RULE :=3D $(INSTALL_RULE)
>>  override define INSTALL_RULE
>>  	$(DEFAULT_INSTALL_RULE)
>> +	@mkdir -p $(INSTALL_PATH)/tools/sbin
>> +	@rsync -a $(if $(PERMISSIVE),--ignore-missing-args) $(TRUNNER_BPFTOOL)=
 $(INSTALL_PATH)/tools/sbin/
>>  	@for DIR in $(TEST_INST_SUBDIRS); do				  \
>>  		mkdir -p $(INSTALL_PATH)/$$DIR;				  \
>>  		rsync -a $(if $(PERMISSIVE),--ignore-missing-args)	  \


