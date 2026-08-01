Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DE82F1FEC;
	Sat,  1 Aug 2026 20:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785615505; cv=none; b=F4N4FlqXNl6GzyFOpVktTT1jWfwusSGPdzGdD3KOTVMBlzTsn7b3XFrkmrW7mmE6kQXFF/4vNFefP09GyP2UHAP1otj2YgSfEpdvng/r0MSiKGJiMz9qKTotkJyWgPdcZgjFVyzEsFiwy81VsAkIcSfi5RHtufhewNO2RaN5NwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785615505; c=relaxed/simple;
	bh=rhXyF8pIyiyUOoM5S27TLhIQCX7EvbbEBzG41ltrGBY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A4eUdHgwS8xiwX02tAsUFRAIApZd1ONglcTYC0TXXmAXI2aOwV73RBVNuqxOF6ubIewnJdHXZLztT70t8pS61/WyQEiuC7IUCBBvyMEodrqQK+xJjKOoCsqTuXAe9r2e+HRbthCQGuRIjy0ENUjavl8SxOrhybZ1FvpPM4fhyzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=b1Zvhng5; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="b1Zvhng5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=wrh5brteCixAIwSv2QdPqDNRKaKwM8cKGrvEUCnGDaU=; t=1785615501;
	x=1786220301; b=b1Zvhng5+0n40c7iH9MwnIApyeYOaNkqEZbk4HnEX5PXbbGjYi2LeIx6IPtj7
	7C64OY8fyUDV+cqlPw14wmH1yFYUmcEhNSTuIuLVucvB+YYS978w2ZJ8pP7j6G8CaK8+dL81y0Pg+
	2BPrN9MDwxdSUxZrcGkrHRpKHIrDPfMK0AE1QlTWq7GCSNA7lgC21PbLlz5+QyFQCx4AgcvfWV+U5
	BU/UUt1i508gtK9/LaEtLOlUQgMNDr/IHxcyqgMkD8JW4SPti5XoURdaXHhsiUObnio98DNRbGJ+Y
	FTg8ltN9H6fnnwXv4ANBJ+bTBcuGkWNYNZ+MF+ULJWlABNvBvQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wqG6S-00000002H4u-4Ap5; Sat, 01 Aug 2026 22:14:41 +0200
Received: from p5dc558fe.dip0.t-ipconnect.de ([93.197.88.254] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wqG6S-00000002KhB-35Th; Sat, 01 Aug 2026 22:14:40 +0200
Message-ID: <3218c2afc2c99394c43a6380b175185af659078e.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v2] tools/nolibc: add support for Alpha
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Willy Tarreau <w@1wt.eu>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
	 <linux@weissschuh.net>, Magnus Lindholm <linmag7@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Richard Henderson
	 <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Date: Sat, 01 Aug 2026 22:14:38 +0200
In-Reply-To: <am5HA7UbmUEEChZc@1wt.eu>
References: <20260722-nolibc-alpha-v2-1-4970e48eb7bf@weissschuh.net>
	 <am5HA7UbmUEEChZc@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi,

On Sat, 2026-08-01 at 21:20 +0200, Willy Tarreau wrote:
> On Wed, Jul 22, 2026 at 12:07:05AM +0200, Thomas Wei=C3=9Fschuh wrote:
> > A straightforward new architecture.
> >=20
> > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > ---
> > Only tested on QEMU so far.
> > Testing on real hardware would be very welcome.
>=20
> I'd love to, but last year I could fix my serial port (replaced the chip
> on the motherboard) and the new one died a few minutes later :-(  I'm
> starting to seriously suspect a flaky PSU that doesn't regulate its 12V
> output well and that is progressively killing the mobo.

Magnus (CC'ed) should be able to test the patch on real hardware.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
