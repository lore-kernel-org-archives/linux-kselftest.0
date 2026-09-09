Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F98B2222AC
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 03:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788923795; cv=pass; b=sIV7oI3k4KIqr4uLQhyEI64qBEqdGjeepDZ3w1LNaj9WotWPK/67v6+eKxDokWUi0MhUddx5gg6AbXszPIOlIXUAjmAtomL4rU0wLItBkwPPNNcp3pUraBJxpwRMQw7HmMbzAKZ28HZThgzabwLySwu6OXigbO0jipHoF+/VPhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788923795; c=relaxed/simple;
	bh=kR3rI5ZBhblehYeXOA3quNdN/DYbRWk6KMadfxFPlo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EFYAfPAFgnlBwVIL5/Xb3xUZUWvIKKOFcMX/wO/FCgIMLrPcGXBDzMFnBUJZRdvCHMW+/JcSmxdNhf8HKf3EFfR2pBP0XrS9dJXLQDyY9Dl68+WGWxjrIgUbvgzIfYNVKbWUvMsLStZqmAedaoSbIXK9tOHGFoWwyCZF3kPeASY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R5LdeIFZ; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R5LdeIFZ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb750so548607a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 20:16:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788923793; cv=none;
        d=google.com; s=arc-20260327;
        b=UK1o8tIazzRHV93R8rUCDWnHlN3qngRBaFyenIvGzPTLSKH10NaG75ZYV7kz02LSee
         w0I4utMpMlvFEKWREOiCdEVWOnV0Bt8gnaBIJnK9yZUmFnj/yLbP87sJkZ7Qp5EgU2Y9
         Cc9ynPxykB/Z3v0NQFPKnNlscio6LB1XNlOYR1xJAcW25A8eBD8ScSwix7TMM6AlL2CC
         N3L/EPNzsaC1dDzDNxeG8bevG1amGNyDp1xZgbpaZwx9yEz66g5GfJguhDj88zmrKTfM
         ve4f1Ybx3xSaDPRWPu5LclhvMQZHONCPjVozj0rOMhQT1IYDR2RpGpkGenU/LC77rCp1
         pPUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uUP7EYG2/BuYJ+2rnh8UBitNWg1RgcNvcJgxVe8/WB8=;
        fh=bNmdiDi4Q4ZDcKmVWsFZlUs5ATK8dI11k6mlnCzIt1M=;
        b=KRkCVH+w9dI/d7MY+R+pIBr6Qm8efxgi14Nt+9Mv8EZFZtYcY/X4kk6a64ntXAhNBp
         q6DSydmudBm01ehRWvN977wh6MumoJ9hx3fEdRDttQ9e8N/Gh9J7GTvTEqcl3zIx7EOn
         zUuambdPHULedvsvrPSaRoTouy//SMhHO2IBqgbri6rmZuoVwBWmjhXZd7gSKW4lG9jc
         eKdrSMLTbrJgk5uyGZ89LL5+tYoEwGlTr0QG/jMWItsMmFT+H9VrUUbQnjvu4uxb8qB3
         KbqN+B4OgRUNuuOXj+DOtMa+EYF0AJtfQ1hSXmsohwuvwaEeyduBMwhW/sRGfJze8IEx
         L97g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788923793; x=1789528593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uUP7EYG2/BuYJ+2rnh8UBitNWg1RgcNvcJgxVe8/WB8=;
        b=R5LdeIFZlg2IIIrGjR3l5hV1urwf/7goZPQ9vkxedLtToIiSiUMRTxNi99j9r6oHJV
         dknWYidgMPPcsSiT+mHxl4ar8qiIOHIOwYIZKSnf5ujaroQ7iN/Sy46cmT0VqfNsO1SA
         jt0EPw6/fbD1q4+gzXrugOEpZNcpkOHS+v9vHcg8N4yU97psXAQJZRKHvDHbzbmAdYRc
         RKTCqukflG98Grt+wh/CfJ5eBrqpy7xhVAQr4fOgaULjcCuem8vmNGdkiSUr/luLaWDI
         PLxXRNYxFhV3g1ULBETkH5hSM3Jun/MkQGA14x+GIAxf8Ibw/FDLvG+uvx10BDz3J/Ty
         s/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788923793; x=1789528593;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUP7EYG2/BuYJ+2rnh8UBitNWg1RgcNvcJgxVe8/WB8=;
        b=c4v8EsaOypzWPd3sz/xe2bwiiHLzgGDgduFUpA1QyeGIf1C0PMTevREXqfX/gcZM8p
         nk0arUL7dAyTxTfyHBoGX0eoxxtrV7fjy4xYeFmk+ZB5ilQsoaJjy44ggHYdd89dmBC1
         6qhLO992LHL8jodu4dKy9U94PXLmqSzajaYT4RMWppm9vnMOfxgeHajXNexfgsa4UUzr
         JMuSjixS+9Zz3eyRsomOGzEyd6fCFOdymTvDETlNfFzO/c6EjnREVdWwYpk52Lyj6Z+N
         vM4DymUrWC1J7zhsHU3xfykLjDdg7cFfHHULf1HifGV9dNOXMMUiZNZtsRx1HKZxFpT3
         YACg==
X-Forwarded-Encrypted: i=1; AKwUvBz2l9uz/yBH2i5nkGOgYy83HxxkG9CUj1qvfIMKyUlTvvzqDGHOSnPeQc5fmV/B58ki+rVX2ISKcqfQ6xw8tUQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lBkmPfscl/2t6aiB/6yy6ddmw3KXdNFUEr9eOUKCgJoXnkftvU
	2oqPWJBWiCNhhchW7IaGVL30JZAsrSjd1R3xAHu6ObiOQI9He9R3yARDWONsUh9U5qqB+eZ2Zn2
	X0hUdMca6JtHQKQdAS0dCR9DDDCtz5JPAlEy7fvQd
X-Gm-Gg: AYBFou0GKv9vFY7wEfzI5JN0oZECRnPTJ8lZHNVXKm2yEAKTaWiI7MJkXTCJzJ0IZ9Y
	IOfNmBdcWHnMyjaW2VPcgLT/EJRnh1Y1dzRmbvClzWnGC1g09yHx0Bi08Rpe5yGcdzwtAwzb+Lf
	uZI9NC2GMoQsNaoelK2F2+g4K6xusJZB2M5Ds9LruiBdocjyuet4naePA9cVSROA4rzYOWzCqXo
	GCZQKjhVjB9h3hvvtNRibteetSxBHzQJbsPSd2CxG4C9awxAV8PG5kIUm/afwhy9GnjapUEaG7F
	1hsOt4rOZ+WQiJEiLEw6KYNMKmf4pTD05Xer7f6cb5cfhnSLeG5OVoO3uz/lghYh
X-Received: by 2002:a17:90b:4a4d:b0:392:b509:b1a5 with SMTP id
 98e67ed59e1d1-39bac34a6d6mr4250028a91.14.1788923792039; Tue, 08 Sep 2026
 20:16:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908181956.1357684-1-kuba@kernel.org>
In-Reply-To: <20260908181956.1357684-1-kuba@kernel.org>
From: Sheena Mohan <sheenamo@google.com>
Date: Tue, 8 Sep 2026 20:16:20 -0700
X-Gm-Features: AcwNN1V_oxZXXw8CItOFCp-irJrBaC0B0lCHygpM6-ISZJc53KtazMqdczCIFe4
Message-ID: <CADWJPTtu1bjng_1LWAbT7QtnkODw2A36Xd5koaiiESK_2ifHhw@mail.gmail.com>
Subject: Re: [PATCH net-next] selftests: drv-net: warn if LOCAL_V6 has DAD or
 not kept on link down
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, 
	adrian.pielech@intel.com, przemyslaw.kitszel@intel.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 11:19=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> napi_id.py intermittently fails to start its helper on Intel and Google
> HW runners:
>
>   CMD: /srv/netdev/drivers/net/napi_id_helper 3001::1 37569
>     EXIT: 1
>     STDERR: bind failed: Cannot assign requested address
>
> Either keep_addr_on_down is not set or more likely the address is
> configured without nodad. Having to make sure that all tests
> always wait for DAD after impacting the link would be a whack-a-mole
> so we expect the env to have nodad and keep_addr_on_down set.
>
> Warn about both while validating the environment, and document this.
> We could fail completely but most tests don't impact the link so for
> quick local testing it'd be annoying to have to apply the settings.
> I hope the warninging stikes the right balance.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> Adrian, Sheena, please update the setups scripts for your
> systems. Looks like nodad is missing.
>
> CC: adrian.pielech@intel.com
> CC: sheenamo@google.com
> CC: przemyslaw.kitszel@intel.com
> CCL hramamurthy@google.com
> CC: shuah@kernel.org
> CC: linux-kselftest@vger.kernel.org
> ---
>  .../testing/selftests/drivers/net/README.rst  |  9 +++++++++
>  .../selftests/drivers/net/lib/py/env.py       | 19 +++++++++++++++++++
>  2 files changed, 28 insertions(+)
>
> diff --git a/tools/testing/selftests/drivers/net/README.rst b/tools/testi=
ng/selftests/drivers/net/README.rst
> index c6bed9a985bc..3fe49bce4f3a 100644
> --- a/tools/testing/selftests/drivers/net/README.rst
> +++ b/tools/testing/selftests/drivers/net/README.rst
> @@ -70,6 +70,15 @@ LOCAL_V4, LOCAL_V6, REMOTE_V4, REMOTE_V6
>
>  Local and remote endpoint IP addresses.
>
> +Tests reconfigure the device freely, including taking the link down, and
> +expect the addresses to work immediately afterwards. IPv6 needs help::
> +
> +  ip -6 address add 2001:db8:1::1/64 dev eth0 nodad
> +  sysctl -w net.ipv6.conf.eth0.keep_addr_on_down=3D1
> +
> +Without those the address is flushed when the link goes down, or spends
> +a second unusable while waiting for DAD to finish.
> +
>  LOCAL_PREFIX_V6
>  ~~~~~~~~~~~~~~~
>
> diff --git a/tools/testing/selftests/drivers/net/lib/py/env.py b/tools/te=
sting/selftests/drivers/net/lib/py/env.py
> index 25903f580b40..6262080a8bf4 100644
> --- a/tools/testing/selftests/drivers/net/lib/py/env.py
> +++ b/tools/testing/selftests/drivers/net/lib/py/env.py
> @@ -239,6 +239,25 @@ from . import bpftool, RtnlFamily, Netlink
>          if missing:
>              raise Exception("Invalid environment, missing configuration:=
", missing,
>                              "Please see tools/testing/selftests/drivers/=
net/README.rst")
> +        if "LOCAL_V6" in self.env:
> +            self._check_v6_env()
> +
> +    def _check_v6_env(self):
> +        """Tests bind() to LOCAL_V6 and bounce the link, it must survive=
 both."""
> +        ifname, addr =3D self.env["NETIF"], self.env["LOCAL_V6"]
> +
> +        def _keep_addr(scope):
> +            with open(f"/proc/sys/net/ipv6/conf/{scope}/keep_addr_on_dow=
n",
> +                      encoding=3D"utf-8") as fp:
> +                return int(fp.read())
> +
> +        # 'all' wins when non-zero, see addrconf_ifdown()
> +        if (_keep_addr("all") or _keep_addr(ifname)) <=3D 0:
> +            ksft_pr(f"WARN: net.ipv6.conf.{ifname}.keep_addr_on_down not=
 set")
> +
> +        dev =3D ip(f"-6 address show dev {ifname} to {addr}", json=3DTru=
e)
> +        if not (dev and dev[0]["addr_info"][0].get("nodad")):
> +            ksft_pr(f"WARN: LOCAL_V6 {addr} not configured with nodad")
>
>      def resolve_remote_ifc(self):
>          v4 =3D v6 =3D None
> --
> 2.55.0
>
Thanks Jakub. We will update the setup scripts on our end to reflect
this configuration.
