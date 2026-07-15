Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907D33D9DD4
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 08:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105804; cv=none; b=bYBtL1SCkEcr2J82wlx2egOaNv5FUhRNCx5QZktGh1Cjx6o0h4YM//mSa8SSpkdEK7vWJlOx9vSfcY7spwOZfR0YBPh8r/+4+G0HOtjRXhnnQMz7ueC3egos0wqP0Kaw5bjEKAyUKBbgFbwihX0wpoxprYv2zyngZKI+NdQ8ex4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105804; c=relaxed/simple;
	bh=rNLTPjyvxWpHPupg+LMXMi1IbV27isK7nYDnIMBanEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mlxPMeqE2Q8F7pALxn5bqR+Qzv+4//tNe2KQWwH+8yq44WsGwGkiATzfE/nrwFpJCrIDQIbCDylRj2LLnu31mJa/OaR5zAd8ziUxDv+6vwZfufywqUw36J4O5/XGk2o+UE3Yy8+fDCjw5wsgPTwuDAACo86aZLgfRaBPzuhQdMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eZgWiXkX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Iwv+TOwK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eZgWiXkX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Iwv+TOwK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784105801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=US0Y9ou3o61s6p2gZEj7byyGJRCmJqQhGUWd/P1is1Q=;
	b=eZgWiXkX6l9kN1yEGAer809gCFC7mucHsftmczGIE1SPmJUa4BaysOStOaaI8lxK1WfLj3
	tGhRJJC4SI6TGIRMCcxTBTFhFQQxDTqcyd/gt7IdL4qQIrjmv8WXSL5kW8KLbtGZDrzfrB
	0SCSD7FMPCHQ5yprSOYBsltnYJhnNc4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-0NGHRwO-Oya47mZKk0xluA-1; Wed, 15 Jul 2026 04:56:40 -0400
X-MC-Unique: 0NGHRwO-Oya47mZKk0xluA-1
X-Mimecast-MFC-AGG-ID: 0NGHRwO-Oya47mZKk0xluA_1784105799
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-493bd52dae6so34438325e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 01:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784105799; x=1784710599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=US0Y9ou3o61s6p2gZEj7byyGJRCmJqQhGUWd/P1is1Q=;
        b=Iwv+TOwK4cq1nleNGUjvjszX3M1mVOqp+6X+rSbCCqWkBq/EOdX4A5PQ5Y/3pDUmRt
         LtiQAUhjiuyA8RMwl238LVw3UYp68BKDGvOpgJe3UhZ9Ehh35GYctBGd9TPFrRmCrR7s
         nrmnqWYNAtMyG/xtU6fHDEpPSUupDGoLaSPES6fFJWbjwJxT7A8AcwMCFmS+aIvNSLPO
         ru0Ni9rCgcqGVKzT3TotQd49ASMSoQdiA9TP348A3JH1HvPUcOZW9d4l7XvKCTCm/uiq
         FU9iugFvdaQblE44k758n5zwOJ0MRROcKOqFl48RD8HhRqVC6pM+UMy4zayI8j/1dXln
         U68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105799; x=1784710599;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=US0Y9ou3o61s6p2gZEj7byyGJRCmJqQhGUWd/P1is1Q=;
        b=SmSwpDk67X+QtgO2oJsHyEvMW5QleVOfidOR9RynPBa7nrsz5eyxuUvlQQyMpbk6UE
         sFYx8i/nqUoadqrhs3hGJYri70kVCWZiUVcGnaRHi0hc+Krk2wEzECYkaUiSkL5SIJhN
         tho2cH9b00PI4j79mE6xNgOtnlNZ3A+5359uTH+P+fEZF85Jo//0FlUQy6FgVkqWHTn9
         BlWVB9QOIKgbPZYM+YCveKoKG/9FcpuXNxCzsuwqWfGOxge66SvG3+F3ZfsR0p2OeZ07
         A03q1qmVbel2SgJ10Yoba5kQ04HW9cRoRHXIKdhr0+1R1JX0Yqn2yV06vnniaB6vRKOP
         AtTA==
X-Forwarded-Encrypted: i=1; AHgh+Rqp+MbdmfPJNi0G3t+EMivIrMWePL/O82tkGOM0O2h3yvBghBN/6E9owKTlIxuY6NkiTekV77VB46jGeLn9klU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKLf4A+75uXvoqnA2r8S++2Jy+zkMpMwJip+besBTZpodV9TYn
	hnXFw0nFkNpJWwfSkXaBESG8TSnH00lz6rJItlPC8bwihB1cQVGzwqs9K3Kpbq7gdszWTp7IGMs
	g5rAhpuxUYf03crogkIIQ1FXXGEDxu18xK/HaHVBOSiBdvLzwvhoMWmcZWtXllSw5sWLC
X-Gm-Gg: AfdE7cnAF/rqi/9ecLFRMVldcecAPN5ZMXyZJ/eIP4mZQqmRgh+ZyXfxyTE2v+7sP4V
	p2NJEIic0hD+oB9gtFJfHWmZTsNm7SFoHWXaz5S5cWIl20LP5RsDytv6/rnxHggTtR4zMCOEldd
	1dskTwKIxhtIgSKUJpABj5wrllReTdsUyEgk+LYqUpz4r1uSj9UeYww/1SJACU6bQ3EcZ9+sZGb
	66T+2SLvPcp03nAEyxGcC0mzkTY+uuNrTuojICooF/5ZTKOvOINZj2zH6qvgbG6y0nMfnXrs63U
	DIALplkbH8eyYKRVfcgme3CjX9cBPkL6eSi9kzfWkTDo2xmHMhNGoSDV4h//HIc4bBWYn0CRhX4
	aHn/G7qptv2gcwtcXSXGembj0Kj07kaeYJ2KK/ZDNI9wycg==
X-Received: by 2002:a05:600c:3e19:b0:493:de89:61b with SMTP id 5b1f17b1804b1-4953c28b12fmr21150185e9.26.1784105799020;
        Wed, 15 Jul 2026 01:56:39 -0700 (PDT)
X-Received: by 2002:a05:600c:3e19:b0:493:de89:61b with SMTP id 5b1f17b1804b1-4953c28b12fmr21149805e9.26.1784105798598;
        Wed, 15 Jul 2026 01:56:38 -0700 (PDT)
Received: from [192.168.0.135] (185-219-167-205-static.vivo.cz. [185.219.167.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49510c8e220sm119055945e9.15.2026.07.15.01.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 01:56:37 -0700 (PDT)
Message-ID: <58e45629-e959-4995-afc8-900b5c5d691c@redhat.com>
Date: Wed, 15 Jul 2026 10:56:36 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 1/2] bpf: add bpf_strcat,bpf_strncat kfunc
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
References: <cover.1784078494.git.rtoax@foxmail.com>
 <tencent_9EC04DC824CBF5124305E73564341511C405@qq.com>
From: Viktor Malik <vmalik@redhat.com>
Content-Language: en-US
In-Reply-To: <tencent_9EC04DC824CBF5124305E73564341511C405@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/15/26 03:27, Rong Tao wrote:
> From: Rong Tao <rongtao@cestc.cn>
> 
> Add string concatenation kfuncs, prototype:
> 
>   int bpf_strcat(char *dst__ign, u32 dst__sz, const char *src__ign);
>   int bpf_strncat(char *dst__ign, u32 dst__sz, const char *src__ign, u32 len);
> 
> This differs from the glibc library functions strcat and strncat, which,
> for safety reasons, require the size of the target string's memory space
> as a parameter.
> 
> Signed-off-by: Rong Tao <rongtao@cestc.cn>
> ---
>  kernel/bpf/helpers.c | 92 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index c18f1e16edee..401f94efd687 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -4195,6 +4195,96 @@ __bpf_kfunc int bpf_strncasestr(const char *s1__ign, const char *s2__ign,
>  	return __bpf_strnstr(s1__ign, s2__ign, len, true);
>  }
>  
> +static int __bpf_strncat(char *dst, u32 dsz, const char *src, u32 sz)
> +{
> +	int dlen, slen, space, copied;
> +	char cs = '?';
> +
> +	if (!copy_from_kernel_nofault_allowed(dst, 1) ||
> +	    !copy_from_kernel_nofault_allowed(src, 1)) {
> +		return -ERANGE;
> +	}
> +
> +	dlen = bpf_strnlen(dst, dsz);
> +	if (dlen < 0)
> +		return dlen;
> +	slen = bpf_strnlen(src, sz);
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
> +	for (copied = 0; copied < space - 1 && copied < slen; copied++) {
> +		__get_kernel_nofault(&cs, src, char, err_out);
> +		if (cs == '\0')
> +			break;
> +
> +		__put_kernel_nofault(dst + dlen + copied, &cs, char, err_out);

I don't think that we need __put_kernel_nofault() here. My understanding
is that since we don't use the `__ign` suffix for the destination
string, the verifier should make sure that `dst` points to a valid
memory with sufficient capacity (thanks to the `dst__sz` arg). We could
use `strncpy_from_kernel_nofault(dst + dlen, src, space)`, which makes
me wonder how would `bpf_strcat` be different from directly using
bpf_probe_read_kernel_str().

Viktor

> +
> +		src++;
> +	}
> +	cs = '\0';
> +	__put_kernel_nofault(dst + dlen + copied, &cs, char, err_out);
> +
> +	__get_kernel_nofault(&cs, src, char, err_out);
> +	if (cs != '\0' && sz > copied)
> +		return -E2BIG;
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
> @@ -4958,6 +5048,8 @@ BTF_ID_FLAGS(func, bpf_strstr);
>  BTF_ID_FLAGS(func, bpf_strcasestr);
>  BTF_ID_FLAGS(func, bpf_strnstr);
>  BTF_ID_FLAGS(func, bpf_strncasestr);
> +BTF_ID_FLAGS(func, bpf_strcat);
> +BTF_ID_FLAGS(func, bpf_strncat);
>  #if defined(CONFIG_BPF_LSM) && defined(CONFIG_CGROUPS)
>  BTF_ID_FLAGS(func, bpf_cgroup_read_xattr, KF_RCU)
>  #endif

