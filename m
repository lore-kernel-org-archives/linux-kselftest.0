Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DD831D375
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 13:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615873; cv=none; b=ltbxBSTh6OLiYrwvMInJF7fa7TQAWyKRfOVXw0h2F05uj8ygLGeexECN+Tv4o4+w10WqRpTa0YMmaorKOzX63d/cD+D5OBDHvrUbwQ9GpxlqZTocTzNiWTA9kiIH+Xj+w256ZQoDICBJCtiBhSeCyg30gkDQImlAbgK68SnBp/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615873; c=relaxed/simple;
	bh=EGERGdCx2kYeS7W9iwSbT/bvqw0eSLVjuKRazBmEJAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qN/sbh9ZoyCVdGr9v+TEYX0oVRxBDe/73Qj/P/QcISc+TwUD7X6G44mOKDUDw5BR7ntnDBwQSIIgsFbzW43R0bobrMJZdxZNOzp3q4iyY0mYGK3pWPlPLmK8FvziO4WjNyAVVTXlLdIUsq/r5r95ETxDcu3Q6WZXTIdRjVsVGIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcS+eXT1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcS+eXT1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-492329c5514so793305e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 06:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781615867; x=1782220667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=85JsgvYD1YLd3UTUsIZxYoHmTb8gB/2tl6mfyWcf1Bg=;
        b=gcS+eXT1DV6Kk1SiY7/E/IqA9dag6Mp38ZE4sRl4baYb2SXdnpMJTHsk/z8fXqLK7Z
         EI5aD0epiICHZNv4RDDf1g2UfWFLrLC/DfiYJ8mPQQ/B8EgN0zyWSQkkH5oLY7jBoByW
         9alOdozBbCr9yb6n8vWnoWKjZNZOlZZEvaaBKv5DKDgxhHzyOT0zlTyCj+5nsXSF/+vz
         A3XP4Qh0RRLDqimUZsgzLSjZ+Ez+5RrLXWl1kw8BzUkSQlVBOuxH3jPz3DX1j4PHPgZ+
         jH20l0y6fPrd1BMqRkTscinXjP1zrKAXoWa1ExUVEJT3aRBpqiJOLZDDXSFbB+5T4jIl
         3D1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781615867; x=1782220667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85JsgvYD1YLd3UTUsIZxYoHmTb8gB/2tl6mfyWcf1Bg=;
        b=M57OB5bCdtE3AV1nkOPWkKL1CCI3/GsMypCGQpgLKt96TcunP7hANh1TbHN/QzM3W6
         LwPKkrvNI4cbRT4mVpdsXQAK5HKYj60xot9VidnMZsM2sDBngRcIYs3rv/JKbHZbvR4c
         VV3En495+1m/bqbAnK/Eo0tDpdM/aY6gRhUyt0KGrxh/N4Zk7h7apHuAZZB1Q0V1OKwi
         xNMuKuHVa/mB5gQ/At53UIfpqI7HdTcaFH1jnI/nsz1e6fXU1rHWZWi3Mf6VDk1CquHJ
         aLrwldc2pB5xmuysA6zJCj6AjYf+xjjGl57O5MQt2yIEH87mMa1HmpKkSlK4z8nNwcps
         lTlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oNo0Gq+iUotoPU4jd9B4IVLdkv4EO01OrVuKMW8XE00PKgSuhIiKB3iPVL6mK4cGJj+8FqBIaHC4HUg63Nio=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqWE4IfLi+vq2BONsLHHjY6v4qr9DLJFv9ZIQPKtwibZceaWxb
	gnGUMsYxIRQTvHcxQd8nUBtitTvRCMP7Vi1K7atsnmWqnByngRJWmKkd
X-Gm-Gg: Acq92OGtvFHdBytyfG/cYoegz7S3zWktJk1jI80ni8AwpOuxSPl+PZA9lbJoxwb4AYJ
	/gbEV2ro7PBdamt7jFkRt00u+OIoCETIKsJcrkfDhjq9IfhxUP7swYAmY/JfQCFprJdk0vRmdQF
	akP9eAa4utUbOGIOIkp4B3JQpaEobk6IZGuHM704mdvqbBlaeMandzI7wZ7qQ/B1+Tt8u10wwTl
	6oAYrUlBagmGaH2X2npQ0RPMIW0RkrYWpkS2xJTTgmO73UavTgDuu1wpNiLaiGcigoMLjCcHHW9
	YQqRUcwgvazyT9bLiBx0xNm0L4frBQzXuVDwXBIT5Avs0c66jmvOfxWartjABY+Xv3t8TjzdOXB
	M17BA4sPi2DGHSkIV6klNiM9+UKCT3QttsR902m67mVCPkS2S+bHMnmCQiZKbvFp0zXQiQALsw0
	2gOvLK6+RegDBXTJM9xOLQ/pIA1au1Uk9k3BSeot6GI1D2Jn8sPF29vH/Xk8QZzPSpXj1hIuF9D
	UGhuEw9mCYPhw3agMQXJVQJqv4AAJKmccoGc8SUiSdVuLinwWq54Uqxr2NstPhI8OHgwEAM1Gli
	x4uOIb+wkgWDneRTkbHOL9EbckTgN7SGXea8o48MbbQ=
X-Received: by 2002:a05:600c:810b:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-4922fac1214mr55599015e9.6.1781615866488;
        Tue, 16 Jun 2026 06:17:46 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e004325bddd753d2e35.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:4325:bddd:753d:2e35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4601esm67361305e9.1.2026.06.16.06.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 06:17:45 -0700 (PDT)
Date: Tue, 16 Jun 2026 15:17:43 +0200
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com,
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me,
	toke@redhat.com, lorenzo@kernel.org
Subject: Re: [PATCH bpf v2 2/2] selftests/bpf: Cover partial copy of
 non-linear test_run output
Message-ID: <ajFM97xoXuDAUsuw@mail.gmail.com>
References: <20260616093103.471444-1-sun.jian.kdev@gmail.com>
 <20260616093103.471444-3-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616093103.471444-3-sun.jian.kdev@gmail.com>

On Tue, Jun 16, 2026 at 05:31:03PM +0800, Sun Jian wrote:
> prog_run_opts already verifies that BPF_PROG_TEST_RUN returns -ENOSPC
> for a short data_out buffer while still reporting the full output size
> through data_size_out.
> 
> Add the same coverage for non-linear test_run output. Use pass-through
> TC and XDP programs with a 9000-byte packet, a 64-byte linear data area,
> and a 100-byte data_out buffer. The expected output spans both the linear
> data and the first fragment.
> 
> Verify that test_run returns -ENOSPC, reports the full packet length
> through data_size_out, and copies the packet prefix into data_out for
> both non-linear skb and XDP frags paths.
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  .../selftests/bpf/prog_tests/prog_run_opts.c  | 72 +++++++++++++++++++
>  .../selftests/bpf/progs/test_pkt_access.c     | 12 ++++
>  2 files changed, 84 insertions(+)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c b/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
> index 01f1d1b6715a..71af1ff02023 100644
> --- a/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
> +++ b/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
> @@ -4,6 +4,10 @@
>  
>  #include "test_pkt_access.skel.h"
>  
> +#define NONLINEAR_PKT_LEN 9000
> +#define NONLINEAR_LINEAR_DATA_LEN 64
> +#define SHORT_OUT_LEN 100
> +
>  static const __u32 duration;
>  
>  static void check_run_cnt(int prog_fd, __u64 run_cnt)
> @@ -20,6 +24,71 @@ static void check_run_cnt(int prog_fd, __u64 run_cnt)
>  	      "incorrect number of repetitions, want %llu have %llu\n", run_cnt, info.run_cnt);
>  }
>  
> +static void init_pkt(__u8 *pkt, size_t len)
> +{
> +	size_t i;
> +
> +	for (i = 0; i < len; i++)
> +		pkt[i] = i & 0xff;
> +}
> +
> +static void test_skb_nonlinear_data_out_partial(struct test_pkt_access *skel)
> +{
> +	LIBBPF_OPTS(bpf_test_run_opts, topts);
> +	__u8 pkt[NONLINEAR_PKT_LEN];
> +	__u8 out[SHORT_OUT_LEN];
> +	struct __sk_buff skb = {};
> +	int prog_fd, err;
> +
> +	init_pkt(pkt, sizeof(pkt));

Can't we reuse pkt_v4 by reducing the linear area to ETH_HLEN?

> +	memset(out, 0xa5, sizeof(out));

Why is this needed?

> +
> +	skb.data_end = NONLINEAR_LINEAR_DATA_LEN;
> +
> +	topts.data_in = pkt;
> +	topts.data_size_in = sizeof(pkt);
> +	topts.data_out = out;
> +	topts.data_size_out = sizeof(out);
> +	topts.ctx_in = &skb;
> +	topts.ctx_size_in = sizeof(skb);
> +
> +	prog_fd = bpf_program__fd(skel->progs.tc_pass_prog);
> +	err = bpf_prog_test_run_opts(prog_fd, &topts);
> +
> +	ASSERT_EQ(err, -ENOSPC, "skb_nonlinear_partial_err");
> +	ASSERT_EQ(topts.data_size_out, sizeof(pkt), "skb_nonlinear_partial_data_size_out");
> +	ASSERT_OK(memcmp(out, pkt, sizeof(out)), "skb_nonlinear_partial_data_out");
> +}
> +
> +static void test_xdp_nonlinear_data_out_partial(struct test_pkt_access *skel)
> +{
> +	LIBBPF_OPTS(bpf_test_run_opts, topts);
> +	__u8 pkt[NONLINEAR_PKT_LEN];
> +	__u8 out[SHORT_OUT_LEN];
> +	struct xdp_md ctx = {};
> +	int prog_fd, err;
> +
> +	init_pkt(pkt, sizeof(pkt));
> +	memset(out, 0xa5, sizeof(out));
> +
> +	ctx.data = 0;
> +	ctx.data_end = NONLINEAR_LINEAR_DATA_LEN;
> +
> +	topts.data_in = pkt;
> +	topts.data_size_in = sizeof(pkt);
> +	topts.data_out = out;
> +	topts.data_size_out = sizeof(out);
> +	topts.ctx_in = &ctx;
> +	topts.ctx_size_in = sizeof(ctx);
> +
> +	prog_fd = bpf_program__fd(skel->progs.xdp_frags_pass_prog);
> +	err = bpf_prog_test_run_opts(prog_fd, &topts);
> +
> +	ASSERT_EQ(err, -ENOSPC, "xdp_nonlinear_partial_err");
> +	ASSERT_EQ(topts.data_size_out, sizeof(pkt), "xdp_nonlinear_partial_data_size_out");
> +	ASSERT_OK(memcmp(out, pkt, sizeof(out)), "xdp_nonlinear_partial_data_out");
> +}
> +
>  void test_prog_run_opts(void)
>  {
>  	struct test_pkt_access *skel;
> @@ -69,6 +138,9 @@ void test_prog_run_opts(void)
>  	run_cnt += topts.repeat;
>  	check_run_cnt(prog_fd, run_cnt);
>  
> +	test_skb_nonlinear_data_out_partial(skel);
> +	test_xdp_nonlinear_data_out_partial(skel);
> +
>  cleanup:
>  	if (skel)
>  		test_pkt_access__destroy(skel);
> diff --git a/tools/testing/selftests/bpf/progs/test_pkt_access.c b/tools/testing/selftests/bpf/progs/test_pkt_access.c
> index bce7173152c6..cd284401eebd 100644
> --- a/tools/testing/selftests/bpf/progs/test_pkt_access.c
> +++ b/tools/testing/selftests/bpf/progs/test_pkt_access.c
> @@ -150,3 +150,15 @@ int test_pkt_access(struct __sk_buff *skb)
>  
>  	return TC_ACT_UNSPEC;
>  }
> +
> +SEC("tc")
> +int tc_pass_prog(struct __sk_buff *skb)
> +{
> +	return TC_ACT_OK;
> +}

Once we're reusing pkt_v4, maybe we can also reuse the existing BPF
program?

> +
> +SEC("xdp.frags")
> +int xdp_frags_pass_prog(struct xdp_md *ctx)
> +{
> +	return XDP_PASS;
> +}
> -- 
> 2.43.0
> 
