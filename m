Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C15536C0C4
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771340925; cv=none; b=WJrowtxzwiA9SKNgF9SCltjvqCkWZ+KvVRxW4vauHR1wrTJ39AdSnjBiArqA1Xrz8dcYShYwkGRhYdHWVv85LXrd85Um0ZlgYhS1Ss0M3OGPYXNLu+L6E1VgCihrQgSv4fae1rmeI2Jesc5w4SleZZiqtxGnI5JdGbbFCcVMS5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771340925; c=relaxed/simple;
	bh=FATg9XsSiPlYwAbae8L/USKuKRBil6Mn8gqbYCmEG2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0GxTSCaL9rK0fhiZIqMy/w3aMVB1wZ3jc7Ar0oFQMloHay/SqPyyFWOyE3jMqkEPo5RaPEz9Xzwu9OnY3YnTysSg140kCqio8VYFV3P5PAficAdyZ/xq491Fymc0vYvLilKHnbPJhnZIXSSHQlaTSip9Hb+uTIKP6forYSsUuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a52M6v0x; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q2wmJ0DP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a52M6v0x";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q2wmJ0DP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771340923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jEc67c+eucBHPlMa8Z8GafQvzyfH5CJQ48/ZIvcQG9w=;
	b=a52M6v0xqTqdHwvW8OEODxURgLPi+5r7F96w68uz9vr7BQEvYWtS4OZM4czFpgD5aHjldp
	0P3wDskid7WK0i+IWEFsr9JkAYwpbjIUMTTfMeBICDjYKtInepmbZVh1zNKxtELa+v5nnX
	DDVdyvgZlNbSfNcU8a6K3Q4Tb51azSU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-Q-zL3Nc4PFudc1YL-cYxZQ-1; Tue, 17 Feb 2026 10:08:42 -0500
X-MC-Unique: Q-zL3Nc4PFudc1YL-cYxZQ-1
X-Mimecast-MFC-AGG-ID: Q-zL3Nc4PFudc1YL-cYxZQ_1771340921
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4832c4621c2so47324535e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 07:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771340921; x=1771945721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jEc67c+eucBHPlMa8Z8GafQvzyfH5CJQ48/ZIvcQG9w=;
        b=Q2wmJ0DPwomE3lsee1BYstQjxqAnEoTsy5rJ+GWkPVk8D2TXrPTr+q9n8RfHUtq6SU
         QkMKme1nOLQPh3W91U2V+9xYt6kUNqX56HkI+vksqVJHb6CzSYBoBA04iEkLOkgvJfCN
         Ak9ZVvabnKDg1E6BW13xVNL6Sa8FLyHglfTZqy7QFyBj+p/48xxZCUIIJM4N+rEyGXRS
         fKIP2GV0s0i0ZcDAVrdZ+qjYM5Z0bSsjw5cdpD8bvUd3kH5FphEqA1D4QKB6MteiGUIV
         yfznMv6w5ra0fpKcDt+HWEkfAb+DPIZNnqqil2+Y7sk0/jNVnCXcsc9CyiIpOav8I+n5
         dBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771340921; x=1771945721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEc67c+eucBHPlMa8Z8GafQvzyfH5CJQ48/ZIvcQG9w=;
        b=JMJy2o0AnIDN8M3ObfeEB8EzkbV01LgoI/TwJF7XRHqvhvGGNdEtjMvA++fii2dno6
         +lrR2bagzSnccyN8vGwZI900g4QgaXg+FCmQAOQ3kwtvuKE7p9pp/psN7RbauYz0pulu
         J89jh1MRZKpawY+vdJz/cZBd8aKmwhYla7KXF/I3necXS2Em/aJld/Z2WgUHz9P21dBa
         KX0UNxR3JkHKPBBePR0vY/7qzTS8n4kwJyqmZwy5yQqe4DNYAyfwvqxvQB5310xJjviq
         2B32G9xwo3o+0b9VuPJZbQlH+Gf7pmkGxbwP8NAziCIwQOoSM+TIo+pjhqaR2zswEjG7
         mbUw==
X-Forwarded-Encrypted: i=1; AJvYcCXQjEr8eI5lvyuUt6Lvb6n8kxrM8nPGn3imTRUVgm7/OB0Il9/JwzLf6LkIKodlIznLYRn+NFL00WoPAB3ZC2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPoX4GngRpxgEWQIbuz/RV1CgBk8Er6Y4iwysHfdXNUDTwVUyr
	hW31Gs3LZKM5N3bFiAov8JezT6993XGfYmHDIDU5lAVabBMHThLq9YPdZz6fvcpVA0AuVz7zPZy
	CyugB0K1pE7PkMRzpMpX+OM2eZg1dmBd+OrcHC43Sau1XA1duwYFsgugEhwPTuy57HPyeXQ==
X-Gm-Gg: AZuq6aIEAAEB5eZ7kXluCmgdKILlUvTMlMMSeCflsBHpeOPcNlNCOhibGakSQyfumqI
	N19kh0rPeloYwZ5DblXazpj9Wb/yjNnE8zfidwQfDGeV/OdJtYy5mZt/o0H4nyCj98aK0HC8Ymh
	6zDmzS2qFg5HoyotjmCGtqp0ZkikKVvKGH2IhwrrNqHlAIm+RrBwyjgOPK3qHyOkfiu54oZie8I
	0t5IKjnrlPyfGbpVPr/nkVMHksSYioYgYSKMHAqQZ1+soPHpJNxa2ImbbX3jACzZMI1PtlDHYGG
	cTj35XKiSeosej90Fv9/fVeR99N4uNbZNgNP763tIHD0mGX2lIqGL/aWgTLPFZtCpDwHjZI1u2K
	MTUb7IHtDy0vdAfbkO+WhS3qfKkuatWEuapKHOiIrX79E7ykbgbgNxRcFlfJCSkuTQSfr9JQ=
X-Received: by 2002:a05:600c:1c1c:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-483739ff8damr256414695e9.7.1771340920709;
        Tue, 17 Feb 2026 07:08:40 -0800 (PST)
X-Received: by 2002:a05:600c:1c1c:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-483739ff8damr256413865e9.7.1771340920135;
        Tue, 17 Feb 2026 07:08:40 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-58.retail.telecomitalia.it. [82.53.134.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4837b64b08bsm102571985e9.6.2026.02.17.07.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 07:08:39 -0800 (PST)
Date: Tue, 17 Feb 2026 16:08:33 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
	Daan De Meyer <daan.j.demeyer@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Bryan Tan <bryan-bt.tan@broadcom.com>, Vishnu Dasa <vishnu.dasa@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Shuah Khan <shuah@kernel.org>, Long Li <longli@microsoft.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, berrange@redhat.com, Sargun Dhillon <sargun@sargun.me>, 
	linux-doc@vger.kernel.org, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v16 01/12] vsock: add netns to vsock core
Message-ID: <aZNNBc390y6V09qO@sgarzare-redhat>
References: <20260121-vsock-vmtest-v16-0-2859a7512097@meta.com>
 <20260121-vsock-vmtest-v16-1-2859a7512097@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260121-vsock-vmtest-v16-1-2859a7512097@meta.com>

Hi,

On Wed, Jan 21, 2026 at 02:11:41PM -0800, Bobby Eshleman wrote:
>From: Bobby Eshleman <bobbyeshleman@meta.com>
>
>Add netns logic to vsock core. Additionally, modify transport hook
>prototypes to be used by later transport-specific patches (e.g.,
>*_seqpacket_allow()).
>
>Namespaces are supported primarily by changing socket lookup functions
>(e.g., vsock_find_connected_socket()) to take into account the socket
>namespace and the namespace mode before considering a candidate socket a
>"match".
>
>This patch also introduces the sysctl /proc/sys/net/vsock/ns_mode to
>report the mode and /proc/sys/net/vsock/child_ns_mode to set the mode
>for new namespaces.

talking about this new feature with Daan (in CC) we were discussing a 
possible change to `child_ns_mode`.

Currently, if two or more administrator processes in the same namespace 
set `child_ns_mode`, they compete. Obviously, after unshare()/clone(), 
the process can always access `ns_mode` to check if everything went well 
and eventually retry.

Daan suggested a more conservative approach, allowing `child_ns_mode` to 
be written only once (a bit like we did in the old version when the 
child could change the mode only once). This way, most users who want 
isolation write `local` in `child_ns_mode` at startup in the init_ns. At 
that point the user  and can be sure that no other process (including 
administrators, e.g., container managers) can change it, so all new 
namespaces will have `local` mode.

I think we should support this option in some way, because it seems to 
simplify the user space in most common cases (ensure isolation). I see 
few options for doing this:

1. Change the behavior of `child_ns_mode` to be written only once, but 
this would limit other possible use cases where `child_ns_mode` can be 
changed more than once (I don't know if Bobby had any in mind).

2. Add a new sysctl `child_ns_mode_lockin` (or something similar), which 
can only be written once with a mode (local or global). A write on this 
will also locks `child_ns_mode`, of course.

3. Add a new `local-locked` mode, reusing the same sysctl.


If we go for 1, maybe we can do it in 7.0, or not?

2 and 3, on the other hand, may have to wait until the next release.

What do you think? Any comments?

Thanks,
Stefano

