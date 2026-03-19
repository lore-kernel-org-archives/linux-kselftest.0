Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B2A3D9DD5
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 20:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773951713; cv=pass; b=dgHFrE+SgEIOzTeDFMiUITwkPwgcewsjRMIHig+GsH+d+cbFwzuT91zGWS3D4Yq3kr68T4jwWREqfIq/T8CPrtkOJCPOIHsGEKWKdWZKK1SMzomoK7nglYqzCVr6q34rgYcBd5M2GrI5iZCHqGzn+0NeRG0rmL30qXcML1tpd8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773951713; c=relaxed/simple;
	bh=gJZ/ykI70v2d5+uiVZh0tHoPfumRLIsDtM1+w8MD0d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VM+J4FE3a+Q4zyFaTdvsPqMweBNPkw6bHuSudC5Z7z4gEyRd7Fs78cOKFuOJHDbYjugK9mX6MjqSeIv1wAg7BDFtnArCaXpVGLo1dUHyHB9zS0/LrdCsn2YilrtKXAVp/42pe9+1ddd3mqOgzE2ULSy9qoCgqJWlfCTAeXXBcvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DsPHk6VE; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DsPHk6VE"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38ad12fb595so19879611fa.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 13:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773951708; cv=none;
        d=google.com; s=arc-20240605;
        b=Dq5zJok081gHEdjmMe2CFhMYmYhnlOvvAR24zxVj06gNhWVnpiUjUM2imyybRqBFGa
         qO4ugn+8pMEer92wBKlQSwZ49J5o23r0/0HlauGR1n+Zqwl5Bgdp8m/JN/zwISHaIHXB
         iC1qFdfZ3cdzSGZ1+ahdcUKRG1NyEXAEJn5JnH2OrOaUBGdd9A9twtz9h67X7r4oKGuA
         wlKCZpMnv2C8jmWJiYAxaD/mGLO45t6NZjqnvas1rBxyjdMOkcdCXW//39/SMk53mCoa
         qLffO8/AjcHSToHrOQCk6gD3aLIPZN719Pu4XWKKPpCELmubcVEurw9dZPZ0jj7VofE2
         Nl0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ljrMEbLtSu+dBU/7p9GqjBQQtzMNMj2KKmPXYNYtywg=;
        fh=wlq2oxDdDwvhavXI1StN3BG0iDciz6ucCYAlUDyuYoY=;
        b=OTzdq13Xw8ykw3prv6vH7W5gNNgWNQKZ11fu1qoQNw3vWYn2rIMGv9lQEycc0JB7Js
         zb5TDPIJchTWyCKSTIJn86OiZclSwxc7X3gmycx2FLDFBIWEtklC2Ld/F3bTyNowh58R
         P373jT3p5gDpgB/GyTWxkzu3CGqhPHq+so2vpnVfbVHjHyAyDfzyAmn8fifSQDdSFfGs
         fUNUijU49m/HTWgnjfyWIXShzomFUSHQKnOxofj/iRf4iScyEc2eO99nPVnzRnBP9jrV
         UlL8coLaampaji2UE+K3QSr0pLjczxjuFR2n3czjvFyDYbhdM0CJtgkL/VWL0YGSmHcn
         6t2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773951708; x=1774556508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljrMEbLtSu+dBU/7p9GqjBQQtzMNMj2KKmPXYNYtywg=;
        b=DsPHk6VE/Nh3Kvkbu6PXbyoJ3vQMpw6dk/PlwrpnJVdVnDrjljLzPBu/kIpvyh9UpN
         GMncxmpmWfr8eKg5W1yjUOka6ks9xHbl+XPaLeseYFIiBSGtDa5+OsbYUZRw/Vm4TCzc
         Rd9L33kWREcuon/WRU98P9/AO/EYEFH5t+VWCxwy6tXZp6obDeP50Gu52wuEUUVePnLk
         OkAT1Rhe47B0Is/5z1pLnHbg2wCMBjRw+2Xbpxz5zu05naTko/jv+QY+OkiHKgHFF901
         stB/8fI9sPcJanJoXFeBLjUjtJ94cwtrxT5DyPbU06Qj8vg33HM4Aa7id60gVYjpEBRV
         VBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773951708; x=1774556508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ljrMEbLtSu+dBU/7p9GqjBQQtzMNMj2KKmPXYNYtywg=;
        b=QWnSbPfeOnY5+Av9ObsfYd319aZBY+bxW5gZn9DXpCkj/e7ZR+LF4kbLJ/oPbfQngu
         aUwqacNd6jzjs0X22bbyt6N6P0r9mye3Mt8kw5QL7ptW7AovOSySDxpvoJqE279Od+Y2
         m/B80FVONgGiB3NiHJVT0Drie0SfUZkn9w/lVT+l+60rXqcyOnBWn9x9v2DGfNRSDSt2
         suzBG+UoMjb4HwLiRwwvxR7JW6EtI63OKxQPgAcV4T8Q8tMaDFtw+0SDk/MYPCqt5wJS
         J+DqnKceyWG0obQ2fGqjCxdvZZn4RsVNS6eYAAZ2ThKb++NTOGX9qq1z0TygkW1HNyyi
         gn+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCAJubd61NTE5BoyNQvnh4pM00nLh2E8lJBCWU7g3u8Ki2AKn1dct9dhYG6LvyHsEo8vWa+F0qCj71E6F2UnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlzKa4BLDB9jx4p+FQaShUX4+0PoAucHAXfmbdPGgCRiipD2Kk
	7XPdVjLrADf8SZn+hQ7RrdM3s7EBJRP1sEktVqP0DNGz/0rUhslNS7zsJBHzOkw1EbQOB6xMc4T
	3OYHpc0/u/MYmZ9Ku7SMAWdW7iaAVZBcclwIRFUc8
X-Gm-Gg: ATEYQzxrVQcXE2u4Wuwoz5ZfL689SFIAJfpUn5vS7EHNLna5ZfC9AmDDpsFzeKtFDUw
	FDg17dxcMvpWxxfXoiwtYq19afEtqnScDEpzA4n3z265727u0SOfIsWT9xlg/+Yl2r8Q9vqgRBb
	qqpUubDdataOwPGLxP33t+mKj4KTcnZOQZ3kHaK4Ml+MXUPc8UoDja7bX0T5EDTyqmhnV3VAL4f
	yZ28twva32l4x0X7fFx5pLSf2Bve8fV1uuW332cB8MEg80eXHsVHasKnaQ4+OIjwCCOIRF+xYub
	uvYivbdcB/k4jpQO/9I=
X-Received: by 2002:a05:6512:39ce:b0:5a1:56e4:1c80 with SMTP id
 2adb3069b0e04-5a27dde29e6mr1741712e87.4.1773951708019; Thu, 19 Mar 2026
 13:21:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317214239.124857-1-rubind@nvidia.com> <20260317214239.124857-3-rubind@nvidia.com>
 <abxIxa910ddkAiLm@google.com> <20260319132908.662a32bb@shazbot.org>
In-Reply-To: <20260319132908.662a32bb@shazbot.org>
From: David Matlack <dmatlack@google.com>
Date: Thu, 19 Mar 2026 13:21:20 -0700
X-Gm-Features: AaiRm50XphyzZlWIKq0VnNILJa_taP6o7rQJ_djT2NWt4kKV2KYEChexfqC_QNw
Message-ID: <CALzav=fhKgqv76pPQum2qr_6TmiSx3jX54SaFx51nJx0h=7Chg@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] selftests/vfio: Add NVIDIA Falcon driver for DMA testing
To: Alex Williamson <alex@shazbot.org>
Cc: Rubin Du <rubind@nvidia.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 12:29=E2=80=AFPM Alex Williamson <alex@shazbot.org>=
 wrote:
>
> On Thu, 19 Mar 2026 19:04:37 +0000
> David Matlack <dmatlack@google.com> wrote:
>
> > On 2026-03-17 02:42 PM, Rubin Du wrote:
> > > Add a new VFIO PCI driver for NVIDIA GPUs that enables DMA testing
> > > via the Falcon (Fast Logic Controller) microcontrollers. This driver
> > > extracts and adapts the DMA test functionality from the NVIDIA
> > > gpu-admin-tools project and integrates it into the existing VFIO
> > > selftest framework.
> > >
> > > The Falcon is a general-purpose microcontroller present on NVIDIA GPU=
s
> > > that can perform DMA operations between system memory and device memo=
ry.
> > > By leveraging Falcon DMA, this driver allows NVIDIA GPUs to be tested
> > > alongside Intel IOAT and DSA devices using the same selftest infrastr=
ucture.
> > >
> > > Supported GPUs:
> > > - Kepler: K520, GTX660, K4000, K80, GT635
> > > - Maxwell Gen1: GTX750, GTX745
> > > - Maxwell Gen2: M60
> > > - Pascal: P100, P4, P40
> > > - Volta: V100
> > > - Turing: T4
> > > - Ampere: A16, A100, A10
> > > - Ada: L4, L40S
> > > - Hopper: H100
> > >
> > > The PMU falcon on Kepler and Maxwell Gen1 GPUs uses legacy FBIF regis=
ter
> > > offsets and requires enabling via PMC_ENABLE with the HUB bit set.
> > >
> > > Limitations and tradeoffs:
> > >
> > > 1. Architecture support:
> > >    Blackwell and newer architectures may require additional work
> > >    due to firmware.
> > >
> > > 2. Synchronous DMA operations:
> > >    Each transfer blocks until completion because the reference
> > >    implementation does not expose command queuing - only one
> > >    DMA operation can be in flight at a time.
> >
> > Asynchronous DMA will be important for testing Live Update:
> >
> >   https://lore.kernel.org/kvm/20260129212510.967611-23-dmatlack@google.=
com/
> >
> > That is why I split memcpy_start() and memcpy_wait() from the beginning=
.
> >
> > Would it be possible to add support for it here even though it is not i=
n
> > the reference implementation?
>
> I'll leave the can-we questions to Rubin, but do you see either the MSI
> or asynchronous issues as blockers?

No, I don't consider either to be hard blockers.

> Currently our driver tests are
> limited to a very narrow range of Intel server platforms, whereas this
> is a plug'able endpoint we can install anywhere.  I'd think that's
> sufficiently valuable in expanding the test base to make some
> compromises.  Thanks,

Yeah we can compromise if both issues cannot be resolved.

I hope to limit differences between the selftests drivers as much as
possible, so that tests don't have to care. But I also recognize some
divergence will be inevitable if we want to support a broad set of
devices while also supporting more advanced features like asyncronous
memcpy.
