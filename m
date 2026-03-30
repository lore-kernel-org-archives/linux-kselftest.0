Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2314E3B894A
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 10:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865297; cv=none; b=PkM7qz00ZFZ/OZmaxAjd0++C6OXf7wYqW3vAm77fQ05colvjmNk9D6wbelgLCWQxr/HDpWddaqjiMg4K6J4oHnzHa4ImwNu4uJkqdi7RBpmjIEBOeL0SAAm3BifFFig8AOzq/JGA//EZcEW70ZtmzHkP/4dtOaFjDYhRO6ozEB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865297; c=relaxed/simple;
	bh=v250ZV92EhEwjYdBfOvaczIRyfoVDf+akMaT36DogAs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBp8Z9Eyvo/EzSA4fmfaq0IZ+TvpnqQcP0ueqfhFCXwm1S9sorB7Mlr4DnSWKlENwFir90IWSrgnETcO+urrQuudLQAGJHzgtl53KDcp6DvsDGpmunAKPuFlWaYgYb/BEXa3MSkaNEWCVaU7pLZC4FI8LFSoZHwNZ7U2WGzlUfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhdfPi75; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhdfPi75"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so37864015e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 03:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865292; x=1775470092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wOJlHnF0FtnHg5n4sKn9pSKwGW+M2qTevZxKmKCpMJA=;
        b=RhdfPi75GDz4W0Us1XCw1F+urAq2UR0TOEkZ8y+6nFHzY3E4c0QJlusy1o65Ayo1g+
         qjRubdVhMqJNw6ulQNRB6Kpec3CA2pFtbDzkb3mjdVAKGcnZ3FBbr96K76XsQU+mDxgK
         HZir9giH0sMUEZ6xP0DHC8YW7w4XJqzwlPqE6SZDBMeP2WdYWz4YBj64VC1XEAMf5UNn
         G37otyrP2RmZk1QvG2nabawVo8CWI0SSNblxkgF79P0eh4c1puDMHHWrnJZQBlPHpFX3
         UHNAR2VIB/zjj/RGIgSrUf/b9SfNpjVbbLDaB5Q/RdGKxTJj+H24DFiIVPqAnRH+KFE5
         A7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865292; x=1775470092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOJlHnF0FtnHg5n4sKn9pSKwGW+M2qTevZxKmKCpMJA=;
        b=j0Rg9i5nPUIXpUGqpuApI+wHt8Zeo5tDCjRZu2jQMlpT2LfyAGek0+ZdDsmPwkOuzG
         d0Y1RABX5y3jMf37knpsNCELB+nayTNUvNJix0rCxCyrrHxuoII+8pq2PQFGRUI+xEiQ
         T52mLIGSUkVc+B17OJ5MObIeiP/llA0UzeNT8ZhePSFPDKDboF+4rY1l1nrng9UqZ7aB
         vvkrcRr+Io2xHMoA0p1FF1itLVg8UPIULuTlH0TGnCZZkjbH2QAhXjUJwK0TSnIc1A88
         xoENEg7jW2Xt/mUtcbykjO5oMXRyaac/01cxMj1B5NtmLhWMVxotUl8ustnRQCWl6WRv
         ZNuA==
X-Forwarded-Encrypted: i=1; AJvYcCWhG/bGezblpMCbMmZMslg8qaI2Kc7pFJGp/G+gd2AtXwLcdFJLeTo7WOvLaGFjq2/sOphP1heGYOdZV2zlEzY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0EeUGYc3747yfWr/eBQRyNZShOYRroU70vlCtwx3x/5dUZexK
	z1iWK4ZveNjTSQReOVRuqN2oYRjEOikPFVMm/excE2/qv1Y4eUbClJjo
X-Gm-Gg: ATEYQzziXXp+Vt9XHiIBqt+bNAmrjpEtXLycJzgQszgXov+eidsrCjR6/2OiBy6XUQT
	Yjil114F8MU4XzPjBcpLlEeVaUir57gK83v0hiNOrqljfrcT80VjEmj7Q4oQgAXypuqX03sYa5+
	7Lw9T8Q6bWmkjOALyiFuCbTR6dlTuaPjJxD3M7TvpPT5H9AtEVr5hWvBD7YKwLohqPI2v/QcMXK
	5gJ9051F0GMw1N5LhKaK+7Fs8BN1vIqrkR3+MRxrCPPG/pNg7GPost23sKGvBr+bWi2KNaGwL6+
	QUFF/ufSUhaJEh1+wxVoxU8hRKj4EMS1Eg2W8E40PJSiugVKGUAYQVhjK7U/XXX95ctqdsdheY3
	u9A0QYqzAqsls59ovWanMa9ic1312ymX6mR+cMuAg9vn7sgwM2yOiNQTNGRv7skDsfNX310Ja8E
	SvO8wzFIzRVjkRLzbRg79WLwpuMEQAUvu1mKE=
X-Received: by 2002:a05:600c:3e15:b0:486:f9aa:2b57 with SMTP id 5b1f17b1804b1-48727f7be10mr215629695e9.16.1774865292204;
        Mon, 30 Mar 2026 03:08:12 -0700 (PDT)
Received: from krava (37-188-160-213.red.o2.cz. [37.188.160.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48730628efasm277656905e9.5.2026.03.30.03.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:08:11 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 30 Mar 2026 12:08:08 +0200
To: Hoyeon Lee <hoyeon.lee@suse.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
	Shuah Khan <shuah@kernel.org>, Feng Yang <yangfeng@kylinos.cn>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 1/2] libbpf: allow address-based single
 kprobe attach
Message-ID: <acpLiCDwAtn8xLjs@krava>
References: <20260329124429.689912-1-hoyeon.lee@suse.com>
 <20260329124429.689912-2-hoyeon.lee@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329124429.689912-2-hoyeon.lee@suse.com>

On Sun, Mar 29, 2026 at 09:43:38PM +0900, Hoyeon Lee wrote:
> bpf_program__attach_kprobe_opts() currently attaches a single kprobe only
> by func_name, with an optional offset. This covers only the symbol-
> based form, not the raw-address form that the kernel already supports
> for both kprobe PMU events and legacy tracefs/debugfs kprobes. Callers
> that already have a target IP still have to drop down to
> perf_event_open() or direct tracefs writes.
> 
> libbpf already exposes address-based attach for kprobe_multi through
> bpf_kprobe_multi_opts.addrs. This commit adds bpf_kprobe_opts.addr so
> that single kprobes can be attached either by func_name + offset or by
> raw address.

curious, is this change just for the api to be complete or you do have
a usecase where you can't use kprobe_multi and need to attach kprobe
by address?

SNIP

>  static void gen_probe_legacy_event_name(char *buf, size_t buf_sz,
> -					const char *name, size_t offset)
> +					const char *name,
> +					uint64_t offset_or_addr)
>  {
>  	static int index = 0;
>  	int i;
>  
> -	snprintf(buf, buf_sz, "libbpf_%u_%d_%s_0x%zx", getpid(),
> -		 __sync_fetch_and_add(&index, 1), name, offset);
> +	snprintf(buf, buf_sz, "libbpf_%u_%d_%s_0x%" PRIx64, getpid(),
> +		 __sync_fetch_and_add(&index, 1), name ?: "addr",
> +		 offset_or_addr);
>  
>  	/* sanitize name in the probe name */
>  	for (i = 0; buf[i]; i++) {
> @@ -11648,13 +11651,28 @@ static void gen_probe_legacy_event_name(char *buf, size_t buf_sz,
>  	}
>  }
>  
> +static void gen_kprobe_target(char *buf, size_t buf_sz, const char *name,
> +			      uint64_t offset_or_addr)
> +{
> +	if (name)
> +		snprintf(buf, buf_sz, "%s+0x%" PRIx64, name, offset_or_addr);
> +	else
> +		snprintf(buf, buf_sz, "0x%" PRIx64, offset_or_addr);
> +}
> +
>  static int add_kprobe_event_legacy(const char *probe_name, bool retprobe,
> -				   const char *kfunc_name, size_t offset)
> +				   const char *kfunc_name,
> +				   uint64_t offset_or_addr)
>  {
> -	return append_to_file(tracefs_kprobe_events(), "%c:%s/%s %s+0x%zx",
> +	char probe_target[128];
> +
> +	gen_kprobe_target(probe_target, sizeof(probe_target), kfunc_name,
> +			  offset_or_addr);
> +

it seems like it'd be easier to get probe_target (via gen_kprobe_target)
in bpf_program__attach_kprobe_opts and pass it down instead of generating
it over and over again

> +	return append_to_file(tracefs_kprobe_events(), "%c:%s/%s %s",
>  			      retprobe ? 'r' : 'p',
>  			      retprobe ? "kretprobes" : "kprobes",
> -			      probe_name, kfunc_name, offset);
> +			      probe_name, probe_target);
>  }
>  
>  static int remove_kprobe_event_legacy(const char *probe_name, bool retprobe)
> @@ -11674,25 +11692,29 @@ static int determine_kprobe_perf_type_legacy(const char *probe_name, bool retpro
>  }
>  
>  static int perf_event_kprobe_open_legacy(const char *probe_name, bool retprobe,
> -					 const char *kfunc_name, size_t offset, int pid)
> +					 const char *kfunc_name,
> +					 uint64_t offset_or_addr, int pid)
>  {
>  	const size_t attr_sz = sizeof(struct perf_event_attr);
>  	struct perf_event_attr attr;
>  	int type, pfd, err;
> +	char probe_target[128];

we need bigger buffer as explained by sashiko [1]

[1] https://sashiko.dev/#/patchset/20260329124429.689912-1-hoyeon.lee%40suse.com

jirka

>  
> -	err = add_kprobe_event_legacy(probe_name, retprobe, kfunc_name, offset);
> +	gen_kprobe_target(probe_target, sizeof(probe_target), kfunc_name,
> +			  offset_or_addr);
> +
> +	err = add_kprobe_event_legacy(probe_name, retprobe, kfunc_name,
> +				      offset_or_addr);
>  	if (err < 0) {
> -		pr_warn("failed to add legacy kprobe event for '%s+0x%zx': %s\n",
> -			kfunc_name, offset,
> -			errstr(err));
> +		pr_warn("failed to add legacy kprobe event for '%s': %s\n",
> +			probe_target, errstr(err));
>  		return err;
>  	}
>  	type = determine_kprobe_perf_type_legacy(probe_name, retprobe);
>  	if (type < 0) {
>  		err = type;
> -		pr_warn("failed to determine legacy kprobe event id for '%s+0x%zx': %s\n",
> -			kfunc_name, offset,
> -			errstr(err));
> +		pr_warn("failed to determine legacy kprobe event id for '%s': %s\n",
> +			probe_target, errstr(err));
>  		goto err_clean_legacy;
>  	}
>  

SNIP
