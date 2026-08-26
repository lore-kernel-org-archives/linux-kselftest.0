Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EDD47FAFF
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 21:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787781513; cv=none; b=kmERLpIKcVgodbViC2S3YsyXOFPBNHTJx2c3VaD1ZV7vw+YGG6VaOiv0TTkV1HrqyJ4Od+evXUN8eI/f29sf4OLUBhtjMHO8yB3ZrQkR+xl3aOe/dVVkR0KWUoB+RMWiNsHn7vTatdJJC5pXGzfD5V+qCnYaRFTf4kEhayqsuyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787781513; c=relaxed/simple;
	bh=s7vJsB8p4ex7LHEOlDRqznCRHidLUdiJOoJPTz/qS6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjKXhjVx8vigkACpNewWcgyGEQf7e/2+77IAkCcoxVKeBA9jw4Sq4YEKDo7pQ6JrTU8Y2J2QesXxSCvLdFMukNO0RTDSM1Qri6umJceo7VylMNZim4Pa6NUDLA8UCoYYK9Zdms0krm7VIkpD3ZPo1Q7DptwKiX1CnEx6ZQXagNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=fVcTXNW2; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="fVcTXNW2"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-934944f2d22so84103985a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 14:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1787781510; x=1788386310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jG2VK8J2UsrKsgRFCrwZAYzLNxJ4QRVgAReN+n24iAs=;
        b=fVcTXNW2I1m++poFekaMNjcBSgR2I/chpJR7DHNZmW1c8tFr4bEDY2mB282zjVet/8
         Pnc/7nSfouQcFiG4rNPa6DLPhMPiSL5SFPbfj6EbtLsB9ixu6Uo3iP2z1EYHZDyML8V6
         nE4dlIj9JpIQEt+/oPQfivBEXn8vud6fQAVAriovZdugRs9YYpbl07buu/U6qByxHEGQ
         DRRt63tZeRwQqO403a+xCQWB31Bu9lHhbkKU1+nOQ+Nh3ahNWoQlbLDknm8/Oyb5cKaP
         A2S5PjEy9aJzYoaCh+w8ycLrFnSdpLlDM3nFk0rU2ua7GFB7+6A3g/AcKsBIvAM8vD5Q
         f4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787781510; x=1788386310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jG2VK8J2UsrKsgRFCrwZAYzLNxJ4QRVgAReN+n24iAs=;
        b=qUj66NkKce1bNLfu8xqIgJgPMx7xQ87lySuwrblHeDfWacCqfwfuoLPH2x5E63Qq82
         L+gO0USPrcggQznKsr92OFPgE8YS6cOuER39VdM5UorHQHUgtIFpeCSkPjzrxFJK3vwQ
         4qtyWWqwOmhxZFr6Qz1zdqRTPfN27stXUcJLkx7sP/R6BWoFD1A+aaXMaIECQMer2ir1
         KXpw5wo+L3fcIM+qsIgadAOfdCci6sL688gQz3aml113va3sl7440IDIqHGuyeh6N3zX
         YyVKCoweFGKQ4Nd62EvCLvQzHLiu+g0OJf2Z2u4bBglJ2o9pUCeXzQkJtCBF/XqolMsF
         JwDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWetpUpbyz5Q+Fu3ITnqpBYL2UrM2C1lSwe7dBkRsQP6shffltfW7pY/keBx9E96GjS6BPpEkezLH3Xir6gp8=@vger.kernel.org
X-Gm-Message-State: AFuF++mqcapG1msURyMQo6D3kaU3kmE5p5oVIjfTAhnU3yaz+19bjIqY
	dJwcgIcwR7+Bowf1azEmFEe4uZk1DQxrq6eqcOiLfujfkUTfG91XJhNe3sTaXUPpnk8=
X-Gm-Gg: AR+sD13wdU8kzJycOD9yhdIqmvGgAWfqHObjHct2l0OHbTGQdbsbAgGlLTiOlNvYeFM
	vnUR3iOhDVWCYeOxnR8Suix7KltQjcgSt0Z/CyxjQu6bogQmFiFTjFC8izd/X91iM1relE/bEAB
	joyPjW25Ot8D1ZD4Koxg4dIOOTDMMriDWdpjmjK1KrhkUcoierCLOIRw1nknmSJ2dz47YfqWhjZ
	fomCMR/B+BjF649wyAc4GLqXpziC825XxIbkVRlPMX5qgw2R3o2zls8sC8TQlIOtqPfJnCqvvmC
	rxfb+/S1StoOER3wtLt9fdYdOjnddk1/PvuonlzQogja/OVOPiSGiEQHrkXki0v5HT5jUstqUEM
	IcEvlc0/+CGVTULN/izV5lPbFjhe8+Sr6KB82ajmugTvGk+h8/P15zJLKbLCCb0zr7PspCp/Pk9
	LR4Oob8u6pOtIknNiuAsMjhdnjWwb1GbHCr6k21jWAiIqH/QPavysyZDjiMT5eEQF31VCNATYFr
	HWvOB65iUV1zI0/iqwGHfeH2jtkd3ViuXsldLBlWlYs
X-Received: by 2002:a05:620a:142:b0:938:fd60:4f9 with SMTP id af79cd13be357-938fd600d20mr393765785a.27.1787781510374;
        Wed, 26 Aug 2026 14:58:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cd73e3261sm701776d6.32.2026.08.26.14.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 14:58:30 -0700 (PDT)
Date: Wed, 26 Aug 2026 17:58:28 -0400
From: Gregory Price <gourry@gourry.net>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Rama Krishna Katta <ramakrishna.katta@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Gregory Price <gourry.memverge@gmail.com>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] selftests/ptrace: Skip get_set_sud if SUD is
 unsupported
Message-ID: <ao9hHvfw1bGVYDAS@gourry-fedora-PF4VCD3F>
References: <cover.1786965107.git.christian.loehle@arm.com>
 <1f16bf30aebbbf44ffc598359e0d474887162e7e.1786965107.git.christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f16bf30aebbbf44ffc598359e0d474887162e7e.1786965107.git.christian.loehle@arm.com>

On Mon, Aug 17, 2026 at 12:16:09PM +0100, Christian Loehle wrote:
> Syscall User Dispatch is unavailable on architectures without generic
> syscall entry. Such architectures return -EINVAL for otherwise valid SUD
> ptrace requests.
> 
> The test currently treats this as a failure even though the feature is
> not supported. Probe SUD with a valid disabled configuration before
> creating the tracee and skip the test when the kernel returns EINVAL.
> Other errors remain test failures, and kernels that support SUD continue
> to exercise the ptrace GET/SET requests.
> 
> Fixes: 8c8fa605f7b8 ("selftest, ptrace: Add selftest for syscall user dispatch config api")
> Reported-by: Rama Krishna Katta <ramakrishna.katta@arm.com>
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

> ---
>  tools/testing/selftests/ptrace/get_set_sud.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tools/testing/selftests/ptrace/get_set_sud.c b/tools/testing/selftests/ptrace/get_set_sud.c
> index 2e619c7599bb..395674f85964 100644
> --- a/tools/testing/selftests/ptrace/get_set_sud.c
> +++ b/tools/testing/selftests/ptrace/get_set_sud.c
> @@ -22,6 +22,14 @@ TEST(get_set_sud)
>  	int ret = 0;
>  	int status;
>  
> +	ret = prctl(PR_SET_SYSCALL_USER_DISPATCH, PR_SYS_DISPATCH_OFF,
> +		    0UL, 0UL, 0UL);
> +	if (ret == -1 && errno == EINVAL)
> +		SKIP(return, "Syscall User Dispatch is not supported");
> +	ASSERT_EQ(0, ret) {
> +		TH_LOG("PR_SET_SYSCALL_USER_DISPATCH: %m");
> +	}
> +
>  	child = fork();
>  	ASSERT_GE(child, 0);
>  	if (child == 0) {
> -- 
> 2.34.1
> 
