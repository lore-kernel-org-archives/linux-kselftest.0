Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72F334AB00
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 16:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771518060; cv=none; b=spF6R44waJ/7WXJ3lbRNFB1XebdY4cxkxlJI72yinZL5DM7AVR0oAUaKl3gzvzYPQEyIHbpMtaqCRLkbxtlOb1THF67w1l09mUC3gGX322AUU36a1OO0gvrsRawvchlT2paMNBwQPeCKUKiQ5YAc0dVDZeHBGjWl/ihLrq2jRLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771518060; c=relaxed/simple;
	bh=aa8HpnhkhFTvaDoDL/ahRUcPG5SO2+yPR1Wf7Wra0gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2BTxuKmDtuE8cWzSykIISNdwMOewWSqB+0/TFn0wMY5Kx5j/r3K9hUROVj13NzrGG08gIKj57D+aF99dgeAErWCMaNoy+Yl2a0nn7f/gETDHyqHDJBd7K/VUpi2rqhxGKieQsfPNmQHwOIP4cYyQhG27RCe+hOAYQ2KZPhz3Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExUTnMfY; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExUTnMfY"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79801df3e42so16701397b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 08:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771518056; x=1772122856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A0rYjgp7Ch70SpS2AmmIHyWg8daqBojfooxoM3vehGQ=;
        b=ExUTnMfY2pjcYe+2x1vuGkgPM06jeUQKRHQ7Yxu6Q6X2E9/O8/FoaICaAQOLOayz6Z
         BNZHkvUVikIOctAhZxiPTuBLSl54h1WWPUegX0BkyQKs4jzoMpJMCSNHKONopkx0jAeP
         0NwbacL5nceiK125gQk+MUZcjYTC/yv4NLD3bHrobJsQrZE5Hh/3DSQXnYlC0x+O2G27
         YEExOEeqzneqcAKR12OVcdn+viQBzLooJCmiZ6BE3FbScUKggvS3RYH5M8orsOQM27/r
         cKHaHxTwbyCdAt77/x7zJ020vWqgAVOq90qtcdXwsRv20xfa74Qer7WGtfSpukZH1rgp
         ehAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771518056; x=1772122856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0rYjgp7Ch70SpS2AmmIHyWg8daqBojfooxoM3vehGQ=;
        b=tAWqwesRP+sK7z+jmFHteiSoz+HobwdR+B/rlVMjaEq/LMmbqF8iA381fgtyF0XnFu
         AJivm0fqIzMrp/tu+6S+x+BiyBP3Z+2gaqaIkYLdNj4bIn5N+fON2uAoVXlvF/7yNc/C
         YU0pOmV+ZE+N4IAKUgaO08BNJw53llK8su5zpcvkYIMBssQ/FRCt6rYbOYSLyuzmuinA
         qLcc8npzpdwCCgWAvnf6a4NKTNzpEpsvGXfG4nq6QXeJJJe+41X3Z6uU1DGmW3Ly6cs5
         j34AWXdjXbP+IDM4/WNI0zxED1EqlgaNCdf/rCjzfWiYXEq8IhuYewy2aGYicglsuMBD
         I3dg==
X-Forwarded-Encrypted: i=1; AJvYcCU6bqDMC+sdMC7/RCFW0nhRjXuTVMJHJhJRBEDo+UwJZdEBZ+3kooOaAhnk49TsnzcCCsRkmrj/N0QELzvKbiI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7UAPT2/16HIHUQjFBw9FAFPXwbq70QhQUMAqtmx0+ivzp7UNT
	vcrSLutDksDJc0dbwaO/rFWbA4P+BJRlkM87EiN1PUXCmmTBMaq8z9HH
X-Gm-Gg: AZuq6aJHiQyr5952w/HnCLRuH3IkNVFbuqyHEp2zyTAoP4QYxvnquqeXom4MtUhIS/p
	OIYUX4Jx29vKyNdziIiIG6cR8ZIO3g/FqcSOxkduPY7nFkUPQhK1gilbeZrYOKdlX5MNxr7jCUV
	kqizXpYaTRSUINBpyclQMKFUJV/sqqkhX1iLv5t3+8WPh1WcGO7ewVwTyvdMIdGxyVRBdg/lJA1
	kTuCG0JW0XzKhXwq6cWrGvPqcmFF/eLsjzOeS82PTmUSxHimNqO3eZYVpL3yYb31od2931mBtNJ
	HQar4U7kC1g37ZoTJnFIcevHNIrUCHb7VJtr70vjDL7tEkUw1oxMUbPBapHb1Nv/+DDIAcA09lk
	eO5cT/j1yFL7eqWsQMaZAFMUBOeqfQX9Webg7lbR/+neP2HPIu7dgwGzi9fF8kqVPcKxDgET2DE
	WYDSC6JKlsQ7HoLcRrHy8cZJY9SuAmyiWOUHdXXTdRPVm9pQ==
X-Received: by 2002:a05:690c:7283:b0:797:e635:697a with SMTP id 00721157ae682-79807f8664emr16321727b3.1.1771518056461;
        Thu, 19 Feb 2026 08:20:56 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:6::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c267ba3sm131250537b3.48.2026.02.19.08.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 08:20:56 -0800 (PST)
Date: Thu, 19 Feb 2026 08:20:54 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	Daan De Meyer <daan.j.demeyer@gmail.com>
Subject: Re: [PATCH net v2 2/3] vsock: lock down child_ns_mode as write-once
Message-ID: <aZc4ZgTDtMPDWYxH@devvm11784.nha0.facebook.com>
References: <20260218-vsock-ns-write-once-v2-0-19e4c50d509a@meta.com>
 <20260218-vsock-ns-write-once-v2-2-19e4c50d509a@meta.com>
 <aZbR2H2oDyIAxDef@sgarzare-redhat>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZbR2H2oDyIAxDef@sgarzare-redhat>

On Thu, Feb 19, 2026 at 11:35:52AM +0100, Stefano Garzarella wrote:
> On Wed, Feb 18, 2026 at 10:10:37AM -0800, Bobby Eshleman wrote:
> > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > Two administrator processes may race when setting child_ns_mode as one
> > process sets child_ns_mode to "local" and then creates a namespace, but
> > another process changes child_ns_mode to "global" between the write and
> > the namespace creation. The first process ends up with a namespace in
> > "global" mode instead of "local". While this can be detected after the
> > fact by reading ns_mode and retrying, it is fragile and error-prone.
> > 
> > Make child_ns_mode write-once so that a namespace manager can set it
> > once and be sure it won't change. Writing a different value after the
> > first write returns -EBUSY. This applies to all namespaces, including
> > init_net, where an init process can write "local" to lock all future
> > namespaces into local mode.
> > 
> > Fixes: eafb64f40ca4 ("vsock: add netns to vsock core")
> > Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> > Suggested-by: Daan De Meyer <daan.j.demeyer@gmail.com>
> > Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
> 
> nit: usually the S-o-b of the author is the last when sending a patch.

Ah good to know, thanks. Will change.

> 
> > ---
> > include/net/af_vsock.h    | 20 +++++++++++++++++---
> > include/net/netns/vsock.h |  9 ++++++++-
> > net/vmw_vsock/af_vsock.c  | 15 ++++++++++-----
> > 3 files changed, 35 insertions(+), 9 deletions(-)
> > 
> > diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
> > index d3ff48a2fbe0..9bd42147626d 100644
> > --- a/include/net/af_vsock.h
> > +++ b/include/net/af_vsock.h
> > @@ -276,15 +276,29 @@ static inline bool vsock_net_mode_global(struct vsock_sock *vsk)
> > 	return vsock_net_mode(sock_net(sk_vsock(vsk))) == VSOCK_NET_MODE_GLOBAL;
> > }
> > 
> > -static inline void vsock_net_set_child_mode(struct net *net,
> > +static inline bool vsock_net_set_child_mode(struct net *net,
> > 					    enum vsock_net_mode mode)
> > {
> > -	WRITE_ONCE(net->vsock.child_ns_mode, mode);
> > +	int locked = mode + VSOCK_NET_MODE_LOCKED;
> > +	int cur;
> > +
> > +	cur = READ_ONCE(net->vsock.child_ns_mode);
> > +	if (cur == locked)
> > +		return true;
> > +	if (cur >= VSOCK_NET_MODE_LOCKED)
> > +		return false;
> > +
> > +	if (try_cmpxchg(&net->vsock.child_ns_mode, &cur, locked))
> > +		return true;
> > +
> > +	return cur == locked;
> 
> Sorry, it took me a while to get it entirely :-(
> This overcomplication is exactly what I wanted to avoid when I proposed the
> change in v1:
> https://lore.kernel.org/netdev/aZWUmbiH11Eh3Y4v@sgarzare-redhat/

Glad you thought so too, because I actually think your original proposed
snippet in that thread is the best/simplest so far.

> 
> 
> > }
> > 
> > static inline enum vsock_net_mode vsock_net_child_mode(struct net *net)
> > {
> > -	return READ_ONCE(net->vsock.child_ns_mode);
> > +	int mode = READ_ONCE(net->vsock.child_ns_mode);
> > +
> > +	return mode & (VSOCK_NET_MODE_LOCKED - 1);
> 
> This is working just because VSOCK_NET_MODE_LOCKED == 2, so IMO this should
> at least set as value in the enum and documented on top of vsock_net_mode.
> 
> > }
> > 
> > /* Return true if two namespaces pass the mode rules. Otherwise, return false.
> > diff --git a/include/net/netns/vsock.h b/include/net/netns/vsock.h
> > index b34d69a22fa8..d20ab6269342 100644
> > --- a/include/net/netns/vsock.h
> > +++ b/include/net/netns/vsock.h
> > @@ -7,6 +7,7 @@
> > enum vsock_net_mode {
> > 	VSOCK_NET_MODE_GLOBAL,
> > 	VSOCK_NET_MODE_LOCAL,
> > +	VSOCK_NET_MODE_LOCKED,
> 
> This is not really a mode, so IMO should not be part of `enum
> vsock_net_mode`. If you really want it, maybe we can add both
> VSOCK_NET_MODE_GLOBAL_LOCKED and VSOCK_NET_MODE_LOCAL_LOCKED, which can be
> less error prone if we will touch this enum one day.
> 
> > };
> > 
> > struct netns_vsock {
> > @@ -16,6 +17,12 @@ struct netns_vsock {
> > 	u32 port;
> > 
> > 	enum vsock_net_mode mode;
> > -	enum vsock_net_mode child_ns_mode;
> > +
> > +	/* 0 (GLOBAL)
> > +	 * 1 (LOCAL)
> > +	 * 2 (GLOBAL + LOCKED)
> > +	 * 3 (LOCAL + LOCKED)
> > +	 */
> > +	int child_ns_mode;
> 
> Sorry, I don't like this too much, since it seems too complicated to read
> and to maintain, If we really want to use just one variable, maybe we can
> use -1 as UNSET for child_ns_mode. If it is UNSET, vsock_net_child_mode()
> can just return `mode` since it's the default that we also documented, if
> it's set, it means that is locked with the value specified.
> 
> Maybe with code is easier, I mean something like this:
> 
> diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
> index d3ff48a2fbe0..fcd5b538df35 100644
> --- a/include/net/af_vsock.h
> +++ b/include/net/af_vsock.h
> @@ -276,15 +276,25 @@ static inline bool vsock_net_mode_global(struct vsock_sock *vsk)
>  	return vsock_net_mode(sock_net(sk_vsock(vsk))) == VSOCK_NET_MODE_GLOBAL;
>  }
> -static inline void vsock_net_set_child_mode(struct net *net,
> +static inline bool vsock_net_set_child_mode(struct net *net,
>  					    enum vsock_net_mode mode)
>  {
> -	WRITE_ONCE(net->vsock.child_ns_mode, mode);
> +	int old = VSOCK_NET_CHILD_NS_UNSET;
> +
> +	if (try_cmpxchg(&net->vsock.child_ns_mode, &old, mode))
> +		return true;
> +
> +	return old == mode;
>  }
>  static inline enum vsock_net_mode vsock_net_child_mode(struct net *net)
>  {
> -	return READ_ONCE(net->vsock.child_ns_mode);
> +	int mode = READ_ONCE(net->vsock.child_ns_mode);
> +
> +	if (mode == VSOCK_NET_CHILD_NS_UNSET)
> +		return net->vsock.mode;
> +
> +	return mode;
>  }
>  /* Return true if two namespaces pass the mode rules. Otherwise, return false.
> diff --git a/include/net/netns/vsock.h b/include/net/netns/vsock.h
> index b34d69a22fa8..bf52baf7d7a7 100644
> --- a/include/net/netns/vsock.h
> +++ b/include/net/netns/vsock.h
> @@ -9,6 +9,8 @@ enum vsock_net_mode {
>  	VSOCK_NET_MODE_LOCAL,
>  };
> +#define VSOCK_NET_CHILD_NS_UNSET (-1)
> +
>  struct netns_vsock {
>  	struct ctl_table_header *sysctl_hdr;
> @@ -16,6 +18,13 @@ struct netns_vsock {
>  	u32 port;
>  	enum vsock_net_mode mode;
> -	enum vsock_net_mode child_ns_mode;
> +
> +	/* Write-once child namespace mode, must be initialized to
> +	 * VSOCK_NET_CHILD_NS_UNSET. Transitions once from UNSET to a
> +	 * vsock_net_mode value via try_cmpxchg on first sysctl write.
> +	 * While UNSET, vsock_net_child_mode() returns the namespace's
> +	 * own mode since it's the default.
> +	 */
> +	int child_ns_mode;
>  };
>  #endif /* __NET_NET_NAMESPACE_VSOCK_H */
> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> index 9880756d9eff..f0cb7c6a8212 100644
> --- a/net/vmw_vsock/af_vsock.c
> +++ b/net/vmw_vsock/af_vsock.c
> @@ -2853,7 +2853,8 @@ static int vsock_net_child_mode_string(const struct ctl_table *table, int write,
>  		    new_mode == VSOCK_NET_MODE_GLOBAL)
>  			return -EPERM;
> -		vsock_net_set_child_mode(net, new_mode);
> +		if (!vsock_net_set_child_mode(net, new_mode))
> +			return -EBUSY;
>  	}
>  	return 0;
> @@ -2922,7 +2923,7 @@ static void vsock_net_init(struct net *net)
>  	else
>  		net->vsock.mode = vsock_net_child_mode(current->nsproxy->net_ns);
> -	net->vsock.child_ns_mode = net->vsock.mode;
> +	net->vsock.child_ns_mode = VSOCK_NET_CHILD_NS_UNSET;
>  }
>  static __net_init int vsock_sysctl_init_net(struct net *net)
> 
> If you like it, please add my Co-developed-by and S-o-b.

Will do!

> 
> BTW, let's discuss here more about it and agree before sending a new
> version, so this should also allow other to comment eventually.
> 
> Thanks,
> Stefano

Tbh, I like your original proposal from v1 best (copied below). I like
that the whole locking mechanism is self-contained there in one place,
and doesn't ripple out elsewhere into the code (e.g.,
vsock_net_child_mode() carrying logic around UNSET). Wdyt?

static inline bool vsock_net_set_child_mode(struct net *net,
					    enum vsock_net_mode mode)
{
	int new_locked = mode + 1;
	int old_locked = 0;

	if (try_cmpxchg(&net->vsock.child_ns_mode_locked,
			&old_locked, new_locked)) {
		WRITE_ONCE(net->vsock.child_ns_mode, mode);
		return true;
	}

	return old_locked == new_locked;
}


Best,
Bobby

> 
> > };
> > #endif /* __NET_NET_NAMESPACE_VSOCK_H */
> > diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> > index 9880756d9eff..50044a838c89 100644
> > --- a/net/vmw_vsock/af_vsock.c
> > +++ b/net/vmw_vsock/af_vsock.c
> > @@ -90,16 +90,20 @@
> >  *
> >  *   - /proc/sys/net/vsock/ns_mode (read-only) reports the current namespace's
> >  *     mode, which is set at namespace creation and immutable thereafter.
> > - *   - /proc/sys/net/vsock/child_ns_mode (writable) controls what mode future
> > + *   - /proc/sys/net/vsock/child_ns_mode (write-once) controls what mode future
> >  *     child namespaces will inherit when created. The initial value matches
> >  *     the namespace's own ns_mode.
> >  *
> >  *   Changing child_ns_mode only affects newly created namespaces, not the
> >  *   current namespace or existing children. A "local" namespace cannot set
> > - *   child_ns_mode to "global". At namespace creation, ns_mode is inherited
> > - *   from the parent's child_ns_mode.
> > + *   child_ns_mode to "global". child_ns_mode is write-once, so that it may be
> > + *   configured and locked down by a namespace manager. Writing a different
> > + *   value after the first write returns -EBUSY. At namespace creation, ns_mode
> > + *   is inherited from the parent's child_ns_mode.
> >  *
> > - *   The init_net mode is "global" and cannot be modified.
> > + *   The init_net mode is "global" and cannot be modified. The init_net
> > + *   child_ns_mode is also write-once, so an init process (e.g. systemd) can
> > + *   set it to "local" to ensure all new namespaces inherit local mode.
> >  *
> >  *   The modes affect the allocation and accessibility of CIDs as follows:
> >  *
> > @@ -2853,7 +2857,8 @@ static int vsock_net_child_mode_string(const struct ctl_table *table, int write,
> > 		    new_mode == VSOCK_NET_MODE_GLOBAL)
> > 			return -EPERM;
> > 
> > -		vsock_net_set_child_mode(net, new_mode);
> > +		if (!vsock_net_set_child_mode(net, new_mode))
> > +			return -EBUSY;
> > 	}
> > 
> > 	return 0;
> > 
> > -- 
> > 2.47.3
> > 
> 
