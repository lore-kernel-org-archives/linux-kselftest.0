Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576124;
	b=2rlUdRVNXVDy3m4tf03cuFKu3FmCVIoQJyneMioMakoImfWORuPiES+6g+uwWfXlc5i3
	 ldGRqtfhE7g3YGx16cIol+DJeV5hwMYV8W0S2u2ChqCBvlbTzpH/fXMvRsG+8xS2oeqSl
	 Muukdak7r60EICLoQNGrsmyQZdn9suEv7S0A8WiwaKPmVMRl4XsOZ1lVXOpY2gTogreJr
	 D7vMC/GJ3QNWTlc44jVj50tE6n8/cWdPAXeDtcMtjyD7sHukO1Tu95iM9FMMAAGFGVRvs
	 dV/ZxWb7quGHUUbnM3ID2DvW5TAPx1BhnZuI09/l+AEVwEhmetYe/6oIs7yQ26gGvFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576124;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3oOP1y+9aN6aMBiBqwXHlYcfXTBVxTTDMi2tTB6X1Pw=;
	b=XvRjCwaIUAFF3Dpm+jqWvPJrxQD93B5u8uPn2KdYkC42JHkxBaq8z/X1tZKkh+l/egGc
	 ri8c4DWsjZR4hjDIulyveiCk9S7EiLTWL+pePkzHtn7xfsn6P80vE8Ed61MLHxv04QhEW
	 LhuVe5+0KssHn+lQNnDJR2/0Z7hSwgobxn1sIECISUEyT4Gyrk6uviErfrS0PVjlXrrc2
	 xvUgfDGOEk63OUQQBb6UeMG1+ukIEhNqJoOUOAjUF4QddL64bNHfNXjuplb/0wh9PGxf7
	 bnOEtt39CNsTWzznHStIOUAXiFzWog60F8UePTPMwW7rpMae/qjLtKTGSsjxfOcNlvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PLCVwZiX;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fOIDGL33;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3502C606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 09:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3502C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PLCVwZiX;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fOIDGL33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792576123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3oOP1y+9aN6aMBiBqwXHlYcfXTBVxTTDMi2tTB6X1Pw=;
	b=PLCVwZiXPR9JFRoqs/xSRah++sTzTfCSwRQn1g02KbthqSFKfGV2EQmXzEXKpSlXntbbSO
	UcbHKv/ZeiDnxJsYIUrZQno2PQI/RfpxRKlXcjMjZrNjWEF4/tdgwdeoJdHu3A5QfZ+3cz
	xRQ4OurGHNNBYncV0GUq9HN3G/EFll4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-hMoc5I-1NjifOMRhFY1yHQ-1; Wed, 21 Oct 2026 09:48:41 +0000
X-MC-Unique: hMoc5I-1NjifOMRhFY1yHQ-1
X-Mimecast-MFC-AGG-ID: hMoc5I-1NjifOMRhFY1yHQ_1792576120
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48dfa054f26so397062f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 02:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792576120; x=1793180920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3oOP1y+9aN6aMBiBqwXHlYcfXTBVxTTDMi2tTB6X1Pw=;
        b=fOIDGL33NTrxPKx+BfsSsDVnXGS4e8t1HJJGUsc3zBeYFcQ3ytvC0qEBRWjlfcyZrr
         ZCckOHMhq0gDAviC7f++/hBeFg2lT7fA0dttpTW7BGm1HhGK9eEMaPmE7TDHycXFjXHk
         h7isdhUMxs7yCNSiurFJE3JaxJ7pN3pn9BsYs9SHANIIphkdRwNpO4FR9itNunWMSxhy
         771t03Cx22KDx1i08QAh+IExKyggLErVRHkGmOFSmSqteiSE5s2VW/g06SXItYaSgVJN
         K4stLeA5BBNcDnmNyRisJHaTIbAhf60v4At2UHbhm/fT0XdPXzWoegysEI2GbNcnjv+Q
         j4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576120; x=1793180920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3oOP1y+9aN6aMBiBqwXHlYcfXTBVxTTDMi2tTB6X1Pw=;
        b=x8SLVIomOPAiIlbhFc3Owd1+Gqzz2EmmZD7OHccP8VE+kvXwBPYXOVziPBJUX/TX09
         kP2NAkONprqoH5iw51OgPVhdWsnBjSQSdVNhoeR5OvS0I2EQ040REDg1F4CpPg0pA5JU
         Cm24l3YykXNkEaybRoGkRAqnlGHSFpYiHBnhFoQzGlU79xwglH2nEj9/S1S4dIb4E5xZ
         8YyQPWCpYRVcGt4SZWiWGwAa1cNrn2Zi/U2F1bSL6h2eNqIUVqFKVx75IxrSE1429cVD
         FDoNiYw41lV+xk+dVGY/6paZWvODbHst0z0gVwiOHqvm+64LCgbu3gRGrbuNhR0WODsJ
         2gEg==
X-Forwarded-Encrypted: i=1; AKwUvByPmh2WFapmKAb1ECRvhQME/StoXpUeqKgYYv0bAKOcHRBx0yc4v44sIgqEX34/PnyL9fqnL8aEO6/+Jn0s18Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDpTwC97uh1j5bPWftwF131l77WBsBFY7bEkhO7/VrT/wJ3m6Q
	EAQoebrHNYrJvW5hmpN3jAZXSONR5CQWtFkxwkX1++aZCUuwGQUjcy3F25lx6RZ1bvhjx8OTumu
	k3u9mtoZ7Qhh7sB3xv64tUZdqhilTWjI1iglWoRjKD9sG47aRqHyT5QeV0I1RPe1maIDYQA==
X-Gm-Gg: AYBFou1eZ+wN84eEfQ8BebNWOJhveD2VsBrzHFDHtLb/SWfsT4aMoq2fQEROOJWfetG
	KVoaqKv6lN6JRxNFwVdDKPeuVR/Qm+x5n1fvYl6L5Wy7gKlvNoMMgSmdeh4+SfZU0a53Tv1IWCF
	KQCm6K7w8RE/QUZfITrEfSkmLwLb70Z8BsXSukkA126VbnRYF7SCt7Eqfgw/Nfdl7X95v/qwhb6
	/UVPWDWLFgjJElK4RxrS0hayp1ojQx7kiByi65dwuM9eM+X8DlYWCKdfUzr11DwgoBLcINMQKcX
	OyLaX0OZQvj3izGSwI8qf7zBZZUCw9Nyf2J7MRhZGrD0wkCOkU3hPMoNitQ5zuX50RHYFVs01Q4
	6AcE4jg==
X-Received: by 2002:a05:600c:6085:b0:4a1:d0e4:2bc7 with SMTP id 5b1f17b1804b1-4a1fdafd610mr29312465e9.15.1792576120186;
        Wed, 21 Oct 2026 02:48:40 -0700 (PDT)
X-Received: by 2002:a05:600c:6085:b0:4a1:d0e4:2bc7 with SMTP id 5b1f17b1804b1-4a1fdafd610mr29311875e9.15.1792576119740;
        Wed, 21 Oct 2026 02:48:39 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.178.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc1b227dsm52096435e9.6.2026.10.21.02.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:48:37 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:48:30 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@kernel.org>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sargun@sargun.me, jlinbox@meta.com, 
	Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: Re: [PATCH net-next v4 0/7] vsock: assign the guest vsock device to
 a network namespace
Message-ID: <atiKKS3piuBLEiSd@sgarzare-redhat>
References: <20261020-vsock-guest-ns-v4-0-047527cfccfc@meta.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261020-vsock-guest-ns-v4-0-047527cfccfc@meta.com>

On Tue, Oct 20, 2026 at 06:15:03PM -0700, Bobby Eshleman wrote:
>vsock network namespaces let a host put each VM in a namespace of its
>own. A guest has no equivalent yet. It has a single G2H device that
>cannot be assigned to a network namespace.
>
>This series lets a guest move that device into a network namespace. A
>new generic netlink family, "vsock", supports the command
>VSOCK_CMD_DEV_NETNS_SET which assigns the device to the namespace the
>request was sent from. The namespace's existing ns_mode then decides who
>may use it: a "global" namespace shares the device with every other
>global namespace, and a "local" namespace keeps the host connection to
>itself. The device starts out in the initial namespace, so until the
>command is issued nothing has moved and no mode has changed. There is no
>explicit unassign as assigning the device back to the initial namespace
>is equivalent.
>
>The command requires CAP_NET_ADMIN in the initial user namespace, so
>that an unprivileged user namespace cannot claim the device.
>
>Connections that can no longer reach the device after a move are reset,
>so that a namespace which has lost access cannot keep using a socket it
>opened while it still had access. The assignment holds a reference on
>the namespace, so deleting that namespace does not move the device; only
>another assignment does.
>
>Transports opt in through a new netns_assign_allow flag. Only
>virtio-vsock sets it here, because it is the only guest transport
>that I am able to test against.
>
>Based off of Stefano's original series:
>https://lore.kernel.org/all/20200116172428.311437-1-sgarzare@redhat.com/
>
>Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>Link: https://lore.kernel.org/all/20200427142518.uwssa6dtasrp3bfc@steredhat/
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
>Changes in v4:
>- All Sashiko fixes (see individual patch change lists)
>- Link to v3: https://lore.kernel.org/r/20261012-vsock-guest-ns-v3-0-b32447c66b23@meta.com
>

Sorry, yesterday I started to review v3, but didn't post comments :-(
I'll send on this series.

Thanks,
Stefano

