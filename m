Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65E455C339
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 16:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995641; cv=none; b=BIYAhoxf0uXCoju2vnpe8bNy3kQUooJUK4cnjNG3FarBwdMBrcHtC09qG7OrJVIIXysSTJULyVfLqOF6yvMFOa4qrZ+J3jitCPaIDN3MyzXtXjeK/JGzsYfrnr9GvJZPxr/FkOr+pFWByTn/75zHq2RRVLa0OunbPOyba1FOHX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995641; c=relaxed/simple;
	bh=03prvWYuPM9S8kmgrWoC3fCmFozkGleIo9XhNkVgCtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fObCg0D8lArG65xoZHpdWNn5uUbM31W55Q8mj1U9v3kMDK7QmGr8Bt73rGGN/bkWb6eUSWG757HHUGa+6xf/7SGI8Xlzxke5a6LTx9HewLpKh7RzQSc6AUkqWfIRbOZYVVU9dDd5B7VV1H5h2Go1NMO1hbEuV+Xi2UsAuOu+/RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pd7irBGa; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pd7irBGa"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc7c6cc3513so289930a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 09:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791995639; x=1792600439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gzw9aMKz/xODwzz6jPerfVV+ZDaTeiwtt+GIjli64uI=;
        b=Pd7irBGaIfGk47A4W8byWcdXxiyBIqvKEbA9YhOh3SRQ6mJyIKIRRLuIPMYQAvnKMs
         TiiQbQe1X9LW8PMlgREmTed2G73VpjPu9b/hQC6M7174NlPobQQvYC7JbWww84NvkGVc
         jaPpkkunMPeYYbs7LRpYE1NB3orJeiitk5w+ztYeo5vRK1StrQIIlrqN8LPbbwn/q7pl
         LyTa9PdacwnhwmfVzvAYeCHjMCxA/kI1BexjubiZ4KYMJIByLay2i2hNOuiNpYiGNnZr
         oredyfHyKPao1I1MMDdfl/UgbblGTGEjrFSK49edHqKhn/nAtTq070F5HAFN7V6SOwU9
         2M8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995639; x=1792600439;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gzw9aMKz/xODwzz6jPerfVV+ZDaTeiwtt+GIjli64uI=;
        b=p3ds1zCBbX6lY4EZxda3DHpoGxRdF2wB8PJFOmorl69imjVnjcphbNLOkBPlwqVzhu
         /CrI0GhJvmupTnldklT9H+HArQuizRA1NgF9BMfTcNl5Apx3CEadTy6GzpkSfw45B6In
         v4hW0qpeHN3dXMeCV9H6fU1CWkHlu2QKJ3JAsk6FxnmlEO7XpO0Ft9qlIrno0wVPMcql
         sDR25DWw+R5ZuQlnh2ivHljXUi/e17t6uHwQULvSCPRzdz2T8P1odR81+LwqnzwkxDnG
         L59VUfnXVvISKURQJq3eFK16craCWtUOsg9Gwl1puDBh4ayYuo96jzdf1nkxHhm3DccZ
         V+vw==
X-Forwarded-Encrypted: i=1; AKwUvBzlAUIh4kuU7Vdk3WNHT9KekqEVQpXT2O6h+jjO3qqi1a3lYbaocIwfSzvY9CwT/dWcHWbSM2IXfNXkbhvckqo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoIwkPL3h/pQuYtRJON/S8N0EICXa9xFzuX00migfQU/kuwY6/
	wQMwpQ15N7L3SxsjJMVSNbLJ3NZ+jUtDH/GWd0jxpBwTmr54aMDt/TEu
X-Gm-Gg: AYBFou2ep7FEASuNJCMF0fYuhcLqvog1E2duZ9i5mj5PYYGgWoAL6aFcMVxd6YotfGG
	bZTVtJgyJcsfsvMaATSrkXiXtaC8fRgSNHG0rRaMrd6RgS8gld4neXKIZLAdsPxSevmx5qVP3YZ
	8A8OitwY/DTzWsgIYxvzDmGkD9gwr9nD7Dhq5XEMkvqdNScaJQgzPL+umr4DThlKPjCJJmWo0Kr
	rg2prxBDOCS3JbkwYcZOLoGg0cFMEFp/Jpo+hU15p6QVL3mISDkwMXPPquUIN9ZLJVl3ob5wPdY
	w18m3j3qwRknIgjldZgJGmMQpc1mopeXNLgDoshPHYPb1yify0lipacD7sFdq41xBDncTyQpD98
	gFXt94s6wuBvhXfnf9toZ387OA4ZCdlUUvyZkP5m/GiuhABFxHGKwdPM+HirKLBm+z2GNTYJnQC
	e6J0mkhfHrUy8jhvriVH2BMTlFjZxm+PoHiSuAQVSDOY7HcKgXulmzM0JCAPSA1cS1
X-Received: by 2002:a05:6a00:8c4:b0:891:a63c:df97 with SMTP id d2e1a72fcca58-897c6443681mr15560946b3a.15.1791995639007;
        Wed, 14 Oct 2026 09:33:59 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:59::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d80511d47sm1291926b3a.54.2026.10.14.09.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:33:58 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:33:38 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, David Wei <dw@davidwei.uk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Taehee Yoo <ap420073@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Tariq Toukan <tariqt@nvidia.com>, Kaifeng Wang <kaifengw@google.com>
Subject: Re: [PATCH net v2 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
Message-ID: <as-uBvRisS7HxLHJ@devvm7509.cco0.facebook.com>
References: <20261012174300.2338784-1-almasrymina@google.com>
 <20261012174300.2338784-2-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012174300.2338784-2-almasrymina@google.com>

On 10/12, Mina Almasry wrote:
> When a bound net_device is unregistered while userspace still holds a
> netlink or TCP socket reference on a devmem binding,
> mp_dmabuf_devmem_uninstall() clears binding->dev to NULL so
> netdev_nl_sock_priv_destroy() will not touch the unregistered
> net_device, but leaves the dma_buf attachment mapped until
> __net_devmem_dmabuf_binding_free() runs later on socket close.
> 
> Because dma_buf_attach() does not take a reference on dma_dev, device
> removal frees dma_dev while the attachment is still mapped. Closing the
> netlink socket afterwards triggers a slab use-after-free in
> dma_unmap_sg_attrs():
> 
>   BUG: KASAN: slab-use-after-free in dma_unmap_sg_attrs+0x76/0x2b0
>   Read of size 8 at addr ffff88810fae64b0 by task kworker/3:1/53
>   Workqueue: events __net_devmem_dmabuf_binding_free
>   Call Trace:
>    dma_unmap_sg_attrs+0x76/0x2b0
>    unmap_udmabuf+0x8e/0x100
>    dma_buf_unmap_attachment+0x145/0x330
>    dma_buf_unmap_attachment_unlocked+0x96/0x130
>    __net_devmem_dmabuf_binding_free+0x156/0x2e0
>   Freed by task 9:
>    kfree+0x1b8/0x550
>    nsim_bus_dev_release+0xe/0x60
>    device_release+0xcf/0x250
> 
> Add net_devmem_dmabuf_binding_unmap() serialized under binding->lock
> and null out binding->sgt and binding->attachment after unmapping so
> unmapping is idempotent across queue uninstall and deferred binding
> destruction. Call it synchronously when the last bound RX queue is
> uninstalled in mp_dmabuf_devmem_uninstall(), except when a leased
> queue is unleased: the physical device is still registered and, if
> restarting its queue failed, may still be using the binding.
> 
> The same use-after-free happens when the netlink socket is closed
> before the device is removed but RX tokens or the pending release work
> keep the binding alive. Such bindings are no longer installed on any
> queue and were already erased from net_devmem_dmabuf_bindings. Keep
> bindings in net_devmem_dmabuf_bindings until they are freed, hide
> unbound ones from TX lookups with an xarray mark, and on
> NETDEV_UNREGISTER clear binding->dev of unbound RX bindings for the
> device and unmap them, unless the device is a virtual device leasing

[..]

> queues, for the same reason as above. net_devmem_lock serializes that
> walk with the final free.

Can you explain net_devmem_lock a bit more? In
net_devmem_dev_unregister, why can you not net_devmem_lookup_dmabuf and
then rely on the binding->lock? The rest looks good, but the
new lock seems a bit excessive?
