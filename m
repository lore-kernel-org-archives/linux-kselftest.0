Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966D73B4EAB
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 05:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790660053; cv=none; b=sJFUdbZKRiJGkDfv4e/EC8YpXz27wxB7b/8DwT7mj8CTnY9rUkp1/AGMe2j51gPWsn/yOi04zCDqgB++F4gGI4qR0oHjmXb5gJ2RiPa6BWWVDKzM7f3yv7PraEMYOAkpG0cgY0Fl2ohKrcph84W8STwduqH9GARD6Yy3+uqvOYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790660053; c=relaxed/simple;
	bh=m2lqawFRROq7VOxJCYnJVdA4aB6TI0mUCVIlIeUuTzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+jfzQkRlF4J7BG+sop6pLWPKIVUBsrppswUyv/TVaRpwvaI6yZrFFYduKwyDj0sQcO8PqZHOZX7CBEYruipufNCQobfKi4PJP8nUILv2Fn6euh9kP2zpCRZ9Ng1Ub2TtPPvZPSU62JrR7GIVy88f+7AswDtgUcWaN8364aN8Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+zLSDTB; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+zLSDTB"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b926f0so2441094f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 22:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790660050; x=1791264850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vDrRpA1W/7JjCEY/lfrVQceoo3M5nHbNKEhFmkg5umg=;
        b=g+zLSDTBN5PBcQHF5j5AAGj8sobOayPMm/lPnpU7fFtjmd3yNMI9nSQHvybIYKg/n+
         GnGtfnaSbNuUbTmkxDnLFRqu09paoQmpeHA9gNMpY/dnIiFV2aTWuyoV1ec/eekRx1+w
         +cFWuPIJoHLHgXUoyu2mRuVcCvIFCsfVnszBEcOfx33IZmpH8ZPyNBUgz3kKmqunn1Tg
         uKWjYgPIBuXLK+Cs/AqKE+2lqdLlelH0tOcKaTzbAFTopW7ebyce/4Sp1LnRuciwb8ov
         zrfKTEZqkXuAiXYdLJdO1RPcMxP+iSEhL6TFXWJxtc9mGiJT6dynqKgOppieq46c7rex
         nwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660050; x=1791264850;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vDrRpA1W/7JjCEY/lfrVQceoo3M5nHbNKEhFmkg5umg=;
        b=dlLgbZldM7Jw5fhVRZfLnvaFa65eoG1UipfGoJsUbBPraUPI0tCrR93GI91ors6syD
         iC6Kc+BpqacrlD8Oo1+HA/hcHhnSmKHFhKoveAsM1hkqKMqUfA4yjr4GwWq0Jn9gC5AB
         QxODo4cCo0lR4KK8G1vZ7tQ3mQXYssoPMzfOFmD/SLVJLqQl9lheqBWH7IuWY+fjJ1Is
         2gIdfj+KpKTw/TXboqV9WbH0MnO21sGqlI7fCGcn41ugKVf9rbg5vC/GVAwlk41OAXEe
         1JFua54U0m6PKgEgMLj7UsJVUkHeXSPhbtiSQmZhd118Ms5iGx+W9kTv/+V450wSZIdw
         BVRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwwtM0tibrKiUXW7+Nv5bJA39q9GKI03Syb0a4lkvW5T4AZFEQ5QJopnw6go5MDcAJ3AsQMSBx0Ff+MNnHu3k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGDGpzv75lDU6th73hdtDtfhVrU1R9+EZjkzkrY2Rtfuu20YBN
	7nNNGEMeFzZNbKfR+yzHH1QsCnS2p+7gDX/nemCCEDBry08mEOCz6c/2
X-Gm-Gg: AYBFou2rUZNWPkXGUiWZdyYrsODRxI+8aetPGrzkx7CuxBnMNYF+e5bEB7ya+Nl8h0Z
	veQequtGsFuFAvR8o57TcWgcdYmS0FCmVW42bJQysybXlq37xGzIucdKeSdLYWPhmHvxVs+NpbC
	pl+SERb+iNot9kr3hPgmxyZN5w/cs8P14bu85fPsCjfxbuBXmo4vnXxuIOP//FtMFF+FTo4bB5J
	7Vk5JQx4VuFpg5BJOWd3vCfcBPVmoGdh1e8yDWxNq7Wz2N0abBWNrp/XmUNejvDsZID2W7bn7gL
	EyoEcHw9NJYikBDaGwHCRzP8IhmgwuSP/ctfqv41aAqsUHDw5ZoEctgf/OLQWIX6VtHq96it2Y3
	xAW3pV1CzQnwjaY6LUo6EThpXNpnH/7kmtOXXhUMYho20+l3e42YgG1VgZM3+YHMunIuuUOjG0W
	lGgYiwy+exkUi1GYmUFqNp7w2BAiKtePU0XxPvHSeGj3DJcMB35rVNJitYOwVaAOSvR09bofB0s
	ECX/gKJYRPAvBZj52w0AkYO/KtgNmtlZ3oZtwdm8PxPtKRgU5ZlA7c6TOKzPHH04wH5IrRKDlNX
	tBsVV0c2Q8g+zJPqWDGZ0Bnm8pc1WegvFvZQM3FUmPQmXysV3PRDR1tROkByyeoBW3vO5SD1yjU
	=
X-Received: by 2002:a5d:5e83:0:b0:488:84bf:eedf with SMTP id ffacd0b85a97d-48884bff147mr15033151f8f.48.1790660049555;
        Mon, 28 Sep 2026 22:34:09 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-9c32-f801-0451-cc94-d3ca-f56b.310.pool.telefonica.de. [2a02:3100:9c32:f801:451:cc94:d3ca:f56b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af506fdc1sm1047634f8f.21.2026.09.28.22.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 22:34:08 -0700 (PDT)
Date: Tue, 29 Sep 2026 07:34:06 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Matt Johnston <matt@codeconstruct.com.au>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: mctp: Make KUnit tests depend on flow
 support
Message-ID: <artKykZLgwngX5zs@gmail.com>
References: <20260925192510.93840-1-kmehltretter@gmail.com>
 <20260928205352.30502-1-kmehltretter@gmail.com>
 <fb39875c7fa4131e565eebf8ffc9b3b19bb5ad87.camel@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb39875c7fa4131e565eebf8ffc9b3b19bb5ad87.camel@codeconstruct.com.au>

On Tue, Sep 29, 2026 at 09:02:23AM +0100, Jeremy Kerr wrote:
> > This keeps the full flow-test coverage: the suite is available only
> > when flow support is enabled, for example by the I2C transport.
> 
> Hardware transports are typically not enabled for kunit test kernels.
> 
> Are you attempting to fix an actual problem you're encountering? What's
> the aim with this change?
> 

Hi Jeremy,

It's no real-world MCTP workload bug. This came from a similar issue in
my 842 KUnit patch: the test selected the decompressor. Geert pointed
out that tests should not silently enable otherwise-unused code:

https://lore.kernel.org/r/CAMuHMdVcZ5cV4-HrjLYfFKh6UshiVxq5eXCNyp0Z1k_SMAvF5g@mail.gmail.com/

My goal is to keep KUNIT_ALL_TESTS from pulling in otherwise-unused
production code. An explicit opt-in could preserve the coverage,
following CRC_ENABLE_ALL_FOR_KUNIT and CRYPTO_LIB_ENABLE_ALL_FOR_KUNIT:

- MCTP_ENABLE_ALL_FOR_KUNIT depends on KUNIT=y and MCTP=y
- it selects MCTP_FLOWS
- all_tests.config enables it
- MCTP_TEST depends on MCTP_FLOWS

This keeps KUNIT_ALL_TESTS from enabling optional flow code, while the
explicit kunit.py run --alltests profile opts into it and retains full
flow coverage without requiring a hardware transport.

Would that approach work for you?

Karl
