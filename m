Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B143CB54B
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 20:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185885; cv=pass; b=agFxPqq6/4XuAbzei1uopslgpFCi7FJ1dbA/8txji0KbQZf+NkbYbV1nMOB0a0kCFw+j6qc8ArHzY34pbCB0WVbvtMwT9dz9Vs+jE50LajiTfbHsWxwRjmvWMVimBdjt7I4hAqtnUCOqv7YJBzRiJerIDXLAWjlwpqIHogqlmKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185885; c=relaxed/simple;
	bh=erXio11sv8IeTMNTgjEf7aNDXWut/7A0Cyg4XNgL7AI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nwg5eM7XRVhjLgn0KJ0w1LXmpyMdnsvKQY3DaDV4/SsyYmPrAdZE+FhjNhoEe+ux5GOWYfuUL4m3jySVFLOHNtLt4ajL9phmfEH0LyquuNc1VUEEiSIMApWu8gYrE2SS95ZGPZODJIowDHYdj9v2ngF9Jjw78aypHX9vXn08gec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kyHQbD4c; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kyHQbD4c"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b2a8173142so734e87.1
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 13:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785185882; cv=none;
        d=google.com; s=arc-20260327;
        b=m9xi4wNvdtNn+swI36CRvV6Mzjgs+2suwk3k508zq2fL7T1IY2BWNksAtTT0wsmFUJ
         9xu+Lsrs9VZ+Ijcb0RgPpFJTwKhi1M0I01XqmTHOFC34hmxC29nDC0VMA/ffjYwW2OnJ
         KzODQLzZHDKhj2EpOxlZXovZK2ySjv6Vlg3yp9h/sbHLJz9hRxRpKSdxS/fQDWR2sBdh
         P/LvaCNNZnoZ7RIdBqU90TPHitOcf+Unp7CFJYbU7TPrqlDJHqIjSRZ5DQuTmoesC5Ga
         //k0XygwdS4AEhTncSwX+M1v0dJnZbBQQwv1NJCGOWb0aVVuWF1tV8KaiuGfMtqL/3ZK
         pZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T+GWN9EcqlZwgwSAZCGbau2xiBsi9Jyqkx81+8LXg/E=;
        fh=1xGYDkTSWkT8hkwnZFFmp5sLuA6tcWouCLDH1/hxNvQ=;
        b=OD8ebUUnFNFWmqL77RrOqx0Ya/p8/kqBHzy9wTIEdoWwvfpqUOCG5o1Z1Hiu/btzjl
         jhEFZ2KiPAHqUKjFmtcCeFqRMZB5ZhoNLiomKAmFMpPtGhiSUB17kkH9GnUDgghJeVBB
         hu6W6VShBd5HtNEevBzKX/cMSuL9IwcriZEvEq8RF5V7WlWwFOTuUQPMLHINE8VC0Zg8
         LHWmcSkRkcq7k+nMfHyO1wydBmT8Kkn30856jltQ1nbWXrzZ9xFSsPTOs2feXENAtWmp
         i8rUC9/tUcKv25XraRbKILHLoHN3DbVvcHbjH6lc4ae/m/ttajiOZFrA/2we4nt8BOmT
         j+QQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785185882; x=1785790682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T+GWN9EcqlZwgwSAZCGbau2xiBsi9Jyqkx81+8LXg/E=;
        b=kyHQbD4c+1vHtQPKnpccgBpC3cEakaw4zZzwlyEJNkv3xTDYTM+ethw6N2eIXcX/Sx
         tO33EEGInfI05TzcZwmEKG1qCjCzQRekSCQt2QwrG4Fzr31njaQMHDmG5q+HfCL4zS44
         kdOEw5ITwz5BJ/o07/n1wRbXhE7cLeFR5MFRDEU4msFUfFw49FiRmkDXpedCq/286mLG
         4eUM4IRObwqF29yYMdTvN4235OC3G8bG/D3NLuuFaYC6LMP8l4j+Qba20MAiEqtGRKIW
         DWUQK2bIF4f507OjIqrRVlo5G/it6+b2/ShPQD7+qvBkiW00hsvb18wrxQLlGR/F3YZe
         iE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785185882; x=1785790682;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T+GWN9EcqlZwgwSAZCGbau2xiBsi9Jyqkx81+8LXg/E=;
        b=LyPx0+kDfn8zGn3BlxFZ5SPhEmGA34uPh8N0IBs7ZK80SoIFgMmwp/r1g1wVpflIBg
         qHTS2o0WFYKIO1yZV96AFlK7cHljO1HijAusPOBwdkyGE5sKGoHIn8n1jIVfGLqW1+oO
         5SKPe5eXjVjHkM7TdbJTDslVx4kKgz92kk7CmjZ8zDIz7lDvZ2igyvDbD74MY/BciU2U
         1/wWXY/kyFpbgdvEhxuymtZaj8I8f4mWR5vWuSY81BQZlfhuhx4u0uhJIKOqCSoqR+yF
         U+biBcSQOOnMwe3otJcH85tAkufjvrO5kuDpH1jfwmAcxPc62zZSFuFKl5F/v8GX4yk8
         f+NA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1oMyT7MaZBG+fBJ1xwfpjeCGt0lQRbZoWOeh7+pik9NwRLi13RvbOQO+MayAMfFSiBMzyyQXqQoeZSngfg3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuqugjTYJexrTA4sgJx03STiwDktIbn0dv2mmhBIQ1bYqDP6NG
	LQj24+z8+bmbk6wXVvdnQNKF1/GFdDjj2855TTVKjPQ8T0s16wESmB5lwv2nB3PyXmtq/60esVV
	flOYxMV2w2MmpBQPQ15droeokj9pj3lawhFKilBw=
X-Gm-Gg: AR+sD133/EkqgSfcrUbT5hT4D2Es5ORqg34UdpSBXpXnonHYv6lqsdxpk0Z6qLIU1z7
	g5xXpcRMBBrfaizhmhOb005z9HeThe/DLAKnAznki/XvYHrNeKKyO1JtauHL0ynhydrlHAest/t
	eiu+qTuWkepg4FYTM9thFEK4r3B4hOMmJSe2DJufdRUwFIIZhQn4EqQpDl79VdG5T6+jTWSITg2
	RyqfoMtgbk+QLnwrF9+5SnQNs8vLLHOQjRj9+QU97HdCswAhiDB5Mo61Q==
X-Received: by 2002:a05:6512:3185:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b2bf3f14f6mr425478e87.4.1785185881592; Mon, 27 Jul 2026
 13:58:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-igb_v3_b4-v6-0-0be1d29918d4@google.com> <amPcKEBsrkTH1JqQ@google.com>
In-Reply-To: <amPcKEBsrkTH1JqQ@google.com>
From: Josh Hilke <jrhilke@google.com>
Date: Mon, 27 Jul 2026 13:57:49 -0700
X-Gm-Features: AUfX_mzaMPT1HE8B6R0kwFIkBSjA-FVd9OGRi9TkYoJKu3sKgsQD2Zw5Ip2cCVY
Message-ID: <CAAdrzjvRzU_0J_-EdEJ0U=Wa9ayN4=J0vJ_EkSeKeqSBvrNyfA@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] vfio: selftests: Add driver for Intel Ethernet
 Gigabit Controller (IGB)
To: David Matlack <dmatlack@google.com>, Alex Williamson <alex@shazbot.org>, 
	Alex Williamson <alex.williamson@nvidia.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you so much for the review, David!

Alex, does this series look good to you?

On Fri, Jul 24, 2026 at 2:42=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On 2026-07-22 12:15 AM, Josh Hilke wrote:
> > This v6 of a series which adds a VFIO selftest driver for the Intel
> > Gigabit Ethernet controller (IGB), specifically targeting the 82576
> > device. IGB is fully virtualized in QEMU, making it suitable for runnin=
g
> > VFIO selftests without specialized hardware.
>
> > Testing
> > =3D=3D=3D=3D=3D=3D=3D
> > - VFIO selftests builds clean at every commit
> > - vfio_pci_driver_test passes using IGB driver + QEMU. Use the followin=
g
> >   command to run the tests:
> >
> >   vng \
> >   --run arch/x86/boot/bzImage \
> >   --user root \
> >   --disable-microvm \
> >   --memory 32G \
> >   --cpus 8 \
> >   --qemu-opts=3D"-M q35,accel=3Dkvm,kernel-irqchip=3Dsplit" \
> >   --qemu-opts=3D"-device intel-iommu,intremap=3Don,caching-mode=3Don,de=
vice-iotlb=3Don" \
> >   --qemu-opts=3D"-netdev user,id=3Dnet0 -device igb,netdev=3Dnet0,addr=
=3D09.0" \
> >   --append "console=3DttyS0 earlyprintk=3DttyS0 intel_iommu=3Don iommu=
=3Dpt" \
> >   --exec "modprobe vfio-pci && \
> >           ./tools/testing/selftests/vfio/scripts/setup.sh 0000:00:09.0 =
&& \
> >           ./tools/testing/selftests/vfio/scripts/run.sh ./tools/testing=
/selftests/vfio/vfio_pci_driver_test"
>
> Extending this, you can run all VFIO selftests like this:
>
> make -C tools/testing/selftests TARGETS=3Dvfio install
> vng \
>         ...
>         --append=3D"hugepagesz=3D2M hugepages=3D1 hugepagesz=3D1G hugepag=
es=3D1" \
>         --exec "
>                 tools/testing/selftests/vfio/scripts/setup.sh 0000:00:09.=
0 &&
>                 export VFIO_SELFTESTS_BDF=3D0000:00:09.0 &&
>                 cd tools/testing/selftests/kselftest_install &&
>                 ./run_kselftest.sh -o 360 -c vfio
>         "
>
> The --append flag makes sure there are HugeTLB pages allocated for
> vfio_dma_mapping_test. The "-o 360" is needed because
> vfio_pci_driver_test takes more than 45 seconds.
>
> > Alex Williamson (4):
> >       vfio: selftests: igb: Use PHY internal loopback on 82576
> >       vfio: selftests: Add helpers to re-enable interrupts
> >       vfio: selftests: igb: Factor hardware programming into igb_hw_ini=
t()
> >       vfio: selftests: igb: Recover after DMA-read faults
> >
> > Josh Hilke (2):
> >       vfio: selftests: igb: Add driver for Intel 82576 device
> >       vfio: selftests: Retry on EAGAIN during device reset
>
> Reviewed-by: David Matlack <dmatlack@google.com>
>
> Thanks!
