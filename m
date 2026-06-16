Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45113C8738
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 04:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781583835; cv=pass; b=NDeY3wtASlTh6SquApCV+OvAetbzJMpW5t7zZjGdRDPLlttrEKHzrfOUNdFdsXsVKtDxaYCr6sXgJ4BNRETosjFwIp8UG/ARFcG0t2G3z1hpytDymStek2zFtTmnq6n8ixZ0qvSQDbNpjkkwukE93PyseBtHgAAg0DhySlgV1fs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781583835; c=relaxed/simple;
	bh=zHb1G1zBECKKQ+80h6h6GBoc9FyVi/t+jHn4goyVTEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B2he8/fen6Zs8RSjzxb8QQMbnfQnS7cmxvtZ0jCuudoSMyDcYLjZQSCK2zDslnQNhxBsPZxJJiV8l+MRx8lMi+KWcImTJVdgvjf9/+KFhfijRh3uvDDCPajp/NnIJFV55XlP+DF5gUrsKTkrGUv3R0nYZ8AYJYBV+VKfAEUIetI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hp2vOKAE; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hp2vOKAE"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7dc2b658544so28220147b3.2
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 21:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781583833; cv=none;
        d=google.com; s=arc-20240605;
        b=Uk4UIqYPvp/6pzSi9YETnQlYs/czhIhSTMcB73SPDsBmfErKh3NGKHyaFmrA7PSVLi
         mnaBrpRUxfGd3KTdR4kmz/zPa3OqQWAZD+5WSEyB/kIccwIpsbI6S1Kz1tirNXB8fD30
         dgUFdn7petrq/Jq7xWnEUs/oof2kWFnl67k/nxW1uJQRSxlq0mYtoCjdLGpbPvTHSp7A
         CAaf0TDx3x0a8/nBZuE9tCRpqXIQZsD7sqUDsCRAlDTui9mPnfsBSZWF0eOLDTRMeFbo
         orESqpIzwcvcZHGuaGMWRKlJbPc2kjBjB6Oc9jQOAJx0CBNNIXZvMPsetWObcwVEZvVj
         PO/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8VvGQUUvkZUkZDMYB04oCktoadoDytnukLijQ4Pz86c=;
        fh=G6eMRvTm7HgxMgzSYOYzq5Yrk5XJbpE8KUW+qkzF06Q=;
        b=atnHeIMhu8m+Wax9HvO0d5zJ2q4ziYe25Px0HtKe1Atb7C5aXhVGB+BjJb+VeMxI+3
         itLVV2srsCze+Gd+6RrD7Vxbi/yLy8xEjj+9W+OjsblePdEqmRVC+UqbUk0tJyYcu54e
         fFzs066/ogtEKYs0LB8gavQaFFk1Sisi+FVMStRUDvrlTwLOTvFFYUcbEWAK3i00hgnR
         50Q5WAqCn14KdEWjeyuGruZVWF/zsybvsLw/fC8F6UyvuMxrTGbkB4wPp+qvm63LkhER
         h9LcjOntjAnTuu5mjlPcGde/kCVmLGLXftVwRxXykUSSJ3eBWNk2tk4SLCX25HYFYv5Q
         WzKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781583833; x=1782188633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VvGQUUvkZUkZDMYB04oCktoadoDytnukLijQ4Pz86c=;
        b=Hp2vOKAExq1TvDMVi1UDKuM/rsotfFBgU7PHjYEG4SyTeIjUbOBRRCcaTapJkpdKYg
         Oa6o7dGrZe0zQUJogNbkUbPUyNa2/ewonSTR9BLLMJc2pWBYfe2UQgA/n7FrggvQBEsW
         Ta6oCSlAMWKPpUT0ouo9C8n6OZla6SznITRTdaycHoHLJkO8yaQ5tfqNuNtdreS3vzys
         ONVAfVTzi9crcVk8jORhHReRtNPymqFhk5JbzhbQft23z/yA+NJ3AiE3mmh6GEDMLzAD
         K+j81KGi0GymipDSrSongVvERB3TI11/OnPluPGyZCS0/WT5WIw1NKW4vA2D8LFmdmdC
         puSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781583833; x=1782188633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8VvGQUUvkZUkZDMYB04oCktoadoDytnukLijQ4Pz86c=;
        b=TLsQ2XsyrrGV0Pg8vRSiRlLqx+uqsuR3r/+FVoR0wmgPNZJ/h/cZiNCIhIRTpKiDSi
         MkLwHTPsmz3fAr7R+KTcNH2tjqTBkF5o8EGye4Tb1MDZpwpRrJqM6P0FVgGn4WbERgiB
         4Ac9EHkwTL/oJaBtjltKhq4sXy2I1YOrE1eSfCEBuci9m4VNAA6EzJt11Wha5FvG4Trp
         y2iMSPCrAw25+q+IkD7LxqIS+rY+uYSfG+lG0fIXE2dl3McV1HxiBjg2QWRTCFox79He
         PjYoQ3ULGoBd2gyz7rjQl67DEknUqvejHYuZZ3O54QAMpUK8LVgUog7LYEWgOiRHN4gI
         gAZA==
X-Forwarded-Encrypted: i=1; AFNElJ/KpzG6DIa0o7apzJH1B+XdlHgoCJkLPP22elYTL2e8QpSXQUUJrr787AYIzRgThmyCJ///6GhIwWqUX1Jv8to=@vger.kernel.org
X-Gm-Message-State: AOJu0YwviDz5dmsgvHa1Ef5EevlYelJ1Wf0pujIOzYlscawuV298IBqP
	eHCm552JQYxhHSYtqOQT61GQiLxtUqUYa7ssqPUcHBNHcxtCcvfHANqsyWpNAtV/S6ksj5nELlP
	Am0i+mli3rbHJc2VNEzOsBWSfJJV/w2c=
X-Gm-Gg: Acq92OHKnAm9B9MPXXE/bG1SBk+YLVYeRudYyvxfF2Zkn0y62qCoiblPd3SCaSAroqL
	Lmdi4eJ7gii4F3VaSGKVTRCv8vPr28Stvf/Mq6eQzHr7nICNkpcazhKCK8zz5/gvPylY5VC2k/S
	z8QoQ+Ux8f81d36k+MCRjeXE4lfoBujwBuzqTgaHbHXUPzc7jMjNkzbDBK4sLo2S2hNv8FRm5t4
	5rptl5HotY0mu2eQgeaJxti5CvsR2tJ9SUazoksCNmQNpMcLTWEXE+5vXCyQzhUUhtOUMZl4Muk
	inUWLIHBDuQcD/SQyB0QfuNdRZWoR9wzHUrLUudJU2E5sSK/tmry9B1W7scgFwM7nX6LsZrbzIA
	yCerHAdsdakmpB7HFfcGumlwpZLSnpcuxUJw=
X-Received: by 2002:a05:690c:7090:b0:7db:ccda:a409 with SMTP id
 00721157ae682-7f7b564871fmr156914137b3.9.1781583832723; Mon, 15 Jun 2026
 21:23:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615152646.27639-1-leon.hwang@linux.dev> <20260615152646.27639-12-leon.hwang@linux.dev>
 <DJ9XY0Y2D2R8.16S9E0QFFMLQS@gmail.com> <d9eaffaa-6bbd-4af1-97cd-e5e37917c526@linux.dev>
In-Reply-To: <d9eaffaa-6bbd-4af1-97cd-e5e37917c526@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 15 Jun 2026 21:23:40 -0700
X-Gm-Features: AVVi8CdCY8CwvOpjegmVAAQQVFiMJANyhc1HaIAiQsegpqM7k_Lqr4_6NbUA3Qc
Message-ID: <CAADnVQLnnSrHDbw4OQCPrXz38wZ15PC1HuS1-aSB7LZxOQhd1g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 11/12] selftests/bpf: Add test to verify
 xlated insns for global percpu data
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 9:19=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> On 16/6/26 05:29, Alexei Starovoitov wrote:
> > On Mon Jun 15, 2026 at 8:26 AM PDT, Leon Hwang wrote:
> [...]
> >> +    ASSERT_EQ(ld_imm64_xlated[0].code, ld_imm64_raw[0].code, "ld_imm6=
4 opcode");
> >> +    ASSERT_TRUE(ld_imm64_xlated[0].dst_reg =3D=3D ld_imm64_raw[0].dst=
_reg, "ld_imm64 dst_reg");
> >> +    /*
> >> +     * The xlated instruction has the map ID in imm and the offset
> >> +     * in the next instruction's imm. The raw instruction just has
> >> +     * the offset in its imm.
> >> +     */
> >> +    ASSERT_EQ(ld_imm64_xlated[1].imm, ld_imm64_to_u64(ld_imm64_raw), =
"ld_imm64 off");
> >> +
> >> +    mov64_percpu_reg =3D BPF_MOV64_PERCPU_REG(ld_imm64_raw[0].dst_reg=
, ld_imm64_raw[0].dst_reg);
> >> +    ASSERT_MEMEQ(&insns[idx + 2], &mov64_percpu_reg, insn_sz, "mov64_=
percpu_reg");
> >
> > If the point of the test was to check that percpu_array_map_direct_valu=
e_meta()
> > computes 'off' correctly then it failed to achieve that goal.
>
> It was to check the 'off' and the mov64_percpu_reg insn.
>
> To avoid relying on the insns loaded from ELF obj, use raw insns to
> check the 'off' with a percpu_array map:
>
>         struct bpf_insn raw_insns[] =3D {
>                 BPF_LD_MAP_VALUE(BPF_REG_1, 0, 0),
>                 BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_1, 0),
>                 BPF_EXIT_INSN(),
>         };
>
>         skel =3D test_global_percpu_data__open_and_load();
>         exp_off =3D offsetof(struct test_global_percpu_data__percpu,
> struct_data.nums[6]);
>         raw_insns[0].imm =3D bpf_map__fd(skel->maps.percpu);
>         raw_insns[1].imm =3D exp_off;
>
>         prog_fd =3D bpf_prog_load(...);
>         err =3D get_xlated_program(prog_fd, &insns, &cnt);
>         idx =3D find_percpu_ld_imm64(insns, cnt);
>
>         ASSERT_EQ(insns[idx + 1].imm, exp_off, "exp_off");
>
> Would this achieve that goal?

Hmm. There is nothing like that in the patch.
What are you talking about?
Some future improvement to the patch?
My question was about the patch you posted.
What was the point of it?
