Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C789348469
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Apr 2026 16:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776442992; cv=none; b=EEQNCnyEhGR0nAG6/Nu3pE7ut+Aw7oW/Pwf/y5beBbJ4uNzEnz8jPPp9iWPnR50UNFAcUOqBiXpcras/cRmWHpBATM3Ug3/GPzoUAR+VWJ677FqKBKCfWZQR2FaSEcIKCk+Bd4oEgof+vCdaa5Y3mDf/0AHbNgNzjivxOS9SBP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776442992; c=relaxed/simple;
	bh=1inrkQymh6YJtiIcOpocxYDPhUNrtx5Qz/ANslnvt4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNIirYLaJuJgcgfwjxqnCzzqf4weIWg+XEn2A55lSoGeun7d+yFw4yIio8OVhHM0rXomi+ZmHerFLUBSTmGYHJ6PKhFNQqNUwwJSN8gRXpVVf6SR8feByVnnULInes9E11x5Rym03PiHJGZhRWBHiuX+HF4C9SnBR3UQSH2fPDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epe3PpxU; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epe3PpxU"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35fbca04006so519476a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Apr 2026 09:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776442990; x=1777047790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OhFcWEHC6x3NRrSWvUQYL2S86pVw9wWBWY42qwwALr0=;
        b=epe3PpxUHEbOzJLo5hqA2lKrGclcXQs5DGyw1eqkj9h6WNtbCuIQORMiawVohxs6ZX
         8/xjYmgozJR+vPJji6ypDcrUmuZhwqR4r2WeGO8Oo7p4EsivJHTMCOnz4JxN1qxuvtWY
         gN1IEs87iVBpSCQhlQC67su9QKcIfRMGCuZuMGpP1pLOESGwkojtWdmKc6xpebfwIB8F
         BYhmOvsP3tynZ01VJdft9I6QfAUzKib6qEQhCPweX7xEMY7TbsZCe2NQqW8ydT+r7Mca
         AHQVIHmuVIK2ZgOaMBUudCFb2C4N+fBNQnM25vmgGr19VJV2Foayb3Ts5kEsKoE7pS/w
         45FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776442990; x=1777047790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhFcWEHC6x3NRrSWvUQYL2S86pVw9wWBWY42qwwALr0=;
        b=Ax46n76vCyOcuVJgB/xrbDORKOFmTfK7lo1KlozGd+9OD2yPwCF3QxsBQ2HgVmw/5h
         8zRu7BHs7nu9OC4c/QS1/dr7TcHzCtNl+A2wCHoSLL7l+Z/pbM3ln1RsOma7bTZAChIo
         F8BPDdb4KfzReVDuI+ZT11KNGW896cKbAi36t7yrh2jnTcDLUtMlQWT1bjOD7q1DYyJ2
         J5qeVyBsrF2SP9GNzLOEc1cu4t+PPLEYH636yk/oe0LQKaFgzN4eiYSOAc24K4SDdPLC
         jnrdXahkUB58NODvekFU7NkmofsTDCDzjMljJPrkdQd/wuuiMiFliwItxgOYoIYiVQv/
         5/eA==
X-Forwarded-Encrypted: i=1; AFNElJ/DuZ1WQCEriWGSCW6HsNs6KgLWTea8dp91LhVzIdjJFVaYsYIk7TZQrWzElAXwWOXMsBQK6toNTRUQQ5OVY4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKMcbkd2/05NO0ZZ0aOba+o3ake9Qw7wz0q8ccMqjgd4j33hjO
	u6XKnS4f21R9i8Zw/wMdNbjoXKo5dfalSmJ79ohpPsF7Ci3aqKckwTRy
X-Gm-Gg: AeBDiesymSF5hUwHaLLFooQy3+UW95h6PdB0eiM/UJgqQ4F2DLw3cotBMMHLzplhKcT
	XbDqKy03YNZpdceHTpyiZiObLbft/o1m3inxBzscGwISfS2QeTTR6omRUDx+g/5ZzVo9IHd5BNC
	NLi3BzaNKIV6oJcVHbrpcE9LF7TRurvMgWagYPxA4ucKuPVa1i1xFCpwcINBN202BB4WYmwq7fZ
	UVNQH+nV7YIA0GdoNnMF2FYN+CcpnvT1fCs31wvgJEoE0AhniGOivHfwaehnK9RnDbKZLq6Z+/D
	vweuL1+YZja4ODvnVH5djhyWiL8bm63dGaj/NJhGM1D1tofGoCp6iHS3H6JUclvHTSIkLW3m1kR
	ukyIYce1S8r2NM7cI+lBfRHaodTkkodIJ4urglr7DupDg8pnnf6AVhfwGdo3lbGHF/7iYGljiG3
	eeL93XPEssqF9qT9/RRxWR55b7vTmv5csFo6UL+BfhPl7H2ObNFpKj09Zi2WPkNyp1cDVwsv4=
X-Received: by 2002:a17:90b:3f47:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-3614048ee93mr4232003a91.21.1776442990474;
        Fri, 17 Apr 2026 09:23:10 -0700 (PDT)
Received: from eric-acer (36-225-119-66.dynamic-ip.hinet.net. [36.225.119.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613faf1103sm958121a91.8.2026.04.17.09.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 09:23:09 -0700 (PDT)
Date: Sat, 18 Apr 2026 00:23:06 +0800
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: Guopeng Zhang <zhangguopeng@kylinos.cn>
Cc: longman@redhat.com, tj@kernel.org, hannes@cmpxchg.org, 
	mkoutny@suse.com, void@manifault.com, arighi@nvidia.com, changwoo@igalia.com, 
	shuah@kernel.org, chenridong@huaweicloud.com, cgroups@vger.kernel.org, 
	sched-ext@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jserv@ccns.ncku.edu.tw, chia7712@gmail.com
Subject: Re: [PATCH 2/2] selftests/sched_ext: add cpuset DL rollback test
Message-ID: <2yfjwt5s2h7lgr7dvm5fgsvogpt7b6f4oeto6nqu3snyjlwgjy@mnigfkcv2vqa>
References: <20260417033742.40793-1-zhangguopeng@kylinos.cn>
 <20260417033742.40793-3-zhangguopeng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417033742.40793-3-zhangguopeng@kylinos.cn>

Hi Guopeng,

On Fri, Apr 17, 2026 at 11:37:42AM +0800, Guopeng Zhang wrote:
[...]
> +
> +#ifndef SYS_sched_setattr
> +#if defined(__x86_64__)
> +#define SYS_sched_setattr 314
> +#elif defined(__i386__)
> +#define SYS_sched_setattr 351
> +#elif defined(__aarch64__)

Nit: Since RISC-V uses the same assigned syscall number as ARM64, it
would be nice to support it here as well,

  +#elif defined(__aarch64__) || defined(__riscv)

> +#define SYS_sched_setattr 274
> +#else
> +#error "Unknown architecture: please define SYS_sched_setattr"
> +#endif
> +#endif

[...]

> +static enum scx_test_status run(void *arg)
> +{
> +	struct cpuset_dl_rollback_ctx *ctx = arg;
> +	char procs_path[PATH_MAX];
> +	long long before_bw, after_bw;
> +	int ret;
> +
> +	ret = read_cpu_total_bw(ctx->target_cpu, &before_bw);
> +	SCX_FAIL_IF(ret, "Failed to read baseline total_bw (%d)", ret);

The first read_cpu_total_bw() call is redundant because before_bw is
overwritten after spawn_dl_child(). Use a separate variable for the
baseline if needed. Otherwise, the second call already handles the same
error check.

> +
> +	ctx->link = bpf_map__attach_struct_ops(ctx->skel->maps.cpuset_dl_rollback_ops);
> +	SCX_FAIL_IF(!ctx->link, "Failed to attach scheduler");
> +
> +	ret = spawn_dl_child(ctx);
> +	switch (ret) {
> +	case -EACCES:
> +	case -EPERM:
> +		fprintf(stderr,
> +			"Skipping test: unable to place child in the source cgroup or enable SCHED_DEADLINE due to permissions (%d)\n",
> +			ret);
> +		return SCX_TEST_SKIP;
> +	case -EBUSY:
> +		fprintf(stderr,
> +			"Skipping test: SCHED_DEADLINE admission control rejected the child (%d)\n",
> +			ret);
> +		return SCX_TEST_SKIP;
> +	case -EINVAL:
> +		fprintf(stderr,
> +			"Skipping test: unable to enable SCHED_DEADLINE for the child in this environment (%d)\n",
> +			ret);
> +		return SCX_TEST_SKIP;
> +	}
> +	SCX_FAIL_IF(ret, "Failed to start SCHED_DEADLINE child (%d)", ret);
> +
> +	ret = read_cpu_total_bw(ctx->target_cpu, &before_bw);

Overwritten here.

> +	SCX_FAIL_IF(ret, "Failed to read pre-move total_bw (%d)", ret);

-- 
Thanks,
Cheng-Yang
