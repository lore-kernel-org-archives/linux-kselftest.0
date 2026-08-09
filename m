Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91368C1F
	for <linux-kselftest@vger.kernel.org>; Sun,  9 Aug 2026 12:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278667; cv=pass; b=qoVzWD7A2rLPVUeD8qQMO05uhOk/Zhua9reXnswxAzDwk5vasEHWOmB0K+diMohf9pMWF5wLO2XBcvs6uHz7sTyF205qHDFlwqwb9mTxlf/7HkG35FnU09wli7zUbOmlnQNhCn5m9e3qmen1zh8PPNZHjtWhegzgndhCJv6OG2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278667; c=relaxed/simple;
	bh=HT3vo3/zV1p+l+nVtI0/0qwtWPomW6WUQNX2aSf2RZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tUzpPS8iV7P2ZRH+Z4OPXBAJ/AnSA8dT0PDbagQY+lUOEEr1wzumeUEMEfDjIRLU88MJsVP/iRXbaFMmNLrom+ian74BokWkTfrk2nv8jOwxA0tXjaNDNhYB1y7dVBJ84YkYXHsExrduAzUaUw1VAxyg6GC33Ke7WUhiU5ugO54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jjqqEwjy; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jjqqEwjy"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c95395230so7881821fa.2
        for <linux-kselftest@vger.kernel.org>; Sun, 09 Aug 2026 05:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786278664; cv=none;
        d=google.com; s=arc-20260327;
        b=B3MCAEOMvJdVk4u7N55PayW24CI+VFivvsfxC+yxZMu19VMcVuYJTKGlwIXOSEyLa0
         Wo00boWO+zIbEk/gwC2wJLvjoR8ce4sSTnNYeaxTGLSLNDyZ7iUtPbvEQAJI+0A1bRWU
         36+/x+MpElqnmh1u54JYDptzBsmjFFy+wyXN96bEhGuzXcmd2BTnu+dgCth2XDnse6aF
         LW2Ts1G85we2oM44v0NkZLi8Y80d+/z9EO9V1mdW6XLgVSN+T5aR8f/mvALoAJqBL5No
         eqT+hPp13+rD7Xmfv6ehSAStmfT00s+2+95EgzdtjfMLCmef15YhrimkS8uupk9vK2wU
         /MAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HT3vo3/zV1p+l+nVtI0/0qwtWPomW6WUQNX2aSf2RZc=;
        fh=xvE7DYEGgRrTpwGqeWbCuDzDu90BsMDfpJoGgubDmqs=;
        b=Zqe3lOLwBMb4WusHKrlxuScWKbrVikcnMBgEiuhjj2ExcE+dmbQyOXcbkTRYDCn/O/
         DAEKxLpSyHXwk1LoU8DtiCa+u6H0jQgzazazquBMQP+JjWoqKXWVHjQtycGVxHwasSwy
         fDmjpveEfP+9Ur8GfEBkvlQyoHdm+bBK5AxHVNddCsgVa9og13U5Db4FB+KghSTR6I+Y
         4E7XL+5s8HREPatU5b8SUOY31LI74GNWQiaRAXAZB0H4u7F0WZwwdPQ/HizLVp3haKzH
         qb829V4u9E+OD/zrHjfrW8GRwd8AKyy0IU7Hn9lfnbEhcvCBRonNiRccTuPmzSG35STa
         Jr9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786278664; x=1786883464; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HT3vo3/zV1p+l+nVtI0/0qwtWPomW6WUQNX2aSf2RZc=;
        b=jjqqEwjyLccib5qsPXZbXg/FV1EswzQM96rSJpdtVoEEaLGib0pCgTMwH6nbhB1jCv
         9JqossYXSv4bD2vJ5aJq3oGAQ4m+EMGWxbyGx8z1Ei6m6v/FAeixhZZzry+2T+KxWf6r
         KCXFFEFpZD6yMR6aVG/E6GWpmJ1J9K2nkhUkwjH894Trlz4XMbZKV6WmfMCeikGCmRmy
         O+0dp6iJqEs43e6WoFrT5cSCrOtwEbIj3KrN4Ufe20nbGXyjG5V9Mh9mRGVco/G/y373
         mS04VhQadzMsrv4/VA/QEqDML3Q701/iHl3sqgL83WjKG64KUtHb4WOunTUGUfMmg9VT
         X+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786278664; x=1786883464;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HT3vo3/zV1p+l+nVtI0/0qwtWPomW6WUQNX2aSf2RZc=;
        b=aFcC8EQ/jpwsuqX+eE3wkjLU2e3pJkr4vtHQfTRw5MWY4IIm3fwbrd0eknNz36ZCYg
         OGNmsGO1w6KEDN/qg5r919Vih/xiXfIULEKv2aIXizHr+4WfU53708f9mwai7oaBW4LP
         QLYfVmkMrOsnEJKEMRJbTo99ocawW/ZJCK0+XnW96Vt97LwXACrk1+AvGoG892v57n0/
         kp2gJk9I04Is/UF0h5D/pfbnhv1VB0BrbJDvNl6JRT/kUNVASQiANxJ78Ed2NvMegiHp
         ySXl4vw2zcOESHmL5SVW22LilIwF1v555oyqMbN3GmnTcTBQXbXBMWdflJZjes6K5fwn
         R4Wg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+/dObZZYCOagB52U97Kv5LU61SkAUmIKkTkZCzJ5VnfHWhVd6UmJrDUKzN+bC2q1XcNzO/8cQrPEjO86iLWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUTziuoIqCn3PKCiwuRx8cojqwCZp1pkfnCTpaJ3OICVVys1lZ
	2UveRbJ6AikbQT2xZF11gqpbaPacCBGi7EEd5d13OvFQ646Tptyq24d0YZNo83U6D6MPDfpdbHS
	vkYkUQ3DRxrhSqAHXfBN3YV8WYNiuIyc=
X-Gm-Gg: AR+sD12VGoV+AfF2FcKy2x1OISM2vUMvzKXI5zF2lRyaorf8WL80N69HXFLG+Gk49hf
	m70uO0ym7kHPJmL5KYxEPvr63oBXVbckJe4BIRIi5L9mgu7/Zwzc3U3eSQ72l+FG4e0SwVadoDk
	cBjOS+st4h36npAXRYRJXzI1c7XOnY3KVg+XAKxgCMyuDE+zjLQtoKS2x7ltdwUnARPkdVkzXoa
	e5rs40DTUBiucZfyYh2g5HFRellMp268eaGYt48fdW8Z2k3FnxEffA0jh/7M/hx/pRdemxOj44u
	8PqyPOtC56o/SL3C1f/7Tr3axi5afuguWk9j/4xaEfw1rFNLDh6DMqg+udW8mkLUNojX2FvkJih
	WT/HksDLCD5AIaD9E8DzjjlPiRc2sytVvBOsWugj9jF9V
X-Received: by 2002:a05:651c:50b:b0:39c:628a:5c9e with SMTP id
 38308e7fff4ca-39fdf4c7159mr16729681fa.19.1786278663583; Sun, 09 Aug 2026
 05:31:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808005642.26901-1-sigefriedhyy@gmail.com>
 <20260808005642.26901-2-sigefriedhyy@gmail.com> <20260809085043.GA2339479@shredder>
In-Reply-To: <20260809085043.GA2339479@shredder>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sun, 9 Aug 2026 21:30:50 +0900
X-Gm-Features: AUfX_mwo6B4semUt36dKvyNKR5MqJ_kwj5w307xK6PG6zmt18TOQVUDOZzOYmao
Message-ID: <CA+7S2vJ0rFcXgGxVUw6X4k8BdAbLWwk2W9APQW5ZYXVMHa0J3w@mail.gmail.com>
Subject: Re: [PATCH net-next v6 01/10] ipv6: add ip6_del_rt_reason()
To: Ido Schimmel <idosch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, Chris J Arges <carges@cloudflare.com>, 
	Daniel Zahka <daniel.zahka@gmail.com>, David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>, 
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Nitpick. It's accurate for IPv6 which is the only address family that
> currently emits the new attribute. It's also accurate for IPv4. Other
> address families (MPLS / PHONET / IPMR) can start making use of
> strict_start_type in their policies, but it doesn't belong in this
> series.
>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>

Thanks.

I also went through the two Sashiko runs on this series:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260808005642.26901-1-sigefriedhyy%40gmail.com
https://sashiko.dev/#/patchset/20260808005642.26901-1-sigefriedhyy%40gmail.com

Most of the comments describe the intermediate state of a split
series and are answered by later patches. The remaining one, the bare
OSError caught around the RA sent in the selftest, does not seem worth
a respin on its own; I will fix it if the series needs one more revision.

Thanks,
Yuyang
