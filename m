Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1E14BD79A
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 17:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494216; cv=none; b=QcAaCq6bmm0KCnszhlFiyDjEEr/xl33cLYABnOJVQUu8oNUHNeVv0higlcwTLDQ+1h49wSyQ+ysM3qmVcBQSGmUHqRZos2GXfF7+MgXIWUg3JXNlWVBSXE57sErEKeODJtPy7HLlAWP+1CW+adjmWQdBVdjfkWKAjHm6BA2moL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494216; c=relaxed/simple;
	bh=2Qb0/zNGbWdfLqIl2/hEdN2XdIGVrGsupUwvjhaalpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQz0fx1up9NZpbRrSqqmZB49w8fSVAyuWx5P4pyvB+pZv7x9d19eq+RLew1Rhrlqf/YGjqbhCswnJENVGg75Og4uUiux8xtIIyXnIbGcJI2kk4uzuHiLtJsL70thEq6JTgoTsbZylyKOPToX67Qc3OpzXKgI/vYKwgzwm3awN6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXQVWNfr; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXQVWNfr"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f4df360cc9so1060718a34.1
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 10:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789494208; x=1790099008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UT4ouAJLFU2Y0pobOZCiwGU7eYX5lu0wzqAZh/2lqXU=;
        b=CXQVWNfrRZ4GnugKS8hGIPnD7dMR/gXzEetZyPwZSE2DDKUsfZtdlzj98QdyrAwIDI
         /bORgxtSnHh89UNA+O88gYJAFws1ttU0Dbf97zY37lcazcji8aJ01U8/BFi8urW3/NvK
         KewIyg3ns3zr5KfncK3SudwyiqJqLg+VYranZ8FKw1PueJdAvCfsKjz2NKISQGCiyC9f
         WY94ZVtxsKqIHFrpInLlVuG73iNhY8YXqbEe4LKHPDpuKCgluVzIrw+4Lm5m8wuOtEXF
         fdr3nYXbs9PwnJZtyNzMUWagftl/N5lYOlokb6k0uau/bMWxDWIxDpXzsckTYHXZJe7t
         QuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494208; x=1790099008;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UT4ouAJLFU2Y0pobOZCiwGU7eYX5lu0wzqAZh/2lqXU=;
        b=yuNRzjLi5dgTl7KrXEMP2YLUIi97mf+0ErFRhfq5Jwhpp8jFcys1VeOzIyzRv429oZ
         m8PPStGDp997Y6iQIvRR+Q0F0f+07WRx47HyUUAikL2moMS7r+bZyBsBfgVY0Rn9YVlh
         O0Q3k3Go6U/Yk4CmrRkSyqPJqj4I4gEtv+avnypYhy89T2OsxBOVckjnRDbIIc9V3qCL
         4qeJIRQW0WSGdJDOtzn0qL6z3r/aPkkMdVSe3FHvmxCgOLnVhJ8Jo+cDxQ6fiWBuB4yQ
         octbC3JGn5zXX25F6SQmMgXR+TrOO65GsWbK71sEkPXbc2RPuk+j9ufb1AiTGoFOpSR8
         VCzw==
X-Forwarded-Encrypted: i=1; AKwUvBzUYXXoZjYKsdQlCFNXWwchoDJTBK5lrM5rXRwxgwxf7bkrD8hYFhwJDYJX8KpIA07Ge8REMafPfdhDsHv1qSM=@vger.kernel.org
X-Gm-Message-State: AFuF++nqUOZb8U4cCsqxmk/FqnGKXdeSa89vZSacpGIJzQ1CR2dg5v9L
	BM12liGXbpAlzeP32vWJJdFCtMqkfKam1iBX/HJhyY5VJjKo3J01yQHT
X-Gm-Gg: AYBFou0xq8wKpPd1zT1kltAIgHsFjudcWWZKx4EF2RJKqe49YlVTutZKoKnE7oMAHiJ
	lkccFhh4hrp/Bc8/elWRIeNOOWDfEdHwmWvG2qcpJdHilpmCCcNPxna+jVURL9geFlLd0+RCceA
	f6kSUYOayPdViyx4GO6PFff3dT2KokOP9finoGYA/afL2+zoKRncG17/Hv+ODiu9AcTLyQgCO4s
	1P6GK9FdbL84ow+Cwl/G3PsHTIKsdQdVTQdzpK4bulkIM57rklVUO9UWPJ7UK/TDJ6n7BLdmV30
	J4eLzGFO7efqno7X7wIbenz8lA9bvINZLnEs3dEmwaOPqEw8gC54rdlZ3wBfKKerj+AqMT7vTtY
	8z40fhs541ed+x3udAjwRh+DCQBzeKfDCNZh/oWPYczM2UxExgZClFGJ48Q8hGhcHqWLOKRwiyh
	20/Ww2VBY+eFi8Fg+0DyevaQI2gIzkiaLLH0SxCHAMHpIeUkyPv7HaMCqWfaH2A1CkA6dVxIb6l
	ZrjW/0V6uQpvd7uP/I5
X-Received: by 2002:a9d:7d8d:0:b0:804:36ec:d875 with SMTP id 46e09a7af769-809823dcba1mr2371764a34.4.1789494207629;
        Tue, 15 Sep 2026 10:43:27 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:50::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80505548bbfsm12975740a34.18.2026.09.15.10.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:43:27 -0700 (PDT)
Date: Tue, 15 Sep 2026 10:43:23 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	sargun@sargun.me, jlinbox@meta.com,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 0/6] vsock: assign the guest vsock device to a
 network namespace
Message-ID: <aqmDuxMuEN5lS/0J@devvm29614.prn0.facebook.com>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
 <apqGcFDFm9_Wtw4q@sgarzare-redhat>
 <apsANK7ySuRzzK0V@devvm29614.prn0.facebook.com>
 <aqkaTXHDf5nfPL9w@sgarzare-redhat>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqkaTXHDf5nfPL9w@sgarzare-redhat>

On Tue, Sep 15, 2026 at 12:16:47PM +0200, Stefano Garzarella wrote:
> On Fri, Sep 04, 2026 at 10:30:28AM -0700, Bobby Eshleman wrote:
> > On Fri, Sep 04, 2026 at 10:55:17AM +0200, Stefano Garzarella wrote:
> > > On Wed, Sep 02, 2026 at 04:00:46PM -0700, Bobby Eshleman wrote:
> > > > vsock network namespaces let a host put each VM in a namespace of its
> > > > own. A guest has no equivalent yet. It has a single G2H device that
> > > > cannot be assigned to a network namespace.
> > > 
> > > Thanks for this, I'll do a proper review next week, in the mean time some
> > > comments below:
> > > 
> > > >
> > > > This series lets a guest move that device into a network namespace. A
> > > > new ioctl on /dev/vsock, IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS, assigns the
> > > > device to the namespace of the calling process. The namespace's existing
> > > 
> > > Why an ioctl?
> > > 
> > > I'm asking because I'd like to know if you've already considered any
> > > alternatives (sysfs, netlink, etc.)
> > > 
> > > How do you think the ioctl should be used? Should we provide an userspace
> > > tool, or extending some existing tools?
> > > 
> > > Thanks,
> > > Stefano
> > 
> > Really only because /dev/vsock exists and the prior series used it.
> 
> Yeah, I vaguely remember that we may have discussed switching to netlink in
> that thread, but I can't find it.
> 
> > 
> > Considering netlink, it might be the better option because there is a
> > lot of prior art solving problems we might have in the future. For
> > example, I was thinking about when users suddenly lose access to vsock,
> > with just the current assign ioctl there is no way for apps or users to
> > figure out why this happened. We can have an ioctl() setter for user,
> > but in netdev world users can actually get a notification via netlink as
> > to which namespace the device went to and what its ifindex is there (see
> > __dev_change_net_namespace() for the RTM_DELLINK and RTM_NEWLINK
> > messages). There is probably more, but that's the case that comes to
> > mind.
> 
> netlink seems like the right way to go, do you think it'll be a real pain to
> implement?

It is really not bad... it'll include a yaml spec in
Documentation/netlink/specs/ of call names and perms, a new target for
generated code in the Makefile, a handler, and then
tools/net/ynl/ynl-regen.sh generates the plumbing.

> 
> > 
> > > 
> > > > ns_mode then decides who may use it: a "global" namespace shares the
> > > > device with every other global namespace, and a "local" namespace keeps
> > > > the host connection to itself. The device starts out in the initial
> > > > namespace, so until the ioctl is issued nothing has moved and no mode
> > > > has changed. There is no explicit unassign as assigning the device back
> > > > to the initial namespace is equivalent.
> > > >
> > > > The ioctl requires CAP_NET_ADMIN in the initial user namespace.
> > > >
> > > > Connections that can no longer reach the device after a move are reset,
> > > > so that a namespace which has lost access cannot keep using a socket it
> > > > opened while it still had access. Following netdevs, the device returns
> > > > to the initial namespace when the namespace it was moved to is deleted.
> > > >
> > > > Transports opt in through a new netns_assign_allow callback. Only
> > > > virtio-vsock implements it here.
> > > 
> > > Why? (Not asking to support all the others, asking to explain the reason or
> > > ask helps from others to extend it)
> > > 
> > > Thanks,
> > > Stefano
> > 
> > Sure, can add a note here about extending it. I just didn't want to
> > implement code without having an environment allowing me to test it.
> 
> It's fine, I'm not asking you to do it ;-)
> 
> Sorry again for the delay, I hope to review this series today/tomorrow.
> 
> Thanks,
> Stefano
> 

No rush!

Thanks,
Bobby
