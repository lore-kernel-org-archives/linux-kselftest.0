Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518265;
	b=rL4Sk2S6tQN86UkAzYh3wF5qeb8vmIFqN10ObWK6pUg6Zgg3iqlo8EfnWDXlcw/1hf4+
	 tK+0des5vwLDJxt2fOHL45cSN6I2DrKWSPhc0Qf7ilA6kH/tv1FqUXaL9FIbeRJuc2fsa
	 PhyABbQVizN5dVlE7OONC2h7m7gZw8Umo3oiebw5jrtXdgXU72U8zRDd48hfPIjIo5H/P
	 AUuvFhI2o26ovqY2y4bizV7U4B7DrrcMwp7srd0VnOQ0uqRvP/hzK7IAF3bfBXmNg6weR
	 /PAUaCJznUXVmvH606eRShJK6X3CgB2cmRKNX6QDxZuLDFb2OW6HIWpLE95ZVJH5mtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EuBOUwwiL3IP1HDk4+dxaacGJaiYkefTCK8JBEZyKe4=;
	b=Az1ihGKe++aQiZBh4q+PfXvkSwsxZ7qaxsjsn/d+VZtcL2V0eEiJ+IW2Z3SiKr3Zpdi4
	 Yo7pdl7ZOMF3GySvXhwguvHdziYT2/KTetMg85IPvs7ezO26BrRvHKNcFCIC+s/qGxsyu
	 bVxStlAxY4zhwW1Xnn/lmhIYN62yIPQVaurZXnhn1fO29YrhtkdAIfDPZcW6Ftl4Y18bl
	 LkPIrXN5dDP42kFSNAr1hhQJ64mZEcMR68hXvkXMkyW5PkFnt9JEtYjX53rz/q4EzZtgS
	 fb9mK9nC5urs6o+f+E4PNraNqGwbefktVxS19PdS9wdj5NFUgzVMjDJv1EreY7Pg3DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DGCTDoFb;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38AA606A339
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 11:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C38AA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DGCTDoFb
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso41896565e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 03:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795518263; x=1796123063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EuBOUwwiL3IP1HDk4+dxaacGJaiYkefTCK8JBEZyKe4=;
        b=DGCTDoFbikauyFIMqdrHOrgjM62cX402e4khRkckTqUWicey3hvdiitxOdhi/LnQPX
         aTSOrLQRZq2jH9Y9HZ72TUNBL+mjYSlxq3wKIKY+J08+lRpR5XH6w6BPHngOnvO6QvYy
         K9rCe6e8DtXTP61QTMxyUUJudVvqxpDN/1U8QuRhNNn9bEMn0RR3myK/dJcgxSJrZubd
         CKXN9aoTK9JF5tX0QeeMKR1TS/4kkIzzvAKHJTVkPuh99aZY/qVa33Q89BL0SheCGNn2
         52/MjgbVpwEywoE7zhkDzXASJFbSKeX+OlotoymZqP3SalM6HZM5s77bBz1an88vPSsa
         JHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518263; x=1796123063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EuBOUwwiL3IP1HDk4+dxaacGJaiYkefTCK8JBEZyKe4=;
        b=Zeu61BILFxwO5zmazslnEjCVD5DXHmCHcjzBXVhxb7LzWSBchq78slhYVM1NN9/hqQ
         1N6/grw14l5bTNvDcG/4CGRMy3bR2nECC/NQQa2huHIq3tBszaeGUDyl6PsGDhp0M6/H
         WVWLZjp269yvKZKuk/NmCrq8mGLPeBSzM8Ji4OlNHBbpWqZWaQ6zEnK6dFD0HXSJ903n
         c1OuAZ7rF246bQcZ8izhzcFUmZissXE8nc4tRBD63cQ2/gpJ6V986+O1KqTH1L/laXQ/
         GPSR6gQ5c0QVn8WEbFtst/ZeEKBtjKKrezjcaSiHkJknMGnqtJOPuVJi1/eVg50L9EKt
         2aOg==
X-Forwarded-Encrypted: i=1; AL+hErFU0bphgjYNV2hURJIGX4Z6CAAF6cj1cPQBdD5k3xkSwBtFvGuX/2AzL+ZOObtNkkcD4dKvcZBQBXB46ntPi/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B3h2naeUbAOl5eAhFozfH1hU+57ivA/99X6u6Fs6MSLL+THo2
	wYXJOI0Np27ZBNhyy74r6QiT0E77hkiYa6Z7VL8hIzVrRtYrsZCcuBFDWnWVpKsL0Is=
X-Gm-Gg: AZFdTZe0eXv+CRTzlFjSXUVvPTQnq6u+woXnHiJiHeafP2ESU45SThPtiC0/nslSelR
	Mn2iH6zgdDtixpW2J5d/oTqGK1BnY5HHbTVfqPA7Ai77DaWJ4SzlL0jqPC1zmdCI/8hANBLnJLl
	NNVZF7LzhFwn1iOCPsz0LT/Ocpd14sO2qKEt8BVBdT56dhj0c+/YaU+uEL059dL6zh9kJGNtRkk
	J9DWxly9uIZZB1IYoMvOjhrliFCbrKRbUo389qnnBPljri1Lf3PhIX5s5loBprEJjmBcYQVStP8
	/DVUWByvTs5XZKJ/LceOM8elZKUFzvGHyYOEgjMEFgDyZlN0H1x4F40iIH9P18PkeFOpRwCT28H
	pMDk38pguAsg7t1hBACDcK8vo7soBRaDAI+SjGqIUie9sds83ulg6myNozg7yrMXVfv12U2T4uL
	miwN++84XpDcZnwO5GEF8YgXSzn6FpIiJlBTJH/QB9B+OY0cIdqnDYuBUu59U18oBEurne6QkuN
	+OpZNBM/3uasdN7xwJcgT6gRmLYmrpo57yds3t0AXZLUvA5B0Iku53MLD1j5lBAzbwSU5Jj08tg
	wmFBip495gvxTjqyoCRjhXD+5Pjwuwc=
X-Received: by 2002:a05:600c:e41a:b0:4bb:9959:54b8 with SMTP id 5b1f17b1804b1-4bb9959552emr100442045e9.32.1795518263196;
        Tue, 24 Nov 2026 03:04:23 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm422020975e9.5.2026.11.24.03.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:04:22 -0800 (PST)
Date: Tue, 24 Nov 2026 12:04:20 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	Yafang Shao <laoar.shao@gmail.com>, Shuah Khan <shuah@kernel.org>,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] selftests/livepatch: clean the test modules
 without a kernel build directory
Message-ID: <awVvNNnQPGyNWb96@pathway.suse.cz>
References: <20261110161050.2451750-1-sashal@kernel.org>
 <20261110161050.2451750-3-sashal@kernel.org>
 <awQUD16CDFpCTxaQ@pathway.suse.cz>
 <20261123154433.1188237-1-sashal@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123154433.1188237-1-sashal@kernel.org>

On Mon 2026-11-23 10:44:33, Sasha Levin wrote:
> On Mon, Nov 23, 2026 at 11:23:11AM +0100, Petr Mladek wrote:
> > The two parameters "O=<kernel> KDIR=<kernel>" do not make much sense
> > to me. The command starts compiling other selftests. I get:
> >
> > $> make -C tools/testing/selftests  O=<kernel> KDIR=<kernel> TARGETS=livepatch
> > Makefile:4: *** Package alsa not found, please install alsa development package or add directory containing `alsa.pc` in PKG_CONFIG_PATH.  Stop.
> 
> Sorry, <kernel> was a placeholder for the kernel build directory. Pasted
> as is, the shell takes "<kernel>" as redirections, so make gets an empty
> O= and no TARGETS at all, and its output goes to a file named
> "TARGETS=livepatch". If that's what happened, that file and an empty
> "KDIR=" are now at the top of your tree.

I see. I have never used these parameters so I could not imagine
what the value would be :-)

> > Are these parameters really used by the KernelCI?
> > Could you please provide link to a build log?
> 
> Yes. This is from Saturday's x86_64 build of mainline:
> 
>   make --silent --keep-going --jobs=8 O=/tmp/kci/kernel_build \
>        INSTALL_PATH=/tmp/kci/kernel_build/kselftest_install \
>        KDIR=/tmp/kci/kernel_build ARCH=x86_64 SRCARCH=x86 \
>        CROSS_COMPILE=x86_64-linux-gnu- -C tools/testing/selftests all
> 
>   https://files.kernelci.org/kbuild-gcc-14-x86-kselftest-6b01150f99c74e1a99a2a261/build.log.gz
> 
> > So, maybe just the sample command in the commit message is wrong.
> 
> Yes, it should have used a real path:
> 
>   make -C tools/testing/selftests O=/tmp/build KDIR=/tmp/build TARGETS=livepatch

This works for me.

> Please keep O= and KDIR= in it, though. The paragraph is about modules
> built for a kernel other than the running one, and that's how they get
> built without this series.

OK. I'll use the variant with the real paths.

Best Regards,
Petr
