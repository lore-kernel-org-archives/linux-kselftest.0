Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9C02AD25
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 00:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917231; cv=pass; b=TCNeG03VDG1NPt6TPrvfFgEAq7QN/M6tjMAVWztaJJ1OFODVqEO5BddMOy68S3RUOaw4TzGPDUHhDjMCQPTkU30emUUTMy8eWqxG+l1/prNuRPwjNuINI46p+EsmnFrhXtSh3hePJIhGGa2wy7bo5pNUVMjVg/A652u1gAqWpJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917231; c=relaxed/simple;
	bh=3r7e3r4k+an8dotsHliX2p8tDzzKOHNuJPjrdQ41iok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHdjksVxy2gjrKkVEUEuXWX1tqf5LfuIvaxvDpi7OEvM6UL2oANcpEDVTUm65K7wSdkT96dsqRvC1F32Yxo0CBR0iZ2UDnBk+KJ/pj2qRbcCxwMctQLxaZJ3zHZa16yljTA92sX2rR2BNjOn6vtVUWyTS840M+jpvB2YVsqvUmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgchNN9A; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgchNN9A"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c76b070f109so164870a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 17:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774917229; cv=none;
        d=google.com; s=arc-20240605;
        b=IWltVTKsjmOhYo4py1Byjz+C1ZWNYCnzYpb8vuXSBQJ6rg9TMiiECs0j+GttqyQvEX
         7cuu91NLGiI28tkioVDZVUYH4KIRNv2nlRBL2rucmLPJljBsZ+aehjKmXi5G09ChYcuX
         cyLINNZc1wfZvuqS2HrmFsKEl2JKQ9ATxT7Rk0+sx4Zj9rWDdTmeuZzfFhvC3p5nt3SG
         PNqy6ya9te3f5VyTAVkSvRgDKGIvx70mRpme9yN5aAK+q0KqhlsLCCC2wS6LIAwwn+i/
         ZvD0L5MLb2b/QhH7CrxwhvHvFgWC3YVtsDp7tREVxvexvCvVl/Ufw/jCZVp+Roblo6k4
         pdPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HyPuCoaWM4tfJKswp+j232gRvFvxxGCAqiUvJLgWyNQ=;
        fh=3jcXP8zUmgAfdk2pGirAua89ovTDLvvby+lepOHwY/c=;
        b=Eu3IFFhK2WjxmZSco1SpJllq/a5jDvwDD1hgfCex0QUWt5Wrbznx2wFwEj+NDqZt0s
         bnjQpV0zhHsQmD86ARChOS5ejap4JhkB19Z2TXm7sQdsCypbcQK0o59+CZ5qkH8fSUDh
         ElMuyxZR21MwASdnq++AP5GnBR7lvydjSHFbIYAn4vfwGvWOHE1fxniPxq6FivV/YifM
         n/Q/ZBjdS3nWaSx31mURf1W6XX8DS354xoLqEPf7NzCg7lOtcEBjBO/M1EnZcuAPvbzu
         RrBPAImrk15eMLU4Mb7ynWKuMemLbSwVHJiEhGBBW6mcWQKxb60C25GZckqdiGXJsTT4
         tzPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774917229; x=1775522029; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyPuCoaWM4tfJKswp+j232gRvFvxxGCAqiUvJLgWyNQ=;
        b=hgchNN9AksSDgaK4LBGoUUK+p+LM9dkxtuKxX5krt/VMq/7eoleVoUCMn52Qp65/lG
         Tv8ikdQPi44pxfIHeZi1tX0F8YVNA4M1Ba+yetwQaGsa3NKilv3U0tEIzY++Hn61lwrY
         TZCwnIOxD+sNjB/mxWpP3+NMR5Dy9dvvTBSypBibMn+6Z+hYO1T6L1CoQO1mrUoZ2u1Y
         KyXDUOc6Cv26RX/o915nmgf4EuuB6TAYtr9k61pktq/NtN3LG9LWFbJWJgvh1I/+dpT4
         SSkMHNcYV38fyTRCkezFN4vXDsJiytkadaGrTaqpObaLGh0qEYLWslrYG9H+Lkwej7FU
         /oAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917229; x=1775522029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HyPuCoaWM4tfJKswp+j232gRvFvxxGCAqiUvJLgWyNQ=;
        b=ieVlJPQU+IjjVuLsd/NfNqTlIfkE4ibKi0qnntAcexDbkzQSxIuyBAcvr/MmPVGbY1
         GqCH0lz35Pc2OXAquy6uBnrAK8mJymcJXv2MbZJLRqAaDOKHvcYlZctuPyayacJckhca
         7+H02GRz6druwKQ+sxEKvgZqu6w7lotTWuQRz+WdcFKY4ULiH5ofJO0cyuPJ433eOFCl
         736zAIMXc+dIg2Ihl4d3DbwT+sMGjAgkznceN59pY5v+oYXx+gejDQbRDLFp13ltuk52
         /w1+HcNMPoTW6/3RrCFfYwpuq4YNHDl+OJTFBw9Ys21Ku6wG4Hel5LaTcQfZXmtXSff8
         CA0w==
X-Forwarded-Encrypted: i=1; AJvYcCV4vwUwf4IqyRFCpRfH0oGrNxe6HMVc+uCsUYynKFHcoXPn9ItpKdBnq0Svi9mtlB2fjekn419jgUJh+/iXRRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ1X08waIBy56ZpINYxYvCBphSrdjl1zzHhl6o+FC+A2Io9RKL
	wU/GnJRcGA7YgB5ObmgYbFRX8eYdi6aO2l2VLRCKxOJavO822Ab3XlDY2p4FPetc5+3Jg6n8sza
	Db+9OMm0Dt3IHKeZ12ZrW/0+dfMmmqso=
X-Gm-Gg: ATEYQzzhJX66rGruOo778Y7jI9htLM9lxavw2t7edRYY91MCzWu5HDe4iocJqLD8VvW
	V3Zl9Bn+sknB/MXFC8IF1IqsSnv4MwcGSSPMyeH8I/llzkRsUtB+yI06/VWI0dJ7KZrX/KbmXab
	NcpoVH+zQ2T3jkkGwSZnn2Y+49jSqQcJb446RxInVhe45AQ7P5pB/l3NWTiee0e4aR64QjvdEDs
	RhTOEHOmmAz+SroM2NcQbbWMdPqU7MFiyDGfUUjWgtwOqs26aOTGlRcAAMQyihVi7hpALTnppF5
	pGZgtpLDMPqgCWsZTq4p62s=
X-Received: by 2002:a05:6a21:33a3:b0:398:e2b9:cce4 with SMTP id
 adf61e73a8af0-39c87b86797mr15708949637.40.1774917229299; Mon, 30 Mar 2026
 17:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329124429.689912-1-hoyeon.lee@suse.com> <20260329124429.689912-2-hoyeon.lee@suse.com>
In-Reply-To: <20260329124429.689912-2-hoyeon.lee@suse.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 30 Mar 2026 17:33:37 -0700
X-Gm-Features: AQROBzDYpYxyZo8-lCrMJy65C_XwRIX1WEavlt0Gj1roeUaY2UVT4e9EZxtdDlQ
Message-ID: <CAEf4BzbA=drhPq9tsD1Dj1wt_P0q4LNtuNSM96CWVuAVBrKrvg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] libbpf: allow address-based single kprobe attach
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

On Sun, Mar 29, 2026 at 5:44=E2=80=AFAM Hoyeon Lee <hoyeon.lee@suse.com> wr=
ote:
>
> bpf_program__attach_kprobe_opts() currently attaches a single kprobe only
> by func_name, with an optional offset. This covers only the symbol-

have you tried passing NULL for func_name and specifying absolute
address in opts.offset? Looking at the code I don't see why that won't
work, we don't enforce func_name to be non-NULL

This NULL will turn into config1 =3D 0, and offset will be config 2,
which I think is what you want to attach by address, according to
perf_event_open documentation

               union {
                   __u64 bp_addr;          /* breakpoint address */
                   __u64 kprobe_func;      /* for perf_kprobe */
                   __u64 uprobe_path;      /* for perf_uprobe */
                   __u64 config1;          /* extension of config */
               };

               union {
                   __u64 bp_len;           /* breakpoint size */
                   __u64 kprobe_addr;      /* with kprobe_func =3D=3D NULL =
*/
                   __u64 probe_offset;     /* for perf_[k,u]probe */
                   __u64 config2;          /* extension of config1 */
               };

This is the same approach as with uprobes, btw.


> based form, not the raw-address form that the kernel already supports
> for both kprobe PMU events and legacy tracefs/debugfs kprobes. Callers
> that already have a target IP still have to drop down to
> perf_event_open() or direct tracefs writes.
>
> libbpf already exposes address-based attach for kprobe_multi through
> bpf_kprobe_multi_opts.addrs. This commit adds bpf_kprobe_opts.addr so
> that single kprobes can be attached either by func_name + offset or by
> raw address.
>
> Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
> ---
>  tools/lib/bpf/libbpf.c | 88 +++++++++++++++++++++++++++++-------------
>  tools/lib/bpf/libbpf.h |  5 ++-
>  2 files changed, 65 insertions(+), 28 deletions(-)
>

[...]
