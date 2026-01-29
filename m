Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352743446AF
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 17:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769707308; cv=pass; b=IB8m2RZNShaQMbEsPua7sTipSqRLXleRhsPXmKz6vSie555W1VIJDwgUTEJAX+wKuf9zGuR6m1E8SsvD8VQfSC5mgzbAzcizVwyaeWR6xxJjbToh3ni0n7uVrsFWdeKFKjJJgrhI95XWHKOve3K+a+nqDUaL9FaLCRLWHMNlN+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769707308; c=relaxed/simple;
	bh=B/Z6oc7nhVZLZTSl8l3OJXcNI+VHpZ9v5E73ZIi4/a4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5utKvrY6JQ1DiY8muApLVAATWTnf0kmSCfqASTxo0CARWfu8A7wGJ6gKsJbp/eW7xJK0IQlrZngJxBpbDSNxJzqejatCeTGM0J93vNoGEABd6dcdhatvGnJZoWusiKUobr+YbIE2569SrdfC1bXKeq6NokfUEUt7xgpLaXZHZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqTrkf07; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqTrkf07"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4807068eacbso10527295e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 09:21:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769707303; cv=none;
        d=google.com; s=arc-20240605;
        b=GFqrqXSSbrtFH9cGnSgseSxxOvmDcRRmlHFKleAr6aT06fmwKk1F1uGlmWrSL5O15X
         xsW3spSkcD5lK3mPvoTeQSu1+SpBtkhFKPVG5K+8H5SrSgViWHYDv8Z4kNpJ+6iSpgXF
         t/61Xrx8nlWYKl1umnFecR88mLgxnWsgs+9pr33h6ww/ljXnjuiCa32mUhK6rkJpKp2I
         EaDFuiQ9T1UwBmGu8wM4yI0yi/zOiKLd4LcO4XynMnmjfm4nA+7kXCWMS791gS0JqpQG
         bFH7CmwGKhT6X5CYNfp6aigLhncgM2LhpQVmiV/a05bpuwl+Z0EkTeCnHbbvc+u5Toj1
         X2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cikD0DW64ATmIS3V1f2k1Y72bgL6wosY2UHz3lIPFuY=;
        fh=HCAi+LAWC6ryf94Pn7JxvmKuxKqCnCF2rAwwIHUE7N0=;
        b=CShmqv5BgXj/d8s5iYNvVbcvAfxQDonSe8P+rzNkb8WUKWB1YZy0HoIrZNyM87U4Io
         0+K3JiajKRDqP+rtsi4LIMB4zNjenRq9Si9QzkVNKdrI05/nhHrQfkFwBEiCY6hRq5sR
         f29KDAfJKdiaNbyy6CRLrNJgiy98nw+AW+BHVjvCbnOP2e1bnXtR8Kf7xQIZ1Ng6X9o+
         lF7p1CDNbwFpwyRT906vpKLukCdbPuMvlCsAL1Q+a1uewgE6Ot2zGVL+1Sk2gDoW2/qC
         hfHbc6sXpEcLGKH/zvGL5A+ixUA2dHMZQhkoe5ztQytEjKZQVHp4d2ByRhuvOtiyXwv1
         P5Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769707303; x=1770312103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cikD0DW64ATmIS3V1f2k1Y72bgL6wosY2UHz3lIPFuY=;
        b=fqTrkf07A9uNBUvum5EirnKvylY3pj5K/5N766qDYR/JT0w/JKERfjgeKKb7N917H1
         jfFCd0wTlPOT35abzvp+U4WULNOKG6fz7FU5oN2zDG/gE1mYEqlyCGZ+1X+QqnfEVDxU
         Or6i+ZitZzrbXKmiT/2PgI1fSqnEWOCojDSz+aG0YOcv9lTR4wfgQpNU+ZlFsObrliF9
         9m2ylPy6sMBN4bGH9xqpUNjdUr6E7ddniahFrSJICO5Rg2jeB9E1fXnRNyAD/zHapSRb
         jUv2S50Z3BXJAWWmCs+NwGHhOyV14albsx0mlZ3fmARZ4Uz1fmgxIC+6acx4EADMzFs9
         3RoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769707303; x=1770312103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cikD0DW64ATmIS3V1f2k1Y72bgL6wosY2UHz3lIPFuY=;
        b=Sd8emoGYq/tJcYDNIrWMDe6UU/BHO53I1UH9N/zrdAs7H2tBqq3ZEyQX6pcsqTlqC7
         0qYRQz17Z+xM8rjO83Gpp/B/wanlLd7+RpsGeeqzabdw2O31eoH7Wi1M6hXqFtKdHGVm
         c7jVf3kxAikr8CsE3Svpo5fgn9bxas8mviN8fRWd2R3pfxRBHAJVbKDi5/wZJXp7/lgY
         jw73c/R8+jw653LjAP98CfZM3iUiDwpZaJbNofaexW922CQjzKZXKcMgR5YlhdngGSvv
         m+T4926oUdmK7pesf2U5fsTOcuDrM0u2GG05IKLlYWbhfCuaA2vXQ9faUNGtTMd7gaxT
         9ldw==
X-Forwarded-Encrypted: i=1; AJvYcCXhYPvPrN2tn8rW0QSVHbIPBYjbczW/UB4Vo0Dus/WmoIuPrmfCI8+lLiyPaF9eU0c698QaTvkix/b/mBlkQOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzElIst3JXKlWQUwIGGcSmHaABTm7E/RXnlPVwA3d0y1QFxDbxx
	tKABHo1Y2hCaNzoHxtc/Z1QVZREWhYYYcPU0J1NHJrtwesR9jtTgWdaKEb9mQNnHcmUkAeDE+kE
	psGJQvxiJ67cyGnyaA+y7Zv3+t6q5REU=
X-Gm-Gg: AZuq6aJikCMGlrWhAoVJcUku44aLJlCvHcdAtFizrf64VmSqU2hbU/oYb3kiToP0yDo
	HoC4X4lM46iKLw1z2iDCKTjPtKOSxdmufsVogVGgQ25zTPpdEhjjs7dKpxKgyJtuMcSGHyyZYs/
	BDqZGmE0QkTTvLlw+qfhfMwkZRdgmxwzTpKMcLIgiip5fdKSaS0PFyw5qfsOA7zoj0sGiWrFYK8
	M5knoJzuKzRo/tPGWXO7qvqwXOsEW/uNGhpoxkb5buBv1RsDTaRER+8IETsRQDDu+BG3/kO9fU+
	YjiFc3TU8xpUz7+iOfWKR2+Twy4+N27S1jord6/cz27yLcFqKbXNVdS7d9oNqJ8PjUWyR8lq
X-Received: by 2002:a05:600c:4ed0:b0:480:4a90:1b00 with SMTP id
 5b1f17b1804b1-48069c69584mr116465305e9.20.1769707303333; Thu, 29 Jan 2026
 09:21:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129135426.93424-1-changwoo@igalia.com>
In-Reply-To: <20260129135426.93424-1-changwoo@igalia.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 29 Jan 2026 09:21:30 -0800
X-Gm-Features: AZwV_QieIcsJO1VA71VFB7TRPCNl-paSdxCtbBMb_Zd5Q7mc_krsW0CoTdbFns4
Message-ID: <CAADnVQL2huFSNAn4Pkbx2GOqAB=Z-rtd+Fp3BnJTZ-tbzOhgmw@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: Make x86 preempt_count access compatible
 across v6.14+
To: Changwoo Min <changwoo@igalia.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, kernel-dev@igalia.com, 
	bpf <bpf@vger.kernel.org>, sched-ext@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 5:54=E2=80=AFAM Changwoo Min <changwoo@igalia.com> =
wrote:
>
> Recent x86 kernels (v6.15+) export __preempt_count as a ksym, while older
> kernels expose the preemption counter via pcpu_hot.preempt_count. The
> existing selftest helper unconditionally dereferenced __preempt_count,
> which breaks BPF program loading on older kernels.
>
> Make the x86 preemption count lookup version-agnostic by:
> - Marking __preempt_count and pcpu_hot as weak ksyms.
> - Introducing a BTF-described pcpu_hot___local layout with
>   preserve_access_index.
> - Selecting the appropriate access path at runtime using ksym availabilit=
y
>   and bpf_core_field_exists().
>
> This allows a single BPF binary to run correctly on both v6.14-and-older
> and v6.15-and-newer kernels without relying on compile-time version check=
s.

See.. with bpf approach instead of kfunc this new helpers
can work on old kernels without backporting kfuncs :)

> Fixes: 4b69e31329b6 ("selftests/bpf: Introduce experimental bpf_in_interr=
upt()")

fixes tag is not appropriate. It's not a bug fix.

> Signed-off-by: Changwoo Min <changwoo@igalia.com>
> ---
>  tools/testing/selftests/bpf/bpf_experimental.h | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testi=
ng/selftests/bpf/bpf_experimental.h
> index a39576c8ba04..0194c0090e50 100644
> --- a/tools/testing/selftests/bpf/bpf_experimental.h
> +++ b/tools/testing/selftests/bpf/bpf_experimental.h
> @@ -614,7 +614,13 @@ extern int bpf_cgroup_read_xattr(struct cgroup *cgro=
up, const char *name__str,
>
>  extern bool CONFIG_PREEMPT_RT __kconfig __weak;
>  #ifdef bpf_target_x86
> -extern const int __preempt_count __ksym;
> +extern const int __preempt_count __ksym __weak;
> +
> +struct pcpu_hot___local {
> +       int preempt_count;
> +} __attribute__((preserve_access_index));
> +
> +extern struct pcpu_hot___local pcpu_hot __ksym __weak;
>  #endif
>
>  struct task_struct___preempt_rt {
> @@ -624,7 +630,13 @@ struct task_struct___preempt_rt {
>  static inline int get_preempt_count(void)
>  {
>  #if defined(bpf_target_x86)
> -       return *(int *) bpf_this_cpu_ptr(&__preempt_count);
> +       /* v6.15 or later */
> +       if (&__preempt_count)
> +               return *(int *) bpf_this_cpu_ptr(&__preempt_count);

please use bpf_ksym_exists().
It helps to catch missing __weak. This patch adds it,
but let's demonstrate best coding practices.

> +       /* v6.14 or older */
> +       if (bpf_core_field_exists(pcpu_hot.preempt_count))
> +               return ((struct pcpu_hot___local *)
> +                       bpf_this_cpu_ptr(&pcpu_hot))->preempt_count;

iirc pcpu_hot approach was there for a short time.
Like 5.x kernel didn't have it. It was per-cpu var too.
Pls adjust the comment.

pw-bot: cr
