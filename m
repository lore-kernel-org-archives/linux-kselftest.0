Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0369E30EF7C
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 18:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773684215; cv=pass; b=j4sP5gAuz72ykLIY7u2o3fb7J5bL0Lqf84JW0wAuELjHRW5RrZbX7SjcfEt4/89lkiVVC3O81l98UY5zI47qEMY6EZVmbfn4KnRf9iS5Xr70tXtneRsI99xfYnNmTyYbOVifCqG0mm429j97UmYC3mkGfDB1rSeV0ZYMHIsFbpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773684215; c=relaxed/simple;
	bh=KNzIzyFdGwoJAVx7hy0kRK+gY5zPmTyPzd0Wd0WQTas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJHV0UvQfQy1bC6y+RVF0QTzBO+7H1OM2JQmiJIIcdHGG/MlInkIGaBJE6iorVaNohUyfiTbFB14wL1Y+t2TmXA8Z+9BF7KRf4AYR0kK6cvytf/rFy92oe5oXxflEZTGunQPdV0n2GdHq4neM9BgCnuBZZaWRXOWtp44kAWgzUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O07WQe4D; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O07WQe4D"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1271195d2a7so345367c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 11:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773684213; cv=none;
        d=google.com; s=arc-20240605;
        b=CLRQnkgDX4eSFCPe1wu23KaA2cFyBIa8bDSgFA75sIAmH0QRDmcq4sdVBsbsC0XZoY
         9gklMX5zq9CFrUmFBg0kBkPS2Ec/O2qYJgWAEv1v7iY/0S37Ht2i6dHnywxZ2tQYbKUj
         JuYVv7w1xi+gr1L0y5tnlUo98YTpOJXXQ9RXL1i2SwPUppwpaDMiYF8bZVWGJtCpiFKE
         xEunUebh9yYo/0DmmxQspxFgMnU9m+j2KVcQZTeSXs97te/SNlJUDMzRg66XSSx9DTUZ
         e4jv1KyfaNDRwdGjqOtiB1GWwrH+S2g4tzPCHOM05w5+pdMIh/0HjQwNuPkh/Hc7lK6J
         qWzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KNzIzyFdGwoJAVx7hy0kRK+gY5zPmTyPzd0Wd0WQTas=;
        fh=xuaFXHph45PMovtDG8YypLuvXbm9gRfBxaMNn4m+ALc=;
        b=OskSGqFP+jiWq3K46v6dd4k6hGr0EaNiTjIVFqrHUIAQvXaLFqpL4g2G8lcSqILKXH
         4rV3hR624GPOtzh9AUntwoqGeSE87F9nDPBqwuP3pSTs/VzPkiaStWGN45yJaFfHYbCP
         YaV87eoztS96zZH0REjhvvi8VwH7bOp4woqqfZsf917tcTuvfeiZX2IupyY/yDsjEmQK
         7HraOwq/KU1ZLoAB5Q1RBzqhlB6tgZYW2kXvT2K6GsHWdIzJrwxt44x7yev299YI2Zdo
         +x7yJ1P3/7SCj6SddifAfYBz0zBLU4uAFvf1aAYHQCfO416BUd56Ylfc+KIr6JvOYkV5
         UJdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773684213; x=1774289013; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KNzIzyFdGwoJAVx7hy0kRK+gY5zPmTyPzd0Wd0WQTas=;
        b=O07WQe4DY8rR2TalssFliMhJMUanx8+Nj7/aoptmrFfrw6TU5RopcWFn1u2FSG5wj6
         WJdIdUVc/Jz6eCnjmFHsBrDLej9HM6xxU5LSAYT7wY1Nr5J1bsnTeGfQSWq0kfBKqxrp
         XvwlEB7du/N87ct4LCBjpa9pnRhybUocVzNtb6uI5T8kJQanDtMKVR8UhHxsl/SADP5T
         mzxmC+H2Cv7X9Hwrvl0HMDq4KajhQK3qoZVZ+9UoKOeh3YY8ehoAS3oRIrSqQ7/gFLMW
         2kRGTnGFAmkfbrRP7PH1q65ynTPsQ0glkjdQYpyB7zlLTEroJput4cJbSf77Ec7xTZ/n
         vr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773684213; x=1774289013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNzIzyFdGwoJAVx7hy0kRK+gY5zPmTyPzd0Wd0WQTas=;
        b=hgnyDDRUR5/CUNWGzFL2rBsUbgcxLCDBE6zWk3NMx1TWSXSXUSX1VjyJ+t+nxrcLqt
         79rjCRXWLP9VkocQR4E8o78mYN0V9HyzEc2ZdI/i9PP28kDOlu/rGzXlXvb5PxOLABkh
         j3cKWMLilpH2T19Gqu9KF1aoXh5v7zMMduTr83UrcPOJktnLk0TUJIQfrUDLbxv1mgPM
         rQFiUyMz8z42TgxTEbw82P4pLGfE3o8Tfdl+/W3QxgkEM9GOWy6dSqTQlVbww9MlqIPY
         L2BXdaEDqz9Cpz+pvmMHgyTC7s4znYt4dLv/kvTVmYnVBaMYzK0zrjtmfO1zGxCzV56j
         mEbw==
X-Forwarded-Encrypted: i=1; AJvYcCUtsqK/XCm5uCkq8FSx23AmUXScxOE5F+yjG7KAyag6VyP56J0ppMy6l7gkk9jADQyvJXRd/5Boc2uzqDT2Dkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX8wuV0itPPiZ6vnmJBuGmV99Ymylh7a/dIZNeEbAXbfcXnTwl
	nAF0rUrBZ6PJ8LBhAXCX2Hc50iVK8cxGpxMA96yP6pv4IfdnVkySQDhl+MkPj7yVNd/I4afjexl
	MpSvMMrHFZqvf49T+Iz44WFiMSFfqJQM=
X-Gm-Gg: ATEYQzzQ+qQjsjxkUscTHkzaBXRM33v87iDw/clGwPkktMCaTzw9wB6DnovBKnMdgQr
	jacODhm8zgEUXHqW8XTDuVe5TataCP6wvewG8DZq+bxewztVynZt6ky2LLrEO9mTcrfnCQT9FwY
	Up3utlUe8GA7X+aZZL8iMfTNlXIpx/fwPaYEC2tkuMviCUkJFCnAdbjjqqsUcgmeNAoBiZDf4B7
	kyBfg4LSYg5L2VSH4OCj9i+zLHoNZzFFQk5lbNxxCkFRmfd2MeZFpuR5syNU+97lMw5m/cVhWR7
	twrsKdK/QsDT3uQMFVtJAeorN7n0mKZrm59AmGng
X-Received: by 2002:a05:7022:e1d:b0:128:d786:8aca with SMTP id
 a92af1059eb24-128f3c6b032mr6448350c88.0.1773684213034; Mon, 16 Mar 2026
 11:03:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314201348.1786972-1-atwellwea@gmail.com> <b042de90-79e3-4976-9bbe-b6df3266caea@redhat.com>
 <CAN=sVvyNpkyok_bt8eQSmqc4f7g7QoZBUmRmNRLoFz1HasEzMA@mail.gmail.com> <e93ce797-4153-4e6e-89b6-3839a0b8bca2@redhat.com>
In-Reply-To: <e93ce797-4153-4e6e-89b6-3839a0b8bca2@redhat.com>
From: Wesley Atwell <atwellwea@gmail.com>
Date: Mon, 16 Mar 2026 12:03:21 -0600
X-Gm-Features: AaiRm50ReSwavo1j1ssacOUbWxtcgznlHmGlPHkMg2HYVcwTt0DGLUUEq90y36c
Message-ID: <CAN=sVvx8jNC-OAMkv19Wv13jTpV5_wVEabwUCjPLMwTvS4czow@mail.gmail.com>
Subject: Re: [PATCH net-next v2 00/14] tcp: preserve receive-window accounting
 across ratio drift
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, 
	edumazet@google.com, ncardwell@google.com, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	mptcp@lists.linux.dev, dsahern@kernel.org, horms@kernel.org, 
	kuniyu@google.com, andrew+netdev@lunn.ch, willemdebruijn.kernel@gmail.com, 
	jasowang@redhat.com, skhan@linuxfoundation.org, corbet@lwn.net, 
	matttbe@kernel.org, martineau@kernel.org, geliang@kernel.org, 
	rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	0x7f454c46@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Paolo,

The link I meant is the netdev regression discussion that led to:

026dfef287c0 ("tcp: give up on stronger sk_rcvbuf checks (for now)")

The report/discussion thread is here:

https://lore.kernel.org/20260225122355.585fd57b@kernel.org

The revert posting itself is here:

https://patch.msgid.link/20260227003359.2391017-1-kuba@kernel.org

I should not have implied that there was a separate prior
regression report beyond that thread.

Thanks for the note on formatting. I will keep follow-ups in plaintext
and avoid top-posting.

Thanks,
Wesley
