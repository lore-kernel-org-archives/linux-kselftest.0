Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794250432;
	b=l8dEzsbQGMxcI+t8D71k9PQYtsUIJAqv/OFDBEsYa61q5RN2/DjpqtexfpoSEFJZWhyH
	 /pkXfb5IoE23Xidfj8glxqnaJKk1deyrnlp5JbKOehureM/09NR9VuEVpSTeXNAPCM5Z7
	 aBJlxRR25BDCO+cM20kcdWzmHC6ievqc+5ykw6MK0eQrby9mi31SEl/Av6YXjUMt5N/XO
	 joa6fbLQPak5pNReVN4L9NUD+iehFtoonyzF95UI1BOVd+fSF6bF69zGUw8s+ND+sNtB3
	 9SLUemfPZjEl37JuJo7eOr4swEe8xFDJJNkqfpB43mHKOKJNd0FCxCcjfcnDlVqNaNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=80cmEy5EJnrhtr5kg0iasxnfCalwVR0GuYGpWzI/iqI=;
	b=E+1mKFKBCikxpGUBbIEtOGDNL0JRUY2Q+QzQt88TR6y0eETEbgWs+WJK9bP8fE1NeFgP
	 t6uoZ/O6SS1h1h19tG/ggplh6gKipeu7avmRvUf3tf9kPjaTeKtFpgKNsDTaR/VlzOLIJ
	 TeKEJt1/UnN8rFlPqIrrSjUSb0SeLUivVzQU8bByUpWAImmjhi8Blgq97UOgZHMN+RBPB
	 /nLQlhHNMgce+RQMyQjXlXK3Rc23yE29bpMXZt7lFpthgTlXeRtnjdDfisEK9sy8SEKsf
	 5y+B4aD/pdAIG+TwRqAs6prgvJuG63CG/Tm3uRYH/WDCSqfFdP6vH/KQfBL0gVq6W/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yRCYdPNS;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF107606A32A
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 18:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF107606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yRCYdPNS
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36f6295304dso1557302eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 10:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794250431; x=1794855231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80cmEy5EJnrhtr5kg0iasxnfCalwVR0GuYGpWzI/iqI=;
        b=yRCYdPNS+IvYOA7gTO54RmPLdE/OaAVWHZo5ZJ0g4dpEQ+Tu1Ancuv56seUgIci3yX
         NnKYJcySnueyMpgY9OQhAPfqg2KTGKr9rp4O6EXDDi0zcowdymDTwn35hVWivgOauUN/
         rMI3eXManK5wV+CaS9Kx1g4T0e/xObB2htmJJT1iDJXq/VcZ5y+Az0Wunq2/e+tnNrVr
         QUCBC+VzQFusc21SK3+8T+5hLo3l1IY2zPOsVwvs1zka4f3f7gQapMFpsIGJuIlgBzaH
         Flhk41E7aQv0M85qV/t7ZsWmcNiVWslGJjK6RYUdt7jG2bituqChbXq12LQJo1wzqiu4
         +IVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794250431; x=1794855231;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80cmEy5EJnrhtr5kg0iasxnfCalwVR0GuYGpWzI/iqI=;
        b=F83/eZcgT1r5h/BMr1rGRbDVzuq/WtaPWPmfrB4TpuEfQXA4be35o/Q6XA9b4qSQ2s
         OUEaqC7ImvZpdLf/A+GmvQcy9Laj3e4JZqd97jQX2SUqxSsEnnY8UIqmSpHL7UvZWCWi
         3tXy2Js0JcAguw3u05uJ3RP0IjPVnaBRA4Am6OO0UQEplyPnohdToEck3Z6EE8hBo3RP
         aPR8G8SmlMhsF5NhWMXyfiWcZRFYf3bXAEI8eA2i4Mk+ajgZ24Fp6bQTfthNUgP9QBf4
         u8KKXZDzx+IQhSCsJoh2mDMLLkH0y9hyK5OFd5wN1ZzoMQ0RCgTeyvBQIllEULMjsxKO
         tVqg==
X-Forwarded-Encrypted: i=1; AL+hErEdlIvVypDkSRMg+n0nCCHrDCGUxID59TKUnjFEtWwADsMMvzC4locBWI5A1zbpoTEPmgax+KWCQ7biDdFpfOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QSZyUdvDnLZjat2xFgjcd8SYEceErcOmS1EC3CyxlrRyiXhPo
	bPcngkLBxpSRcZl79jDOfhGxvwaobnj+SdIvl/qyigkkM0ZD4FD3kb7fUpTEQaraW9E=
X-Gm-Gg: AYBFou08IZfhLluAguQYbQTLx5Dl5FyESknl4DTlM2XTOq5lEJpgD8vsP/KKU3FkQDX
	zmmqh3C0OibosgEIUNLG1fg+kdMSYqUq89scIOGDv5JCzUO3VsVZsXB/M8uGuokWI65EoZk12Lq
	6dkpFlFmS244TjDoAelviCq+cq3aD6rnhd6ReaMfVGjxG5BqREp39bT7pFqyFFd2hMHK2psXWQ8
	x8pXSn6LJ9TZ6J1v5YSGlSf07ZynQnS1fg2/1CwXyzNO0IQpx1FzNcZJhnmAL7mY36iEFa0R9od
	pbAEJJBqJ0wk5UMoQubEt3UWiPaQ07uGWhkV1Kzm3pV6175TC7ZTxHE42foOoWVxFW1cr0RUQjl
	/6mt8RQl3sM3eCXSPI9B+vkZv+qkMnKYRuV0dR2vbJM+6uTPL/zZha38NcgcGd+Yw8SSnBgdcsT
	ZBVXzqOiKfkmnS1WzqMUfuJVGOd+yYuoh/uw1iLClJJaOiXRU3Q2Ny65xHxzQrpN7Wv/OjDWmIF
	Jsdttz9htZ0hC1u470wFWS+eOk+Bix/iVnNlyShaqKAt8INplg+/4Fzyg3v4URbv4BtJfSFzB7G
	VkqMrbWKeC2lhxQU0OtA4R80wANWmUcRtGrpSbLIwzcfFjCmvNhUst4D20Z7QPV7NTGa/stQZyh
	TstNJLch38eE=
X-Received: by 2002:a05:7300:7f21:b0:35d:eafd:5737 with SMTP id 5a478bee46e88-3751f55f6f7mr163325eec.22.1794250430709;
        Mon, 09 Nov 2026 10:53:50 -0800 (PST)
Received: from ?IPV6:2620:10d:c096:325:b155:8c68:f317:3997? ([2620:10d:c093:600::1:93d4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe07dsm215259eec.20.2026.11.09.10.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 10:53:50 -0800 (PST)
Message-ID: <85e164aa-7aa7-40ed-bfaf-883b8f51f7b2@gmail.com>
Date: Mon, 9 Nov 2026 18:53:38 +0000
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
Subject: Re: [PATCH bpf 1/2] bpf: Report lost RHASH batch traversal keys as
 EAGAIN
To: Tianyi Chen <hi@tychen.cc>, bpf@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, yatsenko@meta.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1794056839.git.hi@tychen.cc>
 <4c32437eee7649fbd822108278a3f582bb795329.1794056839.git.hi@tychen.cc>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <4c32437eee7649fbd822108278a3f582bb795329.1794056839.git.hi@tychen.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/7/26 1:11 PM, Tianyi Chen wrote:
> If a key is deleted after a batch copies it, rhashtable_next_key()
> returns ERR_PTR(-ENOENT). The batch code treats the missing next cursor
> as end-of-iteration and returns -ENOENT with a partial batch, so callers
> can silently stop before reading keys that are still present.
> 
> Translate a lost traversal key to -EAGAIN, as for a missing input cursor,
> and preserve other iterator errors. Still copy the collected entries and
> update the count, including for lookup-and-delete batches.
> 
> Fixes: 818e00848227 ("bpf: Implement iteration ops for resizable hashtab")
> Link: https://github.com/kernel-patches/bpf/pull/14700#issuecomment-6641291019
> Assisted-by: LLM
> Signed-off-by: Tianyi Chen <hi@tychen.cc>
> ---
Looks correct: transform -ENOENT returned from rhashtable_next_key() to
-EAGAIN indicating loss of cursor.
rhashtable_next_key() returns NULL when iteration is exhausted, that
is transformed to -ENOENT in if (!has_next_cursor)

Acked-by: Mykyta Yatsenko <yatsenko@meta.com>

>  kernel/bpf/hashtab.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
> index 6e2115477cb9..346a2afb4ad3 100644
> --- a/kernel/bpf/hashtab.c
> +++ b/kernel/bpf/hashtab.c
> @@ -3556,14 +3556,15 @@ static int __rhtab_map_lookup_and_delete_batch(struct bpf_map *map,
>  
>  	rcu_read_unlock();
>  
> -	if (total == 0) {
> +	if (IS_ERR(elem)) {
> +		ret = PTR_ERR(elem);
> +		if (ret == -ENOENT)
> +			ret = -EAGAIN;
> +	} else if (!has_next_cursor) {
>  		ret = -ENOENT;
> -		goto free;
>  	}
> -
> -	/* No more elements after this batch. */
> -	if (!has_next_cursor)
> -		ret = -ENOENT;
> +	if (!total)
> +		goto free;
>  
>  	if (copy_to_user(ukeys, keys, (size_t)total * key_size) ||
>  	    copy_to_user(uvalues, values, (size_t)total * value_size) ||

