Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDEC48E0F6;
	Fri, 18 Sep 2026 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789714249; cv=none; b=ZSdVR9+kIBBVxLklADys9j7u8+DyA+NHhbgFDai+h4U75UALgvditHl6hgVbOLv/rPMenYMpWQ58ufusJmZ4cNn9qCYLJqdyLpyVD/7Ys6eBBmzXQF+7UI0Pr8cBU4MsP/M5jLGgnnoq1+TyQ2htRcjoyPJbR8r+F23hMcQcCAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789714249; c=relaxed/simple;
	bh=lzO27TDxIULlI2uv8uwh01ObA3Ym1uCEMM5Rkpb91pQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BgAfeQe8JcjbFkusO7MZ7ytdhbyPuKqfLEbFGVVRlZScYNp70Q9uIDxuUOkdkFhqS1CgGx+FFz1BdopLieuFw/e795w2pN3W+ZFj/CAgYGeGOrnEtwFAhQabJQ4G3BN6eE1cefr2Q63mlu6rLsWgav6LpjwsBV+EJO+op9KnAaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=JIpqf56G; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="JIpqf56G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1789714247; x=1821250247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lzO27TDxIULlI2uv8uwh01ObA3Ym1uCEMM5Rkpb91pQ=;
  b=JIpqf56GGBA++2JNb8W68Q3MCTCvVb9/N8VK1dJZogxg6xtOHgs8cy0X
   IYIEuuFZRjprXsriFO/KxRE9nJnTnyOoyUCUBIxZnpPOw7DXgxhT1PpeN
   1AWZAeumufxzK439rUJrpYhXFxvMqPK9nhdIiiMH8Ldpgmj4DyClT57xJ
   vvH1aBYzWsidWFpt6/xrBXSpzbHDx3LEl9VK3aCg0OIcCRJIjubxPCZut
   Mcrc0uYH2Qf/Lh4N8bcEDIfjEjq8CAZrDV3Xo+UPDh07+2Wi1Q+hbpC7c
   6PJuz34oXIuQlawPTXDw4ov9Jtk6gJH7HH+moh6Q3VXTyxmHMJfdaBRDt
   Q==;
X-CSE-ConnectionGUID: NjezbUk0SYGudewq8HMiog==
X-CSE-MsgGUID: 1gxp3NzKSy++vdXcREIq4g==
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="73876652"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Sep 2026 23:50:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 17 Sep 2026 23:50:40 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 17 Sep 2026 23:50:37 -0700
Date: Fri, 18 Sep 2026 08:50:37 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
CC: Steen Hegelund <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>, Brendan Higgins
	<brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, Rae Moar
	<raemoar63@gmail.com>, <linux-kselftest@vger.kernel.org>,
	<kunit-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: microchip: vcap: Stop selecting DEBUG_FS for
 KUnit tests
Message-ID: <20260918065037.bs2mcha2laf5efg7@DEN-DL-M70577.microsemi.net>
References: <20260917064736.77354-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260917064736.77354-1-kmehltretter@gmail.com>

> VCAP_KUNIT_TEST enables DEBUG_FS even when the kernel configuration
> leaves it disabled. Remove the selection, following the dependency rule
> in Documentation/dev-tools/kunit/style.rst.
> 
> The debugfs implementation and its tests are already built only with
> DEBUG_FS. The other VCAP tests can run without it.
> 
> Fixes: 552b7d131aa0 ("net: microchip: sparx5: Add VCAP debugfs KUNIT test")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Validation on net c9151088f167: x86_64 LLVM builds and QEMU runs
> with DEBUG_FS disabled and enabled. The other VCAP suites pass in both
> configurations. The debugfs suite is present only with DEBUG_FS=y and
> all four cases pass.
> 
>  drivers/net/ethernet/microchip/vcap/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/microchip/vcap/Kconfig b/drivers/net/ethernet/microchip/vcap/Kconfig
> index 97f43fd4473f..1af30a358a15 100644
> --- a/drivers/net/ethernet/microchip/vcap/Kconfig
> +++ b/drivers/net/ethernet/microchip/vcap/Kconfig
> @@ -40,7 +40,6 @@ config VCAP_KUNIT_TEST
>         bool "KUnit test for VCAP library" if !KUNIT_ALL_TESTS
>         depends on KUNIT
>         depends on KUNIT=y && VCAP=y && y
> -       select DEBUG_FS
>         default KUNIT_ALL_TESTS
>         help
>           This builds unit tests for the VCAP library.
> 
> base-commit: c9151088f1674fd29ff26a20f5fc687acf53a2f0

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
