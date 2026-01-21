Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B933161A0
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 14:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006702; cv=pass; b=k059WkD16Jpwrbg9j8Vz2ju5lIAOTrOrWAiJtiYfKSlwQJgZqE4Zl3rZWuDQxGJEwV+d16KQY8pqwueRTGRL30SFixH4yKSHDL7j7gyOljFtY5z74ifqcBhtUlVSGcSCzzrCVP/A6wesATa3lSPG4S1bNAUjLuUk+67libpysEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006702; c=relaxed/simple;
	bh=Xu/hTwMLUvS81y97PgpDx0XsQ5SQXxVaA2e6jtW6itk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AXIPArO7TPJ9NWwOuSZZs+W4X3jsVSkRc8L2ko1Tusss8X836iodiAbSz1vGi3BFlS+njzCDOEm86wIZ2ZeCuDlJDY68//NUuDUR1wgZau+2Lt7p2pmI/BLABS/RADXS1fNqy/KTPwMrBcSuOkhGc9JCj6SbaIn/g0jsYV9neMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JuQvBZUM; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JuQvBZUM"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5029901389dso43314701cf.2
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 06:44:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769006698; cv=none;
        d=google.com; s=arc-20240605;
        b=P/PXaAOgA2eXvubI8Tc21RymkoS/kBORsKDXc5OAKJ1v49T/H0vObSwijydm2fHQqZ
         A0lGhnxdWM3mAuSVAIxEd9DAhF2v9F8ioI+e75Xyq3Erw3sm14DzVnccwf6t36+sWprU
         xExu3Q5aCvDM/GRg/8WLroIY1J+k1gfqxqyLPqolmz20HhQFQT1eOzedDH3i4k+vX9Su
         DJZSg0znXiAEvY3Wqu8Ng4Pq69noamPr0smIiFUweuw5EYFZ5HWdFFKQwb9sWtDGYAoa
         UERgH+zNsWV+RBmBrVdlXqldRRwyUDij1kb/W9FYV8rYcmo3Vm+X6ks+k/M2QuZUAWst
         9cVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WDknDeeriRuUySYC4BIAbGBmZKe22ziZVXk3IrvrB/Q=;
        fh=ENtcTq+Zkp+oiBs48w1eqirRhKt5oaYxtjBIG+0+oPc=;
        b=FXq//qii0j+Lc2xOkcR2gVvx8QDI67qiahwuyzqSH5eXKWxpS37/0MOAG9M9Iu4JQl
         bNUhO2qfiNP5aWj2Xy9dd/BUbYrOKCSt5CZgiBgwtuK2+8ehRClyY+nvbwuaMatcyL7v
         42qBefh7Joxz/9mNTeR57yGQARwq3oKv2nvbc1r/7J/3WHjhGcyMPy2pHiGZ4o+A7jrz
         U5sxHyG/YLATK1dIzYU7ZI203m214kANw4teeH668OAnDpK/2NGzvVN8ntVlqcqshKHQ
         PiLfOvqYex+/bsvXkm9ilgXFg/W084vXzAeaxb4NJ2BTj4+Xqxz15eEB64CfhyMaXBLK
         tdEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769006698; x=1769611498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDknDeeriRuUySYC4BIAbGBmZKe22ziZVXk3IrvrB/Q=;
        b=JuQvBZUMHV8GkQ3lzJYfdnQSMm4I6zL7A0RLc3DyjQw3Mbcd8OIh5NCJtQw/sjopJA
         9/1MeMk7SYiiaRO5wVZfUZgKWR/AFdT26uMakfQ0NX7Jjm8XoUcW/D6PfDFUpUpnzAiF
         iv1uhgi+bfkm+kII3eD9OBZRyKdTbFNCS4fDS24MWA3SGzdF3WZ0KMul+LF0QO+1fgWP
         cmJ+nrWapmZTKD6jUKI1Ay6LZoW9NuSw/CkzlZw5ha7PynzLodke4JfvzFg018aEI9LS
         Qo0Bigw9jyGM101Q84orsOMJAsgBqHoTZSENBE84WBA37y9XFFZsivmguyV/AsHgneDM
         V4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769006698; x=1769611498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WDknDeeriRuUySYC4BIAbGBmZKe22ziZVXk3IrvrB/Q=;
        b=QJ6bN3h/ReWngaczDRZz5B7vRQsDcZm0e5mG9Ow/4sBNWe0tZvdE6M22tHyljfS3Ph
         WyCuCoE/iCsukRznO+HfyE+jl0mTgD00GuIzqewmgcnBfh8PvjtSIpCGbMCEM53gqMO2
         IET8cNT/I4UV1W9t/CNJC+U5GkVf/OTTTcdy2BiRLoPWzcBhgAdOi9gJqPPV1OSS7T8F
         aX9InB+jgpVZ5qoItKhuXszkaaBj+F8Ud/l+HJtAusyQzF6ZKcCBHlqejFp5uXr1/uBZ
         XTWtjGcGC4jwIrKQ0KxMsq7OmN/AumiqnmzhgGLCMqQZsz35YvsO7JsPStvZLvx7U5uE
         nfvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ7A8MsRjCLH7nYslNlE5oi7IZE96MRayZw607RToCArOfkB690DCKC3yizDZVECgFJ2mbU/oJl+w1W1TIR/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPDD6zGHjGnWJHYzyzIY283Qglc3jaMHp71euv0mrgmO8Mlr1S
	SSkzn3hQ3/tFZAHPT3e+w2mj4FLtLLGg+TFgt27w8AcvA022dNByA6kOMXGVl7I6x4CdXhNvp2g
	janVKvqteH9w4ZVEvUsR3/LKtqByv64NpJTu5YsjC
X-Gm-Gg: AZuq6aIeQ8cXh5m+YJImuoBYFwRXGQui4ieEJhHvAQxLvoMJOl4NIx/5uQ9xdPq9Ow7
	rEX22iS3LOHYfU68PurBKmqN5i5Xdlj1zMKngJTWuD3ZYftcH1EK0SaIAH3tF0DKwvf6KFjbuG/
	xcg/dZfnzlqOaZWIMPKQTyIqO9JbZLk08MNg11c7upTv6GuszHzX/UW3DbgAHq8HtORm+p4azWa
	DYH5DgddPKmKv2/E2NTaPiOvZ1iXDSfID+iLR9j5h5mp4UUWg3tt1KY8rlllQPd3CSaPO0=
X-Received: by 2002:ac8:7f89:0:b0:501:50c4:a9fb with SMTP id
 d75a77b69052e-502d85c766dmr69283611cf.80.1769006697633; Wed, 21 Jan 2026
 06:44:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121143215.14717-1-chia-yu.chang@nokia-bell-labs.com> <20260121143215.14717-11-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260121143215.14717-11-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 21 Jan 2026 15:44:46 +0100
X-Gm-Features: AZwV_QglfYe-rR61PYDqNirvWqL5d8wU90xI4swixYbQudivaPcO8KkO1yRJQIE
Message-ID: <CANn89iJz1Au-kfk8Kp001vwvuxdndYX-Y++vB6NK5A_CBXVLHA@mail.gmail.com>
Subject: Re: [PATCH v10 net-next 10/15] tcp: accecn: unset ECT if receive or
 send ACE=0 in AccECN negotiaion
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

On Wed, Jan 21, 2026 at 3:32=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Based on specification:
>   https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-28.txt
>
> Based on Section 3.1.5 of AccECN spec (RFC9768), a TCP Server in
> AccECN mode MUST NOT set ECT on any packet for the rest of the connection=
,
> if it has received or sent at least one valid SYN or Acceptable SYN/ACK
> with (AE,CWR,ECE) =3D (0,0,0) during the handshake.
>
> In addition, a host in AccECN mode that is feeding back the IP-ECN
> field on a SYN or SYN/ACK MUST feed back the IP-ECN field on the
> latest valid SYN or acceptable SYN/ACK to arrive.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>

Reviewed-by: Eric Dumazet <edumazet@google.com>
