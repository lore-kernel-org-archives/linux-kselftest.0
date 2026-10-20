Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513838;
	b=TDsgz7CdiCfJNYDHFFOJIykuaDZrUD6w36Bexc+hmq2Mf4Ly+slg2rRTT9tjjoKzgIDp
	 kv5BbxBniaVNMtQIKja1gBStQQsQIB7uaz7dYV6fYjRujP3/XfeYs5gszvSaUMMJMGnQ4
	 0le46Gc6US/+OJ/oJ+h0WtdxTuhf3ABt7ETXvnG2iH6EG73y/ZviLW9jhf3LNhCI97r1R
	 +rrvNHu/rZ2BK88YKyP4fTkJ7hS6PAOUlC3ZhLxVAnq/eBBEa19xXYuktJhdr0a5PDZle
	 V5NwbCH8oRr7FYu2ogogH4upvahQnjZqBDx+5zJDepyYpyQnUEQgQEBkgH281zuKiNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513838;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=DcCWwbZS23KYMR/sEBDt35aSCtYzAp0QY19fXgsqLxw=;
	b=4nKLffO1JKLzRLEtyAiNsKKA1f2DTH9WVthFvdkRujJdeUQyUCHRYMAJSC8BPKV1mo1D
	 KyyDnHCVTqvel0eVcXHoJwk21bTfEs4Q/O7QGTFyUkLQGseE21i2jzx/PgkLD6CHgaBu8
	 7RjUuSU8tDQmrGFx71dRcNttUpbZMoPDrk81Qz6sBIaPx+4walsn7PDsYKw9nogxHj9Wf
	 sSPAVC7YNuZw/+IBGtsA0ftbt0bgPUCI+8Pip+ohd2+/lhhCYxKYgppfaa0xNt7/SiPA+
	 NEW/g03NJEJMHnqWC8J82Ff6g4RWO8fHsRrxlarLUJFX5DeWV/juWxYnZBwjraSnLtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cmJnqFxL;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06D5606A31E;
	Tue, 20 Oct 2026 16:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E06D5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cmJnqFxL
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C04D01596;
	Tue, 20 Oct 2026 09:30:33 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3490D3F7D8;
	Tue, 20 Oct 2026 09:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792513837; bh=m1FJxPdRfKxX40JNrwQD2DrI8WndcQmO1AmApkxrzy4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cmJnqFxL8UZdNoJUbjkM1opomQ/2hvjVeGMywAtcSLPiKt1M1ZkFmfgAz9BEyFZ51
	 C/0itNKiPVFVaube27p63hV6nUz6Je4wPxwbTlmejc70G4EcCcY07N5AsLCNMu2t/7
	 vIpruXkv/3Krs6nMKcmw0wghFIClii9wTyJcrtt8=
Message-ID: <847af89d-7b79-44b4-8273-243dfb51ef5e@arm.com>
Date: Tue, 20 Oct 2026 17:30:33 +0100
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
Subject: Re: [PATCH v5 1/2] selftests/resctrl: Implement cl_flush() and sb()
 for aarch64
To: Richard Cheng <icheng@nvidia.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, x86@kernel.org, shuah@kernel.org,
 fenghuay@nvidia.com
Cc: Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kaihengf@nvidia.com, kobak@nvidia.com, newtonl@nvidia.com,
 kristinc@nvidia.com
References: <20261012074729.40042-1-icheng@nvidia.com>
 <20261012074729.40042-2-icheng@nvidia.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261012074729.40042-2-icheng@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Richard,

Thanks for having a look at the arm64 side of the resctrl selftests. That hasn't had much love but
it would be good to have them working properly.

On 12/10/2026 08:47, Richard Cheng wrote:
> cl_flush() and sb() compile to empty functions on aarch64, making
> mem_flush() a silent no-op and leaving CMT/CAT tests operating on
> unflushed state.
> 
> Add "dsb sy" for sb(), ARM requires a DSB whose access type covers both
> loads and stores.

I guess this is referring to the synchronization required for the cache maintenance instruction but
that's not what you are using in this patch.

> 
> For cl_flush(), "dc civac" only reaches the Point of Coherency, on
> ARM MPAM systems the SLC lies past the PoC and may be a NOP on coherent
> platforms. Instead, dirty each cacheline with a store so that
> mem_flush's full-buffer sweep evicts lines from the SLC via LRU
> pressure.
> 
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---
>  tools/testing/selftests/resctrl/fill_buf.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
> index b9fa7968cd6e..eae0262fe265 100644
> --- a/tools/testing/selftests/resctrl/fill_buf.c
> +++ b/tools/testing/selftests/resctrl/fill_buf.c
> @@ -27,6 +27,9 @@ static void sb(void)
>  #if defined(__i386) || defined(__x86_64)
>  	asm volatile("sfence\n\t"
>  		     : : : "memory");
> +#elif defined(__aarch64__)
> +	asm volatile("dsb sy\n\t"
> +		     : : : "memory");
>  #endif
>  }
>  
> @@ -35,6 +38,14 @@ static void cl_flush(void *p)
>  #if defined(__i386) || defined(__x86_64)
>  	asm volatile("clflush (%0)\n\t"
>  		     : : "r"(p) : "memory");
> +#elif defined(__aarch64__)
> +	/*
> +	 * Dirty the cache line with a store. As mem_flush() sweeps
> +	 * the full test buffer (sized larger than the SLC), cache pressure
> +	 * evicts lines from the SLC via LRU replacement.
> +	 */
> +	asm volatile("strb wzr, [%0]\n\t"
> +		     : : "r"(p) : "memory");
>  #endif

Isn't this cl_flush() used without changing the resctrl control and monitor group (PARTID/PMG)?
Hence, I expect you are ending up making the cache full of data associated with the identifiers that
the benchmark runs with. Is that the case?

I'm also unclear how this the cat_test will detect any performance differences on arm/MPAM as the
perf events would need to specific to the system level cache implementation.

Thanks,

Ben



>  }
>  

