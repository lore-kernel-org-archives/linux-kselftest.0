Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C46D3B8BC4
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 07:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273433; cv=none; b=nIxkrLYIemxbqIUMuwB4qKubmi2aQtBdZAC9G36ekMwRcJWaZOJxDilhCn3nW4/0bCAqGHYx6HgfHi82zz5m/YCAYrRTC9KbudRkpK9uubkqY7v+S+yGj0pQrDEqyZewWun1XN0Q38ySsTW9vKytW3uQ8kRwZf49PlAU9is5DLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273433; c=relaxed/simple;
	bh=xZKlkdraHl+jaaWIKZlO19Ud/PjIYM4VZGKG7EVQueU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cwagMrY4l8nEflpww1XG3YvvFpFoFbkhrEo1gxzQwy0NUw4bpWWwl1jI0evoLqD/ffVR8WDL7azwQSbX+SbJV0C5D2M6ApLkhGovfKUMyYH1oxywZSxt4xhUED1wcGjAAzB7pomart0wIlptyEpl7/XZgl4zvcTFV1eKa5B4G9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bhMSLKZY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LrhSe7FT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bhMSLKZY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LrhSe7FT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784273416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EiTpHJiBdko2HxM97VIyiXB+2tLKUQclntf7/gSTl+s=;
	b=bhMSLKZYHl/py5zcKcL8NesfCCR7BVH4tV7jkyEaGZLJRR/x6bMPC6qxQT4KDPgqKMsCWq
	+QVPl41ftSVvod0R5Osyohdrla0LmUtDuAwhDrLl84zGkZNmukwqB/cUhS4ZImObchMAk+
	/lJahKyu157AoqU8hPnxmnJGZJE2UaI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-1xyprJ7pMamYgo_b25moPw-1; Fri, 17 Jul 2026 03:30:15 -0400
X-MC-Unique: 1xyprJ7pMamYgo_b25moPw-1
X-Mimecast-MFC-AGG-ID: 1xyprJ7pMamYgo_b25moPw_1784273414
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-473bc66c837so6290143f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 00:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784273414; x=1784878214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EiTpHJiBdko2HxM97VIyiXB+2tLKUQclntf7/gSTl+s=;
        b=LrhSe7FTMjuJ6hKgCBAoOXvLZExvGfXlsfrxkNKxYkgkYn+Fiw6UdA1Ml8VoFT01iS
         B1a+rFM7VJjfrklCW1rylP+FSfDgryavk7z9VKI18wYnkqF00k8TxAxGnGgM6HfB9jW6
         EJV2fvdlMUvTeE3oYVT8u8mQXmiVDK89s+4+nQFhHzb/ZlxHhYw3wcUOMRKLap6aXlh2
         MznkSBk3tHvK5ZQOAyc7h39VRzxjRHv/ijYaVP03pSaU+QCgOdc8MODYl4YBh3f+FCdG
         2tXrD4KwAzSRgG48p1+TVYlRYOMWVzo6OqJZuZFPmV5o6vYNyMShqf4K2rmfuD15+MBc
         deEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273414; x=1784878214;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EiTpHJiBdko2HxM97VIyiXB+2tLKUQclntf7/gSTl+s=;
        b=KYQ6/BXXU2YRow237h+lnpjOF91sAdpwa1spjqNJHQfPe/oxvQdza0HzNK9l7VMfX+
         FFX3dgvWmrh9yf+X/AVQ268MIxGjec7xiuJNk7Ag4UOvnCUvCHUbBadSCwAVJckxoa3I
         9BM6ItSrlq3A7Fs0O/lgWvYbcOfgGcR228OT/uGHQTO3FXRglkiDXifwxKtnUFwFIdAq
         SuFcixMM0B63HzocwDBiwsNSPch1EqR1dbuV1gIqBkdVxdZBMDb1ppqCMzFczh47dZgO
         /DRT55/dkiss5M679+5jFIfVl6XGVihAcQoLSDe+cwKK/MHATMWBOP/N62Ff2Pf+jfXi
         7KCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrsWrWwQfj4alslWZFi/qzeB/wKhKXelxRH/g+4hfC3ZCEoAF/LoYqQ6eSjHtCcJP1ZWGqqnSa2T+grzjNxsT8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4yaNj4jJf9YxRe0i+EkRLIGaRSQRR82ng9BETwC2FVsEWje/W
	gpTbN0I/RSabENTwJYxH7PE39bXwMsXj7Rqv7VyBy36SiDaKsc9vCumHRZIZYdZH36cBFJO5Pqw
	JbODlARzTf0d6iEM5ov9kHEpBc6uT9OUA2qxj84Wsm0wkHDrgG7glPjXG1e6XMclXCBQj
X-Gm-Gg: AfdE7cmplL6zwkIljxiPW5DHa0ZYcBNVzKDrOTccnKbzZ1wtQy6Ybbk85brrMIEAJ9J
	nWjW0RQnPygl8orFyZsp7uy86bN16BpbGO51fl/RilcQJKa7JtmlUDgE6z6nsBYSKGD6eHzdMDm
	jX8I0zELrbxQhdfPCWFzodUE9mQuU18SPlawtILXwt1xYC+RaPn8CFP0zazta27arBtIT2eyxpz
	tG5I1FCKJIuNu73q/pQqLrE+nigA36PonsBSya0Z3eOi/dTh7ar3BPWtzUrWG/i8+aTA/Xx+4M2
	Gg7VRMAkW4OUZ6RrRgyHgFYUmRakz2vffkNdonVC1xNxDvsVbNcP2pMpDlacayWFyHXjXNjrWLZ
	TEN7keEMhBq+E59kK2Sb6zBIK29me3BVeeek=
X-Received: by 2002:a05:6000:2885:b0:46f:5d62:d914 with SMTP id ffacd0b85a97d-47f6230651bmr2134404f8f.12.1784273413850;
        Fri, 17 Jul 2026 00:30:13 -0700 (PDT)
X-Received: by 2002:a05:6000:2885:b0:46f:5d62:d914 with SMTP id ffacd0b85a97d-47f6230651bmr2134346f8f.12.1784273413318;
        Fri, 17 Jul 2026 00:30:13 -0700 (PDT)
Received: from [192.168.0.135] (185-219-167-205-static.vivo.cz. [185.219.167.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edda9bsm1476282f8f.31.2026.07.17.00.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 00:30:12 -0700 (PDT)
Message-ID: <3e73aeb2-afce-4ae9-9163-51e4dc1ded01@redhat.com>
Date: Fri, 17 Jul 2026 09:30:11 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 1/2] bpf: add bpf_strcat,bpf_strncat kfunc
To: Rong Tao <rtoax@foxmail.com>, andrii@kernel.org, ast@kernel.org
Cc: Rong Tao <rongtao@cestc.cn>, Daniel Borkmann <daniel@iogearbox.net>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>,
 Yuzuki Ishiyama <ishiyama@hpc.is.uec.ac.jp>,
 "open list:BPF [GENERAL] (Safe Dynamic Programs and Tools)"
 <bpf@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
References: <cover.1784194024.git.rtoax@foxmail.com>
 <tencent_7B0E22F21BB4086D66815C86AA5CBC5E8E0A@qq.com>
From: Viktor Malik <vmalik@redhat.com>
Content-Language: en-US
In-Reply-To: <tencent_7B0E22F21BB4086D66815C86AA5CBC5E8E0A@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/16/26 11:34, Rong Tao wrote:
> From: Rong Tao <rongtao@cestc.cn>
> 
> Add string concatenation kfuncs, prototype:
> 
>   int bpf_strcat(char *dst, u32 dst__sz, const char *src__ign);
>   int bpf_strncat(char *dst, u32 dst__sz, const char *src__ign, u32 len);

Hi,

while I'm still not 100% sure that we need these since the same can be
achieved with bpf_probe_read_kernel_str, I do see some value in
ergonomics.

I have quite a few comments, though. See below.

> 
> This differs from the glibc library functions strcat and strncat, which,
> for safety reasons, require the size of the target string's memory space
> as a parameter.
> 
> Signed-off-by: Rong Tao <rongtao@cestc.cn>
> ---
>  kernel/bpf/helpers.c | 93 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index c18f1e16edee..e4708a4f3470 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -4195,6 +4195,97 @@ __bpf_kfunc int bpf_strncasestr(const char *s1__ign, const char *s2__ign,
>  	return __bpf_strnstr(s1__ign, s2__ign, len, true);
>  }
>  
> +static int __bpf_strncat(char *dst, u32 dsz, const char *src, u32 sz)
> +{
> +	int dlen, slen, space, copied;
> +	char cs;
> +
> +	if (!copy_from_kernel_nofault_allowed(dst, 1) ||

We're not copying anything from dst, this check is not necessary.

> +	    !copy_from_kernel_nofault_allowed(src, 1)) {

This is checked by strncpy_from_kernel_nofault already, no need for a
duplicate check IMHO.

> +		return -ERANGE;
> +	}
> +
> +	dlen = bpf_strnlen(dst, dsz);

Since dst is not a pointer to unsafe kernel memory, the verifier should
make sure that the memory is acessible. No need for bpf_strlen here, we
can just search for the null byte directly.

> +	if (dlen < 0)
> +		return dlen;
> +	slen = bpf_strnlen(src, sz);

I don't think we need to know the size of src at all here.
strncpy_from_kernel_nofault will handle it.

> +	if (slen < 0)
> +		return slen;
> +
> +	if (dlen >= dsz || sz == 0 || dsz == 0)
> +		return -EINVAL;
> +
> +	space = dsz - dlen;
> +	if (space <= 1 || space < min(slen, sz) + 1)
> +		return -E2BIG;
> +
> +	guard(pagefault)();

strncpy_from_kernel_nofault already protects from pagefaults.

> +
> +	copied = strncpy_from_kernel_nofault(dst + dlen, src,
> +				      min(space, sz + 1));

Sashiko made some good points about the `sz + 1` here. Could we just use
`sz` and add the null terminator manually afterwards?

> +	if (copied < 0)
> +		return copied;
> +	else if (copied == 0 || copied == 1)
> +		return dlen;
> +
> +	/* The copied character count includes '\0'. */
> +	copied--;
> +
> +	if (copied < sz) {
> +		__get_kernel_nofault(&cs, src + copied, char, err_out);
> +		if (cs != '\0' && sz > copied)

`sz > copied` is trivially true here since we're in the `copied < sz`
branch.

> +			return -E2BIG;

I don't think this is correct behavior. If this is called via
bpf_strncat, then the last copied byte of src may not be '\0' but we
don't want to return -E2BIG.

In fact, I don't think we need the explicit bounding of bpf_strcat to
XATTR_SIZE_MAX (as we do with other string kfuncs) because we are
implicitly bounded by the size of dst.

Viktor

> +	}
> +
> +	return dlen + copied;
> +err_out:
> +	return -EFAULT;
> +}
> +
> +/**
> + * bpf_strcat - Append non-null bytes from a source string, and null-terminate
> + *              the result
> + * @dst: Destination string.
> + * @dst__sz: Maximum bytes of @dst__ign, includes the trailing NUL.
> + * @src__ign: Source string.
> + *
> + * Return:
> + * * >=0      - Length of the concatenated string.
> + *
> + * * %-EINVAL - String @dst__ign is invalid.
> + * * %-EFAULT - Cannot read or write one of the strings.
> + * * %-E2BIG  - String @src__ign is too large or the remaining space in
> + *              @dst__ign is too small.
> + * * %-ERANGE - One of the strings is outside of kernel address space
> + */
> +__bpf_kfunc int bpf_strcat(char *dst, u32 dst__sz, const char *src__ign)
> +{
> +	return __bpf_strncat(dst, dst__sz, src__ign, XATTR_SIZE_MAX);
> +}
> +
> +/**
> + * bpf_strncat - Append non-null bytes from a source string, and null-terminate
> + *               the result
> + * @dst: Destination string.
> + * @dst__sz: Maximum bytes of @dst__ign, includes the trailing NUL.
> + * @src__ign: Source string.
> + * @len: the maximum number of characters to concatenate
> + *
> + * Return:
> + * * >=0      - Length of the concatenated string.
> + *
> + * * %-EINVAL - String @dst__ign is invalid.
> + * * %-EFAULT - Cannot read or write one of the strings.
> + * * %-E2BIG  - String @src__ign is too large or the remaining space in
> + *              @dst__ign is too small.
> + * * %-ERANGE - One of the strings is outside of kernel address space
> + */
> +__bpf_kfunc int bpf_strncat(char *dst, u32 dst__sz, const char *src__ign,
> +			    u32 len)
> +{
> +	return __bpf_strncat(dst, dst__sz, src__ign, len);
> +}
> +
>  #ifdef CONFIG_KEYS
>  /**
>   * bpf_lookup_user_key - lookup a key by its serial
> @@ -4958,6 +5049,8 @@ BTF_ID_FLAGS(func, bpf_strstr);
>  BTF_ID_FLAGS(func, bpf_strcasestr);
>  BTF_ID_FLAGS(func, bpf_strnstr);
>  BTF_ID_FLAGS(func, bpf_strncasestr);
> +BTF_ID_FLAGS(func, bpf_strcat);
> +BTF_ID_FLAGS(func, bpf_strncat);
>  #if defined(CONFIG_BPF_LSM) && defined(CONFIG_CGROUPS)
>  BTF_ID_FLAGS(func, bpf_cgroup_read_xattr, KF_RCU)
>  #endif

