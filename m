Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE7E3769E3
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 22:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782254797; cv=pass; b=b3PhqgnDJ2LBjUgu/IBll8fM+rUhZWoa6SZ5A0U8Laein+zSWG5GJEvFtf2n77ikg0Psyp87YFXzF9d5kgAKr0WuR1/iSWrKNTKYzSXZRoxC9yUvMRbuwIaFDnHWuNtnXSr2Y2kDqDn+R3L1v2hXYMiiRrkXaFv6ZXjRmJDw4LE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782254797; c=relaxed/simple;
	bh=EoNa88wmRRzgNbTcw8bzW3CIxyyn/g31iBHhffrV7JI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p57CfcGfDzFgkHYNaYN9EaYwtDqRwYpPjTr38basZyQ538Emv1ww7wiVScJ9495JYLwkRXuHjlgR8Ja9WmbtLtz3v/34f3IJM2i01S90Xan6fOHOcVJfNIwJwnZMk1i+NT0LOlw5jcj3xDs4Pvfx8lcqvTjXmAPJnXcZPtzOx6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ms6JfkGI; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ms6JfkGI"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37c8e7c8185so262965a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 15:46:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782254795; cv=none;
        d=google.com; s=arc-20240605;
        b=OT2pgXnLjyjffYoT3ju5NbxA+TwsmbvoafbhCIRDzORsZSyuhrTmj4fxxBsL0qM2Ye
         0g86SkrD+RuMwn9uM8StzYK9r+fqDC94AqcrPwaV0KDaKhNnsKc2uVAST/n2W1uUnY4R
         Ykb7pd1tlfNkR0JK1x3L7ylA2Kg0pHDE6mZdDywAPXEc8NYuBb9KWeHDp/B9k+a5xx/X
         DXXOZzYtaAXLdCrEawL6B+5/X3S+Tu/l1/CnK/IpfbjDy5Wzcq0h5csLDPQIVik1UqMN
         Zh9rz2CKuSACWpNR39YbSn8uD606s8xzF/sT4f6fwb6JwbEpiJceWS+h/FqrrN8LxOrg
         ivSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4cQeF60kgONMVqNgnkSoiO81INVKj/yr1+GUEevj9iM=;
        fh=vq87Uf0mwwP/aBXIbzG0Bp4IlpCMpgkhsTqFTfM5IQY=;
        b=SkaoxkK1C5rttkHT3nB7SFJroqoTXptkwUVEI1m8qWSyn+Bm/pZ+y7wk63eXwtx6+i
         91WWNQyUTlcnVFjh9k5WKMU6Y2/I357V8H2OPgSDIo+g7m1VzK3NbdZatGQCJ7K+uaHA
         IB9/6l7D/CFrz5LtsZ6BGSRqpwLwVIw6yoW34HAfsc+uxi71nVgSBLEVDETPMAQLpNGz
         LAYjSvupq99mDA0MZRBIsoVrQeq0UB94WfGcLLvJYwUmHrdbHJWbSJd7YxRIUxr04jOA
         mYyAFzxADgZPdkuuNLwaD+Nj1juxWOxMPhtCuq2qDFXi2DxOxf4tO6CRS7w68qnAMCzJ
         KLnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782254795; x=1782859595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cQeF60kgONMVqNgnkSoiO81INVKj/yr1+GUEevj9iM=;
        b=Ms6JfkGINuzIe/mAzUHh9cn/cBcZj33HtV9vrtrrkvMsfzNBLdv/IqRoGs3z1hYK0m
         zhUMAScAwDEy5/y1J5CyXKTLiI54QqUc62/EuTbgKIl2VmqmJogpyS2bSH0bLvugw35L
         +KU3g5cPJCvNCgWFgsDU99syulZhGZIIOMNzzdBK4C3IDybvXLDmQGNhE403korEy9Hx
         uhBPBPx6Z0acExZRhWnskTKEYo1spzwf7PzhOcc4Q5g2Awy6gnTS7EplVtFDLtZjrmQU
         3GCzuBvSRBBl1kPYJtgxzW53/BGkopJFqkVKVbIBrJYSVlV8Zis9e22oT4NKCW58/ax6
         sqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782254795; x=1782859595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4cQeF60kgONMVqNgnkSoiO81INVKj/yr1+GUEevj9iM=;
        b=BRxduq9+IQx2QR1sW4+znnVDGNbQl8i+jScPYki05wqxUze6P5i1pC7pNBr5Iia2T9
         jf3205tYrILdaRS8pawOQK0TIYWdhqN4sdxAVaINP8zf3uw7F7itn5M9NzKu9Ij7a6FS
         i/Phhz7UOcuk7Md6mQuMwOi3tYe+Wb3wB5PIvhw3s0J3Exw8V/c3U2JvorrL8STkQCHx
         FzYCNUczfJxKcNsQQzpwugy5qyePxPxKJhKxsVTrhmCVlZ4lowrCm7LmYrrOge04xBDB
         hI0noHNVkEmuT8wdi4sCMskXwwrQBcgN8TEyOCnBNQ/aHSL6XVr4fBrtM2a/XD234ukU
         paUA==
X-Forwarded-Encrypted: i=1; AHgh+RoB05vS3lsUH8BqAJjpthBvqvlpiccib45l/yhoE4dOMidu5CMITNxGVYGPimB8cDxI/CtyjjV4EvwZD5eeE6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpWbgGZdEiCjR1U3IryKj7BVVq58Qq9RoDn3KWpsIh4OSjPnCJ
	rixDlkAGAaXSQQ6BEruDM5ReFIY79l/+KqSwBhwMlyGMuZG2LxRK83+aodyGqwXZFgn2sK8kudh
	fLFcKHb/sHKZZ4GBycVgiWnUnkQrt5wI=
X-Gm-Gg: AfdE7cnPdUevCJ38vVdRV4mjdpKL9AajT63opeVYMqchMxCr/dZ2TsVakCSVtQ3yYc4
	S7QuL4IxuopNvEwlBAppEisPha1RsmJP64M8HifvoDgmjl7VvmMoCPg2Ss+bttGShsN1OU+yjha
	Yi2KPMBfeXRv0mR9N7hPxb/InOEViiooZWOnQbM0chYWsOoOPeYAE5erRkAdUsT0embWvM9NovT
	giZYN3XtXmR3/cHA3qF0fFKXLHzo4JtKYhamEhL51UguUaVRSdnP/HW6cCNxKuvpd2thSlcRGFv
	WySFvJiHGRHMHiBV7fbZYtEg8nhOHAIWy/NbtWfG9jlKzpRn2jeKXHI842k1zU7SaiFTKg==
X-Received: by 2002:a17:903:2450:b0:2c1:ed61:36ab with SMTP id
 d9443c01a7336-2c7e1538eb1mr8422395ad.19.1782254795349; Tue, 23 Jun 2026
 15:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622143557.22955-1-leon.hwang@linux.dev> <20260622143557.22955-10-leon.hwang@linux.dev>
In-Reply-To: <20260622143557.22955-10-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 23 Jun 2026 15:46:15 -0700
X-Gm-Features: AVVi8CeDV0iyWUJxT8tqR7wuW7mpOknFgq_TU9la-Qich4uiJgyQft90YUTPtII
Message-ID: <CAEf4Bzbmj-ekwYQ6oGW-BRnzLBDvWgLyn_QsU5g1yNt_8A0H3g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 09/11] selftests/bpf: Add test to verify
 accessing rdonly percpu_array
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 7:38=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> Since percpu_array supports direct-read, it should not break accessing

what does "it" refer to here?

> rdonly percpu_array.
>
> Add a test to verify that adding '.map_direct_value_addr' to percpu_array
> won't break the case.

what case?

I think you are testing (read-only) direct access to read-only per-CPU
array, is that right? Just write that out? Though, really, negative
test (we *cannot* access read-only per-cpu map for write operation)
would be more trustworthy for this...


>
> Assisted-by: Codex:gpt-5.5-xhigh
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  .../bpf/prog_tests/global_data_init.c         | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/global_data_init.c b/=
tools/testing/selftests/bpf/prog_tests/global_data_init.c
> index ea7e4e3d91cf..f59d83919058 100644
> --- a/tools/testing/selftests/bpf/prog_tests/global_data_init.c
> +++ b/tools/testing/selftests/bpf/prog_tests/global_data_init.c
> @@ -232,6 +232,48 @@ static void test_global_percpu_data_lskel(void)
>         free(online);
>  }
>
> +static void test_global_percpu_data_rdonly_direct_read(void)
> +{
> +       LIBBPF_OPTS(bpf_map_create_opts, map_opts,
> +                   .map_flags =3D BPF_F_RDONLY_PROG,
> +       );
> +       struct bpf_insn insns[] =3D {
> +               BPF_ST_MEM(BPF_W, BPF_REG_10, -8, 0),
> +               BPF_MOV64_REG(BPF_REG_2, BPF_REG_10),
> +               BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, -8),
> +               BPF_LD_MAP_FD(BPF_REG_1, 0),
> +               BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, 0, 0, BPF_FUNC_map_lo=
okup_elem),
> +               BPF_JMP_IMM(BPF_JEQ, BPF_REG_0, 0, 1),
> +               BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_0, 0),
> +               BPF_EXIT_INSN(),
> +       };
> +       int key =3D 0, map_fd, prog_fd =3D -1, err;
> +       __u64 value =3D 0;
> +
> +       map_fd =3D bpf_map_create(BPF_MAP_TYPE_PERCPU_ARRAY, "percpu_ro_m=
ap", sizeof(int),
> +                               sizeof(__u64), 1, &map_opts);
> +       if (!ASSERT_GE(map_fd, 0, "bpf_map_create"))
> +               return;
> +
> +       err =3D bpf_map_update_elem(map_fd, &key, &value, BPF_F_ALL_CPUS)=
;
> +       if (!ASSERT_OK(err, "bpf_map_update_elem"))
> +               goto out;
> +
> +       err =3D bpf_map_freeze(map_fd);
> +       if (!ASSERT_OK(err, "bpf_map_freeze"))
> +               goto out;
> +
> +       insns[3].imm =3D map_fd;
> +       prog_fd =3D bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, "percpu_ro=
_prog", "GPL", insns,
> +                               ARRAY_SIZE(insns), NULL);
> +       ASSERT_GE(prog_fd, 0, "bpf_prog_load");
> +
> +out:
> +       if (prog_fd >=3D 0)
> +               close(prog_fd);
> +       close(map_fd);
> +}
> +
>  void test_global_percpu_data(void)
>  {
>         if (!feat_supported(NULL, FEAT_PERCPU_DATA)) {
> @@ -243,4 +285,6 @@ void test_global_percpu_data(void)
>                 test_global_percpu_data_init();
>         if (test__start_subtest("lskel"))
>                 test_global_percpu_data_lskel();
> +       if (test__start_subtest("rdonly_direct_read"))
> +               test_global_percpu_data_rdonly_direct_read();
>  }
> --
> 2.54.0
>
