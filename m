Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEB8415F32
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 10:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789124234; cv=none; b=ENHrnyxvet2mmf499+5SGN+j+Nowbmihzyvfk1GJjwRkWZpXr9bT714iTuYc0BRPbcBN7HTpNY/zMBV7z/a4Tb6B/UUzY+DEXJWRQPplL00ar/1oyLGywLboNoTx9lxivqthy+pg5+Wi5DmCOGX8b6wEGiAPrq0skJ2rE1nWtqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789124234; c=relaxed/simple;
	bh=ujhajdxsDtMtcxp5FbkMYUT3/SFZiAv/3XqaRDnCtSE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cHcMVV15tCm8dT5UAvMg0oYUSrA+UmccuM1iEnb+4UEiZ1nMsnjXMqQ9AkQnQzVmvBivFLnf2XyYmi6SWZ7vxUCGEQK4b4j4vS841azgyQlE6dWg0j9z0jr4vyczfwQJ9Jz/kfhduku2fd5HRmHw8GrfYwRk8q5EqjvjrZYrItk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ef9CgBUX; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ef9CgBUX"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd148aso7316426d6.2
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 03:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789124232; x=1789729032; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3rQKPjczWN0Jvqf2b9cJEEAba6rDBL2mDgyS8mK50Vs=;
        b=ef9CgBUXPstUmDa6Q0VOTfV5IkC9lXjVKnRCV7wR7NkJ6jgwuZJ9SUiQXDI46ngWlh
         7unhA+sj1rwBxPjT6v9X2cEHyV/Dum934OeFi/N+IINbivgLvA5gWaMorZy/9RDpwbJQ
         5S+O2A4NPf+evw+f10RV9tPFZ7DomFth8mXWD1Qrq5gFZfWMkNqtHdPaJxm3yHIvx/zb
         RGyFJxFbxiJJyumvKaQAlhbmR1xNoZKO3nqdm20VSHbhC9y+RNpU6s4qu9AsNcxcR+HW
         zJ+NXHYtaPqHVPCac4IrvXIl/LYVaZ+e2O0BRFtut7OX6Bl1yqX/0RLT1Rb+OZ1u5RJ+
         2MLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789124232; x=1789729032;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rQKPjczWN0Jvqf2b9cJEEAba6rDBL2mDgyS8mK50Vs=;
        b=g/p9+9y+6GcYB0xce5U7CXhTFbXnqWgjIr2OjwrByeoFbdho8rF1+Z4teIIRHSN0wY
         CJf+Cz79D5uxXCZyiM/9SytyFSujQkeR8sv0NL1p2VzcF9mDCGqgdagAdJa8lpGeYyp5
         xOBiapGji5MMeWKB5Az3+p9oeYzYtVoow8CcexCwWuhMBZL3Oajx3zEeKUcc+pS7LXNI
         TflyWe9DKVGEN/oB4m5YGgZSokxPIW8ruy/FQSMa3ZiefRHua2w/59r8542U1M1LQosx
         vlfkiCoDRuJKV4TfLq0t6NJTe5bLi/GTdTMqpEHK8wGbsH/Q/FMtEd0MLCDK1iEYZpHi
         LxFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXZx310E43n+0v70opAXajMPHjaYyv0Gs4las/0FTS8fzNrmO9JCPV1uwth2tfa4k+zfQgLvdEI61JbziithU=@vger.kernel.org
X-Gm-Message-State: AFuF++l2ArZpnjfc42li8djQW/FuoI3Jq4SdWwbQnJLL9XJFcOZ6lmnY
	yUueU8/IVsM8VMoXHjC+vQ/7rEGtvmt6q6UobTm4rB3Aq6klI6qGxSK9
X-Gm-Gg: AYBFou3T7pwD79Z1c8p+bJBD5qJYlEK4ZraaWPy9DAGnAPrA67eI7Ne8Bo6NAsv39zw
	7o2hXTXqVEpNqahM48n7x/bXLLP7eJ5MxSufVMl1HU1FRlRGw5LT8hVOyLYdT4gb/MWFw2ug9pm
	kKefRY2YtJFq7aOMvcJTZioDjITtxkF+VppEXC2n6w1tWFhKZKY54EikwOOPQtSHdziN3NIfwRd
	R5iKqaj+KqXTGpjx+EbjPtA+CfZFOIv5Qa9M0vcQgUvP3I+HWwKKiX7/hhT5OvobevC0DkbtAOM
	TV1jJUYH7xV3tbMFqYs9Hj1xxFhvWCXOaNMtnWiEJc1xVAkluPl59B/2x8myd6+1rQx/LNhiOCk
	AtrRa3H5lATxTAubjv7uqmiqDXBfUjYjyu081nz3Sery2+FOQ+OpfFmZd7hmLJalVUaMFl217i0
	jEhn/wb0dIlcM/NZkq4/RKipZAwgX1FJ5Xc9NQ9bz/UNoZNblhQ/3hpxoFXPwX5278cw50FyKTy
	5gf
X-Received: by 2002:a05:6214:ca1:b0:910:6ad9:d6a9 with SMTP id 6a1803df08f44-912120dc4bamr49465616d6.24.1789124227059;
        Fri, 11 Sep 2026 03:57:07 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47a239sm18167066d6.26.2026.09.11.03.57.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 03:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 06:57:05 -0400
Message-Id: <DLCFLUP26J73.FNVCZ4ALAUHC@gmail.com>
Cc: "Willem de Bruijn" <willemb@google.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net 2/2] selftests: drv-net: psp: test PSP and TCP ULP
 mutual exclusion
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Daniel Zahka" <daniel.zahka@gmail.com>, "Eric Dumazet"
 <edumazet@google.com>, "Neal Cardwell" <ncardwell@google.com>, "Kuniyuki
 Iwashima" <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>, "Willem de Bruijn"
 <willemdebruijn.kernel@gmail.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "Shuah Khan" <shuah@kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260910-psp-ktls-fix-v1-0-e3f30aaeca4e@gmail.com>
 <20260910-psp-ktls-fix-v1-2-e3f30aaeca4e@gmail.com>
In-Reply-To: <20260910-psp-ktls-fix-v1-2-e3f30aaeca4e@gmail.com>

On Thu Sep 10, 2026 at 7:46 PM EDT, Daniel Zahka wrote:
> Test both setting PSP after TLS ULP, and TLS ULP after PSP.
>
> Add CONFIG_TLS=3Dy to the drivers/net/config.
>
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
> ---
>  tools/testing/selftests/drivers/net/config |  1 +
>  tools/testing/selftests/drivers/net/psp.py | 46 ++++++++++++++++++++++++=
++++++
>  2 files changed, 47 insertions(+)
>
> diff --git a/tools/testing/selftests/drivers/net/config b/tools/testing/s=
elftests/drivers/net/config
> index b6989c7d3d9d..4838adf27fa1 100644
> --- a/tools/testing/selftests/drivers/net/config
> +++ b/tools/testing/selftests/drivers/net/config
> @@ -21,5 +21,6 @@ CONFIG_NET_SCH_INGRESS=3Dy
>  CONFIG_NET_SCH_PRIO=3Dm
>  CONFIG_PPP=3Dy
>  CONFIG_PPPOE=3Dy
> +CONFIG_TLS=3Dy
>  CONFIG_VLAN_8021Q=3Dm
>  CONFIG_XDP_SOCKETS=3Dy
> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/s=
elftests/drivers/net/psp.py
> index 315648a770d0..12b27f2a3fa1 100755
> --- a/tools/testing/selftests/drivers/net/psp.py
> +++ b/tools/testing/selftests/drivers/net/psp.py
> @@ -23,6 +23,8 @@ from lib.py import NetNSEnter
>  from lib.py import bkg, rand_port, wait_port_listen
>  from lib.py import ip
> =20
> +TCP_ULP =3D 31
> +
> =20
>  def _get_outq(s):
>      one =3D b'\0' * 4
> @@ -333,6 +335,50 @@ def assoc_version_mismatch(cfg):
>              ksft_eq(the_exception.nl_msg.error, -errno.EINVAL)
> =20
> =20
> +def _require_tls_ulp():
> +    with socket.create_server(("localhost", 0)) as srv:
> +        with socket.create_connection(srv.getsockname()) as s:

ruff is complaining about the nested 'with' statements. I ran ruff
locally via nipa, but did not get the same result. It seems nipa doesn't
use a ruff config file, and the discrepancy is because I have a
different ruff version. I was able to reproduce by upgrading the
version.

> +            try:
> +                s.setsockopt(socket.SOL_TCP, TCP_ULP, b"tls")
> +            except OSError as exc:
> +                raise KsftSkipEx("kTLS not available") from exc
> +
> +
