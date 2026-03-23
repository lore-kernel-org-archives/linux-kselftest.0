Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398BA387566
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259139; cv=none; b=K+XjNwszVRpr55QeHRxh35hcYfKRcizoZKVElM1535ovsu6q3vEEseiDj0kxnunT7MQF9m++t7Lews82EJ/v6jZHrolq5RFWVu+3rCfCqDyXP5xHuMBcrYLUZQ8G0nTm6DqTH1ldmSj5b35a64lFoU3ZW+n1zUgQ5VarUjeH3Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259139; c=relaxed/simple;
	bh=XYhbbjpDV0ET9lpzrkJgS6mYpcOgfUEU7VTc6kLP4UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0Ll1S9v4t4ZN5fHCiK7t6zulp1mpy1RxYy/IJo0qSHp81bby2hGhJd8BbDqU/zKpD7l714Ec9yJte0JLWsKbRX8I7pwUlcnUtAjFlkDom/duT8bVLbTS+uhkU3n69vQBD63xnPcMzNDqcsAeo+SomWy5Ufo5fGikewn7KtO2wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D0dxsm3A; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jnN4XEa/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D0dxsm3A";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jnN4XEa/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774259136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2LcMB5gIX03eono8rt37+6BTZoTufylHEu17I/eh9tE=;
	b=D0dxsm3AoEaS2UxwI67ytvQFlctdGS/zNr1L+c9FYFBx7B2HCcnmseAsTDNhCLMrS+yyas
	sWewg6N4QJSnRW/Lvb8ZSh9Yfn/ZuVsc81VNitmx4uwJgTW9DUH8A77hs8AhdhGHPoo8/1
	GT6KXEaG9KrkhZhRxx2xrlqw2n6+tsM=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-07DWVg9_NgOj6N_JHlskDw-1; Mon, 23 Mar 2026 05:45:34 -0400
X-MC-Unique: 07DWVg9_NgOj6N_JHlskDw-1
X-Mimecast-MFC-AGG-ID: 07DWVg9_NgOj6N_JHlskDw_1774259133
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-829ad972df6so2557848b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 02:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774259073; x=1774863873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2LcMB5gIX03eono8rt37+6BTZoTufylHEu17I/eh9tE=;
        b=jnN4XEa/YmZZveP6wlU5CqkVv47uZboQ6OYTGQo2VaLeb8VXabDo6ErzIUKpT3TVb1
         5y4tAf2hS7eYvgvr7M2TEB8r7KsgEfC2SuVWq3NT9dPnBzFsSqSS6DPs5apfCnaIzdKA
         VU0Q/n/OO/xnHIQi5VzrcEIVblZrGjzPgWjBK452cVjPilmN4axnih4a/rBbh9H2RGto
         ZvA7hcyJBr+Yu1UmWg/knavHtZ9D0sHzHTQp1IR2F3wVx22FCYmf52BBWrNXQkg73Kgq
         vZzsKMxkGD4TCFKUriqFopLka2QiROj61ZTiWNTTnPZbHFq7u9MSZ2j/Q/OXD/O9mqf8
         UbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259073; x=1774863873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LcMB5gIX03eono8rt37+6BTZoTufylHEu17I/eh9tE=;
        b=nTRWiKCHXRm0fUTPEQEiC7tu1GI03kj3TCdN0Cbx3fxkjN99YJh1GTqj4O8/Vlwrup
         uB0/KpVyGustfFaYpbQXKspiKhUy1E0MOaicQIoBqD0rirNCHATQuZmdznQF3+qDsuh+
         MxSNNUVgd1VSmwVfIZ5QOZ8vp88U+i+Ln1yVq2zGKtvHcnuMX7JnwuKh9xaSFT4XR2rv
         XSv+Fomk69p7oTip0NpfvTKuMIp1TbI0Lwi/hfqjEErabFiosBfA/gr8AaGW2/s+kmS3
         uiiZ6DcbA1CwqG1Z9QrViisxlojouBJTiCxp30vENGXbmJQjlqgZuxzUO0zQci5uAAZ0
         LRVg==
X-Forwarded-Encrypted: i=1; AJvYcCXcIZk4lmwfLDF4wTqF6hFpYD5idbnAnX505DVTTUptnD+2B9Q10ynfWn8KQGEPshrDE7SRUqwg/Xkbp7+s9RU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7oJsGS369nlHaoSZjOoT4xmDEz3zdGW/zxUebveJz3VkTRvOd
	SXlyKB+Lzm7FMOu8alekLqnbEnBB4W/CI6m3Jw2dawrDgzTAWtf2cl4N/SH+gZk8mZWYzZfHcfO
	kDb99tSTONG6MTjyrnJn3ZZE4PrWneB/q/mnA5LXDd4RFeO84lfJjyrpyzg9+yruR6VrLfg==
X-Gm-Gg: ATEYQzw8OgY588ZPZDanybP/fOKlPUIJ8xm5FDmsCaXA+bapRTLIzpwI468IhucXv1v
	6ZaZ4MuBqo4BiJEsVupd8xf3McIG2PB8eepfSh7JJBTsCg3/ARU+ylR0RP8vXpEWuoC3DCLPVYW
	n4XYytMPCShfgf+M4RllYDOP0zEq512YKAWHdKm/n0aHuR3e+iQJePTpWq29ZatQLyl6RJ93UG8
	faid1b546gsTw/POSQx6H9SYOVT6Y24WR4JJl6ejGm2SMoVLWXvTyyKoGKyWMKA7MBsq4b7SfVv
	YAW2LDz1fkCeJHmLuZ5lpxtLqX8uXYMxloxXzA1cpA3tFzOdRPNAebIZNtzmotw3GVIwC/uDHeY
	OaBadv1407xrjdbz2jQ==
X-Received: by 2002:a05:6a00:12e2:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-82a8c2525d6mr10198875b3a.4.1774259073588;
        Mon, 23 Mar 2026 02:44:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:12e2:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-82a8c2525d6mr10198855b3a.4.1774259073192;
        Mon, 23 Mar 2026 02:44:33 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409c681sm10471814b3a.37.2026.03.23.02.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:44:32 -0700 (PDT)
Date: Mon, 23 Mar 2026 17:44:29 +0800
From: Li Wang <liwang@redhat.com>
To: Waiman Long <longman@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tejun Heo <tj@kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>,
	James Houghton <jthoughton@google.com>,
	Sebastian Chlad <sebastianchlad@gmail.com>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>, Li Wang <liwan@redhat.com>
Subject: Re: [PATCH v2 7/7] selftests: memcg: Treat failure for zeroing sock
 in test_memcg_sock as XFAIL
Message-ID: <acELfUqXlKVWFcDT@redhat.com>
References: <20260320204241.1613861-1-longman@redhat.com>
 <20260320204241.1613861-8-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320204241.1613861-8-longman@redhat.com>

On Fri, Mar 20, 2026 at 04:42:41PM -0400, Waiman Long wrote:
> Although there is supposed to be a periodic and asynchronous flush of
> stats every 2 seconds, the actual time lag between succesive runs can
> actually vary quite a bit. In fact, I have seen time lag of up to 10s
> of seconds in some cases.
> 
> At the end of test_memcg_sock, it waits up to 3 seconds for the
> "sock" attribute of memory.stat to go back down to 0. Obviously it
> may occasionally fail especially when the kernel has large page size
> (e.g. 64k). Treat this failure as an expected failure (XFAIL) to
> distinguish it from the other failure cases.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  tools/testing/selftests/cgroup/test_memcontrol.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
> index 5336be5ed2f5..af3e8fe4e50e 100644
> --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> @@ -1486,12 +1486,21 @@ static int test_memcg_sock(const char *root)
>  	 * Poll memory.stat for up to 3 seconds (~FLUSH_TIME plus some
>  	 * scheduling slack) and require that the "sock " counter
>  	 * eventually drops to zero.
> +	 *
> +	 * The actual run-to-run elapse time between consecutive run
> +	 * of asynchronous memcg rstat flush may varies quite a bit.
> +	 * So the 3 seconds wait time may not be enough for the "sock"
> +	 * counter to go down to 0. Treat it as a XFAIL instead of
> +	 * a FAIL.
>  	 */
>  	sock_post = cg_read_key_long_poll(memcg, "memory.stat", "sock ", 0,
>  					 MEMCG_SOCKSTAT_WAIT_RETRIES,
>  					 DEFAULT_WAIT_INTERVAL_US);
> -	if (sock_post)
> +	if (sock_post) {
> +		if (sock_post > 0)
> +			ret = KSFT_XFAIL;

XFAIL means "expected failure" and is intended for known kernel bugs or
unsupported features. A timing issue where the test simply doesn't wait
long enough probably not an expected failure, it's a test that needs a
longer timeout.

I'm wondering can we just enlarge the MEMCG_SOCKSTAT_WAIT_RETRIES value?
e.g. from 30 to 150


-- 
Regards,
Li Wang

