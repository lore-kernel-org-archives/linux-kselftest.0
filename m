Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8623236A03F
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 10:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211785; cv=none; b=oEx9Abl7wkQuYkeYe4fIkFtwauijv2EV3DE8IK+R57eHpr3yknPGC3YFKa1ZeRXHMQ8hDYP7vCBi/tv0JZQOP+GxJNmV7vPI/rL2qTn5a6AuiMjMgZ7oZq2LZxbNXYOm+FhamADcooHE7gQs1To1pldOZEnpbHW04Wn49kwyCIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211785; c=relaxed/simple;
	bh=3lQBs4ulGXX8bGcZi3QX1TqUr5YFr0oPGSGI4Gwfknk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fj1KQaA3YlkS/7ge2HrvIFSCc/NO+BgQl/1napk3k8YpMY31t9kFJ8T5+A0YHohYhx0NFCxZK9QJx0dNUAGu326U6GFRQaUkuOSJWdwfrruXvZJzGz55KI1qebIl+UfB2HS2AGdZ0KDqVwMfyRvVCgbW5Vivnzvv0QXIMGuTfEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1BK2ZiU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1BK2ZiU"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a041eae5so931475e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 03:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775211780; x=1775816580; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5dZnPo99Ahf3Imv37Sc8IChQ262fqrmJ68c0dD4ENA=;
        b=k1BK2ZiUJ5FZaZBea2O274a0fL6h3XPF43GBmJBDghcntv4IdLJGdfqx1TuY9xm7yT
         X7eeMOsc8/o6E6uwG+uxnmcz9z1WHk0Q6lgxH4IEK9DO34UXV4tC7dG+8ZewfkZyCm/p
         hwUbzdX0Pn7/U9HSI3a94g/+bRps5K9L9tqGNowpGw6AlMc78a8zEHRNr27Kg3znHZgb
         0dPYwQISK8YjvO94MmhrjRwVRkVpn94JhRP543Dx0NP2O68Ctj1o7scrqLwD0AxrPccr
         VOl4hre1wFqWs6Vbd9lz6F8cuhVS61w7iQ/w4qmrIqUHmwQgHKOzDVbthxidsh14hAd9
         VUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775211780; x=1775816580;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5dZnPo99Ahf3Imv37Sc8IChQ262fqrmJ68c0dD4ENA=;
        b=mset37S2Ni1O4MGZr2wqzAhFcrT+Fp7wwDWBwygZafmcy6LXiLsaqh3xcxixsb+zdF
         qOIzElc1RKgEfB3o6qut0tcqJOrvs8MVv1B/W5+i90Wv4NKH/xQr4iV6OaZfctROk0Y6
         J1e1oQ1F9VY7MXnaZcmdFN+Achub/szqsbw1EPD0mRuxzhVvrB7jI0k5xaNLEXWKA+HT
         P+EnLMVmy5Tg4ZVXGy+HhFKPQ/W0N+IkG8B6O91YoREmU+qiXZDe2Mv/6uH+LDuZ6GQH
         t26yIPBec7Rd9OHvXl+i8XQSKLMnslZJXl5CeDKzRLXLxrPSDdfecjwGRnvzLXgunhxO
         /1jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCMTs0Qsq9JtHsf1GetAcAOOtflf9PmrbgPibIRC/c7t1mdyIVkM9XREvwv9A/uhhj001xTNAsR9KspqNNqTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYSLHLYFc82hlk7pbLExxqS0gMSoqolR0bD1ein27YlqptH2te
	Xbz3WuXF1Ha1ZRw/FltD6PfmoOparhENhCv1qLKU3qcYM4+4K+30heMe
X-Gm-Gg: ATEYQzzmZJlRutcriOEr0n6xic1Nes0iC+NzOn5Y5j+HoTvPSiOoNBKatK5NGHe7KAI
	Ewo7PC/HwuTpdibStkaFmDGCZwwN3fKXjacHlFPYp1udCmw/c70TlYuk1yYQ1dc/Nrwhae1Ka0Z
	51svSOoz8liLakGQyKrYdjwQoBFuRwsS+GGhZ5nOuy2hakozfAZbDztD5ppD04oOUTiLXDc+CqH
	lxhQUttxlEe3AK/1lsKK0Xdkj+ydzFiwhpDZYKqUmlmFFivtRKzL3koJfiau2wQI5DBL54TDLQQ
	tQVgm9D2ZlxJGRryyU/PBKqD2A05C218Ws8NbhyIxRLpssh6ZqywhfM956FCh14fjEH+vVS8vFX
	rowMT7L+DJHDWhxKwXTELZqmbi+blvRHFbsJ+Qrqvk/KSi/SOXrzrRNRvefGW1WCw5TdgvZjsxp
	XnjK6dwZRVJM1c/aCJ0+N5cxxRRDsEv9FJfRL+LsM2rguildyUgI8CqyfILl5vkrGboaKe8Lj1n
	WuGlKHsdIC+x10mKWp5J8XPNT7xBCkHmVegtukRJi4pLwJlqh2uYq/Y167d5QuTj4Sy4BNtUtfd
	sP0UXL/ycaM6Wo09urRDjhvcQLq8fVZndxYA9jBrZC8=
X-Received: by 2002:a05:600c:37cf:b0:485:3fe6:21f5 with SMTP id 5b1f17b1804b1-4889974678emr39768445e9.10.1775211779694;
        Fri, 03 Apr 2026 03:22:59 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e00e1e89335f46e29e8.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:e1e8:9335:f46e:29e8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48897fdd2cesm20956425e9.4.2026.04.03.03.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 03:22:59 -0700 (PDT)
Date: Fri, 3 Apr 2026 12:22:57 +0200
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Alexis =?iso-8859-1?Q?Lothor=E9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
	ebpf@linuxfoundation.org,
	Bastien Curutchet <bastien.curutchet@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] selftests/bpf: remove unused toggle in tc_tunnel
Message-ID: <ac-VAQEOh7dAUHl8@mail.gmail.com>
References: <20260403-tc_tunnel_cleanup-v1-1-4f1bb113d3ab@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260403-tc_tunnel_cleanup-v1-1-4f1bb113d3ab@bootlin.com>

On Fri, Apr 03, 2026 at 09:52:06AM +0200, Alexis Lothoré (eBPF Foundation) wrote:
> tc_tunnel test is based on a send_and_test_data function which takes a
> subtest configuration, and a boolean indicating whether the connection
> is supposed to fail or not. This boolean is systematically passed to
> true, and is a remnant from the first (not integrated) attempts to
> convert tc_tunnel to test_progs: those versions validated for
> example that a connection properly fails when only one side of the
> connection has tunneling enabled. This specific testing has not been
> integrated because it involved large timeouts which increased quite a
> lot the test duration, for little added value.
> 
> Remove the unused boolean from send_and_test_data to simplify the
> generic part of subtests.
> 
> Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>

For reference, the discussion on the non-integrated version was at
https://lore.kernel.org/all/DDOOS5LR0GZH.ITEM5495FPOX@bootlin.com/.
Seems like a good bit of cleanup :)

Acked-by: Paul Chaignon <paul.chaignon@gmail.com>

> ---
>  tools/testing/selftests/bpf/prog_tests/test_tc_tunnel.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/test_tc_tunnel.c b/tools/testing/selftests/bpf/prog_tests/test_tc_tunnel.c
> index 23b5c522ea9f..1aa7c9463980 100644
> --- a/tools/testing/selftests/bpf/prog_tests/test_tc_tunnel.c
> +++ b/tools/testing/selftests/bpf/prog_tests/test_tc_tunnel.c
> @@ -206,18 +206,13 @@ static void disconnect_client_from_server(struct subtest_cfg *cfg,
>  	free(conn);
>  }
>  
> -static int send_and_test_data(struct subtest_cfg *cfg, bool must_succeed)
> +static int send_and_test_data(struct subtest_cfg *cfg)
>  {
>  	struct connection *conn;
>  	int err, res = -1;
>  
>  	conn = connect_client_to_server(cfg);
> -	if (!must_succeed && !ASSERT_ERR_PTR(conn, "connection that must fail"))
> -		goto end;
> -	else if (!must_succeed)
> -		return 0;
> -
> -	if (!ASSERT_OK_PTR(conn, "connection that must succeed"))
> +	if (!ASSERT_OK_PTR(conn, "connect to server"))
>  		return -1;
>  
>  	err = send(conn->client_fd, tx_buffer, DEFAULT_TEST_DATA_SIZE, 0);
> @@ -391,7 +386,7 @@ static void run_test(struct subtest_cfg *cfg)
>  		goto fail;
>  
>  	/* Basic communication must work */
> -	if (!ASSERT_OK(send_and_test_data(cfg, true), "connect without any encap"))
> +	if (!ASSERT_OK(send_and_test_data(cfg), "connect without any encap"))
>  		goto fail;
>  
>  	/* Attach encapsulation program to client */
> @@ -403,7 +398,7 @@ static void run_test(struct subtest_cfg *cfg)
>  		if (!ASSERT_OK(configure_kernel_decapsulation(cfg),
>  					"configure kernel decapsulation"))
>  			goto fail;
> -		if (!ASSERT_OK(send_and_test_data(cfg, true),
> +		if (!ASSERT_OK(send_and_test_data(cfg),
>  			       "connect with encap prog and kern decap"))
>  			goto fail;
>  	}
> @@ -411,7 +406,7 @@ static void run_test(struct subtest_cfg *cfg)
>  	/* Replace kernel decapsulation with BPF decapsulation, test must pass */
>  	if (!ASSERT_OK(configure_ebpf_decapsulation(cfg), "configure ebpf decapsulation"))
>  		goto fail;
> -	ASSERT_OK(send_and_test_data(cfg, true), "connect with encap and decap progs");
> +	ASSERT_OK(send_and_test_data(cfg), "connect with encap and decap progs");
>  
>  fail:
>  	close_netns(nstoken);
> 
> ---
> base-commit: 9ebb4fa90266705741534924eac62d6f03895fea
> change-id: 20260403-tc_tunnel_cleanup-bf03af4f8c7c
> 
> Best regards,
> --  
> Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
> 
> 
