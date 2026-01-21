Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12882F616E
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 19:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769023825; cv=none; b=p51PqZR6DCcriQV/mYzlg6YP+BhWqzJCbjBBIa+LGlNYzMBvKhWV+Wp+5z7ySNoNy/xZIr3N5G1M19w8+3Pay4YwB0EicLEE5B9bv4UGQYaG9f76FZRgYU/3H0l92hPwnCmwPe86x2cmaKQJKBJZuc6x4wyw4955Eg5+CY5Zw+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769023825; c=relaxed/simple;
	bh=Lu0kHih9UWQeJ+lp2O4spjT0NK81+eYFDqsV1ZmCcuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J24wM4glvWoYdJ9AyC9/1CwVz3ja36etVOiWSSOV4N7nWzSaiEV65Z493KDueZ9lf+11W4XzWS7HzjX2kPNMhXthQMu2mUXwHd7tpUKUMy4LXPjIC4FeFnfX7fskHb/7r5GE7e2WEBtMIdDTvKv/L/0wWbHAREUt21wdvKIYbUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIjjhqvq; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIjjhqvq"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c531473fdcso22126585a.3
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 11:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769023821; x=1769628621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iOPRZD47F8f143cIEqQqsk0mY0SdG+TC6tAqQjFOOoM=;
        b=lIjjhqvqNknD0VigLYn02H0o0oFIp7ASrUguLeJPGOizz1Q9M55uTYO0JptzPA6nZy
         1V3Ih4CcuDNzXQ50Pri5Hafe37Tn/rhGV3Ye5hQJwcyX9CU8PmCxOsl15ozhGSRamg7v
         X1UOmiq8XF62q1nQxXX8cxD3mgFUIE2tby4VSaI09OAY12/hUCY2w84CJzwjzWJQOr5V
         +7Ptyfd85dfGdgNV3bVLeBbJZAnOkOccP43EksjxY/AftkwvlSNCUEzMEU0H67VmC9sO
         5B4eGSw8/E1Uv/tOyKichE8BLTu/9IZ82ugSEqMjkCQjX7Eo9iD3448gYBVbl0p2rfJz
         bfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769023821; x=1769628621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOPRZD47F8f143cIEqQqsk0mY0SdG+TC6tAqQjFOOoM=;
        b=a05nobkxWgsDVGvS9a6tfAAtNM7nhljDu7JVxRN1hZBWBPZ32UrgHhKf6zLeHpzhLL
         ybS8kPEMDTf6YugRKntCTWjRk0T8o3uVupTsY0FpGR+P0HL82PCTvHH1evlt52pWI/Ix
         BXgkmqEEVSF5cBIc8Um81JiaAuABzVOkpsofDvyJR4enb58z6MFBVpOWkatxJToVL3Kw
         ay4aeYXIi8Da9PVdCDKXkWlPXji6AmvJ+0ZN2JCKQcMHJze+ZiRcY/Y4Epp0s0foQD21
         c9juuIyx5/kwb7fsZ5EcfSWYYJ0U9ImlysFjkZTt1XBlvRrNg55Ck3wjlXkwwI2ooRCg
         apug==
X-Forwarded-Encrypted: i=1; AJvYcCULT/Y9X5NZBfoDp+4b1Zu/ep4A13GRpS69fvHFDUR4lOkGHYGfpHJ13UXN7Ngdhs+zJm+flyZ8556OyF/2EzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkNytLQiA6XA/h0DjfIDNiJea38CLJvtTjoZkRaQ+NRnhPo1os
	momtcCvKhcK5ZkZ9W3t6BNEpDLnTd0RbQ2uUJ/aBElcwSjoseZFrovZN
X-Gm-Gg: AZuq6aL8CkngaQ4uEYPCIYNIVrhge8qTLb8/96ZP3we7mY9YFDnoxUpVklF1DGXfnCW
	K+vBpaytYlG3Wx6hOC94z8OWm/ex5rUvU6vWizI8jT1ThNEtYFqwMxvEMb06brN+xQOM8PdLttP
	El7ASwwiZngn3JQJy+lfkcU0wdCLmGYinFv4v73Cm1qM+g7Izm28lxstJzVdsHbQrJVYlAGS2jD
	C81LWcRBsZjxp3JvJYfnUjPULdFLAxbPSr0sw/TBsy+6zxkt3jytBd5vKJZbLNQ6t8FRepYl4uw
	7BSPzBiXaeAYHxo8/zj8Ge2pgNvsczpD0JUhnRNh0+A01UP278H4rNOE3Ampr+EK12D59H4F03d
	qECUn1n2AQPpqr1uO8Sdo13n7gKBiifv9OKhTsxk/VUpQ440Bp9GaUlsJ6vnD5nkH8ec1P2VetG
	reRr/0VhNviGIE/WGFqx/Kq8G10ohRmei82ZM=
X-Received: by 2002:a05:690c:6089:b0:792:7113:a305 with SMTP id 00721157ae682-793c671a7f3mr146815807b3.29.1769017778141;
        Wed, 21 Jan 2026 09:49:38 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:40::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66f6f97sm68737717b3.16.2026.01.21.09.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 09:49:37 -0800 (PST)
Date: Wed, 21 Jan 2026 09:49:36 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Bryan Tan <bryan-bt.tan@broadcom.com>,
	Vishnu Dasa <vishnu.dasa@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Shuah Khan <shuah@kernel.org>, Long Li <longli@microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kselftest@vger.kernel.org, berrange@redhat.com,
	Sargun Dhillon <sargun@sargun.me>, linux-doc@vger.kernel.org,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v15 01/12] vsock: add netns to vsock core
Message-ID: <aXERsFJLz9b9Fzce@devvm11784.nha0.facebook.com>
References: <20260116-vsock-vmtest-v15-0-bbfd1a668548@meta.com>
 <20260116-vsock-vmtest-v15-1-bbfd1a668548@meta.com>
 <aXDYfYy3f1NQm5A0@sgarzare-redhat>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXDYfYy3f1NQm5A0@sgarzare-redhat>

On Wed, Jan 21, 2026 at 03:48:13PM +0100, Stefano Garzarella wrote:
> On Fri, Jan 16, 2026 at 01:28:41PM -0800, Bobby Eshleman wrote:
> > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > Add netns logic to vsock core. Additionally, modify transport hook
> > prototypes to be used by later transport-specific patches (e.g.,
> > *_seqpacket_allow()).
> > 
> > Namespaces are supported primarily by changing socket lookup functions
> > (e.g., vsock_find_connected_socket()) to take into account the socket
> > namespace and the namespace mode before considering a candidate socket a
> > "match".
> > 
> > This patch also introduces the sysctl /proc/sys/net/vsock/ns_mode to
> > report the mode and /proc/sys/net/vsock/child_ns_mode to set the mode
> > for new namespaces.
> > 
> > Add netns functionality (initialization, passing to transports, procfs,
> > etc...) to the af_vsock socket layer. Later patches that add netns
> > support to transports depend on this patch.
> 
> nit: maybe we should mention here why we changed the random port allocation
> 
> (not a big deal, only if you need to resend)
> 
> > 
> > dgram_allow(), stream_allow(), and seqpacket_allow() callbacks are
> > modified to take a vsk in order to perform logic on namespace modes. In
> > future patches, the net will also be used for socket
> > lookups in these functions.
> > 
> > Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> > ---
> > Changes in v15:
> > - make static port in __vsock_bind_connectible per-netns
> > - remove __net_initdata because we want the ops beyond just boot
> > - add vsock_init_ns_mode kernel cmdline parameter to set init ns mode
> > - use if (ret || !write) in __vsock_net_mode_string() (Stefano)
> > - add vsock_net_mode_global() (Stefano)
> > - hide !net == VSOCK_NET_MODE_GLOBAL inside vsock_net_mode() (Stefano)
> > - clarify af_vsock.c comments on ns_mode/child_ns_mode (Stefano)
> > 
> > Changes in v14:
> > - include linux/sysctl.h in af_vsock.c
> > - squash patch 'vsock: add per-net vsock NS mode state' into this patch
> >  (prior version can be found here):
> >  https://lore.kernel.org/all/20251223-vsock-vmtest-v13-1-9d6db8e7c80b@meta.com/)
> > 
> > Changes in v13:
> > - remove net_mode and replace with direct accesses to net->vsock.mode,
> >  since this is now immutable.
> > - update comments about mode behavior and mutability, and sysctl API
> > - only pass NULL for net when wanting global, instead of net_mode ==
> >  VSOCK_NET_MODE_GLOBAL. This reflects the new logic
> >  of vsock_net_check_mode() that only requires net pointers (not
> >  net_mode).
> > - refactor sysctl string code into a re-usable function, because
> >  child_ns_mode and ns_mode both handle the same strings.
> > - remove redundant vsock_net_init(&init_net) call in module init because
> >  pernet registration calls the callback on the init_net too
> > 
> > Changes in v12:
> > - return true in dgram_allow(), stream_allow(), and seqpacket_allow()
> >  only if net_mode == VSOCK_NET_MODE_GLOBAL (Stefano)
> > - document bind(VMADDR_CID_ANY) case in af_vsock.c (Stefano)
> > - change order of stream_allow() call in vmci so we can pass vsk
> >  to it
> > 
> > Changes in v10:
> > - add file-level comment about what happens to sockets/devices
> >  when the namespace mode changes (Stefano)
> > - change the 'if (write)' boolean in vsock_net_mode_string() to
> >  if (!write), this simplifies a later patch which adds "goto"
> >  for mutex unlocking on function exit.
> > 
> > Changes in v9:
> > - remove virtio_vsock_alloc_rx_skb() (Stefano)
> > - remove vsock_global_dummy_net, not needed as net=NULL +
> >  net_mode=VSOCK_NET_MODE_GLOBAL achieves identical result
> > 
> > Changes in v7:
> > - hv_sock: fix hyperv build error
> > - explain why vhost does not use the dummy
> > - explain usage of __vsock_global_dummy_net
> > - explain why VSOCK_NET_MODE_STR_MAX is 8 characters
> > - use switch-case in vsock_net_mode_string()
> > - avoid changing transports as much as possible
> > - add vsock_find_{bound,connected}_socket_net()
> > - rename `vsock_hdr` to `sysctl_hdr`
> > - add virtio_vsock_alloc_linear_skb() wrapper for setting dummy net and
> >  global mode for virtio-vsock, move skb->cb zero-ing into wrapper
> > - explain seqpacket_allow() change
> > - move net setting to __vsock_create() instead of vsock_create() so
> >  that child sockets also have their net assigned upon accept()
> > 
> > Changes in v6:
> > - unregister sysctl ops in vsock_exit()
> > - af_vsock: clarify description of CID behavior
> > - af_vsock: fix buf vs buffer naming, and length checking
> > - af_vsock: fix length checking w/ correct ctl_table->maxlen
> > 
> > Changes in v5:
> > - vsock_global_net() -> vsock_global_dummy_net()
> > - update comments for new uAPI
> > - use /proc/sys/net/vsock/ns_mode instead of /proc/net/vsock_ns_mode
> > - add prototype changes so patch remains c)mpilable
> > ---
> > Documentation/admin-guide/kernel-parameters.txt |  14 +
> > MAINTAINERS                                     |   1 +
> > drivers/vhost/vsock.c                           |   6 +-
> > include/linux/virtio_vsock.h                    |   4 +-
> > include/net/af_vsock.h                          |  61 ++++-
> > include/net/net_namespace.h                     |   4 +
> > include/net/netns/vsock.h                       |  21 ++
> > net/vmw_vsock/af_vsock.c                        | 328 ++++++++++++++++++++++--
> > net/vmw_vsock/hyperv_transport.c                |   7 +-
> > net/vmw_vsock/virtio_transport.c                |   9 +-
> > net/vmw_vsock/virtio_transport_common.c         |   6 +-
> > net/vmw_vsock/vmci_transport.c                  |  26 +-
> > net/vmw_vsock/vsock_loopback.c                  |   8 +-
> > 13 files changed, 444 insertions(+), 51 deletions(-)
> > 
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index a8d0afde7f85..b6e3bfe365a1 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -8253,6 +8253,20 @@ Kernel parameters
> > 			            them quite hard to use for exploits but
> > 			            might break your system.
> > 
> > +	vsock_init_ns_mode=
> > +			[KNL,NET] Set the vsock namespace mode for the init
> > +			(root) network namespace.
> > +
> > +			global      [default] The init namespace operates in
> > +			            global mode where CIDs are system-wide and
> > +			            sockets can communicate across global
> > +			            namespaces.
> > +
> > +			local       The init namespace operates in local mode
> > +			            where CIDs are private to the namespace and
> > +			            sockets can only communicate within the same
> > +			            namespace.
> > +
> 
> My comment on v14 was more to start a discussion :-) sorry to not be clear.

No worries, resending with this included started a good discussion so
not for nil.

> 
> I briefly discussed it with Paolo in chat to better understand our policy
> between cmdline parameters and module parameters, and it seems that both are
> discouraged.
> 
> So he asked me if we have a use case for this, and thinking about it, I
> don't have one at the moment. Also, if a user decides to set all netns to
> local, whether init_net is local or global doesn't really matter, right?
> 
> So perhaps before adding this, we should have a real use case.
> Perhaps more than this feature, I would add a way to change the default of
> all netns (including init_net) from global to local. But we can do that
> later, since all netns have a way to understand what mode they are in, so we
> don't break anything and the user has to explicitly change it, knowing that
> they are breaking compatibility with pre-netns support.\
> 
> 
> That said, at this point, maybe we can remove this, documenting that
> init_net is always global, and if we have a use case in the future, we can
> add this (or something else) to set the init_net mode (or change the default
> for all netns).
> 
> Let's wait a bit before next version to wait a comment from Paolo or Jakub
> on this. But I'm almost fine with both ways, so:
> 
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> 
> > 	vt.color=	[VT] Default text color.
> > 			Format: 0xYX, X = foreground, Y = background.
> > 			Default: 0x07 = light gray on black.
> 
> [...]
> 
> > diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> > index a3505a4dcee0..3fc8160d51df 100644
> > --- a/net/vmw_vsock/af_vsock.c
> > +++ b/net/vmw_vsock/af_vsock.c
> 
> [...]
> 
> > @@ -235,33 +303,42 @@ static void __vsock_remove_connected(struct
> > vsock_sock *vsk)
> > 	sock_put(&vsk->sk);
> > }
> > 
> 
> In the v14 I suggested to add some documentation on top of the vsock_find*()
> vs vsock_find_*_net() to explain better which one should be used by
> transports.
> 
> Again is not a big deal, we can fix later if you don't need to resend.
> 
> Thanks,
> Stefano

Sorry about that slipping through the cracks, will add to v16.

I'll resend with:

1. revert init ns cmdline
2. update this message about why the port allocation changes
3. fix the vmtest missing ns arg bug that Kuba mentioned
4. update documentation on top of vsock_find* / vsock_find_*_net
5. update documentation on top of af_vsock.c w/ note about init_ns
having its mode fixed to global

Unless any prior feedback slipped, I think this captures everything
pending? 

Best,
Bobby
