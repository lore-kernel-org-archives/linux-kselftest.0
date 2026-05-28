Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3625E332612
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 22:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005702; cv=pass; b=Kavx4s+qdgjnXxNHvVtSLvdZkqzQdPp1bGNqSGRtrCT1t4m8VCZgLKoAexDQpqb7T/iaZK0wpSfH+01L/hWVFWhGwyB76otG3iper7PPzz8mrDPHVgDbM+I1mbKK8xOUpMb57JuAiVqWBxf3FUy/kq/0RhImT6jU0WflS5Xk/Eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005702; c=relaxed/simple;
	bh=KDUmXU6pA8170xUyOTNOJFlIuTnys+uoNUwB2I0VqRI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=a/VbnPgazXwlnaP+Hth28nGc8hH2mGX/QhUcZGTLEd6oySAMVLxr1KBVkFoEnVDJHidxVB7r9nlku7v1EMGrPVFKGX08lVVGDUAsMOrUX06+MjBmN958dtxfDUk6rxT9n4rj3AUntRQkr3qgzCryU/9uqI6WrtXCpeDV7ouYRBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2O8SCg/; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2O8SCg/"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bd4f7f05e90so2285486666b.2
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 15:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780005699; cv=none;
        d=google.com; s=arc-20240605;
        b=RkgPH4xACign26gY4ulNjlY33H6x1n/x9rRw8j5oNK2XL9UzUniUvaQydQSJ4XJ5zh
         zaQn7Jy3x3eeUX0crjGX9JfkfnGDjLTwslrT9fG7pChAM67C9wHWRY8PQy5KK8xtOfn8
         iGlpDfwmALAEXaDZ8BccNVdSte+t3Te8eeLB1l7Y6Ciavu60xyM7dNp2Atx1Fh/tvbHx
         N3bn3BwO/hhijZ6aaB8MKuIWK//BehJENSpvz+dMf6E+68pbM6/VyT4UxDeZ2QGApBSJ
         Qicct7KLyAVPWzTYto/+Pr+hTczMDeA5EBBx8Za/ZzD337ThNmEuyoLVpK2VTOTnvg2h
         Z3Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:dkim-signature;
        bh=KDUmXU6pA8170xUyOTNOJFlIuTnys+uoNUwB2I0VqRI=;
        fh=1jkfELgQJkf5nvB7fo6C3Q7tZ+RURVEOtvsBzTLRITA=;
        b=lMUXSBoaWl8my2w8kNWM5tclOkT5HYb7csf86LJrwhuaLps8wfVt+R2xCCMxMjxtOW
         soY81Ui1Ttd6N2VdvQ9uKbC62EYebvOAQgvHz+NIlfHkIJgbC8Hbp9MpKQsfwH7QJi9b
         udWr0vu0hsOhJfFcvsIfktWYXzH1rs7Xpa4Gkagl4pk1p2GgofmNQmBiW/hYKRAA3WNq
         Deh7C8tosGzoTMXnJkE3pYNMAo2oA7bncYb1VWZ3XpOPkmpvas2vwkvhh8g1Fpsc5I4q
         N8zeoAZA8NFWvl45IA/D7SpdE9Pwt+vONWQI87ydFPbDIi1s/V27kgIdR3FaW05/hoQy
         Q5vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780005699; x=1780610499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KDUmXU6pA8170xUyOTNOJFlIuTnys+uoNUwB2I0VqRI=;
        b=D2O8SCg/afd+owKuMNO/84ccoAnUpnvT8XHxuD2kBQ6uIlP1+6WPBhGQIbhDLlCNce
         6inYUyBaSGlQrgK9c7v7y2ujQstTgDGWHcc+lLe73NL6qIIK1yCOdEUF13+b4YW/SIFz
         HDT0LSkCVGr67CBdnaXNf2dUkM8RvTlmQCwIbv9OIoyDHYBk0xUEorrfi5dsoBQvLUhX
         IeO86xgze8yiuE4qUVGYSpT9Cp72fhUThiqp1fobi6h7UM8WAN224kl+awDU/yLNuyAd
         3JUqlZtspfkvakkSO9pO+NENVQe2Eu/PNiD+BApup5UkF6JfXqiHjab6GgP1Io2p+RUS
         UXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005699; x=1780610499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KDUmXU6pA8170xUyOTNOJFlIuTnys+uoNUwB2I0VqRI=;
        b=f/MG329ONi/gS2odaGvQ95S0ViJ4RN+Nb+fz8j0wUeOgFW7B70/t9zsCT4ih+AHtYt
         ogJDKffJuXeyrl1XckZsCqfx/v/B01vsIIt1G3dw4pz/IBFf5jeSBVofz+LvBnO/jbwK
         COCFWCWkd4RbzY9DECVKzZ/uCPNFY0q/53E7xeIVSjOxR3XWn1n6NcvV6nVhrd18zFdE
         TuYUEybygFnIyej05znUaWNmGBAomUcaz7XMXQLS51LJWbbalZdXuam9gBFRLj93mrse
         XRH5FGjamFai03XU/YBcutUkUtcnTH6mFotpS7caR6hBHu7pXju1lT0ZnQQlad2BONTS
         HGEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8XZLUp+qV+t9L1TADIzwexJjomeU8pocEEVWgAk7gjSEh3QR51TrMIuZmxmqBicWZ3ANFT9jlltArLbqZcblI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbYCPgPmfMX0FBly/fT9loU7dUrmgZwGx+YR+b7rs932jevgWw
	KGu8mUuQ/BcN+smcCCND3LYHO1ZFCEDujcRAKAi5GSsEB8VQhQuyadyY3NvFPqpMk+RVwRx24E/
	whswIRrQ/Bhf6JU8gYaoD4dNt+k6y21E=
X-Gm-Gg: Acq92OHSFaK3VGq2AYbArop6AeLnFShFaruaFgb4Ilo2xSND0S6U/MjtwhMu9UCo3O6
	Sn1GTkGi5DmAkoxDxowmqpPBfCicSu0/MpoFKnC5dJseJLAlKQMfSkrmZKDD/JTSz1q66DV/sEn
	0WMeJSP/R3BLsp4LEaYWSTA7hTOm+EfavSO3pepU78xXVmOt5+tApgm0gsAr4awiA+cQJ8UYOlq
	Rqyoz1nhQ6u2OwtnQLIsD/xfRm8FgMmcAHXTMNn6EoU3+pm2PfshUUG1cbY88CjyGy2J5lWTMh4
	VZLbqlMjoc6ckWcVF3m9Rz3XVXLDcIO/NAcXKT/hBUETNwOft6c=
X-Received: by 2002:a17:907:3ea8:b0:be2:11d7:8b05 with SMTP id
 a640c23a62f3a-be973d225cemr56376466b.24.1780005699259; Thu, 28 May 2026
 15:01:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Thu, 28 May 2026 15:01:27 -0700
X-Gm-Features: AVHnY4I6cWDmc9HAi2Pkjt5rLH3sf-RhVkX5I81aJnp9nA7gfgMJKR79V69XtqQ
Message-ID: <CAKSQd8VrNC5F_7c8SCsuJHe1oFMJBCZc97Ez3ZAUfabUay8ZzA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] KVM: x86: Virtualize AMD CPUID faulting
To: Jim Mattson <jmattson@google.com>, "Kaplan, David" <David.Kaplan@amd.com>
Cc: Sean Christopherson <seanjc@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-kselftest@vger.kernel.org, 
	"ctpence@google.com" <ctpence@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> It appears it was a deliberate decision, due in part to the fact that the=
 traditional flow of checking CPL exceptions before intercepts typically ap=
plies to using instructions in an illegal way, but the user is not doing an=
ything illegal here by executing CPUID which is normally a legal instructio=
n at CPL3.
>
> That said, clearly the behavior is different now between the vendors, how=
ever at this point the feedback I got is that our architects want to stick =
with the existing behavior unless there is a strong reason that it is a pro=
blem for SW.

What is a HV expected to do for such a CPUID guest exit?

--
C.
