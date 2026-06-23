Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE2D370AF8
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 23:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782256723; cv=none; b=J6H4sl997P1fRg5dXShEMfXJhi48joPpZV+zgI7J296yMcaIbUXzRv4EDGdngrCf91WWnmE0UDDMmxpYQktbujyqaHsYOm78nY87rhs2BomJhhyoBrisQYg6iJHiPxwV+QKE75jLFEWGuxPYL+h7BJekG6hZ+gIYeCZ21/X/Yv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782256723; c=relaxed/simple;
	bh=5n/QXvZJMGPIUw6mar8KB9fVldpShIPxMrK3iYCi6nw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=sXPcIs6orbnyYjJ7PSRZwxHgok0vkcCYQ9VVasXJaEWL4DXEzq3v8KsP0Rusi6Pj3urAsiUmFEZV5Yc0mlu65UQCXTxig56F6xzrCfw9JRtnd8rbRHQW7XjfhyIJKewld2yqUKAgdoyQBO7vNwgC2QqzJYpVop60w/OV+73NHmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=IabuqfW4; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="IabuqfW4"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-137dd4cc208so633491c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 16:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1782256721; x=1782861521; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYJtv+c85w7+pZmkL6Nw0woUwIf8pgennhXzWDFmEds=;
        b=IabuqfW4ABncEl0qceaPOc1Q+/LQ1E9sLvsD8nLnYWecJPACMgN29DMCBkT7VbvV+D
         kgnq2QlZcLcHLIbImNoS9CjqNjPySD3nm/pOO6UWRDoXJ53jw/6wOvucKqWomAjpQePG
         /VlmdxKZVkpmMM310nWZS4Bf2iyi8Q8lZezCazKb1RqSR5ICzUdAqj7Fg1h7b0+P9X+2
         iYaADsj1Ks6d75kji52oB+KC0gp3XAZIBpkvUExl/954cO5VIIKTElZxxq4WJAxdAphJ
         rdztnP5E3g6jiTIdJXkvxzF0/UKlXbSLIsoQoZ6EGquaPOyO0zynOLbAOP+PObHFxH1e
         KT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782256721; x=1782861521;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TYJtv+c85w7+pZmkL6Nw0woUwIf8pgennhXzWDFmEds=;
        b=oI3+GXQPp1tF4it5rCKhjM5nhoIHZ06qLbYsTELAIbEV+NSmRimhGrTkbcCxNnZ3zj
         g9mVxIFjWQlWQ4SkOHXMnzkjXmiYy1sUWnsG5MiUxqXv5E/ha8CU9DY8j/IH9qOlrzrW
         iSB6zppjjkkia45fZxrI2mRFhVE45PxnEdGZPZTspP0MVQyhkbWa5aA2su5pNWDy64ZL
         it6W1xQP7ieQoxS8ZJO9MWniSpJEaNP4/ymTQzAIWd7sv3bYbIH1raK/U0Uo622pnwzs
         K5sgoYDOlTvznsNmUlsiDIlipvulDyoEckfpazC4GIDjzZ/G/rz8CQUIvwwMtIB2WiGL
         AfdA==
X-Forwarded-Encrypted: i=1; AFNElJ/1v6jjSn+f7kdvb0r+uK9Ul8NWoqyAa68JtrnMdfumOsT81ql6MDfEN/ufMd+oNEJ5Z3qz/hqCg7AEdgbzYpY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfaX7v6a/VNLoxmVthERtS4+zkO458O8xX8aQyGFVzPFjZ4DRO
	m4fnITAhB+8Zt3FipxtyYymfNa/+MO+oyHKwdQ1D/Z59OEIaTcyZCLPk7yLS8LVhKcc=
X-Gm-Gg: AfdE7cmjtKGnOTrnD0qU5HXD8vUk+1xKHqBuONQsE5GLW74o33TWjDbFTmGrtpTzmYN
	DxHStBg67IFRwu34UVOn7Az6RSoR9CFv2ZeRdE8c1Z51JxV0sw7hEqfFiiwpqRKEi3Tx/DwR3Wa
	coKtBZKkzc2/hQwQfg83dS/t6IW2RJcuzRUZjKE16d/d5E9B43otfl9JIXLNTrC/+V/KsTtWTsJ
	RK3qQLvugwN6Yv0mU9Url0E7Sq5T6kUQG1yc9rxftdA98lZwTyyADWdZ5xpfwoZu+V4X56IypVG
	qHGlxF9nlN1t0LEFcACy1eFYs8PaBOF+zNe2nibvQV+a3iLeaMfAJUugIdbeYWeozUDWeRjGqSe
	pF1lBIvHxj+5oT2HkNKFzdeC+0Bgt6uSSAxHgo0ktxLjnnXc9sbMbe7COiC04bDfVZje+Hy59Va
	fJ8twx
X-Received: by 2002:a05:7022:f9b:b0:138:5049:cb88 with SMTP id a92af1059eb24-139c3c1f687mr4353186c88.8.1782256721278;
        Tue, 23 Jun 2026 16:18:41 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::2526])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be4b24esm18814840eec.27.2026.06.23.16.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 16:18:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 19:18:38 -0400
Message-Id: <DJGTA190PW77.1GCDO0XHPPZZX@etsalapatis.com>
Subject: Re: [PATCH bpf v4] selftests/bpf: Cover partial copy of non-linear
 test_run output
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Sun Jian" <sun.jian.kdev@gmail.com>, <bpf@vger.kernel.org>
Cc: <netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <martin.lau@linux.dev>, <paul.chaignon@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260623014027.402820-1-sun.jian.kdev@gmail.com>
In-Reply-To: <20260623014027.402820-1-sun.jian.kdev@gmail.com>

On Mon Jun 22, 2026 at 9:40 PM EDT, Sun Jian wrote:
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

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>
> v4:
> - Send only the selftest patch; the fix patch has been applied to bpf/mas=
ter.
> - Initialize data_out buffers to avoid reading uninitialized stack memory=
 if
>   bpf_prog_test_run_opts() fails unexpectedly.
>
>  .../selftests/bpf/prog_tests/prog_run_opts.c  | 70 +++++++++++++++++++
>  .../selftests/bpf/progs/test_pkt_access.c     | 12 ++++
>  2 files changed, 82 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c b/too=
ls/testing/selftests/bpf/prog_tests/prog_run_opts.c
> index 01f1d1b6715a..beb6fa78fd94 100644
> --- a/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
> +++ b/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
> @@ -4,6 +4,10 @@
> =20
>  #include "test_pkt_access.skel.h"
> =20
> +#define NONLINEAR_PKT_LEN 9000
> +#define NONLINEAR_LINEAR_DATA_LEN 64
> +#define SHORT_OUT_LEN 100
> +
>  static const __u32 duration;
> =20
>  static void check_run_cnt(int prog_fd, __u64 run_cnt)
> @@ -20,6 +24,69 @@ static void check_run_cnt(int prog_fd, __u64 run_cnt)
>  	      "incorrect number of repetitions, want %llu have %llu\n", run_cnt=
, info.run_cnt);
>  }
> =20
> +static void init_pkt(__u8 *pkt, size_t len)
> +{
> +	size_t i;
> +
> +	for (i =3D 0; i < len; i++)
> +		pkt[i] =3D i & 0xff;
> +}
> +
> +static void test_skb_nonlinear_data_out_partial(struct test_pkt_access *=
skel)
> +{
> +	LIBBPF_OPTS(bpf_test_run_opts, topts);
> +	__u8 pkt[NONLINEAR_PKT_LEN];
> +	__u8 out[SHORT_OUT_LEN] =3D {};
> +	struct __sk_buff skb =3D {};
> +	int prog_fd, err;
> +
> +	init_pkt(pkt, sizeof(pkt));
> +
> +	skb.data_end =3D NONLINEAR_LINEAR_DATA_LEN;
> +
> +	topts.data_in =3D pkt;
> +	topts.data_size_in =3D sizeof(pkt);
> +	topts.data_out =3D out;
> +	topts.data_size_out =3D sizeof(out);
> +	topts.ctx_in =3D &skb;
> +	topts.ctx_size_in =3D sizeof(skb);
> +
> +	prog_fd =3D bpf_program__fd(skel->progs.tc_pass_prog);
> +	err =3D bpf_prog_test_run_opts(prog_fd, &topts);
> +
> +	ASSERT_EQ(err, -ENOSPC, "skb_partial_err");
> +	ASSERT_EQ(topts.data_size_out, sizeof(pkt), "skb_partial_size");
> +	ASSERT_OK(memcmp(out, pkt, sizeof(out)), "skb_partial_data");
> +}
> +
> +static void test_xdp_nonlinear_data_out_partial(struct test_pkt_access *=
skel)
> +{
> +	LIBBPF_OPTS(bpf_test_run_opts, topts);
> +	__u8 pkt[NONLINEAR_PKT_LEN];
> +	__u8 out[SHORT_OUT_LEN] =3D {};
> +	struct xdp_md ctx =3D {};
> +	int prog_fd, err;
> +
> +	init_pkt(pkt, sizeof(pkt));
> +
> +	ctx.data =3D 0;
> +	ctx.data_end =3D NONLINEAR_LINEAR_DATA_LEN;
> +
> +	topts.data_in =3D pkt;
> +	topts.data_size_in =3D sizeof(pkt);
> +	topts.data_out =3D out;
> +	topts.data_size_out =3D sizeof(out);
> +	topts.ctx_in =3D &ctx;
> +	topts.ctx_size_in =3D sizeof(ctx);
> +
> +	prog_fd =3D bpf_program__fd(skel->progs.xdp_frags_pass_prog);
> +	err =3D bpf_prog_test_run_opts(prog_fd, &topts);
> +
> +	ASSERT_EQ(err, -ENOSPC, "xdp_partial_err");
> +	ASSERT_EQ(topts.data_size_out, sizeof(pkt), "xdp_partial_size");
> +	ASSERT_OK(memcmp(out, pkt, sizeof(out)), "xdp_partial_data");
> +}
> +
>  void test_prog_run_opts(void)
>  {
>  	struct test_pkt_access *skel;
> @@ -69,6 +136,9 @@ void test_prog_run_opts(void)
>  	run_cnt +=3D topts.repeat;
>  	check_run_cnt(prog_fd, run_cnt);
> =20
> +	test_skb_nonlinear_data_out_partial(skel);
> +	test_xdp_nonlinear_data_out_partial(skel);
> +
>  cleanup:
>  	if (skel)
>  		test_pkt_access__destroy(skel);
> diff --git a/tools/testing/selftests/bpf/progs/test_pkt_access.c b/tools/=
testing/selftests/bpf/progs/test_pkt_access.c
> index bce7173152c6..cd284401eebd 100644
> --- a/tools/testing/selftests/bpf/progs/test_pkt_access.c
> +++ b/tools/testing/selftests/bpf/progs/test_pkt_access.c
> @@ -150,3 +150,15 @@ int test_pkt_access(struct __sk_buff *skb)
> =20
>  	return TC_ACT_UNSPEC;
>  }
> +
> +SEC("tc")
> +int tc_pass_prog(struct __sk_buff *skb)
> +{
> +	return TC_ACT_OK;
> +}
> +
> +SEC("xdp.frags")
> +int xdp_frags_pass_prog(struct xdp_md *ctx)
> +{
> +	return XDP_PASS;
> +}

