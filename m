Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618DC1DC198
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Jan 2026 18:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769194379; cv=pass; b=g8M7CUUYcVRAqKK4Yu5YfNhAtBsrIZ7LybRSPKVvg+qGK15iDt4onkEx95m6rFvu3bn1qqLBZQqpbYAHYQmucm/wbxK7ndSlFmyJ7kqbS+jeazaSYrdmR5oQbD+vcB7D0xkNEQr13nGC457v5Wcl4BZlxpRF43Ww6ulNc7usgvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769194379; c=relaxed/simple;
	bh=z3EtqsDAY+x87WF7+9aLT4AVPsq/B/vh8YxvXKfaXBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=svxLO2B97VPJl96zrPdQiCXd4skYhXaFE0HTTfcOgjf/f6I0/fdlqWbPzzsTqBnWUF4g/zNU5hYCQdQDk6/cT2WLJ+0KftUG+zNMWQYYV/ggjhbFakt4FJE7oS9Etovmbfr1LPE3LSr5zoEFrYYCUtGw4vxfWu9T/yqC0gysgFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ng9QfeUn; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ng9QfeUn"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-bc17d39ccd2so927950a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Jan 2026 10:52:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769194378; cv=none;
        d=google.com; s=arc-20240605;
        b=ZocrK0XTksMsOKoJMfRjrxJwCHYHIDc9uRAOF5/UPOtoUrmL1zR8AB/WMoh0PJurqJ
         +iGy/qIx4GuuDDBgWgL0ZaWtqW1H6HIGI3ozi2zSb4uL+VOgMqWssnERUcmJsuHrUrB4
         EGgAVNzjZCEj7UWAMaIJzaxvOmOsO4CVVxEhMLMELeEnznVRHx5c19+jo6yuLsY4P+8u
         v2TdkQMtTNmzQxvrvTVh5RE1QX5e7v6S4FN8QHqd7rnpmXujn6Kr9uIUVffu5WYoq7oj
         Y30Hp7hor8mbBh56IDiChR4Ytxy6Fny+3Y2SyWCn1mhu9rEb9Dteo2JUoN5sEa0DGG/u
         XMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N2X2oUhuqV8lqBjwyLuRAgoJAdlYDpctSNg1JkT30xg=;
        fh=6XFLyyOw+F8vrfXNwRHEtKMFjOpCnHkP1J68k7Sv9ms=;
        b=NZV2XhgHfwMeDgt8HqqI9aZhpsGEz1fwBGZWPcMd04sbnnzq1FFCZBf41s78/B6Lc4
         giVFkVIPt7+4aSIOzZkfl9Oh/OK73/e1pVIndG510tHJa5Er6XQ9WnxdMUjyTK9aZG+h
         4oxsX6wTmL+2dSnT+elZGLjD/Yc81wEaNkNCH5bWA0j4l7kDKgReJsHzZaEio2P7WTaO
         ilvy4tJn/Tcl65Sf1FHsth8uAKI4D6TkN5IQglh2ythojDpBkRoh/jv8m9k70WxNGeFk
         t2kSszf/YH4xAevLxXmP3Blzmdgc/2a++UEcH8mI/Xa1Q3CTAztlNajpTf98GHitDM8p
         Otsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769194378; x=1769799178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2X2oUhuqV8lqBjwyLuRAgoJAdlYDpctSNg1JkT30xg=;
        b=ng9QfeUnUtGWaldLldWWP1YAYQfw/50B+tT0f5EnQgvolYeZvXsswPqZFIFvoxyhgs
         ajccn5uQK00JCHA/gEy2oWicHHgGmjnOobky1VOQ52mNxDuckuoLBup3VNI/w7Sssool
         1M/uuhrRqJ+WJTfafFZn1c/LuKbPNgWbM1ywsoOw7SAFkyS2gUlZPGWAnkyVS+6336Nj
         CO3KFu6grhlsJXjmVyBiKZ+yme5DWTBvYQ05wEXaj9mYVcapeudq/GiRi78o165za5/Y
         ViBVK8PdwLNwzMlFT31FJzmc8T88uNPW1+sme46Jz7mRI53C/9wSygwtLpKSCZ7q6kaU
         TNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769194378; x=1769799178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N2X2oUhuqV8lqBjwyLuRAgoJAdlYDpctSNg1JkT30xg=;
        b=vsW5SCosXZWD03gCJxUinVWjNdrRjZcnSv2sBJiCjQlsc6O+le8HW9vxcRQvbvL4EA
         Z0GMQ6j88h5J0WEsylnsm6pW+EkQRAOC/d3WVtrw/jvOyoXmZvCaJuVRaa4UjSK2rdgX
         scv/B/jAAnNMgT1N3tta2PueV+k+ZcrdGG38emmpWO7vUXAlq+vZBDFIYIqQnJEb2SZx
         G0wd9SpHmSRBrZVovoyFv6Y7izbWg1CYwetxQyB/pwWEZknc9vDhHSr2AcTR7SR6Qbbi
         U8UQw7xpcMavaQCil5qQ6mwBNvCYnqUeuqYn7Qi2kR/DdsGug/2VlXRvNuFOeUeB+IbR
         Sk2g==
X-Forwarded-Encrypted: i=1; AJvYcCVx45kXA+x35WLTwXIm+gMsFntPM1GmnYXDCJ7gXGCXawxEunsz0OqQF9RQ/h8KBRNrztDY6Ce6xXfWn6zAecM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYPzAa4Gw0LYah1S5R+TFd9Pr7x0VIQSfudbai+lq1wzJpshBA
	uudb77SWobkzi6/x8AGZkGkN5wKNyjOgTKkinApEW9yDCSS3S7heAs+v00O7OXYHmFbBj6mCBQw
	3JmamRDhW5Axy3MieBEDPIPcT4lq60HY=
X-Gm-Gg: AZuq6aIZvxeJHwlgQXW5ZX0ByWgOpQi5qeS6q+r8daHZpCmKX0gbnXq4antV6HkSvih
	HCMT1U2JEHFxpLHmG/NrXUy8MZSB36J4u36q/vwYVPsi4D7WKAP/i2btYPRVoW59tluVqmhLA4H
	xwwNMpSgONXrVmTq5B97xiY77RLgXsuergyeTG1nrip7s98MhTUmvaralMw5az8nV4tP5TbGeuS
	7U2xH8Jl/WJ94Rk/aaPMEXObHjOExj72KwPqS38vSH99Cwhm3bkZ4xQ7FPbGbKMLFHOGYgc9p8K
	KioDeCpNxyIxpjxgOJTQwQ==
X-Received: by 2002:a17:90b:3c05:b0:343:7714:4ca6 with SMTP id
 98e67ed59e1d1-3536894c172mr2714897a91.22.1769194377547; Fri, 23 Jan 2026
 10:52:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123032445.125259-1-leon.hwang@linux.dev> <20260123032445.125259-3-leon.hwang@linux.dev>
 <CAADnVQJLz+nMHCZXUgy2MOxwFczEHNbG8ZUgfZeUY4yXFUKcNw@mail.gmail.com>
 <a0ce1dab-7d7e-4b04-a033-4f0611090d34@linux.dev> <CAADnVQ+HJkOikzE3KPhOkd1KNugs7=1dZKY1mfog-ez8noyrDA@mail.gmail.com>
 <419976da-f296-4418-8dfe-8ad50a9f8cb5@linux.dev>
In-Reply-To: <419976da-f296-4418-8dfe-8ad50a9f8cb5@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 23 Jan 2026 10:52:43 -0800
X-Gm-Features: AZwV_QiinsC5aYUNOHtelkljzXUfW0ud6mJXa6FtpZCanGP-V52IbcGr9qrZsWM
Message-ID: <CAEf4BzYhhf7Jd6DDr2XVf=3gKeMMmrkWW9Sr49QxuW6QudSKig@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 2/9] libbpf: Add support for extended bpf syscall
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Seth Forshee <sforshee@kernel.org>, Yuichiro Tsuji <yuichtsu@amazon.com>, 
	Andrey Albershteyn <aalbersh@redhat.com>, Willem de Bruijn <willemb@google.com>, 
	Jason Xing <kerneljasonxing@gmail.com>, Tao Chen <chen.dylane@linux.dev>, 
	Mykyta Yatsenko <yatsenko@meta.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Anton Protopopov <a.s.protopopov@gmail.com>, Amery Hung <ameryhung@gmail.com>, 
	Rong Tao <rongtao@cestc.cn>, LKML <linux-kernel@vger.kernel.org>, 
	Linux API <linux-api@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 8:19=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
>
>
> On 23/1/26 12:12, Alexei Starovoitov wrote:
> > On Thu, Jan 22, 2026 at 8:07=E2=80=AFPM Leon Hwang <leon.hwang@linux.de=
v> wrote:
> >>
> >>
> >>
> >> On 23/1/26 11:55, Alexei Starovoitov wrote:
> >>> On Thu, Jan 22, 2026 at 7:25=E2=80=AFPM Leon Hwang <leon.hwang@linux.=
dev> wrote:
> >>>>
> >>>>
> >>>> +static int probe_bpf_syscall_common_attrs(int token_fd)
> >>>> +{
> >>>> +       int ret;
> >>>> +
> >>>> +       ret =3D probe_sys_bpf_ext();
> >>>> +       return ret > 0;
> >>>> +}
> >>>
> >>> When you look at the above, what thoughts come to mind?
> >>>
> >>> ... and please don't use ai for answers.
> >>
> >> My initial thought was whether probe_fd() is needed here to handle and
> >> close a returned fd, since the return value of probe_sys_bpf_ext() isn=
=E2=80=99t
> >> obvious from the call site.

Have you looked at how probes are called (in feat_supported()?) They
all follow the same contract: > 0 (normally just 1) means feature is
supported, 0 means feature is not supported, and <0 means something
went wrong. Libbpf will log an error and will assume feature is not
supported.

probe_sys_bpf_ext() should either follow that convention or drop the
probe_ prefix altogether to avoid confusion. And then
probe_bpf_syscall_common_attrs() is necessary only as a wrapper around
probe_sys_bpf_ext() to ignore mandatory (but unused) token_fd argument
(so to make it "pluggable" into feat_supported() framework).

So, just make probe_sys_bpf_ext() follow probe contract as described,
and then just:

static int probe_bpf_syscall_common_attr(int token_fd)
{
    return probe_sys_bpf_ext();
}

Alternatively, just make probe_sys_bpf_ext() take token_fd (but ignore
it), and just use probe_sys_bpf_ext() directly for feat_supported().


probe_fd() is not suitable here because it's for a common case when we
expect syscall to succeed and create fd, in which case that successful
fd represents successful feature detection. This is not the case here,
so probe_fd() is not what you should use.

> >
> > Fair enough, but then collapse it into one helper if FD is a concern.
> > My question was about stylistic/taste preferences.
>
> Understood, thanks for the clarification.
>
> I=E2=80=99ll rework it with the stylistic preference in mind.
>
> Thanks,
> Leon
>
