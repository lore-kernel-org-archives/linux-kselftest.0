Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352354611CE
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 23:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774998329; cv=pass; b=Au876nAz6vM7Tz+I1ZXA+of/Hh3alSo6rRveTUkULqZG+Ib1NCqsPZ9yBvHNfsnkug6CrTSq8AP6o8/4Pc8Udk04Yy+unn7tF1AObXmvsbwihKnArIRmwc4nSVh/rL8hgPLGh/dI0mqsA4q7MYEkuInxfM/I31upZMl9au4pRfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774998329; c=relaxed/simple;
	bh=ZRBwVsvWBGXOq+iTHCWqU+jdlHSTlRyRad0MwMeHrsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZaGOLTn84b27G/iRP2xPKdI2x3LaFeRt1pChn4Ca0ZSB++2Hfcl96T0JrG3sa6k1utllntCANq0ZFVkHWjK4juTkmb8NuBhX096JB90xll2GSISQjUebopIgQRFTf054m/T7SG+jUfcGPJY48lSs8CMqlRuHEdpxyA68upn6xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROxYsrh8; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROxYsrh8"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35da01fc0baso2040713a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 16:05:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774998327; cv=none;
        d=google.com; s=arc-20240605;
        b=ekuB63o36ncmB4OHPpMVHjwNmAsBlgvUdanPMvV617Glip6nqIwU2MIkWkVnzhclfZ
         lzwmGPaCE5CggBbY18yf1rIF7m3Wy2Co3rKB6k9geGoLi6JbmJStSURmnrfJWGS/VHdA
         pqR+9OUhMbnhf3RepD8+rsJmjzN/1AOqSUta9a0iyYbWjRVKak9hB8/YdelIEr0B461y
         DnoD6vOGEt9SeJTRJODM17xcwQegpRWUDito/wl4FFT7hYs8adfVpN62i5D1L3yw6ha5
         X+7qxERZPVHhfnlMXYjA7u5aJ59css852LBH8qhmiisuZd7+8SVBuR1hHDA3SCjZVH0z
         fK9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f3T3MWARWKqErIQsg+XxtK4/lTcCCgWEPLRVpEoVfeE=;
        fh=kJwmG1IgWc46gu+Nb/Lw29jArxd4JPWZJ+5rQJQWylc=;
        b=CcPV4cOTSGydOxS5yn4l7eqa4I70xv8sP69Zv5I0/WZ8XZFo1eWK/SocaOK4qR2qLE
         LXkPzb0vctTsLLcsdtyX1QmbRM2RmMHlbIZup83yT+umL5OmiOmq2ZhI8XgOB4H2Qkv3
         yucSiUA/nYjjQrVAw93t/6ch/HmJewPjzdyGdq3np9Wv+lqoFeR7ORniZGuH+QZuCBoY
         q6azYrxRz8RbGrbndo+cw/7noXG/KmyowcrXcdeb+oOgmaJVtpfqEffmkuKEUSHnLQOb
         bPzS/110TPDmp6XopCNoTsyY7rgrliKPf7OTTQYtP/rk69x96GshGZqmusU0QkjOyccx
         DKFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774998327; x=1775603127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3T3MWARWKqErIQsg+XxtK4/lTcCCgWEPLRVpEoVfeE=;
        b=ROxYsrh8331gfNCAROsriYe92mf+ocsRtX0dJHMcIvXz9f98xfwFt4AFeeCYqjRVu9
         sUAfqH/hJseeU3pSB6DPQ8suQgutSAah0VcqMVc0CR8LkxsdaeDBzEgCOtyFUV3eKkAS
         Za8axVJDD9O9Z2z4+XCKwf+tT4apB+97HA8C3n19T4v5ImusIY7qeGDgK4D089Xuww2D
         MYjAWXeoOnsj2sWCj1J9xZWXQMnvsJOoNPkmI2fX4WAWQz4Q96R5HgRXz5PM3kFtinhU
         Ts5CaMckEDLPpGdGwo0NvoHTQu4YVaulsshQXdUXPQvHttEG23F5Uyj5avAtJ6wsCz9N
         mNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774998327; x=1775603127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f3T3MWARWKqErIQsg+XxtK4/lTcCCgWEPLRVpEoVfeE=;
        b=SC43euwSPmjZ0+iCAQUDquGCk6zpcaecbl2MlgJfasmf4v4kNxUq0wbkTOdV+a1g7I
         AsfEp7SpxLVmN/9/tCKBYLG1EtOhklkOcTbe7GRTcvo5h0mSy8Hbfq/a2kREUqknKV8q
         HX75dSvMBAta6uywKmGj5EfCRZ8xvAgZgDkhsR9bSmevLhVrXcxIu/3wbC0CDNTQcyl5
         sUtGn5ryDZMn/4vkrDtaMwf20041v4E0rsA1Z4pLkhmynTiM5/38+MS6p38pO/tuuoXo
         ggyqPou5l7C1yqqAa8x9cN0HCV0epf0GFOoM/Ida0nJ7g5ohYpwbmn5vFQ8ghzdMsklU
         EAYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFs0yzSH4Wjdq1U0nfkRb8QE59TTOXYBWzRsay35olmA67prL6WMast22wT5kapAclXjYRJtXiomw3Y9vpcpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz344E+3l8uoWpb32FtSlbxR6L3wVXS328gM8kbPw/RrIqHLRGs
	AKWQEhKIUCvzYD78v8g2sqSbgAMhciZdcS6VTPsIL334sgzTIH/Lbu+gc162DJhaPhPm/tx2Ub1
	byYtX7bDvcGakh/BvMD6hiv2Oznmn0HQ=
X-Gm-Gg: ATEYQzy/4qNUZNzqdKqHsqYQQtkzmdfks6TNfAIqLSxRfxq97pxnNDsL/Y4ABDSCKb+
	fJWXpCg736MfRrWCBZ/xc6OI4tNXUAOY8x+r/xS5aR11MSRxAJY0TJCip99XnrCG+U75eY28Vhh
	fyl2CXvej+0i1x1ytjoZvuH+BaJpA5ttYDEyUBkjf408rlAo3dS132VPiDueGYotBdh0eJsvahd
	OHe0U7sCU9EmHCBURtPTS0jmp1M9QPrhNV9IZlUuEBiJFourBy+rwRqMzH16SbyUtu4ncxM63pt
	Ta01lQ0zmeLa7V+ZP07U+5o=
X-Received: by 2002:a17:90b:224b:b0:35d:997c:8ec0 with SMTP id
 98e67ed59e1d1-35dc6f5fe01mr1072369a91.18.1774998327494; Tue, 31 Mar 2026
 16:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331152509.70468-1-hoyeon.lee@suse.com> <20260331152509.70468-2-hoyeon.lee@suse.com>
In-Reply-To: <20260331152509.70468-2-hoyeon.lee@suse.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 31 Mar 2026 16:05:14 -0700
X-Gm-Features: AQROBzAAL-X_ypOSNrpdw3OWyXYdZVHuS5aWcVM2vwD7QchOby05JqtBjChZK7M
Message-ID: <CAEf4BzZGJ5A1t5GcU3kt_gK6uK2-mzqNvtuR9AMzpiyrgEvrUg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 1/2] libbpf: clarify raw-address single kprobe
 attach behavior
To: Hoyeon Lee <hoyeon.lee@suse.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Feng Yang <yangfeng@kylinos.cn>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 8:25=E2=80=AFAM Hoyeon Lee <hoyeon.lee@suse.com> wr=
ote:
>
> bpf_program__attach_kprobe_opts() documents single-kprobe attach
> through func_name, with an optional offset. For the PMU-based
> non-legacy path, func_name =3D NULL with an absolute address in offset
> already works as well, but that is not described in the API.
>
> This commit clarifies this existing non-legacy behavior. For PMU-based
> attach, callers can use func_name =3D NULL with an absolute address in
> offset as the raw-address form. For legacy tracefs/debugfs kprobes,
> reject this form explicitly.
>
> Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
> ---
>  tools/lib/bpf/libbpf.c | 21 ++++++++++++---------
>  tools/lib/bpf/libbpf.h |  3 ++-
>  2 files changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index 9ea41f40dc82..9083f542a3b0 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -11523,7 +11523,8 @@ static int determine_uprobe_retprobe_bit(void)
>  #define PERF_UPROBE_REF_CTR_OFFSET_SHIFT 32
>
>  static int perf_event_open_probe(bool uprobe, bool retprobe, const char =
*name,
> -                                uint64_t offset, int pid, size_t ref_ctr=
_off)
> +                                uint64_t offset_or_addr, int pid,

don't rename it, keep it as "offset"

> +                                size_t ref_ctr_off)
>  {
>         const size_t attr_sz =3D sizeof(struct perf_event_attr);
>         struct perf_event_attr attr;
> @@ -11558,7 +11559,7 @@ static int perf_event_open_probe(bool uprobe, boo=
l retprobe, const char *name,
>         attr.type =3D type;
>         attr.config |=3D (__u64)ref_ctr_off << PERF_UPROBE_REF_CTR_OFFSET=
_SHIFT;
>         attr.config1 =3D ptr_to_u64(name); /* kprobe_func or uprobe_path =
*/
> -       attr.config2 =3D offset;           /* kprobe_addr or probe_offset=
 */
> +       attr.config2 =3D offset_or_addr;   /* kprobe_addr or probe_offset=
 */
>
>         /* pid filter is meaningful only for uprobes */
>         pfd =3D syscall(__NR_perf_event_open, &attr,
> @@ -11816,6 +11817,8 @@ bpf_program__attach_kprobe_opts(const struct bpf_=
program *prog,
>         default:
>                 return libbpf_err_ptr(-EINVAL);
>         }
> +       if (!func_name && legacy)
> +               return libbpf_err_ptr(-ENOTSUP);

-EOPNOTSUPP

pw-bot: cr

>
>         if (!legacy) {
>                 pfd =3D perf_event_open_probe(false /* uprobe */, retprob=
e,
> @@ -11835,21 +11838,21 @@ bpf_program__attach_kprobe_opts(const struct bp=
f_program *prog,
>                                                     offset, -1 /* pid */)=
;
>         }
>         if (pfd < 0) {
> -               err =3D -errno;
> -               pr_warn("prog '%s': failed to create %s '%s+0x%zx' perf e=
vent: %s\n",
> +               err =3D pfd;
> +               pr_warn("prog '%s': failed to create %s '%s%s0x%zx' perf =
event: %s\n",
>                         prog->name, retprobe ? "kretprobe" : "kprobe",
> -                       func_name, offset,
> -                       errstr(err));
> +                       func_name ?: "", func_name ? "+" : "",
> +                       offset, errstr(err));
>                 goto err_out;
>         }
>         link =3D bpf_program__attach_perf_event_opts(prog, pfd, &pe_opts)=
;
>         err =3D libbpf_get_error(link);
>         if (err) {
>                 close(pfd);
> -               pr_warn("prog '%s': failed to attach to %s '%s+0x%zx': %s=
\n",
> +               pr_warn("prog '%s': failed to attach to %s '%s%s0x%zx': %=
s\n",
>                         prog->name, retprobe ? "kretprobe" : "kprobe",
> -                       func_name, offset,
> -                       errstr(err));
> +                       func_name ?: "", func_name ? "+" : "",
> +                       offset, errstr(err));
>                 goto err_clean_legacy;
>         }
>         if (legacy) {
> diff --git a/tools/lib/bpf/libbpf.h b/tools/lib/bpf/libbpf.h
> index 0be34852350f..f75f3ab0f20c 100644
> --- a/tools/lib/bpf/libbpf.h
> +++ b/tools/lib/bpf/libbpf.h
> @@ -557,7 +557,7 @@ struct bpf_kprobe_opts {
>         size_t sz;
>         /* custom user-provided value fetchable through bpf_get_attach_co=
okie() */
>         __u64 bpf_cookie;
> -       /* function's offset to install kprobe to */
> +       /* function offset, or raw address if func_name =3D=3D NULL (non-=
legacy) */

legacy mode will be useful on very-very old kernels only, let's not
distract with constant mentions for "non-legacy", please remove
"(non-legacy)" here and other legacy mentions above


but also, while you are at it, let's add a proper doc comment to
bpf_program__attach_kprobe and bpf_program__attach_kprobe_opts APIs?
That seems like a more obvious place to explain name+offset and offset
as absolute address behavior, IMO

>         size_t offset;
>         /* kprobe is return probe */
>         bool retprobe;
> @@ -565,6 +565,7 @@ struct bpf_kprobe_opts {
>         enum probe_attach_mode attach_mode;
>         size_t :0;
>  };
> +
>  #define bpf_kprobe_opts__last_field attach_mode
>
>  LIBBPF_API struct bpf_link *
> --
> 2.52.0
>
