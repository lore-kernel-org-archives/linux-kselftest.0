Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878E03E9F97
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904323; cv=pass; b=cm39peZcB3EW99+2AujGeh7VgwVyyGV1kejn40WzMOfU6LqduyGpcwQKsXUwf1/RjQkpfVnbS/tHUeFP7+kuwQ2S9CtafWQP1fY+UTX+ZdF3GKOXltN/fPIL8YbY6DdTQu1xNQQYZ8TRnDkBcQ3nze1mrQJTtqyq7zMcQgff1ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904323; c=relaxed/simple;
	bh=b3/vqEjOYP5wT8rQWVCJ7bEZ9Lj9Z/WoJtk7uoPUAaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ifNb4yNx3v1//LDDI4diWpC6vx9tVQHgBZl8YloyraLhJ288sdEiSw+sZDdIHITxezBy7tWIpPHL6d/dMzZgwNtq566MonaOamIM0bXb++u8ea2LcooPYLB5emDuHj4q7VF/wgH5VFk+Nzy9ZlZO2EsZX8GIT4jQny6Zyum/86s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RaYwrACB; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RaYwrACB"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5014600ad12so38828291cf.2
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 02:18:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768904319; cv=none;
        d=google.com; s=arc-20240605;
        b=Y5/M2oxCUzjSICzoQdW48uOhjBSlulz3qb51FOn5ZUCf093XQITe1p+2vNG/fRqTbh
         JyHiGNG+oAhrqr3HUjRB3kFIycT/I62flSnCkEwEow1G9aWKc1i2f3a/GKl21MtsLJcx
         vnw9zNvNiVHTYZv+dmm4lA8gwe+7VKM1rj4waesC3qp+VBLZkivbARwRvOFpTor0GQbP
         tIlZbiuxAq/Ocuj1Yhvdc7gSIMxk3Mgm4GcIdeLDtuOK6PIid+D0XVbwa0voTWDxhQB/
         llohcRzVRxlI9249DvZ1BkC0Fe1Cm63fqwIfytoTOieUWtmOxursjL3rd4eyfLeFy/dn
         mA8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b3/vqEjOYP5wT8rQWVCJ7bEZ9Lj9Z/WoJtk7uoPUAaY=;
        fh=aEmXUnu8cPW8PkAuMp8ZuNQzKmYNB0Dw607ORWQ98rI=;
        b=XtScPTsIO51vxT7kSp9SLt7RU2ceKaEiqjMSOtZlg383qrZW4X/buWJ8J+03CfHyBe
         W4Kz898JcejnUCzKIAAt/vmEneoIu75R1g3/dM1BwvG2JDcao292oE1odEAb6Iwu8s0f
         i5cluWbxljSNc+R4iOgiZQRyMj7vqRtqLodu4xbMNLfdMFJzLBALC99sUZNrPO96FahF
         xMl9ER+Cj+SB+IXbZaUvS+fGdG7HfFZ7swfeeXxV+yH6k3D+MQ5sz351CW7ERqk5fai9
         kUuKbBNf5eX9JqSUn4kC//V5NLpu4LIXHo2c3FZsmMwuPmxj41KokAghUZuV4rfV6nRE
         eJJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768904319; x=1769509119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3/vqEjOYP5wT8rQWVCJ7bEZ9Lj9Z/WoJtk7uoPUAaY=;
        b=RaYwrACB1pbJO9Q6eDg48UcHrWDmIg6oer89G3yBKamt5wwYLsIRNgBzqeyZqinyba
         XXViknaRsH9GVvVJsQWjHobR+hK20LmZ+kCnvzRCCkUy2htPs/doFR1WyyU9KtpZ1NT2
         ffDFimp/p0rAcoOXBu2185cRD+C54AinpRKF0oWW07214gGokq9p53sGIEIRu73kxYTG
         8/jafdk3orEy3XR3378E9zGmHbEO++wHIohIOy+tgE2BlOqrNRI5pMASS9G8c+SXVhbV
         ks9AucTDVt+4Zbgyqfty4lHAGyWi2A3wX6dIv6RueHd2dxMa+dbhXLrKkRCMGoK/1nlp
         rKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904319; x=1769509119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b3/vqEjOYP5wT8rQWVCJ7bEZ9Lj9Z/WoJtk7uoPUAaY=;
        b=jSwDta/0TCmHlug4e4IOxcK5+vMBzNADq4nytmRfu69Mya4Ru9of/f2vEB957V72IO
         SKhJGjDFTIiAv/yCfwE3DsJ/TLD+XmrI9fEkTVQZTi/JUuQKbJjyB9mOq2HCBrIkrveI
         dSkLCQ2iYGLL4g911H+sZudfz7OXCEWHoCLFeK6RdOcbD/VO/fxg38W2xHwGNmgq8el+
         lqCUNYROfpc+O3c9eSe2xg/HPO17z1qDpDfv7Q/PhPag06AaSqo3tpqmo7xM7aY9Bonq
         bjb8Pzv/0pUc3fbZWA5QI6oSirRKEsISizn0xTJ9zd8GHsTR5RU+xOHeaQXT96LvdWcg
         f2Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXiPp0nVHxUNIy6LKhDEZ7YHMei8t6CtkOgDfOqfaOpA/spkS6hkd9w6Ti3cH9slFV9skJ6pftGBwT5P35kmNI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr4Ph9Hc2VS0hPlWYOPdPa1O4PICczrAsNzFhX6rjGLPWqvvk6
	jFxhCO0JqfFsaa3FtIMFHy/rP0ySjFtC8N6b3XqhEuKios60uIpJq7hJfB2PTzLC/2RvifzyITN
	xlYes75o4wI7xdZBCs4TaXxfYMo2mQzhskjziLt2r
X-Gm-Gg: AY/fxX4zU80XUYKtJsP37b5XzjlL90j/Xma0Hctn3srRFdlJOBbEH6UacHgdleTK2Ps
	LCR4iwhpb5+QNxxU3BHZ1alLdftxUvyDm2N6JT/J6ZdGIu9oothuqXUkQcp1O3ZxYqqNxdlgpmh
	BAdgoNSWWRW+/CF/bGRPuX9iCcmn0H19gmJIAE2Jzs8zACWBzo3FFeN2gS0+KbrpjyjGsFnap39
	KJDAIBM5wmXF+g4txbVFLWPXHfNKau//BcWNmOMXkK+SUd5FErEFs77j7m33hWE1E0epeU=
X-Received: by 2002:ac8:5952:0:b0:4ff:8fc7:917b with SMTP id
 d75a77b69052e-502a17d35fbmr194387991cf.80.1768904318971; Tue, 20 Jan 2026
 02:18:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com> <20260119185852.11168-7-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260119185852.11168-7-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 11:18:27 +0100
X-Gm-Features: AZwV_QjH7opN_HPqvhqUNXEbYAFk1K1nGv7G-5WTlprpaA8RI4H5El1vduIS2JM
Message-ID: <CANn89iJHz4ecnqfFY9F4Mkb-aKCiCRhtx8++YvKPZbSHy4NXGA@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 06/15] tcp: accecn: handle unexpected AccECN
 negotiation feedback
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
> According to Section 3.1.2 of AccECN spec (RFC9768), if a TCP Client
> has sent a SYN requesting AccECN feedback with (AE,CWR,ECE) =3D (1,1,1)
> then receives a SYN/ACK with the currently reserved combination
> (AE,CWR,ECE) =3D (1,0,1) but it does not have logic specific to such a
> combination, the Client MUST enable AccECN mode as if the SYN/ACK
> confirmed that the Server supported AccECN and as if it fed back that
> the IP-ECN field on the SYN had arrived unchanged.

I find this a bit confusing.

3.1.2 has :

An AccECN implementation has no need to recognize or support the Server
response labelled 'Nonce' or ECN-nonce feedback more generally , as RFC 354=
0
has been reclassified as Historic . AccECN is compatible with alternative
 ECN feedback integrity approaches to the nonce (see Section 5.3).
 The SYN/ACK labelled 'Nonce' with (AE,CWR,ECE) =3D (1,0,1) is reserved
for future use.
A TCP Client (A) that receives such a SYN/ ACK follows the procedure
for forward compatibility given in Section 3.1.3.

The relevant section in the RFC is 3.1.2 _and_ 3.1.3 ?

Honestly, AccECN is way too complex for my taste :/

Please copy/paste the precise RFC parts, it will help future maintenance.

Reviewed-by: Eric Dumazet <edumazet@google.com>
