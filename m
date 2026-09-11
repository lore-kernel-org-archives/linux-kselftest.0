Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCCF3246ED;
	Fri, 11 Sep 2026 22:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.13.80.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789165077; cv=none; b=EUM0mjNsSGOb3cTLhPE4j0p1l9TglgGrxzWmREL+M5EDgZ20bY2Bbea/L417+bxVdFzhKAghb8wJMBbJJWyl3CDHIO2U/XhhgWVYSprtE4os6zBEBXtrSIfybvI3MpQKXdQihXMXukYhpXEVVAQLqUJFD4LXxLVvWOIq03ibM14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789165077; c=relaxed/simple;
	bh=iCyeGKHrxMmZ6EY14JGdoRdcgHBTUd0q8qErn7LGYX8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=pL54cr4yKFiV4Vu5umm+4qTJcuoUHa2LHw6E0udGeNEVJ5R/gi1dysj5sxQ2V7HIAIneOmeDaWlMr2LJEeJDz8/S9DrbiN/UV8Rf8s7NzYDsMKPyO//s8osx/Yx/713485YE8sIB99487ySXl8+SC5vdrc63fSioOZICi+k3ty0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=sM4eUYdo; arc=none smtp.client-ip=194.13.80.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b="sM4eUYdo"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D1C4A0580;
	Sat, 12 Sep 2026 00:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1789165069; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w8pN+7ngCPGyzLK/fMt1+QW8WWJ+5O2YuCJAVF2xcfc=;
	b=sM4eUYdohYn+3yuA9qSNZrVIrj1SsSpDj+FCVrFIDFsd8b9h/ij98dTRQzNHnret/U3wcg
	UuUTEXyQPuW224+qzSBWnaMYQuVVgRHMjZdwdRfjrf8LbzWVIwYqKcIswQA43RC/q46YHg
	CyeWpH+eW/2g36q2KM4CNR2xDmgJ4+fv8FFCAIjDk4Uf7+AowG+5NDDmlWHpzNVrBUbb3x
	cXoTu55woF45lI3b/20ibFjnh8nV9MozYqd+3x1O+FibWot7DtdJHuESmYz7rnf/9SGB2V
	NCsFLsK/Ugg5mG1QQexOSazCpgmgnG67kNUESP6LQs/KL4IDMc3BaldNgVzccQ==
Date: Sat, 12 Sep 2026 00:17:42 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
CC: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: net: add ruff linter exclusions
User-Agent: Thunderbird for Android
In-Reply-To: <20260911213412.3222759-1-kuba@kernel.org>
References: <20260911213412.3222759-1-kuba@kernel.org>
Message-ID: <F54B8FC6-F330-4E24-A55A-E903A47EF020@tipi-net.de>
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



On September 11, 2026 11:34:12 PM GMT+02:00, Jakub Kicinski <kuba@kernel=
=2Eorg> wrote:
>Fedora is now shipping ruff 0=2E16 which added a ton of more
>opinionated rules=2E Let's add some exclusions for checks
>which are both noisy and IMO of questionable value=2E
>We can still follow them for new code but it's a matter
>of preference=2E
>
> C401: set(x for x in Y) -> {x for x in Y}
>
>I find the set() a little more readable=2E
>
> I001: hard requirements to sort includes
>
>A little too much
>
> RUF015: list(set_a - set_b)[0] -> next(iter(set_a - set_b))
>
>list + index are more readable to a "C person" for sure=2E
>
>Signed-off-by: Jakub Kicinski <kuba@kernel=2Eorg>
>---
>CC: shuah@kernel=2Eorg
>CC: linux-kselftest@vger=2Ekernel=2Eorg
>---
> tools/testing/selftests/drivers/net/=2Eruff=2Etoml | 4 ++++
> tools/testing/selftests/net/=2Eruff=2Etoml         | 4 ++++
> 2 files changed, 8 insertions(+)
> create mode 100644 tools/testing/selftests/drivers/net/=2Eruff=2Etoml
> create mode 100644 tools/testing/selftests/net/=2Eruff=2Etoml
>
>diff --git a/tools/testing/selftests/drivers/net/=2Eruff=2Etoml b/tools/t=
esting/selftests/drivers/net/=2Eruff=2Etoml
>new file mode 100644
>index 000000000000=2E=2Ef58d51f35317
>--- /dev/null
>+++ b/tools/testing/selftests/drivers/net/=2Eruff=2Etoml
>@@ -0,0 +1,4 @@
>+# NOTE: keep in sync between =2E=2E=2E/net/ and =2E=2E=2E/drivers/net/
>+
>+[lint]
>+ignore =3D ["C401", "I001", "RUF015"]
>diff --git a/tools/testing/selftests/net/=2Eruff=2Etoml b/tools/testing/s=
elftests/net/=2Eruff=2Etoml
>new file mode 100644
>index 000000000000=2E=2Ef58d51f35317
>--- /dev/null
>+++ b/tools/testing/selftests/net/=2Eruff=2Etoml
>@@ -0,0 +1,4 @@
>+# NOTE: keep in sync between =2E=2E=2E/net/ and =2E=2E=2E/drivers/net/
>+
>+[lint]
>+ignore =3D ["C401", "I001", "RUF015"]


Reviewed-by: Nicolai Buchwitz <nb@tipi-net=2Ede>

Thanks,
Nicolai
