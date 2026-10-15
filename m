Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D0651AFF8
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 21:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100110; cv=none; b=a4LE8hyObyame7yuc5ULtZWP8Lk/L44wsOonL9XvSojo9k4fn9FqHh2qF7qqiKyh9YFhpTivuMxgf7PH22ZEHpSa7lH1DqbTbG4qYZHaHmyuQm+oQB0IprTmwxU/P9GIB9viD9FYn639hAqHMtTceVJlA8o0P6LIT3m1X8vMMZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100110; c=relaxed/simple;
	bh=VN5kEFS4f3DhbQuQuGez9j6k054EcTB9lQZnc4iClK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrKWTd+wEgExkmAEVLsBPgGi9Xg//see0tZipbYzH83HsaMQpyOYW9s0vpgB6eJQdCa4SE91Jafi+0KMuRxC8yjGo7FPqpVVgbwk4em8TJ1ODPCX08T65zuvjB38N86AygsGtYnLiD3BsO3MEGr2dy+meXOSsdAmwsp6xCrhvso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nwYPzmZ/; arc=none smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nwYPzmZ/"
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2e97ddaf3c4so690695ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 14:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792100099; x=1792704899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6tf5XWfDn7dzpD6pWKJEv/C/OLuu0jZ+hahvmMgLmFI=;
        b=nwYPzmZ/iylvCAdy1D+7hzJ7IKdboakxyxC98i11PbDE+XEH7CBDo2FXJK6fv2A+0I
         2zAfaPXxFhR2TMXHWKjQCs60EJYRiu6kKGMzQBycaPttJ0+OsGM17632Er0L4Wwq7iAZ
         vt7Gqv6G1ak2Hn4Rm2VOPl8Y6FcUELl/nnGsab/v4BWV8+3zcDfNicxGvidgvx9EKj09
         WkAMZf6Qny0KvCZ2d/QhzOqQDUwiywAgKfqLWqSeibL6jDRRhBeL++GCLdggH1iHriW9
         rMvCyE2+yFJak10hjtqGLszbnA3OyyiJ+vV/fKNNDFbLsV+8+WV692uGDYZ1xPef4qXe
         qfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792100099; x=1792704899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6tf5XWfDn7dzpD6pWKJEv/C/OLuu0jZ+hahvmMgLmFI=;
        b=yWMeRX7W4wP4sbdH/1F26fEEnWs30xA6lH9R6i9l6ficXSp6aa3T5j+QaE5XCZ7xRV
         6cs3oqTDV5meI85M/+7PpKKllKQAjTA8MlQk0VvY4Ui26x4l0Rq+6ANcslk00kl6PH3w
         M4n3q0I7ROa56Pnm3/jyyQ1cG3zU1L5We6UulxjdduHOjdFfvTuLVnjYkPnec1drq3Qa
         T5GoY8qZ9Wbk6Qdty9FtXpuDuIcXMmzy5a1ZLH4pFHopoz9MFAWanQn4CmfXAq/It3jw
         iaoQTUwSjCoLWp9/xhs6Ic35m84RPlesPmjO+iP0ddPcBqxC69aYejUJjMjP+DKE1Ltl
         z5DQ==
X-Forwarded-Encrypted: i=1; AKwUvBzif6ZAWBjLc6X9ilW0ZEcIwzNPcbtp/LTqXyuW4bwxE/glWPqyoAm2fwNFypUS/QiJmctqVI5Jr7OtSd4/qqc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCzu5cQ40nDxtb4vBXw55x4DcwTkQHGISyeoW76GcHDSYyFSIH
	ZESSmsp/obpyaKaKtmfc5VQGG+Cb+iQhiqYIxs9N3zh1fk3zS8yhNuNX
X-Gm-Gg: AYBFou0rsFbi83iAcvFr2ukaMznOGaz7dqx8FTlbJZJKwogvdEa7bWlr2pX8ILYAfad
	Pt5Ypkt/sryjJNwqYaoHMRwerjPmArb9wY9iiTPIP+eoi4lJMQNFcne96+33ITTaWJyvIPI1iIr
	SR1KvfzLBrzkCqx9B/NlGpew2m0a/cduEGZKET5vkxCx+U0N+0+V3bsoMTyrs5wlksJh7brNrcS
	1ErFlYOO3LKba5T6fEYw//7Gf6Sl9vHRVXQhpoTUiUnEQ24YJDmGb0vmWt/zWK7HZebDWzdbRGi
	9TkiXU+OiF6F9pr8UgsWsxnT7ti/RM6RUUek0BLbpt1evjeJIt00KqaV8RYP244gDhQaEM7jLkY
	Hy3sWKNZrJP5suPqxWmcxVx0xfni4GB8y5zkyu7FFkgume4J5rtEgc2oOswtFeuicrohEDNmoGm
	KEbUNP4a11WKCPfbQqDfc4qtPIymMq8ZFVob+bnxfdb04vsJA/ooiIJPuidHseYKVlEp1bUT1ll
	zQ=
X-Received: by 2002:a17:90b:134c:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3ab3a953bd3mr17162889a91.27.1792100097999;
        Thu, 15 Oct 2026 14:34:57 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:58::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc4991b8asm847025a91.16.2026.10.15.14.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:34:57 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:34:36 -0700
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
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
Message-ID: <atFG5qCMA4PugjFj@devvm7509.cco0.facebook.com>
References: <20261015163915.1166043-1-almasrymina@google.com>
 <20261015163915.1166043-4-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015163915.1166043-4-almasrymina@google.com>

On 10/15, Mina Almasry wrote:
> Set a 64-bit DMA mask on nsim_bus_dev, enable NETMEM_TX_DMA on the
> netdevsim net_device, and configure page_pool instances with
> PP_FLAG_ALLOW_UNREADABLE_NETMEM and queue_idx, plus PP_FLAG_DMA_MAP |
> PP_FLAG_DMA_SYNC_DEV when CONFIG_HAS_DMA is set, so devmem bind-rx and
> bind-tx netlink operations can be tested against netdevsim in software
> selftests.
> 
> The pp_hold debugfs file allocates pages from the queue 0 page pool, so
> refuse it when that pool is backed by a memory provider, and take the
> netdev instance lock there so a concurrent bind-rx cannot swap the pool
> in between. The software PSP path checksums the payload when the peer
> does not decapsulate, so drop unreadable skbs there.
> 
> Cc: Tariq Toukan <tariqt@nvidia.com>
> Cc: Kaifeng Wang <kaifengw@google.com>
> Assisted-by: LLM
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
