Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5CB48035A
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935608; cv=pass; b=PUILwrJ3GSRjWqjSH21vcLK4InSu4udW7yTeFvIRonm1N+Jh5t4sXY3BdDZedoj8qSDQTyVzMWrapekJY6JWtYPy+U9y090fi3YSKnB6zkp3jXHYWHd54BNI+DmJYyEd1LhfEGchZUgo68679ARsxEpPdV6yPqP1JYFPYpIA3F8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935608; c=relaxed/simple;
	bh=hEO0vwKwrqlXZ4TAvYBOxFpw+P9Ek/EqQqPC11dV1ZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f7NoXyDmfv8ToD4xT0juWd6om1T7sH55KyvUOITnnXtIRo94qyT4jjQT/06bZpgzImivD1+H6q0zN2PKYVDStkyJTK7ng44PwwhkBEHa7agfJAz6r3q059tGR1DaypyNQZvlcobTWDSrgTtJkjZztzjDfrsoKbC+QdpPau9xoSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kV/PN54K; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kV/PN54K"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a770b3ee1aso27537811fa.0
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 03:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790935605; cv=none;
        d=google.com; s=arc-20260327;
        b=pFMkh427VEQpraDoaYyYlHvDbXadMztepJ3p94Zp1T7Ca6k39vQ0WhXKXHrlFk057V
         uFnF5s0QPj168s71XTqDhadI5idYkIG5u8kMll2mbt7KWfNn0gO3ZwDlGc7oFDhSfUNV
         fSKvj5MNzUZpjy+GKckcPOpB+Ulr7RCxNJh6PrMUrwavW4ba4DJNHW4YG8Fs9R3kgw1C
         qzrsmmsHIBUwqylkUlUJuCgItACJ1t2baLbOigXQ1ja8g/zXCIN0SzGg72AbRZERtcN6
         7qU78a/oPqp8IGPkYUTBEE0r+CF8S/sSvdCoVayOQ9fGs1DhuZWAZqtl36waDM12rds0
         VaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=56xOfDITZcNEcJrgSxRUY3B7nxPxHMei30QaJ72H4oQ=;
        fh=eCCrGYpaRStW0NvIUbiy6FhYjiiiLLmrn0xw2ZavCjo=;
        b=NkirJOFJ25LyF5Zg3lyAcbF3PduQLny5+o3FVeM2W6y9wtutavFVQMMzaYe9/l1RbH
         ypA4v6ArErlKwHRLgDLKOtTotssqMh/cybhZlDN41tHOXzbC6SsxmWaiG8gLx10kfGuG
         YnNkAAD5E+XF7IB001gevC2YuDz1kPM26dZvwRGFLg/DjnIzgQvHahCI/GG0OKwE/ZC2
         fCdAlXrdwTgXoJb8LPk9ZzktJlVmxtGmZM/NEEfbpq6i3NxNI/Evrr/o4joXw7buA34I
         5tZZkLX1nhmlkejNHBM4hhtd+lFZYQHSV0EJhRQGHcEX3LYaI4CA2nyoInSLGzKRj+xs
         QRLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790935605; x=1791540405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=56xOfDITZcNEcJrgSxRUY3B7nxPxHMei30QaJ72H4oQ=;
        b=kV/PN54Kt/CFgtZWInPcN0fNRdr+/B5yZCGiB43z6g9Dpi+TG6/aCQCtph85JBw2d0
         BUoehj10Rpq6MXZ23tvdT6SucBtASmv7dx1IptvNnvXaVx6MZuaUVYul7L3xjKbuiSEv
         WSJFu30GVBculKOIHI1lSX8BUd+H34ET0bjxiaV1vl7hMv5ZbrDIL3yWl8iW3nINyeRW
         QLOP1ZRudK6pnft41ccPtQi7aAJQUUmP7Uwbvmlz+sP9gVEmOr3ANNdrC+ikZvwcMnWL
         +SMDj5BNxLo8cH/Ca1oMCXAxorlE91Epnl+Mkz3BUpd67npHl2kCrQH7N0bbNeiQ5wZT
         zwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935605; x=1791540405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56xOfDITZcNEcJrgSxRUY3B7nxPxHMei30QaJ72H4oQ=;
        b=m6jXMil3JA6F4jiVKINOvoCEXFpgO2hYuzmUFSPRrKl52RnKgB3g04hYdXYennXYZX
         lhtkaH0VtSO60aYJKi7Ai+27fvUbwUqvwRm8/RaBRxY2BeNi0QtS4KHyfzHQnbLLwkOE
         9M2dhS5D1Smfsqv6wnMY5ZbzIW789Va2+vRQEXLgwyfvonrhy85/qswJYerViB0acNyw
         q5bFIRJCIdNgB1keZBKaWWnZdwb7Tq/ANCLSOfj9UOMZae+wCOQjarGHCTM0//pr4NUn
         3bVEMm0wzuR1WslvTdW02bPPj1WcmnsyIYrXkO0Srz7ie5DRIULCcAebkDj68aqrQrzN
         +J9w==
X-Forwarded-Encrypted: i=1; AKwUvBwPKCS8nTHrxjZV6kNVWHHku2EafPamgUTROv8lgwa/nMK8jehvdZIpe2cxI8jSjf1Q0u4FdBeoxbh+iXENjPo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmtDOH9ag3miDqfWSMh6mHXQk5ZyngT/h1VrKMcqdY8ncBk0pB
	lh+iElbQE0kmoe5+fms+bDD2v/qq/CXqgC0gKkg8VLUp1d9gJVh7meIPV05R0pw/AsHFZjZCq3j
	mZ7pZ3PtuKhGoZrHENGbeTS4h/jh8xxo=
X-Gm-Gg: AYBFou1vkW2MgWfXsudxygsO2nmhZ1Jko9dmA/WPF8WwEhh+rxvHmxZaQBSjcrdPRus
	xnrXoMK6u+QYE9Xpb9Bel7gLULbLiZ4VRR1bE5eIToAGXz0PuZRj8nOSfYnwWB/tkqEwK1wr2rD
	4Snd89rZZRJqoZqqsRp4KV7zXyWlhWiurRTMsIPv/Gmrp5w/TJehfAFfcorcBL1fOf2lLjc5f/1
	KKNFwcZkTDsYhETeRp2jaabuDpsLPYXS51fE/tVes/Mw0f54qZhd499h5lc0kWng0MAknpn4ajU
	odVPHmmCsMhg7/cg0W0on7UYJuHkvgT32dKauTEu0r8B0d6FMrkkELglZDojTQF8W1CmJu01kYL
	lnUqwiPPAwqi0r1hjbjVFmA==
X-Received: by 2002:a05:651c:31ce:b0:3a6:4e4d:9d1d with SMTP id
 38308e7fff4ca-3a87ec366b4mr5542271fa.0.1790935604459; Fri, 02 Oct 2026
 03:06:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930112842.21323-3-sigefriedhyy@gmail.com> <179089747937.434549.16341143363097629528@kernel.org>
In-Reply-To: <179089747937.434549.16341143363097629528@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Fri, 2 Oct 2026 19:06:34 +0900
X-Gm-Features: AclHuK8Nz_2jnmVTxCDn7TReanMq4quK1jlp8YMQzgl3WrXJWrYulmhcHHN9ymU
Message-ID: <CA+7S2vKBrjAMW5h_Dkpuy+TYum7m2=8GL1etaDx369ZSMRhHRA@mail.gmail.com>
Subject: Re: [PATCH net-next v9 2/6] net: change netdev_hw_addr_list count
 through helpers
To: netdev-bot+sashiko@kernel.org
Cc: ajay.kathat@microchip.com, aleksandr.loktionov@intel.com, 
	andrew+netdev@lunn.ch, claudiu.beznea@tuxon.dev, davem@davemloft.net, 
	dsahern@kernel.org, donald.hunter@gmail.com, edumazet@google.com, 
	idosch@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org, 
	johannes@sipsolutions.net, kees@kernel.org, kory.maincent@bootlin.com, 
	kuniyu@google.com, nicolas.dichtel@6wind.com, nickgarlis@gmail.com, 
	pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, 
	sdf.kernel@gmail.com, vadim.fedorenko@linux.dev, willemb@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - [Low] In the commit "net: change netdev_hw_addr_list count through
>   helpers", a new comment on struct netdev_hw_addr_list::_count in=E2=80=
=A6

Agreed, but they are nit, will fold them into v10 if another version is nee=
ded.
