Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FE7331ECC
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 18:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782327568; cv=none; b=pYbbJHKfMMb3Vj+K6+TSZ5AL6RxPElBtqwWP1CBwPajke4/6IW8/nxtfLHNap7rF0AAJmqrMorjAnZeRDZzsRlzJWWeuFrRWD+7TPTTew/ED2NVRTeA4Ilp2dzVA1kR1IHD3Oim+zVZ6MKdX0U1vcK0CDYmFdcDzefMWPBRTwVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782327568; c=relaxed/simple;
	bh=zIstxXEsUAI+ajGpmVV2P35LQJBkQnh0RLzi3QQJ3UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFECioxzsZT8H0RPl6AznBZ62z/Wgafyo3CB7B3MW0w0aILJiXB+KN6lThZb6yOUEAoYPqxKISa6vMwRtjDPoHlmEiIOyyVPqjNXwIR2Z/MY3PJNygrJtgB3toCYEYGrZsXDPcfm1wj38/wvTBA9B1FvYaef3P5a+NiVSqUrIk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=eOSy0+Lz; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="eOSy0+Lz"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8db9f25c5acso20690196d6.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 11:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782327566; x=1782932366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pT11NgXcnMUuSA5mrycomy1NHWdVYPAjx4vn9wcSoDQ=;
        b=eOSy0+LzOURCxbTfWw68J/wjUy6HSx5RaFP5zduOe4TGryqd9mFKt3XyX7GcRdiHFF
         /dV0WRXjkxnowKwxk4uitRFVkKPr+HPk59w1jfoTeOo2oyq7EKPiq5ZAPFHgomS6TTfe
         5P9s+e1FAfdxqxfkrqpt6sEWTWEWjDLSTBruMuNKXRICyEcCbf5pvlOvv9qpi1L+d6Xs
         DAFoFBSAW4gGgM5p7MOLvTu9tTONXMHq0ORv3kSp8PAeTOP5TExs+OVV1XKmNqp8gr5e
         8hcxGnHI+8j6h13FvTs62Va3dnnP6SrDCD7t7iudeQdZ18shfocTi1eaH4c46POmhgSC
         z2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782327566; x=1782932366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pT11NgXcnMUuSA5mrycomy1NHWdVYPAjx4vn9wcSoDQ=;
        b=sMkL3tgN84otenGhqEmG3qojyJ1VI0m9MXBllj67PWRg7oNPqh94ZZlHWuu4G6WA+i
         +9o+ep5VMIWhAzfOQj86BddQr+qRISvgIcVFqRjrdPHR+N5xeXHI07HDXkVXowAzaCKm
         P7lKN1JV/8w78StjZhvoUnFPrEKEIWYP6c68Xqs2nMbZM7v56cbaINC5B6/R5bLMdD4q
         lDUyeI2CbrA2riowPaZKV0wc1bED07/+VtwKPl9TTkM48qBtU6SxL3PqqWgSU27/i6go
         zTfYGh1iUEyKiV/kc9ESfsN9oh2NsN3BR9NOUe6TE/X8HVP3jXHR3FKZYlKvDwUwpQLW
         vAcw==
X-Forwarded-Encrypted: i=1; AFNElJ8Fjbi9DF5/E8cORrHcPvboyAzqz+FrXmaf+1dCQfFNT5ef1GOqRu1itR5G57KTcICysCV9vEgxoTaENdVjDZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhRND3CSkLORRHjz+IzRTonptRCTGRY6xoqFbZaeYkZ7TEjJ+i
	8xaZ66nEvno43wD9eBp6jukWR+XT7Ec462wqAX6NDQt5ePaQU7Nqy8ypoLzN4uZK20I=
X-Gm-Gg: AfdE7ckaHIaO8KLeB/rdxA8H4ezkU+BqQGjmIyIjaDk0T+/j70Wbv0M1W40zkaGALuz
	c3rna+Ta4PhLlNKaYuUoBoshZsERYvatUxeGNzRMkfSqnR7XuQgMq8rc64DriEavOeoqlzYEW9Y
	PSK2YCuFw6Lxm0tNKeihcRIjF749gAh3sctOXOR05muATKK69GQ0jgdQoiFJorHyXwTyFn8WOMj
	btaGwES1mihUo1tzc+skC/GBBxuDhrzzzSbSw48DJVtK8qtKdDqW3EjHSLBk5M8AncwcbrIdjkQ
	O6hSWPAaclpgKYkdadpWV/krLwcTdaR3/FjaLa/cSWMAH57wS0W4FAZInn2gk/arjn9f5Nwruq7
	zDLVzTbSx1pvD6jie7MwZw8sknDECB8Hka4M1tWTgtFWuwOoWd6+jyhGjW+m1jXSLqSD2z/YxqF
	LWxRFUxyreH+oCxQfEyy9lGkN8qQH4u7I8XV4orHZXqTpMmzphzwjs44Bd4Ra1gpwD0Ijq
X-Received: by 2002:ac8:5ac3:0:b0:519:5836:2f04 with SMTP id d75a77b69052e-51a61af8223mr67843231cf.8.1782327565960;
        Wed, 24 Jun 2026 11:59:25 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018898sm161022456d6.7.2026.06.24.11.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 11:59:25 -0700 (PDT)
Date: Wed, 24 Jun 2026 14:59:20 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org, nvdimm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	djbw@kernel.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
	akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, alison.schofield@intel.com,
	Smita.KoralahalliChannabasappa@amd.com, ira.weiny@intel.com,
	apopple@nvidia.com
Subject: Re: [PATCH v5 0/9] dax/kmem: atomic whole-device hotplug via sysfs
Message-ID: <ajwpCOSGapenRPsu@gourry-fedora-PF4VCD3F>
References: <20260624145744.3532049-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624145744.3532049-1-gourry@gourry.net>

On Wed, Jun 24, 2026 at 10:57:35AM -0400, Gregory Price wrote:
>... snip ...

Disregard, there are a few unaddressed Sashiko comments, I'm just going
to respin this.  Will wait until after the merge window closes for v6.

The rough shape of things should still hold w/ prior feedback.

~Gregory
