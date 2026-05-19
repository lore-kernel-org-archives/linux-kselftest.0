Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9680D328631
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 18:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214072; cv=pass; b=tG0ROx7EFIqbj0QoHtk2PdyBp7wbHy7ro5yPJM5JatlmLCmXZLgY8ltpusN8UjJZJRlbndAQC5QX123awU6dQdRRejWb+DCB3Cwx3wj2uQKepkxSiqEiD1LODnJ7DdIUBVYU4JnWu/0Smb+51lArfGIi5qxhpmxI6+Z0OIpteR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214072; c=relaxed/simple;
	bh=xssGkiKE0NLLgIm8hq0sx4z1JVWvwtNlxiDz+CYQuyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rL9SEJkjvg0lO5K54g9IFf/MkcPKAS/vmzOvFlfmY5ji/shFznQcKFutiOxLggeyDTtD/EW5FGDFkkvqoEmKSkHJU6L2fOE+4HdBOnQVn09sAe/I9gzuRu+qDqZ4cEnlqi14ZrFRP9/lcvX6p0xamBBjZlgI6NovXNdTiAh/H6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eWeWeIWF; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eWeWeIWF"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891ca4ce02so535e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 11:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779214069; cv=none;
        d=google.com; s=arc-20240605;
        b=eF01PLF5G3mE+Yugr+zlA3ZJLrTTJCroyscbRzNPj+0kk/vcqC7pJCHhkeBG3jL5cY
         EMNT/yiMRi+kmTbSFuOqMu945uvfZjkhZqStPeKdP5zbOoErD6aPkj6ujl2E05JLK0MN
         VpAh3OsO4DOwClGrKeP3sCU7MQ4pEKoNCLgj8Cujte1/9uiKPqwSN4ENvO3Pk/jt+QXS
         98X9CF15RiezNnANvT1i8Cima59+X6x/jObcpUxrOP2SryegsE5NsUbvYZcIWpjC6pfi
         WguZhhaT5wxjHpwy6YwAdzaM09n59rCTAfWz5LkpLXJUmC6EhtDNgG5tlZsvi4Ti341f
         CC1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xssGkiKE0NLLgIm8hq0sx4z1JVWvwtNlxiDz+CYQuyY=;
        fh=tfa5ju2c8YGP/5DjK/Rwv3AzHj4lk22IEBn+0iy5csY=;
        b=Gumht3iUWaLklsCcNtSGvDX8mkkRyAl+7rmS/tSf4bd4cW7GWRE7kSSlD/mAy82uDP
         InQoVuZdq3aMtarpndxUxv3rKO3Mq0bALgwajDqhKDcX3ZG1HGaLy/4abqhkfSk9WgVr
         n7BUKJA8YekzlpY5XutPU6zpZkOa/+8JMaRK4h/Hg06WomZOW03WVscCpo/ndz67ZiHd
         H+kpz2c0chq+RyLN92043E8ltwh2PzhgKZQIe6cMPQvoMBtMNkqBjmD6kKrCH0j47Ygr
         gh/nBEGntF9o8CM2fYh70ie03CPaCjPIUQ+EG1cyK/rzdz0BiceQXb2BQMfO5QczsT3P
         p3PA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779214069; x=1779818869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xssGkiKE0NLLgIm8hq0sx4z1JVWvwtNlxiDz+CYQuyY=;
        b=eWeWeIWFQkhgJUMtdPmPfch1gHn6y0RMODHat6KPHaMDF1OFqbY09x0XUxRQFve3Tw
         GKjCah7Z65qJy9VtD0Xk6PUxhM5gbnnmPIGPlCEpuxQohywyZ9YAuoDmCOa+72a1xeKs
         S5qZzMKHV2zKB0B9JpYcPsctQUH8Gb9XlVy0HShMsnSXwU9pIA+pP9rjSi9x+ZD9Bs3Y
         xBy3CLTe7d2Swwrnwd+u7NE7MUJinmvcZbLWYQOcJWO1eQ/orFirzO/2qg5Fq/nAfiyC
         1yInXJBRFkQP2HD67p/H19TSSyUE2k1fRPB2hpYAyVhjvkSF0KrJKlfI3BtcNnVD4Hai
         iiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779214069; x=1779818869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xssGkiKE0NLLgIm8hq0sx4z1JVWvwtNlxiDz+CYQuyY=;
        b=V4tVzcO20afx3XOxYdxxhN78DMSU6K/MxK4Sk/5JYOLNdmGH+clhwAD0BecchcprTT
         jWTEIwphUfUVLxkXraDJRuoXVgM4P0F0rPmWl8GrBIAJylw1Hm35IcPbONx2USRx+9Ql
         Rsc55V/2eD4wDGq0UjugVyTB8r2U9KhuHYJCDbSsVH6OOn3hlF/U8ormm+EFgev3Bg36
         YtMlxL7M7mTTHxHwJL9RY5VWu66wMLAwKpx8x3HaYVAb7i3htWR5NF6p8Dkz3FW4gdW/
         HHb68L+CFD/FBIv1mKALpgYHX9MZNDTpk3ReMweVSdieRYb8TTASOh1tXfHaD5MovM4C
         ZbbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+OiGStEmWIceF6o01LnISboAuyOOPZaDn16QxG/X3H6Jw/2zMmOYWh6cDLUSAbM/EGh42T4Vmt+kiyEHTtUJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmKwZmHnAFqcRgxsWA182Mj0VSXjlXbenb9UZVzAd30qSmi5op
	ulh0AyIadEK1UrUkujEoSdYxErNvdA4+t35LD/nXq8prMGXgbus30hkpeugX2aCl878DzWEi1MC
	DrxhA0jO7ZXNsdvUw7NPiqi9eZp5GDXLQL4G9qfsm
X-Gm-Gg: Acq92OFCqh1HS+zGDxAudXWE5PcYwHyr6MeDmsXZXqlt4bDENbdjlNP1GJ03tEuWCan
	eCttBQrl+bhMhs27bGaAs81RH/KCpuVnEtO0s/Vq7fDaWWO4qy2aRcx65P1RCcoX96cOuytRagD
	llqdDGNolEu6Z4QbLlPkcIKXrjvWKV+ugMnLKUBh9ou19DVvvkkDbN/hzZDEaWh30jvEfQExr1Z
	e/10nrEFO3Cz5P4QLSldX5EsN0VGAk7wnp/0Z5Xtjo7V9AlkGytVFrVuSo8YEIaZiZB+cDYitrB
	KAKJAeLFFo1Re/OUrU+2+BJ8lrQKd+xWHUFAPXKxWSDgnBUR
X-Received: by 2002:a7b:cc8b:0:b0:48f:de33:777a with SMTP id
 5b1f17b1804b1-48ffd857abfmr3637845e9.11.1779214068422; Tue, 19 May 2026
 11:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-v2_20230123_tjmercier_google_com-v1-0-6326701c3691@redhat.com>
 <20260512-v2_20230123_tjmercier_google_com-v1-2-6326701c3691@redhat.com>
 <20260515-hinschauen-effizient-9e3a05a94f2e@brauner> <CABdmKX0d6Zsg+_TxXjB80UZR23ZvXzxYoWzORgwmx=ZiuE+Nzw@mail.gmail.com>
 <208fb820-d8eb-4832-a343-ef8b360e8120@amd.com> <CADSE00Lh95ygoXGKJGsYvQGEsFV8sVmwEC3uvh8M6r3ERzaJwg@mail.gmail.com>
 <88efe10a-8b93-4a81-8279-4a5559d0f17c@amd.com> <CABdmKX3yZubjDKbVqwrjHAiKyj_ioHzOoxd0wzFbJK=PAGOqcQ@mail.gmail.com>
 <01b6eefc-c107-4f8c-9d7c-3b86f54cabaa@amd.com>
In-Reply-To: <01b6eefc-c107-4f8c-9d7c-3b86f54cabaa@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 19 May 2026 11:07:36 -0700
X-Gm-Features: AVHnY4JsuFzXOj8AzAQ7jEDe53JgzbJyOG548qhgZV3zTdsbu0QldI49eMqYz9w
Message-ID: <CABdmKX1wLoLuWPUEY3D7afQhO0AUnOE7c3iE-VkPuKdeQixBxA@mail.gmail.com>
Subject: Re: [PATCH RFC 2/5] dma-heap: charge dma-buf memory via explicit memcg
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Albert Esteve <aesteve@redhat.com>, Christian Brauner <brauner@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, mripard@kernel.org, 
	echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 12:19=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/19/26 01:39, T.J. Mercier wrote:
> > On Mon, May 18, 2026 at 7:07=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 5/18/26 14:50, Albert Esteve wrote:
> >>> On Mon, May 18, 2026 at 9:20=E2=80=AFAM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>>
> >>>> On 5/15/26 19:06, T.J. Mercier wrote:
> >>>>> On Fri, May 15, 2026 at 6:53=E2=80=AFAM Christian Brauner <brauner@=
kernel.org> wrote:
> >>>>>>
> >>>>>> On Tue, May 12, 2026 at 11:10:44AM +0200, Albert Esteve wrote:
> >>>>>>> On embedded platforms a central process often allocates dma-buf
> >>>>>>> memory on behalf of client applications. Without a way to
> >>>>>>> attribute the charge to the requesting client's cgroup, the
> >>>>>>> cost lands on the allocator, making per-cgroup memory limits
> >>>>>>> ineffective for the actual consumers.
> >>>>>>>
> >>>>>>> Add charge_pid_fd to struct dma_heap_allocation_data. When set to
> >>>>>>
> >>>>>> Please be aware that pidfds come in two flavors:
> >>>>>>
> >>>>>> thread-group pidfds and thread-specific pidfds. Make sure that you=
r API
> >>>>>> doesn't implicitly depend on this distinction not existing.
> >>>>>
> >>>>> Hi Christian,
> >>>>>
> >>>>> Memcg is not a controller that supports "thread mode" so all thread=
s
> >>>>> in a group should belong to the same memcg.
> >>>>
> >>>> BTW: Exactly that is the requirement automotive has with their nativ=
e context use case.
> >>>>
> >>>> The use case is that you have a deamon which has multiple threads we=
re each one is acting on behalve of some other process.
> >>>>
> >>>> At the moment we basically say they are simply not using cgroups for=
 that use case, but it would be really nice if we could handle that as well=
.
> >>>>
> >>>> Summarizing the requirement of that use case: You need a different c=
group for each thread of a process.
> >>>
> >>> Hi Christian,
> >>>
> >>> Thanks for sharing this atuomotive usecase. If I understand correctly=
,
> >>> the actual requirement is attributing dma-buf charges to the right
> >>> client, not putting each daemon thread in a different cgroup?
> >>
> >> Nope, exactly that's the difference.
> >>
> >> The thread acts as a filtering agent for both memory allocation and co=
mmand submission for somebody else, the process on which behalve the daemon=
 does things can even be in a client VM, completely remote over some networ=
k or even something like a microcontroller.
> >>
> >> Everything the thread does regarding CPU time, GPU driver memory alloc=
ation as well as resources like GPU processing and I/O time etc.. needs to =
be accounted to one client which can be different for each thread of the pr=
ocess.
> >>
> >> The only thing which is shared with the main process thread is CPU mem=
ory resources, e.g. malloc() because that is basically just needed for hous=
ekeeping and pretty much irrelevant for this kind of use case.
> >>
> >> The problem is now you can't do that with cgroups at the moment but un=
fortunately only the kernel has the information you need to know to do this=
.
> >>
> >> So what you end up with is to define tons of interfaces just to get th=
e necessary information from the kernel into userspace and then essentially=
 duplicate the same infrastructure cgroup provides in the kernel in userspa=
ce again.
> >>
> >>> If so,
> >>> the `charge_pid_fd` approach achieves this directly by passing the
> >>> client's `pid_fd`, without needing to add per-thread cgroup
> >>> infrastructure.
> >>
> >> Well it's already a massive improvemt, we could basically stop doing t=
he whole duplication part for the GPU driver stack and just use cgroups for=
 this part.
> >>
> >> Doing that automatically for CPU and I/O time would just be nice to ha=
ve additionally.
> >>
> >> Regards,
> >> Christian.
> >
> > Hopefully I'm following correctly here.... So you are duplicating the
> > GPU driver stack to achieve remote accounting on a per-thread basis?
>
> Not quite, we are duplicating the handling cgroup provides in the kernel =
in userspace.
>
> For this memory usage information as well as execution times of the GPU k=
ernel driver is exposed in fdinfo for example.

Oh I see, thanks.

> > Does this mean for GPU allocations you currently have some GFP_ACCOUNT
> > magic in your driver to attribute GPU memory to the correct remote
> > client?
>
> No, we just expose what the kernel driver has allocated for itself. E.g. =
page tables, buffers etc...
>
> When userspace allocates something using memfd_create() for example we ju=
st ignore that.
>
> > So this series would close the gap for dma-buf allocations,
> > but what about private GPU driver memory allocated on behalf of a
> > client?
>
> Well we would need a cgroup which isn't associated with any process were =
we could charge the GPU driver allocations against.
>
> But good point, charging against a pid wouldn't work in this use case.

It would be pretty low overhead to put a process doing while(1)
pause(); in a separate cgroup for this purpose, but I guess a fd for
the actual cgroup would be a little cleaner in this case.

> Regards,
> Christian.
