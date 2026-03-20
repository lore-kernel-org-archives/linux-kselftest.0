Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CF53B19C0
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 17:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774028665; cv=pass; b=cESq9E36BwYq0PcDarPXAxXgWxMktow/ZN64R2jMjLPrMaPd3k4wkMAdTisIFU2BOzy7xMmMbRzAIa9lmGxH2o3RXbe62qMdz5gL9jH1AElvnKbHKHQ1pS8lnOF8fQPvXkb9uSkgrgrH+nWjk/AaORp4Gk0vahNRHKTAxUgGRBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774028665; c=relaxed/simple;
	bh=4aVwgVCNXTCuRGImU93RODTQQdSZ5JBkI1KVTbDzd2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXGM6rmsPU4b6mEx5soJ8rWRkdKLoc/fDMgKx6NabfbZ6CBmnFeIa8n5wNP3QwhnAcpBe+E7zMSaeZU9A9jJtW4Q3xm/tGGdNY321RfCH0EpgsLIzXSylvqN1Sd3YDGq6714cuEulTFE3K92b9p1ab8/yUa2WbHkxAzCnbJRgug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tZHIkbsy; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tZHIkbsy"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38a3066b68bso15866141fa.3
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 10:44:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774028663; cv=none;
        d=google.com; s=arc-20240605;
        b=XHselqZXGFvLbPwfNqKxnf6+HL9VX7Ohs2b/4TqS07yEIFnn5P9kyTqSjCtNSS5qOA
         rekqv7U6eEjA80Za5MPN2ESh+OLrztjodFjDTXu9mKQbs4pNMSCfoAIh/c9wqJWnw/r1
         b+ME1n2lThmBTmSWr+1KN9pdNF3BFA6hQm0KqNSQQZQmGJli6uGywXXSJzRlr6toE/Br
         MX3SAdV06zrP9DFP8jy9IY5t92e8HF055x9WYu9hqd1eGd0y0DSg6KWy8EBJ590+cpdw
         PLjrw5Negs7AtrKuFbRwy6O3IQkUwQx1K6GB5ZaZXu13xykFan1lsVvJLXtZjHpAJcTc
         Tqmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fEawU7hhiPlaWvDkkT1b3BQA0KPPuetCfnOfC5jcang=;
        fh=FkEZdKytn6kqhjpM3YMj6UBD0R4EBrPuDOMUO2RGy4s=;
        b=K2qBeT3tBO99z/ONG/IN7af3hx9+vpz1SSBv7aET0tKUB1S2AEuqQJu9OP69lvcgd8
         cnBHr42wmDA7l/XRhHJwa35CksI0NArJY1pZavdFBkhOFlY/mQGjismC1FHeLLBPOvG7
         T3CUUQvk4eKTqMQCIgf56hiCLMH90hkgvp3zZn2tFhMKS1vtUctJi0DLwD9/aiL2636I
         o5G3tmVn4PCesTDvdWBMJKkOZpjKIL+tVnrYvUrt7JCPX9DJJLFfF8J5oBkiW1smq1ZY
         96xMuLub0gOsS1h0nP1cxSHDYiI6ASZ6ZUBf5GXBZtFeN/2BN36n5+iM2AJyVadr4ZiX
         Pk9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774028663; x=1774633463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEawU7hhiPlaWvDkkT1b3BQA0KPPuetCfnOfC5jcang=;
        b=tZHIkbsyOEj4WYk0TRnB+mHDvoul3/eRjgOmSTHOdifeHVM6SLHekc5aX5rzf9NO/j
         p+8wnYZrhChwoOgvOHAl8mgENT0dMNR84bhJnBl+1wkDUPvgIrGkaDqL63IHqKqcveZA
         gW+a4ZKp4A7q7aDmn4kf+wJX3lNpzcX8fxEAe3mcHvb6LzuXbxKWoAix/bgAKapy6AWr
         qnvyiT3zteSu0d94xpGxD4Jcs+n5Eq/CZAlK/n59W292AOAjOxDoaTiocwducWImxaIy
         egr7JBl26UpVpz9oiLYGivf9cC+wXHujDoS/OAPLKmGRrl/tCcdLGhqFlX1oyEP4smz/
         Dq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774028663; x=1774633463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fEawU7hhiPlaWvDkkT1b3BQA0KPPuetCfnOfC5jcang=;
        b=KzhtYlDWI8xLye/PmLWX2nu62ZFBCCKvLwsGahDnxsHFfxCfmyvoSp+j8iBz/UcI81
         2S1PKXPUL3WKV1j65W6UohkoB/uhYQFHGZbnKNW+x6aSeJ7xwtqdUdag/TaapIxDLTTL
         3ZZ4jt2VECkEMhiOHdV7Ry9oMSfo3WucWsaXSOmki2emZY2++QdMC+I/7zw2IM63vs9p
         PJXMolg6n2KAyaIQIKfhda0deymSeo4YghACqWpFcV5aXuQMxT+QZd1i+I90Kv5oZXNA
         IRI0F8QMSsh0Rxewk0xOLWBxY9Lvhz/WbBX3oL34315+B7OK2d4DNcCbK0QDuvjxFBaD
         LmJA==
X-Forwarded-Encrypted: i=1; AJvYcCWT8Qhzy8CrH44pJkemmDbyHZXQoTPmmqAeSb0l69dsWYr/wnmHPiwGeVJQrMOpTeuqDGAZDC2Au6Lm4DdAK8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YySJEyHqlNQt78J2KUjlIIuH7NuGbxLKLyi3H1gkMgE1zB0zk/l
	qzG20R3CfS0RPrFeK70L4bT86heCJNcpmow5/jmg8q1i686UkMozstX950zh0sa32JkT+WYIGXf
	8A5koHNOGv4nh4Hxlxa2UqOQ1nNpxNgyCpQKWinGj
X-Gm-Gg: ATEYQzzDMtHeDu5zzoF1eCKO97IliJDyFkwUbhRdm7iP2WnS9QrxpO9VmbYDpjpOAOk
	5RPDY2I8EI5ycr4u4QFhRwedrdZrYMyM6z0zQ+g0JeuVOzn8zOATDdy8ZPs9xmHbhmT/R6xRgY2
	RP+iVDEmhNDxW8BIuQBPGfQYCC6kXg5wiSYp4R8RYDQb/mGD5rABkW3T0q31uqtWzfOrkZhsirr
	e9p9lQscMbqVKt8s6W7xSXBgfiVrG661dluJfHGgjmbLXdSDTuxh3C0AcgSWuZzVBbiccZ/EQsz
	42GprWHB
X-Received: by 2002:a05:6512:239d:b0:5a1:2fa5:b98f with SMTP id
 2adb3069b0e04-5a285b440d2mr1713791e87.26.1774028662081; Fri, 20 Mar 2026
 10:44:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320040322.487429-1-yi1.lai@intel.com>
In-Reply-To: <20260320040322.487429-1-yi1.lai@intel.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 20 Mar 2026 10:43:54 -0700
X-Gm-Features: AaiRm53F1tOQ6brRQbfGyAbZmEh9eqOkPoonj4Uhxb1nqTWcmiu1s8LPUZQ3KBQ
Message-ID: <CALzav=c5Sgv-x4LoCbJGdwuuQBr_4DQyZV=0vvnzG_16T3HtzA@mail.gmail.com>
Subject: Re: [PATCH 0/2] vfio: selftests: Fix MMIO test failures in iommufd
 compat mode
To: Yi Lai <yi1.lai@intel.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, 
	Baolu Lu <baolu.lu@linux.intel.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alex Mastro <amastro@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 9:03=E2=80=AFPM Yi Lai <yi1.lai@intel.com> wrote:
>
> This series fixes two issues in the vfio_dma_mapping_mmio_test selftest w=
hen
> running in iommufd compat mode.
>
> The first patch fixes a segmentation fault caused by an uninitialized lis=
t head
> when __iommu_map() fails (as expected for MMIO regions in iommufd).
>
> The second patch fixes a test assertion failure by aligning the check for=
 the
> __iommu_unmap() return value based on the iommufd mode (native vs. compat=
).

Alex Mastro also sent a fix for these issues here:

  https://lore.kernel.org/kvm/20260303-fix-mmio-test-v1-1-78b4a9e46a4e@fb.c=
om/

Can you take a look and see if it looks ok to you? I think I prefer
Alex's fix. We shouldn't even be calling __iommu_unmap() after
__iommu_map() fails.
