Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4B53CC7D8
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 19:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786044470; cv=pass; b=R5GhDvjVIAQlVXggZEScGru6JXPsLQWM+S5tMCbL3b1lWp48ILL1teuX1n/e+pYLJKjkmPMADiW8ZHewAJxr2iFHZHlpyRdPIt6YEpvj6FGvbC04sD7nKhEBcHgoFx1Cz73qrMiW+G617+Ri8vlTJj/VtUlXsLGFwINV1fxg2JM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786044470; c=relaxed/simple;
	bh=iUV55gIu4aYclKwZ2UeoAZWtDqJYux+N/370D2hWb3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3OjnASAGKMI0/eyXWfxWyQMd9/R4iEfKOPSltMtKSGA/A4byyS4CnR/TywsHZkwlLfHEIqsN0qI9vQQyaj823z8cPXS4LRyWP4JUoEm6zVnXpYyopUwKGaZi8wPFIjfarNAPnR9X5d9N58gAZbCi13f6sMHAXZ66VZcB3JKIjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EhUFZE6Z; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EhUFZE6Z"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cacef7d299so24785ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 12:27:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786044469; cv=none;
        d=google.com; s=arc-20260327;
        b=qVbWD05B/niw67VXxWmMQkG3ggNAl8cPneR7ueCw2ovy0A9aSO3a4jtJxl3rex0U5L
         DC4AwUuKNCrA/lvgA1qMCNzRL8Ymk3spy+l5F1ntDO6oP4bvHhzWsCLWjuCFxtTaWbfH
         BjoCo4wktLD/L2esk//IySNTR96Tg8J/vsTKeccgdtPne9rBad0owpusj8cjsQMtcCyV
         sa4gKSDRMb8qPDC5h6I7TxNotpXJb/dLCHOdE9La2Awy9u/x8wYBAhKddQk0MeYNGzrd
         OC00Fn9CghuVRJmIDii9mavI7CDF+kD/DutOncZ3l11mFI8c0Yerl87b44eOq2hPEhTy
         lHjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RKDxq6e03wLEUEpXNUuVpy51JZ2keZfmV6/afBlsFiI=;
        fh=h7H3pjSRVIdwlMgpdth41Z30YJL1hMkcCp5HVMhATi4=;
        b=puA25YKzs2Nmy61jfN1YQQE9/cwLcsA7/jSKYZ22jhZ+NjgtJnxnmBrkZezVNfjP4f
         CG3ct9qiBbojjdEpDePJBadtEjMZQea+oui+nG+yrRbMoynPj4YN8HxBLPFxchUs1D3W
         sfCCJ2L8QYaTbLQdyatq18fMPN+rteWAjJF4k9vqSTjjcLcYStuB5ydatIIhoEzP4cnt
         gFACt6KitwuojnBil/fl0PrDkvkALZBuE/NwCJYS9/dg4aoLKRG5qHU+Ldd7E0yEjgWA
         p6as7AktledqhjT1r9zbtUwIS0ExXGVgEXQwKvfsCy7zjb9SC9Sed1FPf72qALU5KSmI
         mNTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786044469; x=1786649269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RKDxq6e03wLEUEpXNUuVpy51JZ2keZfmV6/afBlsFiI=;
        b=EhUFZE6ZB9SrYy+Z+s7Lmm07wVa2+eKcktST2HvmDoVCCrTHriAoxUGVfTrmwBvOhP
         I1hFRYVTT2YzT+CeXaR40H5NdyoorWJJOa+sqodoH+6eD8Mb1R1mYmzeRCb41N4+GgJU
         opaW6aZPddAOOK87l6LweGMVZOIZtW5svRmnf4MasZHTaqTNv60hDV7I2h02x2Rha+LT
         6majc6CYEDn/M102F/ihLc3wrZzq+aH/Y1BKjrRii11zrHf00mrMqqYxmRkxUSiDjs+S
         Ua3l7fjquYS2t248VZbOI96dHLwvUCrzi0L7d96k0VyblHgXRQXE6OetdA8wpRudgxOa
         kbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786044469; x=1786649269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKDxq6e03wLEUEpXNUuVpy51JZ2keZfmV6/afBlsFiI=;
        b=PUIocTEjnQ4LkyImEu2e2LVzuojeZ9fqpkDg+zeO2xX86qEL5e7We1jYv8p30Svsx8
         aLgNTnFWsi1GotjWFQ6aZ0SSq+9Kt9qc08IFhBkfJKFY/CqGo+sktf++Km+K9j+St5ZQ
         uz98WF0KI9GIyPuetzzC6L3/Ljy/IuGGoQdPsZqNpCFP2MjsCRXtk365DhjZ5kw0zPcO
         BIyglB2hbX0zWzAJGApOJkBjlEapZWxy/5Pik/QBmZqOOmVFzXjcd3gX6s+L2DFMNQv/
         Wwd8tthnUTXUI+4JBDmBpc3RCy+IziruH6Z2EtyoUL9QLFHtTV1oEEqA3vBxYdaytNm2
         OahA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+0KXdDbMzqrcF0Va0a8sUKzwawU4Y5onjTuduPTP7Iv6oPriFzWfiTTHN5eE63WOgE70KIayLTl7agdTabCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxylNPzUnje3E5oRS1t9/kOT4j5o5u19lZPSnJcABW4dLikedBD
	IjENhIQqiCDjSTa4nV79cs0BZPivqnmfCtz5M9Ub8cEbc73EmTUz2l/sI6czQI+BobLGGQYIieW
	R5O4tRNYBLaVziC6IIJ7jlkS08V62Z79ccaOsJBeu
X-Gm-Gg: AR+sD13clkKm5wfB4QD4fkfbzyzNrpNDEbPGUodAuPos279XukMJ6GMQjQcmpEG0tBF
	wBOCW4sHhYadEdK5FamxBghNZ0aQwa2h96DWeC0IH74nB6HwWUSTSXmEzIF4iRI1LHEbFIXgJ0Z
	rCQapFlMDEqB7SGPuVKOTnpKf9chCxwq6aUhpOFYDB7PhHKLSzhLTfiiH6lU77jMR2Jkf4POGfi
	ozhAVRYYE9fG3ogagWW/O2Aoo+G0V57R6dWRC1nlBFXso2YR6okhtYgGxucVI5dFNanbOrAB3W+
	CPsp5unoKi6/gN9+LAaawuBV23ZVpuOFOuTJG+PisjlApcU6cCFa1qbZMRiwT7XpNAs2vKqSxVg
	=
X-Received: by 2002:a17:902:f2c1:b0:2d1:1d3d:97c3 with SMTP id
 d9443c01a7336-2d120537ac8mr1601595ad.13.1786044468248; Thu, 06 Aug 2026
 12:27:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803181852.491437-1-almasrymina@google.com>
 <20260803181852.491437-2-almasrymina@google.com> <20260806121602.711dfa34@kernel.org>
In-Reply-To: <20260806121602.711dfa34@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 6 Aug 2026 12:27:34 -0700
X-Gm-Features: AUfX_mwqNjMDNPTTybK3pB8uuckkeznT_cqRY7Nyr9TJWPsHvswqs3jxPXVSagc
Message-ID: <CAHS8izOXwOe2jZmyniWChdU-dKwoFNiVRti66D77LxQS8AhoCQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] selftests: drv-net: ncdevmem: gracefully
 retry bind()
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 12:16=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon,  3 Aug 2026 18:18:26 +0000 Mina Almasry wrote:
> > During tests, ethnl_rings_set randomly bounces the link causing a
> > transient IPv6 Duplicate Address Detection "tentative" race, resulting
> > in spurious -EADDRNOTAVAIL aborts inside the ncdevmem server.
>
> The test env is supposed to disable DAD and addr flush on down.
> If DAD is enabled multiple ksft tests would fail.

Ack, let me check how to do this in my test env.

--=20
Thanks,
Mina
