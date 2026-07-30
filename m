Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C75030C142
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 19:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785438627; cv=pass; b=KSK1KjMthclgu5IQxIBN02qpAfd/SLiXNt6l+S719MRWKvoBauBsPT/PJ7iYtyygZLqDbiDxsBPUmTREjvl23Zr+oRbQ4dm2j1rrAnT1VVIPl/rtPIRZRvvY5wPgdqT1nXiaQZ0nZKfa+DtZzRvKc9kBUXqgshdbBBjDXCAxblA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785438627; c=relaxed/simple;
	bh=kr8L9VZCN3nS7ZLylL5loX2EZot5rXBgCgp+oAd7zp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXxBs7OyI7ipbYcu/XBhLzMbkYiRTlpaRAUJjo7raa2/SMXScDc7iAlTKdIHG+EiChLNf9k0KSPp/y8bEZUsY8xMiNrVrNCHYqg59UxowCQ1yNDl1ZhIYVTkxPETZkgc8cqlTLFLgljtUeyH9C1PS2XL40+isVVl21H3HFJ8Yxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=veBgQr61; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="veBgQr61"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cee9b74ee1so1096175ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 12:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785438621; cv=none;
        d=google.com; s=arc-20260327;
        b=ZPeEWGgmjIxRl8fAcxS4f5I899pHsOXw3i2N2o9OmUrwsUgmS3Hy5HNmurUtQjIMby
         gYZ8rnTXqIHU3kLJS3zWQMO07M6vxNtRxoDpTw+m4RR+73jCLgYq+F4XrXLC9qkvqg7R
         /uhiX96equAEtzGTSRBPsNVP0Y8Ak2eWVUiTWzxxdVUBTvq5GSbaBQHQf3WFGjSUqjUL
         XC1sB6ZRqcSDFkzZjvHm+gEvxQ4xPVcX5fgJBCEjLLWukKwXguwl2UwcU70EnSR+lmzV
         zX9G0XsTZ12uxL/rOcIuXx/dq+m8PWR4vIxXZwvMnNOxiGCsXbkTu83wvcnEl73KH2t7
         tmlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kr8L9VZCN3nS7ZLylL5loX2EZot5rXBgCgp+oAd7zp0=;
        fh=Y7+5YBMcBjm66jxDgLW1rK5LsFwfY6x6tDaZhHVauEs=;
        b=NAdC9Eui/EJ2PchOa1alBooKgJPDu0QWmyIv5gfweAC3mGQSGfRMEn6Tnns42obLTJ
         staX2vY8yLDymOxYNNUD56IEGNjAnkzrthCA8EWqQz5ndzwL6IWBGWFI5PwYHKyeP88p
         ozBjBkRcHj1+JD2npfGxfc07zOOLzzLK2/ZQ6YtGrZEbGD0/BsYYEwf+Jp3D5Q2S9Bn6
         GJetN3dJv0a72w9nv9uOw3G4y4ZAl4rwjJ0XV8OFWQ6l6j/jQK249ByVnWW5uvD98u9B
         0gXfNU8vhdlavI6jN0T7a6WH2zy2NBJEIKNm7B10Ifp7DjUmxdgGOFkWMG4sRyW4BGBK
         bGqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785438621; x=1786043421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kr8L9VZCN3nS7ZLylL5loX2EZot5rXBgCgp+oAd7zp0=;
        b=veBgQr61TB6pByI4xmxFwDBqGKSNCZUI2/knttKh6t53Mwb5A8Udfv2Z5/zfVqrV1X
         yVaL2SUW2AqrLaJkGF6rFQOn1t+lb26SohPjVjgXdTjUZQuFIh+qWWLNRkb0DmyP9QnV
         MnHbK5FQEnlQQ0LipsUh6vqr0Qn+PLFq6ZAbb2QOctXupHbCkU8wPFs59oDHeFAg8dw2
         OdjYXAYGSgXrWtRs6nPlT9ivZ5Mn7DHsH2Y8ul2uqRkeaR/nuFxAO114l9+fv4+ghkpp
         U/NR1X++q6OluCUzLBIdB34dz4N/6VR/4Ht6ebyOVZnRoxy2G6Ni6VUUW9SpV2iD3lVd
         bQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785438621; x=1786043421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kr8L9VZCN3nS7ZLylL5loX2EZot5rXBgCgp+oAd7zp0=;
        b=g3Kc6cvFReBNYb/enN1+FWHM3XMnKXFoGv8boA+OAm8J5HBzuQZ/7+ATMWFxP9NPPN
         tGrZ6WJZz1cMcTeLFKq11X3ok59QwrIR2y7/EV7ObwqHqJAkrArfza3aSouD2hW9Dr5I
         1ccmybT3pY8svW4YBdf2Q+FRThYgOFPOyEnr3jHS9PFqo5buZ4ejOQweF7f0Qis9kVBQ
         JRbfTcUrkTRC0q5tZbR0ka5Mg8XL1tIXgLkHg92dZjHwRP3ZdHwH0IKSJ6Wa7VFZVaC2
         mjeQe99kY2CzW1GjblGxS4MQGTqjMkjztW31hDeW4j56ILodQnBNgLmuAHxL6u32/f3W
         FF5w==
X-Forwarded-Encrypted: i=1; AHgh+Rp79aK1/bLw3czYQebBYuvQgvCDPrnuhTTrprVJc8U3CmoC1t172H1dc2zxOWnJqwxrO39u0CFOZkA9VudmoIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ4Ua3bS43bTwxDc6jTwyBzWC5d7PNuoG3S40G8jDoUYxZ9jf2
	T2TxzZz7ErJfemuitnD53zVfCG0BzCR72aP3ksLmNrAct0kvxgvoGCu1CWbj2baNY62UeLiNCZT
	ZjzYg8fkGN691mhGtS+AADSuu3cviCTpsghJNRSI=
X-Gm-Gg: AR+sD11+jDmV5hD7R/+OA942QMz+BVy+Usoq1dcG/nTWKYd/fLzE4U8Cr1pGkF91lAp
	+dRuGKEWlHwaS1g+4Ng5KdyMf9DckAoaPNm5ydTgRQnPaU67S1XsZOmO/+P9k54EQt5NLIsPUSp
	zark4IGJOVN0mqFkK3c35uO6aVut9FjzMky3pKGXqtrLpc0/VD20ayjuZJIW8Q6i9zfoUunYnFx
	USyf6deOnSWxQbRSj21X3XZsKNs+t87D1/eDYOGH9YtGWMYoM8kItZ+LFB8rUg3SHzBo4tFB9t0
	lPCUwKkeiE3s6A1g6fQAj3uIkQ6qKZ0B/Vhy/PmC4vLt1JIM+HEH0Oclx1a/4FzDckIqJ285lVl
	Utg7drkcJO6fR8Jgqs5jftQo6cdZDfCGYGXvikapyfso2nf1UPbosq7QvAXKcrndvvrthPmlB
X-Received: by 2002:a05:6a21:7305:b0:3b3:2703:115 with SMTP id
 adf61e73a8af0-3c9004b2f98mr3261296637.16.1785438620884; Thu, 30 Jul 2026
 12:10:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de> <20260730-auxclock-nanosleep-prep-v1-6-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-6-cd8b61229a7c@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 30 Jul 2026 12:10:09 -0700
X-Gm-Features: AUfX_mwySuDn962xIniqMzPklRpi8xF47aXO9YX3CJA7oXvkGjnU-0gExKE-R_w
Message-ID: <CANDhNCoBvOuZ53phaHnkZX3qMyD9yBdaj45xv85FzjidSnMpJQ@mail.gmail.com>
Subject: Re: [PATCH 06/16] selftests: add clock-helpers.h
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 11:47=E2=80=AFPM Thomas Wei=C3=9Fschuh (Schneider E=
lectric)
<thomas.weissschuh@linutronix.de> wrote:
>
> Multiple selftests duplicate various clock-related functionality.
> Add a new header to collect and deduplicate those.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh (Schneider Electric) <thomas.weisssc=
huh@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>
