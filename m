Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A0B39DBDE
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774370024; cv=pass; b=srt9DhX+Mjl+u50eljdCBq09GqfsqgCIKfvqPtmYEGku9F5bU+mPCwJaS68GO+pJIW0jv5Yknchpw6zcpzCMe5YotAaEkvGBEqvMorkt3O3LB4AII0wNeM4T5r53ogHIZyElWqlHIPIvnlYp9NfX9IzqbpcG+Lv5o/DDErQhSSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774370024; c=relaxed/simple;
	bh=KyZccWfRZPRCXyH3JPYtLHqoTnA1c/Yv1X7rEaPg17A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scG0rkuU5+7Ug5NTM4GVxeubutWP2pljURM9I2UjFwozXV4Rp3RHamQuGow6l2fY0r1fClpfNODJcEbUU9wx8Un+zik5+8g3vkFH7lRFgtYUGwujAFafOuEIUZKhWEJOJh8N1bW7ufq1umifRIlu2RZVcc5QlmLaKhbql0cGhwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HW6Q9NWL; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HW6Q9NWL"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so4759652e87.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 09:33:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774370021; cv=none;
        d=google.com; s=arc-20240605;
        b=E6dhoMtCLUMwgYDaE3+7KItqq8k4IOAH21g9I4eqnjcA8BgNai58dcgnNNwbd/rsWG
         Ij6P0LlvuwH87JBACiVYi15FiIg0QOnb65NPeHHbOpsa+dH/41BAPbElw4lW+YYOeVlQ
         ie8edbkLLPaQto1OypI7DjDRBucxFOy9UMdbdLL5CPzwQ3PwtGsgcPbfaav8iOv3od3+
         ZB5ffn3CUtecAo0VHPuH3WNUPtGX6SwW2wPHGSQwtiTjXf5urQAmafcA04vdLOiO7zFu
         KR6Jy0BNJkOO9EEQLBJATj06aQH3np++ct3vG0XSq4wCLTUvzCOtcBYVNG3tL3OLCvfd
         WkrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f++PU3wwkpbB0N6cii11zfED2xylkHlgqhKc/U2ncVo=;
        fh=/J6F2h0JVedun5pk6KkjrO8I7g0twBOnoH4MwhOrbIg=;
        b=DiKRcAI5ziHR+supGWQDKWTItkpYep6xt9DpdNLqg3bzXy+rBhuT3FmxgxdLfCD3Rf
         7rl5NbwmgjRTaDWF9lzSddOCmbqwu1/OLQdVLciqMo5cUtXTvTciKjO5UgDDQcZGp2MQ
         SDBRlYBWPYzC0N77hcRu0ZOJTUtULIqFatDVk4lHNxC+iAWatcokyAO8se59+SPFHh+u
         pwUBknnTKsGGJHe2RT9Ldq/0podXXc7+X36vhGOFuNMAEX9btyOCadTNF8Uf9mz1BqJm
         xm9osd5iapDZjJT0ZjE5MJ73lJskKJYJ9REl6pEZC8vDwVS8nSjR28mBcRSJlqVxPEJ3
         LkyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774370021; x=1774974821; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f++PU3wwkpbB0N6cii11zfED2xylkHlgqhKc/U2ncVo=;
        b=HW6Q9NWLycxYs8C8OOQKDxwRZAuJuQI9wdKwP6+z6AcgPywU01ml6PpY55p34Zdi1z
         xwwbe9uS568Mz3uM+ZUTpdl4x8sIZV3+5Xq0wiiZtI5mlflMpQLOP4d7CtoB6BPuukiU
         fZxn4j+WFmsZRFNUGas7J47gd9YQNXgYlZ97JH6kk3lVfdGiEiH4CygTGrkkB/ngLfRH
         q7muSWLsaGO2EqKJDYVHsVSl52GjCMhUbRNY2Xbd1qDKLL8/vESy4wESEkqSxtf5oL3w
         ibHgdDgJWGH8NY7mxCGKFzII/YX2lS3BAQFV/j9ZoJKuXTnRttyweZrCBuf7uekiLjUm
         FIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774370021; x=1774974821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f++PU3wwkpbB0N6cii11zfED2xylkHlgqhKc/U2ncVo=;
        b=rlLYbW0wWQoePtJROgqz5DYE0m8ZKIORdyRfO45Uv0G8FqFonj8tyWoNIUr634Bqwf
         /DFKaMoFYvnfs8GFDnokti3O6HBGjatU+s1gYqiwXBv27S3opNQSck1mX4KdqHPgEcbb
         gsN3vw4e89lnS3KMQEi5axugqplrTOoea8PYe2sqmeHlHi5diSS6+LKuTlXVuEHnaFX2
         7UJfwHK94vHOmHJXKx5rfrkdga3gGmbrpzeCxxWfHnFHd1xi/ZwulQx/fW0zL8LrQ8D0
         jzE76wY1vLYiuJeDX1JFUWHgl2aSd1fNu5hS+ZGjnVG9rAaoYedLT9+qiGUuvSXbsliG
         0gMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwA1zhfqIeGnM0hKg9rWKQ/3cbFLVlgeRVZCYrOUwkF+k6YCw4Stg2i/mEDF5JHeBgltY0zkzxeGtTzuDZjbg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3MvaEMVAxnH1rfc1BIXMwVwxlQdmk0+sxMMuQolxTx9dwtuvV
	u6bCMiP+0NiBwSQfTMwh/0gu8kipG0RfSZpiG/za7NiHjImXRlSd/YmfcwthA8jLhR5gS8x5olU
	WyRX2QCnm2nuM5fgZjzu7WTbQhMLtD68HOuxE7OqI
X-Gm-Gg: ATEYQzxA3+qqJ9fdwqUloi1aRq+hj8tA8Rhsvtv7C0UA8rqLgYuCqBx2U1zTRh3XWmJ
	m1c2n8YAv0iJqC1Iaffo4S0MxKJnUF6HjduJ1c3/4gQaFjW6PbgsJoWPioiWUXsZsFDKdxI5MWO
	bEVKGevlpZpJ4Mwr/CMoX6byUwpmshpnZtHW7AaReGk2RbhrzWEdAuQ58/8W0Nd6o9/qY7f2S4r
	ZKzJOmTMKVLPPrVJdotxXSQACGhgueihYMOhWqq5SAJVi3FcePzx957XspGLxFKuaNYAY1yTz4I
	6g/rI89Z
X-Received: by 2002:a05:6512:3044:b0:5a1:1899:a0cb with SMTP id
 2adb3069b0e04-5a29b9a1efbmr55664e87.34.1774370018671; Tue, 24 Mar 2026
 09:33:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323235817.1960573-1-dmatlack@google.com> <20260323235817.1960573-7-dmatlack@google.com>
 <0d2eedec-01c1-41c9-bc74-0133ae6ebb04@intel.com>
In-Reply-To: <0d2eedec-01c1-41c9-bc74-0133ae6ebb04@intel.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 24 Mar 2026 09:33:10 -0700
X-Gm-Features: AaiRm530aoKtDDdSXYb9CaNnVHDZa0HeKfsko4zWVykFU0w66CUzojlEOk9szPI
Message-ID: <CALzav=d65Z1Va14rmoRcx5WrK1GfRvuHmrqK16wJJeTiq28eCA@mail.gmail.com>
Subject: Re: [PATCH v3 06/24] vfio/pci: Register a file handler with Live
 Update Orchestrator
To: Yi Liu <yi.l.liu@intel.com>
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Arnd Bergmann <arnd@arndb.de>, Askar Safin <safinaskar@gmail.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Chris Li <chrisl@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Kees Cook <kees@kernel.org>, Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, 
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Li RongQing <lirongqing@baidu.com>, 
	Lukas Wunner <lukas@wunner.de>, Marco Elver <elver@google.com>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 6:00=E2=80=AFAM Yi Liu <yi.l.liu@intel.com> wrote:
> On 3/24/26 07:57, David Matlack wrote:

> > --- a/drivers/vfio/pci/vfio_pci.c
> > +++ b/drivers/vfio/pci/vfio_pci.c
> > @@ -170,6 +170,7 @@ static int vfio_pci_probe(struct pci_dev *pdev, con=
st struct pci_device_id *id)
> >       ret =3D vfio_pci_core_register_device(vdev);
> >       if (ret)
> >               goto out_put_vdev;
> > +
>
> a meaningless line here.

Will fix in v4, thanks.

> > --- /dev/null
> > +++ b/include/linux/kho/abi/vfio_pci.h
> > @@ -0,0 +1,28 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +/*
> > + * Copyright (c) 2025, Google LLC.
>
> would be nice to update 2025 to 2026 now. :)

Oops, missed this one, thanks. Will fix in v4.
