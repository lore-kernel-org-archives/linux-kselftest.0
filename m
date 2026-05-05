Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FBF48A2B5
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 15:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777996656; cv=pass; b=Nh4u8OdEr5po2Vg99jljGnYER/eqkQQPHk8FLV1FJsAwBeu2KJ2eLOFVnZrd0BEiIlbtsvggkEFejMncGDdCYRVxxXUM0MXjHAnPTBrNdCixQcrpthLpShWZ2MftAKIxKzEdPzs5B47ZFTfz06TPPGjrnRsXUNs+Kxv/jysq93U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777996656; c=relaxed/simple;
	bh=LDNzA0ktaQOd9EO9z8tWH2U9AqQnquf4cSGKsb1TqKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msGpOHdHhH1o7RE9a+Cb4Ez0z5hPD9AD0OMs6/lcf6PKCy/dnPQVmSOFOtmtasKNn6VWQgZPIJTn4ssL2tmWGUDNQ5708BKONekJ+cjkyg9Y7LnA8gLTYJo7jufQCQccR3I7DIsKjHzcexjqW/QnE99AV/dta7XVP90FZtf38ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SRLB5fuK; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SRLB5fuK"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1305908ae11so2597408c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 05 May 2026 08:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777996654; cv=none;
        d=google.com; s=arc-20240605;
        b=broDvClb5szpwkaaxpB3kwHaONuSy5H7PJKabRMZhd3J80IguMcTpTLX7DFBH75hJW
         znbayJkuzHlqFbJucFjsUWzCUX6gCMe0UgVGUFFMlm7dqlnKhUKII4r+Mkq5GAnyHMy/
         /9OhrnIUnKooadKFX2l7gQ3Ga5QpBCs+4PbDUJgszvCu3x7n711VKXV5WAB3RGnTfLeI
         M/1Pswm+1cFW8h8+B9rpNWuLtjzSCbZz2jXJFByU5xhlXm+CZ1gvFrRpQ7mvifnFzzIo
         t969E0Y4AMByax+I9lv5WQiGsNWfhEOzB3SQr7xd0PP9XwKN9EZkebqH9QYY9XA11JAH
         dABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LDNzA0ktaQOd9EO9z8tWH2U9AqQnquf4cSGKsb1TqKY=;
        fh=q2cwGLTrmLdoPtp9HTS61RK3Aaj6rVEO7W1wGqfSBQI=;
        b=d6IEJMnlNhop9kIUD/JRJvW9YPUq8OjHkQ4xKA+kq0RNHeyMmhbYxbyQhl07kCmQBy
         o3O7e6PxtPIcufe5MJIaZoyCDfXhTTBI97Ouf2CQpjiCjZtpfGqriQuVJ1ukRqcYhMPS
         vWUCL+Q4OV0YHAZ/Dx5oUlpcxy/iX2U8p+2laiNtxnx2lHnndnViodNqutd5PpAWzRSK
         Upd/x9mX20KJKMIdiN4CB+jp1QMzwvFfbTaYVsfDvpaYpNWW8KsmPAvLe76iFh9rFW/r
         RA5b8KVkg5KuHPx7pDIJ6JZ544H4opv8Q8ssa/inUV2lBnSFHRJAbjVmC9etibVIObfB
         ufvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777996654; x=1778601454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDNzA0ktaQOd9EO9z8tWH2U9AqQnquf4cSGKsb1TqKY=;
        b=SRLB5fuK+rlRbRhR19pBwry7cLZbvtRVEXUjGHjYwtc7Am201qdkI/9ScVbPpVQdvn
         o2+lMM+mNjjwpz3ySgVFsMjc05G/Bf52ulrCsBdX7D1k+oOdBGuX+Blizi0Db0U0DQZl
         gTtzzuxGExcSNZrIP+LJ2Fy65AuAcfV4gP3yHMpJbf3+WcmoeJqfp/YykIkfmeW/Wmog
         axaqM/d0gMoaPtVMeQtHkwwIP31E8UzAem7dL8aR/VWks1SJMK1r5/UMEOZGfd7wFjgH
         sQRJNkzol8SOmXs5P68i43fKcXV8qkp6/l/nsK5WGFQAENusU/Bf/XPf15vZX5LuAXTU
         yTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777996654; x=1778601454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LDNzA0ktaQOd9EO9z8tWH2U9AqQnquf4cSGKsb1TqKY=;
        b=Va4/jOHHYRCfRMAfl96qoDy/OY9upJMWQF6AxLffibvDeKBwnJvukabjxdvXQrYTUt
         Egmes7+lh2ZIw+9+BKkXe2DRMUmY7B37MYRNTD8NLgaSiTEpQGl39jqcDvJXMu/RDX2I
         /VefGLGdwqr2Zo/IhLddQeZ2aldaNX0Eo2M+7PPsglUsd7kWTjw1xncbHfOIzzp2vZkw
         CD19ob11ytlap5MHNUxX3LJxEGc8VdN2N68jieFmbl82dhR7saSZgsnlpIy+UcEn0COr
         NgxzMjxfl5/qoSW05mRx4ZoqTMA7FKCIUcbsHnCG45+X8AubWPuF36MV1QzCmVuL2XcI
         xTBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wOMh8+DlRgpDFfuEJ8CgnXSP4wNFYAeUq/cr8TFoE/SuSyvZwP/TtDWoMac8DP2KvvIYpMKT2mUcVJeGBvT8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz28uAR77camuX5JqR8AUFg05pgAEG5BHuUCK9cQTLq/jTzBgYR
	mOlliT/cRlMbsaUGDBgd11vnzqLpwrHMFImH4d0DjBUtLVAL2KHtBNrErPchq9xnhpUICkNLjKx
	owFjcne6BsWaMd4k8Ozh3THSC5j73Ewj7WXGihfMw
X-Gm-Gg: AeBDiesSGVTmM80Ijsl4bxuEamIt1MFpdvTkoU0mFg5eGIzNNoYnP5GJlPOc98KuLBG
	4SPE/KBQIZ8nm/Gy60cu623eIKKuytrt9iULLW02uiFhu5ukVPesBjQ//v8JrPnU/nUBfdZs4lC
	iVHs59Hgcm1efMyt0ZHjR2+amVeQOTmZPygQzPQJINduhZWF6iuMBhCDC6XQGiKTLWYE30zQE12
	8trM0UQo5E7SsjbrHQLub+FhEMTOWKIAVQp4AyVAsyH9Nmdvt9PiFDL2xHEcH3Q2PX9nQMn3RH8
	+jt0CMTxDGed2AjzDCPlRIazetMNgA==
X-Received: by 2002:a05:7022:b8c:b0:128:d34a:320f with SMTP id
 a92af1059eb24-130b173badamr2261604c88.12.1777996653500; Tue, 05 May 2026
 08:57:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com> <CALzav=ci8bi3=sY+F3HJTB5sOQ_pJ8Lm+kz0CDBBWVXry5P98w@mail.gmail.com>
 <20260501164314.GA1381708@nvidia.com> <afkjkBq8B-4KjhS_@google.com> <afoR1izCEe9y0MZA@nvidia.com>
In-Reply-To: <afoR1izCEe9y0MZA@nvidia.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 5 May 2026 08:57:06 -0700
X-Gm-Features: AVHnY4JrW8dKYzLI7vKq9aNciL3ihCmWQQqvYeVf-qNxqF1RpyWt82ID73cuiLw
Message-ID: <CALzav=d7a-55mg01MEfaonsU-+4QxbRE3QXpZLskteF28tdaUg@mail.gmail.com>
Subject: Re: [PATCH 00/11] mlx5 support for VFIO self test
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>, netdev@vger.kernel.org, 
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, 
	patches@lists.linux.dev, Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 8:50=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wro=
te:
>
> On Mon, May 04, 2026 at 10:54:08PM +0000, David Matlack wrote:
> > > The PF support flow requires a bunch more complicated stuff.
> >
> > Do you think it's worth supporting PFs? If anyone with a CX NIC can
> > enable SR-IOV and run selftests on a VF then we can keep the driver
> > somewhat simpler.
>
> It turns out my test system cannot enable SR-IOV due to iommu_group
> problems so I rather prefer to have this :) I had to hack a kernel up
> to do the initial testing and it was very annoying.

Ok sounds good.
