Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7947775801
	for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 02:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781316241; cv=none; b=fTY0UTTyRoWgUi7uffEndytKVkzvAJBO2X3Y4iZA/6KIY8GUAn1lNpNMZr2Eh0FXvSKH66DMPIh68TVxbs94pmkza0RfS3xlGCUMeODB/wWWDCtSp63yQFSGf9b1z7b6XSNihD0R0SQRdnuOSsY/bQZAZl+J29cYxE74brVCVv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781316241; c=relaxed/simple;
	bh=sVAcEu8jo7YtMp4kXrsHHazO4c8qMlzVPhgFWdu1rLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pisClA34yBTEehu4M5LcPlFyLU7p8g4IDAx01GAWbJpuNWAsskOOLyUiNN+ffXVOZLjw8R1zwv2XqjXEbizNpirxLsgIefCcBDMPj0EW1f6LBa0Cy9qkrLjBCvh1i6RUUv0mwKh9UMqQss5xJcqMPIkfwLTOXr6RTt54osjPGMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4VTosJ/; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4VTosJ/"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c8588ec1b44so1117343a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 19:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781316240; x=1781921040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mPoSyMAZC6nuaPbHwX1o/fpMkBKd3DvivicT6BAaRnA=;
        b=M4VTosJ/s1qL7Q149VAuavLpusACpQ3GbeVdB01rIfk4cbXsfd6+JUhfy7j5q1B4Ru
         6rI5m+oqoBKvJRvSm+pAIBfPBI5j1glIUa5f5s/97Y7n/dD1oG8u7LaN/WIH/QcXH2SI
         AP2kuLaVdzngyLQ0lDn7wHKqdwB2d2USWa+G7rU+1aJNiSiuctLLUQsgvoflWGV3AqYE
         QvZSyhVTlt3J/LZZuYxVS+1v0Kgn7ybXqb4F9+XrjSrg50w2xICpmdEcl7iUjKnn7dc+
         y3pvFdSvk25Lg9oUMTPew6v/ONmRaNLr/87XV44BegTBtthJkS5lvu02yqwIIeRFWgLg
         39xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781316240; x=1781921040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPoSyMAZC6nuaPbHwX1o/fpMkBKd3DvivicT6BAaRnA=;
        b=O/8ji2F6Lj4GrNkMK42e3mvYfTVx9/hPEhxeRiYJDXqPtMeRXw/73YxIrYrgV9vW6u
         XlROcU0Lgj2Y4Y6voaYl4Jn69GqCQpEW8Eb/1noubjgF55WkBn8EDMhDe3E5qyiuNZ8q
         m/ktmpVC8tGu+zmeXMEXC3CrccUOUheJw5IQgtqQSfZ4MVLPx4aAGsQoAwHlqRdWUqZ2
         i5Dr4h2cyRB20W5mjXNfWVb/TqzodxnR/DVXcNUhWZ/sRI2llnwGhzwI/TsI0QpGvAKr
         jrRm14U8wae+A42hBHTXwrvrfyjkJOiTS0PBqk5LIVi50aiL5igfObgduph+xqw7VTSD
         EEng==
X-Forwarded-Encrypted: i=1; AFNElJ8Aa3CU+J423qFFhpSGSw6MPEy/ZUxo9jk+YrQY8DqYymUW6zmjUPso/MZMYXHXZBoVjkuWRwUaJ38WdthUlek=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM4vhaJ2DL44h+AxMrZSjK3fG/RZ2bFt9W9Ry/ub3dqiWPWvxt
	dR53ezdKOCSJ0cJ+MrJQE+OQ4pDcd0yfPbkDDSp4dBH9waQtgk3ZMcHR
X-Gm-Gg: Acq92OE6YEFi/HYxJYBrawwnQHF4joSyypKcdgA4YS7EpwwcCQxatdu2WmLhK6kCfo2
	ieNOX47N055pwNs6/6LuiSMLK4Vfu1jCrplFqVohyc3Ap0KZ5yrMlSeBb06ESys9oObKJGs1eXV
	bZHwGiXkhgUMzniygMYrYK2E+BdUO1VLalWb2R2+mE0uGnmF0e072rQMaZq0Qi1uxPN5fyZJbUO
	uiJPJA9LsR59l8qPAoRrSzs/FOLRBps42haWWnSuldj/N1NrAMG/S6e/s1UoHQPpVaZ+zTMksX8
	4mUIDXRK95QmgNdw8NPIIeWYEEeG5P+9lFaQMa9nwrjF+AgFicl/rKq0B5C27+YL7fQ0R4322T2
	s6Tw9A9jzi2gQIcRFpZ3YSnpU99NBi0qKpo6NpRVxl9e1uqNe0UiQ6oQZbeDtxX5gcFW91ICjdf
	PleweOro2l4bdKqxWR
X-Received: by 2002:a05:6a00:1d9b:b0:842:6c02:2fa4 with SMTP id d2e1a72fcca58-8434cd42d57mr5864692b3a.14.1781316239902;
        Fri, 12 Jun 2026 19:03:59 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:45::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8a5bsm3623847b3a.33.2026.06.12.19.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 19:03:59 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:03:34 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, sdf@fomichev.me, 
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com, matttbe@kernel.org, 
	skhawaja@google.com, dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v3 3/4] selftests/net: ncdevmem: add -b option
 to set rx-buf-size on bind
Message-ID: <aiy6bh2IAHDtBX2L@devvm7509.cco0.facebook.com>
References: <20260612-tcpdm-large-niovs-v3-0-a3b693e76fcb@meta.com>
 <20260612-tcpdm-large-niovs-v3-3-a3b693e76fcb@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612-tcpdm-large-niovs-v3-3-a3b693e76fcb@meta.com>

On 06/12, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Add -b <bytes> to request a non-default niov size via
> NETDEV_A_DMABUF_RX_BUF_SIZE. When the value exceeds PAGE_SIZE,
> udmabuf_alloc() switches to an MFD_HUGETLB-backed memfd so each 2 MB
> hugepage produces one naturally-aligned sg entry.
> 
> Reject values > 2 MB up front: MFD_HUGETLB + udmabuf can only guarantee
> 2 MB per sg entry (one hugepage), so a larger rx_buf_size would fail the
> per-sg length/alignment check.
> 
> Add CONFIG_HUGETLBFS=y to drivers/net/hw/config so the new path is
> reachable in the CI kernels built for these tests.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
