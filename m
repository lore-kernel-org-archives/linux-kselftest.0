Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC74343B6D4
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 08:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609162; cv=pass; b=SyoFtx+Ss0uQcOrIS5PRYLlf6lyQHhAoJbHabjH8cm3ESFdHCETRzKZAgJQffXssSB3VK9pwbyAs4CjsyfLzp/ikHO3RId47SLBL6YchH13w/6tUMWuhnUdvUyvmrR4+OEs3R1sS33Fl/fefl6dSCi/OYtuYG742LtYR8i3rlII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609162; c=relaxed/simple;
	bh=hVrUSNzIYXwmMA2xnmHjPXifoomFAeIS+si0eytqGMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z943N3QTyd0axtMj/2oFKKXVqPpKHeM/ByBwoLMx1WlhiHhvbN4jadzV5NLI4J9znahE+Gc1xDcnQzWuGowMm4HsCDhF13hq89EawOOu6VAXR3Neg90GLGE+E175hykYhg7a7feBjGuiyZOHc1ad6Py9vZw4NQ8DaY6jNnQWYTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jiKXJg03; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiKXJg03"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37f9e2642deso271706a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 01:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786609160; cv=none;
        d=google.com; s=arc-20260327;
        b=brp+8Y3vR8bTwnOG7NuFcYP2gRtARws1iXbaTZO9DwOWIPR6TbpcgYDsp6xCaEgwPY
         bvTjiAjQdeNCqWF7E5CPKdWMX3b2ZwfrprujDYgjt6/Z3nKPbBCnmHPhFVmikBkmkwH8
         Nvez4vMvGv1BiDQXIHRq3GGSehpuyy1X4kObOvUJmRVrff9X4DVblBxHrr1QduL69EG5
         YcDhy0n5lgn5EyqTq65DkO6lpIu/ZXTRmBTCfxx28ASn7LicB316w9PDniz3ZNori4v9
         /Fv/LI4a/pGvQNc1xiJNZn24lLT2Lgy6jknkPPYb0pZjMqj+2c3rLsiectfKzZdtQdX0
         lUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hVrUSNzIYXwmMA2xnmHjPXifoomFAeIS+si0eytqGMU=;
        fh=KebxyyBTCIcOSDsCZ8A/pc45s/sm1dViv0iUJ/vmb7s=;
        b=iPxTWL+OCZ2dzxvplnonE23KQr8iy++Jp32v66xOs80MPaad+XiTEdgMeitTm0Hi11
         2FQBjmUyzqsR51I0DV9cg7HqOFTXnf8CRAUb2Z0r5FBELNVjQo1eLEbloWmcetI1wTc7
         Bnprog5bHDnlO2WpbgtM9JuX8hkJ2AMaJOeRpp+nlopMt/LwqV+1n+y4uk6/cG1HSj4Q
         jUH78rXd4qmlVfBHT490I6FCLlzPRTFxOL+iPzi1jTP+uFhryTBu3lcQ0QlBOl3AQqSb
         Q32ZqR8Lu4sT/v8eOv/dIWWM6wN4n44lOR/FXyMmm4gJQzKYqE/FAsDvrUXTKdYpSlu8
         JtXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786609160; x=1787213960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVrUSNzIYXwmMA2xnmHjPXifoomFAeIS+si0eytqGMU=;
        b=jiKXJg03ISCWp4I5Y7ccPMu321Ea6AemOZfQWlLgVESV0Vh7f3GfggkE0tt+xWkPpi
         3ACJjmUZFwOHd4xdX45veGxbDPNmBHmWplhxbEmy/YKTVnkRGV5Zm9dXtlcLWuYbBACn
         M3WXqdZUW47hmbmp3YHhFoRMGh3/FL8SbUiZfcchHI4i43vXfNupNOt0MQTPWpD74ajA
         JptqLcLrvVjxvvALg1i53eNw8PTMq7AS0IgAzYWk1XBV0I7Hygmf7Me67r8NWsjqbyY8
         7GNl2JTiQ+PfCLX7//mzkJspyqK6oK7NOLXJfN5pSltReyQsGmRqKK9Er43gYXiqaEdn
         Bp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786609160; x=1787213960;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVrUSNzIYXwmMA2xnmHjPXifoomFAeIS+si0eytqGMU=;
        b=GJufstTEzTVhkabzlsPvQyeFnVIPYcgjbpnUItC+RDmJ/zZQT7Eipfde3XvXZo+kA0
         J6/lUli6Nfq55vYQyTl6DOBXYcNim9n3jB8Tlsq0+wgLIsF2cBT9QGWZQ9embYjPuTpz
         WwFV9Q3lq6y/ustCY8CeI7RJ861iblbxAeXbuAX2dzoSOggLc7LooaT9x03cVKF/dtk7
         B2Hgwj04RygzozmZxhFVB8TK9TfrFmc5cDtnvuFpUwja/MmJRtLoPf9Bm3l6BRh797fy
         UEngx5i1sAWMbhRvxssfIdBFN1SQlYKxELOIRk6sSBXMJdfgYYooF96hoThTrji+P21O
         srIg==
X-Forwarded-Encrypted: i=1; AHgh+Rqz6A+7/FNwhv+Xx8lEXRZ+Hlne6zI24cgTw9K5qKbYcuryh49IYGggct1nZ0nsA97RxKy0/wQN5r21stVR38M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE+tU5odg9g+PH9WuRPLq2Jw1fHAZolxxrHS8kYjdUCDonELwp
	CZ8rcxlzgmcUeoul/hWEdGWHuGRmb34DTkVQdyuKw3Jfdjp2CUnljdr69F7+A4jRwL+7xaxRDLb
	g57b+8RE1uWzEB/R49O6afZP/g/o91n8=
X-Gm-Gg: AR+sD123dbxjjFsqnHKQTE/15dP6vmfLCGjKz6ggWLzHVnZaKxLReeQ7myWwHvzuozm
	+peYXrmfoz/fg7fCMe+Hr24OQrEmeP4h+dA9LGqzCZcajnxPYBhGCo2WQ4TYnCJcUmvSkqyzyv5
	qTCSr2y7GZx6Kz2ykgNOfMm0xNvRIxpgQApg29GqVHO/tMQ86BX40MGGnb1ts34i2KbYGqF6wHR
	W6SbfQ2iWgS9nRkX5TFj+I7klgtlAFjtcc2V6QeC22ckwR46TglwfXEweSfxQOxrJbMToGty31t
	ZdfOZlCYilaDsSfIQAvmm2AarprOZzO2DCDy8qni+MjlxW5PUsqpOI/pKotWXgDYgZGxB6StjkS
	Tw40e7lo+35KgvqdhRAuvLhYjjAXWKcnC8jYCej6YYbG3fULT5J0xIcmgMcyC7NKxUhTejVE=
X-Received: by 2002:a17:90b:5807:b0:381:bcfb:e710 with SMTP id
 98e67ed59e1d1-3931e2aa828mr3336244a91.3.1786609159836; Thu, 13 Aug 2026
 01:19:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
 <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com> <0102f153-154b-430d-a3da-2c8423fb3f1f@linux.dev>
In-Reply-To: <0102f153-154b-430d-a3da-2c8423fb3f1f@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 10:19:07 +0200
X-Gm-Features: AUfX_mwh5p3w0RKVhg92eH8jsf5k7VluJKRFIvAAaH6tiIul7a7G8q8L9_4Mlig
Message-ID: <CANiq72mcFp-MODPkNGPcufxb0YhPDO_eN8J-ZFVzkd2-W6VK6A@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 10:15=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wr=
ote:
>
> Thanks for applying the series and catching the stray Acked-by.
> It was a v5 series-tag, from before the MAINTAINERS patch existed,
> so no need to re-add it. I'll be more careful with tags in future
> submissions.

Thanks for confirming! :)

Cheers,
Miguel
