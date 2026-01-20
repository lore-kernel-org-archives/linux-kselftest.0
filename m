Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614AD421A1C
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 11:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907995; cv=pass; b=SGCQmzKTONX12GZqSBE3BqYMepSsB+ZE/6dJuH3ixhnW5pJ+SAF9fLcnvuyVtsNmVfdrqlZPt+uvif/Ch3VSLkOEUkMSdXXG9zhNfkJHFbCuFMn0jSMF1X8OKfmTETxaDU0uGiXp8JM4xFNN3h4DJozN0zX7lU4NABudy0xlwkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907995; c=relaxed/simple;
	bh=2SaI+Uz3QGNZurl++WnxVltgVZ/pVYMSpuX7ISsHQbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gbo5EPAnWnlJ4+fhGuI15duysQr2sUDCvqZ2ucVgpGTYSf7iG4v1297bn0OLkqQhicNkwzi8nH73EKis/8Q2yE9lP3nAxkhOHzi0va0LIYZeSA+qNhSpTXwosegLYKjHqJkbBIAhTZ/kpJ20sx5EDg9Y0db7K1Z3FO1OgxKWYps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3L+6hw7+; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3L+6hw7+"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5029aa94f28so39891501cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 03:19:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768907992; cv=none;
        d=google.com; s=arc-20240605;
        b=E6QbrYXeNTR6XGLYOVtVpoq69+HNeoYgscRt/sCqRq2l7k6oMvNxJgpJT+mpgGaZmc
         qcEqwccCjnImEXRAllz5c9WX5ylD5gGrvtnUsFT167ahvRs27tKp3FEXks6gcXk9KTrb
         ZMrufTGV3QPj9d0lJC/ogceflhw3iF52Ot/CS9O2Wpf+3fhtYVZWdi2NmnN11y9GslmL
         Zcoz9h/x2TYewJjO361cmLThLgYVQttCGhIj7z7a8umVvVwKXN9784UJnj6YtUHKEWzJ
         Nooa02oD4KeH1/8JgvQnvHPwiaEwDbwMg3G1U1CBj1b0/wLY85gPbKLXITK2abM5qpdt
         8quA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VqnDOdzFUDP6Yo0/hl8kW5DFgiqEg80gO7B+GBRDshA=;
        fh=YZbi630b/EzOoner5zxHaEyGCvYc4JzV9tbYBQOVyDc=;
        b=gyD28e1U/1/jJKxphcRkXjLm2t/X0IpymDalTxkxUNAIgOQzYif96utOyL3mrhkfFj
         xkPUMefDIAgxrLCjKOalWOUBCc3y/QfDJq2ASZLZQwkBMXou0ORO/FB9PIF8UMDKhfZJ
         w2NM3bJ3eTUw+zZ8SnK7ss3a+amfYiKOIo5RXpvtewa+17nUQqTN/ogZUd1EMehxrIiP
         VUSK7usw4y2q3wYjQq4k1jj05SZVeedVxt7h3u1VjkNTpaHIl5yF3jYpMP8YmdJiZN5k
         agg4bUDXA62/v4TibFIS3nSHyNpWRFsnn7x382ba+O4MY13AR2o1ZjQdq7FpQYfWNhcY
         uTSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768907992; x=1769512792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqnDOdzFUDP6Yo0/hl8kW5DFgiqEg80gO7B+GBRDshA=;
        b=3L+6hw7+J/bvuzDos2PmP/fEqPXW6Vv/PafJcFx6vJQWpS2lDQhi9uQtq/88F954o7
         vd6e8kufz3LdVkvcgn5AsHHXaqNSpGEYnePLRl9cSosx1tHx37i2+GEW1svJZz7rbSfg
         MVwdzPKbpeMLnZ9CwwtLryrxZr4mBubNjBBu9KkyZcUeQiBgQ7vfBuHGvQk+C4+1GaAZ
         LxpLlOj40rEyQqWfrEGhYFBEkurwtlBWUERzWK6+uNh11EU4Wso03UFCiB1C8dxESqRi
         9IhG/DqVbR2qB3E232HcKoyLKpS6vbr9KoB07TtGlLQLXYEyzTbgkDL437C6Q+jl+ZKc
         0deA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907992; x=1769512792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VqnDOdzFUDP6Yo0/hl8kW5DFgiqEg80gO7B+GBRDshA=;
        b=OBK3H/bsTXttjuZxraz8No36Kl/V27B2a/V5he/+0+dTIY5lw3FuOD8E+mB40srZH+
         gjIZKuy9UnQGnYPWKtaLsiJ1VnxwgpWZ0Yyi+Z/mPtKizVCDAJUaUHePoMiTaFztFvZZ
         7bIX43dDpnRfTcS9TEEMeFvVMXidTUuhfSpYp4Lvkgtt6l+sJmEui8ZuIlRrofQogNSw
         1q+ny/kYNtKzkFoWzh87GAfM3gRVPgyrAVp2tQ46ZYQx3BCqA/WVGaTl1KIWbMQtCX7h
         Gw+TyaWzQ5OjGt9dJMK8uqMv2WAY0rPq4FfxGTrxP0nDUb8K/G/Y61uuxK1h3J8btQG3
         s+bA==
X-Forwarded-Encrypted: i=1; AJvYcCW/Cask41ZBNsdXAYV7KdCnJ8ZQ9pd4aoASSfvN2LJ4yexZohUzsMnwO5Onzcn89MMslosUML/zTyfTacxArdE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6mkF6LFZP3BsnFiBx7aMYzwIh7mnWTc6UNhabQv49kFvBgomv
	8tJPlflDb/9qW/A5fSVkKEzMDAPSRcC1TNtivG/tgAB53kTpS15qeKhQXptK3vu3UtOwhMwCYHF
	6GF/UYwKtEbJH8IF+feqD0/pTI8nX719pgreIcYFC
X-Gm-Gg: AY/fxX6ictVLI5eFgSE2uzhu+touBIs/Z8NwZcMcxAE1oTxKDzcGiDKaY8ptuhNy+e7
	TgidLW+bvR8Y4jDZYpXslHeZWlFAwFGmVUS43ylFtGqrX7UaYdzRSuoiJOnG2krexdM/zN4TjAv
	s/u4l8bsCLUNcNdbHbwVg97sIBRFsq0cZ9No2WBfB71Of/Va7yHqHPVSHirHfkypz1hg74TPQO1
	S64j0puAzJ7pYdTH29DQ1ArarIlL4MlhHbzR2HJQT68RDTN7cG+vXFpPz3hrd91bDxNC68=
X-Received: by 2002:ac8:7fd0:0:b0:501:7d6c:2d4e with SMTP id
 d75a77b69052e-5019fafcbc0mr253993531cf.42.1768907991860; Tue, 20 Jan 2026
 03:19:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com> <20260119185852.11168-15-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260119185852.11168-15-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 12:19:40 +0100
X-Gm-Features: AZwV_QibkXIKRoXdwgvYg4Ojoj32k0JWscBRg_R3cjBAHC3thHUdUCmCY1qsLyM
Message-ID: <CANn89i+fQQvoVhpg3HVh=RerB1tjKi25kGypVh3fwob2HWoH2Q@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 14/15] tcp: accecn: enable AccECN
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, parav@nvidia.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@google.com, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com, 
	jhs@mojatatu.com, kuba@kernel.org, stephen@networkplumber.org, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net, 
	andrew+netdev@lunn.ch, donald.hunter@gmail.com, ast@fiberby.net, 
	liuhangbin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 7:59=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Enable Accurate ECN negotiation and request for incoming and
> outgoing connection by setting sysctl_tcp_ecn:
>
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> |              |  Highest ECN variant (Accurate ECN, ECN,  |
> |   tcp_ecn    |  or no ECN) to be negotiated & requested  |
> |              +---------------------+---------------------+
> |              | Incoming connection | Outgoing connection |
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> |      0       |        No ECN       |        No ECN       |
> |      1       |         ECN         |         ECN         |
> |      2       |         ECN         |        No ECN       |
> +--------------+---------------------+---------------------+
> |      3       |     Accurate ECN    |     Accurate ECN    |
> |      4       |     Accurate ECN    |         ECN         |
> |      5       |     Accurate ECN    |        No ECN       |
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+
>
> Refer Documentation/networking/ip-sysctl.rst for more details.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Acked-by: Paolo Abeni <pabeni@redhat.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>
