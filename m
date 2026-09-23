Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ADE531AFF
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 15:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177960; cv=pass; b=LXsvGrfuT18IyL85GXekITd81dAGJNjBJ/qjIhQVEwK5DAwvLNFQRR75riX2QXiz2JoNhJlWuOIXsY8/JiIIGOtXmqzrGeMzEdpis7fIaIKKgMpDSq/QEWrOunp4j2HGg+kV5aiFdhFhzZkUCPUsW8c0XcpOhAcoeyB64XlCy6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177960; c=relaxed/simple;
	bh=J0naHPaOnpDg2ShJmNsHR0YYIzm7VxWMF7m7wt3/EMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aEcCBExNVn2puM3ujZx1S6MXm3sqUUrZKaK616VPn7KEP73YyqA5LyKZcUZKxSmzVB/PUPO2BzFwHH282UhKcdgJMQ2lkWPSOcg6YCFB7t/gA7Ha7hPG6K+Etnk2J+qRmUvANOVlDGQkI+/p4djk1QNZu5LZVvcmgLG4A0T1qw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NupUiLUv; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NupUiLUv"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6b1b92a6a18so59686eaf.2
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 08:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790177957; cv=none;
        d=google.com; s=arc-20260327;
        b=OmpXjtq/wTaanuoP5TzkQKgOSAKdma/gqpy/yOC8sGAFgqI8VMOcerwu1WTO/ir4je
         dtoGX/5ybfXhC/FE1g5yUD8IbVXjTUrGq0gJrVYszRDw2MDgyvo4It76yV617yPdghUV
         r3BNyYjEbb3BsFK61KTXCoKjPtwDpjEYLKdlNWvnvphSaXVmT3i3oqgQcHauBq4c8Xvy
         yKhDjdYfii6QlKmrRTjZEVI0EVH/uO/rXvea0C7qQaYcy5XvERj92q8U9DLHq9fFrj2A
         kdunCU4XR4HXeeEfZ/dCh33qLKHfxUMzoLixPAbCvkywNYyBnfG/FwKHhCHXLEG0X7yf
         3JSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J0naHPaOnpDg2ShJmNsHR0YYIzm7VxWMF7m7wt3/EMw=;
        fh=ZAhlKRsPUZpnzQJlljZxJrJ1oNoVXJmlESYcEJ0O1T8=;
        b=qiy5fLjWHOZTx4Tih/UYuHHwNUgGLRXRYB0RKfrM7FKSfoIBOCLZIundOosszKDlo6
         1BTIKhJq28Z68HyChMy+Xzb2IG6+vzzpjbk15WtcP+Tp+8vv6EA2gUcjSQBD1JzOiuud
         Xg7rNBb/fh8Yw7scYY3POEyLmE1KAa+AbEJeq4ODqUnoQ3LzbKIuWpw768vKLQDoRJUX
         gE4oW7c23+JaxKCstXTeHzw+O+dlcR78cqj5Nt59sZCMxF6L0uxWnnw3o96o32dkTtoG
         /pM7CE8dswkVyEnysfWX5tK1mBADEiUjINw5L8oZxhH2uLn2M+wRLTbTtfzWRWn44BDu
         Nu9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790177957; x=1790782757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J0naHPaOnpDg2ShJmNsHR0YYIzm7VxWMF7m7wt3/EMw=;
        b=NupUiLUvsu7Z/KU+xCkZqtmp0YGwaKf2vFfzWTI3psJf+nZDndqj7oKzKwel6Oa+zn
         UJnv7kzrnHUMDBFcZSybsFOqNIFZbuPULSud2P3bNbP/TALLyXdEQxCjhi8JbJgP8k+2
         YC5fk/IwAQBmq+SFsJudjKD33Kg50M9NDqoEDaU30/Vpdd4gB0U0DccQIwLc1o8fw+t9
         jN/Ap6YtFAWbLyHE+zKF1cJV0/uempDWumF/e3nc0NkOXXjaZ4vXjFpMKXr3trUQPMxK
         DLGghUoUHdjiq0G4j3EItTz2pEWVSX0f9eijA75om7V7I09HT7QJ2c/+eHUEFrsWxwRE
         rq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177957; x=1790782757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0naHPaOnpDg2ShJmNsHR0YYIzm7VxWMF7m7wt3/EMw=;
        b=II1gVu0uMM9hIb7lQelbXUUAjEocrkD6WSfLMaRdYZzhS/EEdNpAyetyoUYm4Vwzhu
         KOiDcnG4/zhpSXd8cBbVnetBZZQZoKbuz6/sYR3VWjSz+Ytj6Lt4ziTNsyoIFZaDBtsT
         Te0EbW+vHTK+uDPuqf2yEKw6IaxKTSYJJozj6QA7Z4iGZsf/ixW2JH5/4WTp/Ezr2MJN
         bVnmoQXJyreY9qs83ZR+SBZU7m00GEf65ENe0H2DFJ42tMaiLKdH9BrP91MpHO0enUWM
         f71sqLFmyASjF86qFulUgPE0lV7EogZsy9gqhz/p4F2QuJi44t16EIenO9WGIKaf9Rqc
         Gk2w==
X-Forwarded-Encrypted: i=1; AKwUvBzmB808aBs7d4oLihyjK+5/Hm6CQiNpSmmHR9UNZlwE1JoMpP6BwF/v+qcMf0RPG0sWQ/OnKKmA/em3hMMm9uk=@vger.kernel.org
X-Gm-Message-State: AFuF++kpjfSp6g4I1slbdsg5iLLHqQzvz+0OCNKCz9hSlJlfQzmdP37S
	6l8hQThhH4unPnXbGhpxrLcCnH14+30R/9C0jA5DEo6ICm0SqzqhvK9ATqx6mnOjTGM57pG0/1E
	5xUZM0esDnXl7Ap/DmHF91X8JX2WB1QI=
X-Gm-Gg: AYBFou2cR371ZVsJvQlrqiDW2xvcLy6Bmy4qy7MAKP1HfGHgfTLTnr6gZqcRYokZDEj
	nFUZX6z5cJufuXeVzu+JMj2RGuvnVobBHgskIIxin1PkJES6NcDzjl404xjmT/sRWwWAtP5Im/r
	cNligaWEdQoL68sWZ2mL6m1bjX3C5JHmb/8dkHmr9LYY/LZ463+dlpsbyqdrvrn0X/W2hi7xe79
	vhPGcd5cd9vRNB2ORBFA+H5CGVODJDD1B+qpSOXg6/qhKRpuXiuORomNHuaaq5EJZi/ib4mHHxS
	o0jnMLX/jodp0XBapB60lFMQpeki5pPNTHurUELtmX9tGtcg5pFZS1fG/7jIqH7b3M8jOms=
X-Received: by 2002:a05:6808:1582:b0:4c5:6b14:a2d2 with SMTP id
 5614622812f47-4d5b89c0affmr3913291b6e.3.1790177956718; Wed, 23 Sep 2026
 08:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org> <20260914-netcons_ratelimit-v3-3-8e81b789ab37@debian.org>
In-Reply-To: <20260914-netcons_ratelimit-v3-3-8e81b789ab37@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 23 Sep 2026 16:39:05 +0100
X-Gm-Features: AclHuK-QgcIqftUxh16QhJeV_h-FMaPzu0_1xOVp5f_OWxqLY_Kv1c8tOFDe05M
Message-ID: <CAGSyskW1M6ZMrSK6hTOinHOZkHH1H15Niq2-GU13EdL2BtELGg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/5] netconsole: allow configuring the rate
 limit interval through configfs
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, paulmck@kernel.org, asantostc@gmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 1:10=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> The per-target token bucket has no interface, so every target is still
> unlimited.
>
> Expose the interval as ratelimit_interval_ms through configfs. It
> defaults to zero, so a target stays unlimited until an administrator
> sets one.
>
> The write restarts the interval instead of only publishing the new
> value. A target is configured while it floods, by which point the
> bucket is empty, and ___ratelimit() only refills it once the interval
> it was set with has elapsed.
>
> Reject more than INT_MAX milliseconds. msecs_to_jiffies() saturates at
> MAX_JIFFY_OFFSET, which is below INT_MAX on 32-bit, so checking only
> the jiffies value would take a write there that a 64-bit kernel turns
> down.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
