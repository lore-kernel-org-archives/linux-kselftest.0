Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732EF275114
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 13:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013520; cv=none; b=k3rh1+FWcVthpAF01M9Gbl8SWiIAcV0mDerSitpdgJltTQjsbqiIvcDG6XFfV4j/6HUSKwhyPzeOC+ut86wrwW4OChGQkcjoTyLh638t//ObjOqbfuJ+RTobrxSFkibhJ4MoPsLTVmXgStp4EteUFFk2ZjL0ek2YthJb5IYxBQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013520; c=relaxed/simple;
	bh=wY5zD2n0xMPvK2mJYnUtl70hsw8J6F9rA9251e67RkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyTfl/BF3gBHF3bDXZ4cxa31b0LpfTsqNp4mAf3x3uCQFbkl3XxshC6zwlnJNa4tW3Zxm7xr2V+h7DNtEq8tvlKiEtapj5rIn/yT9cTGCVLPL2qd0jirxIf8K5IytqfR7FJcTDSvGwbVmcObPZP6Z2nyFeMxeTr6Zh9tmPBgUVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EiyOY4q5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EiyOY4q5"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4870206f73bso2254635e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 06:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774013518; x=1774618318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=amc/zHZZsI9E8OgKdEyfRT1GbcDfhXpxuLDiJuXetJ4=;
        b=EiyOY4q5CG6535iQ32YmD5B5CIben1RtM2vL+agjqwqZG6CEde62TSmAZOF11+A8oI
         P/ijbnC9Pp+8PewO/rPOMIrk1GiuaDVqk3gHzFCgZFZqABivPf7g23YFR5Td2WHK2rhI
         rrNADZcn+aAsIwUvy/Kd/bNIyEoPPfTY4mhbrqz4XdGXqEx9OYM8dFktUOtj3U45Ejs2
         Nb7t1zZvlKUQGpcf6GafAdbsAxauiFG+/K070q7Lg9V2cL0osM65AG+1Y9v/gIMUv38c
         4pSW6OE8jwtfd7wARCP9rFniDCnNooxTCp3lEhx5w5xvglBBcHanZruGSKx7iBTKG1ek
         dqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774013518; x=1774618318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amc/zHZZsI9E8OgKdEyfRT1GbcDfhXpxuLDiJuXetJ4=;
        b=Eqa1jc6n+QU1yyKmLorWcO5qtNGNvnjAlqJpfiYhBI0KWfgRigHtl8AsK5vKFLM7h/
         NB0K0TodvAKJ5Dply6SRnKZiuXyTPHxwyeB5erj9HGvTpeZ+5a6i/SlroQ3l54nmDq3G
         XawMomtzxRb8NywfJyNzLREs3NxCrv1kujL+4tDhk2UD46zL1cOpz3q+lcdX7gdx0K0g
         ohphNqDM6n9+W/DE3H5p9dHEkNV96oh19e4nmlfhi+S57W6eerKgLbefdjl4SYgPqZhg
         WQZGbsvInBQaJqdsNRufli/+e/va8SqUqV/VQTe0e7Fd2/pgPoTyIvYVk+QcuxyO9aRJ
         BSGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAfk6kqhpqUzMC67fJbD1pmu/gzXBgiimbc+gBO9+aXp6AGydRgdyWYddhkbFPKno934T5fEndbzoV77Fc3UE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkwDZD1FvwbsxqLnHy42bI1comvKW3ILleaIvzSy6V6Eieo/24
	K7PZ84SskeuxPOgcoOwV0+eIpiASUlmkzd6NqP0bDpJ4NLaqt95eB3mbeXVJbPDg0Qo=
X-Gm-Gg: ATEYQzwFT9rFLD3+1WtK1coKx+nNs+qOx5O3ifWO0OxtAgcCmfesWgbZwsRyd9vgLQ7
	/Oyq/4ZUMl6isc2LHQBdO/SrmCDAPuan+/OP4hv7a9yd5MhyXQVqNW7uhLKzwd9t3YCpeDkas66
	7ZJK7krJ+6F/kqgjU6b0lp3VUXLiY6NQR2LHvAPSVDLvFZRSl3kDBOVDCgoqkSPw/20xDlTFKH5
	URkjV9bywOl/HrSXL1Wm3iSuTwMHbGPV2/nF9ao49cju1mb1QvGOhrzE2sKDsZ1GQBd//egQoKC
	JClDzTo/3t/xIqLA7tR4enPgoopUwHGA37XpRqTCvakd7EYISUI1mErYy7Zc2DY+s5/6alM5TiT
	U4+H0QVUKAxlo5dthtH6KvezUcu9H+QOauQvdwH+1r3Rj7gwHFEO7ZhtZN2rzn4wXFQ3uRREmtT
	QSknW7Zr3DJ4eJAzRR+aQG013Bzw==
X-Received: by 2002:a05:600c:8b06:b0:485:41c4:e2e4 with SMTP id 5b1f17b1804b1-486fee1ae91mr48403695e9.23.1774013517736;
        Fri, 20 Mar 2026 06:31:57 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700377b71sm18314375e9.0.2026.03.20.06.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 06:31:57 -0700 (PDT)
Date: Fri, 20 Mar 2026 14:31:55 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>, live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] kselftests: livepatch: Adapt tests to be executed on
 4.12 kernels
Message-ID: <ab1MS1OmUVZsmTGq@pathway.suse.cz>
References: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>

On Fri 2026-03-13 17:58:31, Marcos Paulo de Souza wrote:
> These patches don't really change how the patches are run, just skip
> some tests on kernels that don't support a feature (like kprobe and
> livepatched living together) or when a livepatch sysfs attribute is
> missing.
> 
> The last patch slightly adjusts check_result function to skip dmesg
> messages on SLE kernels when a livepatch is removed.
> 
> These patches are based on printk/for-next branch.
> 
> Please review! Thanks!

JFYI, I am suprised how good was the review made by the Sashiko AI, see
https://sashiko.dev/#/patchset/20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253%40suse.com

It pointed out many problems mentioned in the human review.
IMHO, it was also able to explain them very well.

Well, it missed some higher level views.

Best Regards,
Petr
