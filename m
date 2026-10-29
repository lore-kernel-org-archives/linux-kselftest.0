Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262160;
	b=pUCjyf16UTAJL6I5TEk7DaJQlwp+fPsJv/lMMVlhmQN3JKkBYgLEJRo1ZFhA/91J/nVl
	 wJ4nEKS+M6zRzWui0nAE5FF5rJUhd9I/rwHlwUzhF03T9LUkYnyIVQmUmH7D05z7uTQou
	 W9DCrH75gu9aCOLFjAwSzmu/hTFLwD6EB+ThCc/YZ0XfYLsMmF4q0J6cEIaXheVznf7qA
	 6j21KqwIpZttTXHnAVr2IY/kMUnm7i8MfZwlITfCWdfKvGWgUqsffyne//qSy4OvF8iU6
	 zOqGR2ElmXFhmPPsH3J/68geT/4QcpDo36FnQH7YIYVYjC7z71d5tXdRinRq8WtbL3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262160;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=94uB/DHgfg1qZqyJ7zAIFQRDjTgpiQBipF8LX3G5vmw=;
	b=foKZHn2WxcDTBFHkm7mHgLlWX465IUMqBmM5fW8KxgIqz8xyXD/k67SFIh6zQW0nfoYL
	 54xELCwHYX7KnXOecydy42+sf74xyzxnT4GIJ3ixIcJ6cqqPHc1b+H74A+1wTrBNT6GST
	 Wh8p8vzX8RQJX4a+WbzEULnb6cKGUA7bX+bazGzDG2Bwx/kMOOYjUcrGn6BXdBD5XT5vL
	 GonWJQ7V7Br9Cz59mepjM9HEIRDZH7HVZUe9glVmk7PxHTznboW+bK3bEm/HrdEyodbKo
	 eUg7x2CT7j70/WlNwDziQDGYgVc8G0CP5/9An4P1qoT/mrsJVGpZgVprbzzJJeI3fDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D8F2Lqr9;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gcoyxO3Z;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C71D606A31D
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 08:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C71D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D8F2Lqr9;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gcoyxO3Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793262158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=94uB/DHgfg1qZqyJ7zAIFQRDjTgpiQBipF8LX3G5vmw=;
	b=D8F2Lqr94iFaFMQhKbDaKj66BtjrQYy5KEPcX7WZfBGnko6VlgTWGZ225w7NJO4DrFUMrj
	0s9ft3cARF1LkXfqiK8Ebyhr+a9638A0XKECjLBNxF4PjQfnmPRa5nftd45GDDBGA4gcTV
	iaYTVo1CCv664sD9j85dEVG4PDTGNWM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-XksTFIO8Nsib21FZfbhkrQ-1; Thu, 29 Oct 2026 04:22:37 -0400
X-MC-Unique: XksTFIO8Nsib21FZfbhkrQ-1
X-Mimecast-MFC-AGG-ID: XksTFIO8Nsib21FZfbhkrQ_1793262156
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a70b42bab0so5054415e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 01:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793262156; x=1793866956; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=94uB/DHgfg1qZqyJ7zAIFQRDjTgpiQBipF8LX3G5vmw=;
        b=gcoyxO3ZNtmVbAAUwJDpBgzOZCiYGv2JnkY2qxzjwc3EWIFtD7uLkH90jiRBankscL
         fxHzXfIOuzdMyAmLuMmX8pxOpTe0dMjzRUQlD03hksU1TVjKWhl6Hg7089D62aRm19Lx
         Qb19TQ7jHShvxBGhZhS7rCKxV/tV+wbiyRWvNH9UxbHH+kqx0Zw77S5VN2+pBWm+pTyv
         H3K8chDDMUW9Re5A1TV7dO58aD+s5PyDZH3OhUhYNrQqTIYRA0ZJ1NHf3S73ZtI6sDer
         vabeFHIq4Tw/qSAFsCupOWYo0OP+NDl6qJFhJ9mTaId74Bm5DeSZ4P+CBl/ozjy9418G
         jq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262156; x=1793866956;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=94uB/DHgfg1qZqyJ7zAIFQRDjTgpiQBipF8LX3G5vmw=;
        b=KQPJMpofvaqyoKYYrD+5h+AX7r4PBqEbx0JYM7ROZp+n3Om7nfgaIkjeyDrM8Pitpq
         9dZF7E4G/MazBVkwGX5crZ3Rn+/B7koRQO/Iy0sYVQbbeg6JNWKK0YrRVuih58nntzMb
         F1S7JmyfdYN3Zpv87o4KwO4BmFKV+ogQTgw2S5FUFC89KrqDI+Wv2fssW0lhiIwZZRSB
         FXGK4fdddFfqfFRJze/aePDeo31AsK7A6mLM4CwUjDCKg24QggimbQA5EQ169VaeIcq1
         ryY5iRiVNyU/rB9Zo5KRJLq7N3JLYjIshRNFNWzz1uNOKqECfZEiWfDzFIR5GzPb6vh6
         wrYA==
X-Forwarded-Encrypted: i=1; AKwUvBxfDvzR4bTm9EbvN8LiTrNeh++AFDSgHa2HURUWOhu1/ip0CoCi4febrx0n185eG2U/rlR7XyC6VXHZiDAz9cM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI//K2cz0pfA09iFptX2drHITDy3vTOP3b1/0EPwP04oC7gunsv
	TzAn5fbywxSagL1olrI7lzGj4PP8pKRmOFWMkjIPzl3P23wXcBYcQwbz7bZ0WTuHvPbzOlAnWcG
	0XvIEOF7dcpbljfSN+mGNXFbRQQzAdxvjE8LLaQUPTQr8mLCJvltiB3GHASyBrx27dSi9yg==
X-Gm-Gg: AYBFou3nd4IjUpEOUsrt4ts1WuM83PZvOGH650U1c4el0SY2sONPlQ+Q3YLl1E2llU+
	xRa1eWOMDqoAfPCWgdHBgByhxif6Icm/9TA2LzrPWPDD52OM0m31F1t0lUWCs82tkdehwKXTTIp
	uSkaBW3CGKH6WueyNNN+thgFfHY6VRq2PI7DW+e/KqKprqyPDtf0VKJuPyh6YI14BIcLEN752rw
	7JnFkekgDV/CnaWKCZXNqLEHu5TcRBWjqvOoUMZZWtVz2qX/sEdH5gubBTZH3zG7LY0sJ9Ih3hG
	sJbxKhNNQSjr6La4ETi9Zz31moBgjjIpJIcLlouuQ2EmTWUG0Hy2srHSGhSPcE23xhB252v+MQh
	cFTVJPyr1xOnVRlVRWP6AmpXrOzpg5lzSkc5tXuKvtIw=
X-Received: by 2002:a05:600c:e48b:b0:4a1:d291:d863 with SMTP id 5b1f17b1804b1-4aa8a1e90demr32611185e9.4.1793262155511;
        Thu, 29 Oct 2026 01:22:35 -0700 (PDT)
X-Received: by 2002:a05:600c:e48b:b0:4a1:d291:d863 with SMTP id 5b1f17b1804b1-4aa8a1e90demr32610685e9.4.1793262154992;
        Thu, 29 Oct 2026 01:22:34 -0700 (PDT)
Received: from localhost ([139.47.30.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece14a1sm34322198f8f.57.2026.10.29.01.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:22:34 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:22:33 +0100
From: Albert Esteve <aesteve@redhat.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
	Ondrej =?utf-8?B?TW9zbsOhxI1law==?= <omosnacek@gmail.com>,
	Jens Wiklander <jenswi@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>, cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	linux-kselftest@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	echanude@redhat.com, mripard@kernel.org
Subject: Re: [PATCH v3 7/8] dma-buf: transfer memcg charges via
 DMA_BUF_IOCTL_XFER_CHARGE
Message-ID: <auMCSb-punIgJOmA@aesteve-thinkpadp1gen8.rmtes.csb>
References: <20261027-v2_20230123_tjmercier_google_com-v3-0-78d2c4cb8647@redhat.com>
 <20261027-v2_20230123_tjmercier_google_com-v3-7-78d2c4cb8647@redhat.com>
 <d76d8bfe-e955-4e90-9f5f-e3e914c0869c@amd.com>
 <auIeQU0nAnOLdKUB@aesteve-thinkpadp1gen8.rmtes.csb>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auIeQU0nAnOLdKUB@aesteve-thinkpadp1gen8.rmtes.csb>

On Wed, Oct 28, 2026 at 05:09:37PM +0100, Albert Esteve via OP-TEE wrote:
> On Wed, Oct 28, 2026 at 10:08:19AM +0100, Christian König wrote:
> > On 10/27/26 16:02, Albert Esteve wrote:
> > > dma-heap already supports charging a specific cgroup at allocation
> > > time via charge_fd in DMA_HEAP_IOCTL_ALLOC. However, dma-bufs can
> > > originate from any exporter (DRM, V4L2, etc.), and the allocator may
> > > not know the final owner at allocation time.
> > > 
> > > Add DMA_BUF_IOCTL_XFER_CHARGE to transfer a dma-buf's memcg charge
> > > to a different cgroup after allocation. The target is identified by
> > > charge_fd, which may be a cgroupfd or a pidfd.
> > > 
> > > The transfer charges the new cgroup before uncharging the old one,
> > > preserving the original charge on failure. An atomic cmpxchg on
> > > dmabuf->memcg prevents races with concurrent transfers.
> > > 
> > > Not all dma-buf exporters back their buffers with reclaimable system
> > > memory. Some represent device registers, VRAM, or carved-out pools
> > > where size is not a meaningful memory cost. Add a memcg_account flag
> > > to dma_buf_export_info that exporters set when their buffers should
> > > participate in memcg accounting. The xfer ioctl returns -EOPNOTSUPP
> > > for buffers that do not set the flag. Currently only the system heap
> > > sets it, other exporters can opt in as needed.
> > > 
> > > Usage example:
> > >   int cg_fd = open("/sys/fs/cgroup/clients/app1", O_RDONLY | O_DIRECTORY);
> > > 
> > >   struct dma_buf_transfer_charge xfer = {
> > >       .charge_fd = cg_fd,
> > >   };
> > >   ioctl(dmabuf_fd, DMA_BUF_IOCTL_XFER_CHARGE, &xfer);
> > >   /* charge now on app1's cgroup */
> > >   close(cg_fd);
> > > 
> > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > ---
> > >  drivers/dma-buf/dma-buf.c           | 43 +++++++++++++++++++++++++++++++++++++
> > >  drivers/dma-buf/heaps/system_heap.c |  1 +
> > >  include/linux/dma-buf.h             |  5 +++++
> > >  include/linux/memcontrol.h          |  9 ++++++++
> > >  include/uapi/linux/dma-buf.h        | 26 ++++++++++++++++++++++
> > >  mm/memcontrol.c                     | 41 +++++++++++++++++++++++++++++++++++
> > >  6 files changed, 125 insertions(+)
> > > 
> > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > index f31f49ebd0af..07513ecedc10 100644
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -540,6 +540,45 @@ static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
> > >  }
> > >  #endif
> > >  
> > > +/* Transfer a dma-buf's memcg charge; see struct dma_buf_transfer_charge */
> > > +static long dma_buf_xfer_charge(struct dma_buf *dmabuf,
> > > +				const void __user *user_data)
> > > +{
> > > +	struct dma_buf_transfer_charge arg;
> > > +	struct mem_cgroup *memcg;
> > > +	int ret = 0;
> > > +
> > > +	if (copy_from_user(&arg, user_data, sizeof(arg)))
> > > +		return -EFAULT;
> > > +
> > > +	if (!IS_ENABLED(CONFIG_MEMCG))
> > > +		return 0;
> > > +
> > > +	if (arg.flags != 0)
> > > +		return -EINVAL;
> > > +
> > > +	if (!dmabuf->memcg_account)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	memcg = mem_cgroup_get_from_fd(arg.charge_fd);
> > > +	if (IS_ERR(memcg))
> > > +		return PTR_ERR(memcg);
> > > +
> > > +	if (dmabuf->memcg == memcg)
> > > +		goto skip_transfer;
> > > +
> > > +	if (!mem_cgroup_transfer_dmabuf_charge(dmabuf, memcg)) {
> > > +		ret = -ENOMEM;
> > > +		goto skip_transfer;
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +skip_transfer:
> > > +	mem_cgroup_put(memcg);
> > > +	return ret;
> > > +}
> > > +
> > >  static long dma_buf_ioctl(struct file *file,
> > >  			  unsigned int cmd, unsigned long arg)
> > >  {
> > > @@ -590,6 +629,9 @@ static long dma_buf_ioctl(struct file *file,
> > >  		return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
> > >  #endif
> > >  
> > > +	case DMA_BUF_IOCTL_XFER_CHARGE:
> > > +		return dma_buf_xfer_charge(dmabuf, (const void __user *)arg);
> > > +
> > >  	default:
> > >  		return -ENOTTY;
> > >  	}
> > > @@ -750,6 +792,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
> > >  	dmabuf->size = exp_info->size;
> > >  	dmabuf->exp_name = exp_info->exp_name;
> > >  	dmabuf->owner = exp_info->owner;
> > > +	dmabuf->memcg_account = exp_info->memcg_account;
> > 
> > The initial charging should probably be done here as well.
> > 
> > This way DMA-buf heaps only needs to pass in the charge_fd and we can re-use the functionality for other DMA-buf exporters as well.
> 
> The problem with doing the charge here is that it happens too late.
> That is the reasoning for this proposal to move all the charging logic
> into heap allocators before pages are allocated.
> 
> What we could do is fill the dmabuf->memcg field when the flag is set
> (i.e., committing into the dmabuf in the patch semantics). But for that
> we'd need adding the memcg we want to charge it to into exp_info in
> order to support charging to cgroups other than the allocator's (for
> the common case would be simpler as we can just look at current).
> Maybe that's what you meant?

Actually if I do this we can remove the memcg_account flag and just
uses exp_info->memcg as both the memcg to set *and* the flag when
it is != NULL. Exporters that set the memcg info are implicitly
flagging the dmabuf as chargeable (and transfereable).

The only thing is that mod_memcg_state() still needs nr_pages
and we cannot use size as that varies from one exporter to another as
you explained before. So that can be left for the exporter to call. WDYT?

> 
> > 
> > >  	spin_lock_init(&dmabuf->name_lock);
> > >  	init_waitqueue_head(&dmabuf->poll);
> > >  	dmabuf->cb_in.poll = dmabuf->cb_out.poll = &dmabuf->poll;
> > > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> > > index adeea8cd328b..a764167167ba 100644
> > > --- a/drivers/dma-buf/heaps/system_heap.c
> > > +++ b/drivers/dma-buf/heaps/system_heap.c
> > > @@ -479,6 +479,7 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
> > >  	exp_info.size = buffer->len;
> > >  	exp_info.flags = fd_flags;
> > >  	exp_info.priv = buffer;
> > > +	exp_info.memcg_account = true;
> > >  	dmabuf = dma_buf_export(&exp_info);
> > >  	if (IS_ERR(dmabuf)) {
> > >  		ret = PTR_ERR(dmabuf);
> > > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > > index 23ec0ff23fba..ac0ec88cab93 100644
> > > --- a/include/linux/dma-buf.h
> > > +++ b/include/linux/dma-buf.h
> > > @@ -433,6 +433,9 @@ struct dma_buf {
> > >  
> > >  	/** @memcg: the cgroup to which this buffer is currently attributed */
> > >  	struct mem_cgroup *memcg;
> > > +
> > > +	/** @memcg_account: account buffer memory to cgroup */
> > > +	bool memcg_account;
> > >  };
> > >  
> > >  /**
> > > @@ -505,6 +508,7 @@ struct dma_buf_attachment {
> > >   * @flags:	mode flags for the file
> > >   * @resv:	reservation-object, NULL to allocate default one
> > >   * @priv:	Attach private data of allocator to this buffer
> > > + * @memcg_account:	account buffer memory to cgroup
> > >   *
> > >   * This structure holds the information required to export the buffer. Used
> > >   * with dma_buf_export() only.
> > > @@ -517,6 +521,7 @@ struct dma_buf_export_info {
> > >  	int flags;
> > >  	struct dma_resv *resv;
> > >  	void *priv;
> > > +	bool memcg_account;
> > >  };
> > >  
> > >  /**
> > > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > > index 6b30baa79fa9..36fddafbef4e 100644
> > > --- a/include/linux/memcontrol.h
> > > +++ b/include/linux/memcontrol.h
> > > @@ -679,6 +679,9 @@ bool mem_cgroup_reserve_dmabuf(struct mem_cgroup *memcg, gfp_t gfp,
> > >  void mem_cgroup_commit_dmabuf(struct dma_buf *dmabuf, struct mem_cgroup *memcg,
> > >  			      unsigned int nr_pages);
> > >  
> > > +bool mem_cgroup_transfer_dmabuf_charge(struct dma_buf *dmabuf,
> > > +				       struct mem_cgroup *new_memcg);
> > > +
> > >  void __mem_cgroup_uncharge(struct folio *folio);
> > >  
> > >  /**
> > > @@ -1206,6 +1209,12 @@ static inline void mem_cgroup_cancel_dmabuf(struct mem_cgroup *memcg,
> > >  {
> > >  }
> > >  
> > > +static inline bool mem_cgroup_transfer_dmabuf_charge(struct dma_buf *dmabuf,
> > > +						     struct mem_cgroup *new_memcg)
> > > +{
> > > +	return true;
> > > +}
> > > +
> > >  static inline void mem_cgroup_uncharge(struct folio *folio)
> > >  {
> > >  }
> > > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> > > index e827c9d20c5d..ea957f4b1d38 100644
> > > --- a/include/uapi/linux/dma-buf.h
> > > +++ b/include/uapi/linux/dma-buf.h
> > > @@ -168,6 +168,31 @@ struct dma_buf_import_sync_file {
> > >  	__s32 fd;
> > >  };
> > >  
> > > +/**
> > > + * struct dma_buf_transfer_charge - Transfer a dma-buf's memcg charge
> > > + *
> > > + * Any holder of a dma-buf file descriptor can perform a
> > > + * DMA_BUF_IOCTL_XFER_CHARGE to attribute the buffer's memory
> > > + * cost to a specific cgroup, or move it from one cgroup to
> > > + * another.  The ioctl charges the new cgroup before uncharging
> > > + * the old one atomically.  On failure the original charge is
> > > + * preserved.  If the buffer has no existing charge, a new
> > > + * charge is established.
> > > + */
> > > +struct dma_buf_transfer_charge {
> > > +	/** @flags: Reserved, must be zero */
> > > +	__u32 flags; /* unused for now */
> > > +	/**
> > > +	 * @charge_fd: File descriptor identifying the target cgroup.
> > > +	 *
> > > +	 * May be either a pidfd, in which case the charge moves to the
> > > +	 * memory cgroup of the referenced process, or a cgroupfd obtained
> > > +	 * by opening a cgroup v2 directory, in which case the charge moves
> > > +	 * directly to that cgroup's memory controller.
> > > +	 */
> > > +	__u32 charge_fd;
> > > +};
> > > +
> > >  #define DMA_BUF_BASE		'b'
> > >  #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
> > >  
> > > @@ -179,5 +204,6 @@ struct dma_buf_import_sync_file {
> > >  #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, __u64)
> > >  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
> > >  #define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
> > > +#define DMA_BUF_IOCTL_XFER_CHARGE	_IOW(DMA_BUF_BASE, 4, struct dma_buf_transfer_charge)
> > >  
> > >  #endif
> > > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > > index 7b841b905759..3adc84fe6668 100644
> > > --- a/mm/memcontrol.c
> > > +++ b/mm/memcontrol.c
> > > @@ -5786,6 +5786,47 @@ void mem_cgroup_cancel_dmabuf(struct mem_cgroup *memcg, unsigned int nr_pages)
> > >  		refill_stock(memcg, nr_pages);
> > >  }
> > >  
> > > +/**
> > > + * mem_cgroup_transfer_dmabuf_charge - move a dma-buf charge
> > > + * @dmabuf: buffer to transfer charge
> > > + * @new_memcg: target memcg; caller must hold a reference
> > > + *
> > > + * Transfers the charge for @dmabuf to @new_memcg and, on
> > > + * success, stores @new_memcg in @dmabuf->memcg.
> > > + * Returns %true on success, %false if the charge against @new_memcg
> > > + * failed or a concurrent transfer raced on @dmabuf->memcg.
> > > + * On failure the caller retains its reference to @new_memcg.
> > > + */
> > > +bool mem_cgroup_transfer_dmabuf_charge(struct dma_buf *dmabuf,
> > > +				       struct mem_cgroup *new_memcg)
> > 
> > I would make that more generic instead of dmabuf specific. E.g. something like this:
> > 
> > bool mem_cgroup_transfer_charge(struct struct mem_cgroup **ptr_memcg, struct mem_cgroup *new_memcg, enum memcg_stat_item item, unsigned int nr_pages)
> 
> Ah yes, I like this generalization. And the implementation remains
> mostly the same. Thanks!
> 
> > 
> > > +{
> > > +	struct mem_cgroup *old_memcg = READ_ONCE(dmabuf->memcg);
> > 
> > > +	unsigned int nr_pages = PAGE_ALIGN(dmabuf->size) >> PAGE_SHIFT;
> > 
> > This way we can also document in the DMA-buf caller that this conversation must be ok when memcg_account is true.
> > 
> > Regards,
> > Christian.
> > 
> > > +
> > > +	if (mem_cgroup_disabled())
> > > +		return true;
> > > +
> > > +	if (!mem_cgroup_reserve_dmabuf(new_memcg, GFP_KERNEL, nr_pages))
> > > +		return false;
> > > +
> > > +	mod_memcg_state(new_memcg, MEMCG_DMABUF, nr_pages);
> > > +
> > > +	if (cmpxchg(&dmabuf->memcg, old_memcg, new_memcg) != old_memcg) {
> > > +		mod_memcg_state(new_memcg, MEMCG_DMABUF, -nr_pages);
> > > +		mem_cgroup_cancel_dmabuf(new_memcg, nr_pages);
> > > +		return false;
> > > +	}
> > > +
> > > +	if (old_memcg) {
> > > +		/* Uncharge old cgroup */
> > > +		mod_memcg_state(old_memcg, MEMCG_DMABUF, -nr_pages);
> > > +		mem_cgroup_cancel_dmabuf(old_memcg, nr_pages);
> > > +		mem_cgroup_put(old_memcg);
> > > +	}
> > > +
> > > +	return true;
> > > +}
> > > +
> > >  /**
> > >   * mem_cgroup_uncharge_dmabuf - uncharge a dma-buf from its memcg
> > >   * @dmabuf: buffer to uncharge
> > > 
> > 
> 

