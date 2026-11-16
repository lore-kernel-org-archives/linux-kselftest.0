Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832309;
	b=Ot0+dyrNTRW9Ly0Yf1BqeMvjjBireCD4NfIogsd0WLu+V/tc9sDccbxOl0CLSUb4rgzg
	 KMqAJkFdj0I6+3hBr1heRlLKA0rJEdGRA8JNeAHFe/JvN9JqWIoSbCu9T9eYJ2HEtHsxT
	 gbTVFD2fCcbisDXJUl3MtFIzpneY8ZCpwERs6iIBmSRUWmxrwsHUi+Rruj+6U3GHmbhj6
	 zD1Gsi/c1mkXY5Rx+9Z8Mdxvgd2YobIMjx0r7GmV/GbVx0b8O4/gPSj4Wrmyi45gLVlb+
	 e9IXZ76a8tEEfVeS6EIkQc/sJ8mFCF0Lf0UTPKhL9rnwgjcKsbtDMT88kLGIdobZ3Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832309;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Language:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy;
	bh=rwmmgtDh2eN4LpVrsK7ls3CDYxuyy9JTkH68hg98ZZw=;
	b=VmFzvNwID1sx8VvIKqK01nnrkalEXHIgbsyci9bJ0xKjJoftghUqJY8KO4fCdYWsto3r
	 iMN0D1JTK1CRsEELilDOADPuEUhXW6N6nRjSU0ifyEb0DjERIZ4PbiKl7aC+PeMdwZykU
	 AnvjMT7UVL4D4O3T2Uj8JlEoWJiB8Lt2ET+MX4jHfFJ2IgSF8pOJWUaYSt2FKHgJJwncj
	 u8HF/jPniIp8qJ+y2AmFG9BbnDPNOjWjyF0JUgyw64plba5EmYrtO7WI55u/hW4vc674j
	 vvB9ld2IVKnaPoBOYMIqS8hVfDNo/ZBb6+9IoFOg3xeywkTlyHWEbul6rzrOh5FNIhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Af+L+Bhf;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A06606A33A;
	Mon, 16 Nov 2026 12:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27A06606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Af+L+Bhf
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rwmmgtDh2eN4LpVrsK7ls3CDYxuyy9JTkH68hg98ZZw=;
	b=Af+L+Bhfhha7Ev+VvSiyLLUQRR/SYDcDaqvoxdvE8cdSSDC7VwwRRcrMiAC9ViVYw1n1S5bcE
	I0VUnw4xacmSHo/XQxPflBar6M1/mlscmzq261hMg69gl8zU5QsVttnOB3t61r9te9VDaXcI1eK
	OH+aBXqOQvMz9hoW8T/FLFs=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jSnKS2hkYz1prKT;
	Mon, 16 Nov 2026 20:31:24 +0800 (CST)
Received: from whupemo200006.china.huawei.com (unknown [7.152.185.252])
	by mail.maildlp.com (Postfix) with ESMTPS id 29B984057D;
	Mon, 16 Nov 2026 20:31:36 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 whupemo200006.china.huawei.com (7.152.185.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 16 Nov 2026 20:31:34 +0800
Subject: Re: [PATCH v2 2/3] kselftst/arm64: Test NT_ARM_SVE FPSIMD format
 writes on non-SVE systems
To: Mark Brown <broonie@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Oleg
 Nesterov <oleg@redhat.com>, Mark Rutland <mark.rutland@arm.com>, David
 Spickett <david.spickett@arm.com>, Thiago Jung Bauermann
	<thiago.bauermann@linaro.org>, Luis Machado <luis.machado.foss@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20251015-arm64-sme-ptrace-sme-only-v2-0-33c7b2f27cbf@kernel.org>
 <20251015-arm64-sme-ptrace-sme-only-v2-2-33c7b2f27cbf@kernel.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <e5b40037-8314-9ad2-91e0-9347109bed31@huawei.com>
Date: Mon, 16 Nov 2026 20:31:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20251015-arm64-sme-ptrace-sme-only-v2-2-33c7b2f27cbf@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemo200006.china.huawei.com (7.152.185.252)

On 2025/10/16 1:56, Mark Brown wrote:
> In order to allow exiting streaming mode on systems with SME but not SVE
> we allow writes of FPSIMD format data via NT_ARM_SVE even when SVE is not
> supported, add a test case that covers this to sve-ptrace.
> 
> We do not support reads.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/fp/sve-ptrace.c | 61 +++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
> index e0fc3a001e28..f44d44618575 100644
> --- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
> +++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
> @@ -394,6 +394,58 @@ static void ptrace_sve_fpsimd(pid_t child, const struct vec_type *type)
>  	free(svebuf);
>  }
>  
> +/* Write the FPSIMD registers via the SVE regset when SVE is not supported */
> +static void ptrace_sve_fpsimd_no_sve(pid_t child)
> +{
> +	void *svebuf;
> +	struct user_sve_header *sve;
> +	struct user_fpsimd_state *fpsimd, new_fpsimd;
> +	unsigned int i, j;
> +	unsigned char *p;
> +	int ret;
> +
> +	svebuf = malloc(SVE_PT_SIZE(0, SVE_PT_REGS_FPSIMD));
> +	if (!svebuf) {
> +		ksft_test_result_fail("Failed to allocate FPSIMD buffer\n");
> +		return;
> +	}
> +
> +	/* On a system without SVE the VL should be set to 0 */
> +	memset(svebuf, 0, SVE_PT_SIZE(0, SVE_PT_REGS_FPSIMD));
> +	sve = svebuf;
> +	sve->flags = SVE_PT_REGS_FPSIMD;
> +	sve->size = SVE_PT_SIZE(0, SVE_PT_REGS_FPSIMD);
> +	sve->vl = 0;
> +
> +	/* Try to set a known FPSIMD state via PT_REGS_SVE */
> +	fpsimd = (struct user_fpsimd_state *)((char *)sve +
> +					      SVE_PT_FPSIMD_OFFSET);
> +	for (i = 0; i < 32; ++i) {
> +		p = (unsigned char *)&fpsimd->vregs[i];
> +
> +		for (j = 0; j < sizeof(fpsimd->vregs[i]); ++j)
> +			p[j] = j;
> +	}
> +
> +	ret = set_sve(child, &vec_types[0], sve);
> +	ksft_test_result(ret == 0, "FPSIMD write via SVE\n");
> +	if (ret) {
> +		ksft_test_result_skip("Verify FPSIMD write via SVE\n");
> +		goto out;
> +	}
> +
> +	/* Verify via the FPSIMD regset */
> +	if (get_fpsimd(child, &new_fpsimd)) {
> +		ksft_test_result_skip("Verify FPSIMD write via SVE\n");
> +		goto out;
> +	}
> +	ksft_test_result(memcmp(fpsimd, &new_fpsimd, sizeof(*fpsimd)) == 0,
> +			 "Verify FPSIMD write via SVE\n");
> +
> +out:
> +	free(svebuf);
> +}
> +
>  /* Validate attempting to set SVE data and read SVE data */
>  static void ptrace_set_sve_get_sve_data(pid_t child,
>  					const struct vec_type *type,
> @@ -826,6 +878,15 @@ static int do_parent(pid_t child)
>  		}
>  	}
>  
> +	/* We support SVE writes of FPSMID format on SME only systems */
> +	if (!(getauxval(AT_HWCAP) & HWCAP_SVE) &&
> +	    (getauxval(AT_HWCAP2) & HWCAP2_SME)) {
> +		ptrace_sve_fpsimd_no_sve(child);
> +	} else {
> +		ksft_test_result_skip("FPSIMD write via SVE\n");
> +		ksft_test_result_skip("Verify FPSIMD write via SVE\n");
> +	}

I haven't read the patch in detail, but it seems that we should update
EXPECTED_TESTS accordingly.
