Received: from mail-pz2-f6.google.com (mail-pz2-f6.google.com [74.125.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90674EF14D
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 21:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100099; cv=none; b=LZCPTdE3T4lqUJq1JrfXVecIZo6iC87c3R0UZuFjplriTyPvWIfW7LtWKkg9t7fGn4RA7vEz4xvOZCgsj0mLx+pQG3fZZ7w9TCsdyZDX93Gm/IyNLcKmvq7MowBmAPulYmdmt2LNOtMnd/jvE2PSIpB2HJ6/rNO8CtExMJLkmOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100099; c=relaxed/simple;
	bh=Fw/5bVG+Kyih8LLkwOIMRNZ+2G0wXkoBUMuhbWqFVUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i747FKDGaOEyEia/xoxRTaPydYcx//McdZe0RZvSc2sg//+RQKUWzsHelUaQ/MgOQoXbWbk1wRW8ic1XjJUmmWhzARwXddyhOHsO8zpqHUnMhvjnCm4LPVX4KnRXIyMKwBCkl75K9elV3ZiJxghKY3lNeR2PkccAT0oZZsbXguw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rUznG3km; arc=none smtp.client-ip=74.125.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rUznG3km"
Received: by mail-pz2-f6.google.com with SMTP id 41be03b00d2f7-cc73514ac7dso2514313a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 14:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792100097; x=1792704897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KDrSDxpyrWFU5Ei8Mpj2JURPZsUs0EKdCv3HOvYAEoE=;
        b=rUznG3kmeeZXjBq+AiRB9o9I9AwWxlPug7UWd4ngLXvaX75V6SxMiyOkvbfsG1luT6
         O8VwLa0pkb3NfGvd4uE8AF4KflShhvmnJpSe6KhO/qRM7wBb4cSzW/sF5xzLStLTLgEO
         YSV2ilVhADpSv0DoC0NnZpn0SeR7UWZjN6orVCuTcq1vQxCqbUPuUn7KmwrYaknj39Us
         4AQkwqXRYTtjftqwhsENCMrINt3V95ZAOVM/D3iOrL7M3gKdZZC3bZ+FzV7IV9U3DsHf
         Lw/Zgd/f0Gf/MARgElFM03z9WLFigLhfPjAcDY3RVvihQcagnZD/o8qN0/L4tVBZ4TG4
         AY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792100097; x=1792704897;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDrSDxpyrWFU5Ei8Mpj2JURPZsUs0EKdCv3HOvYAEoE=;
        b=eFZZwocJ3C5QqnO0Ar2pi4rAHSXR5aj3re/uZ5gx02MtGEEM7aAAnCfm2ZFD5wvb+R
         gyIwBuIg2JBAipawDi6U3xI9GXOrJ0tWaY7xO+VYcnuGQPnh1Oip9Egv9Tuf4kM63ZqZ
         6I6XL/9SjRV0Xp6aVmYSimEEl3iat5dc+ODPzA3jv2OfcnLy1tUfP3r2mP1AQeWgsu2m
         c88hz9jbYpKWmL/fSxUTOrwTVjYKcuemw9UuYUM7dMpgmYbRJYkXZIOh/xvhUAIi/myS
         o//Tkq43iyNDYmT68D0iE0+rYquo3tv56cSX3TPuBaWKu9K3UoZ7BrhW0fpR2cqbL3YF
         pYUA==
X-Forwarded-Encrypted: i=1; AKwUvByQEzZsJKikhXQvvj296gfS0MRhfZxAKVSasojHZrwreXLnODMLESZlSpKSBU89FpLT7NfO2f9e5k0aznxinwU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiJjPREDwtlUlMNw+t02Ss6jUTHAV1dAaA2y1tt9hkp7H4uytC
	FVTlcd91TXCOJHVdOkOkihs1s+nLekWc7wG5pb41GaT8v2eRqXT4j07N
X-Gm-Gg: AYBFou1t1XykPYrThREjhZaEbBSOxJGei78GPO26KhfBTuWD7kH+pE/Vkb2ZT6SRft1
	u3kzwZEu0kSWnAo2BH+i0wPawjG0RuJsdnh+qeRyFOJNtlwBW/BlHN+tWuBYWrtQ4RwPr6yUH83
	ZbBZ8V7jTDcOHMBZkmewnryJaxmww4JNR3D/UW/ufMtX3rWt2YQTde6XXUFJC5WGcmMRs5+0SH4
	tcvP40+30SFbDUfDjqdGhhwajFVAn/55GpRnTG5F0lP07e9VrY0R05s9CzYO5TrrIDlF6y7gjtq
	EwkmOJ9ELU5kVY0SmO/oavC7S5BLH3ejbO1qw11cB+EuWpD34FXmV4Y6ip0ArQ3Ph9D6X440UvK
	Qcfs+WqbtwoAEN1lD3NTxUbnK9mCaUQ8luaze6GEghCrcxBdl4wKJTE7Hf+fP/TN+3DelSTd6DK
	aYnRS4tnd4otaZhy4MxTZkpwZZ8VC7/jwFc65bltB4ShjZdISrmHnRXu4WS9VJTLP5xwPxKQfZM
	GQ=
X-Received: by 2002:a05:6a00:4fd0:b0:891:1caa:3f72 with SMTP id d2e1a72fcca58-897c81b54bfmr17760273b3a.57.1792100097031;
        Thu, 15 Oct 2026 14:34:57 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:45::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f579479f8sm157301b3a.38.2026.10.15.14.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:34:56 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:34:27 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Stanislav Fomichev <sdf@fomichev.me>, 
	Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Subject: Re: [PATCH net v4 2/4] net: devmem: detach TX bindings on
 NETDEV_UNREGISTER
Message-ID: <atFG1wz_26sNn18O@devvm7509.cco0.facebook.com>
References: <20261015163915.1166043-1-almasrymina@google.com>
 <20261015163915.1166043-3-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015163915.1166043-3-almasrymina@google.com>

On 10/15, Mina Almasry wrote:
> TX devmem bindings (NETDEV_CMD_BIND_TX) have no bound RX queues, so
> mp_dmabuf_devmem_uninstall() never runs when binding->dev or
> binding->vdev unregisters. As a result, binding->dev and binding->vdev
> dangle pointing to freed struct net_device memory, and the dma_buf
> remains attached and mapped after device removal.
> 
> Closing the netlink socket after netdev unregistration dereferences the
> freed struct net_device in netdev_nl_sock_priv_destroy():
> 
>   BUG: unable to handle page fault for address: ffff88824ca9b000
>   Oops: Oops: 0000 [#1] SMP KASAN NOPTI
>   RIP: 0010:netdev_nl_sock_priv_destroy+0xbd/0x1e0
>   Call Trace:
>    genl_release+0xf5/0x190
>    netlink_release+0xd01/0x18d0
>    __sock_release+0xb0/0x270
>    sock_close+0x18/0x20
> 
> Extend net_devmem_dev_unregister() to TX bindings, including ones
> whose netlink socket is already closed but which TCP retransmits keep
> alive:
> - When binding->dev (the physical DMA-capable device) unregisters,
>   clear the binding's NET_DEVMEM_BINDING_LIVE mark and both
>   binding->dev and binding->vdev, and unmap the dma_buf under
>   binding->lock. No grace period is needed: the device is already
>   closed, so nothing hands the DMA addresses to the hardware anymore,
>   and concurrent senders only compare against binding->dev.
> - When only binding->vdev (virtual device) unregisters while
>   binding->dev lives, only clear binding->vdev so no new TX sends match
>   the virtual device while allowing in-flight TX packets on binding->dev
>   to finish DMA safely.
> 
> Fixes: bd61848900bf ("net: devmem: Implement TX path")
> Fixes: 1abe839b34ae ("net: devmem: support TX over NETMEM_TX_NO_DMA devices")
> Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
> Cc: Kaiyuan Zhang <kaiyuanz@google.com>
> Cc: Bobby Eshleman <bobbyeshleman@meta.com>
> Cc: Tariq Toukan <tariqt@nvidia.com>
> Cc: Kaifeng Wang <kaifengw@google.com>
> Assisted-by: LLM
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
> ---
> v4:
> - Detach and unmap TX bindings directly from the xarray walk, without a
>   grace period or a second pass (Stanislav).

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
