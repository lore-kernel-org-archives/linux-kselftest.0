Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026443;
	b=yFr/TZgHLtvjJI1QvzNpV1rop5drkbTcL72LrXovR6LVgroEp9J8IZvZWf9uLMcMwaXg
	 hno6EVSXMbZkuXaf/SgR1epbWUN4p9m4PdUO/fFnL/M4b76MLaMRfVOg1ur+1g8nLfyvb
	 Df1lUMRw92Pw+oFt9y6rnYDrw1ePCkUOx6Ya9uskrqu9CQzOidgcPQ0rerP0azBADdxFH
	 gO4He8q82vroMgO4Ajo5cLDyDZMqIrkNSZ3HLp4IvzSpaz4wlhp/MIO52VtKZMxqtJ/jn
	 GieF54o6WK7+Zjvu1KcqS3s8upDSl+rjIXBqp40scQJVSyJ7vTDvKGyMJAxs313TIjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026443;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=OKz8jQo/auRPZNzdWHUdE6yB8Ix7XlP0akY/URWqfWs=;
	b=e1Z03yPfnT45qR0vmWOY9jQBOVP7xRBRtYyrDwq9GevdgwMwLkjJvf/5+683WdEv9fA2
	 mYLPDwwg3AlGF9ZYnXLy1PWtngIzsnnNXaqySSSn78szc87/rgZEvTdgNxJAY7nvW5q3U
	 1gxtnt4QHts8CXp+1ZE4zzleDnqo+9JnSsfjWE9dtmNGJpFv+OPujSnKPmDdl2+12esH1
	 EbSZI8I3z6d+m30v+dpTkOMqGkQ52BCjCQsgta3uAkm69bI5Tl7qk+D0i2wsPX6KaOdw2
	 /q0TO6UWIRW7z+JqqghqxgRB7DktBkJkdLw7NRembL2GM8R425fvWbwxokNA8ij81cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HzRXG33t;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Pc9MiCKq;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD26606A324
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 14:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CD26606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HzRXG33t;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Pc9MiCKq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793026441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKz8jQo/auRPZNzdWHUdE6yB8Ix7XlP0akY/URWqfWs=;
	b=HzRXG33tfR6XHvtstfHZCV1ak2d3YGgMPB5pgRJBJ4cIG4Zur55NWX0MyZv6fGB4x8CyyF
	UzMz3yNPbdEf7UTViCDKWsxaPFJWQzPkq0D2Av0U9qAs9ihA5+ROPqcmlQF/EfMVSPQEzD
	4ZWHqJ+tkj3iQCxFu9SgaRZhGIyOaXQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-Nehk00UwPqKJQqZ3bbXHRw-1; Mon, 26 Oct 2026 10:53:58 -0400
X-MC-Unique: Nehk00UwPqKJQqZ3bbXHRw-1
X-Mimecast-MFC-AGG-ID: Nehk00UwPqKJQqZ3bbXHRw_1793026438
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1895ffc83so22897915e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 07:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793026437; x=1793631237; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OKz8jQo/auRPZNzdWHUdE6yB8Ix7XlP0akY/URWqfWs=;
        b=Pc9MiCKqE0msVu74Tx017Mw+KW3FsGKwWFAxBwQAsxfSZfSn7YV0p6hsIQmhVyg95c
         I55gfIWUtRH0+Z89RUqw7vYbrcdiUswYUovW+VqnbZe2COp3AfO8GmHh5t68PdbIUiqP
         ZGcQLITOX1M4hJfQKat0OH7bF5gy3vR47tAqBoMhM6Ed5xIWiVxWhS9RV+fgtFZx5AFL
         35TIGaoWS+O4g9NDAjZ6JZilcO8SlqCCUHYWylZs3bUmu6csQCweADibPnSHgiTaWHN+
         eA0onWu6+Ja5+Rmsb5tKCb4pvigJscq9iVI0WsOHEDxvyGZ+/ASgZP/P6BPuthvrfkIH
         Yyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793026437; x=1793631237;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OKz8jQo/auRPZNzdWHUdE6yB8Ix7XlP0akY/URWqfWs=;
        b=SXwOt6kQYh1Pj5vzjA0C2wvVmM4UkIOsKJ+VowZScKSmatgeDaMswWm6gqPpMMjyvX
         Q5xLu5NzRH1dS38ZzwOI3pk2sSYTEQLfK8R8mAXBT8b8UxnfeAF7abmUdNiu9KH/Ea2c
         4FhJXXS/+85s5lGh8c4dNBP6ogM8RYdyj54r5NHJ5YELs6kcx67SOzLBkbveVfRIdtW8
         oP0cEYLHUypWy/bH7EXpCXczAMBeG8aBCxvg2p3lgY01ls74SVii3+IUH01d3gvtYaR9
         px6mcO1epdLgVL2IhSyVvrSmZWtEKhpqerZjdNrOIiN89LF2TM0OIjB/1BngETv5l3Hu
         n6+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxYsuo/wdgm7WX0E+kJ3gVcOBI34cG4nViX6kZ3728YsJ52RuFFcQEti/HCd8ME6aKOkWSRMKNj3Hf03wiqREM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0YoTOeC0P2ktZQCOjqnWF99WdnLcdE7u7pD018vqyYbkUHUqD
	mqGJgW6nbkSKGFDEkgqAAmHb4foQrO3CNWdVBDdfAMMr/kw/Nl7r6+BbVnN3wvmjvDQALgNIjTO
	P4OKVUtH0kkOlgoBh2WLIeJzrc2LzFKQ5n/jU9stt0Yn2c2r90BDEOiWgupbP0ju8ypx7aA==
X-Gm-Gg: AYBFou1JIy4r3MHZIUNuhW+1iC5tllAv6vwzQjK35Opoun6GWE5b5xAksX7SVR/uX55
	gZdGot99yBXhAsYyQp01LzvSdQBFW3rrQjEDFAvPnDbH0mfNsoORU25sqtefzYI3tXr9wJymDin
	1aJZkxmHVGGdoRp1lYlDPICJt8ZVgFkXoUnnXufabVKCzSMLdT9/aWKEanFH+5O8xktX5k6O0Za
	RoXuH8gn8j52h/eTgxIQCfomrd/ltMELnBlWDlsQ8rpRWTt/s18t0JrNUPDCE3iKaN82O6hA4GT
	jDxkweprv8HIJyN2KGwn2/S8chC5mxGhu6n8Ei6PIqfsVfdokEg/isClnyW1qFawkuA=
X-Received: by 2002:a05:600c:3487:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4a35ac8c231mr138381455e9.9.1793026437525;
        Mon, 26 Oct 2026 07:53:57 -0700 (PDT)
X-Received: by 2002:a05:600c:3487:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4a35ac8c231mr138381105e9.9.1793026437038;
        Mon, 26 Oct 2026 07:53:57 -0700 (PDT)
Received: from localhost ([46.6.57.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bac37sm213564065e9.6.2026.10.26.07.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:53:56 -0700 (PDT)
Date: Mon, 26 Oct 2026 15:53:54 +0100
From: Albert Esteve <aesteve@redhat.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
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
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-mm@kvack.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
	mripard@kernel.org, echanude@redhat.com
Subject: Re: [PATCH RFC v2 7/8] dma-buf: transfer memcg charges via
 DMA_BUF_IOCTL_XFER_CHARGE
Message-ID: <at9pgl9sC8__GHlZ@aesteve-thinkpadp1gen8.rmtes.csb>
References: <20261021-v2_20230123_tjmercier_google_com-v2-0-ef6ee2dd8c5c@redhat.com>
 <20261021-v2_20230123_tjmercier_google_com-v2-7-ef6ee2dd8c5c@redhat.com>
 <9e54354d-b037-47e1-9390-86d5e25444a7@amd.com>
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
In-Reply-To: <9e54354d-b037-47e1-9390-86d5e25444a7@amd.com>

On Thu, Oct 22, 2026 at 12:23:57PM +0200, Christian König wrote:
> On 10/21/26 17:42, Albert Esteve wrote:
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
> > preserving the original charge on failure. An atomic cmpxchg on
> > dmabuf->memcg prevents races with concurrent transfers.
> > 
> > Usage example:
> >   int cg_fd = open("/sys/fs/cgroup/clients/app1", O_RDONLY | O_DIRECTORY);
> > 
> >   struct dma_buf_transfer_charge xfer = {
> >       .charge_fd = cg_fd,
> >   };
> >   ioctl(dmabuf_fd, DMA_BUF_IOCTL_XFER_CHARGE, &xfer);
> >   /* charge now on app1's cgroup */
> >   close(cg_fd);
> > 
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/dma-buf/dma-buf.c    | 77 ++++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/memcontrol.h   |  9 ++++++
> >  include/uapi/linux/dma-buf.h | 26 +++++++++++++++
> >  mm/memcontrol.c              | 40 +++++++++++++++++++++++
> >  4 files changed, 152 insertions(+)
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index f31f49ebd0af..7fa607d9bf65 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -540,6 +540,80 @@ static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
> >  }
> >  #endif
> >  
> 
> A single line code comment what this is all about would be nice to have.
> 
> Some note to look at struct dma_buf_transfer_charge for details is most likely good enough.

Sure, will add it for next version.

> 
> > +static long dma_buf_xfer_charge(struct dma_buf *dmabuf,
> > +				const void __user *user_data)
> > +{
> > +	struct cgroup *cgrp;
> > +	struct cgroup_subsys_state *css;
> > +	struct dma_buf_transfer_charge arg;
> > +	struct mem_cgroup *memcg;
> > +	struct task_struct *task;
> > +	const struct cred *tcred;
> > +	unsigned int pidfd_flags;
> > +	int ret = 0;
> > +
> > +	if (copy_from_user(&arg, user_data, sizeof(arg)))
> > +		return -EFAULT;
> > +
> > +	if (!IS_ENABLED(CONFIG_MEMCG))
> > +		return 0;
> > +
> > +	if (arg.__padding != 0)
> > +		return -EINVAL;
> > +
> > +	cgrp = cgroup_get_from_fd(arg.charge_fd);
> > +	if (!IS_ERR(cgrp)) {
> > +		/* charge_fd is a cgroupfd */
> > +		rcu_read_lock();
> > +		css = cgroup_css(cgrp, &memory_cgrp_subsys);
> > +		if (!css || !css_tryget_online(css)) {
> > +			rcu_read_unlock();
> > +			cgroup_put(cgrp);
> > +			return -ENOENT;
> > +		}
> > +
> > +		memcg = mem_cgroup_from_css(css);
> > +		rcu_read_unlock();
> > +
> > +		ret = security_dma_buf_charge_cgroup(current_cred(), cgrp);
> > +		cgroup_put(cgrp);
> > +		if (ret) {
> 
> 
> > +			mem_cgroup_put(memcg);
> > +			return ret;
> 
> Maybe use goto skip_transfer; instead?

Yeah. This is a copy from the ALLOC part sharing this logic.
I will refactor all this logic (extracting memcg from the fd)
into a function in memcontrol to clean up this mess.

> 
> > +		}
> > +	} else {
> > +		/* charge_fd is a pidfd  */
> > +		task = pidfd_get_task(arg.charge_fd, &pidfd_flags);
> > +		if (IS_ERR(task))
> > +			return PTR_ERR(task);
> > +
> > +		tcred = get_task_cred(task);
> > +		ret = security_dma_buf_charge_task(current_cred(), tcred);
> > +		put_cred(tcred);
> > +		if (ret) {
> > +			put_task_struct(task);
> > +			return ret;
> > +		}
> > +
> > +		memcg = get_mem_cgroup_from_mm(task->mm);
> > +		put_task_struct(task);
> > +	}
> > +
> > +	if (dmabuf->memcg == memcg)
> > +		goto skip_transfer;
> > +
> > +	if (!mem_cgroup_transfer_dmabuf_charge(dmabuf, memcg)) {
> > +		ret = -ENOMEM;
> > +		goto skip_transfer;
> > +	}
> > +
> > +	return 0;
> > +
> > +skip_transfer:
> > +	mem_cgroup_put(memcg);
> > +	return ret;
> > +}
> > +
> >  static long dma_buf_ioctl(struct file *file,
> >  			  unsigned int cmd, unsigned long arg)
> >  {
> > @@ -590,6 +664,9 @@ static long dma_buf_ioctl(struct file *file,
> >  		return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
> >  #endif
> >  
> > +	case DMA_BUF_IOCTL_XFER_CHARGE:
> > +		return dma_buf_xfer_charge(dmabuf, (const void __user *)arg);
> > +
> >  	default:
> >  		return -ENOTTY;
> >  	}
> > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > index aa08fbb0c26c..3a6acfda1423 100644
> > --- a/include/linux/memcontrol.h
> > +++ b/include/linux/memcontrol.h
> > @@ -674,6 +674,9 @@ int mem_cgroup_swapin_charge_folio(struct folio *folio, unsigned short id,
> >  bool mem_cgroup_charge_dmabuf(struct dma_buf *dmabuf, struct mem_cgroup *memcg,
> >  			      gfp_t gfp_mask);
> >  
> > +bool mem_cgroup_transfer_dmabuf_charge(struct dma_buf *dmabuf,
> > +				       struct mem_cgroup *new_memcg);
> > +
> >  void __mem_cgroup_uncharge(struct folio *folio);
> >  
> >  /**
> > @@ -1183,6 +1186,12 @@ static inline bool mem_cgroup_charge_dmabuf(struct dma_buf *dmabuf,
> >  	return true;
> >  }
> >  
> > +static inline bool mem_cgroup_transfer_dmabuf_charge(struct dma_buf *dmabuf,
> > +						     struct mem_cgroup *new_memcg)
> > +{
> > +	return true;
> > +}
> > +
> >  static inline void mem_cgroup_uncharge(struct folio *folio)
> >  {
> >  }
> > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> > index e827c9d20c5d..4970a7b8e08e 100644
> > --- a/include/uapi/linux/dma-buf.h
> > +++ b/include/uapi/linux/dma-buf.h
> > @@ -168,6 +168,31 @@ struct dma_buf_import_sync_file {
> >  	__s32 fd;
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
> > + * preserved.  If the buffer has no existing charge, a new
> > + * charge is established.
> > + */
> > +struct dma_buf_transfer_charge {
> > +	/**
> > +	 * @charge_fd: File descriptor identifying the target cgroup.
> > +	 *
> > +	 * May be either a pidfd, in which case the charge moves to the
> > +	 * memory cgroup of the referenced process, or a cgroupfd obtained
> > +	 * by opening a cgroup v2 directory, in which case the charge moves
> > +	 * directly to that cgroup's memory controller.
> > +	 */
> > +	__u32 charge_fd;
> > +	/** @__padding: Reserved, must be zero */
> > +	__u32 __padding;
> 
> Maybe rename to flags, put before charge_fd and add "/* unused for now */".

Agreed.

> 
> > +};
> > +
> >  #define DMA_BUF_BASE		'b'
> >  #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
> >  
> > @@ -179,5 +204,6 @@ struct dma_buf_import_sync_file {
> >  #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, __u64)
> >  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
> >  #define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
> > +#define DMA_BUF_IOCTL_XFER_CHARGE	_IOW(DMA_BUF_BASE, 4, struct dma_buf_transfer_charge)
> >  
> >  #endif
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index e94222237d31..d994a4b2d35e 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -5688,6 +5688,46 @@ bool mem_cgroup_charge_dmabuf(struct dma_buf *dmabuf, struct mem_cgroup *memcg,
> >  	return true;
> >  }
> >  
> > +/**
> > + * mem_cgroup_transfer_dmabuf_charge - move a dma-buf charge
> > + * @dmabuf: buffer to transfer charge
> > + * @new_memcg: target memcg; caller must hold a reference
> > + *
> > + * Transfers the charge for @dmabuf to @new_memcg and, on
> > + * success, stores @new_memcg in @dmabuf->memcg.
> > + * Returns %true on success, %false if the charge against @new_memcg
> > + * failed or a concurrent transfer raced on @dmabuf->memcg.
> > + * On failure the caller retains its reference to @new_memcg.
> > + */
> > +bool mem_cgroup_transfer_dmabuf_charge(struct dma_buf *dmabuf,
> > +				       struct mem_cgroup *new_memcg)
> > +{
> > +	struct mem_cgroup *old_memcg = READ_ONCE(dmabuf->memcg);
> > +	unsigned int nr_pages = PAGE_ALIGN(dmabuf->size) >> PAGE_SHIFT;
> 
> That doesn't work as easily as this.
> 
> DMA-buf can contain litterally *anything*, ranging from system memory over device memory all the way to functional HW blocks. In other words doorbell, GWS, GDS, OA, I2C, I2S, any random data consuming or providng HW block...
> 
> For memory the "size" is the actually number of bytes the buffer represents, but for everything else it is just an arbitary number given by the exporter. In most cases just 1 or actually number of HW blocks/channels, but for GDS for example it is actually a pretty large number.

I don't think I was completely aware of all these uses for dma-bufs and
the specific meanings of the size for all them. Thanks for pointing this
out.

> 
> Saying that you most likely need some flag from the exporter if charging and/or the changing of charging should be possible or not. Otherwise you can potentially do quite a bunch of nonsense with that.

Yes, a flag seems to be simple solution for the problem at hand. I can
focus on the system heap for now, and it can be easily extended in the
future for other allocators as needed.

> 
> Regards,
> Christian.
> 
> > +
> > +	if (!mem_cgroup_disabled() && try_charge(new_memcg, GFP_KERNEL, nr_pages))
> > +		return false;
> > +
> > +	if (cmpxchg(&dmabuf->memcg, old_memcg, new_memcg) != old_memcg) {
> > +		if (!mem_cgroup_is_root(new_memcg))
> > +			refill_stock(new_memcg, nr_pages);
> > +		return false;
> > +	}
> > +
> > +	mod_memcg_state(new_memcg, MEMCG_DMABUF, nr_pages);
> > +
> > +	if (old_memcg) {
> > +		/* Uncharge old cgroup */
> > +		mod_memcg_state(old_memcg, MEMCG_DMABUF, -nr_pages);
> > +		if (!mem_cgroup_is_root(old_memcg))
> > +			refill_stock(old_memcg, nr_pages);
> > +		/* unref from buffer - buffer keeps new ref to new_memcg */
> > +		mem_cgroup_put(old_memcg);
> > +	}
> > +
> > +	return true;
> > +}
> > +
> >  /**
> >   * mem_cgroup_uncharge_dmabuf - uncharge a dma-buf from its memcg
> >   * @dmabuf: buffer to uncharge
> > 
> 

