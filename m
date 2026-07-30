Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DF7463B6D
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 19:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785439801; cv=pass; b=PTm4sGXrNgrhHKeoTufN/KRMeQ3hz+PxE9yFhOw9ME9WUnADRLI1FH+8wFqVnfop9Xe4JI4ooG7cFIcQldJeaAULnFASVXHJhf2Km8W4iC/oJbscqty+FNqNtZAezc4Gfzm2Vq8DquLhmfM5q1fioMt6xDYL1vTgeWT4YgOkpbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785439801; c=relaxed/simple;
	bh=2NlYU2SNV+PDancRDvE9pI5v6yTzrQPcrXSmx3A1iMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q09OZTKKSZlgYG8s2DE3KG7baA2qtoUwtqO+Cn75TIuy3G0DCUQ2O49m/8ZmOKV5URiW/noMeHipL8NeN8iBXUE4ueOeNBV4xnZ4oXllN08nfofFbboODu1dHDWHpTNy2TWzYdt4JPB7bnwn/fhO1DD8zjvdMRPHJwD4IRRDqmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xks6MDn2; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xks6MDn2"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso116339a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 12:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785439797; cv=none;
        d=google.com; s=arc-20260327;
        b=X92uoYjajNmINRn3orUxlFIgmxGo5a1e30F6OOsRL+nUuFDUlfY3Tnlr5cgaLHITA6
         fPkHYDtBeq2ENE1TxtqM92tdqZS1TC4QaMbkqaBewqRnBwPiLYpcYnH9IJcPN143o1pR
         LvFGU/vC/5EWq7Ipm/vCzTEeoq/xRxTI12x9cPhm4EdB3NqZTK5d7AW9a8TOibfQ6Bsv
         MBE6S5/E11OkqNqBCjGBw+pXCaD8nAXCsTV93GxFigUm201cLEyGEniDfJf8JczftMwF
         47VSWdknMwYrqFtsxHj8/csawP+L9/01pA8AZURT7NijZHYw3ZdH6EbNwSs1hG6+4ojV
         wJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2NlYU2SNV+PDancRDvE9pI5v6yTzrQPcrXSmx3A1iMY=;
        fh=/oWrGkPH5K2bsq2j5dJjxLlbWyPRosf7bd2nz0hfqQ8=;
        b=Fem72BYZPluiPREEwQnv/E19votihucTGQUM4oTs94m+lU/PHfKsLFgi84PqxDBK9h
         aUCfd3brbL+fJ6dnITl2EfliwpadB29tRTWnRhb5QkYQVR2qMnUkDcGI/reaLw+tfghx
         TJgz1bp/YcDM4llbctE0sISUMx+lDoS0ORg12RmZs1irX5t8Te6kVsdtmCHdNTA4PcP8
         /IKQb8S4rWkrnMosl1aeJ6D41ABzPQYifmPoE1Gb0WPIhdQGonSxKxi2RavfAlnk8/dR
         Q0T8wBYtQp9yit5SI/ZOH2pbu7Lk/JE55mHFdAojZbwehn7KzE//MUf+eqVslZkJI+Gw
         BJsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785439797; x=1786044597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2NlYU2SNV+PDancRDvE9pI5v6yTzrQPcrXSmx3A1iMY=;
        b=Xks6MDn2ZebyIy8FL0UFB7+B6S79rOe1H727mhgucvau4asfZaGUEC5+kiCuTKyZTP
         /+xUPzvknXzTxKqNWUawCuwYy0R5mAjIhoOm2SSNjjkqkgptzmlplj65liiFBCdgncMr
         wm1FirankA5ify1tcwsLRLBXUyfrAMuy1GlZCkcygXfu5MJMJuNmQjsA7U2sTGHjflkY
         Rw/123yEztkcOouVg05mIfmsZ4ntJIAp5TFOq59xXQmZnCIZVdLJlnuWhnMeb8IHsPPn
         z4oJBOzjc769S+YCrBlQKxAlfSfSsMyhigU5kVPUXPkulrKeTHppbQTWRLkL0X07yNkr
         Fu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439797; x=1786044597;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NlYU2SNV+PDancRDvE9pI5v6yTzrQPcrXSmx3A1iMY=;
        b=SJvoaN/ev9QRxYFpA2io853bddcy1ideg330dUUK1u2UTIRwq3bsv2miZmxB7L5pDw
         /I56hn5s3OtTU+OEbs823Rg6E/V5qAuMWQEzaLx/f5iDtyCd9bxpoRFXxysCJdaWEkQD
         5SgM6fKZ5mmQZ7ND73Jqku8JQt8arFT+PMRV2JiMQsBoZpUh5A55ErsLDn1cRCBn54L1
         Na6K2oEHyjaRN6MNJh9P0EYGN4b2sy6qZ+vf88FaTFbilQUDc6cFfmSt5CplhjzzpIUq
         f0unKelRz2BTzSS2o38NfjQh2VYZ2pxcOZ5au9IYFZP4U5d4A185UNpmsUw4DEJByJ5i
         02fA==
X-Forwarded-Encrypted: i=1; AHgh+RpOshc6tfpw3nNI4AayEMYyfDDq4gJ8VR6tDLRNK5IcWCOuuiSH3AAos8rCZ+Sva70vbs3jf/bpzmqgvOO09HU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7MDB5qr30HD0j4i5HHkO+279k2Uo+mAOnZRsfxrKkgTQiL6u9
	uhw+YwoE58m1leUEo/DKaAWta71c+ZrFeHDmUHVpvSTHxs1aC6N5i8z8hvJHtpUeYMl9Fvgq7nv
	3mKlybyyBnAxUpADvSbcEyUYoLm39rL/WvWirALs=
X-Gm-Gg: AR+sD13pwCfKuwVmwPPIqxjBwWQNQTLQOKPybi8GqU5i6nJ7xD7C3kL9RHE/V9IjtP7
	2xQm/BlXIa9yxbZvI9p9b5inh2Ccmbdsbm0R1HbnBx5uD3ahsnbSRyFESuzCyLf7HfuhN2rH3Kp
	hFREUQirqRzJecL3Bw9OIaKodVd2Q2ObeZ4/vROekj7m2uObjP33M+sZYwzwK//uOwIiYlB6KyV
	AF3BH8yMU/AHSvPUfHQsUkAREOuwa9UgNM0hZy1t5QvH3zME4M5tIH0G+UYbJofPY3LGOgmEhsB
	NFIfzrRNqVPxze8utX5CLELHcHLFTe2KBjTmk+g5FhztdOT/F9pf5bpwFxG5CfIRBSg8YGZVd0z
	OsdKls3dnIytMKBn61oDu3BXIXwMBkC/2EFaSiB6UtWuLubvamibU1z2LUKld62xr19YgGBJi
X-Received: by 2002:a05:6a21:6b16:b0:3c3:8222:b8c9 with SMTP id
 adf61e73a8af0-3c90d6d0d9cmr1565532637.67.1785439796532; Thu, 30 Jul 2026
 12:29:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de> <20260730-auxclock-nanosleep-prep-v1-16-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-16-cd8b61229a7c@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 30 Jul 2026 12:29:44 -0700
X-Gm-Features: AUfX_mxN-lPb9g6uwgWXYcTj1SLMCZTKRnZheIQzSQPvqFoi9Nhg8-29NesKRHg
Message-ID: <CANDhNCr-STsjHfPzBEcpF7OMEkOVGE+3CbQ18kv-yvnHjvaULg@mail.gmail.com>
Subject: Re: [PATCH 16/16] selftests: timers: nsleep-lat: Check all calls to
 clock_nanosleep() and clock_gettime()
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
> Both these functions can fail.
>
> The first calls to those functions are already checked and result in
> KSFT_SKIP.
>
> If they start failing afterwards unexpectedly, report a hard error.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh (Schneider Electric) <thomas.weisssc=
huh@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>
