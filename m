Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668043D952F
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 15:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486946; cv=none; b=qMSKCOrm2JNXRJkg7YupJYW9amhKtYzfims86HQ4TCjncLVQ0sg8J0KsxFOyuBCOeLBEs13i48CllIEesi8wmaeAjILcZuDsdI7Qj9OEwOS8Egth2ih2GY51kbKA77fhzeCFhgolmUBbCFJGeor2GvH7IU+M7vvSdeXxf9IhiHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486946; c=relaxed/simple;
	bh=E+BuIG99Fs3gW60ZhBJoousphtXqpfMPQp9AyvW4hbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZ17ZFj2jtIbFXIcOfbk36E1pqLxsNzQxJ+Tt3dpeC5IV5S67XyqGD7w4Qmm8+InU6k3s0Dus2S09nR9lKXKkxdo3uzDdAaiGR1yGtpuLo5ZyDaODHLBnDhX1SUvh8eXqN0v/NurwFH6F4GB3ZMUrQUmv1BFuNaViOjCWNNJVRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IR0VPlRH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DlOX6hOI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IR0VPlRH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DlOX6hOI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789486944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=piCn16bJNZqtD+Ea5Vr8Xw4q1fEfx3gnyjZeao+goZc=;
	b=IR0VPlRH4O9oB5m3DkEvV+FLYdGtrxifAP1GaDbgnjLRLNp8c9XCYDz3AyYDW05jmcsaM6
	Z3CBFIH04WWjkPhoLgamc7LqEdl2aGd8Bb+QK0sk4OMfgyfvZBzZBbbF3a0/lElIV1Pagi
	kq8sWZpvb3axhTVu3E0xl9Tm7IH9Cc0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-LYfvcBuQP32_8fd6EbnVyQ-1; Tue, 15 Sep 2026 11:42:22 -0400
X-MC-Unique: LYfvcBuQP32_8fd6EbnVyQ-1
X-Mimecast-MFC-AGG-ID: LYfvcBuQP32_8fd6EbnVyQ_1789486941
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e823c4868so4982345e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 08:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789486941; x=1790091741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=piCn16bJNZqtD+Ea5Vr8Xw4q1fEfx3gnyjZeao+goZc=;
        b=DlOX6hOIOTQudbeylDTBlu/1eLr9D/e5UdJ9lUKctUFbOHE1dWtRspL03jEZThfnZK
         2r9x2G6W/KEs+Taf4kKG4JW04VUulVg06CzD60FHprlShrmlQBgygtTPIfwi23cu+CJn
         WUXykqvUdumij86ZGAFuDTDMOhs77zJSQAgidBG6cAb1/40T6XBMmY6L86zK1nS9NZqV
         X7NqNE0mQdI+pah/MqDGkf1n/BO8uRmbebbrYyS6C9PwdtL3QxWpVsw2vj2cdA83uyoB
         aWY+SuOz1WLFZy8WQ00FwStPAcp3qcZk7ThKX4P2+r9UYRi5FJmngKRxfMQeKB9amC8G
         v0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789486941; x=1790091741;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piCn16bJNZqtD+Ea5Vr8Xw4q1fEfx3gnyjZeao+goZc=;
        b=x5MGu8fXMbn7lk0zF0XkSzqmk9BKPUwvf023AaxC/EGIBpssqgqZtoVU317JjJ06LK
         Q7616UYPESmhYvUWvbivvajpQvOKDmF0/fqZQdP9lYztX/Jf4hh3UgNTfhhVjQ6UktGq
         8pEHdA/3skZhEmRmUafSg4rc+nGfqGDObYwzyEOOWproSb1R3CuLWYpyEUKEhR6Z1gqJ
         6/o5SmdyawlcbJlcvaaeNPQhhTk+HYpN0FBK2kmw3PvR0MD7R93FVwWV6qQs+74/p3NL
         8yCJRUyV0jRWKaMs9Cc1UiBjhiBnUnuCoL9xfHnGjxE4kWA9pDa1iGhTE38I4NAN0uFW
         ND3g==
X-Forwarded-Encrypted: i=1; AKwUvBwZLyPDCe33AF0M69DKLACUCl/KFOxsLSFXFzzJgVAAiBFAB2GRccr3aG8pg++5fikuUplk9gk+W6PJTii0xYk=@vger.kernel.org
X-Gm-Message-State: AFuF++nTQGkBZBasbp3DSKsaTU5TWp+8dEkubiNSivmPoevX1e1ep1EB
	2iLFi3956WcsMNJRW6vUEfM6R4dbOU5xQQiVn1eLENR3PJ0hz5MR24F2qMoRKuAlRYpvfyzrRvQ
	osGUcKdUTQUxmyewP/SWRP6Q705vi/dNsROGyWAh5Iw8TCfQdmWXNXttTlueD/kVPWRT4tg==
X-Gm-Gg: AYBFou2xn2VlXY4RlrJfEdkF9uAk9NfwNxHVvXZpoh41AnOiSxGDGh4dpTVCsMUuLdb
	lNg0THXGRECxjJn7OFpd1wcx8/4m3VuL7Qi92Ps6K4eiCVWHYmBWdVSoYVFLmrRHiYjvpfnWTrs
	UHsCTni7yQBRLUP4+t0BTPbMgN1yOpKD/bScbbtOOZD0Fhovxv2ILLVcb6qv94EDnyhZ31PWPBr
	PbBXxeNmVDDJCwTh29WxosI9RvmxHO40k7Flnw1wTSZMbSDSYGm+hqLPo1VkaAnicCgWM9HM/7m
	nB6hGkUtSvgF8bbxwiCnm5QFulQkDwZeglWKg5Qlp9S7WpwWTlXz582+w4sn2CR7msknRJ7D42P
	vW3J+kF48nmfVybBox/xpv7v8dugpHYU6D+kxN0t4l5yhbg==
X-Received: by 2002:a05:600c:8b74:b0:49c:ee20:e787 with SMTP id 5b1f17b1804b1-49e7a658021mr197081135e9.1.1789486940770;
        Tue, 15 Sep 2026 08:42:20 -0700 (PDT)
X-Received: by 2002:a05:600c:8b74:b0:49c:ee20:e787 with SMTP id 5b1f17b1804b1-49e7a658021mr197079685e9.1.1789486940213;
        Tue, 15 Sep 2026 08:42:20 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870b39ea31sm949332f8f.23.2026.09.15.08.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:42:19 -0700 (PDT)
Date: Tue, 15 Sep 2026 17:42:17 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sargun@sargun.me, jlinbox@meta.com, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 1/6] vsock: constify the transport in
 vsock_for_each_connected_socket()
Message-ID: <aqkcd_oMWK-QtXWQ@sgarzare-redhat>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
 <20260902-vsock-guest-ns-v1-1-9995383e9a8b@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260902-vsock-guest-ns-v1-1-9995383e9a8b@meta.com>

On Wed, Sep 02, 2026 at 04:00:47PM -0700, Bobby Eshleman wrote:
>From: Bobby Eshleman <bobbyeshleman@meta.com>
>
>Allow const transports to be passed too. The function only compares the
>pointer against vsk->transport, which is itself const, and never writes
>through it.
>
>No functional change.
>
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
> include/net/af_vsock.h   | 2 +-
> net/vmw_vsock/af_vsock.c | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

