Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECF737F733
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367737; cv=pass; b=isiNDd2W01P7NeCP528d64NYu/VP9p4hx0VPd7ht2pu2BGdqfSpTAP98BRh7+QvYGKJDdhqhER3nmer7ZF1cCoi5iqltkdneqO7I8gw78MxPtxHlNmmF58YcZ1Qbx3PeE4s35HAZ9KgiZ0h0k3ss0AL1kOSnJwSIXBvGsCufL+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367737; c=relaxed/simple;
	bh=agkUattKYKS6hTX3T/qy79TAvmS3mkdNShYWcGbK5XY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=As5TKoT3EiPGrhhEYNSGUt0xXVe4Jyz3Cm6s2uBavkqB+kWkWGi269WHIu3iZBofyfNKJn8A59jSvooorKexfbDQ0eeMrLEp5ab1Pg7HE4cBvVsniGejAaQOYXuV6Yn+1q5QFGO01cobRgHiSt6uCAujacUow7mXkAtBT7GOxnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjIQeho8; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjIQeho8"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439fe4985efso3641474f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 08:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774367735; cv=none;
        d=google.com; s=arc-20240605;
        b=MVuEmHPpRt90Te8BOlOEsJtBOeWn+ts5hl0YhumI7eiRJUfyfEhQt51xqxFUnSPDEN
         qWNcSGGP6eOUy93yxgkJQJUxBYO5i8d3YVSCGmLDxkb4RUTSg2l3+rgA6rBxQSNYlA+r
         t6aTNdszSktTjc74YlD7IRbJKWrjjJrN/rSl1YCr3qdr88Hls6NWbPnlyyFLeE3uPmGy
         AWjvKzHkNcGKHr4xHD1kE1JCCTVgfW26zWzgHwlqMSyn6iDi9Bo7CBVVT2sJdDm05/O4
         FQ+nKTYRgCVL5dghD2wpg+dNB7MCs2iEPV9DlnFDYVEkFhlVLP9jCyuTa+7w8X91hQyY
         tvlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/3OhNPFF53dFC048CnXCU+MpM/yyzQDjUWEZB/ZZUIA=;
        fh=AfHHSBFP1wHwOfH9ZiqQjdPuSkkKqEe9y3rwscyJYKA=;
        b=hhdnnTnbnGPXYJYRWX4GyiYBDLAxlE8TBf9vX7mhitYvTZ5F2EywVo6saHV2X29qoa
         tGLCEX7uaAFzSE60EW3ddgBtayZTwSm+d74bTUgiMsQzpm461UkHijmG32KlruAMA/rv
         4uNPaT9LlrjjKSSs1v83s4KgypKpNi6VFBuW/pMbA1ziF2OJ5ODrpIq3oOvF3PXNS0iO
         ZO5dHB70KZAvwLe389f/IHEmSj3zH7BimuPPtSzIFpFAk5qeZWhliHp4/bQPh1Z0R3F4
         8i8tcIvJMDxkTgguDl4xN49RY3ammV3UfHSyNO+FMCiKBP05Tjt/j+ct/OGTbhEVCqIk
         1EsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774367735; x=1774972535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3OhNPFF53dFC048CnXCU+MpM/yyzQDjUWEZB/ZZUIA=;
        b=rjIQeho8/atppzNRRSqIlisNezrQeKUf/MrYc6A4Lsnj0K7MnAW7uHHPBs+6t8gnyM
         KLpSgkfD/NbB3ZfyIjC3Sc1CaeaIC9Xsp93yDSMDwJQa8NAuKdkYIaFer4T1sGh7dhGd
         6kpZ7eoyo5Qu2rehY4cy6Zg4MyN+57lhl7rIrz7jQuD7pxPfE0jPEt4rYVpasAziDXb9
         I+H8QHXVLvpCIr8ijzYZ17hS2PYkOXuifLf+fvSJ9/xd83OhIyMORfFaYzV6qaaMVYFw
         uqpYNjZHYyOQVZPQ7DPoYD4dSn61O3e5wDvgl9PRZtDwjpB/81JAY3rXjK3TElv3ULDb
         H6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774367735; x=1774972535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/3OhNPFF53dFC048CnXCU+MpM/yyzQDjUWEZB/ZZUIA=;
        b=obuT1W9EQnFxDuJfs7VeeIhwd1oxoKehCfmNfoDw4AWGibsDSj7zs8IZddQ3W5i9Qt
         CciB0hRh4MxiWec8a0lp3xmL9XY/7lxSMYlXpESK/9GmniQFv2o734x4iyo+fzcbTnZ6
         rF34AdW+mbzDKctDsQCa5sYYg5uIgqO8iHkU6Oc6KEz8dRUiL9v1yOgEwN+RZRAKiiO5
         v3CtWIN76Z+UnoN0TzPcBncjQPfJfNsUYIQqBmamzbXj5NBva3W2nWa0hj0aBEaM3oaq
         G8yq3YCPEY5jZk2P/RBg0YCMK0sSdog3G5/SdztBwFZjDimiAXT+xIF0U10yEmZDGkpM
         zOZA==
X-Forwarded-Encrypted: i=1; AJvYcCXEyKDPLvlJo0T/HS9V+6KaZWINWwMZENTy5wQ1mArwc/YTqd08ZUU/0I+dFHjXDqAja+JonHweUXUsTF+zkFM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8M08twZFvIF4GHEWZUwLUXhuDmu7fJg8nkeGN01KGlwhFbvN3
	IxSfnanW63lKNqLf7+jzywAbWoml4PYtFssynXm5e4w7wA2k17vRG93eLfhtGs07xHS3C9vOxKJ
	KhXfzUxnWYu58VZ87j+Xx3GOOPnF8AMk=
X-Gm-Gg: ATEYQzy2QpMpIOFbPNJjdEpoKv6lfmn+NY/V4P9lUbVPHl3xs/bTH04J4uygDz1ASQx
	3p1rpa3+7IKpjUpErG/aDVMKM2Fn1Ju1BJcxJxCauIDgUKv+oFCuIFw+N3/1RGBNFJ5cMJ3GcXq
	so83NQz85MN8Y6v58z51q5ZlfGk4DaCFao6OZ+CT0MmIsRtRqUxYfBb6/cZ1mXfGQ+WjSZOzO7S
	MwqAru983+ZUaF6DevhsynK7+2j6kOL0sxnD89R1b4DdGJTI1Ca+XI2/GEjwIxzYpYSwusy9yg5
	9ZOWIpZ6dL5SjbtX1hliwAVfbFKn78uhJ8fASQJMqGKA+fGrf6J4YPnWUHha/0jZHrBjIEpWiZB
	LgomUA2gdwGmjwhtEVQN5wl5pcLbrnlloetyD
X-Received: by 2002:a5d:5d0b:0:b0:43b:447a:11b8 with SMTP id
 ffacd0b85a97d-43b8899533cmr19587f8f.6.1774367734362; Tue, 24 Mar 2026
 08:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-tools_build_fix_zero_init_bpf_only-v1-0-d1cfad2f4cd1@arm.com>
 <20260323-tools_build_fix_zero_init_bpf_only-v1-5-d1cfad2f4cd1@arm.com>
 <31243215-918a-4f03-917b-de869b7b7bf1@linux.dev> <20260324065820.GC43072@e132581.arm.com>
In-Reply-To: <20260324065820.GC43072@e132581.arm.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 24 Mar 2026 08:55:23 -0700
X-Gm-Features: AQROBzC5IXAEUJFbmA8caaR_jFD39ZGF7akzX-go1yOK6QjtBXhXNQ_zLdejUkM
Message-ID: <CAADnVQKJLO+7NnbPvmTraZr8hq8ENSh2f85a21b717ye=NgpUg@mail.gmail.com>
Subject: Re: [PATCH 5/6] selftests/bpf: Initialize operation name before use
To: Leo Yan <leo.yan@arm.com>
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>, Quentin Monnet <qmo@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, Lorenz Bauer <lmb@isovalent.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 11:58=E2=80=AFPM Leo Yan <leo.yan@arm.com> wrote:
>
> On Mon, Mar 23, 2026 at 03:52:38PM -0700, Ihor Solodrai wrote:
> > On 3/23/26 8:40 AM, Leo Yan wrote:
> > > ASAN reports stack-buffer-overflow due to the uninitialized op_name.
> > >
> > > Initialize it to fix the issue.
> > >
> > > Fixes: 054b6c7866c7 ("selftests/bpf: Add verifier log tests for BPF_B=
TF_LOAD command")
> > > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > > ---
> > >  tools/testing/selftests/bpf/prog_tests/verifier_log.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/tools/testing/selftests/bpf/prog_tests/verifier_log.c b/=
tools/testing/selftests/bpf/prog_tests/verifier_log.c
> > > index aaa2854974c0a91cbbb9fc13ae0f966de1bcc818..dcbe2ef995c5b211c2b86=
b9555c02144e11ee7d6 100644
> > > --- a/tools/testing/selftests/bpf/prog_tests/verifier_log.c
> > > +++ b/tools/testing/selftests/bpf/prog_tests/verifier_log.c
> > > @@ -317,6 +317,7 @@ static void verif_btf_log_subtest(bool bad_btf)
> > >     res =3D load_btf(&opts, true);
> > >     ASSERT_EQ(res, -ENOSPC, "half_log_fd");
> > >     ASSERT_EQ(strlen(logs.buf), 24, "log_fixed_25");
> > > +   snprintf(op_name, sizeof(op_name), "log_fixed");
> >
> > You should use strscpy() here.
>
> Sure, I will change to :
>
>   strscpy(op_name, "log_fixed", sizeof(op_name));
>
> > This patch looks very unrelated.
> > Did this surface only after the changes in the makefiles?
>
> Yes.  This change fixes ASAN error reported by BPF CI:
>
>   https://github.com/kernel-patches/bpf/actions/runs/23239705647/job/6755=
4431963

When you respin please use [PATHC bpf-next v2] subject.
Otherwise CI doesn't run all tests.
