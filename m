Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443368;
	b=OTh8U97/j6ltFSo48kmruIvlWQE/U+87AHonE22PPcoz/Jgn0aAPmwYLnUGekRTGsI1t
	 zaGnyQYyJe1Jx2EAV5j7+4OMuRv7yfhxYAgWiHNbQywmxCaxxWRK95y18+C+xAxb6qVmv
	 E0NGDiCYI0Bmam0d0U/L+5YDuAsq1tZ5J8ZcbalE91KPe7iG3Ha5t6CTY7nb63h2a4xqg
	 KgA4VXbrhUPlQlcnRkfNGT4Mltkqz9tNjh6qoSUp4vP+LyHzwePDvV9h4it95EIMAbdEp
	 SSyO4D1H49b4HTN5PoG8k5492Eun7Hs43xjZHru6lhj7Xphoj1Iuqs0JKvPXaz7MXCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Zfh0a6qWB7cgYhlh/JVDBYrhyvShnRR27oz/yTBM+wI=;
	b=M7kSR2rmkwVtao0sYXRnIjtPGulPR6EpgArpDIX181luf9ad4BO2Cpg+KRwFWqajQyul
	 jkq90Y4cLRwsmaVYPxqGpFb9qS4aul2F2S4hGtHpmfhy66ARbwdNEQqMeMsxUNAIOV2eC
	 +B8A02OG/QmB0cCDMt6srPGhOtexcG6SBKa6VGzd34NpSij608+j1pQdHfXgNQUegp61v
	 wXG/GexBDUkQJQi4abQMQc5BToNjtGKvQ5kALYHl0bpEPCuaZjhIqJduKy5foOgIxuPr4
	 ASECn4N7xez2YZW+dnp58EDthptobW+kPs5W5WU6l96kIioNtbroQJJTyboq1xkZYdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MzQ3w9nU;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D63C606A31F
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 14:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D63C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MzQ3w9nU
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so1903299f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 06:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795443367; x=1796048167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zfh0a6qWB7cgYhlh/JVDBYrhyvShnRR27oz/yTBM+wI=;
        b=MzQ3w9nUw2sUyJnn/xbL3lFnkOFDs10fQ939b1r9lh3GObb6YW0PbtbT/rdjeJ4rmx
         WqEZhQyPqHwQC6iJ2D06RqjGMiDjPGz2ndgRMGNbdLktctaNAa+Vyj3hZv6GTYbcMIoL
         9idjx98FhZGu2zcC/Xro2yLz7tAulmBVYILxyScBaaBn4fepRtuAXY3joaRDNfuHXkq3
         Qtle4B4BdgjgO34ulYlM/LfdtfEiRrwIiytmyNcfZMbXLq3flUVQw49XdxkFS44h2lw+
         /idJvNMYlizMxO+MngmekHSGiaLc5am23Jeu+LvaGV//bAcJTBCyb3o6XyKKYbFYqFLx
         pBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443367; x=1796048167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zfh0a6qWB7cgYhlh/JVDBYrhyvShnRR27oz/yTBM+wI=;
        b=nTtNI4Tku/xa+jm0Zc9jIHGc9Mc679eBr50siZpolmd/tZczNylT14o4mKXClI/hBf
         sQNM6vguTSAdIGaFW+y/DggSKDtAOkoQNdCZXEhWBA43nVU8FhFjmGybMa6aAhHlsnrS
         jEXZEmc7vA/xIJpbQqZh9Lq/Ww3pRlWPhqs0w7PqlMEQpXdCnAP2HLv6mps8uI/RKWMp
         Sq+GGTd0eIT9D+bBWMEZSZkhfpxXy3dGcZId+v+RVBLI2y14w0uMkX9PRASFfi/Sh41J
         3XjQKvIIzujnbyFuFi2BozyHF7UITPPhZuZTWaeVl5ib5hgtDbJitMlKwc1eAEauKeOG
         sOyw==
X-Forwarded-Encrypted: i=1; AL+hErE75RjKy0ORWd3w0xrPs/55pTNNpY+LruPOHryJdDt6oQYXg4OTAqvwwWltUYI6KxhLkwCk1pVXnE8lu+E7tRY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ssrDv3A54he2VKraURekAkytwFSbARq/3hxixiiEpH4L/UtSh
	OglmpAvuXizJwoDP5w0BmFs6mifq7Mdp/So6RwQGZ8AEVE6VyBXCio8FlU49g4yj1Q0=
X-Gm-Gg: AZFdTZerCWrdwk3E70CArv3hZK0yL++RFS9szXhjvPFu7Qhw9o3/Itk7rbIwKTpiPZq
	wxMLl4gNkHtzpTXSc6k33e3AsUqP45vB/VDwnY9pGLsOE/M+CyFOqaeUN1W8FyXF1cYFIe6RFi8
	k/PPhv7TmUXn6sNB8Gw/hWmLYi9r73U7m9kPJ3XkVaOwkI+Py+ncfWN2M2YDKmxjHqsKqiUTRkD
	/teNYvto+fjdttorQjMsrHZldY4tkjcU6yrCmqvCEMHbSSW6TUljo2/t0QLNdeNWqrBVW3Mnlr7
	0/dnY7ZrQimWhvqNFOHA1VZtqqk3VpBDTQ+lXTyL5PkGvTqr1zpnF7Tr6yFeJVtIXyQI2OCwZCy
	7W1SbaSKQFkXNRSaKZmhtIJjqDVNoifnQPKZ1H7NtQH1/KB+JKHnbEgZ5Xl3WlZutcFHHqyrmx8
	M6KYToSlmu1u9nfpXftQ3re8/sCAJt/qfL3R4WNzLahwBmQLZNijUm77zSeYmPIClbLAOZcOM/3
	ONGg4XsexYHRjzRPhNg5ya192IUme7BFxxTarhd8gg81TTpfMoSz2K/wXQfMpbV+gLcFranYzg0
	BqIHw8H9TIbhihr30m6MnSXoDKimNGQ=
X-Received: by 2002:a05:6000:298e:20b0:488:7496:15b5 with SMTP id ffacd0b85a97d-4abb4c7ab74mr15920212f8f.47.1795443366598;
        Mon, 23 Nov 2026 06:16:06 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm21672571f8f.40.2026.11.23.06.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:16:06 -0800 (PST)
Date: Mon, 23 Nov 2026 15:16:03 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	Yafang Shao <laoar.shao@gmail.com>, Shuah Khan <shuah@kernel.org>,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] selftests/livepatch: build and run the tests
 outside the running kernel
Message-ID: <awRKo4D-H2sHFfwR@pathway.suse.cz>
References: <20261110161050.2451750-1-sashal@kernel.org>
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
In-Reply-To: <20261110161050.2451750-1-sashal@kernel.org>

On Tue 2026-11-10 11:10:46, Sasha Levin wrote:
> The livepatch selftests build their test modules against the running
> kernel and skip every test without its devel files, so they do not
> work when built for one kernel and run on another, as CI systems do.
> In KernelCI, 36 of 69 kselftest builds of mainline fail to compile the
> modules because the kernel lacks CONFIG_LIVEPATCH, and where the
> modules do build, the installed tests skip themselves.
> 
> - Patch 1 skips the modules and tests when livepatch is not enabled.
> - Patch 2 lets "make clean" remove the modules without a kernel build
>   directory.
> - Patch 3 builds the modules against the kernel in O= or KBUILD_OUTPUT.
> - Patch 4 runs the tests with the installed modules, without the devel
>   files.
> 
> Tested on x86_64 against kernels built with O= and in place, a kernel
> without livepatch and the Debian headers. The modules build and clean
> in every case, and the installed tests pass 8/8 in a VM without devel
> files, where they were all skipped before.

My only open problem is the "O=<kernel> KDIR=<kernel>" parameters
mentions in the commit message in the 2nd patch. They do not work
for me.

Otherwise, this patchset looks ready for linux-next.

I am going to push it (with removing the problematic parameters from
the commit message) by the end of this week unless anyone complains
in the meantime.

Best Regards,
Petr
