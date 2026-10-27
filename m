Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144115;
	b=rPhFiTgSunkH0UN7YvdQfXQd5/2qDHs47dcD2arZ9tRPFR+Co6fc6TM1m7XOOkBtRpuf
	 H8/AvBO+cYysUoWa7P2Vt+NhY/F1TPnfaXFQirv57QpiigTMHkuwx18xQY5HSozaW4Qjg
	 ffUx4UCfqT9ASNw3rSZJktMDKCDvWwwegXwZ/NzEwZsfnFrJv+ND7XnjvfGR02V6Ti312
	 Cg+poaKhZZnc6N6BISkQEfcpEOEWjUdpAt+qa7AiZAmp0arcJMR5bdmZg5a8tTGzZ7kKw
	 AQylgRraoDlqLAVyRN+1kgiarMOP/c8M+HKQ0hN6Q54igo7NCglY3/JPyFPxr4bGWmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144115;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=3AEKuRmRMD5kYKRL/svuIaLfmBr+e4xHMBURLY4w1FE=;
	b=dvwcqMk81GawdyAbW2FOL4p8F9T8YV0EI/2kLLwhHHXfxi4tz+XAALjPHY7Qdn/eSgLb
	 o6MQhdmPhIU2CCMNAv3t8EaofNaSxaDkMCn+cFfTaRVHI/+8XEIDYfZtXHGRjUqU/+ACu
	 UKe2N4a+TyC+cOAEUQ1KJjZ8EKWU3sNtOwfnfSGC6u6TwTFyHGgNsYnJAntDhOalnpTbU
	 qc3nR6rwImnLrQGaAh7NI2BcmrcSF2C0nl/ekkrOZQOJLGAQA+jCkA/V6NBcJKeuyA1X4
	 0WlWxKu+gJC080AF5r6zwBgw2aV8Ak6xdu2AZoBCGGZG/ZmseUahoRcHCYZNyYP1A+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FxkLxzyT;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B052606A31A;
	Tue, 27 Oct 2026 23:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B052606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FxkLxzyT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=3AEKuRmRMD5kYKRL/svuIaLfmBr+e4xHMBURLY4w1FE=; b=FxkLxzyT+lerY94dkIEJXzfe/z
	e03gCnpV1zBE/dX7Cq0B3N7Wh3dZRHDdeLwDU0IwTgGeYNBxseN/zcie2fL5zFIZeb0EB3uz9f97q
	n8d7cR6iVFUGlDozzHUVTeKPlT42NCKL/SAgYBt32SZBRPbJkKAwXi4tBbAru/8Fb4g0BbPSBTEKq
	EZONvOBeItyAtR2dhN/Pr98TcnSGQAWz7UIuaR4VzkGKqf3G/tYlYdeShDG6uozFnfjEladfMxPkp
	2re9Eh+Kr1bKoO0LDJHWpq2fU71CprAJGRoEB8gkLiA/ZP9HqfZVMdvL1apESLPXT5VfW4hVXndUp
	qLlg5gWg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqgz-00000005vkZ-1ZBb;
	Tue, 27 Oct 2026 23:34:57 +0000
Message-ID: <099dc59b-0699-4c2d-875e-289cf6d32cce@infradead.org>
Date: Tue, 27 Oct 2026 16:34:56 -0700
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
Subject: Re: [PATCH 2/3] sched/core: Add sched_stack_end_check= boot parameter
To: Chris Down <chris@chrisdown.name>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Ard Biesheuvel <ardb@kernel.org>,
 Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <cover.1793082868.git.chris@chrisdown.name>
 <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/26/26 11:36 PM, Chris Down wrote:
> +static int __init setup_sched_stack_end_check(char *str)
> +{
> +	bool enable;
> +
> +	if (kstrtobool(str, &enable)) {
> +		pr_warn("Unable to parse sched_stack_end_check=\n");
> +		return 0;
> +	}

This error branch should return 1 since it handled the command
line parameter -- it just didn't like the "value."

Returning 0 causes the option string to be added to init's
environment, which is not wanted in this case.

-- 
~Randy

