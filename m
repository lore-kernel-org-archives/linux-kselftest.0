Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425A53BB13C
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 22:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784328582; cv=none; b=uJifL9tfI1rpBYxk1y2IxhRvM6HDLlJQFQCvAG30IiC5Dy+wIFJdHEB9fxnpYxRFHgFRlEEd25XFtUHBMu7uk6RlxflUhX+dA4j//H87foaGZ/dPjwU1T0NywYOXrVHJGv6f5HjJdJDqlqfiUMi0Z2qNnH5C9hUIxCBlJ00d5YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784328582; c=relaxed/simple;
	bh=6RvpE8qFP6TIIRdRTfp8ZHJyUVxCqoaqZ6OzAfGID8g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=NqVUELd1bC+vS/O7t+AGYPcM7MU/NdnX45Oy2/LPYIwzGg0I95og1D1nn3lMAYKBy+0e/1skDY6zWeD0qqnNVd9ZIwpNQrplswj1JNQgo4dr7JBmSXLmurOKCa+aNSD37mT4KndphE5Ys9Fl2DxlcsaCZoqLuQH2SICvcVj+npI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=s+8lUySo; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="s+8lUySo"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc891373e0so102109325ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 15:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1784328578; x=1784933378; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ZRCURLtrdpcPJky/nSO+5JvhGwsgR5vttrFK3anyis=;
        b=s+8lUySola+QzWpYErDMtqsj2W8CH3w7aI8+clSWwF6wj5jcw3y0iXx23jmIiWS2dR
         M9jn2IRS+goOfZxVaZ1/fHFX+RJ6y/C0GP3h6CZ7h+uPiuOlZWyrbErhqlQSKN/oAbXL
         Gfmj/C1tU5EPoaAdyVBhBpEg1T3kStrccyuhBxoxjkcjus0myspBXD0p54i6+uesIsRF
         2h/2DvU9CwLf7mb8esXale5O3lZiMtFMdgluADYHxCEH9s9ckJGDfNXEVkLfvlCLUlHD
         eMVwbpXqG//j8TehJdNldte5cly/lBNu8+2GP1F6Q339GmbXKhA+cDYvtrSJeaJCZZry
         lbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784328578; x=1784933378;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ZRCURLtrdpcPJky/nSO+5JvhGwsgR5vttrFK3anyis=;
        b=M62Z0yoAOpbJ8jUK5ha+zClkLAu7Azj1IHzHMXl/DUdlK98eSthY14krJg4d+Zf7UG
         lvgopm8PesblwlQ8cR6kzoAmFgPytAzmP+hR2ktsto55JoIM8naQnKsYtS51HS0/E4L9
         hB036NRrlAzklHAtLMrDWVVhSp1v+pOV7jBUIpglTTyshlnSYE8/iyW1s5YwRilVE3MJ
         FS0OpKDgnfwALzHiBkPLT7AGjyQkxXeIdZiydM/a2ND956+vt9p89N1AGiayPcrPyS+x
         hOqooWk3tst2T7QpEm03QoIHbKUOXjCcfN9rlBogs8YolW/YpJoSJ5xcIggHZWdGyUv5
         B9BA==
X-Forwarded-Encrypted: i=1; AHgh+RrZTejgRo62AmrFlz/PgMfl/dDVrWqlDdaZ2qebnUYBcAHGJT0oDmJgVuuzZIrxr1Mrkp/aKylQFbYL2T/XuY8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb99dxH4f887FX39D4exAvDXBy3CQfiARxfUfqpFV/s9GsnNCd
	lsYDfbPnQivh7gLtZeeABRyovY8VELUjqErmXlZQJv7/QINFxZO85HQZUsW7qcbdxbk=
X-Gm-Gg: AfdE7cn7zdx7dmW4T07INJnvI2W36nZuXUjYqpQDquiXP4KpGyjGRTy0HA587Ui+ci/
	524GrkPkEdA30woTKAqUnH8GCHlWJgKSdB/tXjHCF54Tv+QbDHiJ3HDMbevLx2bpvSHWS+xrIkU
	6pSWPZ7nM9tTtnxuGbEC1c98kVpyIhZhfXWdyVejgdX5AetFbHFy8lTkXC4UZ/qJPSuFKULGj9e
	K9O/LR18mm3rvTr9tElnTaHHnE6iRxrZZW767p7qxxdxb+dvDHsIJ+ZX7M3TL4sEnqx75ske0CD
	eouUJhvx2HKbxbb9H71Xl1EcZqkdrrAWszxIibAdrlAH8V2poLOd5NXVPQPQ+TAqmXIPgafF3zT
	ULUbYNeAqWqHtdqDd2RJJb7ZxOnTJka4J900ot0OP37vHs5Bpa3V6xqNK4QQ=
X-Received: by 2002:a17:90b:3890:b0:384:229e:1d1c with SMTP id 98e67ed59e1d1-38e4b59b91emr4338097a91.31.1784328577711;
        Fri, 17 Jul 2026 15:49:37 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::f5f9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fdbd45sm10427880eec.12.2026.07.17.15.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 15:49:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 18:49:34 -0400
Message-Id: <DK17OV4181RP.1LRGDA6VBB364@etsalapatis.com>
Subject: Re: [PATCH bpf-next v10 7/9] selftests/bpf: Test direct
 reading/writing read-only percpu_array map
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Leon Hwang" <leon.hwang@linux.dev>, <bpf@vger.kernel.org>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>, "Quentin Monnet"
 <qmo@kernel.org>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <kernel-patches-bot@fb.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260715153254.92010-1-leon.hwang@linux.dev>
 <20260715153254.92010-8-leon.hwang@linux.dev>
In-Reply-To: <20260715153254.92010-8-leon.hwang@linux.dev>

On Wed Jul 15, 2026 at 11:32 AM EDT, Leon Hwang wrote:
> Verify these two cases:
>
> 1. Direct reading the data of read-only percpu data's percpu_array map
>    is allowed.
> 2. Direct writing the data of read-only percpu data's percpu_array map
>    is disallowed.
>
> Assisted-by: Codex:gpt-5.5-xhigh
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  .../bpf/prog_tests/global_data_init.c         | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/global_data_init.c b/=
tools/testing/selftests/bpf/prog_tests/global_data_init.c
> index f7a56e3fdbce..d4405646847a 100644
> --- a/tools/testing/selftests/bpf/prog_tests/global_data_init.c
> +++ b/tools/testing/selftests/bpf/prog_tests/global_data_init.c
> @@ -199,6 +199,85 @@ static void test_global_percpu_data_lskel(void)
>  	test_global_percpu_data_lskel__destroy(lskel);
>  }
> =20
> +static int create_rdonly_percpu_array(void)
> +{
> +	LIBBPF_OPTS(bpf_map_create_opts, map_opts,
> +		    .map_flags =3D BPF_F_RDONLY_PROG,
> +	);
> +	int key =3D 0, map_fd, err;
> +	__u64 value =3D 0;
> +
> +	map_fd =3D bpf_map_create(BPF_MAP_TYPE_PERCPU_ARRAY, "percpu_ro_map", s=
izeof(int),
> +				sizeof(__u64), 1, &map_opts);
> +	if (!ASSERT_GE(map_fd, 0, "bpf_map_create"))
> +		return -1;
> +
> +	err =3D bpf_map_update_elem(map_fd, &key, &value, BPF_F_ALL_CPUS);
> +	if (!ASSERT_OK(err, "bpf_map_update_elem"))
> +		goto out;
> +
> +	err =3D bpf_map_freeze(map_fd);
> +	if (!ASSERT_OK(err, "bpf_map_freeze"))
> +		goto out;
> +
> +	return map_fd;
> +
> +out:
> +	close(map_fd);
> +	return -1;
> +}
> +
> +static void test_global_percpu_data_rdonly_direct_read(void)
> +{
> +	struct bpf_insn insns[] =3D {
> +		BPF_LD_MAP_VALUE(BPF_REG_1, 0, 0),
> +		BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1, 0),
> +		BPF_EXIT_INSN(),
> +	};

Why hardcode this as inline assembly? Can we do a syscall example in the
progs/? That way there will also be a concrete example of how we're
using the feature in practice.

> +	int map_fd, prog_fd;
> +
> +	map_fd =3D create_rdonly_percpu_array();
> +	if (map_fd < 0)
> +		return;
> +
> +	insns[0].imm =3D map_fd;
> +	prog_fd =3D bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, "percpu_ro_prog"=
, "GPL", insns,
> +				ARRAY_SIZE(insns), NULL);
> +	if (ASSERT_GE(prog_fd, 0, "bpf_prog_load"))
> +		close(prog_fd);
> +	close(map_fd);
> +}
> +
> +static void test_global_percpu_data_rdonly_direct_write(void)
> +{
> +	LIBBPF_OPTS(bpf_prog_load_opts, prog_opts);
> +	struct bpf_insn insns[] =3D {
> +		BPF_LD_MAP_VALUE(BPF_REG_1, 0, 0),
> +		BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1, 0),
> +		BPF_ST_MEM(BPF_DW, BPF_REG_1, 0, 0),
> +		BPF_EXIT_INSN(),
> +	};
> +	char log_buf[256] =3D {};
> +	int map_fd, prog_fd;
> +
> +	prog_opts.log_buf =3D log_buf;
> +	prog_opts.log_size =3D sizeof(log_buf);
> +	prog_opts.log_level =3D 1;
> +
> +	map_fd =3D create_rdonly_percpu_array();
> +	if (map_fd < 0)
> +		return;
> +
> +	insns[0].imm =3D map_fd;
> +	prog_fd =3D bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, "percpu_ro_prog"=
, "GPL", insns,
> +				ARRAY_SIZE(insns), &prog_opts);
> +	if (!ASSERT_LT(prog_fd, 0, "bpf_prog_load"))
> +		close(prog_fd);
> +	else
> +		ASSERT_HAS_SUBSTR(log_buf, "write into map forbidden", "verifier log")=
;
> +	close(map_fd);
> +}
> +
>  void test_global_percpu_data(void)
>  {
>  	if (!feat_supported(NULL, FEAT_PERCPU_DATA)) {
> @@ -210,4 +289,8 @@ void test_global_percpu_data(void)
>  		test_global_percpu_data_init();
>  	if (test__start_subtest("lskel"))
>  		test_global_percpu_data_lskel();
> +	if (test__start_subtest("rdonly_direct_read"))
> +		test_global_percpu_data_rdonly_direct_read();
> +	if (test__start_subtest("rdonly_direct_write"))
> +		test_global_percpu_data_rdonly_direct_write();
>  }

