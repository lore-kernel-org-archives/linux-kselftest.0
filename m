Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE8A3A9630
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 18:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697577; cv=pass; b=IvGX0IZkizCT5+g+MoI+bLXV+AXlPMuNxIsv3ltGfi4L27CwxnL1+vjSnyinCpIHUryzya4Rbo4P1/ShnuL0SrROaOhTscndgq4Hn/bHZn1tb9TFt1v/OiaelPgRN9PBCRX1gBm0K0ZxELWkYESM4MLJRqLEHeQbXa06k2QQZQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697577; c=relaxed/simple;
	bh=QEESRfoyXDdi4AN3KpeDBP8YePxV7Zv0W2A2BR+aluM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mCpCTL21c4dLGJYq8ToZYXJKLDiba6hLFuxSXwE3YYfnJZHnaza43T+YbWrAS30E20xhE5Pzg6/lrvpAEXdut94DnnZ/lx8ZT6nzzrwKKYHb78JllhAih1MgS2ASaulUhGpMRwswNU84DNgQPhmLRP5y14X8ahO3seobEqLTeOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QSUlSaQL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OymkWzWO; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QSUlSaQL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OymkWzWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778697574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ROcBtD9Wr7UD9hLCfUAUnfLLz4HmQcTljHWV4B5LJ+A=;
	b=QSUlSaQLpOiquCteC+ZQUAJR3r2Ow4lyAlMyEy5hBrA3iieadXZAacUwoNgsRT15T6jXce
	tOEdqG60hXhJkA1Cae+b84rN3wC/M5L+5CRYJnxwNTRqzwDjAiMBe0N4KIbv5Y5wctD1mb
	agpojO4O+w0IYUlHweNqAcLSP03aWG0=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-uWDxrisiPpaSZx3gtHJZUA-1; Wed, 13 May 2026 14:39:32 -0400
X-MC-Unique: uWDxrisiPpaSZx3gtHJZUA-1
X-Mimecast-MFC-AGG-ID: uWDxrisiPpaSZx3gtHJZUA_1778697571
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-651c0aae418so14203746d50.2
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 11:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778697571; cv=none;
        d=google.com; s=arc-20240605;
        b=a3PaBB1oGcYe9b+xlba4XKMm9ZU4rEzY5zp+Mm0oq51erlw0AmVhoIdvviIH/uqWx2
         Q1Wz7okJBCA9e813pOLOSN8vBVM+dbhl4EmPTDbXqJMdgJOZhKNslV7JmSFByzl2zTfq
         JpsRTGoPg/KEowqbqp1t5xvMUdDWSTeI1o5x/0U2np1qmzFrHJxuQpTqSB+D2+F837Cg
         ZPD/p1VJYTAY05o8A8gh1l098TtaJNsjnonCI/kS6kAvvHramgPowMRjmJjYKG5lSsUX
         C6PjdQ7dem7uDhbt6SB8Rcl8rb3omkULGeXiLFlASgbB2orAgSgNvMEA4VLJ55265hT4
         CWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ROcBtD9Wr7UD9hLCfUAUnfLLz4HmQcTljHWV4B5LJ+A=;
        fh=jaQ91BHiBZ0Ao69Z8WJetwoNFNzYo7YlPjW+4PPA+Co=;
        b=U2tBMbSiFrsDEMCw9Kxjx/eJGYH5p67Q46CrKePTzGDhF9duomMxyHv0zn3nB1CbEq
         7OQhq3eyjiDfNtsBqivT2QqVy59EFTj24T1Tzq8+PNePRdlsyzzYgKivAjFLrD9V3xqi
         IeCdCWbHYfeB7XlPiKto3h5GgprUq9MPSy+2sPNHO27WQdfRJY3U/nHc6NNFA/gPw2nU
         6jgp74tQJKA7BysFCYdniAJCr1U5bIPymgWrV5u6/0+9QgYJUpJAsYdQpM1Fmjxb10TN
         iJ6bslv8PyO+N0U0NzJVQZwGUXiB52s98l/QUSz9PelY9r8Kv7G2SMpxdkkGq+NvoEYx
         hKUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778697571; x=1779302371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROcBtD9Wr7UD9hLCfUAUnfLLz4HmQcTljHWV4B5LJ+A=;
        b=OymkWzWOHSj1Vom/xbRQHL163Bvyqesl/S+fEUGGww/PrPR2RHFhxf+ru3eHmmTwpr
         G4T2AF/Gt1iKYT+y+LQV7J8C7gf4EaZon3I0Wzs9o5kbZGdyJ0FxCmybL80+qeLlM82x
         MtDq1iGERE4mu1S7HPZ3CRzBQRzKaVTVwO//jYUaSmouauP6bBv8wQxbWrpPrcrPEbnE
         kzS9y2N/nOHHnkYHKz1EMiUl7RBq/60Gu1fZTE8LR2EtsI8rYXXZyL17GHle3yv3QQGy
         RAyIDzFqY95mOA8yvnsE8EgC8wuxxUBinQYoKkcpb7K/edA7IxEtvPsn0dveWOlms1pj
         I4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697571; x=1779302371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ROcBtD9Wr7UD9hLCfUAUnfLLz4HmQcTljHWV4B5LJ+A=;
        b=tCgXcx6fsgXYVK6LOaAe7A0YQbxIPOLuI1obmLlHxeta19uuMo0xa6DbiubF/vOYfd
         y+F1FVezoCB2Z7LjYmxx0+M76SVkUW8lpin8NDCjdsur+DTUKxTPk1zyJu1ohBTaMnBi
         sgVzJFObSO3Tp/7Ppg0aY3CObsqdFsifVb0Pb88QMOtzO1CbY5WEJ8aipnt6E+Dw83BY
         QLyAFAYGSCC8OSOXvNsDbUf0P/g60JADPSOSLBBl1bFV6YQ/BIrLRZjX9vfpZyxEQpoT
         qEQ6IzWgS4BU5GOf/FV4bqxtnWS+Hn5z/NsAKkjniZJr8XYkUErNcpAKvT6/T3i1ahUb
         w21Q==
X-Forwarded-Encrypted: i=1; AFNElJ+UzMa5bhRX9PzkCbeB0VbYVZTTyBHgUmIp6rMRBkHjQoVNw7yR7Rdv7HeQ9+A/CFh25jlO33npX++EF4c+FQc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3PohVIloJ54bY7bHa2l+0MhX+4iVjgjahOSLlkj4olvK2aa4r
	R0sJneLHCYtUBx2tkGIq9oxf0rhFU9gafdGrOQ9SWwzYLt1Vy112T4nna2xOG738k7uBAA2Rqy0
	nh3zAGfJSlN2MrUsrqN01ECuCW8DIIHjGgEiT8L4RHwm7cbez7QX1j2Lvw2AkDi66+5BtvH1szn
	2n67vvS5HpKqsTPhNfuXIt9VTIZfXehqYvQQrXvKqV9vsr
X-Gm-Gg: Acq92OH4gpiyHBi/thxL4A7PzzK9BTTg+d5dXbrguU87t2L9st/2NTUVt42A1HFnqyn
	skyif0uJb242NaBMqaMan4cvdVuOIZ2Nn5rqlNagL3LOQS3PxbeWfRoJC3HelejjNZmxsamHwCN
	oveDW060aZgSCkI+IB/osHv+YtFKp8k6TCxpv+U4b4RWXT/bklTXo5Q2zrmhZrdsCPWZKrodKEu
	ZlHKw==
X-Received: by 2002:a05:690c:c50c:b0:7bd:b048:868 with SMTP id 00721157ae682-7c6a96520e4mr46024427b3.8.1778697566268;
        Wed, 13 May 2026 11:39:26 -0700 (PDT)
X-Received: by 2002:a05:690c:c50c:b0:7bd:b048:868 with SMTP id
 00721157ae682-7c6a96520e4mr46023727b3.8.1778697565577; Wed, 13 May 2026
 11:39:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-v2_20230123_tjmercier_google_com-v1-0-6326701c3691@redhat.com>
 <20260512-v2_20230123_tjmercier_google_com-v1-2-6326701c3691@redhat.com>
 <8ef38815-6ae9-4359-86d4-042554357639@amd.com> <CADSE00KZMJFYJ92XZa=r9EeJJRGT=SNChwOW-_jTznc7F79xGw@mail.gmail.com>
 <CABdmKX3R5faNgFva-HHVhtTcxJ0_BK9Rei3iTQcA+SRwdKv1Aw@mail.gmail.com>
In-Reply-To: <CABdmKX3R5faNgFva-HHVhtTcxJ0_BK9Rei3iTQcA+SRwdKv1Aw@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 13 May 2026 20:39:13 +0200
X-Gm-Features: AVHnY4J21kmZlUCM-w5PvXODvvzSq2oNDCUeY291YyLwyrvx79YmoPZ2KHgaokM
Message-ID: <CADSE00KO3gKEOEQ6dEwjgjbYGNotZJ-SRNYjhvqp74dJfu-msg@mail.gmail.com>
Subject: Re: [PATCH RFC 2/5] dma-heap: charge dma-buf memory via explicit memcg
To: "T.J. Mercier" <tjmercier@google.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
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

On Wed, May 13, 2026 at 6:39=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Wed, May 13, 2026 at 5:41=E2=80=AFAM Albert Esteve <aesteve@redhat.com=
> wrote:
> >
> > On Tue, May 12, 2026 at 12:14=E2=80=AFPM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> > >
> > > On 5/12/26 11:10, Albert Esteve wrote:
> > > > On embedded platforms a central process often allocates dma-buf
> > > > memory on behalf of client applications. Without a way to
> > > > attribute the charge to the requesting client's cgroup, the
> > > > cost lands on the allocator, making per-cgroup memory limits
> > > > ineffective for the actual consumers.
> > > >
> > > > Add charge_pid_fd to struct dma_heap_allocation_data. When set to
> > > > a valid pidfd, DMA_HEAP_IOCTL_ALLOC resolves the target task's
> > > > memcg and charges the buffer there via mem_cgroup_charge_dmabuf()
> > > > inside dma_heap_buffer_alloc(). Without charge_pid_fd, and with
> > > > the mem_accounting module parameter enabled, the buffer is charged
> > > > to the allocator's own cgroup.
> > > >
> > > > Additionally, commit 3c227be90659 ("dma-buf: system_heap: account f=
or
> > > > system heap allocation in memcg") adds __GFP_ACCOUNT to system-heap
> > > > page allocations. Keeping __GFP_ACCOUNT would charge the same pages
> > > > twice (once to kmem, once to MEMCG_DMABUF), thus remove it and rout=
e
> > > > all accounting through a single MEMCG_DMABUF path.
> > > >
> > > > Usage examples:
> > > >
> > > >   1. Central allocator charging to a client at allocation time.
> > > >      The allocator knows the client's PID (e.g., from binder's
> > > >      sender_pid) and uses pidfd to attribute the charge:
> > > >
> > > >        pid_t client_pid =3D txn->sender_pid;
> > > >        int pidfd =3D pidfd_open(client_pid, 0);
> > > >
> > > >        struct dma_heap_allocation_data alloc =3D {
> > > >            .len             =3D buffer_size,
> > > >            .fd_flags        =3D O_RDWR | O_CLOEXEC,
> > > >            .charge_pid_fd   =3D pidfd,
> > > >        };
> > > >        ioctl(heap_fd, DMA_HEAP_IOCTL_ALLOC, &alloc);
> > > >        close(pidfd);
> > > >        /* alloc.fd is now charged to client's cgroup */
> > > >
> > > >   2. Default allocation (no pidfd, mem_accounting=3D1).
> > > >      When charge_pid_fd is not set and the mem_accounting module
> > > >      parameter is enabled, the buffer is charged to the allocator's
> > > >      own cgroup:
> > > >
> > > >        struct dma_heap_allocation_data alloc =3D {
> > > >            .len      =3D buffer_size,
> > > >            .fd_flags =3D O_RDWR | O_CLOEXEC,
> > > >        };
> > > >        ioctl(heap_fd, DMA_HEAP_IOCTL_ALLOC, &alloc);
> > > >        /* charged to current process's cgroup */
> > > >
> > > > Current limitations:
> > > >
> > > >  - Single-owner model: a dma-buf carries one memcg charge regardles=
s of
> > > >    how many processes share it. Means only the first owner (and exp=
orter)
> > > >    of the shared buffer bears the charge.
> > > >  - Only memcg accounting supported. While this makes sense for syst=
em
> > > >    heap buffers, other heaps (e.g., CMA heaps) will require selecti=
vely
> > > >    charging also for the dmem controller.
> > >
> > > Well that doesn't looks soo bad, it at least seems to tackle the prob=
lem at hand for Android and some of other embedded use cases.
> > >
> > > I'm just not sure if this is future prove and will work for all use c=
ases, e.g. cloud gaming, native context for automotive etc...
> > >
> > > Essentially the problem boils down to two limitations:
> > > 1) a piece of memory can only be charged to one cgroup, the framework=
 doesn't has a concept of charging shared memory to multiple groups
> > > 2) when memory references in the form of file descriptors are passed =
between applications we have no way of changing the accounting to a differe=
nt cgroup
> > >
> > > The passing of the memory reference already has a well defined uAPI a=
nd if we could solve those two limitations we not only solve the problem wi=
thout introducing new uAPI (with potential new security risks) but also sol=
ve it for all other use cases which uses file descriptors as well as. E.g. =
memfd, accel and GPU drivers etc...
> >
> > Honestly, adding a hook to fd-passing uAPI to manage charge transfers
> > sounds like a promising solution requiring no uAPI changes. However,
> > it still does not cover all paths, e.g., dup() or fork(). And shared
> > memory sounds like a hard one to tackle, where deciding the best
> > policy is more a per-usecase thing and would probably require
> > userspace configuration.
>
> I'm curious if anyone knows of a use case where FDs aren't involved at
> all? It's possible to fork() or clone() with only a dmabuf mapping and
> no FD. That sounds strange, and I'm not sure there's a real usecase
> for transferring ownership with that approach, but figured I'd at
> least pose the question.

Yeah, that's a good point. I do not really have a usecase myself for
fork(), just thought of it as a posible gap/uncovered path.

>
> > All in all, charge_pid_fd covers a
> > well-defined and immediately practical subset. The UAPI cost is small
> > and the mechanism is explicit about what it does and doesn't solve. A
> > general solution, if it ever converges, would likely supersede
> > charge_pid_fd for most cases, which is a fine outcome if it solves the
> > problem more completely.
> >
> > Either way, if you have a specific approach in mind for solving any of
> > the above limitations, I'd be happy to look into it further.
> >
> > BR,
> > Albert.
> >
> > >
> > > On the other hand it is really nice to finally see this tackled for a=
t least DMA-buf heaps. On the GPU side I have seen just another try of a dr=
iver doing some kind of special driver specific accounting to solve this ju=
st a few weeks ago. And to be honest such single driver island approach hav=
e the tendency to break more often that they are working correctly.
> > >
> > > Regards,
> > > Christian.
> > >
> > > >
> > > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > > ---
> > > >  Documentation/admin-guide/cgroup-v2.rst |  5 ++--
> > > >  drivers/dma-buf/dma-buf.c               | 16 ++++---------
> > > >  drivers/dma-buf/dma-heap.c              | 42 +++++++++++++++++++++=
+++++++++---
> > > >  drivers/dma-buf/heaps/system_heap.c     |  2 --
> > > >  include/uapi/linux/dma-heap.h           |  6 +++++
> > > >  5 files changed, 53 insertions(+), 18 deletions(-)
> > > >
> > > > diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentatio=
n/admin-guide/cgroup-v2.rst
> > > > index 8bdbc2e866430..824d269531eb1 100644
> > > > --- a/Documentation/admin-guide/cgroup-v2.rst
> > > > +++ b/Documentation/admin-guide/cgroup-v2.rst
> > > > @@ -1636,8 +1636,9 @@ The following nested keys are defined.
> > > >               structures.
> > > >
> > > >         dmabuf (npn)
> > > > -             Amount of memory used for exported DMA buffers alloca=
ted by the cgroup.
> > > > -             Stays with the allocating cgroup regardless of how th=
e buffer is shared.
> > > > +             Amount of memory used for exported DMA buffers alloca=
ted by or on
> > > > +             behalf of the cgroup. Stays with the allocating cgrou=
p regardless
> > > > +             of how the buffer is shared.
> > > >
> > > >         workingset_refault_anon
> > > >               Number of refaults of previously evicted anonymous pa=
ges.
> > > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > > index ce02377f48908..23fb758b78297 100644
> > > > --- a/drivers/dma-buf/dma-buf.c
> > > > +++ b/drivers/dma-buf/dma-buf.c
> > > > @@ -181,8 +181,11 @@ static void dma_buf_release(struct dentry *den=
try)
> > > >        */
> > > >       BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
> > > >
> > > > -     mem_cgroup_uncharge_dmabuf(dmabuf->memcg, PAGE_ALIGN(dmabuf->=
size) / PAGE_SIZE);
> > > > -     mem_cgroup_put(dmabuf->memcg);
> > > > +     if (dmabuf->memcg) {
> > > > +             mem_cgroup_uncharge_dmabuf(dmabuf->memcg,
> > > > +                                       PAGE_ALIGN(dmabuf->size) / =
PAGE_SIZE);
> > > > +             mem_cgroup_put(dmabuf->memcg);
> > > > +     }
> > > >
> > > >       dmabuf->ops->release(dmabuf);
> > > >
> > > > @@ -764,13 +767,6 @@ struct dma_buf *dma_buf_export(const struct dm=
a_buf_export_info *exp_info)
> > > >               dmabuf->resv =3D resv;
> > > >       }
> > > >
> > > > -     dmabuf->memcg =3D get_mem_cgroup_from_mm(current->mm);
> > > > -     if (!mem_cgroup_charge_dmabuf(dmabuf->memcg, PAGE_ALIGN(dmabu=
f->size) / PAGE_SIZE,
> > > > -                                   GFP_KERNEL)) {
> > > > -             ret =3D -ENOMEM;
> > > > -             goto err_memcg;
> > > > -     }
> > > > -
> > > >       file->private_data =3D dmabuf;
> > > >       file->f_path.dentry->d_fsdata =3D dmabuf;
> > > >       dmabuf->file =3D file;
> > > > @@ -781,8 +777,6 @@ struct dma_buf *dma_buf_export(const struct dma=
_buf_export_info *exp_info)
> > > >
> > > >       return dmabuf;
> > > >
> > > > -err_memcg:
> > > > -     mem_cgroup_put(dmabuf->memcg);
> > > >  err_file:
> > > >       fput(file);
> > > >  err_module:
> > > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.=
c
> > > > index ac5f8685a6494..ff6e259afcdc0 100644
> > > > --- a/drivers/dma-buf/dma-heap.c
> > > > +++ b/drivers/dma-buf/dma-heap.c
> > > > @@ -7,13 +7,17 @@
> > > >   */
> > > >
> > > >  #include <linux/cdev.h>
> > > > +#include <linux/cgroup.h>
> > > >  #include <linux/device.h>
> > > >  #include <linux/dma-buf.h>
> > > >  #include <linux/dma-heap.h>
> > > > +#include <linux/memcontrol.h>
> > > > +#include <linux/sched/mm.h>
> > > >  #include <linux/err.h>
> > > >  #include <linux/export.h>
> > > >  #include <linux/list.h>
> > > >  #include <linux/nospec.h>
> > > > +#include <linux/pidfd.h>
> > > >  #include <linux/syscalls.h>
> > > >  #include <linux/uaccess.h>
> > > >  #include <linux/xarray.h>
> > > > @@ -55,10 +59,12 @@ MODULE_PARM_DESC(mem_accounting,
> > > >                "Enable cgroup-based memory accounting for dma-buf h=
eap allocations (default=3Dfalse).");
> > > >
> > > >  static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len=
,
> > > > -                              u32 fd_flags,
> > > > -                              u64 heap_flags)
> > > > +                              u32 fd_flags, u64 heap_flags,
> > > > +                              struct mem_cgroup *charge_to)
> > > >  {
> > > >       struct dma_buf *dmabuf;
> > > > +     unsigned int nr_pages;
> > > > +     struct mem_cgroup *memcg =3D charge_to;
> > > >       int fd;
> > > >
> > > >       /*
> > > > @@ -73,6 +79,22 @@ static int dma_heap_buffer_alloc(struct dma_heap=
 *heap, size_t len,
> > > >       if (IS_ERR(dmabuf))
> > > >               return PTR_ERR(dmabuf);
> > > >
> > > > +     nr_pages =3D len / PAGE_SIZE;
> > > > +
> > > > +     if (memcg)
> > > > +             css_get(&memcg->css);
> > > > +     else if (mem_accounting)
> > > > +             memcg =3D get_mem_cgroup_from_mm(current->mm);
> > > > +
> > > > +     if (memcg) {
> > > > +             if (!mem_cgroup_charge_dmabuf(memcg, nr_pages, GFP_KE=
RNEL)) {
> > > > +                     mem_cgroup_put(memcg);
> > > > +                     dma_buf_put(dmabuf);
> > > > +                     return -ENOMEM;
> > > > +             }
> > > > +             dmabuf->memcg =3D memcg;
> > > > +     }
> > > > +
> > > >       fd =3D dma_buf_fd(dmabuf, fd_flags);
> > > >       if (fd < 0) {
> > > >               dma_buf_put(dmabuf);
> > > > @@ -102,6 +124,9 @@ static long dma_heap_ioctl_allocate(struct file=
 *file, void *data)
> > > >  {
> > > >       struct dma_heap_allocation_data *heap_allocation =3D data;
> > > >       struct dma_heap *heap =3D file->private_data;
> > > > +     struct mem_cgroup *memcg =3D NULL;
> > > > +     struct task_struct *task;
> > > > +     unsigned int pidfd_flags;
> > > >       int fd;
> > > >
> > > >       if (heap_allocation->fd)
> > > > @@ -113,9 +138,20 @@ static long dma_heap_ioctl_allocate(struct fil=
e *file, void *data)
> > > >       if (heap_allocation->heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
> > > >               return -EINVAL;
> > > >
> > > > +     if (heap_allocation->charge_pid_fd) {
> > > > +             task =3D pidfd_get_task(heap_allocation->charge_pid_f=
d, &pidfd_flags);
> > > > +             if (IS_ERR(task))
> > > > +                     return PTR_ERR(task);
> > > > +
> > > > +             memcg =3D get_mem_cgroup_from_mm(task->mm);
> > > > +             put_task_struct(task);
> > > > +     }
> > > > +
> > > >       fd =3D dma_heap_buffer_alloc(heap, heap_allocation->len,
> > > >                                  heap_allocation->fd_flags,
> > > > -                                heap_allocation->heap_flags);
> > > > +                                heap_allocation->heap_flags,
> > > > +                                memcg);
> > > > +     mem_cgroup_put(memcg);
> > > >       if (fd < 0)
> > > >               return fd;
> > > >
> > > > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/=
heaps/system_heap.c
> > > > index 03c2b87cb1112..95d7688167b93 100644
> > > > --- a/drivers/dma-buf/heaps/system_heap.c
> > > > +++ b/drivers/dma-buf/heaps/system_heap.c
> > > > @@ -385,8 +385,6 @@ static struct page *alloc_largest_available(uns=
igned long size,
> > > >               if (max_order < orders[i])
> > > >                       continue;
> > > >               flags =3D order_flags[i];
> > > > -             if (mem_accounting)
> > > > -                     flags |=3D __GFP_ACCOUNT;
> > > >               page =3D alloc_pages(flags, orders[i]);
> > > >               if (!page)
> > > >                       continue;
> > > > diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma=
-heap.h
> > > > index a4cf716a49fa6..e02b0f8cbc6a1 100644
> > > > --- a/include/uapi/linux/dma-heap.h
> > > > +++ b/include/uapi/linux/dma-heap.h
> > > > @@ -29,6 +29,10 @@
> > > >   *                   handle to the allocated dma-buf
> > > >   * @fd_flags:                file descriptor flags used when alloc=
ating
> > > >   * @heap_flags:              flags passed to heap
> > > > + * @charge_pid_fd:   optional pidfd of the process whose cgroup sh=
ould be
> > > > + *                   charged for this allocation; 0 means charge t=
he calling
> > > > + *                   process's cgroup
> > > > + * @__padding:               reserved, must be zero
> > > >   *
> > > >   * Provided by userspace as an argument to the ioctl
> > > >   */
> > > > @@ -37,6 +41,8 @@ struct dma_heap_allocation_data {
> > > >       __u32 fd;
> > > >       __u32 fd_flags;
> > > >       __u64 heap_flags;
> > > > +     __u32 charge_pid_fd;
> > > > +     __u32 __padding;
> > > >  };
> > > >
> > > >  #define DMA_HEAP_IOC_MAGIC           'H'
> > > >
> > >
> >
>

