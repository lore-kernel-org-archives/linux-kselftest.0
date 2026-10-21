Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577478;
	b=sALNL5IZy2otGZY6YiPzVs9AGd+3R4yq3If/rzysOi/UZVpVcusTXYvwz29MndoMqtUQ
	 orN7J4S/c/XrlU5XNQktmbmaVAGeJl5VaO4DvwQGPSr5eCaoyw8ivyO8qfk9EWnAAsn5M
	 VM9OM/HJBTfjdEPzm3QI9amNO+POB0Ru4Zj1ygszNTUnPmboy9+yEHqO1cqUImigZoWp3
	 Hd3U7ITKFNROf45QELD/5kuKcCVMcj5KuMlSnmB580giCToH3d/amJJCEfiIw/GGbt5RQ
	 ZgpZn7YIBQzBsul6vMORIVpueT11raTYdqsCSk0JvNKlbePsEI8tIGbcYlP13PuC5aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577478;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vVLJOhfTidMKw4MIf43k3Z+xniDsBdpWe5ByNjjrE/o=;
	b=VfSodVO6BjPdOvFRM74GkC3nFMeJwy6MRw9dDIxGAcLG+Xk3xG0J6sFmuH/9d0KwLEhr
	 2pEvDyZVEAGFF3xRhOJUxTBWRmw/u71JtVB4M5/30IT/QpnRh176f4aom/gWt9+iaRfP/
	 FGpkJZndOINyF4+3KwdS8jZHhSKHNRYxueTJme5+U+2V6eKcSvqXH0PLAiMH7UkVZgGVT
	 AYX9nYVgplKnn3pK77oUFJcj18N9m6WyKKoEZbsX/YUTfSs4cV+/0m/V+8FELwZCOV60n
	 YMnkLdZyF3jNjXWHQv8aeny1osnSsZeDWdQOlgg/yEKzcQHfzaWBMUW46QPaEgKlRPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hszdT9a8;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=p2NMMm65;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C74606A325
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 10:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C74606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hszdT9a8;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=p2NMMm65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792577477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vVLJOhfTidMKw4MIf43k3Z+xniDsBdpWe5ByNjjrE/o=;
	b=hszdT9a8Gz7PZmDau+A5NQzk5enlaX1loOY9dz8VDTy1D/qIsLECmsg0TFFc+ezOTleatP
	Uny5ao51m/VubELupZnkam7Aj6EprFOqZFcGGg03tJde+vIB7Vf5HEV2hTvXL3KL0/1yL4
	XQwVB/izHWz6RfZihwAFjmQqvXCHPw8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-mLFnK-jnOXi-WfQp1J0xmA-1; Wed, 21 Oct 2026 06:11:12 -0400
X-MC-Unique: mLFnK-jnOXi-WfQp1J0xmA-1
X-Mimecast-MFC-AGG-ID: mLFnK-jnOXi-WfQp1J0xmA_1792577472
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e1ad3cb66so280096f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 03:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792577471; x=1793182271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vVLJOhfTidMKw4MIf43k3Z+xniDsBdpWe5ByNjjrE/o=;
        b=p2NMMm65jqUj/I4P1B9BWGIMi03CnY7qLB07ZBtujZih+ki0UsAbslcVS2RDxNYh/Y
         o2MMminxeoAs0V/jx+OZTBzf5RO5ereCCprRDR9pxx0wCTK/Zz7oPSzfiE2J0EIvRujU
         EzSPPpgnyZVIGxuwDqaIzeo4/hfhsxkaAQlpY4dwJbyLi7J9KSLygKezm5TbHBggRyXN
         3lJ6ksGEVRgwPNI0sQblkaXKLUSeJ6clUYyNgsMUz9s4A4u9MHlKa8AHjjU54WO+6yID
         rxfnlBdy26X2A/hQnxRPrHn8oMD6vkQ0eJvUy+avYZqyFNoWTcqPhPN0k7R+bTNR/5ZG
         NLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577471; x=1793182271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVLJOhfTidMKw4MIf43k3Z+xniDsBdpWe5ByNjjrE/o=;
        b=2nQ5JN6WNXG/RFR2KQ/vQUS7a3SfRyd+paH3+3etP2ppn6pZgK3lUL/biJIJ6GfbwB
         SOgeATUUzbKXOFGIlT6SX4PE4F55ghg+GiFIEFLbXzSdFTVkmdezCsVdm2nswebkNUS8
         9N4mla1E6YtXEPRsaXRaavGjnfeODCaaMUei0NORTr/Qrj/+wGLRfl+uXoB1FLx7gUut
         LL5nrpNYZxha5unvpEOnhdD804rpvcPUGo7IDBN09z4MEdtTwlfgdE0jA9QOYTFKxxpD
         BU1EzSwlebTkPlyidljhw+HnvkB7wCGvcSnx8bknDTXXzJb3/mK/0JX0qDjhUrAvBcsp
         yv/g==
X-Forwarded-Encrypted: i=1; AKwUvBwDev5pDOspUk8QjEU+ckNWFRLZ2xm/I/SBwO0rJ3NJfxIi9WVg9kvjuSm0yDATLeLficWRcsZlYBlxmy9dfZQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9XrvsMzBJp22Cwt/8JguCKhifoBMpWGKR5wnB9c44djhxmupy
	Ck+xIfy/Z5sjZlYQyLVSUJ0bykPNpf2t5Jc1zOFQGZj8PhlBtWE4ksbC2aNRvZ4XutRogc1iPdX
	yw7GjsaSPwynU3E4HamvWHAz2luM82DqLS+ZupSxrcm1B8NnC4UW0EoHorDtIcmGKZJc9Ig==
X-Gm-Gg: AYBFou1awE8BSCPoiyUPs+0EAVYKqaLacGBKgsG3AVeBXwCDwlIiZuNFYy+U4cMfV8r
	L5zVPcrYHFgh9Y/UzuL5Uvxngy7sTwaC1NTaqyH0w5swoeEL2kqPxGHoqhdloMHLoWPoYPd4dhi
	Dj2VpgAVfbMycsj0C8GpAwFdzTxP2BLDe/xQvfshVYESiVlcTVjhscbG1mILp4BCun32QxQ1iSm
	t4mcuERhhJc1YOmRMG7eQtRoPvPFvGgq1drA1AhwM9E256lM/B3A5EITUcEjDanGrwG0ffOaNBI
	LVqIpnMXFSmx6qgCY7zUmbmikOIcVi+8SgJLMfIf/Ud+b+7pIquSlOs1a/n40BUj5UL00EhtOqj
	YxKa55Q==
X-Received: by 2002:a05:600c:34ce:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4a1fd8a7d77mr31195245e9.2.1792577470784;
        Wed, 21 Oct 2026 03:11:10 -0700 (PDT)
X-Received: by 2002:a05:600c:34ce:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4a1fd8a7d77mr31194065e9.2.1792577469551;
        Wed, 21 Oct 2026 03:11:09 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.178.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d699dasm152330945e9.12.2026.10.21.03.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:11:08 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:11:00 +0200
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
Subject: Re: [PATCH net-next v4 2/7] vsock: rename the vsock pernet operations
Message-ID: <atiPgleCntfwV4-N@sgarzare-redhat>
References: <20261020-vsock-guest-ns-v4-0-047527cfccfc@meta.com>
 <20261020-vsock-guest-ns-v4-2-047527cfccfc@meta.com>
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
In-Reply-To: <20261020-vsock-guest-ns-v4-2-047527cfccfc@meta.com>

On Tue, Oct 20, 2026 at 06:15:05PM -0700, Bobby Eshleman wrote:
>vsock_sysctl_ops and its two callbacks are named for the sysctl tables
>they register, but the init callback already does more than that: it
>also initialises the per-namespace vsock state through vsock_net_init().
>
>Rename them to vsock_pernet_ops, vsock_pernet_init and
>vsock_pernet_exit, so that later per-namespace work can be placed here
>too.
>
>No functional change.
>
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
> net/vmw_vsock/af_vsock.c | 14 +++++++-------
> 1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

