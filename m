Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2203B31714B;
	Fri, 11 Sep 2026 16:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.13.80.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145267; cv=none; b=PClWSPat4e332tLIZLTc7T8trYaOaj2Iuvbx2NqBvgE/iHA1SGN6l/0jSZVNirG4x2NVsCuN40Zb9lvFSqFeb3dXNtRKGmzOmamMYbeZEmWysBAgKmetVaocw/u7w994lcchMbPv9gNQbilm9Qf3iiQq8MfzOBSg+xSY+YXbfFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145267; c=relaxed/simple;
	bh=UOI/lSeBxg6V1aJofmhsX4Ij0RW6xUTMMpkBMeoJkrA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=KZixtTQfBdK3xZlkTOc+mwjUGHckYgtNFrmYtGvqLxXr/z5n7f27rjGw0/JB5icG6SIHxLqtZKfPApUzrAosI+WwPcvpokayavlqVkfP23tyA9xugkltUifWXWcO5qsHKd+1SaNwAbRlef7edTvu6uu618O7bKWsriKEgMjsfsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=H2c3calU; arc=none smtp.client-ip=194.13.80.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b="H2c3calU"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39A36A3841;
	Fri, 11 Sep 2026 18:47:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1789145252; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3DGMARrjazIEOgKELdpjm2pwZYQDf9BCvKJZ/uk2lHA=;
	b=H2c3calU+w9ISZaabvW46hooN2XjW/Us74UknqEm+FgzLFBvundiy/CbX457WPoirnR1Gt
	+/hW+nn4A+A+4PEN5O1ot89Z4AzdTcCricePvY0DmVNB4WWtdK2Yl2mApmeouhceIzGh4l
	4F32BsPKL3RlIilch5nylXgriCn7KQj2KkaZNWo8EvTaCetQHgCHvGlMVCahHroPLsk3k3
	3J8khpnojTinsELR9CTGUcbADO40jKOw4uAz6ta2r2eN77RbT9niO2XHBzwywzio/2N9cJ
	/hDW++Y/LNWw7fNgBqYkqZnEkl7lP1LFd1fZWDuYYztudBdE7kNoB8SUenUqFA==
Date: Fri, 11 Sep 2026 18:47:29 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Bobby Eshleman <bobbyeshleman@gmail.com>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, matttbe@kernel.org,
 Stanislav Fomichev <sdf@fomichev.me>
CC: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2] tools: ynl: Fix out-of-tree build for ynltool
User-Agent: Thunderbird for Android
In-Reply-To: <20260911164135.1428140-1-maxime.chevallier@bootlin.com>
References: <20260911164135.1428140-1-maxime.chevallier@bootlin.com>
Message-ID: <14771339-CBBE-4505-84A4-CB72A0775C41@tipi-net.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3



On September 11, 2026 6:41:33 PM GMT+02:00, "Maxime Chevallier (Netdev Fou=
ndation)" <maxime=2Echevallier@bootlin=2Ecom> wrote:
>After the blamed commit, running a out-of-tree build for ynltool fails :
>
>  # make -C tools/net/ynl/ynltool O=3D/tmp/o1
>  make: Entering directory 'tools/net/ynl/ynltool'
>  make: *** No rule to make target '/tmp/o1/json_writer=2Eo', needed by '=
/tmp/o1/ynltool'=2E  Stop=2E
>
>ynltool's Makefile correctly accounts for $(OUTPUT) to get the list of
>object files to generate :
>
>OBJS :=3D $(patsubst %=2Ec,$(OUTPUT)%=2Eo,$(SRCS))
>
>but it never actually set $(OUTPUT) before the blamed commit, meaning
>that out-of-tree buils of ynltool were always actually in-tree=2E
>
>Now, the O=3D parameter is correctly accounted for, and the %o: %c rule f=
ails=2E
>
>Let's update the %o: %c rule to also use $(OUTPUT), as well as the =2Ed
>file expansion so that any header change is taken into account=2E
>
>Reported-by: Bobby Eshleman <bobbyeshleman@gmail=2Ecom>
>Closes: https://lore=2Ekernel=2Eorg/all/aqCyWQxqKDuQnZYR@devvm29614=2Eprn=
0=2Efacebook=2Ecom/
>Fixes: 917f713b4ec4 ("tools: ynl: Allow cross-compiling ynl and associate=
d tools")
>Signed-off-by: Maxime Chevallier (Netdev Foundation) <maxime=2Echevallier=
@bootlin=2Ecom>
>---
>V2: Add include $(wildcard $(OUTPUT)*=2Ed), from Nicolai
>
>V1: https://lore=2Ekernel=2Eorg/netdev/20260910085931=2E3c64f2ab@kernel=
=2Eorg/
>
> tools/net/ynl/ynltool/Makefile | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/tools/net/ynl/ynltool/Makefile b/tools/net/ynl/ynltool/Makef=
ile
>index b8c67cdb4fdf=2E=2Ee79b8af353c3 100644
>--- a/tools/net/ynl/ynltool/Makefile
>+++ b/tools/net/ynl/ynltool/Makefile
>@@ -23,7 +23,7 @@ OBJS :=3D $(patsubst %=2Ec,$(OUTPUT)%=2Eo,$(SRCS))
>=20
> YNLTOOL :=3D $(OUTPUT)ynltool
>=20
>-include $(wildcard *=2Ed)
>+include $(wildcard $(OUTPUT)*=2Ed)
>=20
> all: $(YNLTOOL)
>=20
>@@ -31,7 +31,7 @@ $(YNLTOOL): =2E=2E/libynl=2Ea $(OBJS)
> 	$(Q)echo -e "\tLINK $@"
> 	$(Q)$(CC) $(CFLAGS) -o $@ $(OBJS) =2E=2E/libynl=2Ea -lm
>=20
>-%=2Eo: %=2Ec =2E=2E/libynl=2Ea
>+$(OUTPUT)%=2Eo: %=2Ec =2E=2E/libynl=2Ea
> 	$(Q)echo -e "\tCC $@"
> 	$(Q)$(COMPILE=2Ec) -MMD -c -o $@ $<
>=20

Reviewed-by: Nicolai Buchwitz <nb@tipi-net=2Ede>

Thanks,
Nicolai
