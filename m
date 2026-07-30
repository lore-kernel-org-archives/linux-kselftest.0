Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42123BAD89
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 19:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785439602; cv=pass; b=NSbMZs5YN80RFXsYIeJjN8sej/g8riAsra5yb/tStlSMSs/FeeZ44Nlz5GIHlekmtQRk8L4DUQJKlgav46ZIm9JjuiQ+W85hjKqI5IiDj1/dfP8ZAiRqrlnvyubJwMUt0kzneC4Gl/wT+KRo6v4NXavMIKoYdmYIjzjMhALOLGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785439602; c=relaxed/simple;
	bh=bb6LlJEaD+pxUjSMvDq7nulMIBFh2L95e4hfasZCgfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lrgMYh0RjsOyI5XuhhHkncJjw8+fEeypKQHeQy51XIoxqg9yyye/zqyjWhxzalD6CA42vi02db9bLOpizopdoaRsko5HaXFfVbZoTwGcIrcWt3LU3Mp09cWlpBaKO+F14XAXlQUtDPSWZ3Wfl5NhdS3rQyWTH4xUWLCUjHwKmfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NoxyRFge; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NoxyRFge"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ceae1ed204so2157365ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 12:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785439595; cv=none;
        d=google.com; s=arc-20260327;
        b=kaevH0uErcTaS2TcggAD6tUjpruQReyA5BKtLi7rpnFbCvyyVq423PInBuoIowix4y
         ZGJBt8rXOpNTiiMAct/AUMkWvlZH1cEMI1tot2IXmDL3dIrPqcw2XLUvkWRGfAk7Ye/v
         rSTtabyudIXTaFdw2S5X4Xj3YoYDjXbh4arw3oN5JQBTSHvmPGaD0LoAAYodtfe7RXIE
         knN8AYsHSko8oDnjYhFWBGKVChQIDA8mZOu5AqmyLIiwLSK9rmWPdCtdh5Zr8Qlwzlw3
         ngppq5LdxdN5DIN5hzhSyL0lCQ/i5E2iC27oqEWcFKV0g5TBRYZvpH64bmkvo9fU5hT3
         YtZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bb6LlJEaD+pxUjSMvDq7nulMIBFh2L95e4hfasZCgfw=;
        fh=Mmqy/HrPOqC2samKFp8TRyrZF2gYtCC+ThMXIHE+MBY=;
        b=GJuizw9ecxxK2sUrs1IAJYJUM9KUG7NXhzrz59YEyzViPfT1KePUlCkBq9C9xWrUNN
         hgqvHULzlw1ktxqLKafv/UwaGfayZL3ITpBj9axa49hGuACOSukq/gx2ZSKmGDBvTnaS
         yetjl+zoYwNj3hlHnD07PuA19jppKOOH2jac3gsCaGpEIYMGjui2uiUIasBVOMk2YTjg
         EWMr0R66ardizk2qfWFr5rJvdfRJ6WXj0PcoNvn4aTahPaZ/gv/dtSSBIi1GZA1ywcAc
         ZhBPCxUm5/KuBFl9j0o3KIQq/vSER8S9ofFZlsAQFvPzOAkaPj/Cy9xuJfG6UfVdZX2n
         5IPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785439595; x=1786044395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bb6LlJEaD+pxUjSMvDq7nulMIBFh2L95e4hfasZCgfw=;
        b=NoxyRFgeFDi07Ueg0yX0nKcjq716API0pV0MnVi7COPBoerDDqinhIYd/XBqjM3FD1
         bGUrHA2apjrFsb8DwvpJGLB0Gi01h8uTbn9xxtdrrnT+tc5rrW/dko08st32WTQRcNGG
         RhWT14CCzEOmDFyAOSGL/ZQQmBy+zSVkfzDFCcE5cw3Ct+jZFZmCrMYHg/5vZTm9XKK0
         GFDPAPMDRCMe0gG4dPe8yS9Sv45kbzci+i8+cvLPtgLCiOVId/yuU4Txl7FYgDRDsU9m
         1MqM3uEsch0O98wXuIjKrSdObE4XDgBuwEBEqanUyLFbVTU68yoSZxgWsaAqlnBUJFV5
         EcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439595; x=1786044395;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bb6LlJEaD+pxUjSMvDq7nulMIBFh2L95e4hfasZCgfw=;
        b=UimLBOAtuDB9qwCZ0J1OsjSXQnA02Kg36ppJIvtC/nG/mtthvqg2XVtX+uQ4GyLTXD
         Dbo0zc91OXm1m8GAXxPu6KuN1wzJVz5K/WRNUD7uO2jWrGZZ5SObZpnHwyHGap0RLhRa
         OWNTedSm8B09/VF3hPtsECALa3OV8jFVkJFZXIiV7ixLC8qdozUHPeRK5cmTdv9tCMSd
         GIentaS3RcOG239d2si2ZdXq1D4Bf4gutqjN01u6L9evsdi0bHpfvrm40nsmx1aQMbRM
         /tDmKViEJcRFcXwbwk7s2jiBvQ8rh109m7Rz9HMqIK3SyvReHCeN45eE5hExUKakciMs
         xGbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrb0Pr9Ttv7+K/CLhcsZlt3fyCOg2PH/XtIO3ij0D5MTe4md43lNUxUpJB3X3YpNLvX/7+xJyZlVzoNkrQ+Fq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK6ShQz/246BjV2V/ES4tvTqhUjM7IjNZntMmnItWy+3TiMii4
	igwp40GKD/pM0ju63BnsJa9Is/NrgYkAg8MIbdJYk+ExECs97nmPyfrKsMvm89EnWde7Mf+aY6X
	4brXOxwMCzt6PUslURZmAePza2RQpLZFlkei/EI4=
X-Gm-Gg: AR+sD12eaxHV3pPRCf4YN8xoauxeNAhA9+/CjSt56hGWqcl43eGKT8ZNR7DRlmyClj8
	1xO3rgmZKH2+Uq9MXSRASQolE0f+V/xfAgB+Au//q74WAek2aFbNkCuIIWQOIJlPsxdQKtUonQj
	HiclMyaTdN+5JI3HMA8SITAk5KPbFXKvO+dN55NNdgcG9wksux5XuVr3q+JHIVfggvCz+RMFy0T
	WePZ1tGB+IQNBe2Qje6j0g/8bFJNrBFXT3r4ErGDM/exGLIBg2rnK6iM2u+CJ7r0oa1KVaXlWXc
	ZTa87e55TC03aeEXF0WNoIbmYwDBTy61PoLs6Qa4VhNJpycXOCBzKUL2wtrJ+pVXrT1+YtRqT7E
	0/G7rmLo2imwmqvDJeXNxno8TJGixRMtL791hR6dMH/UUyB0fh6nyS1Cvup6idBB2k2EhDyXB
X-Received: by 2002:a05:6a20:9d91:b0:3b3:241f:66c6 with SMTP id
 adf61e73a8af0-3c900519d70mr3904677637.26.1785439594316; Thu, 30 Jul 2026
 12:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de> <20260730-auxclock-nanosleep-prep-v1-13-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-13-cd8b61229a7c@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 30 Jul 2026 12:26:22 -0700
X-Gm-Features: AUfX_myn-RLgtDysjtaVAuX36XIL4GcSL3NevKvSc_wbm-YtTB_pa6PAjHbH8VM
Message-ID: <CANDhNCqZ6UzXSq6xjMZGCcMTs16QPEZUWtR0zBa7aGgBvKOeew@mail.gmail.com>
Subject: Re: [PATCH 13/16] selftests: timers: nsleep-lat: Use NSEC_PER_MSEC
 define for unreasonable latency
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
> Use the predefined symbol to make the code easier to understand.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh (Schneider Electric) <thomas.weisssc=
huh@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>
