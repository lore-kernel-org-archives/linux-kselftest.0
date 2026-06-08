Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307BE35E1A0
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780942460; cv=pass; b=Ha7IpGyeUgWgjKS2tmf7R2jpqfdGnIf6TH/4dkUDEcs7lKJ6WJlqueXXNIqa5PXMCeqMO13kOHlezdznsk/xa1P8KV+sH1skd8HJRLKhc+c6WP1LohvgWEte9vHHkcA7/u4YMHVRMgaCfckZQdnFGufAIUNCpXV3D2MoHXvpu5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780942460; c=relaxed/simple;
	bh=cdobpiwLWv7oVVX/pldaFU009Uk0NSg+Z2E2eK4qo7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMGgoE7NB9uToa7CJoBfLygAyK5RyXTnlv/ehju2HINXZkGS1fTztlJGJxojWcXloZxNS2P0Cyu8XdU9g+MelZpHdJZYW/eMUUBb6zNBl/BFaqlg1WNa36aPP2TojtAQ+YoKcADyJyIMLLh4oYfp+9DkuHO6OvZVD9dN7xKmYIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUPy1lFt; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUPy1lFt"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c379e8ffso31628405ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 11:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780942458; cv=none;
        d=google.com; s=arc-20240605;
        b=EyBteNfeSm+95Zb0zsZzTwdBK2id+6AnqEVSslV/58zsVnExZaXYNhObryxbwrJOdz
         SWzUom/J7cizFRv5xMwC2O/rcAwLQcQ0fiESzWta/cBVH8Jud6+ufGjBWejQu2Ukej2g
         zvQ5nhaiCt4tlaGlIeCuxoeem7b3h+8D5w4Orh268uYljWZ04msXK4SkCD0BsDAqI7KO
         LhVsVK9WYqYhWxkaujK9glgGeizI/5rEQK606oGMWwizK44Qntnq0QuWUjGClHx7PczM
         Qo5ui7NNnDgSmqz8YTRcG+ZOdRI4kiIm+bKSC3Tl37ER9xN13qSxNBqCsocYz3smJqUL
         4l5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bLVgW0YpQ2LvPnx562WBAcfO+Acupv1Ug4Sxu3bRE0k=;
        fh=EZHSYcmj+B2zgcjb9VCqOhMWl9jERhuWu1krFKu3z0U=;
        b=IdV6KaWrseO4M/TC2QwQU1HleUCqR9LJDV+dUIe3AXUEia7I0igfY14X3BdfFh+4CO
         Hfpg+fJSvYOtRv4oB4vLtt5iiLhhzOLiLQPBFUPITTTa6I/5U2ZmwSjZUqqqy7vugLHX
         Yy2viC0IrWpNEq/oHKbEUA+tiyaDabQdTQkIJzACKewg3aq8j1Y+yXxI7BtNYF/XAgb6
         gsV+WBlYYDZ0JQ2HYufNDltIf19ydH3cnA6GAUPxPgZSIoI5d1vYMbC2/xVrE9Thb9QX
         gHA5lbOTviIahlm2zv+R+L+7EcQ3aejHm1CKh/SclPCN1QY2EGcIN4AGF2nDvmnfKJWc
         u6AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780942458; x=1781547258; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLVgW0YpQ2LvPnx562WBAcfO+Acupv1Ug4Sxu3bRE0k=;
        b=CUPy1lFt2e62Q3gx3DrcJT8CL7ht1lt5Cqb/ppN/yOepqEoKTejdWxMU4SH/r2TWkF
         7Ju6SAvv0unNQTWDoio4oeQ9tdyUhmJaqf+iAcJ7oCNKy6URZB0Ib9V1x8rJcTwv8uf7
         MmReM+YFzR28VzN43fJSSCMSJn2TpPbL4vK74ZioYRuKO16N06H8aU2oRrobm7Pco1eh
         4e90ZiGmna7jobG8/e3f0zO7E1y3S9QSRKVnXw9ZkF0CExzmbXQ8Q6Fhp3w2MrKBi3Dj
         /+Z1KoUjTas+eqq13ylQwJ1DPZM5hmeZpUQ45EHfc2SR9fMNh1CDwVNJo8K2Onfb/8cN
         6Oyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780942458; x=1781547258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bLVgW0YpQ2LvPnx562WBAcfO+Acupv1Ug4Sxu3bRE0k=;
        b=d4F1cXo14sGQLpsOR5oiMAIhtUOy9BYyLOWHZbKSqXVtt6NlMEEglbmYLmNEk0qdNB
         4wsppD/o9uK8lVBfZlfo4qYo37yDwZOjdqWO6z02SgHKsA1YrI8z63M2/IuOYLHhq/2e
         sBUBs+4kMcDD8K8e8v7cc9XKuXRJmnb6GyJXYR3O3oyn0VptCfwvDv3thGkLos7b4q0Y
         SdWfCtQze30r9vmzWr8R/sPxiOKb2CuHc9cPCF4fPEI4td5xWs5FKnEkxduMssp02wK7
         JrEOCOaLEykRp5jdxNj2NqIyMbxlV8EiD5DIRzbW1T9zCidSlRm6QYEsQGl7rrnzbBXk
         T92g==
X-Forwarded-Encrypted: i=1; AFNElJ/CNZy/Ud3GpOgDtiBafpNUxb0lwPe2n0ORv1olrV2OYE2UorXaI6HHlCFZwYlZ3825E8cATT/wz3Fdyrnrir4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdNg7/b41E2/2IOwMJW1cBNcn+Te5EW5mdESX6ZmKF9UtpHwyW
	yQHOdFDiLBGRAVzeQl4CGKhzC1r0sgNtScnrHcrbQ05FwuKAjKCKmxpPi6eFHRGdIf38hM+synV
	UnquxrbQaZ5n+6kbFqMM5Yu4ruPap8DA=
X-Gm-Gg: Acq92OG7UfPHfHkhYdcdKKQDNbvUJL3S8+OkeGIzOY+Q+jKTuMSO49dYKUQQbQveKiF
	BTG9abxvxmQt2nXt6noItA0pmn50IgqDvQgmJ5AuJC3UoH+f+f0pAV5/ZK9NJNTt8HhvdLSk0NY
	voyBG8eD8Fqhugwnf6mkCp1XCmQVrNqibznZV2JNopE6C6wV30hNO5/F1SsCmaGQVrEtQ04oMFW
	W3qEdDlEwHvK5b5mqAN/cnh8X186O/ifgSOawEdROBjwT5VrNAZ7kFV6m5h8fBzUpMSNpN3Lc/c
	Ai+pgszCje9C+iPZF+pr2NZC190mfYE6hn2ydygl1fHnl/84gWBIlsHwV7rBXIkjgKhJ+oohrxj
	P5s5iRMBwZk6++3Z0cPZr6x3mUg==
X-Received: by 2002:a17:903:1813:b0:2c0:c262:b919 with SMTP id
 d9443c01a7336-2c1e78e4e97mr111388825ad.5.1780942458521; Mon, 08 Jun 2026
 11:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529031604.888137-1-chenyuan_fl@163.com> <20260604031033.806727-1-chenyuan_fl@163.com>
 <20260604031033.806727-3-chenyuan_fl@163.com>
In-Reply-To: <20260604031033.806727-3-chenyuan_fl@163.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 8 Jun 2026 11:14:04 -0700
X-Gm-Features: AVVi8CfeHqtpS-HGlLc4glXkts_Xp6ARPR9VGj-S1X4pyp51n5kXFrLsUu96gpI
Message-ID: <CAEf4BzavhAkKLdmsZLd0r0bUd-B1XKS6a+Ec9xfqaZVZNiu1UA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/3] selftests/bpf: Add ARRAY map type to
 token tests that use struct_ops global data
To: chenyuan_fl@163.com
Cc: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	chenyuan@kylinos.cn, daniel@iogearbox.net, eddyz87@gmail.com, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 8:11=E2=80=AFPM <chenyuan_fl@163.com> wrote:
>
> From: Yuan Chen <chenyuan@kylinos.cn>
>
> obj_priv_btf_success, obj_priv_implicit_token and
> obj_priv_implicit_token_envvar use the dummy_st_ops_success skeleton,
> whose struct_ops programs reference global variables backed by ARRAY
> maps.  Without BPF_MAP_TYPE_ARRAY in the token allowed map types,
> bpf_object__load() fails because the kernel rejects ARRAY map creation
> for global data.
>
> Add BPF_MAP_TYPE_ARRAY to the token permission mask for these three
> subtests so their skeletons can load successfully.
>
> This is distinct from the libbpf probe issue: the skeletons genuinely
> require ARRAY maps for their global data, not merely for probing.
>
> Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>
> ---
>  tools/testing/selftests/bpf/prog_tests/token.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/token.c b/tools/testi=
ng/selftests/bpf/prog_tests/token.c
> index f2f5d36ae00a..1812de87bedb 100644
> --- a/tools/testing/selftests/bpf/prog_tests/token.c
> +++ b/tools/testing/selftests/bpf/prog_tests/token.c
> @@ -1214,7 +1214,7 @@ void serial_test_token(void)
>                 struct bpffs_opts opts =3D {
>                         /* allow BTF loading */
>                         .cmds =3D bit(BPF_BTF_LOAD) | bit(BPF_MAP_CREATE)=
 | bit(BPF_PROG_LOAD),
> -                       .maps =3D bit(BPF_MAP_TYPE_STRUCT_OPS),
> +                       .maps =3D bit(BPF_MAP_TYPE_STRUCT_OPS) | bit(BPF_=
MAP_TYPE_ARRAY),
>                         .progs =3D bit(BPF_PROG_TYPE_STRUCT_OPS),
>                         .attachs =3D ~0ULL,
>                 };
> @@ -1225,7 +1225,7 @@ void serial_test_token(void)
>                 struct bpffs_opts opts =3D {
>                         /* allow BTF loading */
>                         .cmds =3D bit(BPF_BTF_LOAD) | bit(BPF_MAP_CREATE)=
 | bit(BPF_PROG_LOAD),
> -                       .maps =3D bit(BPF_MAP_TYPE_STRUCT_OPS),
> +                       .maps =3D bit(BPF_MAP_TYPE_STRUCT_OPS) | bit(BPF_=
MAP_TYPE_ARRAY),
>                         .progs =3D bit(BPF_PROG_TYPE_STRUCT_OPS),
>                         .attachs =3D ~0ULL,
>                 };
> @@ -1236,7 +1236,7 @@ void serial_test_token(void)
>                 struct bpffs_opts opts =3D {
>                         /* allow BTF loading */
>                         .cmds =3D bit(BPF_BTF_LOAD) | bit(BPF_MAP_CREATE)=
 | bit(BPF_PROG_LOAD),
> -                       .maps =3D bit(BPF_MAP_TYPE_STRUCT_OPS),
> +                       .maps =3D bit(BPF_MAP_TYPE_STRUCT_OPS) | bit(BPF_=
MAP_TYPE_ARRAY),

Hm.. ARRAY map is unprivileged, you shouldn't need this. Are you sure
this test failing for you is not a consequence of the issue you fixed
in the first patch?

>                         .progs =3D bit(BPF_PROG_TYPE_STRUCT_OPS),
>                         .attachs =3D ~0ULL,
>                 };
> --
> 2.54.0
>
