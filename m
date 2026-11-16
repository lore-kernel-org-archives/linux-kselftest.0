Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794852205;
	b=KN6MfL4GUzxEWJKGI4h7uvoXyJAHjuStL6bfeB9Z79EswxBuR+UE8m+ERprKcxuEDyKv
	 vxgr1mPf5un6lcE2qQHlgrM3cyfEQG+lVYBOXOX7d+7+gXnzTQGOOm0HQkLBCswbLOW4j
	 noor4JZJNSmmEQ06bDh06n8tA5r1yPucXEegNXV5Q8EYTcsMjBWiumHRH7Y0eanCOIYTk
	 MwKCkyoLhtUJeJofmJhDrwdOvJq0k5YgW3ZKlSa55OWRaiBc9G5A9bk5gPRbUXc1ZgsFE
	 FQa7Wp3LoazuHH3oh3kKz/G6aXjK9lXqV/ze8gS5VGH3ywtXTjK4kv92UL4wxza+ZVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UsEi7nj+gIWpohML70hey3/GRg+ovwcWW0/uBKwbaX0=;
	b=pPgxG0Q29CLzg7HwI5flYKTv0Ko/l8wdGhWDEri2c0JRcyQpe9JiBJgAOcXsNM3f5fPe
	 ZeYtJecCrTck2KQtrUkvA1k3EDTqdH2yfdKaM2fUcq7G7COlcNf90IxMMr9E2ipoExv4x
	 Ojz2lhtb3TufNjqnwoMCIZUFd+w3x1H01+ObXqLd7uErWfUsUQFRe3EmmgNcKAm6LmrK3
	 apT1NWqatpifZnsftbLrfsyUxXx5K5ecOpKxrboyfehcDiyrb0JpC9uDs+oGfNkkX1a+h
	 StG0IR4Gc7XtqJ/kcrLpMXQCt5oYjSh3uK4nzgq6FYMf5zDII2OgHSB1Aea2A1iYn9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hD5jCwnG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2269A606A323
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 18:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2269A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hD5jCwnG
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50a4a2132cso490873666b.3
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 10:03:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852204; cv=none;
        d=google.com; s=arc-20260327;
        b=qnPtrhqXe7bH+V+VXYw8K7B3mj4SeAjmgLU/Oup/HxQy+6lbhnqISMmiDWS6LS48P7
         VKDW6ePPyovH46r7w5Hgvy5UG40e6BqyKrwRh8eIbasmARuZnUigheIpqfjrsZnslRu1
         6Klu7CZppHq3ppiaUUTRLTQG/X3p5pbo+3/OsWK9oo6q2xIQsKUhEayXHsh02qRP0SrC
         0MHnbAdza3Fc0rqlCv+j3zUpXMjNW4uRQ8aSzexiwtnqTRWVLAUGAOAx3ffsxdIthESy
         bsyYT+OwfjAk2Ooqv0/HXQyMXpjBo4ETF3EF0CVikTWRMKK+S+oMNx2YK7ex6v/uuIk6
         z25Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UsEi7nj+gIWpohML70hey3/GRg+ovwcWW0/uBKwbaX0=;
        fh=65CU+zLYtcn23Nsb5dpi+rUIShtheuJCVuOX57w3UTg=;
        b=Ev9dhdE7G5jyLTVcR7Np1VtSzGah3b7k/Z1Cq2lYlAbFs6uPWkvHED2nlSj7X6ej/7
         ij8i9Ewzp+482jCvBWyjhwKQLKn0w8fJsItFdmcv7QXyYXnC3ny4b6c3S6kdNi0RfJwz
         00czACB0jqeNzKR8gD3JU+56hB5WbjpDTIPbX7yQ3ycyShFSj/nVjG+MSjRwQRvJvqyA
         Jy16SS6puYsyOt6upospbBBHjzWDPhAWwNZwyuz5CpN0a19Jf8qRu7/386VqPDNq+Tz8
         JlukVz8JWWRqM6vouypSWTsLXKxMmyHCmC08QUwVHWy2ii/+AR7IP5n+ve5co2w06NrP
         9Edw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794852203; x=1795457003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UsEi7nj+gIWpohML70hey3/GRg+ovwcWW0/uBKwbaX0=;
        b=hD5jCwnGpTvZNYaAr2+aCoE6cb7zi0fesWLJtmKfjHp/JQ/kaIWWIrz6e09KboJAb1
         22Gj7G2b351eZKv4rCg7O3GyMG1MtGoWN6xg7EU2eQrnCKJD+f8uRHwt83vpvd9hqvPB
         j53rMQM4o3q7Rg1hd8Jp/uyfVa3Rs7TKp1FVmCxM7aw8dB5JXvPGM+7605iLxZWFOQVr
         Hzz/427CEAuvdW4FK5liL8c7JyBMf3Wp6j0Smxe/NQ/y2H4En7HwyLYAEmh4P9ItT+s3
         3VFwCqZ15r0ILkjB9apt8n5E5rVNDQGKIc+1yYF4pQP8Uw+CYIUALhII1lJTfuUwpnZm
         RlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852203; x=1795457003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UsEi7nj+gIWpohML70hey3/GRg+ovwcWW0/uBKwbaX0=;
        b=gt2XrdmmAKPgZW8yM2xoUiDzm1KjFxR20w4d+fyFjNGYUmf89fexkovNABjLT0ujYt
         Q1kSQfgCfussTxN387OvSc3sbPFVPsNam7v5Tijq9IHw9leegpZIWcblLUK45rJ9Sd04
         p0gglEMoB01xijFASu2Ec4RsRkBt9Ib0lXk2UG+HcJWCF+UPIlECFvrYfMvS9N+7D3V1
         XpQ9sfVfeYA6zrRbSgg1qGf4OS2oQG9virKpU+IRCsev/oCb9DvuYZmkzVs2KSgvWVVn
         tbIplrOhkXA/57fZOY1L9I3pIIuFOh9t22XBNnZoIqYCkpHGURGVGq4D7dqZZLTCZ2PU
         Pk9g==
X-Forwarded-Encrypted: i=1; AL+hErFJO+8g+v3WSuYwY4eZhuMRHI7mNysG3PapDFp0+4v+a23QeYw9Pn7+6rr9gyDmd6Ez3Nur0teje+6i85rIcaU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OLoRfOeOScHs2qOh2eZQP9Rlneg9VT/njqDwM9IF9gUm6Re6s
	qlxJWAdGyxmzF3eUMnUHj2mf51PRjl7Un5ilG/uMrbhtc2jprmP4EUCTYrTN2x392Spka+h6Z22
	vqRrLuRlss2N8gJYaZfzHVq9/lg+pUHJKfzsyKhkZ
X-Gm-Gg: AYBFou1s8li9gmBJZZIIK2baZohak7yJdt6ROT1flM8ckvP7fyacZep06kSNPpnTWKr
	Ap/BNur92sDKssQrsDP4OAjVes0cxRjIgyUmSR7i6Y2UeUDPTFR0KPKd6XmDay9B5XF5DrHbDDm
	FbvHOzJWw+kBQlTUAuIjpTLy9ouqZ9ZJJouRGZXdYXeVAdXr6lf5OYn1H7PVb+eryLJRKKg92c/
	S6vdkL72LcBgaO+cNHx8iQ7FBwnRuiJ2Wau+hTyKFih1xfq0912Olw4OqmENVcICBefe7+zWB5T
	3+bDhSf5E8QIe1G00kBQmJ/WP0tF20z7s3xnOyj7uiq2scYbzg3JbkQ9+f9jH5fm7J70rwo9UqT
	4ZzZ+qugwZ89/T+VASFnlqoWvOiJyL5cPf6sxotE08bgcnC+ZDcwKV/y7cHk=
X-Received: by 2002:a17:907:ea92:b0:c49:cdc8:10cf with SMTP id
 a640c23a62f3a-c50963df2ccmr868161066b.40.1794852203026; Mon, 16 Nov 2026
 10:03:23 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111192411.4133780-1-dmatlack@google.com> <avYjFfqr3T/U7lvn@devgpu015.cco6.facebook.com>
 <DMTK99TDM9AM.SAM3Z4COP9WS@google.com> <20261115231946.GB1239159@nvidia.com>
In-Reply-To: <20261115231946.GB1239159@nvidia.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 16 Nov 2026 10:02:56 -0800
X-Gm-Features: AclHuK98Rk-099iLtslJwrWtAxHkQR-ncmpykOH17KTcOCuNGBfykDUUL8uCEbE
Message-ID: <CALzav=efnA_ABCZVicX0QeTmHknaEbMeWOy8cS+zHYVhm5z+iw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] vfio: selftests: Add peer-to-peer DMA selftest
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Mastro <amastro@fb.com>, dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Matt Evans <mattev@meta.com>, 
	Matt Evans <matt@ozlabs.org>, Mina Almasry <almasrymina@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 3:19=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Nov 12, 2026 at 01:47:03PM -0800, David Matlack wrote:
> > On Thu Nov 12, 2026 at 12:35 PM PST, Alex Mastro wrote:
> > > Hey David,
> > >
> > > On Wed, Nov 11, 2026 at 07:24:04PM +0000, David Matlack wrote:
> > >
> > >>     Is requiring userspace to re-issue IOMMU_IOAS_MAP_FILE the expec=
ted
> > >>     uAPI behavior?
>
> Yes. Even if we wanted to the locking is doesn't allow trying to do it
> automatically.
>
> > The way I designed the P2P selftest support requires 2 things:
> >
> >  (A) initiator: A device that has a VFIO selftests driver.
> >  (B) target: A device that can provide a memory BAR (vfio_pci_find_mem_=
bar()).
> >
> > So far I haven't found a single device that can do both. But you are
> > right that theoretically a single device could satisfy both
> > requirements.
>
> mlx5 can do both

Looks like GPUs and NVMe can do both as well.

How would we implement vfio_pci_find_mem_bar() for mlx5? BTW for the
target device, by "a memory BAR" I meant "a region of a memory BAR
that behaves like normal RAM". Sorry that was not clear.
