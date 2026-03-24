Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA225248F6F
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 05:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774330079; cv=pass; b=uLPt3PBN3P/QdciTOsdBCShj+3lJk9s+zD4lNk6tiOtwAX7+16rg5vg0ftY9g9STriWCsKOgjgeswKlz9OMfGxrmrU7NNdn582WAVATJttY4d0TBuiykqjXw8hebWQTWeWrH6wP/txi63gytEkRtKLVzDXX9Sqr4LbFRYDGOo/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774330079; c=relaxed/simple;
	bh=RNjbcd2eV8/Fk8qF+ylPyEnsEtnpckM6nrd+K19etO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpB1bUl3Z/S6E0aAPOtPTuxxg+nUyDUIelNW05YfnjSOx0nGb7QojwfHJj/n2q2VPZxZu2KhxpMS1m3qGSq0UsimHjSoapA4KH+5yALNQDnqZ+snbLSGL+bgnbCbaCrY1P5YBBgyYHBwkGNdpdDfMl6fX0rFUwB6JXpxLJBPy6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oDz0jr45; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oDz0jr45"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12732165d1eso1370154c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 22:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774330078; cv=none;
        d=google.com; s=arc-20240605;
        b=lJl7R2DCxXuedpaZcDml/T0otyz+ERzSYOUckg+v4rC+8JEYxZIpzCyA7HnHmaxU2a
         99MTe9ubua4iitNCWkkcjXDZjQpzqBZPBCy6L/DbsUc7/DqhT2wWtU3sJap+y0nEpNGq
         Za6ftJ+u+2qEODCGj+EuKPagZCh3g2LgOlflNegUZ00GEn9WkTjtBKWQK+EgZugUjJzy
         vl6INnUqo1VC4tp/FbXt3nfDAeO66QHiKYsBTRlpvIwFcrdwsXsRfRUKoWjSU1jrmDwy
         w7bsyYXx68onmbkgGR/Fh/m+r3N8tPe9pSIh8QFWnRAxOYbRjWNs7FfnIQTAsQkB09Sh
         uPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RNjbcd2eV8/Fk8qF+ylPyEnsEtnpckM6nrd+K19etO0=;
        fh=YnWtuIr8J3MP//+g7JCFKPdEXmqtHMr8GzT83PpyGoM=;
        b=gx8yECi/0PyobBxshG6WPzpHD8IE62o2Kp1fHMIItZrXvCXphfEBiGsVbxruZrYknb
         QGTjBu38q4jsliq/n6XRhdizGlq2Y8/W+IOegEd3OfUV8Tq8hqxjzJmktoYykkCJKXcI
         JBQPIvkS/dzoA25tF/+fZ7nntyxkHapNfHIY0yEGXfFGm3AER0HkUkJYGxAaFG1NYbVc
         9r7UZhoXyt+JkklDu5WT4AUYkuwajsXnzUvYW+2ecjdxqOgUBEgkJdZiK62AG3tp/Ate
         R3G0jVvER3vNhIOPIFFNT8H9nHPsmBYzNO5uGsIAThBDWUDyQADbsq86Uq3HTshy9wID
         nAJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774330078; x=1774934878; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RNjbcd2eV8/Fk8qF+ylPyEnsEtnpckM6nrd+K19etO0=;
        b=oDz0jr45eM5Oyxk4iUgGUrN8DzBZe5vWoYT7d/3kbvsJ24XyH0yGzIuxhqcf/7jltO
         MoLT7C/rBanhRa537/N30B4A+dBLzJ+dijrnaoBSItgTDgB0UV8yFZE1u/2e/Q4cWzU2
         qnSsg2iqh14hY4YvZHj5V+D1sKeg55nrhbUY6QaBzZzSs3pW+kTESLHVWhorMKyrlP9P
         FtykjTP/cy2iD19EDoGruGYQnkZIhAMp09BP4twgc3ccVoUrqqzrl3IJ8hq2zW1UpWLm
         uplWT0YuqUqliWqAxm3gtlGXLQqYI3NMDe7d4WjXvg4idlGL4OrRss965Go+lY/vBwbz
         OBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774330078; x=1774934878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNjbcd2eV8/Fk8qF+ylPyEnsEtnpckM6nrd+K19etO0=;
        b=EVmxr694NbjLv+1hKRa5sRIWbRYYew5oLwVUiztRnnlvcGBii6gG3atlb0qQ80mZ7L
         gBNWFAO7RMAhyLODHAfDfWRBL6I/LisQQoL/KK6hU49la+ppsP7T40hHq/GfkUC5YKDo
         Q8u8Ve/IWZQqIZEVUSGXD3qvjaLW+eBgkCeRnIg0lZTJa3F2J9xaBLJm7+IgdMTaNAWK
         BqOywOuGXtiiR9Qui6cSB7s1QkhR613CUodVPUg9Nvlp4wmmZoYtdJBGNfpjZR6knw/Y
         JvbyPkBtR3belBlXQ2Ouz756caq3oysLSSQxBixv9o8TxWX3jZ0ETByvnjG6vsIZ0/wm
         q46Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvSn5ghdeBF0cf/U6Q7oE1sejvjobdkc9NNP5hn/NQqtSw3dsVd0doNdblWAoMX8azIu9LvkW46+5W+R467P8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ26L2cUEO3hCMwL3nZD6a1ZqlW+VoCm+9NjU8Lu/br4lUiGp5
	tJx5nUE7qsPQ7QPYqUDKrqog7dCnHTrw/zRDPc7TRuvfTuYbqvY3U8qFsjIYAhWEMlRyBiHFDQL
	AGd6ZNFhWlQreNtzclirah5c5Vso3mWk=
X-Gm-Gg: ATEYQzxG0cMJF1ZqF1gg+7eXDDM/eyBBpPNrs+P2Wl3c6iqkFMVBg/SCyAXMaEr/bN1
	WzYvukh9bjJ6ZIsdEAuGq4mqgdzrszet8KymRFsraSxVab90nCUSiIloN3KRtK5lX8Sf3Po4zwF
	Si5NErM01sP9R86z/mIB1cg2PTqGn7eQDwWuOa541hk6qZfORwvOH2J3Tlhz68XL0KrKouUZ/dr
	98qwQuJatY31Z9ByinTr9k6mpy/MM2MxjvLbpNhu3NKokFtQ3UZimOt9gv6UTIgWu9SthNlLgA0
	8HWIKiobEnWXbUhK4too+ddrsbgxY3FcrDBdUm0Z
X-Received: by 2002:a05:7022:327:b0:128:d494:a1ab with SMTP id
 a92af1059eb24-12a72652be2mr6281945c88.15.1774330077945; Mon, 23 Mar 2026
 22:27:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317065137.1533226-1-atwellwea@gmail.com> <20260317065137.1533226-4-atwellwea@gmail.com>
 <acAZoCnlITtD7ufM@gandalf.schnuecks.de>
In-Reply-To: <acAZoCnlITtD7ufM@gandalf.schnuecks.de>
From: Wesley Atwell <atwellwea@gmail.com>
Date: Mon, 23 Mar 2026 23:27:48 -0600
X-Gm-Features: AaiRm50Z9iLjwnRJbgwDlL-7pxLJace2gfxIa3Rg-XB7nLCBzCA2DVlascvPydg
Message-ID: <CAN=sVvwBfu1zMipnPmTiejJm=Ai3korkNuxSRLee9DZztZWnRA@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] selftests: packetdrill: cover scaled rwnd
 quantization slack
To: Simon Baatz <gmbnomis@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, davem@davemloft.net, dsahern@kernel.org, 
	edumazet@google.com, horms@kernel.org, kuba@kernel.org, kuniyu@google.com, 
	ncardwell@google.com, pabeni@redhat.com, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for pointing that out, have a V3 coming that should fix all nits.

Thanks,
Wesley Atwell
