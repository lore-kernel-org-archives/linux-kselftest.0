Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793978518;
	b=zWUUAQSicwKh/uaw1kwSQin7Kt3/croRFuoe3cYuWV+so0LQc1eW16MD0X8NmL49d3Ac
	 M07+3m8b5upn9RdXyNYoz/iw9WLFpnbc0g82ZVnOkLR8sD/lLp5Shi1nZP4Oh5ZBdHo3B
	 /gC5DA7QeSzDPZQOkwq1QcYLhZuCwYbhyibAVkhW7nWxs0QAqtZva1TUtB1+Xz1nG2TzX
	 c3xXt7gIUiOgCG3FbYhkGLcc5QLAkxnr2J9R4Vh8//AjVePnw8yf+87cshFGCrBO94awB
	 wQHkstw1NQ8QCyyfB4DELdDrcBO2inlMH+/uVNf3ZzkWJsVUhxYPoc5Oj8qa5LooYGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978518;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=1rxOFc+cZPr208SIBHT4IjzKUbYQTfkbGhsqB2LqDE4=;
	b=DOz7TKRJGx8el2lJ/KWqGgg6NtnwLtOD3jLzmW6QEOtiSOUXCna101wd5ENmswMVI54U
	 ksTKM0Pn/wqOXe670ymDSfTGHcDXw31HRvd9EM+agX2C1sQ0c8HbDr2uEUr2FmhbPi9Hj
	 9d5H0vkNPvQ3xQOCrCDZpqAKsckdgINhJ3EDscepRhG9TOM1l3NyITXNpQUjRMzYcWvzF
	 B0GkGL8cwV4idOKYpAdaMeqzUiFtJ99/6hcsTafL6AKynJhyb4/+3ExRmlMqHB8fwRxZJ
	 L68AGj45PZUC0j3PkcrKBAf5aZ09tdoqZrb3LcUUwRuARCpe/kR5zdA/Wgou8wwbPCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Rk3NA4/h";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=s8OZ3Fjz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAA5606A33B
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 15:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AAA5606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rk3NA4/h;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=s8OZ3Fjz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793978517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1rxOFc+cZPr208SIBHT4IjzKUbYQTfkbGhsqB2LqDE4=;
	b=Rk3NA4/heY1NOD1ZtAodRhwOGY0RgmwEXwLPxqrrpIvXf7PPr+9lmtBCSDupKv856LrUvg
	3wAxjIh9KoJbY9hFCSAgpgxqW2PuULDoAqIm7OSPgD6PUnoJSNhScMTdIUYt5gM4ODP69I
	7XqJqvWv4rfP6moZMtgTord8cPu0GJs=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-XBZWDFnUMIGBhaEF4Wnt4A-1; Fri, 06 Nov 2026 10:21:56 -0500
X-MC-Unique: XBZWDFnUMIGBhaEF4Wnt4A-1
X-Mimecast-MFC-AGG-ID: XBZWDFnUMIGBhaEF4Wnt4A_1793978512
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-54213290993so428642b6e.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 07:21:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793978512; cv=none;
        d=google.com; s=arc-20260327;
        b=INMbiYYGUNzPijrkEvm3Mdjgu0IE+0jnoHgOoK9M+9apIp4lJaSmJ6RJ3oQWFewFN9
         olbQLgaw4IJdOxe4wTdis1aiGAzF4L62U5fGWzoByvOgVXHy2ntYziZPgSXW6ccjHKB8
         8NamnghV+VzTKw4bFKQmCiFuYrLBWbD+4hc26QYBfHug3ZE+X80t/xOO7Cxbzer5DeVv
         iiF3uFnvXIv58LQyni2AZERcjGgoZ//QL/Opgm1lq/qg85TVPP+4GLCw9U5pAwOzLwCh
         yw20KbAgLxMDkaSpeggQE0Pkaur+NJHzAc8++otQVwOGA08JZfDIO0KdSAngi8MnhZKl
         FVpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1rxOFc+cZPr208SIBHT4IjzKUbYQTfkbGhsqB2LqDE4=;
        fh=u1snym5CGMUzDY3n9RqSxvZtFTeV0YFETF8RlYuuTS4=;
        b=f6o19eQ4AELb/Zw7cPOOefh0xBhAoV6jjidTWaAvj2l7kZhfJZIhitFmkIlR8yPfAb
         rmLs8IDGfFcg9W2FZtJr6FRL4fPdMFxf6vqVVt4W7QD9bXSxAxMTQ5Y+UKC4rLHWctJu
         GbW3HBLRG2dqAHypTvhD7R68BDlibUfHILZYZkUmbWtbeRAG6lfOL+KPDUKaqguYbpMe
         Hpg6/9cLeUp/HjrnQZvrVulQNmh7nm797C+BO4/jeZd8ZSZeV2JdZ+C9ZCjVpyoKB6Uq
         sRM9ZknXDX41D0R9bzDukJCZB2uoYcncu7Bv6ZfKkzLNPABeHDFIR3PIS2ftG7b0D4N/
         26kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793978512; x=1794583312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1rxOFc+cZPr208SIBHT4IjzKUbYQTfkbGhsqB2LqDE4=;
        b=s8OZ3FjzHURNyBqkqIBU1Bg8DoKgxzEWVuozmHY19KhKFA2dCgDz9cUW8YyLpMBdmE
         lTBo4b+VaFcPoEDEYdkRPHb4kdCbDm21vf9OrO+KZgAMDeBJnM8+pb8i/BXTsvVpokqj
         HoO8pQbI31Qd9XtPwTG0Qa6+jZ6kDv6F+76vhl5ydemxmOZB4TsAgIem2B+cBpW26x4E
         BCVq5wtr5Z2/ELwPD2wCZ5HKTdtNP8OGCbaOromawRYTrODwsJzhiGUOnS2TgxcZhUM+
         ietb50h4MKGBTficTllREZT6vRv2lQOj3sqija+kHQJMbr65cPuQ6nyHlsKsp7BXUn3l
         Ksig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978512; x=1794583312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rxOFc+cZPr208SIBHT4IjzKUbYQTfkbGhsqB2LqDE4=;
        b=Q4QSXyDRp8oAZC1VgxQUi8JmfXQr/w6BO1Sm+DY6WM5jdQJTVismSA2+Q/9V7rb91g
         QNomdLtqSt4IH6npfORN1ZHDCzfvE3MHftU5isQ9iD5TfHdPlAbe+7Z0i6l/MfpYqfeE
         +Ur6+1lu8uf+vOzeYBY1laxb1VWKkmAKpP3J8cVEmmxyZ2uo5+fpIdBmUV1Te9TiXhXC
         kWTDTi+TEor8DEiqxQfpU+E5AnPsPwprpY6mqIzumeQUOjgQAcWo1JVn61/zXwGOl1FJ
         oShEzfl1WpNPRXSk6OJM/Fi2j5B4cjU8Q2ojx9M4QKIIUbL5eoyopA5SMaDE0WzJgfzl
         PlmA==
X-Forwarded-Encrypted: i=1; AKwUvBxdiDv86oAN0kPFADgx2YiXk6yhMG2opjcb1LXXBLayC0MrkV/r0vuA18JYsoZ5DfVf4Ag1Vu9ZUtG8UZIdJBw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qPVSSpPFn3u9e6ImcolpEcq5ZtWr6aA8cpDSBMV9PsMvy7Ukg
	AP2ldPjc0IKY+mTU+NFb09kCVFwmJTuanhE89Fs1jjreOAA7DytonAFMdAM+Y/zO/3f81dvVTtM
	Y6yKjCJoB8J/eK8EHBTMp22MAmE5JsyHWxXq4FW5n8mghBe0obd3m75mu0jcnEm1369ZzSWcq8w
	cVnsek6pia+KRUz/RilyZckPB/2P3NLyCCnRirk/ScJAdd
X-Gm-Gg: AYBFou3LpMgTCi9faR0z9EDENUQAU3TjBaqOL3/hkJecmp6aHJ7LeHrfbThOP/CZiA6
	wRWcFRwQ061SBZJNjKTEPPX3bARWmZiB2me6kJiGBIDmwdjAEKAW4r9ACRvrxYI2xKRUCbvO4eX
	EmuCnYXBncG0qybsZXTdYQLlB/bxTxKdTaeqj++mnB7SJbKL/Qo9uD3DJo
X-Received: by 2002:a05:6808:181f:b0:4d7:17d5:6c9b with SMTP id 5614622812f47-567e098b040mr2230485b6e.9.1793978512079;
        Fri, 06 Nov 2026 07:21:52 -0800 (PST)
X-Received: by 2002:a05:6808:181f:b0:4d7:17d5:6c9b with SMTP id
 5614622812f47-567e098b040mr2230427b6e.9.1793978511464; Fri, 06 Nov 2026
 07:21:51 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-v2_20230123_tjmercier_google_com-v4-0-1819a017000b@redhat.com>
 <20261104-v2_20230123_tjmercier_google_com-v4-3-1819a017000b@redhat.com> <fb40349c-18d2-45d6-9278-8f20e1b8dc74@amd.com>
In-Reply-To: <fb40349c-18d2-45d6-9278-8f20e1b8dc74@amd.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 6 Nov 2026 16:21:40 +0100
X-Gm-Features: AclHuK8xPUV12Kp92h3MGmY0EG1MyX4e69V4l27RPz6qll1dAX1c6CSJcZPwZjc
Message-ID: <CADSE00+NL-tyQVaTiS0Xdin7f-P_2c84P0qs-X66VqYze0-kGQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] dma-buf: transfer memcg charges via DMA_BUF_IOCTL_XFER_CHARGE
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian Brauner <brauner@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 2:52=E2=80=AFPM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 11/4/26 12:09, Albert Esteve wrote:
> > dma-heap already supports charging a specific cgroup at allocation
> > time via charge_fd in DMA_HEAP_IOCTL_ALLOC. However, dma-bufs can
> > originate from any exporter (DRM, V4L2, etc.), and the allocator may
> > not know the final owner at allocation time.
> >
> > Add DMA_BUF_IOCTL_XFER_CHARGE to transfer a dma-buf's memcg charge
> > to a different cgroup after allocation. The target is identified by
> > charge_fd, which may be a cgroupfd or a pidfd.
> >
> > The transfer charges the new cgroup before uncharging the old one,
> > preserving the original charge on failure. Concurrent transfers are
> > serialized by the dma-buf reservation lock, so lockdep covers the
> > locking order of the charge path early. The transfer implementation
> > is generic (mem_cgroup_transfer_charge) and not dma-buf specific, so
> > it can be reused by other subsystems.
> >
> > Not all dma-buf exporters back their buffers with reclaimable system
> > memory. Some represent device registers, VRAM, or carved-out pools
> > where size is not a meaningful memory cost. The xfer ioctl returns
> > -EOPNOTSUPP for buffers whose memcg is not set. Exporters opt in by
> > passing a memcg through dma_buf_export_info at export time. Currently
> > only the system heap sets it, other exporters can opt in as needed.
> >
> > Usage example:
> >   int cg_fd =3D open("/sys/fs/cgroup/clients/app1", O_RDONLY | O_DIRECT=
ORY);
> >
> >   struct dma_buf_transfer_charge xfer =3D {
> >       .charge_fd =3D cg_fd,
> >   };
> >   ioctl(dmabuf_fd, DMA_BUF_IOCTL_XFER_CHARGE, &xfer);
> >   /* charge now on app1's cgroup */
> >   close(cg_fd);
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/dma-buf/dma-buf.c    | 42 ++++++++++++++++++++++++++++++++++++=
++++++
> >  include/linux/dma-buf.h      |  3 ++-
> >  include/linux/memcontrol.h   | 13 +++++++++++++
> >  include/uapi/linux/dma-buf.h | 26 ++++++++++++++++++++++++++
> >  mm/memcontrol.c              | 42 ++++++++++++++++++++++++++++++++++++=
++++++
> >  5 files changed, 125 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 837666273550..3bd26fbb1109 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -540,6 +540,45 @@ static long dma_buf_import_sync_file(struct dma_bu=
f *dmabuf,
> >  }
> >  #endif
> >
> > +/* Transfer a dma-buf's memcg charge; see struct dma_buf_transfer_char=
ge */
> > +static long dma_buf_xfer_charge(struct dma_buf *dmabuf,
> > +                             const void __user *user_data)
> > +{
> > +     struct dma_buf_transfer_charge arg;
> > +     struct mem_cgroup *memcg;
> > +     unsigned int nr_pages =3D PAGE_ALIGN(dmabuf->size) >> PAGE_SHIFT;
> > +     int ret =3D 0;
> > +
> > +     if (copy_from_user(&arg, user_data, sizeof(arg)))
> > +             return -EFAULT;
> > +
> > +     if (!IS_ENABLED(CONFIG_MEMCG))
> > +             return 0;
> > +
> > +     if (arg.flags !=3D 0)
> > +             return -EINVAL;
> > +
> > +     memcg =3D mem_cgroup_get_from_fd(arg.charge_fd);
> > +     if (IS_ERR(memcg))
> > +             return PTR_ERR(memcg);
> > +
> > +     dma_resv_lock(dmabuf->resv, NULL);
> > +
> > +     if (!dmabuf->memcg) {
> > +             ret =3D -EOPNOTSUPP;
> > +             goto out;
> > +     }
> > +
> > +     if (dmabuf->memcg !=3D memcg &&
> > +         !mem_cgroup_transfer_charge(&dmabuf->memcg, memcg, MEMCG_DMAB=
UF, nr_pages))
>
> Please move the calculation of nr_pages after taking the dma_resv_lock().
>
> We currently don't have anybody dynamically changing DMA-buf sizes but ju=
st to be on the save side.

Sounds like a good defensive option. I was also tempted to move it.
Will do for v5.

>
> With that done Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.co=
m>

Thanks!

BR,
Albert.

>
> Regards,
> Christian.
>
> > +             ret =3D -ENOMEM;
> > +
> > +out:
> > +     dma_resv_unlock(dmabuf->resv);
> > +     mem_cgroup_put(memcg);
> > +     return ret;
> > +}
> > +
> >  static long dma_buf_ioctl(struct file *file,
> >                         unsigned int cmd, unsigned long arg)
> >  {
> > @@ -590,6 +629,9 @@ static long dma_buf_ioctl(struct file *file,
> >               return dma_buf_import_sync_file(dmabuf, (const void __use=
r *)arg);
> >  #endif
> >
> > +     case DMA_BUF_IOCTL_XFER_CHARGE:
> > +             return dma_buf_xfer_charge(dmabuf, (const void __user *)a=
rg);
> > +
> >       default:
> >               return -ENOTTY;
> >       }
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 85dd747c9b36..b01149d26b44 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -507,7 +507,8 @@ struct dma_buf_attachment {
> >   * @priv:    Attach private data of allocator to this buffer
> >   * @memcg:   memcg to charge for this buffer's memory. Set only for
> >   *           buffers backed by system memory where @size reflects the
> > - *           actual allocation in bytes.
> > + *           actual allocation in bytes. Enables charge transfer via
> > + *           DMA_BUF_IOCTL_XFER_CHARGE.
> >   *
> >   * This structure holds the information required to export the buffer.=
 Used
> >   * with dma_buf_export() only.
> > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > index f8ec751b7d7b..af02d9777fe9 100644
> > --- a/include/linux/memcontrol.h
> > +++ b/include/linux/memcontrol.h
> > @@ -676,6 +676,11 @@ struct mem_cgroup *mem_cgroup_get_from_fd(int fd);
> >  bool mem_cgroup_reserve_dmabuf(struct mem_cgroup *memcg, gfp_t gfp,
> >                              unsigned int nr_pages);
> >
> > +bool mem_cgroup_transfer_charge(struct mem_cgroup **ptr_memcg,
> > +                             struct mem_cgroup *new_memcg,
> > +                             enum memcg_stat_item item,
> > +                             unsigned int nr_pages);
> > +
> >  void __mem_cgroup_uncharge(struct folio *folio);
> >
> >  /**
> > @@ -1197,6 +1202,14 @@ static inline void mem_cgroup_cancel_dmabuf(stru=
ct mem_cgroup *memcg,
> >  {
> >  }
> >
> > +static inline bool mem_cgroup_transfer_charge(struct mem_cgroup **ptr_=
memcg,
> > +                                           struct mem_cgroup *new_memc=
g,
> > +                                           enum memcg_stat_item item,
> > +                                           unsigned int nr_pages)
> > +{
> > +     return true;
> > +}
> > +
> >  static inline void mem_cgroup_uncharge(struct folio *folio)
> >  {
> >  }
> > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.=
h
> > index e827c9d20c5d..0aaf2e7d593b 100644
> > --- a/include/uapi/linux/dma-buf.h
> > +++ b/include/uapi/linux/dma-buf.h
> > @@ -168,6 +168,31 @@ struct dma_buf_import_sync_file {
> >       __s32 fd;
> >  };
> >
> > +/**
> > + * struct dma_buf_transfer_charge - Transfer a dma-buf's memcg charge
> > + *
> > + * Any holder of a dma-buf file descriptor can perform a
> > + * DMA_BUF_IOCTL_XFER_CHARGE to attribute the buffer's memory
> > + * cost to a specific cgroup, or move it from one cgroup to
> > + * another.  The ioctl charges the new cgroup before uncharging
> > + * the old one atomically.  On failure the original charge is
> > + * preserved.  If the buffer has no existing memcg charge, the
> > + * ioctl returns -EOPNOTSUPP.
> > + */
> > +struct dma_buf_transfer_charge {
> > +     /** @flags: Reserved, must be zero */
> > +     __u32 flags; /* unused for now */
> > +     /**
> > +      * @charge_fd: File descriptor identifying the target cgroup.
> > +      *
> > +      * May be either a pidfd, in which case the charge moves to the
> > +      * memory cgroup of the referenced process, or a cgroupfd obtaine=
d
> > +      * by opening a cgroup v2 directory, in which case the charge mov=
es
> > +      * directly to that cgroup's memory controller.
> > +      */
> > +     __u32 charge_fd;
> > +};
> > +
> >  #define DMA_BUF_BASE         'b'
> >  #define DMA_BUF_IOCTL_SYNC   _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync=
)
> >
> > @@ -179,5 +204,6 @@ struct dma_buf_import_sync_file {
> >  #define DMA_BUF_SET_NAME_B   _IOW(DMA_BUF_BASE, 1, __u64)
> >  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE       _IOWR(DMA_BUF_BASE, 2, st=
ruct dma_buf_export_sync_file)
> >  #define DMA_BUF_IOCTL_IMPORT_SYNC_FILE       _IOW(DMA_BUF_BASE, 3, str=
uct dma_buf_import_sync_file)
> > +#define DMA_BUF_IOCTL_XFER_CHARGE    _IOW(DMA_BUF_BASE, 4, struct dma_=
buf_transfer_charge)
> >
> >  #endif
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index 17fdefc56b97..3e717b5663c8 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -5752,6 +5752,48 @@ void mem_cgroup_cancel_dmabuf(struct mem_cgroup =
*memcg, unsigned int nr_pages)
> >  }
> >  EXPORT_SYMBOL_GPL(mem_cgroup_cancel_dmabuf);
> >
> > +/**
> > + * mem_cgroup_transfer_charge - move a charge between memcgs
> > + * @ptr_memcg: pointer to the memcg to transfer from
> > + * @new_memcg: target memcg; caller must hold a reference
> > + * @item: stat counter to adjust
> > + * @nr_pages: number of pages to transfer
> > + *
> > + * Transfers @nr_pages of charge from *@ptr_memcg to @new_memcg and, o=
n
> > + * success, stores @new_memcg in *@ptr_memcg.
> > + *
> > + * Updates to *@ptr_memcg must be serialized by the caller.
> > + * Returns %true on success, %false if the charge against @new_memcg
> > + * failed.
> > + */
> > +bool mem_cgroup_transfer_charge(struct mem_cgroup **ptr_memcg,
> > +                             struct mem_cgroup *new_memcg,
> > +                             enum memcg_stat_item item,
> > +                             unsigned int nr_pages)
> > +{
> > +     struct mem_cgroup *old_memcg =3D *ptr_memcg;
> > +
> > +     if (!new_memcg || mem_cgroup_disabled())
> > +             return true;
> > +
> > +     if (try_charge(new_memcg, GFP_KERNEL, nr_pages))
> > +             return false;
> > +
> > +     mod_memcg_state(new_memcg, item, nr_pages);
> > +     css_get(&new_memcg->css);
> > +     *ptr_memcg =3D new_memcg;
> > +
> > +     if (old_memcg) {
> > +             /* Uncharge old cgroup */
> > +             mod_memcg_state(old_memcg, item, -nr_pages);
> > +             if (!mem_cgroup_is_root(old_memcg))
> > +                     refill_stock(old_memcg, nr_pages);
> > +             mem_cgroup_put(old_memcg);
> > +     }
> > +
> > +     return true;
> > +}
> > +
> >  /**
> >   * mem_cgroup_uncharge_dmabuf - uncharge a dma-buf from its memcg
> >   * @dmabuf: buffer to uncharge
> >
>

