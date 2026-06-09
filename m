Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D4D416CE6
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781012160; cv=none; b=XWD5xydiZyM7+DBwJlFN3KI6xNMEuuBxiMsiHV1KAdZ8JK1lrxmbVS55GqdhDx1vp2FiR9izcjPmWUrR7Tvzy6FpNSWoo3PrgaJLX15mg/gyyKwF6kqsL2u3fxcltM4mMDQU+2JfVLU23kU5+wPBOcxvNNyAWRohon243HMdNtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781012160; c=relaxed/simple;
	bh=dDFXS/M8qoO9X2CAJVgy9jRXH0Uni0JbDwNp8k+FXqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ri7p5bW/qEgA4WCIKdagItJ+1pdY1G9pBW/U34SnaZeSxtvSMZhScFmYMKyvcRMeoCvk1qJdEKLEZliVUEAf+My3kFZ/1drVDeUAZ4k5QLv+Zx+Q9X851kARWmp+2POos8P9px+hUqWcPwMemHuUzrDv08C1gQYfGGCHUqEeFiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEfTko0Z; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEfTko0Z"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so10046835a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 06:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781012156; x=1781616956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VejtetX9fcaWAyJoRO4LBHFSq0jXx/xM3nEaIQCjeqg=;
        b=gEfTko0ZHHfwq8irjRZT5Xqicum9Jjmp63OwRQXmmoDUBOaVcaNVGu3ZnfOybDTk1j
         U2xscZNE32dysX47yEJUotKc3RygMqqEd8r6agcEOb5KaXEk/AzpKmQy+X4CtSXGH83Z
         kfSrTrbJK7d9S0R+KBpFrONUO0z8DJqI+AGSi/e2SXRjgeOLOUHXsUiarLzFOY3241Ih
         ohW2gR/3E90NlM/I10fakRnXZexDV0wvE6ZQ98QQ6zFDlENEsVVBH4ObRgJskeh0m7Tr
         rBh4rd2LeO59AR+jGzXPQwdvp+lv/5VkO/MAx6Auj20ERYnSgvBKoPIyIXV9Jeiqj15/
         3hDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012156; x=1781616956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VejtetX9fcaWAyJoRO4LBHFSq0jXx/xM3nEaIQCjeqg=;
        b=HCbk30WcleZASD/qXd9rHHjFaegNYovyl6vK6kdKObolGknN1rq+chdhywsQ5UhH4d
         KrUSWDDqRt5DXksUKmnLIwZCliRtyOeWUQdRz4jDNRNtKGGYsrg/8MazmfqUjlSmOm3V
         1r3dMc5YLzYUS+uKvaMckUSBwT9NHIsD6xQvBLnieOgp39Nc3+SJ7bkA4dnhfKLyvID5
         daNbiZjoQsa2+9efyVobWjdI+xcm+orwi/fJcVmQ6jKZ1/lqq6Ogp+xQpNv5TgQtL3P5
         e2/1g8GQ4I7pZ2YSXrXLQWpZXuK+iD/aQ67rcuRsdFTjzyY3SegURgKtXfRfxDcrb4tD
         4yaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+BDmABdQK2Op66dUCYZJLqbjRKo6BINO5u0tKhglkJ8xGsMORYVdYC1qwQyv1MN0jcw3LmaRFEoIj9lfIXWAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuWM2webJJ0BAJPWzJpC+q5s5uxaXiS3aGnxQHAGS+c1v35ykn
	wRW2kedAxaYuUTxQ5fAxR7tU60OF7g1d7bKIXqEoXJOz92qXQfO0dLaS
X-Gm-Gg: Acq92OEbbCaXrCdRPDjAZ13+hnV6zAaFhqlZ1LUgA5bXhaFeh1cnNbmcQw2r0vxx/aw
	eI7fBwrC1ka+PEuw0JsipBbNdlGaTG8I2yJdRnJTxXgLoXNyfxRJoe7bqgOAxiN6zHmON5gUZ8w
	RPQBI8MJlsXI9/Ov8o8JElReES6WctyINVJx88km1AZyWqXdN9wcmTpE7XD218HMov1FrSROwja
	ly2M7O8xffasQFBbFOAWpqRsFUd3n5caEFi8KNr04Es1odUrTxKhsZUanr5aJcznmuOcWom3M3o
	ebKazl36wfb05cuVaYCP0gzm7as1SFM24pOxfRxtr8PRqk2hRgpdZC3Yecy3/1KxjnBBat0n8iY
	dd4UDkMGddrP0cqF1KJE0t9+IVSXSGfEaOe5urrnD3zss8mCtQPVDPgMlqkn0mz/TViun0CnCqy
	LvOIO0Wfodo3FR+mg808UWI4BiPIG9ppBziV/Fa7Zb5oGhhNmTykKyH+QhQmQoboX6JDGaC+FeF
	xVxq5Efs+Wz+PPaqS9UyA==
X-Received: by 2002:a05:6402:1d55:b0:680:b3ed:c5b with SMTP id 4fb4d7f45d1cf-692386354fbmr1432883a12.14.1781012155436;
        Tue, 09 Jun 2026 06:35:55 -0700 (PDT)
Received: from ?IPV6:2a02:8109:a307:d900:9c30:fc5f:5bdd:2e3f? ([2a02:8109:a307:d900:9c30:fc5f:5bdd:2e3f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65027662sm8832540a12.11.2026.06.09.06.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:35:55 -0700 (PDT)
Message-ID: <2ec75142-04b6-4d03-9aad-7441b6350f2b@gmail.com>
Date: Tue, 9 Jun 2026 14:35:54 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf] libbpf: Skip bpf_object__probe_loading() when BPF
 token is in use
To: chenyuan_fl@163.com, andrii.nakryiko@gmail.com
Cc: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org,
 chenyuan@kylinos.cn, daniel@iogearbox.net, eddyz87@gmail.com,
 linux-kselftest@vger.kernel.org, shuah@kernel.org
References: <CAEf4BzaY3LLmMbSm1ritXwTvqGYi+KSWSkqMYJd62D7opu4ZnQ@mail.gmail.com>
 <20260609131100.3097225-1-chenyuan_fl@163.com>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260609131100.3097225-1-chenyuan_fl@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/9/26 2:11 PM, chenyuan_fl@163.com wrote:
> From: Yuan Chen <chenyuan@kylinos.cn>
> 
> bpf_object__probe_loading() tries to load trivial SOCKET_FILTER and
> TRACEPOINT programs to verify the BPF environment works.  When a
> BPF token is in use with restricted program type permissions, these
> probe loads may fail because the token does not allow the specific
> program types, even though BPF loading is perfectly functional.
> 
> Fix by skipping the probe when a token FD is present: BPF token
> creation itself proves the kernel has a working BPF subsystem.
> Real BPF issues will be caught during actual program and map loading.
> 
> Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>
> ---

Please resend your patch applying these:
 - don't send as a response to old thread
 - this is v3
 - target bpf-next
 - add fixes tag
 - include any Acked-bys

>  tools/lib/bpf/libbpf.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index ab2071fdd3e8..7e21c5eb9533 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -5167,12 +5167,8 @@ bpf_object__probe_loading(struct bpf_object *obj)
>  		BPF_EXIT_INSN(),
>  	};
>  	int ret, insn_cnt = ARRAY_SIZE(insns);
> -	LIBBPF_OPTS(bpf_prog_load_opts, opts,
> -		.token_fd = obj->token_fd,
> -		.prog_flags = obj->token_fd ? BPF_F_TOKEN_FD : 0,
> -	);
>  
> -	if (obj->gen_loader)
> +	if (obj->gen_loader || obj->token_fd)
>  		return 0;
>  
>  	ret = bump_rlimit_memlock();
> @@ -5181,9 +5177,9 @@ bpf_object__probe_loading(struct bpf_object *obj)
>  			errstr(ret));
>  
>  	/* make sure basic loading works */
> -	ret = bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, NULL, "GPL", insns, insn_cnt, &opts);
> +	ret = bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, NULL, "GPL", insns, insn_cnt, NULL);
>  	if (ret < 0)
> -		ret = bpf_prog_load(BPF_PROG_TYPE_TRACEPOINT, NULL, "GPL", insns, insn_cnt, &opts);
> +		ret = bpf_prog_load(BPF_PROG_TYPE_TRACEPOINT, NULL, "GPL", insns, insn_cnt, NULL);
>  	if (ret < 0) {
>  		ret = errno;
>  		pr_warn("Error in %s(): %s. Couldn't load trivial BPF program. Make sure your kernel supports BPF (CONFIG_BPF_SYSCALL=y) and/or that RLIMIT_MEMLOCK is set to big enough value.\n",

