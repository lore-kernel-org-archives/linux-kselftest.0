Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE1B33F586
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 19:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070447; cv=pass; b=MCTfpRHAP2yzfyVacGcMcAHNk/ZFj+J1PHch26XSJ8T0SaO6zTJAHXhUNfH3MObKM22Njan+31J9X5j11ZEnXjX/mbTULvONIiVaSScg1VlAuIq13jKBYOmuS8+09ElRjz9bw3rcimI4Cp0j8GW3dKu80hKPsRcqIYFHtMrDkAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070447; c=relaxed/simple;
	bh=oPmpGJgra+J/X4ds4wcUHLxA6Eg7GvkHp+DXASeWwJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nb2bGhrOw5rLkWxnpyhgeMKbfj9pu/AWn991L+nmHLCf/55RWmJtemKeRL5jROIYWdgReqk2PVcMtNekRIQuRfQH/1GzPASG1lRh0/3MeRP9SC9UQNjuWld3ol5kpEVB11PmJdL3PwsVMG8ynigp8JaHVGFlAruIMvIXzZAxhf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a1//AZe5; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a1//AZe5"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9bfcbaa81eso12315966b.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 12:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775070444; cv=none;
        d=google.com; s=arc-20240605;
        b=Hu8SQZTBAHbnK1v+CgMyAFOQv4FUUu3tQN9oI+r187UHr6Wrh6w9qnGV/bIxTFci58
         bOj0eO5Gt25t59dqSa4oMq5MTjdHEkqtk1dIyVy+kv5IZTdZw2I6eyNIs8LtSBmenHvB
         Gmx33FygfsWMASR9FQXTry8cmjJ6GTXJ4XvqeE6edZSmHDmi+V8uDpRhnJ45ZhmBEzcG
         73DwhBEu8MvgqUKOjs2Za9Fk4ccW5AzPgrfPMtTty+t6N0pmpsSwz1N95Qp/SbDNLbHD
         Bj9TwGtjLJkDkph0m34yyBsGATjVeqrrI7KkfrpU2X95X8ObG+GKiPioNq7eXFsc2oT4
         0BNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tbulKj8l3zNdTBhluioK0AGuzttA7TtmTV4oAVYitSw=;
        fh=1hPn0vxQzk76yGUm+nYXpBUMc/LIzWOsWubXoallBIo=;
        b=IMVPDLe7iEqtJCy7kQQhHPbqP2veUm0s7v/4/bMOCtf8gYQgJNsRQK33A+E3mqNGUl
         x7h/afYpkFJ3+quJTd+Q2/+bIcToT8jITBIfouPq1ziIpvWgh++3cNEtpvas62Wnyskm
         xtc7u+0uSQTrmbiT8LfyKQvsXUV1ImMTp9LOXw7OwEWLu8vpczbaQVK8IAwJVOt85fis
         5eRZfdd+jw2ur6D/sue4oLuaATjnnZVjVM7znfrSvNxWoyLZul+PGZirorxHegG8GZfc
         +uplrK0MlOxnGVw3z4Ye49D8qt3yoGo7dG+p7ZuJoTSUnr6K7exZNvCPCH5ALUWXf/wA
         u2hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775070444; x=1775675244; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbulKj8l3zNdTBhluioK0AGuzttA7TtmTV4oAVYitSw=;
        b=a1//AZe5DdgS5fEZq0/0QEqk9mG6WFqo1M2mVCPIGwJratfVF9Q8YNqsXDe1cUWJax
         fsuZz6klosQzCNo9xAyYm3I1UogQscr6pdkjOPiNqV4//KkaFAj90Sm5wF5p2I27SLCb
         aQcLgWyAXcEZjyAknqF176bxnWUWElv1qfbL+4lqrCKOCdMejByVmHZTb9qYr9fyiFly
         c4yarJIxvfSV96KdkRV6sIVyDg8aalM9zaMEXYjhHTnwwWGJl6ZuMT0sghhzAHb2OkMZ
         6sDqT6BulxNVCVECJVB09GPwU0xos9b3u+D0FOtstJidKEivN2T0LfuTJAKj5YkwEl2h
         otRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070444; x=1775675244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tbulKj8l3zNdTBhluioK0AGuzttA7TtmTV4oAVYitSw=;
        b=iJ8cR5UsKNnqItKd379FOjEpqGe3zgoTTt6LMNzxOU92RjRTpKWisacao8dAxoOR2F
         ODSkYsHT1o7otaPugARDDp5I9+dzUPxDyvWhaa87yzis+kFirwHW6TU+quyrKBXugr5S
         4ft+2gsyzrsHgzXsj2nGekb9lSie/w/HBt+Bo7k5Nip5wsN96s8WomVgIn4OvyVnP7V7
         UdYx7RCP/wBRIj3IsmOZ8+EDjFktjFYUWzolKG+pzPqmqX0vwjoBOkIKGGX98qbC+rVV
         WjR7+1yfYOT2JdmVUYhGp7sF/92UsKhA6yAC+BSZDgu3IOuj9Z7I10njwxLiUU8RZn8U
         rIqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpV7tf8Q0mKjkG/5CgWaeoLnLKi6E+IeQVcCQydnxx4qD7d1r/w9yVPko/3LX4IjtpXDGqAatRNiOZpN1EY+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ/D3ao2n0MdBLo63FH50DG7vKoI9sdXFGz2YZiSeOFOCfSrTx
	zJ1o8IIlzdkUr/E//ew8/NJOfhwm0nrHKeNsqvQ8toAWrRneje6ufbkPI5kDKgGShPGdi8w4ooS
	BAJ+13u5szIl6EaPB8XhGG2I2nt7sfeNNW0z1pg46
X-Gm-Gg: ATEYQzwLtAcqwhM2l/JVx5Ku1eGA0bqFnobaiK1/tLZww6t+CC246R3Ag35GijNv53j
	QzjskdGMzevZhuqymV7ZKSvpzYcEIlC1Gm2DwmSzmIiDPAvfwel9N2nGU2zmMIUI6DJSmRWIesV
	7pkjcdIzQ9l9stFgqIsSKfPHtb4q7XcMvUtK9kThgDTrh+E9rpwgvs8OCVDm9Hvgy/JCOAaap1f
	/NMhUtPFwDLDdTX5pEPsa7qSAEZqNj+cuLvS/7BLFEF+F+bQoPvtKf1IYeU7k5C/2NgR+GGgHD0
	Eleua7awgqadkr0KGG4CY81L8gNxEfw2s1KO3g==
X-Received: by 2002:a17:906:194a:b0:b9b:e5d:71df with SMTP id
 a640c23a62f3a-b9c1390345cmr238853766b.19.1775070443780; Wed, 01 Apr 2026
 12:07:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331153413.2469218-1-wusamuel@google.com> <2026040136-ocelot-simply-8981@gregkh>
In-Reply-To: <2026040136-ocelot-simply-8981@gregkh>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 1 Apr 2026 12:07:12 -0700
X-Gm-Features: AQROBzDAv1zFg2qxt-3Ch7XBslSJIDWmAx0yiNuGqnKyk-N-jI_iMZvmNf44ICs
Message-ID: <CAG2KctokEVVuhrs6tYuMjFF4ALR=tX80iZHrt4bhVvEKyoHzRQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Support BPF traversal of wakeup sources
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 2:15=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 31, 2026 at 08:34:09AM -0700, Samuel Wu wrote:
> > This patchset adds requisite kfuncs for BPF programs to safely traverse
> > wakeup_sources, and puts a config flag around the sysfs interface.
> >
> > Currently, a traversal of wakeup sources require going through
> > /sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls to qu=
ery
> > sysfs is inefficient, as there can be hundreds of wakeup_sources, with =
each
> > wakeup source also having multiple attributes. debugfs is unstable and
> > insecure.
>
> Describe "inefficient" please?

Ack; I=E2=80=99ll provide a more detailed breakdown in the v4 cover letter.=
 To
summarize: the "inefficiency" isn't just the number of sources (150),
but the fact that each source has 10 attributes. We are looking at
1,500+ sysfs nodes to get a full snapshot of the system.

>
> And if you really think that doing an open/read/close on a virtual
> filesystem is inefficient, then I have the syscall for you!
>
> I've been trying to get readfile() accepted every few years, looks like
> I last tried in 2020:
>         https://lore.kernel.org/r/20200704140250.423345-1-gregkh@linuxfou=
ndation.org
> but I keep the patchset up to date in my local tree all the time.
>
> Would that help you out here instead?

`readfile()` seems like it would be a great optimization for many
usecases, but it doesn't solve the context switch bottleneck.
Additionally, current userspace implementations attempt to speed up
this traversal by caching fds, so this new syscall wouldn't help as
much as one might initially expect.

> > Adding kfuncs to lock/unlock wakeup sources allows BPF program to safel=
y
> > traverse the wakeup sources list. The head address of wakeup_sources ca=
n
> > safely be resolved through BPF helper functions or variable attributes.
>
> Who is going to be calling this?

BPF programs call the new kfuncs. I realized I left some stale text in
the v2 cover letter regarding the interface; I'll clean that up for
the next version to make this point clearer.

> > On a quiescent Pixel 6 traversing 150 wakeup_sources, I am seeing ~34x
> > speedup (sampled 75 times in table below). For a device under load, the
> > speedup is greater.
> > +-------+----+----------+----------+
> > |       | n  | AVG (ms) | STD (ms) |
> > +-------+----+----------+----------+
> > | sysfs | 75 | 44.9     | 12.6     |
> > +-------+----+----------+----------+
> > | BPF   | 75 | 1.3      | 0.7      |
> > +-------+----+----------+----------+
>
> 150 sysfs calls in 44.9 ms feels very slow.  but really, what are you
> expecting here, sysfs should NEVER be on a "fast path" that you care
> about performance.  Why are you hammering on sysfs here?  What HAS to
> have this type of performance?
>
> In other words, what problem are you trying to solve that having access
> to 150+ sysfs files all at once in a faster way is going to fix?

The 44.9ms is the cost of reading ~1,500 sysfs nodes (150 sources * 10
attributes). This is even worse on wearables, where the compute and
power constrained platform exacerbates performance sensitivity even
more.

On these platforms, the CPU is suspended as much as possible. A
byproduct of this is that the wakeup source traversal occurs on a
user-perceptible path, which impacts battery life and UI
responsiveness.

Beyond the performance improvement, moving to BPF offers other benefits:
1. Reduce Memory: Drop the fd caching logic
2. Simplify Security: Consolidate SELinux permissions rather than
managing labels for every single *possible* wakeup_source

Thanks Greg!

-- Sam
