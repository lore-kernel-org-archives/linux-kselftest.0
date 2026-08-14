Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5991A37A856
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 20:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786739104; cv=pass; b=s1y1PRjXiwmuLmyl25347N3Q89mOOYccdUSDHoAsgrrQE19xFQLx6W9paj5YzFTKyZOHadzUBaNRrWLsI1hXcQyTtKZHBA3S8bWDOZPpw8eqxOEsENjDfiSnBjIlXKHGFc9GPJByafmzbVF7/7eBjkL4nFpWGyMQOYroD3E9SzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786739104; c=relaxed/simple;
	bh=7pAEGI8PIZ1O3IVtqZY+SQl/XNs88tfM3zHdS2mPS80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CPmarATIyF2UUlE8SPk1EbFMuTIDrh46FtOuQZu5sl3e7nuUPqoQRPck2d0HRMzQKmc+xrwYfJs8Z7aKpnnHnocYSkdtV6pKptZxZuQK0QfI2nYOUFu4JpLEK6A84xhjVwQVAznEO+tFqNAcsUTW8CjP+/sKyLWtRhp9RKq/Kro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wRhEtV4d; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wRhEtV4d"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cede6375caso158175ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 13:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786739102; cv=none;
        d=google.com; s=arc-20260327;
        b=lFF2jfxKCZrWCf/CpBnp+qhMij2j3xSlJzewVTMmiQ+Hz1BXuVyig6CIqZy3EeVXco
         L8fPYzyPZSn4/ILEyRxRUQGzj85UbF2z2Wti0RMUtW9Ifz8V1QRHP1w4GpeQkeY99Yuc
         cAAniSJmmMOvWxQQ/DAGuhDKiDkBVf/M4+GdXKysJg9rNu5jD7NoRrme/+op/CbCzMvd
         IYDY62CrSs6S+l0wO4dRY/4vNlEdWUnkJBSkHsB1ylgqH06Ttiq57OP/qoroJpRQeHKE
         6iB2cLMH6Q6KB6SBmZ5rGwHxnBDfeSseEisIvflqiFksd+maBR1qUe7zQxfmhTBkdy8m
         cNgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7pAEGI8PIZ1O3IVtqZY+SQl/XNs88tfM3zHdS2mPS80=;
        fh=DUFIyRw+PdYlowWlGRM2UCLabZ6qmUWs2e2mjnJV4/c=;
        b=SGYhk9MdJSJa9iDDexe3DY6YF2a3DO4ely+lPMn/aO9xVBz0/QcL3HsZhn/Cp3bv6s
         sAlnbSGT1B4p0bTdnB5I+o8wyOoJryrO5qGvlj8poboDn7WYwl4FABF53oKCK4GSd/ey
         HjdV5yi1bupezspDkNjTq3rtzph9GunEQbf3EYEeMqGAMxFKuj6ExkG/bQDn32Cx4e48
         oI2Gely2oD0X+p5U4r5JhsvDyQWlePjf5KKarIkr1DA9pdLxjKyJLxv0ip1Lb+fNwN+L
         FoE2nPLcn0I2wNVMRbICwgOo10O+KDuf7AIOMB6masOV0M6nwmdfVPVUjFYCFNNW1OmG
         6Oqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786739102; x=1787343902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7pAEGI8PIZ1O3IVtqZY+SQl/XNs88tfM3zHdS2mPS80=;
        b=wRhEtV4dzhFO8R56ULgwlCEQ+vFhnUsDsq9VXL0Qp71ElOCL8FrSu6YPQ7ml+woGXC
         x0ABjSqR58/8CwfhZnO4cyqREsMOersG95Q3eNToszA9B5Ig7FSVp1eXBIRmyuVf92JP
         nSN6g1dTLWpq8aRW+CBI7LPcuzGt+INnsvmQ/ir8w1Yr2TKIDFz7tVwOCe37GWk1emDN
         5OV3xIdgkTVi90ov5Pv/9ZbVPUf2X2dYdifpkhteTFFSx8XN+y+5DxUOuuXHi8TlXuWL
         SMOIOpKegGicW7aQNIGshwEzqeyKXUILm2UkXgypX5ETBbnEcAqk8niy+djnDpBSi6CB
         9MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786739102; x=1787343902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7pAEGI8PIZ1O3IVtqZY+SQl/XNs88tfM3zHdS2mPS80=;
        b=tDW7EWMgJXghZuC8Z82VYmYhEvZdGys0PdIBtV0h93qvNVGHg0Bq1eWHXqmsaY5/UA
         qI2gzey3p7x8F4ynECFZKYVxxv4+5gZ1ZxA5qcJSjMe1fJ9swmpyAFxR2tMMV3Mlah/y
         yYzhl0ZCX2WR5/wXZFB0g32bf4mqxPPcDNpbxNbBiITWIrn5t2eVrzh5laQqkKXo6qHO
         hbv/iw99QH7qz5hMqjPcAzMG/bssXNp8rAjtF/OHKlEqkKnZvD4Y8oWd4gmNnoQjUN/9
         5fZjO5oqcOqiZlXVNjX8Dk80PNiTNrdpNCACYd6sr7xiH3wmrX77Bgbdu+uw1FDdE3Th
         R6zw==
X-Forwarded-Encrypted: i=1; AHgh+RoR6f36nKysrujz9MQfUyDvxGG4f0L6ZmmS0lRYuBeNu2+kVRgQkGw6cgy4yHBSd1IFCaJfjywT4mQRDKfeyTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/+Rp376FlHByvuHHUg5nGzu65sms78rFVOwngFIkU2qho8D+Z
	vyo+Rs2OCaj6IhY5UVYRdAo0dKDisvMBY9E6WqNpaZcktLYkW8mjfkDXMAUi1S1dYesU3CvrT//
	l1HshJ5v6STBGv0iLWjT0b4CUbHIKvZVhQqRE2PlM
X-Gm-Gg: AR+sD12InXY1ffz7gShVcz2SWtEYrYbtYP7MAVH9r1go37KekVCaHMqMfamNbJHA1ZN
	7bcjuSiaNuTRn0IwfbMgNKfJEhAtVQSt5C5rUw3WRIbpA5jlIBvVPCw9yK7Zg34QCZ8cVgpKTCm
	WOcIoh3CUAK0TyCEmPiKUHo2iLq/6+YZUxamH125kM3fLXLI3+Xk7XoJYRFXRl6Togc9v7PN2+5
	mylMPSWFHkIRwv4GJaoD2mrmk6JQPBQckkzwWzykH4HEZU6fB1ZOWXk0otj+Akk+Vxz8xnKVY8l
	/K+K8bgGhgqVC4PgIyGgn9MITdXXiyQjcyS5mY3J+cWKTZcIm/nTWfTKVWwiSHbNeVB9EYywntt
	igjaKkeQuIA==
X-Received: by 2002:a17:903:ace:b0:2c0:defb:557e with SMTP id
 d9443c01a7336-2d3b4786b29mr10751435ad.1.1786739101838; Fri, 14 Aug 2026
 13:25:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803181852.491437-1-almasrymina@google.com>
 <20260806121631.13175f7e@kernel.org> <CAHS8izP=mgsdxv3AtjJo9JY5OHC17zeX-VbPPH_gFF=Ndb_qjw@mail.gmail.com>
 <20260806133435.38c34e31@kernel.org> <CAHS8izOU2pxfQH0Wo1DrqajOb54wv3Y1rMryGpwjNnoUsEufew@mail.gmail.com>
 <20260807145444.6acf9c08@kernel.org>
In-Reply-To: <20260807145444.6acf9c08@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 14 Aug 2026 13:24:48 -0700
X-Gm-Features: AcwNN1VWfc5e7OWOu3ewX7hzzrDJda9wrX13lGkA6AbZQff5o-vSR9tgOESKuAw
Message-ID: <CAHS8izPQn6a_eUgeL5otUESTRud1COHXg2SuR5g9qce1xJogvA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] selftests: drv-net: devmem: fix 5-tuple
 flow steering
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 2:54=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Thu, 6 Aug 2026 13:59:53 -0700 Mina Almasry wrote:
> > Do you mean forking all the test cases so that we have
> > check_rx_3_tuple and check_rx_5_tuple, etc? Won't that be annoying in
> > the future if every test case needs to be duplicated twice? And
> > potentially again if there is another deviation in driver config
> > support specifics?
>
> No no, I just meant a trivial test that installs the rule and maybe
> sends a packet to check via getsockopt(NAPI_ID) that it arrived on
> the right queue.
>
> You can probably extend ntuple.py instead. I was thinking yesterday
> that it's nice to have all zcrx stuff in one place. But in reality
> we already have a bunch of scripts testing zcrx so ntuple.py is
> probably better.

Ack, will do. I assume you mean do that in a separate series. I'll
submit another series that extends ntuple.py with 2 tests, one for
3-tuple and one for 5-tuple flow steering.

For this series, I realized, yes, patch 2 is not needed indeed if I do
this on my test setup:

sudo sysctl -w net.ipv6.conf.eth1.accept_dad=3D0
sudo sysctl -w net.ipv4.ip_nonlocal_bind=3D1

so I'm going to drop patch 2. But I still need a bit from this patch.
Without setting the flow_steer=3D arg correctly on check_rx_hds that
test case specifically fails on 5-tuple drivers. Let me know if I
understood your feedback correctly.


--=20
Thanks,
Mina
