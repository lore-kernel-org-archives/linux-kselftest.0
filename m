Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84353385A5
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 23:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779147564; cv=pass; b=sZJPAFVmfWB3QjGkbp8IQsy/cLb4GHoTbiTCNwUE24dPrjSFoaIRFneGOlZS6F0Uy0kWLgJPzCesvXmgMDeHYFRHZEw7s6/OirT73gmgmy5UuTuIGDdq6NO4n3qw89oVgE880gp8Hls53Rp0UJecH74FYthziJfiseSuCjgEb2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779147564; c=relaxed/simple;
	bh=RlgWSbw/qDy0FEEgyFzO7eBFoHyyLd7vQDOSYcU9a5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpmVM6Rj7IiYGkDm+Z2KM8rZjsSz04yiJ+/0GVv+1SO3DG/VA7rYedQcQfalX1ILLmOKEa5/EB0GnzGXM4pjnTvRNnjGdfVcwkJRskywYPti45elgcdToEBYGxCvuqVYU51PeNdJyxB66bRWefpW3XoG4yGLAinhCZSMj5lPq7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aX+kKzUs; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aX+kKzUs"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so795e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 16:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779147561; cv=none;
        d=google.com; s=arc-20240605;
        b=jJhJq+yEWn7b/DM/F2VgaFfy984oRHYVFjgW1SP3rrT936oOZbQFoYfDrJWxUxhcGx
         2gFNkkvjbNgMKhCpAT8zKoC9okscbbZUYxQQs2KY+jD/QxtC5F40XTas3svp64Qnc6Ty
         1a8isiQDzJVZHEIdDkHwuJhKI05OqJzYmfovcqLpvPR9QSfFQpXKA4tL82TVAB3hsUxe
         cTqO5VMCtwWMuFAuB2+48g6NpB1lS2VVWMqPoa9TzjRuVuItcwvxvdCHeyS9jjZYxfhl
         Vk1HP1a70rZg8iqN8vTxO/+lXzOcDdPli2+3GLT60Aypg1TVclVnzm7w/wccmqxojQ6f
         cwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RlgWSbw/qDy0FEEgyFzO7eBFoHyyLd7vQDOSYcU9a5s=;
        fh=OO56KLM+49BudvHSs931+5TccyFyZPp/3HYvMeTC1lo=;
        b=i59BRmJhJC6fVSuwU0fPpbDWuoehYKY2gM4vt6L0lDr6tp3foHx/8r5kn88rIQLBit
         wi9ckFmk6jj5/T76IcaB6e+S+1d94l8dW2n6bAw8kR8mUa2i5P9RdBal/eM+TTtwaosU
         QDjz5Rs01slsXRMBs4wUkckSFfq3NVrPifJSP3M3JxoDOnEb6J42j32YzrXlH0kAj1Qz
         Krjb9Tq59O3+hThjuZ/ObLPR1e7huhzCSZaC9IejyV5fhaeMT84+TG2NapXXP/UvBMmU
         pHbqrMnyhBY8SAnRW+8UMEO6+0rZA4OpSUrTGMW9xFZcuPZOJ47sIEu/0AYHty4zJ73e
         XNJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779147561; x=1779752361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlgWSbw/qDy0FEEgyFzO7eBFoHyyLd7vQDOSYcU9a5s=;
        b=aX+kKzUsboVSf1MSKClDtOA3TnfKk+2f/C6h/5nyVGbD9QLjyaIW08h8weErzxQ8CV
         K05jrB3VojE83yb+c2TIiJHZ53CzjtK3vhBDEYgkBJbzrecfWi1eqaiES6OCvMAdd70f
         6VUC1A6T4JCWF/UBzVx7hx02iiKtejtlhO9uaTDWQJMQaUDhf+7nzaNcVT+3s0e2QUgS
         GSnujKQ3COePTRHcxTBo16Pc/2bGiAVoDMzg7hza8br6DAfoYb+m6y62mfnRfGopFZgu
         1hCCXb9CCP+V63QbmI6ny3ZzWqx7jKpPC9Uc/dskvKKvJmtPSyszZdVulhdG92zpq2eO
         11Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779147561; x=1779752361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RlgWSbw/qDy0FEEgyFzO7eBFoHyyLd7vQDOSYcU9a5s=;
        b=ljc7jtbLyo+7CVcET97tVNhHGPAvngL+v2Jpq/OIwJDSVJP8LTFUhvmToHUw2AEgKF
         FXUO5c8ECG9VWe3+60Jtg0/XkMwZ74Hoi/e5aReRQTLSwiX9GSSRnImcbrSEYKh9YG0K
         opNwI2Bzyv18T1EBYCKdk2xCxXbPeq4dzCgQx0brUhAJcT7LmEDaOscJsBoy75YhXn1s
         o19h+y3yxX8PwA7RwcR3HFhBySEcakL+yxCJmofVxaF8ZY1FArh3C3qpDGdHZcs1uwyN
         gmQjnn1gLzDgPVvOYHtNgdbQqSCvwIRHocXdJZTrQlATQX+H3X2nLcJobiCFaxizSTcU
         VOyA==
X-Forwarded-Encrypted: i=1; AFNElJ/16hBzMiFLJq/xeZMwE79aSLQSsbLVw4H8S8ecMb6NYT9XqeabuZMBBFTdkT6eSTe3nxyzUGFpPBLHTqsleUY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ayEygm6zVSXNoxkhGRmQ7gRW55I3UFmX3QIuPK3MT0hXP3u9
	j/ve9SM08E6NMaQeKJAXW2ExCnhEbq7lqqggg4zcUGMC9ZeWWiW6H6b4VY75QzCi9XFnNThcjhi
	aAWu9MKfG78Lm/AIacJN5pVmw6LaxVXYzTRYf/aaA
X-Gm-Gg: Acq92OGH1LyWcQ6OUOxpQzpVVWdoIff5gz+YU1CjZh4SbZMl4MrZ8aR+99ja74g5U0c
	wz1N73l2bX1RnoxXaXHZpQZVvTKabpJZIZHurgtzoixp4yK6Od+HBH0GffBcOb6xLjQTzkPg7lF
	+BhEBXA7oLw6wKx6AC2C8PXMTfbSDk99rcWeKfQ92JBhkAWTTcLn6y/t/ARwKqed6eNv1Pu+SC7
	ezKqfZv/MYQblnPB0SMxWXui9J97elW39YqVFdis8GyU+YJq96738KC22dpqc04ptaKk/hDr9Lb
	mU7lGH5/tKxbt0IeEM0M6x2g19WWacDyLijcGEkkxoqcUcq2
X-Received: by 2002:a05:600c:534b:b0:48f:d634:b18d with SMTP id
 5b1f17b1804b1-48ffa5e1260mr1775015e9.8.1779147560622; Mon, 18 May 2026
 16:39:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-v2_20230123_tjmercier_google_com-v1-0-6326701c3691@redhat.com>
 <20260512-v2_20230123_tjmercier_google_com-v1-2-6326701c3691@redhat.com>
 <8ef38815-6ae9-4359-86d4-042554357639@amd.com> <CABdmKX2uwZ12kYJYPJGfWxuMBOJS=64b1GRj72tfB5D=NKM22w@mail.gmail.com>
 <CAGsJ_4zjrFJYQQsLThTGXR6g+2PXzeAhjyDpLHfDFqVViWvyBQ@mail.gmail.com>
 <CABdmKX0gqg309hcXcOHSj_yTg0h1zwDL34GDk8mX3wp4YoyfDg@mail.gmail.com>
 <CABdmKX3wwgovwS-V8rVC3=+EZcTvPs_cttpQb1w6WemwLAVhsw@mail.gmail.com> <CAGsJ_4y=Gsv=FSUjJ5+99Gg6ULUnv0LRexCGOGetzChR3YA44Q@mail.gmail.com>
In-Reply-To: <CAGsJ_4y=Gsv=FSUjJ5+99Gg6ULUnv0LRexCGOGetzChR3YA44Q@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 18 May 2026 16:39:07 -0700
X-Gm-Features: AVHnY4LTFYlENC6xQVXK8AijxUAKUMiH_YZR8cEYxhyMaKCwg0sVArYGdEg8UAo
Message-ID: <CABdmKX3GgCogr9pQFybnV1p_zuo1V9fqJLCXvk-HAnk1gwLoDw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/5] dma-heap: charge dma-buf memory via explicit memcg
To: Barry Song <baohua@kernel.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Albert Esteve <aesteve@redhat.com>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, mripard@kernel.org, echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 3:19=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Tue, May 19, 2026 at 5:17=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> [...]
> > > > > Yeah I think this might work. I know of 3 cases, and it trivially
> > > > > solves the first two. The third requires some work on our end to
> > > > > extend our userspace interfaces to include the pidfd but it seems
> > > > > doable. I'm checking with our graphics folks.
> > > > >
> > > > > 1) Direct allocation from user (e.g. app -> allocation ioctl on
> > > > > /dev/dma_heap/foo)
> > > > > No changes required to userspace. mem_accounting=3D1 charges the =
app.
> > > > >
> > > > > 2) Single hop remote allocation (e.g. app -> AHardwareBuffer_allo=
cate
> > > > > -> gralloc)
> > > > > gralloc has the caller's pid as described in the commit message. =
Open
> > > > > a pidfd and pass it in the dma_heap_allocation_data.
> > > > >
> > > > > 3) Double hop remote allocation (e.g. app -> dequeueBuffer ->
> > > > > SurfaceFlinger -> gralloc)
> > > > > In this case gralloc knows SurfaceFlinger's pid, but not the app'=
s. So
> > > > > we need to add the app's pidfd to the SurfaceFlinger -> gralloc
> > > > > interface, or transfer the memcg charge from SurfaceFlinger to th=
e app
> > > > > after the allocation.
> > > > > It'd be nice to avoid the charge transfer option entirely, but if=
 we
> > > > > need it that doesn't seem so bad in this case because it's a bulk
> > > > > charge for the entire dmabuf rather than per-page. So the exporte=
r
> > > > > doesn't need to get involved (we wouldn't need a new dma_buf_op) =
and
> > > > > we wouldn't have to worry about looping and locking for each page=
.
> > > > >
> > > >
> > > > Hi T.J.,
> > > >
> > > > Your description of the three different cases sounds very interesti=
ng.
> > > > It helps me understand how difficult it can be to correctly charge
> > > > dma-buf in the current user scenarios.
> > > >
> > > > I=E2=80=99m wondering where I can find Android userspace code that =
transfers
> > > > the PID of RPC callers. Do we have any existing sample code in Andr=
oid
> > > > for this?
> > >
> > > Hi Barry,
> > >
> > > In Java android.os.Binder.getCallingPid() will provide it. Here
> >
> > ... let me try again
> >
> > Here are some examples from the framework code:
> >
> > https://cs.android.com/search?q=3DgetCallingPid%20f:ActivityManager&sq=
=3D&ss=3Dandroid%2Fplatform%2Fsuperproject
> >
> > In native code we have AIBinder_getCallingPid and
> > android::IPCThreadState::self()->getCallingPid() (or
> > android::hardware::IPCThreadState::self()->getCallingPid() for HIDL)
> >
> > https://cs.android.com/search?q=3DgetCallingPid%20l:cpp%20-f:prebuilt&s=
s=3Dandroid%2Fplatform%2Fsuperproject
>
> Thanks very much, T.J. That is very helpful. I guess
> that would require user space to understand the RPC
> procedure, including single-hop and two-hop cases, and
> make the corresponding changes.

Yes, this is solvable by having a policy in allocator services where
the caller is implicitly charged, while also supporting cases where
the RPC includes additional explicit information about who to charge.
This needs security checks to prevent arbitrary remote charges at both
the ioctl() level (selinux charge_to from patch 4), and at the RPC
level (not sure yet but maybe a private interface between system
components and gralloc), so that only privileged components can
initiate remote charges.

> You pointed out the SurfaceFlinger cases, which are
> two hops. It seems that AI models are also using
> dma_heap, at least from what I have observed on MTK
> and Qualcomm phones. Likely, we need to understand
> those RPC relationships in userspace and make the
> corresponding changes.
> I assume AI models are a single-hop case?

It's currently a mix because AI model loading is largely controlled by
vendor code right now. Some implementations use
AHardwareBuffer_allocate, but that comes with unnecessary RPC overhead
for the AI use case. So I think we should be trending towards direct
allocations from dma-buf heaps because model loading time is
important.
