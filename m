Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3119235C6B2
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 20:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283144; cv=pass; b=lfxVFcyg6PELLIW/XN68yxciTiWwYKUxqoC2gAUSfK5Lli3L8mFaPJLBflvCGP1ZH4w3L6HUgWN/zk3USnHyYefGB9uz6E46S3l1wfz94EpJXBGW0P7GWsfPHwj2h7x9FcbquAhbeFt5rYnAzP8FjM7kk85NdqduaMFpANwIOlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283144; c=relaxed/simple;
	bh=1Y3VWMLMpTXAw8ZVsUyN351JI/061EwoN+fB3bnDV6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iz5NtPaZemrjQJyyjEl5TETJPqdKeN+3zt2d5PxP7zu3uDq0sgLCZBxwyEUjpPh7C/TUyVbXbMWBMbSSjoDFiwM3dXJs+f9vY9ir4IjBgCbXA2QeBJjVz9zM+6G9T34LMybZMP4qJ4hd/NMdbRs7mtp4y0Ilro4c4LulRFURq4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B7gs71S8; arc=pass smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B7gs71S8"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-1438cb9b3a3so243070c88.2
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 13:52:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790283142; cv=none;
        d=google.com; s=arc-20260327;
        b=HT5RHRXHXPTS62tRVSAI0oHg6cu4ELxzO6Ys/4Nx+ES7swmrR4lgc1Va6g5kwv4UJy
         MK03CQXp3/xptYrPCASwqP1WlJ9RLGQpao2vdDIBjcoSbBO9VSYMd0sxp7XPfbdia0Dz
         vJAYkYmcSrsPkdp+osxofNHPC2lpVqZL+IMeWAwESlgtsLpZb3ABR78t2zPQVpEibHok
         nZ8MmmxV/pxcEPPhOEnn038Ye4yygM3HHm8Oev0RzFRZP1c9Is2CcbLz2X3UPS+wNFNK
         tAPRAU045Phc+HW2WPmPtFfGzd23Fem+QVrehq5epa+ov6qnCBjBaVSTC1MuKQ8D8bUo
         1d9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8QCxlr5hcX0GAovL09HOwWU1CQDfW/2iGH817aHNyKA=;
        fh=IvPk5Lxn2aQjZUGNV8GlTg0vx3+1fbHnsGqcpdC1Aeg=;
        b=JsUS2NBA3JCKAkfTzD6B012yzyXki3xyw6YQktCHz8jCUC+13jv2iFjbTkWCrvsMEC
         FvBpTkWqMICVGvTCrCT8ZML03upoWfxE4KbmDRyBe3LkgGrEqpz5fb+VsDfF63AMEgXs
         7VxVSGCr9/gxj1/IaAxDED3sQ3GQvdWKKAaJTBrU16HoaUsCXoMMvk4APrEX9gErqn3T
         amtGxzZvluaVAy01H+b7+GsmKJk5nnUHEM6g4BpQdbrYIkwUZLnn/mYHk9CMMt/knv+m
         zfwYGMXj9VM2vsXHPPHJzMxX2YjwDy5htcb4Je8TdQw9A5K34joy1eEb6ywKn4xCw4z6
         g+Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790283142; x=1790887942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8QCxlr5hcX0GAovL09HOwWU1CQDfW/2iGH817aHNyKA=;
        b=B7gs71S84XqLmYsAWw5cc0nRzLuCWhRDbbnRex4Nqu8gOCz6U5tBY/zGEpT+J9AsB1
         2q3ht+nt4wGR7xZBwGR95k/FZmDZ5VaETK1QJfHtCcnx7mCveEoPTVWPgiEvt8D/3RWV
         saUxfyOoNH/HSyToY/vcYNaLcpVR55RvKzCJbUz1rOeRK5XfYuiZ2CCGoMge3vlPkkHV
         1nmXQepe40padTDGVz/1PFNoh7KKKm4WoF1XwCPGqhSg4IX36HOjfLYFSkUo9FvTePli
         HOstnkBR0tegbavJDRg/aBxeMaTE78Zg3bhykGYwIpFQCW+3lXdcr03bCqLtsBedDG3b
         tX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790283142; x=1790887942;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8QCxlr5hcX0GAovL09HOwWU1CQDfW/2iGH817aHNyKA=;
        b=wf5zl+f6FoMl37SXY22yaEoVIXTJ4cQnI8Ghkb8PWsKfDlZbf1gSmXltsj1lvk6tNg
         aEeWZMG8cVc0WEGZmQguWih/Xhj6YAKh4qVRDFi1uD1N52cwsDpzzC7stcumHN+Lwgv1
         TgFXsI/3LqN1aCXSnzQnb1QzCcVsie6ZV2l+rBxbhvwcechkQr0V7F8xJJGbiq73WIpi
         PKFWFGuDXkP8cmLTXlStUEDMJ0taUSkp44zjPtMeVFAczMUVOYKlBYpsyBMiFxEUoX59
         FmQENzvdZAZZC8/YV+aF99+02xfM6S/9AIKrDcWYoWduMA3XYVDXp+Ni9aLPl0BeGobe
         GuCQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3YWNFcsJJ+6nt9+lsMQoaY6W0ErsQUkhS1Xt0plIm4unnK98Z/Ks6dEOpWzOdMAA3Eic01sBvm34Xpv4Vdtc=@vger.kernel.org
X-Gm-Message-State: AFuF++liXoZlpsUfBHhPjlo+OqpSrBkfWq7HfJ6hQqc8/tg4h2RQUi2U
	SiZ8RNoo9i0hNhWnWxSAJmTsfP+HULQTkoQGO5/AJsvDUCDxRAb4PXWuli23EbqG51KZSycfRGp
	3PDw9ih5wOvvOvJD0CUQosQ1mXxTayNZrg1TpAndH
X-Gm-Gg: AYBFou2CToRTY/8PlbEr0u9Okwym4ZkCSwUxyYg0ApzMeXsRtlypEYcviFzLsSDEQTg
	DFJeEf6Tuft6z6A4ZpQv5ry52PPwtWg52EPdshYGv9ATP/LRZfFNlrD9ujul5ohfX92BBN5pXAP
	F1pXLG//PglyUqO8Ls1GlYQWzjZJCtZQz+16gqzvJmLpxvAyoB6yJIO+tWqtymiV9ZSi+GB5yF6
	cxpj1xaJXpAc3HfC4Q6/TI6DhXMO8m8Y8nFrUCabbH7fqa8FA4HiQ582P5T20UmAvdEsHdZtFzh
	Y9GwsPbnpSVUbjmcElHiIMfeYJ8FOpneREkO3ptZgtruGwdOTLvkzA==
X-Received: by 2002:a05:701b:4507:10b0:144:ff51:2d5f with SMTP id
 a92af1059eb24-14503fd76e3mr2789597c88.33.1790283140101; Thu, 24 Sep 2026
 13:52:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908181956.1357684-1-kuba@kernel.org> <CADWJPTtu1bjng_1LWAbT7QtnkODw2A36Xd5koaiiESK_2ifHhw@mail.gmail.com>
 <87ce93dc-ece4-431d-a01d-3476a364fe0a@intel.com>
In-Reply-To: <87ce93dc-ece4-431d-a01d-3476a364fe0a@intel.com>
From: Sheena Mohan <sheenamo@google.com>
Date: Thu, 24 Sep 2026 13:52:08 -0700
X-Gm-Features: AclHuK_Fs4oHoJZz5v2xTgBrHek9_qiYSResd_gnSe1qLkdUbzhlvXwxq-zOnjw
Message-ID: <CADWJPTu_MOD7dFbmCQY0D9NJVKP3RpkLbsdugLOMvO7L45JnFQ@mail.gmail.com>
Subject: Re: [PATCH net-next] selftests: drv-net: warn if LOCAL_V6 has DAD or
 not kept on link down
To: "Pielech, Adrian" <adrian.pielech@intel.com>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, netdev@vger.kernel.org, 
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	horms@kernel.org, przemyslaw.kitszel@intel.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 6:25=E2=80=AFAM Pielech, Adrian
<adrian.pielech@intel.com> wrote:
>
> On 9/9/2026 5:16 AM, Sheena Mohan wrote:
> > On Tue, Sep 8, 2026 at 11:19=E2=80=AFAM Jakub Kicinski <kuba@kernel.org=
> wrote:
> >>
> >> napi_id.py intermittently fails to start its helper on Intel and Googl=
e
> >> HW runners:
> >>
> >>    CMD: /srv/netdev/drivers/net/napi_id_helper 3001::1 37569
> >>      EXIT: 1
> >>      STDERR: bind failed: Cannot assign requested address
> >>
> >> Either keep_addr_on_down is not set or more likely the address is
> >> configured without nodad. Having to make sure that all tests
> >> always wait for DAD after impacting the link would be a whack-a-mole
> >> so we expect the env to have nodad and keep_addr_on_down set.
> >>
> >> Warn about both while validating the environment, and document this.
> >> We could fail completely but most tests don't impact the link so for
> >> quick local testing it'd be annoying to have to apply the settings.
> >> I hope the warninging stikes the right balance.
> >>
> >> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> >> ---
> >> Adrian, Sheena, please update the setups scripts for your
> >> systems. Looks like nodad is missing.
> >>
> >> CC: adrian.pielech@intel.com
> >> CC: sheenamo@google.com
> >> CC: przemyslaw.kitszel@intel.com
> >> CCL hramamurthy@google.com
> >> CC: shuah@kernel.org
> >> CC: linux-kselftest@vger.kernel.org
> >> ---
> >>   .../testing/selftests/drivers/net/README.rst  |  9 +++++++++
> >>   .../selftests/drivers/net/lib/py/env.py       | 19 +++++++++++++++++=
++
> >>   2 files changed, 28 insertions(+)
> >>
> >> diff --git a/tools/testing/selftests/drivers/net/README.rst b/tools/te=
sting/selftests/drivers/net/README.rst
> >> index c6bed9a985bc..3fe49bce4f3a 100644
> >> --- a/tools/testing/selftests/drivers/net/README.rst
> >> +++ b/tools/testing/selftests/drivers/net/README.rst
> >> @@ -70,6 +70,15 @@ LOCAL_V4, LOCAL_V6, REMOTE_V4, REMOTE_V6
> >>
> >>   Local and remote endpoint IP addresses.
> >>
> >> +Tests reconfigure the device freely, including taking the link down, =
and
> >> +expect the addresses to work immediately afterwards. IPv6 needs help:=
:
> >> +
> >> +  ip -6 address add 2001:db8:1::1/64 dev eth0 nodad
> >> +  sysctl -w net.ipv6.conf.eth0.keep_addr_on_down=3D1
> >> +
> >> +Without those the address is flushed when the link goes down, or spen=
ds
> >> +a second unusable while waiting for DAD to finish.
> >> +
> >>   LOCAL_PREFIX_V6
> >>   ~~~~~~~~~~~~~~~
> >>
> >> diff --git a/tools/testing/selftests/drivers/net/lib/py/env.py b/tools=
/testing/selftests/drivers/net/lib/py/env.py
> >> index 25903f580b40..6262080a8bf4 100644
> >> --- a/tools/testing/selftests/drivers/net/lib/py/env.py
> >> +++ b/tools/testing/selftests/drivers/net/lib/py/env.py
> >> @@ -239,6 +239,25 @@ from . import bpftool, RtnlFamily, Netlink
> >>           if missing:
> >>               raise Exception("Invalid environment, missing configurat=
ion:", missing,
> >>                               "Please see tools/testing/selftests/driv=
ers/net/README.rst")
> >> +        if "LOCAL_V6" in self.env:
> >> +            self._check_v6_env()
> >> +
> >> +    def _check_v6_env(self):
> >> +        """Tests bind() to LOCAL_V6 and bounce the link, it must surv=
ive both."""
> >> +        ifname, addr =3D self.env["NETIF"], self.env["LOCAL_V6"]
> >> +
> >> +        def _keep_addr(scope):
> >> +            with open(f"/proc/sys/net/ipv6/conf/{scope}/keep_addr_on_=
down",
> >> +                      encoding=3D"utf-8") as fp:
> >> +                return int(fp.read())
> >> +
> >> +        # 'all' wins when non-zero, see addrconf_ifdown()
> >> +        if (_keep_addr("all") or _keep_addr(ifname)) <=3D 0:
> >> +            ksft_pr(f"WARN: net.ipv6.conf.{ifname}.keep_addr_on_down =
not set")
> >> +
> >> +        dev =3D ip(f"-6 address show dev {ifname} to {addr}", json=3D=
True)
> >> +        if not (dev and dev[0]["addr_info"][0].get("nodad")):
> >> +            ksft_pr(f"WARN: LOCAL_V6 {addr} not configured with nodad=
")
> >>
> >>       def resolve_remote_ifc(self):
> >>           v4 =3D v6 =3D None
> >> --
> >> 2.55.0
> >>
> > Thanks Jakub. We will update the setup scripts on our end to reflect
> > this configuration.
>
> Applied to the setups, thanks for noticing about that requirement!

GVE and IDPF executor test setups are now updated.
