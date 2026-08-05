Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F16B3A254D
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 17:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785952632; cv=pass; b=Ch5U61tq1MYLY+yQtPI/uf5kVvkOY/LHIdPWLRKrIvfEZz4BqO+g7AueVa7kOIo+GV/yvDglG1hfQgCpVqnoQh536ogebEycfA6NyQuxrckJ6+brTD+BiUdUk0DIh4uHpZYEvddgmQ2vytHIwixaSB48dxI+cQian/o+Ww+Xb4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785952632; c=relaxed/simple;
	bh=1O1MxAdS2HfcTbAQI4KJc5gaDXpcM9rbDVv55Dld/dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kn+iLjsYyho3fIT+TtkXb7p5WHIckdh296Ksjri5irRY/MyDq3G4/9cv3MUzEFf3UlRMQ6NuZdk3+l5cVLX58UsMB2y/QRaX6Sf5A2PbTPNHIPhppp6JPFbVKaB5Z4m3anGh5odCkjsHyl0C0NH9Z8Nj71BQUsx/7fwiiepQ/yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UwHnj18D; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UwHnj18D"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495509b08ebso4365e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 05 Aug 2026 10:57:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785952630; cv=none;
        d=google.com; s=arc-20260327;
        b=Ee0orwaLu1iywifykG55RnUEukVRdwC9Xvg9wPi0NRRum8oT/8S09a91RhZ9nrAlcZ
         IxBsMiPF3S+imCl5RlVLypAUJYMP9Qxjt8SwFOcgHaGHz9d/IRjX0qXliEfQovw50gKW
         8q/t5SUcTvXChQeSKVdDJiwbIOp9kXJQXf42WbyFxvoyvADpkdkwlJ/381+fr1pu8mCQ
         ZXeakRnkrmcPFnq3BRVCqKG9Hm1mEbQEDRy73whNgLBvmxnKjPaIaO6rv/hGWN0990HC
         O4TNjHsqKrkP2+Q3wbihRxzjweOCUYAbd8nEI/bWkej9PyFGhi8q8e734kCx9HEikr2Q
         DKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1O1MxAdS2HfcTbAQI4KJc5gaDXpcM9rbDVv55Dld/dk=;
        fh=f1EJK7EpOy+b1Ul2ELFcIUVD86C7g7wLBlmb5c78fuU=;
        b=jzJcwPmxlrvkAGBmAVI6iHog4G7ZxsbDXrCSGOQNHN7uQBPwz1aNrMtVMDo8QutIy6
         5U10BlUFiJz8o0ftMf8pIAnzaJsecZ3Zz0vJKNiA5MPrtsBv817slN4Y6I/eGxu1jYn/
         ASOh9GiaqhbL7xILvZfG3DudQmPq9woL/VK3WqMZeElRVeSV5ftzMhiI3wOHdfp25XYn
         K0c3rKeiQh6roulOFBgajzOnI9M6bALA+KwRX7AuuHLfiV/UwBC+kK9Yp1/eCKg4VJJc
         SJdpG7a4ZubKXTcqToQ5V5O4pORYwiR55ovNPzsUBxRfVZqD2mBOYcI1BI95jcLL2nRn
         QNaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785952630; x=1786557430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1O1MxAdS2HfcTbAQI4KJc5gaDXpcM9rbDVv55Dld/dk=;
        b=UwHnj18DGrHVBgkngDAReSB+QKDnAC55tlUpwy/fgG3PT7iAU6D1f8JFQmQRpKifaZ
         V9QwD01lFlJ1W73pmnb2WS44/8zuRaY8UhK/QNmDUjMz/ftWzrxeahTv4n5svHRHxf1i
         Km6+A0dhV9lgRX3X1GCsq44hmHKlMZz9CiXN/U/OEebRMtJHlF++QSlvlXXEXa3VG7Yf
         jwFjh4ysju2klvyk+0JREldEtOXnLXWEoi2dGbgdnhTXMpdekY43L4JOmPk4NIGaZBTw
         o/56c35CFD4KiD6LdfIWZtDif+8MrwkrDGEC0Tog7+12L9+p3kdjDxuH9BWjKKwwQKEg
         nRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785952630; x=1786557430;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1O1MxAdS2HfcTbAQI4KJc5gaDXpcM9rbDVv55Dld/dk=;
        b=MacKZ23hJuGt121i5EBdp+bc+grgNlbW8GZ+JU5oOVSSG6rX7AQHD5/IFeAWAiGTil
         gOOepjVFBRAqkGbu9ejJ+PVNhuCGmHxcWK7MGkCcs5CesZIyvDV7IG8DF71IHQp2OH/X
         OyK03cxME7cZc/7VMgN3FMHq2wzeK7ZA0H5sCJtXviHVJWJ+d63FRhQvoAE/RqRUwLQI
         WYpzIIuyUgDpcb/RCTU0A+9sZiSl0kaKeUZ76zFhDLdLogULJHP2J7ORKn9gM2zoNowL
         /QTA3xMNgCSIOqaWoOkpwyLHl3mfkm5RLW20XlfDb4c2Rv57fqzZtB0AE7CqNmR4VWn7
         scJg==
X-Forwarded-Encrypted: i=1; AHgh+RrZwubiuxcOOxEtKk3xFkQDrmXmU76Sp1H50Qyhf1ON0ZDLU3OTIAi24jYhyvB+0JZucCMf3u+6DONPQ9xspno=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWkwHenJTPAgHXcC9Rq2CVHxcUVyOW2lbksc7ekpdRFPBivkox
	fyk741fvF2Nm0HgTPR2CHqJA32wegQ/MFbGD1J4vukSJLYSeIlsX+pdh2FVRp/rWkZg5pbfaeOo
	Iw1bz1YCRIppwpdsWN2v30OJqSbccIHuUUO1ZbvZd
X-Gm-Gg: AR+sD11IAvvUxGkbtMKy/Juu6qlIflO6QlnT/Aza0xjY0BWI5j5tRx/csJFRh0DJaLw
	7GeVyNqYzdCVmV+/BJ69LacN6ok++aJR+OVaI9DKGfPM4TD5cxIV6dUshPZ15s85X5akARt441A
	gfC0/XqFZlRdEWmIiXEMPP3djKWEz2TK/7Jnu0qTWHJ26w7PN7w9n2c32wwKKh+TBeqbjBNnpdV
	XeTSJNRLcli7vN9TN8ULKhfr1QlWVBKgn+zUXGfrLI5zuGq0fdvwmeyH+dwwB/ttiU7eY94wvSh
	/LJjyMCQ8qi+5UH2yySh7SzBtEAJuYCe8FY/cot//RE60SsMnxgDuWv21dd5WD0BRQQjJqAEJjz
	eh34xr5gZlO3LNrbI1IykcizPQi8TcLM=
X-Received: by 2002:a05:600c:45d3:b0:48a:623c:8859 with SMTP id
 5b1f17b1804b1-49953c4a315mr26955e9.7.1785952629103; Wed, 05 Aug 2026 10:57:09
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801131220.1367229-1-almasrymina@google.com>
 <20260801131220.1367229-2-almasrymina@google.com> <CABdmKX3Qyeho7Ru8HOzWyCrKXp=kf2H1pOUTXVR3tRWpYhKpTw@mail.gmail.com>
 <CAHS8izP_mxA=QxP-17cg09uF1Gc1if=jog1pM_imMKQ7Obj3qg@mail.gmail.com>
In-Reply-To: <CAHS8izP_mxA=QxP-17cg09uF1Gc1if=jog1pM_imMKQ7Obj3qg@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 5 Aug 2026 10:56:56 -0700
X-Gm-Features: AUfX_mzt4MmWUgJ2L0T0dH-fUopMCnM-fsdVWZtRDKSd1cM8lkR4p5iBFPpUHXU
Message-ID: <CABdmKX1NvtwOevjq0G5v41WtqZKORTwi6G-7dbLHNjhjgfgGNw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 2/2] selftests: drv-net: ncdevmem: gracefully
 retry bind()
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 10:36=E2=80=AFAM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> On Tue, Aug 4, 2026 at 12:21=E2=80=AFPM T.J. Mercier <tjmercier@google.co=
m> wrote:
> > > In testing environments, binding to the port can transiently fail
> > > following a driver reset caused by the preceding queue configuration.
> > > The failing bind() is typically caused by DHCP/IPv6 DAD needing some
> > > time to resolve and assign the IP address back to the interface after
> > > the reset.
> >
> > With EADDRNOTAVAIL? Maybe loop only for that errno?
> >
>
> I did not check the actual error code returned. I could.
>
> But is it worth maintaining an exact list of error codes to retry on
> for this test code? It will be annoying for the next guy to discover
> another error code that legitimately requires waiting, and then we'd
> have to maintain a list of error codes to retry on. It would be worth
> going through the trouble for actual kernel code, but it feels like
> more trouble than it's worth for a test?

My thinking is it's also annoying to have to wait 10s for an error
condition that cannot be recovered from. I don't feel strongly.
