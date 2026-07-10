Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A733B3D649F
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 09:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674657; cv=pass; b=H6BKsEZ6La7fvVPbymgOs5qR4G2xDChu3jOfRHEmjncSgJbaYjjeI+8yXCRTN3NhW+pKT9LTQKY5EjsoM2ZnHqRcrNDGpQRx8748E5sDODFCBvRmGiUQoWcYNgDM+r16LpO6W6sTmOnjxw171bw1HkNviksAKqGGE1gM2ZCTRIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674657; c=relaxed/simple;
	bh=7VRjjiYf7VsPZRU72hng4qVFsOX57FJEhq69ROQS9W4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+wcQcYi/cQaegWV2BZeU6GOeSwNvuiLzDmxBV211VdViP5znO6K9In74npS9LqYkhHDtR2raa8EKljwpWPAj9lMCDrCWSTz0bIrIPe5X+pDNoVFun9/C9urTLwyhu35rDPHxCjE//eu4z0Xr6I3jHFlwieIlthiEFfBObtlIyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUz4zImG; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUz4zImG"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-698acd36d67so1456813a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 02:10:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783674654; cv=none;
        d=google.com; s=arc-20260327;
        b=S3XkPJzHoRivzBYN7dMkgFxsofEdXMcy1wRYH2ZdEdEvP7CbVkInLKjfz/GdvvLx+T
         nwFISmIiZEjc/2YUGC2XrO7qDjtO5qvUkGuCz1M+1NZo/zmhKAhlyJqTmGl3HvJG+azd
         gT5vqxxNPk8d5/iIMwl4i+HilISRTQSKC6KIiuFkVkLLia6vZoWxhp/ueAbot10j6Uot
         XBibeeNuo+NBTWp0r1Fbc0SAmvMENNu7qdgrqhsx36C8otl6x4vGitSdtAoODOfr2Z0W
         d89QlLKvudHsrpCrIZ4y7M+gx4z6KCfhTE7oBdkhuPS3k0b1gCDcajJk1uNeSRkkTkSD
         gXGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=63OqeDSCaj1h6ZXr3VoxtulDj7w9Hpihc2AgE3wNxBI=;
        fh=VQDSVLfQLMYWs3zi/v5wrcFDXbaYFG0iElX+VbCDNmE=;
        b=D4uihHL9l3GuhLwVzK/puwDG9sFKeRH+WkguSamrX9YK4wbPCrYCKznCYTDlhoinv+
         tmTIIchshVezekV3gG4xM05OwhO/SMn+jqhzrMlvYw40ZRNO9IKQDzBsKb1vLMK+E0KP
         kf+SAJ8EEGHz27Ybz8Vt+LhXT0j2+xRd4Rn3MC2PM9HXpi+8le/SNokv1xBnYgz26Bc0
         iSfWM9A2oOrt3F2qbrzzZQAPicPZZpBEuWhUb8ZMx+bpeAwZQVoieQ68HVAgXVhyKBuM
         1V83EAqnOea1PlB/p/msPfRFzSBGgQ8lRp93XG2Fhx31attrW1Aq+rvcV+xkLmGM+Sxs
         SNcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783674654; x=1784279454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=63OqeDSCaj1h6ZXr3VoxtulDj7w9Hpihc2AgE3wNxBI=;
        b=iUz4zImG7/gi6rhoepnmHEbk5Abz3BlRM0633rnPMrD81DZLc7xjJm3NEiWiI0qkT5
         bLHXkmxefvFYNHoL95gntY3dIoQTMl3k6kjhf3zJDGmCpTLEKjwSqhLhvNRHb9OCRgs8
         6ndyd7MKyFAF0KJaLUJzKt7HRIIrD4GFP/8IoTPwvfcsy2FF7BUa0yRhepJNN06QDROc
         VsWeBpH/sHYEpjxvQeJpNBB/4dzSyHgeaFIod3XhHD4JeGbHJMxfgNGsFitNjN7MQ7dI
         QZPzNSqTPyovC4T0Defga9JeJ2gVI4UqnMwl62Ihvp8SOPNQak/EmTlnoc7n4TTvrcQw
         bVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783674654; x=1784279454;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63OqeDSCaj1h6ZXr3VoxtulDj7w9Hpihc2AgE3wNxBI=;
        b=BBxgF3nO17dyM/sht9XcjDeCwx954LWYhDXzXmjZ4FWzbqHLnBpzQfUnkaAFQduswb
         8cQndfoiC/X2Dntw3mzMyxk7GZE+MtYapmfg2TdyFagRelHL+6f70GMeDIYSUTIcR4hh
         GNjXLwOM9FxAYLRdTaWRYlg9ZTlpq145Q7rIYB40sc5v6nlhIXhRj8PIII6D64n3yboi
         qiKNL8s4h4I9wwGoVmBJ46aNjIKFhsWFtvEclueJOcmc9C2bmzWw4NpSbBhUFkcdoSZA
         DFXGmCHAR1VvSQRqrvvRHAoII+rQVFZtMhmjN7z30JLa6rWWlNbb83/stuIeGQqCGYkt
         fqcw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4heuAo+K+iSJS/G1Fkvl0jTRmEWHScq+59NQD/DgxdJrkQg3VTrA7pvaVIQNhZjsLc/RLJ33YHbn9f1ENwGs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ObGeyqakvZDbHb5bpaJiWPWiZuJviUJJ7kDDg50Rk3LQA31I
	a1Oz73HFVG47ecUsDpp58wuffxI4oerCOAhXwvFA0HGyHzvYpsbhCtoVRk48SY0O1y4IGdBUAMl
	mWvhmZThS01ip+uyH5/UmGliG7gVWxcc=
X-Gm-Gg: AfdE7ckT7RACeNdJYDiH8WWmg/2GuG4Cz3uGjsJeGDFYe6DZ/Ah850xaBDpdG+h0e2i
	nldUVaCwqBC62ifpqtAJomz/P3fQUCNzpat/OkQhlZ3gUhY04RJ9eVrKHw3lF5WVD+EkeIzyDiW
	cFZYCPiFPQD4oqidc4LjlR4c61SHPTEmDBKn5IYU7WqVO0G7wXMuPS0FFaJSDopkBPpJjaWDBWp
	Q+tgUbm6kMouTIdFsw2xUQuw2CeUd5kmUzQ4Gn7nO5JgHZDJ9AhYiepUC+QvMz34+XO8qIpEi8R
	m+Y1kQ==
X-Received: by 2002:a17:907:d641:b0:c12:3c96:83a with SMTP id
 a640c23a62f3a-c15ce14468dmr473366066b.38.1783674653759; Fri, 10 Jul 2026
 02:10:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709101327.9508-1-royujjal@gmail.com> <2026070925-delay-gauntlet-bc7c@gregkh>
 <CAE2MWk=mm8_bkd54Gv1mdox6rfvx85Dd3AjOCxPz0fPAfyuWYA@mail.gmail.com>
 <2026070954-activist-left-8303@gregkh> <CAE2MWkmcQdhGp3LTMtpgAse3AFcfKcAcpQe89+iijfP5e0w_QQ@mail.gmail.com>
 <2026070948-lively-exchange-a458@gregkh> <CAE2MWkn3L7V3x8i0F-soGLxsBBo_Umgs1pJ3FwCw1OW7=U55zg@mail.gmail.com>
 <14350a31-ffc7-41fd-84d3-6cfb2cb96841@lunn.ch>
In-Reply-To: <14350a31-ffc7-41fd-84d3-6cfb2cb96841@lunn.ch>
From: Ujjal Roy <royujjal@gmail.com>
Date: Fri, 10 Jul 2026 14:40:39 +0530
X-Gm-Features: AVVi8Cd5znmWkFPkHNasW53XA8Yxqr82wjkGlYTTGZ7zlu8uEaTgeVqYBL6bRu4
Message-ID: <CAE2MWknt86W6yCtuS_RupiuwiDqXT8wZqENM2DjiW1R=eY8qdg@mail.gmail.com>
Subject: Re: Please backport bridge multicast exponential field encoding fix
 series to 6.1.y/6.6.y/6.12.y/6.18.y/7.0.y
To: Andrew Lunn <andrew@lunn.ch>
Cc: Greg KH <gregkh@linuxfoundation.org>, Linux Stable <stable@vger.kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
	David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, Andy Roulin <aroulin@nvidia.com>, 
	Yong Wang <yongwang@nvidia.com>, Petr Machata <petrm@nvidia.com>, Ujjal Roy <ujjal@alumnux.com>, 
	bridge@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 1:31=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > > History: The multicast stack currently supports decoding of IGMPv3 =
and
> > > > MLDv2 exponential timer field encodings, but lacks the correspondin=
g
> > > > encoding logic when generating multicast query packets.
>
> RFC 3376 says:
>
> 4.1.1. Max Resp Code
>
>    The Max Resp Code field specifies the maximum time allowed before
>    sending a responding report.  The actual time allowed, called the Max
>    Resp Time, is represented in units of 1/10 second and is derived from
>    the Max Resp Code as follows:
Here I can give you some input. Default value is 10 seconds for which
the protocol value sent on the wire will be 100. This means 100 *
(1/10 second) =3D 10s. Similarly, setting just 14 seconds will cause
issues. The protocol value transmitted on the wire is 140, which, when
decoded as a linear value, results in 224. Similarly, values greater
than 25.5 seconds cannot be represented directly in the 8-bit field.

>
> Let me check i understand the issue. If the user configures a value >
> 127, linux continues to use the linear encoding, but a peer decodes it
> as a floating value.
Yes, you are right and that is what it does till now. And the Kernel
applies same to the QQIC field as well.

>
> 128 linear is 0 | 0x10) << (0 + 3) =3D 0x40 =3D 64. So the peer sends the
> reports earlier than required?
No, it is not 64. This becomes (0x10 << 3) =3D 0x80 =3D 128 again.

>
> 255 linear is (0xf | 0x10) << (7 + 3) =3D 0x1F0000 =3D 2031616. So the
> peer can send the reports much later than the 255 1/10 of a second
> than userspace expected.
Yes, you are right. But the calculation is incorrect; it becomes
0x7C00, which is 31744.

>
> What is useful here is, 'maximum time allowed'. The RFC does not
> appear to say how to pick a value between 0 and the maximum time
> allowed. Which gives us some flexibility.
Yes. However, this can lead to excessively slow membership
convergence, increased leave latency, and in some scenarios may cause
multicast membership state to expire before reports are received.

>
> I think a much simpler fix for stable is to clamp the user space
> request for setting the max response time to 127. That seems like a
> one line patch.
In mainline I encoded the value according to the RFC. We can clamp to
127 in stables, if we are not willing to take the entire series. This
will force user to use value < 128. Also, please consider QQIC; a
similar encoding issue persists.

>
>     Andrew
>

On Fri, Jul 10, 2026 at 1:31=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > > History: The multicast stack currently supports decoding of IGMPv3 =
and
> > > > MLDv2 exponential timer field encodings, but lacks the correspondin=
g
> > > > encoding logic when generating multicast query packets.
>
> RFC 3376 says:
>
> 4.1.1. Max Resp Code
>
>    The Max Resp Code field specifies the maximum time allowed before
>    sending a responding report.  The actual time allowed, called the Max
>    Resp Time, is represented in units of 1/10 second and is derived from
>    the Max Resp Code as follows:
>
>    If Max Resp Code < 128, Max Resp Time =3D Max Resp Code
>
>    If Max Resp Code >=3D 128, Max Resp Code represents a floating-point
>    value as follows:
>
>        0 1 2 3 4 5 6 7
>       +-+-+-+-+-+-+-+-+
>       |1| exp | mant  |
>       +-+-+-+-+-+-+-+-+
>
>    Max Resp Time =3D (mant | 0x10) << (exp + 3)
>
>    Small values of Max Resp Time allow IGMPv3 routers to tune the "leave
>    latency" (the time between the moment the last host leaves a group
>    and the moment the routing protocol is notified that there are no
>    more members).  Larger values, especially in the exponential range,
>    allow tuning of the burstiness of IGMP traffic on a network.
>
> Let me check i understand the issue. If the user configures a value >
> 127, linux continues to use the linear encoding, but a peer decodes it
> as a floating value.
>
> 128 linear is 0 | 0x10) << (0 + 3) =3D 0x40 =3D 64. So the peer sends the
> reports earlier than required?
>
> 255 linear is (0xf | 0x10) << (7 + 3) =3D 0x1F0000 =3D 2031616. So the
> peer can send the reports much later than the 255 1/10 of a second
> than userspace expected.
>
> What is useful here is, 'maximum time allowed'. The RFC does not
> appear to say how to pick a value between 0 and the maximum time
> allowed. Which gives us some flexibility.
>
> I think a much simpler fix for stable is to clamp the user space
> request for setting the max response time to 127. That seems like a
> one line patch.
>
>     Andrew
>
