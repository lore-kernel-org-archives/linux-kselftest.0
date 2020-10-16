Return-Path: <SRS0=amRC=DX=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56A6C433E7
	for <linux-kselftest@archiver.kernel.org>; Fri, 16 Oct 2020 10:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D64220EDD
	for <linux-kselftest@archiver.kernel.org>; Fri, 16 Oct 2020 10:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602844730;
	bh=SVQmX2FRt+0DPB++BCHp2hugUtCUk/NsIDRTP016eCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=0/K9MW/W21+EYDYPU+puDbjmRj9qsnm9FJ74SMb7j8MXfDJbyk1JrvCkd4BO2762I
	 F75mtQkAB2BWYKTaYR2xkHpP7sp6EwItx8tz5+Yf7IE/piBHexthbM64/nwiC9lZ7C
	 Bi5Y/nXDytJ6jg4aedJsLr9NCNweuLmgNwLVdb+A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394396AbgJPKiu (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 16 Oct 2020 06:38:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:46468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394356AbgJPKiu (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 16 Oct 2020 06:38:50 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E6364207F7;
        Fri, 16 Oct 2020 10:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602844729;
        bh=SVQmX2FRt+0DPB++BCHp2hugUtCUk/NsIDRTP016eCM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W/Y6udnwNX0J+aKAt9Ggz3+hdqQ+L2iIbQLYpbhI4s8oW9yJKQRkGSq55kPq9XZNR
         RDdbbaR0e4mUhlkylqpXiJsZXzvN21uEiOw8Mo2AfgtX4FpJSJGmLKps+dL2Pku3np
         JiljbRBrSnOxBTxeBbptN2FafYjRW6B+S7ZZgGZ0=
Date:   Fri, 16 Oct 2020 11:38:41 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kselftest@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>,
        kunit-dev@googlegroups.com, Shuah Khan <skhan@linuxfoundation.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v2 2/3] lib/linear_ranges_kunit: Follow new file name
 convention for KUnit tests
Message-ID: <20201016103841.GA5274@sirena.org.uk>
References: <20201015184416.38999-1-andriy.shevchenko@linux.intel.com>
 <20201015184416.38999-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
In-Reply-To: <20201015184416.38999-2-andriy.shevchenko@linux.intel.com>
X-Cookie: Pournelle must die!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 15, 2020 at 09:44:15PM +0300, Andy Shevchenko wrote:
> Follow new file name convention for the KUnit tests.
> Since we have lib/*test*.c in a few variations,
> use 'kunit' suffix to distinguish usual test cases
> with KUnit-based ones.

I'm missing the rest of this series - what's the story with dependencies
here?

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+JeCwACgkQJNaLcl1U
h9D/bwf/Yws4UPsJufuVL3X9itk8GXBZ8I2fhXafXIEiDCqQkkkbtUtkF28FqiLv
I97P+q2sAx0yYCMNC8vm7GanBIG2piIDQWiqG3nTfO87J8oLHaAdIvHkp4mFZHs1
leBvlBPhr+UOYWVzuns3C7jO1Hyd1t2+NZykA3xZAiJDuDYzmYpyI0mbxqpa93Ht
mY4/yRTODpSrree3xA3tD3hBOTV7VTsbJP+wCgj0DSg6SBVyx1FN/4Zh8qk1ix9K
A6Ffk4FVaEoMhicXWMa8nYtm48rGef6G1Wad9h37PkznFocDBJgoii3VakarBYkG
7dZSpDPAIWgYrYGQ3wdiI8fu099Ekg==
=dL1g
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
