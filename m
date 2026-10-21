Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792604520;
	b=rrYcamvRQkUpMsXSsYTEelLHMB76A+FHv5+nkg1BV3XgZC13G2shkkbhq0uVdg96cn14
	 MyU3CiItdzNYquckMlEmyGD8Gn6qNu3FTlpK6e7FQKXhWDsfKubCzojsM4sJfbUuskqO+
	 zV3ejoYVR+qd/oBtpwir+Psu0pGQeRFa9koDVBd1ifdrkruXPhB7RTbCQi715i22hYDiI
	 R9oukBbeB5f7LSr5sPaMmeZwgvSRqxiRyN+fyk8uyB2tulvNyUPRpmXHEgp6lKQcJIl13
	 1I8ZsDg6ZXBmkbS7L/COb8qZlmd3YHxpAoGKE9ajPYQAAxHN1sMqzVx2+mmnkPzgn3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792604520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WbPfC3xf415pZLIbAAwGQiH8uDkz76+8nE49QrFCe/Q=;
	b=HbSekZmJO4jYxTrgVsyD40LN04SmxykVPIR/6PPhg2VV9xE4tdKJDW98yCRx+HeZ5/fX
	 On9rqfVxVcY29jgVPJehgjQjo1LL672BFLoP405Fv2SeKTrtnWmMOIy/ZEzUzy8SiVF1C
	 ZTwNioK+O3Z/Lhg6hacSAOjISDNJ2coZffVAaBVR4p+gHMMg94qDWwKB27adKbWI1xZwh
	 nLXjFh0eKBGzgo6UWbEdaDUFnlwuui/Ha7c1i6gMtqDOXYWIz56A7Di5yBrZdsdW7shac
	 D7PEEv3gM/OisJqatQcglNFg4NsuAnpDTdn5I1lmZY9gkHumY8e5rGvaXVj1LbKUnvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GvAbxW8U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B50E606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 17:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B50E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GvAbxW8U
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so407693a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 10:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792604520; cv=none;
        d=google.com; s=arc-20260327;
        b=QfgZM1kkmhNug2Ft4b0MzgeITRdUmPa5f50CvY7PYV13HyRcGjaOHhvGHYEXIHIX7b
         ilmPihxiMa6IEcPaYURCYc+1wAXd48Bbr7sjFE2rNaCN+4yTEwQgKHXsruhqEv1X6WQ8
         DAY4PIWiBbnnx7IAXRM6Lnnuxlrk9B9KyQJVU9g84ufVmb/BaaJfw+6kkEtAlb7/Dys7
         gaS8vnIb48JOqGOMKuTiqgvsRGNsfKDKBQNSFoqsvrUVCRQeiJmX9tXCngC09Z6hbDFV
         v3zdFQFD2c9fEiPdrU/gdm61RbH7AyHeAZyIGuVtBGxdQWT5KiZoo06H4YkSSjZHqCBd
         RyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WbPfC3xf415pZLIbAAwGQiH8uDkz76+8nE49QrFCe/Q=;
        fh=t3Z6Fq/3KrizCo8Bfusnd9GKTChGzt5si7b2donNGXU=;
        b=bbQ8B7/WA0lpGRvXbiy4jIPIFbYBs0FKUq/AjardJJ9k2LAASxKNC4tB6huw53StLJ
         27hVHFh9TbCZrP+6IIB8VEc0okdOyZuB9aWaHpL2JO7NonnmhiZmImxRMKJovRuXARmC
         hjy6k1/yEGnqK/hv9VJJq6vuFb4kuA3wyTjy9yHQo1bE++Mnk+M2pggAoKPh7+wFIgi9
         M9RYhHdtTXmdXcsjr/579R3Z36Bp4tVDXrjlfPm8iIMzm2zDjL1dp5qLi3x/f+bXB5NG
         sUSKkpvD0FkJELMmrGZuJDzLROWOUameMKogUJH1kXt2FnI+3wWFv1u20otKNA426cCA
         FEKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792604520; x=1793209320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WbPfC3xf415pZLIbAAwGQiH8uDkz76+8nE49QrFCe/Q=;
        b=GvAbxW8UXtF+sRo9OMu4rbiOvh/ZUVz/YIvz0PscUkArcnkkSoHXjx90jpuxuMfVj+
         gvaXcIpvK/50UG3alQJ1Dp+2g0gdqjTAy5dm37l86wOcXJrukh709bQOUA+kBnTyfJi8
         qZtNnpMZsfDYyI6WIxZvhBlQZbClbbWY0qrp2jd4DE/n1oA/K0IeB0+YkDIMXH+Xuj5T
         HPw+nY/bs4Z0G4Xi/rxh0plLMUug5NI98mr/u7qmV3y0SN6sva4+Duq9Bz9yHmm7Kk1d
         jtodxu+rnwuW5xb6SJB7Sri91KGj7ab04wNmbK0F7wLB2SDE9nwKdnQabNsQv+yJvzy9
         J5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792604520; x=1793209320;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbPfC3xf415pZLIbAAwGQiH8uDkz76+8nE49QrFCe/Q=;
        b=dgH1RnoG/zvkUWDBVqFtBmBq+iaz/sfQG25S+fvv/uWWT+RUD2vPCYtqdJ/HebRsgG
         6mI4nxF7zLHIIn+RPizxG6ctEb34aOznGFsJJIEhNndmLPhQIdpnwQAmKXYbS6DOvWAX
         iZOYsQBvQqXQ6RwJJRmlzpcuhFv8GhGs/ZAH5qPjqwrSf23xiJw/rkOQFMMGrQlWiMUG
         61MX5RhYdIW85N4rFn+Vp0rUa5K/uIi3d0QDJjbIk7/Ddj/nUGhepEn8zWRhrJaIAisx
         pjfZNzmJCfCUPAbJxCgqrBIoIhaCxEyYFtJbM5hmErWKM87kPQoYRoAW5ijhTRXrbskt
         7Kww==
X-Forwarded-Encrypted: i=1; AKwUvBwpZjrfJu6L3+fLM1Jf6/CAKDzthtvinkUnUhFUMNrZ3nWzv2z1Zpt5Np/5lZhNX6gx5y8nZ7BkWZcmPy+RK8Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLaS6PjPidE0fA8eh/TUhHJNsJDgrJ2Zi0P1N03xndtcSePglL
	b1mZxJpUb07/LbOhNYklwz+KfW0y/GN8YhKu1sGmldUBYLIV78XgDZhn5XUW3kYKw8CycZxZufz
	ZQta5B3UNrOnVVRf6cSgoPPoGmITlLxU=
X-Gm-Gg: AYBFou2ZO2Io3L8hlsXEAKBQ4kSmTEekiZRF9RFYGbQ8tUFb3PZbtJvhWnZsOFW4WME
	AFaNpawRoMwJAok3qWJM9qKWx0kXcbIU7WdAed4jPF1/c0Ll3R6N0DF+VDYxxWdYBXkvq1JEXA4
	U+jPgGBTXCR0Mcbv519XQxD1yFxwAR3j4FvhHu0OuAOLYDDBFvj0nxvZXsgUPUuIU9XDydbB85w
	Xvdvg89JIwC0WJYRuvW5s5CpV6yKFD6jw8LNqsp/qBeseOBFnhqhRZ4zDNdLwjOQYcBI9Wxhg6D
	YJ8/M6KraGVI10sf2qJmacRfK3XgyTSqp5VZJCqtXz5CUI0dI7xcK/ujmY6JhB5tvsYhYl5Sut5
	rUHaWr60c2PKPbPepjorMQfA9RhfaZDK97eZT0m67WTth4VIRjSMQD6jpIaY39FMxGv4VQ17hir
	uYtJmQxwwZSdACRvu8mQ==
X-Received: by 2002:a17:90b:258c:b0:3ab:2ad1:f10a with SMTP id
 98e67ed59e1d1-3ad86ca45acmr2134722a91.0.1792604519654; Wed, 21 Oct 2026
 10:41:59 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019153628.15912-1-leon.hwang@linux.dev> <20261019153628.15912-6-leon.hwang@linux.dev>
 <CAEf4Bzbr46UkiE1sbb+Zwcs0S1ejpKmtTGjNCAkWD-J6FRcPGQ@mail.gmail.com> <d4fc4fcd-3691-4122-8b3e-a75447956255@linux.dev>
In-Reply-To: <d4fc4fcd-3691-4122-8b3e-a75447956255@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 21 Oct 2026 10:41:43 -0700
X-Gm-Features: AclHuK8euPDDrPLcZ78w73yg4ZplR7FA7dJCpvboj2MZKSFYtjKIdYl4Mw0-_4w
Message-ID: <CAEf4BzY13x1skc6XSnXGyoLwaFoOtENGokUX7XHiakEyw+eQEw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 5/6] libbpf: Add bpf_link_create_log API
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Shuah Khan <shuah@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Hangbin Liu <liuhangbin@gmail.com>, 
	Martin Karsten <mkarsten@uwaterloo.ca>, Masashi Honma <masashi.honma@gmail.com>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 8:27=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> On 2026/10/21 07:25, Andrii Nakryiko wrote:
> > On Mon, Oct 19, 2026 at 8:37=E2=80=AFAM Leon Hwang <leon.hwang@linux.de=
v> wrote:
>
> [...]
>
> >> --- a/tools/lib/bpf/bpf.h
> >> +++ b/tools/lib/bpf/bpf.h
> >> @@ -484,6 +484,11 @@ LIBBPF_API int bpf_link_create(int prog_fd, int t=
arget_fd,
> >>                                enum bpf_attach_type attach_type,
> >>                                const struct bpf_link_create_opts *opts=
);
> >>
> >> +LIBBPF_API int bpf_link_create_log(int prog_fd, int target_fd,
> >> +                                  enum bpf_attach_type attach_type,
> >> +                                  const struct bpf_link_create_opts *=
opts,
> >> +                                  struct bpf_log_opts *log_opts);
> >
> > Leon,
> >
> > how about instead of adding this new API, we try to repurpose
> > bpf_link_create_opts' iter_info to be used as log opts? we have this
> > right now:
> >
> > union bpf_iter_link_info; /* defined in up-to-date linux/bpf.h */
> > struct bpf_link_create_opts {
> >         size_t sz; /* size of this struct for forward/backward compatib=
ility */
> >         __u32 flags;
> >         union bpf_iter_link_info *iter_info;
> >         __u32 iter_info_len;
> >         __u32 target_btf_id;
> >         union {
> >
> >
> > that iter_info/iter_info_len is a bit of a legacy before we had
> > per-attach type union, what if we add iter section into the union,
> > wrap iter_info with union and put log_opts there, mark iter_info
> > deprecated or something.
> >
> > I'm not sure anyone is actually using iter_info (I didn't find any
> > uses in Meta code base, for instance), but we can detect its use by
> > checking iter_info_len: if it's non-zero, then iter_info must be a
> > real bpf_iter_link_info. so we should be able to detect this just
> > fine, the only downside is that you can't use log_opts and iter_info
> > simultaneously, but I think that's fine: you can update your code to
> > use new iter.info fields instead, if you need log_opts + iter_info.
> >
> > WDYT?
> >
>
> IIUC, the struct bpf_link_create_opts will be changed to
>
> struct bpf_link_create_opts {
>         size_t sz; /* size of this struct for forward/backward compatibil=
ity */
>         __u32 flags;
>         union {
>                 union bpf_iter_link_info *iter_info;
>                 struct bpf_log_opts *log_opts;
>         };
>         __u32 iter_info_len;
>         __u32 target_btf_id;
>         union {
>                 /* ... */
>                 struct {
>                         union bpf_iter_link_info *info;
>                         __u32 len;
>                 } iter;
>         };
> };
>
> Thereafter, iter.info is preferred against iter_info. And to keep
> backward compatibility, iter_info is used only when iter_info_len is
> set. But iter_info_len and iter.len are not allowed to be set at the
> same time.
>
> With this change, the bpf_link_create_log API can be dropped.
>
> I'd like to drop the bpf_link_create_log API first, then add iter.info
> in the series of log support for iter link_create in the future.

up to you, but I don't see the problem of dropping bpf_link_create_log
API and moving iter.info in the same series

>
> Thanks,
> Leon
>
