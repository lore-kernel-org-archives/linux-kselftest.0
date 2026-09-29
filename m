Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64D4475336
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 23:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790724847; cv=none; b=TfQeMRKqbvzz8yKEvKiG67Ge7zWZbMLx042OX5m8cokRaVEppBlRMTmberEfvII0GgZAEdnNGXhZ0YKOpUj/scJQTcfWTY/0qTRm9zrHvKx05dGZ/WlttYPXgvFPd3HyAohqnFNaGHUOLi7il247fyZ95YHbNib/ngBqikXik5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790724847; c=relaxed/simple;
	bh=pppU/o89qm1sLiO0OoAbWHZ4lhtSEjVPfFnL708X03k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lS+uPmCppdeKyuOLnr97sObVY+G/o83Bephkk9HsI/nyJFXvnohn9yRCtGfJdz2bqXjJXcPhSm1jN1+wPT2UkpLziCxXaxLXNFV3om0LKq7vkASZA7Q2WUZO4OphH36+xKJtzt03PXw/2rQnuUJWwFef4idSaYQor2aQWgbbRos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWPpsaZr; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWPpsaZr"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-38de693676dso2453574a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 16:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790724845; x=1791329645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=90vGdgLltOmZQprXn366F7yU1jtNwuxzXIhmT3hWVVU=;
        b=XWPpsaZrC3iyN4IQ5PfJ4Cc9ltb26LLu6wszgkNnPmvrXU6+Di0GFJ4L4i0cizDH4f
         JtWMPGHPRzRQ3h2EJzu2nY3DbdZWBWhwPfUcvkrBjIfHli0wB6tVMten9EjGsa+BjLBN
         tl/MZwyIqL6bgos3xZ2uNHQKRLZeVPBHy7QV/BWEeQP3CDa5Q7J87vHOcY+v6qONuj+l
         kTkqQ4DXuX8ZlM2dkwdoziTMQzSdkOCmp9qN/ynaMX+CBVt3quEGMsY2RtGAzA1h0wpO
         nqc07ksW8m7HxUlqhczw4pWy4aPay4dmksMhAZsUNAo/nLAa1+vxwbVqcFj/nQWy08rU
         LoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790724845; x=1791329645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90vGdgLltOmZQprXn366F7yU1jtNwuxzXIhmT3hWVVU=;
        b=LqXtrY8EwLO4yjTZhwhV+ev2OGt8IryVkP6iUm7sLI8nMMwHlZENy/NPv5Sw2ZrXl4
         xK0hE0y5+RCuX8bGisttGgy7hWonIcCeSg7PHUq6o3i29wber9t/Ji7uSFCeEHvkqE6M
         J+D9jcJRO8trBgn7CVaWiMPjjju6YsUZ+2UCv6M0nO5VnEZGFbbtn7yUlEip75Vye90d
         zlQPOh1bOrEzXeT8wjoLJCIK2Esg2aZNpr0hvnDxSWbeOca+yfMb+R82ZNUdfouMFvkA
         yIepkpa+fw3YbR4EMMH9fZ4Ysx1ly1+Dhn0HWy64co/aF/xojs4oDvLXztiC41M7crq2
         IhIQ==
X-Forwarded-Encrypted: i=1; AKwUvByn2IqIaBCPZPhJd7FcSSa1qMjIAwpb54obmekThc95+G02QEQwDxLbIiq1mMPBpsKgd6oS82G0UUci0IJSgH0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuXDTWF7jAvwRp+9INKLmsaRVSlydLk7XBsJKgcrsBiiEn+l7m
	Wr7aprIcCjZVLVhFHcm2g2m2Ja57dY1o3Q0y/neYIDWJLU5C4P+FxawT
X-Gm-Gg: AYBFou3/YeQ95XzzkXNWxweUNCaOVx6nfnC6edcUzt6qdbqcW6InhXSduUsxdAJfyt7
	spHNJwNOByh5ykFyK2hztpMXcNR2Q2QUCR8jPH9GshYT5ubJYElqrgq17LFi2eC7NBm/H6xRzeP
	OCW+9P7lYL6mSqLYVFNEYlQmYKaiYTLnreEL9doxqABfosUZL8Z5YvSIc5Z6aWRquTnYhM5WyNQ
	E2Uf2jFeTmZFdYW0yk9obH3KI64elmLJk01m+v5pZiuPyJvDfNnn6mDD4kIP0BGrMi9NLZPAo/4
	l3HTTmXC3zxRJk9kJZDvvywvSvLyHbt7rrFVK1BXEye/rJuO4P/J1Q+3kSfUJdxnx4J4k9YmkID
	BVR0qx7UiQ9rbUyh1i0LFB2mP7en1P786KRU1ZpHRVB6UrheHxwhWIGFxxq0G6ITBNLjyzkKmJW
	QWTqQtMFIchzRiR7KsnFLP0iaDXmv2Ycq+U25iSKSlDLzwp0uRb1L3HWPdSvXXalTt
X-Received: by 2002:a17:90a:ad7:b0:3a4:c673:7649 with SMTP id 98e67ed59e1d1-3a4c6737775mr195074a91.21.1790724845069;
        Tue, 29 Sep 2026 16:34:05 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4e::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cac131c7sm163775a91.11.2026.09.29.16.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 16:34:04 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:32:08 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, jv@jvosburgh.net, 
	hawk@kernel.org, sdf@fomichev.me, emil@etsalapatis.com, liuhangbin@gmail.com, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, willemdebruijn.kernel@gmail.com, 
	aleksander.lobakin@intel.com
Subject: Re: [PATCH net-next 1/5] net: record XDP programs propagated to
 lower devices
Message-ID: <arxKZIebRaEoMsN5@devvm7509.cco0.facebook.com>
References: <20260928223648.2739371-1-kuba@kernel.org>
 <20260928223648.2739371-2-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928223648.2739371-2-kuba@kernel.org>

On 09/28, Jakub Kicinski wrote:
> An upper device installs its XDP program on each lower with
> dev_xdp_propagate(), which calls ndo_bpf() directly and records nothing
> in the lower's xdp_state[]. netif_xdp_propagate() open-codes two of the
> checks dev_xdp_install() makes, but the lower still looks program-free
> to everything else, so the checks made in the opposite direction miss it
> entirely:
> 
>   ethtool -G $slave tcp-data-split on
> 
> is refused by dev_xdp_sb_prog_count() for a device running a
> single-buffer XDP program, but not for a bond slave running the bond's,
> even though netif_xdp_propagate() would have refused to install that
> same program had header-data split been on already. Binding a memory
> provider has the same asymmetry. The lower does not report the program
> over rtnetlink either, so it is invisible to userspace as well.
> 
> Install it into xdp_state[] like any other program and mark it with
> xdp_from_upper, rather than tracking it separately. Every existing user
> of dev_xdp_prog_count() and dev_xdp_sb_prog_count() then gets the right
> answer with no changes. The flag is only needed where the owner matters:
> bonding reads it to tell a slave's own program apart from the one it
> pushed down, both to refuse enslaving such a device and to let the
> bond-wide program be replaced, and dev_xdp_attach() reads it to keep the
> program from being replaced or removed behind the upper's back.
> 
> The lower now holds its own reference, as it does for a program of its
> own; the upper's per-lower reference for the driver is unchanged.
> 
> While here, refuse to propagate onto a device which has a program of its
> own, matching dev_xdp_install(). Bonding checks this before enslaving
> and before installing, netvsc does not and would silently replace the
> VF's program.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
