Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B8734DB4F
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 17:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769707788; cv=none; b=LHwhPO3ECXGoSegvffR4XPxQteQO9ey74FL7JPbFyU1Oy+ggGAyYeQwrD5EL9j5LxJJWT1GE7mJL7rPhhT4gQRjrsWn8SJZH/9bqywQ8VqwxcrwtRlkMMon6piZAiAc5b7KFXohjO7AV1JJrobiCsUr2kWmAXcE3oK/bN5aEP6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769707788; c=relaxed/simple;
	bh=be866/Yp5BAQJMoBK98y8dBJLQ2gHvccZfOQ5Qw+jAY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EDDVQ062v2VILgQDux2vqgwkFL8lJWv5nAizMa0CqHlO/hENeVvl+eCPJLHNP34oNcoJrkfFFYooOu6l6emkbGZT+7E+ipE6xY7rJOfrSlA5InpMb26knU4oI2n1zagMaTyA40PFIOIZ35m7IHf4ZOpcFSaoFpG8V1ChFH+QNg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wHwIu2Vl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wHwIu2Vl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so14181865e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 09:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769707785; x=1770312585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=be866/Yp5BAQJMoBK98y8dBJLQ2gHvccZfOQ5Qw+jAY=;
        b=wHwIu2VlC51zeYSWrFup//yLPuyf8rJC3TBNiTTLUi0VzqQrupIgBaCJ/AzM2VxAmw
         Zg1Xi0BlHaY/jdGN8iIeD2Rydh/xwPBTyM/STgtUm8+90oPOJJNXvvG72yJfnKVUB5nE
         p8ZOBFbd34St+Ip0pfYaPSUEpFxBTY9pdfhF3+XBsB1amjfdtVK/8UjhRPue+rnh51ur
         FflmD70zt4F2+5ZZBcN163zATMyhb8zTFn47J1Zok6xknh1nHlH/WjTZ2S4b2leHxWLM
         bM4dLlD92K6ZDAdLyNddhrbwye141vcvymhr7mqc3BrBJPy3km2AfQNFEBJaZBTY9ypa
         bKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769707785; x=1770312585;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=be866/Yp5BAQJMoBK98y8dBJLQ2gHvccZfOQ5Qw+jAY=;
        b=VGebxV6pR72E9UtaH8jeYT4ObVGJRxScVgRnh0YekdHZrDRdp/7D4idIlD/kTNWHL2
         5EJ7n5LKO4p9gM3W7Yk0g4qJTMIHuUjZ2AHbfGo+uWq32PQv4GjGVJVirVBnej7VncZa
         0Kn0TvPWCKGd0cwuYDSanM/+KwDy9v67myiv2NGPKdMik54e7xmHxbevxW9ngbdwK3La
         a/gACMuQabC0wBO9vU4hH+C9iv5VtDAn6WZ9Kb1yAq+aG28GZeMowRTE+v1bDFrOg0iG
         ab4IHkZhoe84yQ/14Yaww2BYK7r/G/IsWkTm7rVE1j+a4P6g/Mhl0puSLnm1/0IJzqCX
         fSJA==
X-Forwarded-Encrypted: i=1; AJvYcCX6Pe6ZqnhVsT05qfApo5OjiKUpdu50Yks18+Yp3CJ4DR+jWCI2YhSk1DU3JBpHIxEbn2VEcYsclWMSaZ+51Fo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv122uRyn/PBG0Appj5Rf3Vg9qg1n1J2Yaeq3I40AjvV8wZtZV
	LjiG7O/8Q9FglgfIoYuxJJRXP3QN6uFi0+Dz85FBKuZBnd7cNj/kTl/itE3hipI56Bs=
X-Gm-Gg: AZuq6aL0b2uXn9bp90t2Hsj48U6gBoI4f2IKnriqYSMBU+WWRAjEIYov+ZqifA2PNSo
	QCxwD6R5Ght/6z75txRbWb7HD5AFg4qrOP0oKiIsmvDQq55ZgsWnMgPD2aewnzSVduFTI4XrlqG
	7hU4FQ+8CpG3KKM9mhwOe+zy81vnhODhga83D33ao3yAqouF7wQ50fy5P9o4hXCUgt27mQI9Doi
	akJkOR2fnJ55wEmfHQVyQmgpnxg8cxUHqbMtFiXeQ1frwqo9dpVHcLOZanrao3TedPfPLlc7hdU
	UzP6c2Nx9QBjr2OJU5VHKL6xG66FbABcn7g8t8JccIUXNlrnMote98QCyhib9VOQ/tecW4unszW
	Y1jfXxqXPgkUwwvxXrIwzyc4e7UN2vQSDJQ0lPhMsjr+bPfDzXmtEfY31qacMGZuzXkOmBOZfm1
	yzmOZotR5GyPU=
X-Received: by 2002:a05:600c:350b:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-48069b9a017mr121874905e9.0.1769707784613;
        Thu, 29 Jan 2026 09:29:44 -0800 (PST)
Received: from draig.lan ([185.124.0.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482da8eba27sm66755e9.6.2026.01.29.09.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 09:29:43 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 067175F878;
	Thu, 29 Jan 2026 17:29:43 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,  Joey Gouly <joey.gouly@arm.com>,
  Catalin Marinas <catalin.marinas@arm.com>,  Suzuki K Poulose
 <suzuki.poulose@arm.com>,  Will Deacon <will@kernel.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <shuah@kernel.org>,  Oliver Upton <oupton@kernel.org>,  Dave Martin
 <Dave.Martin@arm.com>,  Fuad Tabba <tabba@google.com>,  Mark Rutland
 <mark.rutland@arm.com>,  Ben Horgan <ben.horgan@arm.com>,
  linux-arm-kernel@lists.infradead.org,  kvmarm@lists.linux.dev,
  linux-kernel@vger.kernel.org,  kvm@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Peter
 Maydell <peter.maydell@linaro.org>,  Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v9 04/30] arm64/fpsimd: Check enable bit for FA64 when
 saving EFI state
In-Reply-To: <76bf33a0-968d-4b99-a157-3eef076af69d@sirena.org.uk> (Mark
	Brown's message of "Thu, 29 Jan 2026 16:41:05 +0000")
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
	<20251223-kvm-arm64-sme-v9-4-8be3867cb883@kernel.org>
	<87343o8jay.fsf@draig.linaro.org>
	<76bf33a0-968d-4b99-a157-3eef076af69d@sirena.org.uk>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Thu, 29 Jan 2026 17:29:42 +0000
Message-ID: <87wm1072ex.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mark Brown <broonie@kernel.org> writes:

> On Thu, Jan 29, 2026 at 04:39:33PM +0000, Alex Benn=C3=A9e wrote:
>> Mark Brown <broonie@kernel.org> writes:
>
>> > Currently when deciding if we need to save FFR when in streaming mode =
prior
>> > to EFI calls we check if FA64 is supported by the system. Since KVM gu=
est
>> > support will mean that FA64 might be enabled and disabled at runtime s=
witch
>> > to checking if traps for FA64 are enabled in SMCR_EL1 instead.
>
>> This is conflicting with the now merged 63de2b3859ba1 (arm64/efi: Remove
>> unneeded SVE/SME fallback preserve/store handling) so I think this patch
>> can now be dropped?
>
> Yes, this should go away in the next rebase.

Everything else applies cleanly though so thats good ;-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
