Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6824D956D
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783707; cv=pass; b=pStXaHKvQchWitYjcxanBuggiL9gy79tNChXVcZ9bOzdGenoCbQ32LCj2cwV9cCzgNgWQYbecLGZ5brx2gR5/F3zNYKqImUdnPaQw9/hQMM0u1IV3tSVJdRf6jP7+GQIuLIUWGNGT4r7Zu0IJ9BjIZx5/KbTVAuC/V0dPr9aLho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783707; c=relaxed/simple;
	bh=R4Q9kST2fKyPZcf28pPVfrlZhTiZCMyaGq+/7TCxRsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5vABi9+RqM5hvZ3lhzvgc0g4b7hZ/up7qc5wQr7wsPWZuLiG8/dzJ1XpZU9/RgIPg861xyUs0jjdB7OYrZhNPq61fptl0oJhZ/inmocwUMZopJKMz3iTYW0r8JLDys5V8SNt4xeYCmg+fII9mEFelZ3uIad6DitzAhwPLvlH4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMbLnN97; arc=pass smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMbLnN97"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so26997805ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 08:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790783701; cv=none;
        d=google.com; s=arc-20260327;
        b=hhh2XuAhEIiQq4r9o8CqxLYTlSFcnnAigK3E3h8B4vysz5lqzE3HMdHrgP9siCZ21g
         EZFzkIPPGPyJYp1EgJl/s7f3l9AZUhiv9q9PM4WhKh8LD6w/1J5m+NDlRrdG5HzxDTll
         JVF2WJ3SYc6YzG18BPeNml36IEPyALsit/f0Ff9QohYs6ImXWWD79+b3vAogwklentd8
         AOt0vaVJuJxO5i3M8VeNrHg9MU024eI2aBQF8coNfwDaKKvMUDZA1RD9fJ9qa/ZvZ0dB
         Z1bgovznRTGV7chdSTUAOB6Dowq3tsaikkTN9Edid3sQw+Ukgjxuq7TJJ0nr5xMDl+Cv
         eBOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AzYpaD+uTPvrogD/aZ+s9EWcQbyRUEaKyQXD8umEsLo=;
        fh=ebkofVh/DY7/KS8HgbVmACF6AXnVlGcGJsoKpSuNL7c=;
        b=XxVZ3bopfbAheYf2kwfFIq/YfhGBS4dROGhzB7LTJj4O4H0b0mEu0z/B9DN6Q24mDx
         0LVnwFTNieS+rH8zwrFdP3g3tj3sAUReqsrZwluW/1IOg8NFPguLdvaJTZxh2dJCKj5c
         MOiIjnf2HNdcwBfkubh6oStRNt965v7HbRy/opx9frRgQtnyV7thBegID4QX5ZX8ff6P
         gXdRxKiYeF2+dK0UDard8A9QZ3KRirMl4RcvsaKLsZAOZNmadZUeOJ/vgCDipjawwYZf
         jqlFwBtEpzsQJwCDfLutXmawnUMlE/5KUhexYkwXyM53FhIzsL0mHV/oE2CKBr/A+3w7
         WnZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790783701; x=1791388501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AzYpaD+uTPvrogD/aZ+s9EWcQbyRUEaKyQXD8umEsLo=;
        b=FMbLnN97rof8pVyql3pYRF0Gnvk3EwNSzNWGM8bjHAtz48AKR1UWxjdTun8ocpEc96
         NbLDnKFHjYzcGithV5oWS7/bvGcsf8X2JexhWzw3siJRhK3Z6Evi/vMgCHcY8s3Fb9Rn
         hfxUz5tYIVkpAL14eRKXdUisTTjxIblU7JjhYC2/A0ZieSyvcqGSkQgioqKDD7mY7e/G
         Mr8lOw6m/mbtSAHq5HeKP0Xmg9hraZHkKiZuNGhpowqb9mUa7SdF3ihUcNV+FqzZ0JBY
         jPN/llR4kAkvQ3ai6NNCbbbeKY2BKVxmhq5ZI/TfEvchAzUlF3i9NxzUF/1zHrhFbS3m
         HgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783701; x=1791388501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AzYpaD+uTPvrogD/aZ+s9EWcQbyRUEaKyQXD8umEsLo=;
        b=B7Ac17UMYwIPXUMroTdy49CCiqHSeclGkuyYv0N5bdZ4QQ2ttNnQ2PxR5NXd0Hsi5S
         3UroDhh4vWc2vXfoQlyuhJawHHJQXXNbwr5A3WqUz65pd2jXEptOyodZcpIBpjlxMZ/g
         EW8IBzlDr5yshTRM4tWMyqEWkxYRZLmiAJ6IvyeLToQfVeyk89HMBiWqsumL1EgVa4JM
         UWyPeYACbPWPPGpc+Nr9waH4gQsVDPp3UjJf9DmKIT36bMwpewZS1EXMt3OXL+rygw0p
         +fVhoQcBWp6yvnWG3mAQXDaFLjEMZNEqwjYVyFhdJQCW0KO71aRZxhuek2xFBABLGfSv
         tdKA==
X-Forwarded-Encrypted: i=1; AKwUvBz936GpMO9EschTtqCwOy5UA1nxxOAF3JGyov2uQadI0wPwmSHqVFZFyoGGX/dM8+BLyUwcASMeOWBIfy6nohU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFzbOYkWeI3AB+rV5y6iCe7ojXQiehI5AJtCKOTfZw9MA7n1dC
	q2EiYtysou8vgwO5d3/nOGGsO7h8/IZn8ONGPNjnzkblTGde7yKfk8Mhj59A5cha3GziizGA3eF
	I2Qnt5Hx/gzKxP8/Pm9EzFWUPcnBKfpE=
X-Gm-Gg: AYBFou2oni/3X9nGGJNI0KVVs5Sl7tSLpbBY1lLFGq6u6SUlKPm7h629XId+RwPAy07
	YeX9VddQ9HcuGL1tWDucF2t2b3+CNjo5NTSd4SV3ksfGC5LlyEA+G9ZLVARkNuD2cArEMueaFLh
	BgIsLbjnmV8UB5YcknqSimGBBriScsLL4EpZ/OR0WrfT69hgaO52xQYGs0kUTb2CGVs8cvVdreD
	E5Kigq9l17vSeBrUthWAeo7qp1IoAu9COd693AqSXaAuNtPRVpcBoP9TWymLsbR5Cb4R/lJFNId
	mYAG04hDdz3mVBYnjnoGW3AFNMIRvQWZs4iUFhD6XwIkGS/+UCaQ2Bmw3H+3ZyNsp3QdJwqeXRi
	+e9H/42ESwvZKlkdV6Sv6gW/JqeRFIqoDUhE4dKSQmzayrA==
X-Received: by 2002:a17:902:f691:b0:2dd:c100:b2c8 with SMTP id
 d9443c01a7336-2e2e4b8b0b2mr15413965ad.51.1790783700945; Wed, 30 Sep 2026
 08:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-libbpf-btf-enodata-fix-v1-1-56dae4cab778@gmail.com>
In-Reply-To: <20260928-libbpf-btf-enodata-fix-v1-1-56dae4cab778@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 30 Sep 2026 08:54:48 -0700
X-Gm-Features: AclHuK91g6yBjzv5Wydmwd7HcTJSbYJJfGMPfHuF7wf05VbALjgbejhsjOtOctA
Message-ID: <CAEf4BzZDFm-RH+wj=Lf_7MQ6wVnYuNEyiEMGgpLm6uyqPEt0nw@mail.gmail.com>
Subject: Re: [PATCH bpf-next] libbpf: Fix struct and union zero detection in
 BTF dumper
To: Luis Vieira <luisflavieira@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 4:47=E2=80=AFAM Luis Vieira <luisflavieira@gmail.co=
m> wrote:
>
> btf_dump_type_data_check_zero() uses -ENODATA to indicate that a value
> is zero. The array path handles this sentinel correctly, but the struct
> and union path compares the return value against positive ENODATA.
>
> As a result, the member loop returns after examining its first member.
> A nested struct or union whose first member is zero can therefore be
> treated as entirely zero even when a later member is non-zero.
>
> Compare against -ENODATA so zero members are skipped while looking for
> a non-zero member. Add a regression test with a nested struct whose
> first member is zero and second member is non-zero.
>
> Signed-off-by: Luis Vieira <luisflavieira@gmail.com>
> ---
>  tools/lib/bpf/btf_dump.c                          | 2 +-
>  tools/testing/selftests/bpf/prog_tests/btf_dump.c | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
> index fa995c02a170..dbf9f17e4b37 100644
> --- a/tools/lib/bpf/btf_dump.c
> +++ b/tools/lib/bpf/btf_dump.c
> @@ -2474,7 +2474,7 @@ static int btf_dump_type_data_check_zero(struct btf=
_dump *d,
>                         bit_sz =3D btf_member_bitfield_size(t, i);
>                         err =3D btf_dump_type_data_check_zero(d, mtype, m=
->type, data + moffset / 8,
>                                                             moffset % 8, =
bit_sz);
> -                       if (err !=3D ENODATA)
> +                       if (err !=3D -ENODATA)
>                                 return err;
>                 }
>                 return -ENODATA;
> diff --git a/tools/testing/selftests/bpf/prog_tests/btf_dump.c b/tools/te=
sting/selftests/bpf/prog_tests/btf_dump.c
> index fe04a955d46c..dd1241fcdb01 100644
> --- a/tools/testing/selftests/bpf/prog_tests/btf_dump.c
> +++ b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
> @@ -886,6 +886,11 @@ static void test_btf_dump_struct_data(struct btf *bt=
f, struct btf_dump *d,
>                            "(union bpf_iter_link_info){.map =3D (struct){=
.map_fd =3D (__u32)1,},.cgroup =3D (struct){.order =3D (enum bpf_cgroup_ite=
r_order)BPF_CGROUP_ITER_SELF_ONLY,.cgroup_fd =3D (__u32)1,},.task =3D (stru=
ct){.tid =3D (__u32)1,.pid =3D (__u32)1,},}",
>                            { .cgroup =3D { .order =3D 1, .cgroup_fd =3D 1=
, }});
>
> +       /* nested structs with zero first member and non-zero second memb=
er */
> +       TEST_BTF_DUMP_DATA(btf, d, "union", str, union bpf_iter_link_info=
, BTF_F_COMPACT,
> +                          "(union bpf_iter_link_info){.cgroup =3D (struc=
t){.cgroup_fd =3D (__u32)1,},.task =3D (struct){.pid =3D (__u32)1,},}",
> +                          { .cgroup =3D { .cgroup_fd =3D 1 }});
> +

can you please split selftest into a separate patch and send as v2?
the fix makes sense, that missing - is definitely a typo we missed

pw-bot: cr

>         /* struct skb with nested structs/unions; because type output is =
so
>          * complex, we don't do a string comparison, just verify we retur=
n
>          * the type size as the amount of data displayed.
>
> ---
> base-commit: ea9358e1270ab2c3ba6f36bd9bdda68617665516
> change-id: 20260928-libbpf-btf-enodata-fix-ac6381645ab8
>
> Best regards,
> --
> Luis Vieira <luisflavieira@gmail.com>
>
