Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C218033A9C4
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 03:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779159923; cv=pass; b=Wx6/kHtJsTEap8ZuJOV6kMUFd6bwGosDf26TCq5vbVX56sGOWdWE1WjuWtKe4D9/Gtk+r1rxOUsPyxdKTvN+u3wklkn6cf+PVW0CPj60GHAGhwpsO/QykVI9bUpW4aDsUZ2+Fl+ogbsv4JoyTFHzt+r599jLFHJQulgYBHYPyQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779159923; c=relaxed/simple;
	bh=Q9+bQYcgqcKG4E7oWlBQwRgnuDVbY8gf2xhQ0zFIZWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKwoRqiTvVGjiUftB7dNmtE2XpXiTzN/jw5ANssIDteQAWXLx8orA9u/+32B5aix+tGwb2GVufKWE3JbNpNQgK86V9uYxEFjO+eXFfaR84UjJrNYcj8FEUEXgec77SG+nC6kUQJf4CX+qC533X3NB6k7RpGI6EtMI3+wOQL7hxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0J72eUi; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0J72eUi"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso40234225e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 20:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779159920; cv=none;
        d=google.com; s=arc-20240605;
        b=EWqwKF5+OGAueC6DYdoNQPVDYxPsL9b09kmRZXKEbxplYRTRi8lq3n2CcmeQkvR6mC
         ooGPe2G/ST+BSywIiUC0FsQmioNTrtmzE4WgQDoiMGmfaT0vHkN77jab95eOr0ayBbQ7
         R6KZnC3L1jXZx641Jzi4qeSGy8ouG/ytiobtodT+s/KcW1efAp2qqkp9GqiB7MJpi/QT
         +kK/4WZ+nOX3dWebp6juR/B19d4kXotFXLUI27Hf2AoPCs5hZZRgIWh5TShllRFJ+8jN
         2MchKIqBn9a0Vw4nLW2OFiVughkWujXCIOJNyzNt+9jWIQ2bSyIiCZyu62zVRCfQvBEU
         ivCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5fn5lXdhzUmR8WoBmOTDZiMW6X9iVCgyfgQJdzyZoiE=;
        fh=kwNTKtp68ihLGtp1j8n/eXmC86Hb1it9SjplsZeQPrU=;
        b=JuMdqa29djyjLAsM/zVPVvGdSiPMszHc/L5fgPSoDHG5UQYXb9A6TOnORheASKWZz6
         sh/HgSyA26yrEbHcOmE7gJT7pXyMS747kl9BGTZqOo5kCSU1sWArJkGAm1+1sNjIUMC3
         wB2QSyDBQay9YF9nZKRZbo78Nq4klTx/grsIUnbCurL5p2lueuJ5D9SDMBjZVWpK5n3H
         iYfHVSp4sxcBiOH1cLymUiDd9bwOXQs5sUhR/nd1xZ/Efl9cTV1/vxbmlaUrLJFkRsgH
         a8037V+3A2MQVj9jZfHlaEveLKzFPsGEMVJNCM2UP+w7TjhkHSyra24mnM0r5gWFUX24
         iMuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779159920; x=1779764720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fn5lXdhzUmR8WoBmOTDZiMW6X9iVCgyfgQJdzyZoiE=;
        b=K0J72eUivS4nsp+kMiAcnWfSv3ffaIg+2HZ03qEJ57F4F0bL7DdJLk083LWVVEyNne
         aEGMQgNYDz+02gSHwfkuWReFfUnZlIboGv9lWneAQ7RMV1+2/dD76+JzsQzVkgvI3CDg
         /3HmKk0S2YQkQayZHdgJWuUVgPTu/2oDuX3eGoLfv/KpK829Ed0RN3HaGyNBjboNXPsU
         f4AX+Vy3TCL/jBNB+zM/C2c/PWn2LvGnbnFDU2USKzw/BlAkWam//XRqvWxwSSBUmfYA
         hWqZiao5fUm+5l/NWkYSv8E4MgXB3JA0jPTZxuFtmWll/gIA3248wkUWeuv61Zsro7Oq
         XnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779159920; x=1779764720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5fn5lXdhzUmR8WoBmOTDZiMW6X9iVCgyfgQJdzyZoiE=;
        b=XCbudSuLV81s8oHNEPqAwgvGgSK7cGsCzAl8kOc81HmrFvjbDTxMDkGOkbqM53h1Ip
         s+7s0CmJ8bghDVvr1R127ElwbS86cz5S/7Z9jqvsC7O9bZsJ/HdSGSqr7VkY03GBfzGM
         ow5UVJVb0rKZq+4UGl1RFWbNce6GX6M7rIvpKz8GzRTMN0VnsEf0Nulq3/JYn2QItOoC
         Fe8G444EgRy1jKSWhuai/gIXno408GbucvBQoIZnlWDm4OBFK94MT4lseiniFqUiYo2i
         SviIDX+2zzVQIo7WVj11SN5fjFU43oogQS6i63DHAl+ZjWMsfrfyD+QDk4LYHfMMy63a
         eLLA==
X-Forwarded-Encrypted: i=1; AFNElJ+zKkvsyuQlet1lUy12ub3XjIBZSNzVjDvNFc9VN2XI3tOhml9NE/QNMMQIbrgk8cLUZYkhgZXBDE9jb9m6Sqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLKow/oe2BjKBExUocqv5D1u9Wyj6XPFQ2UKCanBimlmCztkIz
	ZDzZSc4rgEe0kxW5HJRvt0lUP59hHuYb8zJ5BzXC1rgWHYA8ojS8zWQ/D2VjLXpx40k9ekWzhex
	ib5lckL16uWeIwF38bgeOUb5uUTGB61E=
X-Gm-Gg: Acq92OGhB+2IcmnNmzx5xsLTqmZM+NjK9gHCcZokHpVN0oozWxcENvNR+U/FI6bFNKI
	DOWVeiQFnDw2GpFT+OuvwvMv06dwuH3gwslSWqM5zUQhYGIkhqmA6vvRCVxGs0ybgDxRElHSvax
	t/51Ikl970HqkJKmT4hOv+3eBdhRvCPnNEkWJu3v9Nc0Rys/IsWlSop3T+umZYT8Zac50rYM2we
	p5wCiiLHOokqC7QkLfZHPPlUMkK0fLFyGl5N3qKsEtfPjHybfX/YD7n2YN7/d31RP7fQ9rvzVXS
	xm2CLUgUOLqRJqUwV60W8ySpCuXYJCwRSeJp+5SonpNblW5okDnRKE9an2/N9KN684aFVLMJA2Q
	UQqdpYEoTL9fKrfh6u87DKzij5XkNvzE2VKuG
X-Received: by 2002:a05:600c:3b21:b0:488:78f2:6b0 with SMTP id
 5b1f17b1804b1-48fe651b39dmr256690525e9.29.1779159919917; Mon, 18 May 2026
 20:05:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518145446.6794-3-leon.hwang@linux.dev> <18095298384649847dcbe0293f6b710a1382f9ee3eb9aa2bf8f6d02e56a1f0c4@mail.kernel.org>
 <6d869149-49b2-4a7a-8ed1-7db9b6af8542@linux.dev>
In-Reply-To: <6d869149-49b2-4a7a-8ed1-7db9b6af8542@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 18 May 2026 20:05:07 -0700
X-Gm-Features: AVHnY4IMZVY1Ka0Gc2HwMu-nrf1fg0lbl7TQ0eZnTcIDBs7xynIM4zFCGhpFuxQ
Message-ID: <CAADnVQ+rBXAWojPPd40XSkqCM_4XWEqu+_GqCWNkDbi13makcw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/5] bpf: Fix concurrent regression in map_create()
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bot+bpf-ci@kernel.org, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com, 
	Martin KaFai Lau <martin.lau@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Chris Mason <clm@meta.com>, Ihor Solodrai <ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 7:48=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> On 18/5/26 23:40, bot+bpf-ci@kernel.org wrote:
> >> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> >> index 83de8fb9b9aa..322865a88b3a 100644
> >> --- a/kernel/bpf/syscall.c
> >> +++ b/kernel/bpf/syscall.c
> >> @@ -1647,11 +1647,18 @@ static int map_create(union bpf_attr *attr, bp=
fptr_t uattr, struct bpf_common_at
> >>
> >>      /* preserve original error even if log finalization is successful=
 */
> >>      ret =3D bpf_log_attr_finalize(&attr_log, log);
> >> -    if (ret) {
> >> -            if (err >=3D 0)
> >> -                    close_fd(err);
> >> +    if (ret && err < 0)
> >> +            /*
> >> +             * Failed to finalize the log.
> >> +             * Should not close_fd(err) here. Since the bpf_map_new_f=
d()
> >> +             * has published the map fd, if a concurrent thread close=
s the
> >> +             * fd, then opens new, unrelated file that receives the e=
xact
> >> +             * same fd number, close_fd(err) might inadvertently clos=
e the
> >> +             * unrelated file.
> >> +             * As a trade-off, override the err only when failed to f=
inalize
> >> +             * the log and failed to create map.
> >> +             */
> >>              err =3D ret;
> >
> > In the v13 review thread, Alexei Starovoitov suggested moving
> > bpf_log_attr_finalize() earlier in the flow to eliminate the race
> > window entirely:
> >
> >   "bot is correct. Let's avoid these races. Pls move
> >    bpf_log_attr_finalize() into map_create and do it before
> >    security_bpf_map_create."
> >
> >   https://lore.kernel.org/bpf/CAADnVQ+XR3kyqizGgGhtG5xiBu3oK3O+COUMfPDQ=
DBSJbm=3D56A@mail.gmail.com/
> >
> > Does the current approach fully address the race concern? While removin=
g
> > close_fd() prevents the specific file descriptor hijacking issue, the
> > suggestion was to finalize the log before security_bpf_map_create(),
> > which would avoid creating the race window in the first place.
> >
> > Is there a reason why the log finalization cannot be moved earlier as
> > Alexei suggested?
> >
> I've tried his suggestion, attached below.
>
> However, I think there should be a simpler approach to fix it.
>
> I preferred this simple one, so I posted it.
>
> Should I follow the suggestion instead of this trade-off approach?
>
> Thanks,
> Leon
>
> ---
>
> From 7ea7ab53d24b7cf34bd2775ef5c871aa312d07c6 Mon Sep 17 00:00:00 2001
> From: Leon Hwang <leon.hwang@linux.dev>
> Date: Tue, 19 May 2026 10:32:01 +0800
> Subject: [PATCH bpf-next 2/5] bpf: Fix concurrent regression in map_creat=
e()
>
> Because there is time gap between bpf_map_new_fd() and close_fd(), a
> concurrent thread is able to close the new fd and opens a new, unrelated
> file with the exact same fd number. Thereafter, this close_fd() might
> inadvertently close the unrelated file.
>
> To avoid such regression, add bpf_log_attr_finalize() before
> security_bpf_map_create() to report log_true_size on check-success path.
>
> While keep the original bpf_log_attr_finalize() and avoid finalizing
> bpf_log_attr twice, guard the finalization using attr_log->finalized.
>
> Fixes: 49f9b2b2a18c ("bpf: Add syscall common attributes support for
> map_create")
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  include/linux/bpf_verifier.h |  1 +
>  kernel/bpf/log.c             |  4 ++++
>  kernel/bpf/syscall.c         | 21 ++++++++++++++-------
>  3 files changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
> index 20c421b43849..a10ef58bb6ea 100644
> --- a/include/linux/bpf_verifier.h
> +++ b/include/linux/bpf_verifier.h
> @@ -788,6 +788,7 @@ struct bpf_log_attr {
>         u32 level;
>         u32 offsetof_true_size;
>         bpfptr_t uattr;
> +       bool finalized;
>  };

No. That looks worse.
The suggestion was to do the finalize log _once_ before
allocating FD.
Why are you doing it twice?
