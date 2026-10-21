Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577685;
	b=Rqs4Z1HYhljGZvHl1kSdEZ6hYEBF+sWkW69pzTxTbI97xoZmMowTNeiLBw4HosmsOLwG
	 EDbKni3TFfIUAq6WugDq4oDMI5Q0hY8N0XMqxjnQGjSOdebdt/M00b2woN7mVu6ePSxMN
	 mjvYDRbgSg9QBOH/6XropUyBvqXc8XbgsVLxiAAyC4X2nuRU4GvBeFx0Jk1tv/YC9xnRa
	 x08+VOTHd3y5qsOZx/ypFi4PbWUN09bNwBkNBF8D1a5wyexp6+vVIR3mQrdJFOeIyiVEK
	 HQ/KppJwWmR0+4cr1Q5qCFGdE43/31fBhngLKO/YVF/WwBYX0N19zEIDZAWvHjMIfRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577685;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LaMrw0UGiuCnM59eNBEdevbmBZ2o/qyOQGg9zp+WMrM=;
	b=S3IEKP1kb3T01yorRPjSizhMvgx2VS5Egk6OJtUWFqXMUaxU6/rgXME8bfrjU/kBwiu6
	 p49+hSu6VrUrP+dr3gdsKAjEt2bBGMP6x2uSoFh371U3fSkhbwSDBb7Y3KoBa1tfbsCkn
	 rRCnK+o1IqnOlcIs9y2OxC7N5gpy6On6MvK25ECZB/v7GmWvHcbG7tuYhiVrQzOxDyUWH
	 nqvcjSPqUy/umNCUXtB3iteAbhBDfuXno2ekLCHhv8+6gXC8ykrxdth6cPTA+8VwaRdiT
	 8Bleo/yKP0B/IrYgbKVFYE7UhIP+XLB6poXp+3xdT1ocwowdg7tD+8MbSdY/7sHzyqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TpixcOcI;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ejAaswOC;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0AD606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 10:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F0AD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TpixcOcI;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ejAaswOC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792577684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LaMrw0UGiuCnM59eNBEdevbmBZ2o/qyOQGg9zp+WMrM=;
	b=TpixcOcIc+qEmEDiQ0FLw+S+qtpggT3NqH0RIXuzC8XKV/f9YbgNr3ahFBE7fZ+GDb2aiM
	MJ8Tu/HXmRNLwBcF7ACuwPEadiowaMAmgZJ/st10hS9I3uA3Zr1aRYCnlG+rN/XIpsvwi5
	q+58VurQ3uB5vhiS4wynDKnC3HLs7QE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-eKPGlRHpMOmITeB6HHsOvg-1; Wed, 21 Oct 2026 06:14:36 -0400
X-MC-Unique: eKPGlRHpMOmITeB6HHsOvg-1
X-Mimecast-MFC-AGG-ID: eKPGlRHpMOmITeB6HHsOvg_1792577676
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e1ad3cb66so282117f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 03:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792577675; x=1793182475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LaMrw0UGiuCnM59eNBEdevbmBZ2o/qyOQGg9zp+WMrM=;
        b=ejAaswOCkEY3H7XHMvAZgqt+YFWmaA2GRwEj+PstMfsG6vKej3aW9Mc3rh9fAEWYEb
         pg2JMCkAPE82ExN+TJKKaHRxxf+3uJRlOUFuBXopOsn1ymGHjdcQSgg7go7o2YFOI6B4
         5Be9HrAfZ3MzPuPr3CKBSUBj4Qny302DJ5AAyOadKTYOToXS4tMVBUuwRD052omVT7J0
         MD1H88CSDfGxOULqFgCsw8YcCa6ZqWGbgLZXdbr5TZ9li9gphxupZM28UZ3UNFe32CXU
         Z6TO6k+AYwCq6yZ5V00AlM8z7dgnk6dWXWcf/KseDK8hkirdiHm+lEyFTAzhw2dNekkJ
         r8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577675; x=1793182475;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LaMrw0UGiuCnM59eNBEdevbmBZ2o/qyOQGg9zp+WMrM=;
        b=NJ8OMIz4e3Pe6fMru0C+vzx1J0huEE6o8nqJbAN2CZTDnJ2AZVFSJYxd62Xqa2gHEZ
         Th+sqQHYBDOhFErI3A3+OT0hZqAwYJUzk5qMvXryd+rpdEZ8uKJvTELuKXimDD4FGuog
         GvcYxYrR19vzkVu3xE6jWm7GXfb+nyIi1p93xXeJ9fiOND08lsueLKlcqLQYAYXh2HvQ
         Xrv9C/yy667oUPIEJfUZQzu9BNbKd6VKgDh4SwrBuOLEg6byfm1UcGpP9zuvuojXucwC
         tkULrWYY+DKoLFg3hdL3nuqe6dW30Pf/rTh6filAiS/O9d0ydiaQCn3vfHBsAthoYC/C
         nYpw==
X-Forwarded-Encrypted: i=1; AKwUvByi0Wc4CeIiyPrpSS1pBvr9g60cVMKe083RlAH+QVeMEVqSHsQYSe7patRbz+w0c0dz/prsxqZvuChEcWhIQmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFXYRGuUfOedKwvk2Bcm44VeqGE3JhxlrPorpY6pjPQS6U+ijx
	OA6TDS+rj7W0ohsxU56cZfswyVpAJYzNMfphawBSoFxUqboZU/B7nXR9cP2OnRgEXqz3CJNdy61
	D0/p59BNWukJfHpRzgXO6/83ELjPB7XImtoDQetnbhl5UkcT5vz2slEm3ugwlx3sezfiM7A==
X-Gm-Gg: AYBFou0sCPno2VM4OmbcDn5yK939YWVOzZ99s4Z+AswD1NB/qCzV16nrCmHq/Ts+5EW
	1NuWBjMecc3Z8vAv/GjTTgqWv8fS/n/hcR9403tz5BsrnQAY8kmohbOz1vzlBpzzSNbkPVy9DA7
	jInIafO4VNo8YvWgfbCLFbtWYPvGvAFWApsUbUkqYI88YbhEwVoLJBAXchsBt+1rQwaGExdPsbS
	uPIwWAZz0mqzGK76bjN7gJTivER6skF1BxH1PeYgL3lvsxyyri731QmxOd9wmyHhof2xVEJptCi
	n3woOrsvOU5DKes+NxCaz6+8qCc06a/T/ztpoO/FGEuWRarKRYkwIrrgYJHX0OCzfIC5qWkalDL
	s2BqSnA==
X-Received: by 2002:a05:6000:4213:b0:488:8931:b1b2 with SMTP id ffacd0b85a97d-48e264bd584mr3754101f8f.28.1792577675510;
        Wed, 21 Oct 2026 03:14:35 -0700 (PDT)
X-Received: by 2002:a05:6000:4213:b0:488:8931:b1b2 with SMTP id ffacd0b85a97d-48e264bd584mr3754032f8f.28.1792577675060;
        Wed, 21 Oct 2026 03:14:35 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.178.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f0bc2sm4512724f8f.1.2026.10.21.03.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:14:34 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:14:30 +0200
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
Subject: Re: [PATCH net-next v4 3/7] vsock: pass the netns to
 ->has_remote_cid()
Message-ID: <atiQfOneKTIyhGHX@sgarzare-redhat>
References: <20261020-vsock-guest-ns-v4-0-047527cfccfc@meta.com>
 <20261020-vsock-guest-ns-v4-3-047527cfccfc@meta.com>
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
In-Reply-To: <20261020-vsock-guest-ns-v4-3-047527cfccfc@meta.com>

On Tue, Oct 20, 2026 at 06:15:06PM -0700, Bobby Eshleman wrote:
>The transports only use the socket to find its network namespace. Pass
>the namespace instead, so that a later patch can ask whether a CID is
>taken in a namespace without necessarily having a socket on hand. This
>will help with avoiding CID collisions when devices move between
>namespaces.
>
>No functional change.
>
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
> drivers/vhost/vsock.c            | 4 +---
> include/net/af_vsock.h           | 2 +-
> net/vmw_vsock/af_vsock.c         | 6 ++++--
> net/vmw_vsock/virtio_transport.c | 2 +-
> 4 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

