Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECE538F939
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 21:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778795382; cv=pass; b=rO3xB3S/ELNMFkThFf722yd3J/9qdK9D/d33ty2lw1TvYz2bgVdtHJPXIRextpBzdErl09MnIb7fqNbgSdgEIAlbHQ0CrX3pXJUXbxYJex2s9sJxbPo0aroOzNIekQ9SI9LfwtlQAUuUK7MeGk1f3nesaB5HIVLqeVSpptDuoNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778795382; c=relaxed/simple;
	bh=qPw6hhkh44Kw11vhKm0GuTYfqgO/FQ1TU7OYkZdj4hc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BtM37gMx+CUXjh0cT34miu3YJ5OiD/Lt6S2EQXpvhfGzlXdm6U+c2xkA0rJsuP2cPFmuLAUvzR35z/S1HXDKWjhlEfd58JnHf7jjjTi5cFvADSNawusNB7W4CyKDFz3PjOJa3oaxp7kYFh0TVDNKZL/fo6H/TnkB24yJXfAudSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SQSZPKA+; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SQSZPKA+"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50d6b393d60so2811cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 14:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778795380; cv=none;
        d=google.com; s=arc-20240605;
        b=ZQH8Mlvk74/enLYcbu1Yf542Ugs7ZwaVWKxXX2Ds6Hd7KoVgxEEoE8eJYF8RsWriRD
         xl4ADOkas7AyMVRSqA7k4LK7RCC6vK3I3XiBiGfR+l0Q2xXr6lyYPZJd/5SwSbdnBBSV
         s2ra0klbMbDjC7jengXmg3fg+j4QLxE3ieAcmTKMtMwtC0hoXhRNymZ2DRDuZj18CQ1N
         V3yL8D5ft2ShpR5voQEwZySER5Gz5r4fJmOY8UZWUWZ/Vo8ghJxG7nmQDonO6/8ThUrc
         Nw98mgCquzCy0kE1PwgLah3GJDhGqPFB7rDDNkj4pHoqlcKx+6bejxUZNLyiNtyZjPC6
         Exvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x3ZJ3XkKOqKtr76p8ODDEk6AtSE3Rf05AzjjlPfemzQ=;
        fh=Fp45zJv6aVw9c6+JLccYB4plD1fIVHmli3n3Ty43RK4=;
        b=G104MJ2quVNwnWAQ6pyxL3YMMsa9yzrB6V5JWM7+ErlGf60f/0zXhchAKdOSyPGPR3
         ROMhgrgHpqFUQ2KJ9xDElwfzZfGcXkeVtm7Gmgk9S5qcbm+4NoL+sCA5WGStfR/j0HzT
         +X3U5ZV0MBKx5UrHvNuA8rk2tSr0nw4xc9c7tDsjUDtudgjC3UeN2M6qT4AYzxZ1O46r
         Jz4Kf2KcSo3OMKPNsKWqt+LEaVH89D2tpil7W+oD69mS5GkgNc3f/1m7jJ3M4NV5dDSn
         XjoSjJ+UrAMIx8kOQnySGuWlFNgKk/1b8ATYLxLqQKHPYw0hwLWaXBusetyLVSV0xeXd
         F/Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778795380; x=1779400180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3ZJ3XkKOqKtr76p8ODDEk6AtSE3Rf05AzjjlPfemzQ=;
        b=SQSZPKA+qiwSY6Dsy38XXCGDls6zV8kjZ/QpuMNJ/bmJ3o0z82AhEZvR8PFN8DGnsM
         reRmRxlZTki/hZznhjljRljGXIqsPOeJ0pIborIdqYqecRIkncr3qAWwfgA5ywq5YjE7
         diwFCdaa9nNn1AlI+6OMvx/4M6zGmPL9y7oxbOauBJ5UY5wvTisskws0v62lRB5WFckx
         z6UYbt4ymjW1k8DEEsyu0nkHYpEwmQy7NOlCdv7Dew5xlJ0P3V2p3zAXFJ5U2cflpjMn
         gHcI928XPrP/vP1SxRL6pSSQDU6Ap+Ll5HXAb2nRvJFDsW3HPgvM/P8GLHyMn4T5JJyr
         Brqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778795380; x=1779400180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x3ZJ3XkKOqKtr76p8ODDEk6AtSE3Rf05AzjjlPfemzQ=;
        b=aJyLX7t3b1c7a4YjDsasTFnQf1qspaBYKAkX0ehI5JSmxNy0/m4T9HRKK3hdhk1q6g
         AODMmxbmnS8PhWqEx7W/7jTfPs1S6IHXBb4Z+zefJahx4dN3nEimrHbPcdunjebvL4ZQ
         RqEBGqLa1L1nKhpQYd5u8M+7jFxBX8uC7TlWgnEH2K93xbzc8iwuyUt4CmgyPXmR33Gw
         oqdZ5/lvuQI5q6FRxUzuyTmp1qLsj4Syrm4O7K71uy/5WlvqZDL1iG6tsDjnxjfBwuk8
         VgUZzlKultEN/Co/Wuh0JiGhiqubRrM8NU1cC13wVVCN4fJjemqW/8UlQgVZtjh6krGT
         CTzw==
X-Forwarded-Encrypted: i=1; AFNElJ+NVdPnyCG02dyl+H5HLd4HkV4Vc1XCZpNF1ZbN5GticDAvGmY/2ZJHgPRB35NENMPh25zpS2E/hRMnaEuX1hQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpUg/gojSfAhY89ekIIDa1zM1aM6YpbR8ouhBeFLy5Q0zWr3/7
	wKBLL2nDZrilsJMGBdLvQ5GStaXYs3saLc4SupDHBVa0y6rKxEKzf8qFV+3NxRAMFuqE1Si4ukB
	dT0KYv3zhLBOLwUUE+AUZHU0BkD/6Uj+LG7C8nQ4=
X-Gm-Gg: Acq92OFr8qxcBkWaJNWS5j3UaAsN514vbI6cDWVH0kBTOa3vKoq4AnokibvgFMqPBSH
	+46I0oO5bT/JBflJVe3tCtJU7qDhJrwrIQXIX5p6kCLujKbtW2GwqTVI872mtj6VAp+Gmg4FA2W
	Cn7Md/9gXds1D93siR/1iT1FlURZoLGX+9K4KAWyhKSIsueLjsTTsxVSPZ77MkCqYEMNHuqjCmB
	fpaHURxmMIIiflplu16AIPIUgH39dNZiD1eIdyFFnF+DoWaM6GHgUR8LY0QmEKJjkRPFdEZt/16
	HKqyrJN1TsP9H1U=
X-Received: by 2002:a05:622a:aa07:20b0:516:4f62:85ea with SMTP id
 d75a77b69052e-5165d410daamr1400691cf.21.1778795379422; Thu, 14 May 2026
 14:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511211839.2781731-1-jrhilke@google.com> <agJqAO-RRdjMrUZJ@google.com>
 <CAAdrzjtiiOtw7-YL2COgZC-QSFp6LLwq+jP9V3jPKLUe0w7Y0g@mail.gmail.com>
 <CAAdrzjuf3z-CyWeBRPKmMQxmQZ9U=2Tc0cDAFqdRFRDHKw_K-Q@mail.gmail.com>
 <agUKLmKLoV71Hq6S@google.com> <20260514102824.6be38bf6@shazbot.org>
In-Reply-To: <20260514102824.6be38bf6@shazbot.org>
From: Josh Hilke <jrhilke@google.com>
Date: Thu, 14 May 2026 14:49:28 -0700
X-Gm-Features: AVHnY4IqMgAIGejttTEeDl7uihihNsvJd81hWKmH0vaDHAXOrt_U83zoEkbkvMQ
Message-ID: <CAAdrzjv7FiYWhXHDJQvK-c71UpKo+uwOu-dnbtka=6p2qj86zQ@mail.gmail.com>
Subject: Re: [PATCH] vfio: selftests: Add driver for IGB QEMU device
To: Alex Williamson <alex@shazbot.org>
Cc: David Matlack <dmatlack@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Shuah Khan <shuah@kernel.org>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 9:28=E2=80=AFAM Alex Williamson <alex@shazbot.org> =
wrote:
>
> On Wed, 13 May 2026 23:33:02 +0000
> David Matlack <dmatlack@google.com> wrote:
>
> > On 2026-05-13 11:49 AM, Josh Hilke wrote:
> > > On Tue, May 12, 2026 at 7:12=E2=80=AFPM Josh Hilke <jrhilke@google.co=
m> wrote:
> > > > On Mon, May 11, 2026 at 4:45=E2=80=AFPM David Matlack <dmatlack@goo=
gle.com> wrote:
> > > > > On 2026-05-11 09:18 PM, Josh Hilke wrote:
> >
> > > > > > +     retries =3D 100;
> > > > > > +     while (retries-- > 0) {
> > > > > > +             if (rx->wb.status_error & 1)
> > > > > > +                     break;
> > > > > > +             usleep(10);
> > > > > > +     }
> > > > >
> > > > > Why bail after a certain timeout? The test may have kicked off a =
large
> > > > > count of memcpys. Is this for error detection?
> > > >
> > > > The bailout was intended to detect errors during development.
> > > > Shouldn't need it anymore. I'll remove it in v2.
> > >
> > > Sorry, I forgot: we need the timeout  to detect DMA errors for the
> > > memcpy_from_unmapped_iova test in vfio_pci_driver_test. The test
> > > triggers an IOMMU fault because the IOVA is unmapped, and the IOMMU
> > > aborts the DMA operation. However, the QEMU IGB implementation does
> > > not set an error bit, so timing out is our only method for error
> > > detection.
> >
> > Hm... that's going to be tricky then. This means we would have to set
> > the timeout to longer than the longest possible memcpy duration to avoi=
d
> > false negatives? That means we'll have to set the timeout to quite long=
.
>
> FWIW, I had AI churn on trying to make this work on a physical 82576 as
> I have several of these in my local machines as sort of the defacto,
> readily available SR-IOV NIC.  The AI got up to 30/35 tests passing but
> is currently stuck that the queues stall in the mix-and-match test when
> it's trying to DMA from an unmapped IOVA.  So far none of the in-band
> methods to kick the queues seem to work, I'm not sure if we'll need to
> resort to an FLR.
>
> I'd be happy to send the changes it's made so far if you want to
> validate and incorporate, or have any thoughts to kicking it after the
> IOMMU fault.  Some of the changes are related to timeouts, where QEMU
> loopback is actually faster than bare metal since the physical  queues
> run at 1Gbps even in loopback mode.
>
> I'll also plant the seed that if we do have outstanding issues for a
> driver that binds to a real world device, but only works on the
> emulated version of that device... how do we handle that?  In part, I
> think it's emulated in QEMU because it is so ubiquitous.  I'm also
> hoping to use the same device for the new SR-IOV selftests.  Thanks,
>
> Alex

I'm glad you're interested in this as well!

Unfortunately (and ironically) I don't have access to a physical device.

Regarding driver support for the real vs. emulated device, I think we
should prioritize supporting the emulated version. This approach
unlocks the ability for anyone to run VFIO/Live Update tests without
needing specific hardware. Once that's done, other folks can add
patches to update the driver if they want to use the physical device.
What do you think?

I plan to add SR-IOV support to this driver in a separate series after
the driver merges.
