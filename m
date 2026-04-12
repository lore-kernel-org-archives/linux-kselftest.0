Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA665309EEC
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Apr 2026 22:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776034152; cv=pass; b=A1N0occDy59aaHphAO9KyMPJeyvUF8Wi+ifTPB50f7RBNgJEY0x/ehHT8YwRHoHhMQD92OIpK0cbWPUmc9AWl8nhRrAQVd/FQwXsF/neJ1A9qTqVbqT5GUrqFmaqfHkzC9cTE7QLNvZHhxz7tXIZdTn+Evn0i30s4n3Ih1WmPCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776034152; c=relaxed/simple;
	bh=O5OVsiCKYjUkVc/4Ce0JG9hbx01UZGanAjUUxH4B9a0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DsWbO0eu0eA6goe6Ul8aO/7TnGnG29qK4wy00lpRWLviZJWcugqIsuRTaLEobotNjV9bAisynyxqPMxYxIXtD7s2sj4h61YEP2/YKBiDmNhjEr/Vi4PTSRpRU5Z91TmUuAlLrEKWEpTxz10ExfB6DM8omUUl0ExnB8Ag2eb2VyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzGPmV6G; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzGPmV6G"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso46332415e9.1
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Apr 2026 15:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776034149; cv=none;
        d=google.com; s=arc-20240605;
        b=MTS5AglYSCwnTz8t8H4byI7keaf6Y6SqJGlOLL/UsJmEf7rq4e5zLxo3p+/bqlLwyv
         UfJQQ9o130H8xzQowfpR5HBAfbt78+NVem4mlMcfNrgQDj5Iy6TPCIeSUw4qJmGBNUm3
         lEpZoFKnX8yGfBIM6GT0SzODFBRophTPTQVWSKVRTlasBbC5Eu5m4jJGQixOVg7umtL0
         QsNBalB0GCDU+dKaIoP1vMC4Bd8R28c6voP/GXFbwrFpj2JvA62iblqMshhwgiE3TDLj
         BJ2Zw6f1k6UWKCvttY/bCX2dhmFGRvs7u3ymLElyw0Kf7oJbg30HbDpbURl6ruQBNBJ2
         P2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O5OVsiCKYjUkVc/4Ce0JG9hbx01UZGanAjUUxH4B9a0=;
        fh=e2o2wWaIDG86mVM0ynOBWz9mpRzcoOrDLyQYpgaL2cs=;
        b=PAGYtNPgut627Z7aL2s5B0EBSwzL7iStJ5nrN+YUHpVNFBln5KORAidK5FU/fGkjtE
         vVOfNQLvWWIe+LTwNvaUeqxsjCrYFJASxUnss9Y51YLTpQV3xG+0VLNKOdxy/SzWCaZ9
         lQ2SkrsoGDSeSlzM43xNf234R2kgDbl27UInJgti586yKnVaPtO4H86vh32/jabvR5FX
         l7+rvnb4uNsqe4b9rtZEC3DPeARCM1IUyUyos/dDJhl+qrX/y8rdr44OzRB+d7Ep8IeO
         4qGD4O6zKs5ozNSPFoNPSA0cZ+9hrfhikBs9eQKZyi5C3sc/FUhhn+daq/FvvVI328kI
         46hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776034149; x=1776638949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5OVsiCKYjUkVc/4Ce0JG9hbx01UZGanAjUUxH4B9a0=;
        b=JzGPmV6G7blQOWDYd28cCLXXkn5AbGxMqcXp+JvqQ0zefugE7AKxmcExlbXyk1sH8H
         vJfCJJSC/vEayTpdcQUTtCWo56S+myiARavQHrZWO8NgvWaJI5HMcQ9t0hT8pxl8EHSk
         UAjidL2TxSPvgbRm7esxfiEhLwZjiamnf6B+kMV/PBj8vlsCEO/xoFCGYyk8Y32t1TY3
         r1zbLfXqDWCnYHEOqMAk1nLXR3WGkKWuUzGwPaGAPl72Sh8ERDGFzUHF9zqo7bs9SfX4
         qtfkftcoRxHbNX1kik2Emwn04lmgaslaB5dNOZkWDe0JEwlOSETphhvbaEH4QCYBk+Zr
         +rBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776034149; x=1776638949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O5OVsiCKYjUkVc/4Ce0JG9hbx01UZGanAjUUxH4B9a0=;
        b=SMst4Rwdx6AHIaieGKWxez5JaBw/nnD5MViZlGTUu2BLd0LDJAU4qq8XI4tDTl/UJy
         GFGGt3Ai/WH8iyqsY1rK/gHBTVBUaLQgS/WHCB5adhoo+V41LPYA9MLmh99gNcGukx+o
         3d5yTY7njWeyHRLKJ7FRbkcx6wOOplIzzTbk0y4jeK/IF8mqTiqObTzhgL3r97fL2TP9
         gHwaxwRke7z+OJO4XqJbgbwzGoDryi9qb2ozZl3ok/6M3bWu6kigwoKNYAGfs2iWH3S/
         qEb26JjKW3SOhc2loxSUHx6NnzV1iVNiGjiU3I2HTGbNLGaRfXSsZc6Q7YrOcaNtRJb8
         AVMA==
X-Forwarded-Encrypted: i=1; AJvYcCWfF9FTVJ0ECf+49v97ujaQOGFXx9SkUyR16gOiscCmPMg8TAu4jt2XKoAauY4a5zmVgfW7JBWih85jHkOc/Zg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3+bRz6w1RGWs3ZfrvF5E3uRVKhOQLZdOei67Wt6GlnY1dCKOH
	2Lae2eCnJk+f41CpwDzLkUSGQIyCQCw0cOrwJYPRgSnXwDSfg7XUNXGKmDhbFz1mAk5K3SZ1M4m
	h4M82TahU+XSBoyXPwzNATsw1KLgQEfg=
X-Gm-Gg: AeBDies2Cw2c+fTK2H+lxApQCaawPsTNyOVb5I3VfzjjiFx82e4P8nYFWyOvTlbHEfu
	YMD/b/Euz0DI2Ryh1V0iBI2MxifayCytkaf6+OFUV7Cn0PcEoCLCBiUgM1iDaHemnEeQvLA+4Gq
	4TtvPY9pH1ynn6oCC4Knwg5YXpc/2qKD0USV2oAj1at2WaS3/uEkah/HkPkBB301BmCUNHWXrCE
	fISV5o76bM42wt/aVDJZQB7KiUmgeyWIA6gsrP/eKcw3G3etyo1TtmR9zpqQeEmirj+u4FsVw+b
	h30aIRADIkUVcJ74CUIHZBkwoF7AQA3EkP+uV9H4LtGd5kA/kD2vD4fjM3tcCXVW8FlHTcxLd9e
	+rMUdoDa7DigtO9HMhAEUjaWNog==
X-Received: by 2002:a05:600c:6990:b0:488:a2ac:a34c with SMTP id
 5b1f17b1804b1-488d67f5bf5mr154924175e9.12.1776034149238; Sun, 12 Apr 2026
 15:49:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331153413.2469218-1-wusamuel@google.com> <2026040136-ocelot-simply-8981@gregkh>
 <CAG2KctokEVVuhrs6tYuMjFF4ALR=tX80iZHrt4bhVvEKyoHzRQ@mail.gmail.com>
 <2026040236-kiln-carat-bb6d@gregkh> <CAG2Kctpr7vBm_=Xz4H5FHYAfFxg=bDt35j6B4EprfUGio=Ftew@mail.gmail.com>
 <2026040357-undefined-gave-c98e@gregkh> <CAG2KctqOLeYm_NFUjGdXQcBo1KhSZpXFQxQdM-DQBV4Mn0ahTw@mail.gmail.com>
In-Reply-To: <CAG2KctqOLeYm_NFUjGdXQcBo1KhSZpXFQxQdM-DQBV4Mn0ahTw@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 12 Apr 2026 15:48:58 -0700
X-Gm-Features: AQROBzBmpL408c1tkfYuNTafpAd5aZMliRFfez61VTABAQ1oaYAiYAqJdTmdInY
Message-ID: <CAADnVQLELWyv0kuv8wK3FJVFdJPbp-tD8d3p2pgCiVrcw_cVNA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Support BPF traversal of wakeup sources
To: Samuel Wu <wusamuel@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Android Kernel Team <kernel-team@android.com>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Power Management <linux-pm@vger.kernel.org>, driver-core@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 9:28=E2=80=AFAM Samuel Wu <wusamuel@google.com> wrot=
e:
>
> On Fri, Apr 3, 2026 at 3:04=E2=80=AFAM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Apr 02, 2026 at 12:37:12PM -0700, Samuel Wu wrote:
> > > On Wed, Apr 1, 2026 at 9:06=E2=80=AFPM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Wed, Apr 01, 2026 at 12:07:12PM -0700, Samuel Wu wrote:
> > > > > On Wed, Apr 1, 2026 at 2:15=E2=80=AFAM Greg Kroah-Hartman
> > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Tue, Mar 31, 2026 at 08:34:09AM -0700, Samuel Wu wrote:
>
> [ ... ]
>
> > > The data is fundamental for debugging and improving power at scale.
> > > The original discussion and patch [1] provide more context of the
> > > intent. To summarize the history, debugfs was unstable and insecure,
> > > leading to the current sysfs implementation. However, sysfs has the
> > > constraint of one attribute per node, requiring 10 sysfs accesses per
> > > wakeup source.
> >
> > Ok, as the sysfs api doesn't work your use case anymore, why do we need
> > to keep it around at all?
> >
> > > That said, I completely agree that reading 1500+ sysfs files at once
> > > is unreasonable. Perhaps the sysfs approach was manageable at the tim=
e
> > > of [1], but moving forward we need a more scalable solution. This is
> > > the main motivator and makes BPF the sane approach, as it improves
> > > traversal in nearly every aspect (e.g. cycles, memory, simplicity,
> > > scalability).
> >
> > I'm all for making this more scalable and work for your systems now, bu=
t
> > consider if you could drop the sysfs api entirely, would you want this
> > to be a different type of api entirely instead of having to plug throug=
h
> > these using ebpf?
>
> Almost all use cases want all this data at once, so AFAICT BPF offers
> the best performance for that. But of course, open to discussion if
> there is an alternative API that matches BPF's performance for this
> use case.
>
> I'm not opposed to dropping the sysfs approach, and I attempted to do
> so in the v1 patch [1]. I'm not sure who else currently uses those
> sysfs nodes, but a config flag should remove friction and could be a
> stepping stone toward deprecation/removal.
>
> [1]: https://lore.kernel.org/all/20260320160055.4114055-3-wusamuel@google=
.com/

The patches make sense to me.

Patch 2 adds a bpf selftest and corresponding:
+CONFIG_DIBS_LO=3Dy
+CONFIG_PM_WAKELOCKS=3Dy

and almost green in BPF CI.

Except s390 that fails with:

Error: #682/1 wakeup_source/iterate_and_verify_times
Error: #682/1 wakeup_source/iterate_and_verify_times
libbpf: extern (func ksym) 'bpf_wakeup_sources_get_head': not found in
kernel or module BTFs
libbpf: failed to load BPF skeleton 'test_wakeup_source': -EINVAL
test_wakeup_source:FAIL:skel_open_and_load unexpected error: -22

We can still land it into bpf-next for this merge window.

Greg,
any objection ?

If not, Samuel, could you resend and address s390 issue?
I'm guessing wakeup sources just don't exist there.
