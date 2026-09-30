Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3D64E4331
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 13:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775829; cv=pass; b=lKnuN1tq4vmVrl9TEd4sg5j6Lo5mC6QWP4GU75pGjSsbTBiXC0ZiOq7uq+DIHJdbNE9CC2+ozQUfxTk4oxsO8THPvRHCSTIik2EWetIfn8kyu4juqwYBVhUNhPc2Vl/hUJ5FsQg61j1LZR6VGIw6New2k9qHd1qhW7IKabJiTdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775829; c=relaxed/simple;
	bh=cCtGCKJIdKETCLLrblWPIJiV47ko5Aowu8J0xSZcZvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXAbrc0zeuS4a90c+c04jISnc7i3lMUIWYFEWmbDbLloy0cTndmdN9vg4qcoNbScLpIl5UiZpqC2slAl+5r48Y6fw8wp1qvqQ/OJeMYQ8R0e1yS4ygnZDhaFGx7mOzBQgv+5lVy46fF9zZx+yywgI6gRAmuSD3ZAy91uya8Tp2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Abwb83fs; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Abwb83fs"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8cbb7b9cfso4305448e87.0
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 06:43:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790775811; cv=none;
        d=google.com; s=arc-20260327;
        b=UF7uZLOFmEP1/7FCAsi9f/mSEzCleA96iRK0MSoaZ3lapzPke7x2WsjEbgIHVPyzdE
         /zXM2vABuhRbA+cRQZriSom2yodV+qthjbr5zGCXa3H804+shlEkQmtVi/1epgmCfuEU
         +AIfV7P553SRav3YFH2vtihnTbRp2zQRCBg5tnXV2NHU0OfcowdswdDRKQr3r0AEfXA8
         qKfUPlOATkJum0jkkaY1nHQEbiHOrrBORD8oJpZpN7nynRfD2C21wSWqSP+A5ZUkgM8F
         q3CiwNyut6gs9BkPY8IEwNnj41Ir7G+fyyJJaKvrbLFxMwByG/htKZ2UsA6vIpKTu3Gv
         ZBnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cCtGCKJIdKETCLLrblWPIJiV47ko5Aowu8J0xSZcZvA=;
        fh=TtJ0mAXE0NTjDUv9QDhW2+Yr1lwuZaJBlpJZN3+GH8E=;
        b=MChJ05w43/CliUH7ofYNEtM4bHHxhKwEyPy9/xN3hx2fdT/N1Q1eezAYmSM9q65nUT
         0yWsRL6WtZKj+MNjaPwRSn6GVOs/y6sNCmCP+BB79hYJoXYkV1tYDMR6tCMfEVWyAqo0
         qk5RO/+5V5bqglsg4H3wiM8139+oYBd5N1pMJKZ3YKbFT6k+xgfOYm6hCuTbnRL13HqV
         oht3ruPyyTcdaS5UEoXEIC7Tm7Eo5fxUOIdSwIil6HYQ2Y+RPc8bQ7jISVlYcnAt4XTf
         aCE1mviW59xbnKefEAi1SDDzb5wtdeq/hDxoBuB2qhQZP+P/Ba2rrt+MNp2i79NM1MRw
         c+Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775811; x=1791380611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cCtGCKJIdKETCLLrblWPIJiV47ko5Aowu8J0xSZcZvA=;
        b=Abwb83fsHbVpFom07AyBbpD8lFlxcGjmykARrOKp1fEkZ5oFgOMcOil6oA+XBjIA4u
         VpHxhpr99eY0XrjQ0fH6vQj2WGP4SaUUkQbPZkV6eL0+Eh2K7xGmReydj100JWDeaA2m
         Ejoy0YYjPwnLLA8Qva95dPsyhbZy/LE7x2OPGuRAf8bSsFJfjKIMEzixk/DfeL/Fv3RF
         4QI1Yh3RBlRp2YPpWQI0aph0AsUN5ZcrBCMzRRZkvqgau45sRl92pAOYYeW6f+yjnCHQ
         sWuLaMYhVV1MBs8lB3BGRT3u97pMMllnj4pmMtDtq19bRWSxI1U8dgz459H0yoRTlXuq
         Tpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775811; x=1791380611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cCtGCKJIdKETCLLrblWPIJiV47ko5Aowu8J0xSZcZvA=;
        b=sKj9nVcMndKbgbRFiRekNLVo+uH9joNAYlmE2ks6yNWruPctPuyOBq2KvkGQDdBJ/1
         zQ8BMAZ5GWvS7RA3tx7zjMUG82INu4zR2dYx8aZMdtil+8wg4uVix/AxGH3vbR5/Qfh6
         /TK9/Xy74r84jVbbnq3+mJQVJST1sjLuEOBXwJN6dFofQB6AtdaSVJyi8eQsHzdw+Nbu
         wUyKpPqAOxXTop5P45ch8UwcXJoO/kd04UI7sZMyhyVLrQrjl6+B8Lj/OFT67OrvnWzR
         NDAPzuTd3GoanI6ZN6zd8BwnxBdCCN01ThLK6BdVPO+f0Dm+1+v9lYpj9aQUA56MNWYv
         4cvg==
X-Forwarded-Encrypted: i=1; AKwUvByt/VDRK78+dG3I6Bl8cyA19L8iAcqSMZ9VUpc2C/ChfqhEfkEQgdIPMwyntxZ9EAKZlLMFhWuxMm1AuqOa8KE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdwBPTiVA0hE3mNrfkUarWolT4IiQaawjphMBfM7+5ep0vcPef
	NCFtkRWPzJI9A712Gui1oWT3s0+Yb4EzFrlSO3CNjFa3PmiyIpAlDNTMa4tFQ+xfhAaw/qBDnq0
	08jTxm+fI9C1EgwVVQlGc4+ttPuvJZRQ=
X-Gm-Gg: AYBFou2AUmumOC51vMGEGkCVziKFGAaLm06RtOQyckO4i1EB5GES0qTiIvdt7Ogw4Ey
	xxy2dvw/ci9qjTQSwOo9Xsmp+CJc/YVRrM/dr2QgsNZnhuiWNdduUDAt/Gw3jyp/nn1hESs0Z7o
	rIFnE/+v5C+bkNKuDQyVlqGbf+0b9XZv4V78OJ+LlhHUrokpyPXCjgDgorqhdnC2sS2V6Q9xv4i
	PJm2y/pMSxblVHAhM8ZPJ1EMjvfBruKaY03csQ+phy87bdWtt9MCaQE6tMtujqtFS/GUOlU5AZg
	Wd/zH9IqU5Meuvg4KFw0fJRlawANnVn7TyoZy6QUgw4kGKe1ixlFtckmIWmNoeRTTgzkvcaEV9W
	zlyYFBkCSeXKhG4ye6Sqqqdg5oVR1wBaxaxcKle7J+Udo
X-Received: by 2002:a05:6512:3ca2:b0:5b8:f83b:30bf with SMTP id
 2adb3069b0e04-5ba405f9b82mr609416e87.65.1790775810584; Wed, 30 Sep 2026
 06:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930112842.21323-1-sigefriedhyy@gmail.com>
 <20260930112842.21323-3-sigefriedhyy@gmail.com> <235a33c2-7138-4815-820d-793568757d95@6wind.com>
In-Reply-To: <235a33c2-7138-4815-820d-793568757d95@6wind.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 30 Sep 2026 22:43:26 +0900
X-Gm-Features: AclHuK-5JDzwUkEH5VWEa1bCvpw7pms_UcYcspNYWPTwaPuJPPDlw6Pn3dQKWJk
Message-ID: <CA+7S2v+VaVYksOpuUKzo+DoWZ97M_XKvnMr8cCcgwTkrOxsvEw@mail.gmail.com>
Subject: Re: [PATCH net-next v9 2/6] net: change netdev_hw_addr_list count
 through helpers
To: nicolas.dichtel@6wind.com
Cc: Ajay Singh <ajay.kathat@microchip.com>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Kees Cook <kees@kernel.org>, 
	Kory Maincent <kory.maincent@bootlin.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> If you respin a version, you can use netdev_hw_addr_list_count() in
> __hw_addr_list_snapshot() also.

Thanks, will do if there is a v10.

On Wed, Sep 30, 2026 at 10:03=E2=80=AFPM Nicolas Dichtel
<nicolas.dichtel@6wind.com> wrote:
>
> Le 30/09/2026 =C3=A0 13:28, Yuyang Huang a =C3=A9crit :
> > The count of a netdev_hw_addr_list is changed in several places of
> > dev_addr_lists.c and a few drivers read it directly. The next patch
> > needs to account every change of the count of dev->mc.
> >
> > Add __hw_addr_count_add(), __hw_addr_count_inc(), __hw_addr_count_dec()
> > and __hw_addr_count_reset(), use them for every change of the count
> > and rename the field to _count so that a direct write stands out.
> > Readers keep using netdev_hw_addr_list_count() and the netdev_uc_count(=
)
> > and netdev_mc_count() helpers, the few that read the field directly
> > are converted. No functional change.
> >
> > Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
> Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
>
> If you respin a version, you can use netdev_hw_addr_list_count() in
> __hw_addr_list_snapshot() also.
>
> Thanks,
> Nicolas
