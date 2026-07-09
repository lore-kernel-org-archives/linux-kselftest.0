Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0DF39D6D6
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 16:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616387; cv=none; b=jRqABSFXMMmkLVwYOyqQ8kptaNHoUcasqXX60ZcOJezvynefGro8xc0OfnoB0pezRk3700EDSTO36lSIY8nrAVoNYJxJVpro7lJTkNyySVJEtZ8zFdaTZAOnZYH8IVJDiS2z4xwDdPC4f098B6wtJpqZMORwVk8D3EKlMGEMHdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616387; c=relaxed/simple;
	bh=A8PFzAweBxe6GYZndXkcJYfE1c2BR+dAAHhZeo/gHZo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gRajYhQtPAbAt+i0N6RtacpepKbVnsBp4RtUzqr4mj2d3CywukjlXGlKBhJSASGZEfG4Eq/M6hDbOastceXCMlIHmYvseiQc2JAJ4n/T/uxtyVl5mOloRyJ9fL75KMjnbSdryVrIvLN86XvjqA/ivMjbUKu2CRFjxuQZDu4QToM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmUWVAS6; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmUWVAS6"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso762845b3a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 09:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783616385; x=1784221185; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vH10uOScxNtAYRVOYd8iZlYH3CpE88FBdSHXn1NRt5Y=;
        b=WmUWVAS674Mzr9af2EOfrQWrTbh0JNM9XfyUm97gtBfFtGiUg1v1sO/7HFZNylGjbu
         e4DV7sc48ehKvt62eJ0xaJrVpa/SX8kkPnxQLdR1pO92un1rRHaZ7P2fKalc7/Ekufol
         GEW6SsQRIGdjMF9yjvnh4xs9Q7XQBx6EKsuB8Ms2Vcuwdl8CmimeYd4K+Nx9Uo4c12Sj
         mOPmnK5wF559JJsPdsR6VCb+5bYbfJWqnUqLx/njRi1ZAp4xvvrHavUTy/PFhMgwP9lO
         6XnM+PzYupxkBie8GXLcJ95U/g+UckF/DahD+OvI872WsndqS/k3S2QUnCyjDyI5gQpF
         90GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616385; x=1784221185;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vH10uOScxNtAYRVOYd8iZlYH3CpE88FBdSHXn1NRt5Y=;
        b=HxZx7L/WI/BIOq5UDke3apEjedjpHokji6/mF2EI0TtUq2cWB/zHegRXFRVnP8vL6B
         Hpi8Uz4441O3K4xel3fP7gAC4JGbT+SnUYQEHojhJM7chGbtMbE4D++VRqN1jmMPbqSR
         /o6qQ05ThiLJ4le3wTdL1OJHJFMo4mUCM1iULayNSzKeqnE/y9ZQkRf9BO7XJXx+K1xq
         NNVBxLg60dwC0ssBvFwl9ARyURO+jJk81feRWW8p3qXW7tdr09cwzOE+lLuoszYlk1L8
         Ud0tmG4YRpmUy0PgD2aiKgIPHHck/qHV8H86S4oawAH3xtqReAK7TdkWYsGK2BLHsjt4
         SGXA==
X-Forwarded-Encrypted: i=1; AHgh+RpcyvoXw6BTMvkubqwjTp7Ab50OJ2ev3d2aTlzzoOjh+Ak1y5d+P/N0vBTY3KlW6bwlRpYG7n4yQKIXVIs141s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB4GMUxWUfcLmpGbXQX2Z2TkpJpH50DClXnZTf4WsOzFAkcfLU
	eMIxo+prGyeZYFKqQd8YRbij8LRXRhmOcjcddb/zYb991pKpjKYeVv+S
X-Gm-Gg: AfdE7cl423++eemrxGdgiyvy8Z2PD79tBOTtJZHEYN2yJ3e2k+PCunDy+mPBk+8ubdX
	h2mSk3kmeDYkQwx8oV51mbSP6cP78odjRNFRicC3EIURVQqyrPMKmBnrprxJIwF/yKWiy+QPzLC
	YgMpnlCE0+rqov1D6VXhTKPiTf1TDy7BNkHEUIzva1s3INi+cBBY13cDb8tj470lkNxQFgAd2OE
	ylAX9bGpe1X6Py/+Y7xyhEet0g8K1o1VOy2gNX9GwBORF9k0+2BFM6jmn1/zENxblA08Izyj2jA
	Lj37x/cgftPBHggTFcLkdy6/mtlIPboWfzCrMIfQ5yMa+t0PbgCP75hoVFcvV4bf2Ub0ohX+E+K
	Wh16EpPgDSo7SeDiuO4Npxhj7E76hWV+H0V3DXycxy4ChQFASn/znK9VNsbgCfgFWdXlG4rKbmq
	3Q9scle4iDtKkFxwWGfTnydHuusD2vLqLvfSjdeW79
X-Received: by 2002:a05:6a00:4fd4:b0:842:5a8d:3035 with SMTP id d2e1a72fcca58-84842efa5e3mr7828082b3a.22.1783616385129;
        Thu, 09 Jul 2026 09:59:45 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8484519580csm2833191b3a.32.2026.07.09.09.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:59:44 -0700 (PDT)
Message-ID: <a8a6ef8f9fa48a1f05e64148e5fc7cf81338a256.camel@gmail.com>
Subject: Re: [PATCH bpf v4 2/2] selftests/bpf: Cover negative raw_tp
 writable buffer offsets
From: Eduard Zingerman <eddyz87@gmail.com>
To: Sun Jian <sun.jian.kdev@gmail.com>, bpf@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com, 
	andrii@kernel.org, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 shuah@kernel.org, 	mmullins@fb.com, shung-hsi.yu@suse.com,
 linux-kernel@vger.kernel.org, 	linux-kselftest@vger.kernel.org
Date: Thu, 09 Jul 2026 09:59:41 -0700
In-Reply-To: <20260708090151.151729-3-sun.jian.kdev@gmail.com>
References: <20260708090151.151729-1-sun.jian.kdev@gmail.com>
	 <20260708090151.151729-3-sun.jian.kdev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-07-08 at 02:01 -0700, Sun Jian wrote:
> Add raw tracepoint writable coverage for buffer accesses involving
> negative constant pointer adjustments.
>=20
> The verifier case checks that a negative effective offset is rejected.
> The attach-time case adds incremental coverage beyond the existing nbd
> test and the verifier rejection case: it uses a negative var_off and a
> positive instruction offset whose effective offset remains non-negative.
> This exercises the checked access_end accounting path and verifies that
> the resulting max_tp_access is still checked against nbd_send_request's
> writable size at attach time.
>=20
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
> =C2=A0.../raw_tp_writable_reject_nbd_invalid.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 58 +++++++++++--------
> =C2=A0.../bpf/progs/verifier_raw_tp_writable.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 16 +++++
> =C2=A02 files changed, 51 insertions(+), 23 deletions(-)
>=20
> diff --git a/tools/testing/selftests/bpf/prog_tests/raw_tp_writable_rejec=
t_nbd_invalid.c b/tools/testing/selftests/bpf/prog_tests/raw_tp_writable_re=
ject_nbd_invalid.c
> index 216b0dfac0fe..efe4cad47b28 100644
> --- a/tools/testing/selftests/bpf/prog_tests/raw_tp_writable_reject_nbd_i=
nvalid.c
> +++ b/tools/testing/selftests/bpf/prog_tests/raw_tp_writable_reject_nbd_i=
nvalid.c
> @@ -4,12 +4,31 @@
> =C2=A0#include <linux/nbd.h>
> =C2=A0#include "bpf_util.h"
> =C2=A0
> -void test_raw_tp_writable_reject_nbd_invalid(void)
> +static void check_nbd_attach_reject(const char *name,
> +				=C2=A0=C2=A0=C2=A0 const struct bpf_insn *program, size_t prog_len)
> =C2=A0{
> -	__u32 duration =3D 0;
> +	LIBBPF_OPTS(bpf_prog_load_opts, opts);
> =C2=A0	char error[4096];
> -	int bpf_fd =3D -1, tp_fd =3D -1;
> +	int bpf_fd, tp_fd;
> +
> +	opts.log_level =3D 2;
> +	opts.log_buf =3D error;
> +	opts.log_size =3D sizeof(error);
> +
> +	bpf_fd =3D bpf_prog_load(BPF_PROG_TYPE_RAW_TRACEPOINT_WRITABLE, NULL, "=
GPL v2",
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 program, prog_len, &opts);
> +	if (!ASSERT_GE(bpf_fd, 0, "prog_load"))
> +		return;
> +
> +	tp_fd =3D bpf_raw_tracepoint_open("nbd_send_request", bpf_fd);
> +	if (!ASSERT_LT(tp_fd, 0, name))
> +		close(tp_fd);
> +
> +	close(bpf_fd);
> +}
> =C2=A0
> +void test_raw_tp_writable_reject_nbd_invalid(void)
> +{
> =C2=A0	const struct bpf_insn program[] =3D {
> =C2=A0		/* r6 is our tp buffer */
> =C2=A0		BPF_LDX_MEM(BPF_DW, BPF_REG_6, BPF_REG_1, 0),
> @@ -19,25 +38,18 @@ void test_raw_tp_writable_reject_nbd_invalid(void)
> =C2=A0		BPF_EXIT_INSN(),
> =C2=A0	};
> =C2=A0
> -	LIBBPF_OPTS(bpf_prog_load_opts, opts,
> -		.log_level =3D 2,
> -		.log_buf =3D error,
> -		.log_size =3D sizeof(error),
> -	);
> -
> -	bpf_fd =3D bpf_prog_load(BPF_PROG_TYPE_RAW_TRACEPOINT_WRITABLE, NULL, "=
GPL v2",
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 program, ARRAY_SIZE(program),
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &opts);
> -	if (CHECK(bpf_fd < 0, "bpf_raw_tracepoint_writable load",
> -		=C2=A0 "failed: %d errno %d\n", bpf_fd, errno))
> -		return;
> -
> -	tp_fd =3D bpf_raw_tracepoint_open("nbd_send_request", bpf_fd);
> -	if (CHECK(tp_fd >=3D 0, "bpf_raw_tracepoint_writable open",
> -		=C2=A0 "erroneously succeeded\n"))
> -		goto out_bpffd;
> +	const struct bpf_insn negative_var_off_program[] =3D {
> +		BPF_LDX_MEM(BPF_DW, BPF_REG_6, BPF_REG_1, 0),
> +		/* make var_off negative, but keep the effective access offset non-neg=
ative */
> +		BPF_ALU64_IMM(BPF_ADD, BPF_REG_6, -8),
> +		/* one byte beyond the end of the nbd_request struct */
> +		BPF_LDX_MEM(BPF_B, BPF_REG_0, BPF_REG_6,
> +			=C2=A0=C2=A0=C2=A0 sizeof(struct nbd_request) + 8),
> +		BPF_EXIT_INSN(),
> +	};
> =C2=A0
> -	close(tp_fd);
> -out_bpffd:
> -	close(bpf_fd);
> +	check_nbd_attach_reject("nbd_invalid", program, ARRAY_SIZE(program));
> +	check_nbd_attach_reject("nbd_invalid_negative_var_off",
> +				negative_var_off_program,
> +				ARRAY_SIZE(negative_var_off_program));
> =C2=A0}

Let's use subtests here:

static void check_nbd_attach_reject(const struct bpf_insn *program, size_t =
prog_len)
{
	LIBBPF_OPTS(bpf_prog_load_opts, opts);
	char error[4096];
	int bpf_fd, tp_fd;

	opts.log_level =3D 2;
	opts.log_buf =3D error;
	opts.log_size =3D sizeof(error);

	bpf_fd =3D bpf_prog_load(BPF_PROG_TYPE_RAW_TRACEPOINT_WRITABLE, NULL, "GPL=
 v2",
			       program, prog_len, &opts);
	if (!ASSERT_GE(bpf_fd, 0, "prog_load"))
		return;

	tp_fd =3D bpf_raw_tracepoint_open("nbd_send_request", bpf_fd);
	ASSERT_ERR_FD(tp_fd, "bpf_raw_tracepoint_open");

	close(tp_fd);
	close(bpf_fd);
}

void test_raw_tp_writable_reject_nbd_invalid(void)
{
	const struct bpf_insn program[] =3D {
		/* r6 is our tp buffer */
		BPF_LDX_MEM(BPF_DW, BPF_REG_6, BPF_REG_1, 0),
		/* one byte beyond the end of the nbd_request struct */
		BPF_LDX_MEM(BPF_B, BPF_REG_0, BPF_REG_6,
			    sizeof(struct nbd_request)),
		BPF_EXIT_INSN(),
	};
	const struct bpf_insn negative_var_off_program[] =3D {
		BPF_LDX_MEM(BPF_DW, BPF_REG_6, BPF_REG_1, 0),
		/* make var_off negative, but keep the effective access offset non-negati=
ve */
		BPF_ALU64_IMM(BPF_ADD, BPF_REG_6, -8),
		/* one byte beyond the end of the nbd_request struct */
		BPF_LDX_MEM(BPF_B, BPF_REG_0, BPF_REG_6,
			    sizeof(struct nbd_request) + 8),
		BPF_EXIT_INSN(),
	};

	if (test__start_subtest("nbd_invalid"))
		check_nbd_attach_reject(program, ARRAY_SIZE(program));
	if (test__start_subtest("nbd_invalid_negative_var_off"))
		check_nbd_attach_reject(negative_var_off_program,
					ARRAY_SIZE(negative_var_off_program));
}


[...]
