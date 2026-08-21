Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FDE38E8BF
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 10:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307504; cv=pass; b=A8PU4jFmtFC84E9o0ZCf6CsoUZ572KpYbwdTUwCj2JLeV6imbMAxY7aUgywE/PJbPX0kWqDYxkmKKi5NTgfKbxtm1axCOdMmBgcalr85fCn5wRN9RlBtkzjOONxZ+fRsFxnZlbgmdqt1oqnSkF21GI9SVqCr1T96G2/HEYeLOxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307504; c=relaxed/simple;
	bh=xTAGH7v9RUm6BZ6hjfHIXTUlW3mZCV6c4dtffHxY7FI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e03r405g5ucvL4srggD2m8/OlFO3TmtWWC91LTeqL5wR3a7W0T+oc3VletKPTbMZVfqNAiz5uop6sDVpnlZEa+O9D+ftDXbhMwHQ7WRmDT3xAwpCrOroOih2L1soOm0RPbp/4VY9iY2E+cFNykrZ6nsPULH0sJJpTpFw5YdGBPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEuzFFPm; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEuzFFPm"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc891373e0so9824325ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 03:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787307494; cv=none;
        d=google.com; s=arc-20260327;
        b=HPJ9Vhvtsm+lmTGiq/Q7GU1YFzy91TFmWuUVmA1fPRdhE19ZRIoHUbeSSGQsvym9j7
         12B33xv+3wzB2QIkGKRdCgcV1WjiPOiQ6RptUx3iEaOYvVzgjAxsID1v9/aEZLuBY1fm
         xyR2Kd6HntbyH85xh+ds8IasmCCQteLOFt3XmbPegvuAgHlsnxiSu/L1TGjrrDn8oeRb
         l+ExsKD+ykvhSDQ6l6dKNEypkKc89aaYWqn4X3Pk0CY4AzUtDBb15Uid2MWAOdTizW9F
         CPdi0mGNTloTjFgXxBjUOz2A16iSXGUf4edQr+lBWMZkLmdsckI985PbIkn919JizifC
         L+Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xTAGH7v9RUm6BZ6hjfHIXTUlW3mZCV6c4dtffHxY7FI=;
        fh=leKauvO29CoSyQOhqSx971sNuUpMt23JuMNIrZzthMk=;
        b=YX2SAaWYqve0UHPNR2cHstUjDZEQ2tAzPV5K4wvkHqFipmco3l1AIB6mEjuECC58Jy
         UCKnsYYgEfoN6PHFIBFy8NTAme2NZxGRHFTcFMz8FATsOH2hsaVb6JO6NlM48VxrxAW6
         MgQa1tOvJX2kTuyCtdlHH1jg2o+yuwAtIalVn2PRwqZ/RJ0SwTe1gPrj35QaAzApjh2o
         o7CAMmZ848Tyc/BNfKR0CrF1+ZK0KTYJvTP0wGlTECqPb3lu7akCoIyJ6WZOvrYONbLU
         6Y6Q+gdFgm21cTBqZzUbAQ6Qk1YXTWdFgpoUKjfsO3wC3gpRfnjpcRNE4lHTaSiv4N3q
         avlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787307494; x=1787912294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xTAGH7v9RUm6BZ6hjfHIXTUlW3mZCV6c4dtffHxY7FI=;
        b=dEuzFFPmRoCRIWGKpHy7no72ePKyRBpMd06yxknrO8ez9U4RIztR67rU6D6DiSYurn
         4Z8XcgCWmFEwehksVaXp5EMHHapeD/ElBConUYn77pAg7P9BIHJbwZG/l6qUmN3BTZNX
         k8h5f2+/tqmsVCz3vrDKDq4TKOhnp+4pmvRPTmM0Qz2gy1bbuAsww+qz3YMffyXQRRNT
         wKQW/k5sbk6yaSmsc4r8mhwFfK/g6ADAZDw/XeeGKIm4UWLvxv0Ruq+gHLYNdfcGxZ48
         Cz0c6ubFljeX9lO0tVV4jB10aOgtfgM1T5pozU9Nx5BCN8uCon9LAc+58a06FT755AIP
         btGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787307494; x=1787912294;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xTAGH7v9RUm6BZ6hjfHIXTUlW3mZCV6c4dtffHxY7FI=;
        b=fsad7/kKWBPlx92mXHpenkKWMPQJ/WFvFdJfNmEp+HcX4lRIO4OF2cVjOaS0nb17NU
         vXBw5o9zADsf6hI21+cbbOWHL7Sel6xlqo7xPruvPUCwMnmSAhP4k7SpSj9uatiXOTzH
         BvSefZ/61zZAJkebFZfIojcqGM0IS0zqfubk/PD8mqzy+dx0pi6g9y3RDCLNoLpsAAsc
         7oh5NL0cDoQNmPCgFEIaoOIpTHwoPgj+jBtdRJ6QvPsNXfc6xfVLJacHpc+5Gxxzb4TD
         QyjMM0ZNpQSwtwLZaLGX/7ygK1cpW9h7rPeNJtO0wRaw61CQNjn1dzlSnShCa9Qy943o
         bS3A==
X-Forwarded-Encrypted: i=1; AHgh+RqcX0h/9LDqC2/fXGl/5s/42kxtHxYd/lh+UiwGWte4vCnVobp2dPuPt4WVHUhBey8wHOz8XPhsCzdXEchlTJs=@vger.kernel.org
X-Gm-Message-State: AFuF++leXQtjYPQy/a2F7ff9907t5oHpFSKmpDpDNdJvwwGJ3RwfT1KQ
	kp90MU+b95dziffk0hz9OF64K0JXyV2JAL4sO1IEEB3vVEl88cKkK88T4MUOTIRrK6y7ZdKczre
	ozX60+ALWKFNGGc9SQZBwAfpLiIcAOVU=
X-Gm-Gg: AR+sD10FPccuUdUnHg5x/V3KOeYkrd70v1Ye/iaFAutqkJqngikoPQYRRCrrHB1WXr2
	P2lWeRpSKCLR69DdebZtLM5nDnbgPPLX2+mE2DlZb4adeNynGsBWgUFm7jgywJpzwfpBvm9mw3Y
	hyAYMqJy35HzUZg7XbHiwDT4QsS7ahk24qtbItSjQQAEWOGGGlIkpXNUHffn8M/p2vUR/+rlBR3
	QBj4uAa6SqX2U/PEvWbLFmuNzAyWLkZ2FH6CpErd/lM75pcpmFJ6Z0zsyB7sJCwUgVjxzyUytVK
	6D5rJUrZHfRC4rt2edHLc7sPajSJJS/PkC1fV3HUPVzcJ0jsYgKeQoDVv0iHYC+uiU/gNFFgC/W
	tQQ==
X-Received: by 2002:a17:903:354b:b0:2c0:a555:80d6 with SMTP id
 d9443c01a7336-2d64ade4a69mr104277895ad.2.1787307494193; Fri, 21 Aug 2026
 03:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818-lockdep-kunit-v1-0-66ceb1a272e3@gmail.com>
 <09b0ce81-0071-4df3-9f0e-a54269d04c97@davidgow.net> <CANiq72nNVQzO9gUcj+Oh1xEBWJv1_YxKeYpNTdhoNaJyhvOtmg@mail.gmail.com>
In-Reply-To: <CANiq72nNVQzO9gUcj+Oh1xEBWJv1_YxKeYpNTdhoNaJyhvOtmg@mail.gmail.com>
From: Malte Wechter <maltewechter@gmail.com>
Date: Fri, 21 Aug 2026 12:18:02 +0200
X-Gm-Features: AcwNN1UaLKjiN2bvD5r1kFIy4hENw9KTyMDvwAOIadymM45wmmISvmU3B-9ZXVw
Message-ID: <CAPB1BzcM+6zyRnrNOOWkE1Ni-XPTRUxVTZdtxG9ZZ4By7JjGPA@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: kunit: add optional assertions to catch taint
 and lockdep warnings
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: David Gow <david@davidgow.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den fre. 21. aug. 2026 kl. 11.04 skrev Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com>:
>
> On Fri, Aug 21, 2026 at 11:01=E2=80=AFAM David Gow <david@davidgow.net> w=
rote:
> >
> > My preference, however, would be to have these features added to the
> > core KUnit implementation (in C), rather than specifically to the Rust
> > bindings. This way, tests written in both languages will be able to
> > benefit from them, rather than just tests written in Rust.
>
> Agreed, I was about to reply with that, i.e. if this is a feature that
> is worth having, then it sounded to me like it should be in core
> KUnit.
>
> Cheers,
> Miguel
Sounds good, i will look at implementing this in core KUnit instead.

Best regards
