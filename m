Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A474436F8FE
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 07:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778571233; cv=pass; b=Zat3AVohUNnY0q19WAqBRD7wpBfMyGe9QEDI2uXG9zzYCK6Do/sIMX9HqCiEs+JgyjRNF/Rh3OTGvC96ptxqH4wupDsJkKZt3Qet5y8aBr687tGyI91hwAZOhv3xoc5Rwq7Wqs5BZnV8KKE3zRmmGuzobyY1rvQB09r/QPQeHV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778571233; c=relaxed/simple;
	bh=kCN78Te4XRGbHrCkS5X9/zjDZZCsBAy3Y+sNHlXGbPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+erq7uIfl+DWhZVMumtMfJPKrLcku4OUr2orJLw0NjuLdtu9rC1sAuWd/+sG5xTinc6SJiMBbVMysSiLCq+9lIiaT8RIHFwVu31FWZ76yF1X7SgRtpooJQ9inD58ZoH4Xqs3+9u8DYBl1ORsKgbf+5h93shYEfM3J1Brh0rLuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cyxTq2yg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZZD51iBi; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cyxTq2yg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZZD51iBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778571227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kCN78Te4XRGbHrCkS5X9/zjDZZCsBAy3Y+sNHlXGbPI=;
	b=cyxTq2ygdhDKOHjywgcQBoNMi4+kgOWZ+irY2GNu5cVqd/DYoKHa+UmnAkiLhIEDy0gAQ5
	/yrWQzGho9DHw9TihcWLw1PFjaQRx+m7xt30d8MVl5a07BaBeOgHFQgjg+TSeR+mNxiGCm
	k52ZjcUBaORGckv+4R/WKoVgq8Hup+8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-2fBWuPXAN3itIYx_9gPRlQ-1; Tue, 12 May 2026 03:33:44 -0400
X-MC-Unique: 2fBWuPXAN3itIYx_9gPRlQ-1
X-Mimecast-MFC-AGG-ID: 2fBWuPXAN3itIYx_9gPRlQ_1778571223
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5a86f4deccdso4123013e87.2
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 00:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778571222; cv=none;
        d=google.com; s=arc-20240605;
        b=F/OCv96g1TtRgrB34QtWeu8rwRXV1K0/eNCAKUNljqwZ8m3GDQ0TcWoCp8DMvHgbnb
         zlJXLad5HH3Enew25a3D49oD4mIrVv/ysctzG0P7XmuYg3fpDM4tz5bEmpYreRGPs+ak
         RLnjpt8fIs7NXtw98nHv25HLgfvKCb7x783W0Tcb3nkG5J2ay0eGvfWtWOgwFwbrK5/j
         pO/TPnapczhvLQaFITcoDgK2/H+hKLUem6v0uMvHb+BWx5MfZcSyF/zNu4rr2p2n3Ewh
         4hG/Kp87yRPtM/4Lj7WSy7tMN/EZmJIIPv4C1WyLlzbr3WVCHN4OdBdHFnH8+o8YkM3G
         +aQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kCN78Te4XRGbHrCkS5X9/zjDZZCsBAy3Y+sNHlXGbPI=;
        fh=QlpaDVqnsNBA+eft2lfoMjmBkIQrQRXpIl98D8Z5uko=;
        b=NNIVMiSNSUKThpJzyQben9b9K4PZ6KgJnn4g3UHV0LKYWli6N1hrsDP/3Z2rQtEsiD
         DWEiHKkA6dnM1KT8UAjCYzGXtuQADEZE859cqdKVQUA0F/jXvolLENMPCa1O4QfGbj2G
         IW6x2yh0o9uAhgi47pkgrdNn/5o2hzhhm5rTRSPMppP3cd96NXLtq0tvZ/ZXH88LK34n
         VWFfGqhnqYzKefZTxC6O912FSpZgPl7LfPfjfyrowMnUQiSRrFGP6l2d74Bbco1C0Fc+
         lfyFrYStaBFQTlBe6OmOt+jI9o0sTHpLnZgNJHPGbJ3bfmO/M2mC63Mt6YGqFs7OvBbB
         MHPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778571222; x=1779176022; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCN78Te4XRGbHrCkS5X9/zjDZZCsBAy3Y+sNHlXGbPI=;
        b=ZZD51iBimXpskUqaJSgh0+czTLjuGZenrqqbFOWsHY8+hG9lAG+TAg3kQtrf6aRVg8
         KWWIrowk5DkgPQhZ86JvGwxihNFi1ujYH1+HFQf0/8AFb4jRP8I73ySLeAbZIM2anmYC
         vlzqm64TzKBJN7mBqA1HM5t48ktIYkPcrWQziz/06k5PKd4fHdIl1uDwU5cky5cMCClf
         PJP0G6zWJ7MdMl+icQqxawVT1GvDhJw61goZzi8cA93Na9zIVaYUAH6VHNe/pVREsp07
         sKS32E6ugNZJ7sRWf8hzY5WknU3PkXO3b6diuAQL1DWrfP0iuEPPxW8i76DLTIkNX5Md
         QWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778571222; x=1779176022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kCN78Te4XRGbHrCkS5X9/zjDZZCsBAy3Y+sNHlXGbPI=;
        b=YEYMbqEx0Kl+t9v2gl0qyxHFbNf10y2q4lNFOiQzKeEuy3mzHAzHfAdX5jNmJOCQ8R
         6bkRP1ec1cga6j9tPSSJotitxDA3jpG83fy7jIyAQOWKgPxwagT/HuW3GWxnlifrOkTW
         fxupxF1MLrFUhHrKzoAke4u0YOiHnV08EdRJYSDR4r1UXCEwQUtTIrwLnnoMK/E/p19l
         Jhx1aK9vB8DXxCaNhk97H7C7SN6gt3b5e5b4wJ556wgmccbn2UF0viem2LzSz9zKv7mn
         TckN092uH48kuTU1zxBS/q4Ye1yv3I/l/2nMmhBkbceRZ5qZES3GqsGhjTUG+Q447HCe
         3wpg==
X-Forwarded-Encrypted: i=1; AFNElJ8cTvjcZkFCJxp8GxZ0LtlEQXq8ZwWj3GqUuayTdM5MSgKvsbwX9vVIMiiZmXIpZlhmFcuNkqVnzQpY0Rn2a+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHwwU1UMf68mXKifIEBAyfEukM/QDfIRckyWYlz1rLt0xORrFT
	2vFy+Ptwursg5TXnj/tfcXOi8x+SJ0CxnjVYgqEPi+CFY+mmzsvRCCKEkzExRj8MTFeEfKotrab
	UDvVK0CMdSdkrdYfEuQ77A8MRfbr5T/J/TnfWHIB+Zev4gfHdt8JNZJnzTOEiQEL4yPCSiYR51W
	bXHXXyyVvwYo9/ZuCc3fWtYyiybrG6LR0eu7XlwpldgG+6
X-Gm-Gg: Acq92OHK+gwUbhomwMH89sEY40XE85Updkfs1i1/n5warNhJSQEa+c+Ub+HIE7leWrR
	IV3jk7ipilCmaXk43OIfM6lP8teXWVceADu/qU6e5H/cAIgFdRyALAaJhMtsxPVTHfp9xZj8Opm
	f+5pMO0yZQ4KmzUR9nEyplQyer1ZJxlX7q1xciyIO98+GdhSZ0J2Kd0G/gscdYUAphhQTQ/0nV2
	avglQ==
X-Received: by 2002:a05:6512:3e14:b0:5a7:4699:d851 with SMTP id 2adb3069b0e04-5a8b6c9c530mr3819266e87.7.1778571222566;
        Tue, 12 May 2026 00:33:42 -0700 (PDT)
X-Received: by 2002:a05:6512:3e14:b0:5a7:4699:d851 with SMTP id
 2adb3069b0e04-5a8b6c9c530mr3819246e87.7.1778571222057; Tue, 12 May 2026
 00:33:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510164337.7611-1-ihuguet@riseup.net> <20260510095246.5c8f6d0b@kernel.org>
 <CACT4oucitAa05V11KD0d2mQYc7h1L36zDGumnRYXn6+6XUa=QA@mail.gmail.com> <20260511165930.14c7b6b9@kernel.org>
In-Reply-To: <20260511165930.14c7b6b9@kernel.org>
From: =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>
Date: Tue, 12 May 2026 09:33:30 +0200
X-Gm-Features: AVHnY4LJ9gBoBs06nD7X2x1M-eVmft0egAfn-rJZSwPDCundiOCtFj5Rm7UJOdk
Message-ID: <CACT4oucOVK+CBBvushvzX7RdVJctQBMbcWuz0+hv1Y-wTmrMmg@mail.gmail.com>
Subject: Re: [PATCH net-next 0/5] netdevsim: get link via ethtool, set via sysfs
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@riseup.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Sabrina Dubroca <sd@queasysnail.net>, Filip Pokryvka <fpokryvk@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 1:59=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> All code require maintenance. I'm trying to push back on netdevsim use
> across the board. It was essentially a workaround for us not having any
> real HW CI upstream. But that's no longer the case. Well, we still don't
> have any crypto-capable HW :/ I think you'd be better off implementing
> whatever you need in a small OOT module instead adding fake tests
> upstream.

OK, we'll continue with our current approach of maintaining some OOT
patches and recompile netdevsim with them.

However, just as an opinion to consider: I don't think that pushing back on
netdevsim is good. Even if you (upstream Linux) have available hardware
now, small distributions may not have it. And userspace projects that
interact with the Linux uAPI may not have it. But they can still benefit fr=
om a
mocked Ethernet device like netdevsim to have a decent CI coverage, which
benefits the entire Linux ecosystem's quality.

For these userspace projects, saying that they should create their own OOT
module (basically reinventing part of netdevsim) is not reasonable. They ma=
y
not have enough kernel knowledge, and the effort is absolutely not worth it=
.
They will just probably leave some parts without testing coverage.

A better alternative would be to have a common OOT module that many
projects can share and use. But that common module already exists: netdevsi=
m.
And it's hosted in its natural place: upstream kernel.

Those are my 2 cents. Thanks for your time and feedback, OTOH I totally
understand your concerns about the effort required to maintain any piece of
code.

--=20
=C3=8D=C3=B1igo Huguet

