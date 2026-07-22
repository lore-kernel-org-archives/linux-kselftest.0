Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8A53E315F
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 20:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784753782; cv=pass; b=Dm4e5Ke2uM0ybFRDIDnLqkCjPOZLow7cEQRtXby0MCnJsznEJpXC5wKbd/1Q7yLC3B+fzUQNm1nMdeg1Q31b0Dc0cZT2gytrs5fQqfO3ZTVG1PTDjInaBFMIFeC1SmdDu2Bo8E7Mpgw/Q/dfaYBzEFI/inAyGUSk91dbNG/QVmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784753782; c=relaxed/simple;
	bh=0MTbgq1KWJc+1GNluOa1ST11CPqFKW1ipwKVFiUVMh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JyQl2FRSjMu4JoZA9JcX51ThrTHohFVfTVI9YCbxTJNnW6OAFJo2g/Hfq2fm4eipSot9tW5iRH0vF6P0Mms9JMMXS59uabC7+a3ZnNejbuxoQyS5f8TcMf0jPJ2ma5nnFGl+i94ytaJLwsqTPLT+JPtKoG5dKCxlTMFQTGz9CXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jUDE5mQ2; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jUDE5mQ2"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495509b08ebso265e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 13:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784753779; cv=none;
        d=google.com; s=arc-20260327;
        b=sSbPgp6H6A81wprK+bOUoRfrkKZx1r2/JVniax7G0ZDmPEnLN+NaN7L/h9gcZLG2dk
         EyI5SxJpHqAeuV0O9XzRrsHdUEYY2x+kew43IkS9YsGPuBZ1cTnAPDVSpJXyOQFmY/oL
         1j0aKw7R/KVSBg55p9K1jI8BC8EGoLyGZq5LiAmxkCJ+HEx8emW5r03E1yuuZ8+D3tD8
         nkFVLmMltF6bh60+XhXjGutAWpleKi5bZdk4tFIkeHkr0KlZFaV8nvqh0Kwnm08j+cT8
         QqjINIhIkJ/317986uDWx5X1llMLP852Bb0an/Vst0/05WvrRqd2EuO695dU5LUFzqOK
         bQ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0MTbgq1KWJc+1GNluOa1ST11CPqFKW1ipwKVFiUVMh0=;
        fh=5Vnvwq8j/1rWpS1dw1l+Z1OQfqimY7qG4yxZOgrmI4E=;
        b=o1XWfBIzZvF8AvVhY+gyVuUFNbK7vasPZr3wVXRAsJl8BjHIftEljsFmkvrlbXM1Vc
         8xtKzwTz9VPi4rWpVrKezmhfk64s07pkQ9ad2L7sGUSHQVRJssmpNIqJx9nYTjM08R6Z
         oX7Laawtdf837G5MYxus99UOZrgZlQQRTXTu2xNwl8aMFlLBDzTUZbgde/AhrkkZ7p+d
         4nInPyl7fNgx3+UXmcWLDdlkA8+CeTd95gz5PevSE8hUgzDiAgGI8rsaQ6nOL6J6YO1b
         5o12NGJf8q2hr2gcujw4WmCdvygGhVi6mZUJ1lwBs7ZIkTnmGTAC7g1BrnmmW6KIHA85
         msAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784753779; x=1785358579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0MTbgq1KWJc+1GNluOa1ST11CPqFKW1ipwKVFiUVMh0=;
        b=jUDE5mQ2pt7iMN2CLkjDAkjGNG21X0vrsGDxpguPwAfu92TDlVqdLXgeHtkCkNBToU
         AhMhG1MzMS7WZcOnNXlfqd32h3I9kAwpdUJ4xeHJzcAm4cfZ2Fg2gEx7OKBlscPmiq++
         o0Uw1Qj2jUGYLRXEWV8jKrgj0tRIlzQU2y5nPvCRRFm2qZ9LDJx3AkjL5Ib4Gpqsv45z
         r0UJXHoAzxMvtEdbsY1D9qkE/vtHtg+/gp9dndVd/S34AuujFUdAmHrLfYgK1azwd6fJ
         OWuPgLdZ1IGCswo3dTkSr82VDUoWNCTSXQitWzUstUL3EaMfpRc1tKDTuIIKQ9kiTJf/
         XYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784753779; x=1785358579;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0MTbgq1KWJc+1GNluOa1ST11CPqFKW1ipwKVFiUVMh0=;
        b=kffihSjUeT85YmwhLoOCgGGSiXmtqkUCsLo/Uv2g/BVM3KQdyZJc4AahOf1fCOTkYD
         Mn5g32GZk/vZ6IlqhTd7eeJMkAQtAT/883+QHIkyl3jkz+lA18D+n8/v9bOHeowauhps
         ELyiCVhk6oFNDz5gDcEr0IvztHpWF9O1CYBlvl2KaL3oTfqHvZcZ29pFWEMAHup+j7i/
         nIg46gjVn4yNrnjHENSs+mEu0/W7RwxsZXPdMA5HrjRJHkMMa5sQf5M7wYqOvOKExMX6
         0s/GxMfdLbexciwaooevHNfl3Tn9xu8A98qTJDJbodqlKrVReafwrGAwe/Qw5FD/3UFb
         JOIQ==
X-Forwarded-Encrypted: i=1; AHgh+RosVwgswT5+PgK7ExZlfreFPTVsr397/KBZ8S7abbJ3ExiU1u+qJGhVHFfLVpSxKwflSRWpzbsSNYIbB3Sf3dI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXnIG3AO2W+Mf4pxkZ65GKpWGfg0h4wnYp6l9Z3S+48LYzPXvz
	A/WQPkBe2iQAom+RlZlRalOqBaM4AVK3OZbcovqn08T0VehVX6kh/mrkHsKr/QmwvXR+NOy6bk5
	ZcLf4s3yNpmpGNe2O4czuE9ka+zi3FnsjSjE2fdbu3VNNs/gyuvz9YRvM31A=
X-Gm-Gg: AR+sD10/7T6C9T8s8Q1jXPJld3bNSfxcBJgmg36gXOpW3uqsmbWgbJx/nouJ/vEheae
	a7gxRKQHQmhXNWliVTBJAtP3jWPNmJa5BedjOHwJIrFHXCPZd5jZu7zkWara6hr2K2W7pEb7PJ0
	VJetzIZHXB1gTtW8dANzGOweWxstbrejVIJLq9rO8KjcUJY0Nb6yga112oqsB3WZIlciY87d48+
	PYfWc6yKutc2owZujMsQxOdkZ+53Wcn962aF6Ijw/Qo7ebCTBP7559RE1jNuIULBbhj/RGsWOX2
	5rLX1593tbr8c9xnoLgIA5xRUJ0mkdFsTRHZm3WJPPXVBQ==
X-Received: by 2002:a05:600c:5691:b0:48a:5618:b4d4 with SMTP id
 5b1f17b1804b1-49573dc9ae6mr112305e9.1.1784753778589; Wed, 22 Jul 2026
 13:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701192210.2997769-1-tjmercier@google.com>
 <akbPrI67h5btdI44@devvm29614.prn0.facebook.com> <CABdmKX0-tubji_pBiaZbePrxVLA9qkw5ez61wyzjDz8-pko9SQ@mail.gmail.com>
 <20260720161052.394687f2@kernel.org>
In-Reply-To: <20260720161052.394687f2@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 22 Jul 2026 13:56:06 -0700
X-Gm-Features: AUfX_myw4NptciZFfZOOPBu4oBVvGbQZBM1IcnixNVaCyjE3vDvwDLKrGe7BnIM
Message-ID: <CABdmKX3EkDdauF4mPaU2B=5Sfas1q4W9NbPi-1nC1-4N-yhb2g@mail.gmail.com>
Subject: Re: [PATCH v2] selftests: Open /dev/udmabuf O_RDONLY
To: Jakub Kicinski <kuba@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, kraxel@redhat.com, vivek.kasireddy@intel.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	Bobby Eshleman <bobbyeshleman@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 4:10=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 17 Jul 2026 09:29:40 -0700 T.J. Mercier wrote:
> > > Reviewed-by: Bobby Eshleman <bobbyeshleman@meta.com>
> >
> > Thanks Bobby.
> >
> > Shuah, would you mind picking this up?
>
>
> Please split the networking part off, networking selftests must go via
> networking trees.

Ack, done here:
https://lore.kernel.org/all/20260722205442.1894665-1-tjmercier@google.com/
