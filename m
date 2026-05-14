Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C31262808
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 23:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778800611; cv=pass; b=ZJs6bSoPKVTIyL9ZA8+PuoeAHrbrPzxQ1yEvXkDT+VAlk2Rqt+f2QsRGlKmorMvInMt0abBFqCgR6hkQdPnN1ULrwp/+L9QE0KNyZMU815m4nOMyIR5wZ8s9yI6tXyATohzIzUIiWb7Q7qF5EjNqpb01ZOq/ClQytWjrv2FXVZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778800611; c=relaxed/simple;
	bh=GqMIxS2qokRTaBjyXnKBg5Gwghst4uUKiage638D8yA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=slhR9S3f5jVMZeqTrdf/WBTkrP/yoG9HhlQkyBUFWH9lc1IZW2/HAtAqESebUdAlnAFP3yHwzJwWykonHC8fTYwlCo7ZHssaPcgoLjE07waePvjZx9cr1jELbZUjyPZe/T2qLLy4jPZ6oZfNEzVfn8+V+5uOgAEVAV9os4BL638=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ILsQ/tRN; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ILsQ/tRN"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50d6b393d60so1111cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 16:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778800609; cv=none;
        d=google.com; s=arc-20240605;
        b=TDU5RacqKl4e77/ru/S4zAE61cEQSQ08R0p2K4f96OPjNTAxtoSOfpzOXm5n6o8bwn
         yjV8rrUuVbWunCWPLOM9MPeuLEAC0LsXI/cStM+UF2DcWV7dqGTu7dS8HLCC6CcgV8Ii
         FdGr8jkm1T4eZMcrgqAmm00cB1aReC3klKebX+ltrk4Fl3F6vcRngjYSkhzpXjKEkKYf
         I/BSlKK7QR3MPqOp/W6MIN5A4svkgSe8iFj6CvENkFXUt+tHYlydF48KhX4FVsT/AbJq
         1Bok+xOJ2iiOjXGGmYFmrjhiuM6FIT+t+sPbmxR/tlfOkpSHzoJURGYv06sQDYzz+xUw
         Es0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=btEHp5/GJvhb1vXJGfCZD+jUhAac94LqZkNj1WkAiIg=;
        fh=Zrrx/RQ3JLMSYH5herMut0TI1J7LWQW3OodKNJpfKos=;
        b=Fzm6ivvBK1VU/iy1DH3t86nTTMoAgiq5MaymP8DrSmpvnNwya8zsbH/sBq5UFs1+ZE
         dRLf+cUTHRM3NEfKXE2TflRX4bPGwyi9Fcb/Oq6j1oJFSbFJzvveoCEMy/7W4Ec7ap17
         gI6JSemYKDmV3qSy1nrSBXIF9PVyO0AkKDbwKokWfakrBKd9Jf+X2Vc8YxsZVLMyhwD1
         ZyZrYk5TqrMAIJeucEmd677HglKG9YKyg5fEKWLCTOJ07KcYj1mQLBERbQK2KVaPqtVe
         6c15iydms0hLkVvtJ0yfCdsqAn2jCP1DEdFju853VlbWUS2YXcgw99hvrNMdLH8vAyZN
         Hmuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778800609; x=1779405409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btEHp5/GJvhb1vXJGfCZD+jUhAac94LqZkNj1WkAiIg=;
        b=ILsQ/tRN4kOdoiGazWlf+qTbJSJyPcCjRIWkAvHOAei3essCzYdo9249qfJTUWlvpj
         N1XfR23L9nDANSbACktNMN5cDS3dS3sP6BLGlSO+Ww66LgcF2SF4T/6ljO36uq0WHzvN
         Ynw1Zrr4PYjMJ7ri6LXYWGMVlTUICfrcJiO2+65S6qTGENZiNqkb6NpIMPznYwlniEyi
         2Fx/ypxcW1poa/nWEafeqiakE8oD9cjK2cDd73uQ0WEGR3UdD0XrZdZCwS6LNlTRhOcy
         QUscOt5h2C9huGuFeiscKng02qNNjqQ2QOiXS0g7W2UL/9NWX5D/o3WPZLM5Z9I+n88s
         igPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778800609; x=1779405409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=btEHp5/GJvhb1vXJGfCZD+jUhAac94LqZkNj1WkAiIg=;
        b=lY9ZlT9hMMiszOpxEGO2ukj7E7WHYrHuVZuga1UCywh80+qaD/wtyednhu5hzUv+EP
         NuEfV2PKYHOT7ql91VRoFnPL1kyWMvgkhKBhlQgFVInSlxKrjauToq6iqsMOKFPmR0y8
         ZdfTQNxygTmFV0AOoV1tQ0eHkdW9JVnvpggtYy3IQYu06FgaTwFD3JIDzzhIvbVwwiSA
         bc8BRJSMNydafUFRqQmTRQJPuzyMRg81Q9eqAZ4W4NfsHxAQaTfgX9fVNP79FLHQxL0x
         i7JyLIqS3aJZ172rA7Vzkr9pBWfoepwW66nzJZa2BEw1b2TwmCI37SmR/T8cmOV0C0lS
         /UTA==
X-Forwarded-Encrypted: i=1; AFNElJ9ut7QtjP/CwdZWMUFsRkpWnAAQC6A4PEtcR9epOU1D8LVU0EzuSW2j8rjDlwpui2MDRH8eb0SdTUXQ3MnDgIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM5EAH14KKfIVLkAW3hT8RM6hClSn1g26/BNyGYu4PfhrDtMtI
	vRrU8jYmQseP5nEhC7y4kT+dRCe6WhThx3tYbHatDeV/2b6IAJwWYllJYO46YFTWeu0vaSIdd85
	tIiD7Ki4rmimgk808pP9HUntXf124u8irAG8w3yU=
X-Gm-Gg: Acq92OHAkZLHtw41lrQMhH3xJEnXpqKTC+wKF/CzLwJMT6/X0qoE98WfN8CcZSmGdV7
	uD7XZbZwJcCpzmj2R8ojJdYwjgmGUdJpGWPF1sz5H8ac9wK50fu0IGl4I1pHgQ4wIMnK0ZFaj8S
	Me9tQBYoZ/hLZ1N2uSysl7lkONsRWcPnHERkK2rMg8Kj/iSWvEBy4ScHvjC1umMlpGIbRxMndaZ
	38XEZHrBZhR+8zi3/bMGSx7jzvFeIeOIS+T+eFSVVe5qjz9b6JVghnPh0xoaebCHUKG5ouL2WN/
	VjUJEmJzIv3oTws=
X-Received: by 2002:a05:622a:8599:b0:516:4f62:85e6 with SMTP id
 d75a77b69052e-5165d40d920mr1716461cf.17.1778800608660; Thu, 14 May 2026
 16:16:48 -0700 (PDT)
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
 <CAAdrzjv7FiYWhXHDJQvK-c71UpKo+uwOu-dnbtka=6p2qj86zQ@mail.gmail.com> <20260514164844.2698802c@shazbot.org>
In-Reply-To: <20260514164844.2698802c@shazbot.org>
From: Josh Hilke <jrhilke@google.com>
Date: Thu, 14 May 2026 16:16:37 -0700
X-Gm-Features: AVHnY4JO_ge2DkYCbocp1T1DFM8AbxD6tpVPjLiIutR3zy9YsmtwU53NGWlliM4
Message-ID: <CAAdrzjsxm-EK-U_Z4hbdUZJXwxbCu_R7G_jegm-MUecDXa4Djw@mail.gmail.com>
Subject: Re: [PATCH] vfio: selftests: Add driver for IGB QEMU device
To: Alex Williamson <alex@shazbot.org>
Cc: David Matlack <dmatlack@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Shuah Khan <shuah@kernel.org>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 3:48=E2=80=AFPM Alex Williamson <alex@shazbot.org> =
wrote:
>
> On Thu, 14 May 2026 14:49:28 -0700
> Josh Hilke <jrhilke@google.com> wrote:
>
> > On Thu, May 14, 2026 at 9:28=E2=80=AFAM Alex Williamson <alex@shazbot.o=
rg> wrote:
> > >
> > > On Wed, 13 May 2026 23:33:02 +0000
> > > David Matlack <dmatlack@google.com> wrote:
> > >
> > > > On 2026-05-13 11:49 AM, Josh Hilke wrote:
> > > > > On Tue, May 12, 2026 at 7:12=E2=80=AFPM Josh Hilke <jrhilke@googl=
e.com> wrote:
> > > > > > On Mon, May 11, 2026 at 4:45=E2=80=AFPM David Matlack <dmatlack=
@google.com> wrote:
> > > > > > > On 2026-05-11 09:18 PM, Josh Hilke wrote:
> > > >
> > > > > > > > +     retries =3D 100;
> > > > > > > > +     while (retries-- > 0) {
> > > > > > > > +             if (rx->wb.status_error & 1)
> > > > > > > > +                     break;
> > > > > > > > +             usleep(10);
> > > > > > > > +     }
> > > > > > >
> > > > > > > Why bail after a certain timeout? The test may have kicked of=
f a large
> > > > > > > count of memcpys. Is this for error detection?
> > > > > >
> > > > > > The bailout was intended to detect errors during development.
> > > > > > Shouldn't need it anymore. I'll remove it in v2.
> > > > >
> > > > > Sorry, I forgot: we need the timeout  to detect DMA errors for th=
e
> > > > > memcpy_from_unmapped_iova test in vfio_pci_driver_test. The test
> > > > > triggers an IOMMU fault because the IOVA is unmapped, and the IOM=
MU
> > > > > aborts the DMA operation. However, the QEMU IGB implementation do=
es
> > > > > not set an error bit, so timing out is our only method for error
> > > > > detection.
> > > >
> > > > Hm... that's going to be tricky then. This means we would have to s=
et
> > > > the timeout to longer than the longest possible memcpy duration to =
avoid
> > > > false negatives? That means we'll have to set the timeout to quite =
long.
> > >
> > > FWIW, I had AI churn on trying to make this work on a physical 82576 =
as
> > > I have several of these in my local machines as sort of the defacto,
> > > readily available SR-IOV NIC.  The AI got up to 30/35 tests passing b=
ut
> > > is currently stuck that the queues stall in the mix-and-match test wh=
en
> > > it's trying to DMA from an unmapped IOVA.  So far none of the in-band
> > > methods to kick the queues seem to work, I'm not sure if we'll need t=
o
> > > resort to an FLR.
> > >
> > > I'd be happy to send the changes it's made so far if you want to
> > > validate and incorporate, or have any thoughts to kicking it after th=
e
> > > IOMMU fault.  Some of the changes are related to timeouts, where QEMU
> > > loopback is actually faster than bare metal since the physical  queue=
s
> > > run at 1Gbps even in loopback mode.
> > >
> > > I'll also plant the seed that if we do have outstanding issues for a
> > > driver that binds to a real world device, but only works on the
> > > emulated version of that device... how do we handle that?  In part, I
> > > think it's emulated in QEMU because it is so ubiquitous.  I'm also
> > > hoping to use the same device for the new SR-IOV selftests.  Thanks,
> > >
> > > Alex
> >
> > I'm glad you're interested in this as well!
> >
> > Unfortunately (and ironically) I don't have access to a physical device=
.
> >
> > Regarding driver support for the real vs. emulated device, I think we
> > should prioritize supporting the emulated version. This approach
> > unlocks the ability for anyone to run VFIO/Live Update tests without
> > needing specific hardware. Once that's done, other folks can add
> > patches to update the driver if they want to use the physical device.
> > What do you think?
> >
> > I plan to add SR-IOV support to this driver in a separate series after
> > the driver merges.
>
> I've got it working now, I'll need to do some cleanup and verification,
> but it's not too bad (imo), several places where QEMU emulation only
> supports one mode and we don't fully configure the device or don't
> account for physical hardware limitations or timing.  The most
> significant change is in resolving the issue above, that once the queue
> gets wedged from DMA errors, VFIO_DEVICE_RESET unfortunately seems to
> be the most straightforward mechanism to get it unstuck.  That may
> result in some initialization refactoring and plumbing to restore the
> interrupt state. Thanks,
>
> Alex

Alex, how do you want to incorporate your changes? Do you want to send
out a v2 of this driver? Or should I continue implementing my v2, and
then you send a follow-up patch? I'm fine with either option.
