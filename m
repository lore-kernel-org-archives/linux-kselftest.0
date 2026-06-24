Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B22038A70B
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 06:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782284395; cv=pass; b=REm7m7Hs9AjMBBCb3Jl91Em7kLyNrBGp33YUeJ4Lipx4Nh5LRataocfugD1pkwNJlJ7b0CzbgZ02dgHR/rRUELs/xL1AbcHSIJKqkjgpKduHhXCFabxAsKLQNnsi6rf2IKXvQ0BHJ1nA7poOk+8AavRsS9TgaXr08M2VJK3Xa8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782284395; c=relaxed/simple;
	bh=44VgNbI0l91KEdDqjsLiBND2ODLDt3zLlCpOVTLuvwY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dtjvymgxE0tyJY3ox3MXfuqTU323XaPAb6csSvNJoa6fq/oKkF+inFqIKPoG/7xh+exNDZsHEDL0yL6ahfesnv1Xpokv5TwBRBH6u67NqjQKGf627mWDRwCI3CccP8MWg37VoFRu5ZjedLFNPtA1TKPTRuqKY6hcsbI+/fVS/Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWkzwMjf; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWkzwMjf"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c07ea058c1aso106219566b.2
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 23:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782284392; cv=none;
        d=google.com; s=arc-20240605;
        b=BoOAdq+LI8YRH6YNZtC/392vkrrovaO102NwRVBwC0mqv4Mhmh2SyGZIe3Pqhp3Jfd
         VEW9yoQv6YMj2oopi5xGoncCRR7K0+ResNgBt/X/f/+97fw3zsZ9i7/SmrGJEVBo6qqU
         up+plyHrBDD+rGdY2Y/M9WV5+dYOmfih+nxTUh15F8ZmUWJT0A5+8PFWkRR1sgI0JiD4
         7q9t/aUi57wy+GYz3oHlK/5UWMoB3hIDuP32t/dDtcGkropFjKD2PmcmrJ/XmVYtz53G
         qyHVpX6xeLdOHbOLusPWjVhhTTnOROcuZWMfYE8Ehn3zoGLBQ1VPJ97BwTnEgN/L4udd
         bNwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=44VgNbI0l91KEdDqjsLiBND2ODLDt3zLlCpOVTLuvwY=;
        fh=VZUSHYksyXKUJJiapMLuhPfxVpEdAR/o7X5W7n0YHZs=;
        b=e2Yj1SoJGLaZIjYejEE0SafEdmg156QVesga/F7ZW3D91BsImGYWh+DuSiFj/jiQmI
         vLZy0As5zUkEjlffaztjej6X2cLPn4byNlOayCUzkto0DcoAgCBqLdwIy7oQuaV6aWf2
         RaezL4obOhZASPXAXnhqlsTDnNBHKzdwh4FOFC7OXYEfotIaneo1DxI+mmEUJxOhKItI
         2FjK2lgVkduEuYJGCrTHZAVS8/PhIeh/nZ6t4HNlPOBeUz0CP5Vvg/eIGJ6r05X0yL7N
         AmszrUv+Kyc2GYndqKhy4/8xVEHi0SIdRba/b0W+UEsSILISGU1DZENssjbXJ/pko7eu
         4uMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782284392; x=1782889192; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=44VgNbI0l91KEdDqjsLiBND2ODLDt3zLlCpOVTLuvwY=;
        b=RWkzwMjfSbspuGMitpVnC20hjUGIfGntEprkZdgd3gHDn7maXw5PsQ1Ipd4GBmTZaQ
         /pFbvKA7j6KDUm69QpvhQUgw5ldVOrifq4dZu4/F9+DFo+DbFW8ido/7Wu6pEOVvyOqP
         QdZ2ehXh4sJmNq8uLNTvOEvhHtqhFjU7dGYKQcrlvskthhX+SaoLtrXJpK8MOO2LTIHX
         7RVV8I4pG3e7Orm6h8SlU+CW0o6GdqHDt73boWVk1Thrr5Nt2Dd/gevyqIGj3Z+dYLak
         Mo/7l0QXamYBuwWEU4UKuQqX9EIQijapP/XVr5p0jGcjwl2FQEgOV1uZC2j3SkXjoiR5
         k57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782284392; x=1782889192;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44VgNbI0l91KEdDqjsLiBND2ODLDt3zLlCpOVTLuvwY=;
        b=dkcFgs/mD7QWMuMpyDA19VyoGpSlmiF+xCjLUWxfQZxSJUrw8GqC3Gc5RFoLOgNqps
         GKkKZ/hA/dIRjukfJHrrYe9ajhf7B5nOavu/9hanL0RyGoOiKSI2FPPMiazRXzxgEZst
         JOVI9G6cI5+aJYeJ+y7BR8WTJdIZP6KQzaYvdueB2Tr3WVZoTP0gYar6GBbvgxCul1ny
         JfqUHwcwet3GY05FigTkPrKfTUC5RtGPxaL6mp717LOWPrhTXDXDHWs7QT8nYL3c3xxY
         8mrQaJKb8d4DYtNh6/nrkK9eHRyX4wik9vAHLtSGbeA/PpqgnOnOw9e3GQ3pKNE75gSx
         /eLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Q8a41NRrBKwuOECLEwfM8OeigFCY/sgCqEXK80tazx6IS2423oNSvokF+poLvn/rEwnDRa/CSDJCfhf45xWA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6DAy/UWSV+vGsHJAR1E+/GDw+dM2ErjcZ0caaZ3/E/OiDelt8
	yRu/X7Lq2uYMF3Qd9ktjSd9taNwNfhkCDG1wnU7TZpTNg56n30X3Jg9753IOaGNnxE7qq/q9goC
	lVGSW4RvoW7KEJMlLEh9oWA8nWej5cBI=
X-Gm-Gg: AfdE7cmZHQ9/FYNPbvmaavDNplVZhihiiA90hUalu1CNA152FiTvO4ERhvsDoT7Oe3X
	WZdotgEYg3EYTSfa8U2IrY3tUcXdQNxog8mkz9IFoUohR5xtFHCxeGUXKcWlBoCTnEslMPkWu1H
	ghcIsTWls6jNlXaixIj9U8hpGF1Rp9fxdbl91hNhgk0uzL/0CCu97VUVIEnZDLcCZWKoqxYroOS
	uZcQDcCHDZopmtQWlE+9pEtUz4tRK0/N4xHaBJne9Izn1IPpYeFOwXSvz5FbTvHRiJckN33SLtN
	EXAWawmF
X-Received: by 2002:a17:907:a807:b0:bea:f5ec:e70d with SMTP id
 a640c23a62f3a-c119cc73499mr81252166b.10.1782284392161; Tue, 23 Jun 2026
 23:59:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ujjal Roy <royujjal@gmail.com>
Date: Wed, 24 Jun 2026 12:29:36 +0530
X-Gm-Features: AVVi8CcjqT2HGCtdY0b3TsVb5_1CyqP5ethEgfbUu0VypPx0SY_tnqJhPcFQITk
Message-ID: <CAE2MWknz4X_gcNo6jkR87Lg8F0zfubkOc4Ujr57CS3aBMWrjEA@mail.gmail.com>
Subject: Please backport bridge multicast exponential field encoding fix
 series to stable kernels
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
	David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, Andy Roulin <aroulin@nvidia.com>, 
	Yong Wang <yongwang@nvidia.com>, Petr Machata <petrm@nvidia.com>, stable@vger.kernel.org, 
	Greg KH <greg@kroah.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ujjal Roy <ujjal@alumnux.com>, bridge@lists.linux.dev, 
	Kernel <netdev@vger.kernel.org>, Kernel <linux-kernel@vger.kernel.org>, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Please consider backporting the following bridge multicast fix series
to all applicable stable kernels:

726fa7da2d8c ("ipv4: igmp: get rid of IGMPV3_{QQIC,MRC} and simplify
calculation")
12cfb4ecc471 ("ipv6: mld: rename mldv2_mrc() and add mldv2_qqi()")
95bfd196f0dc ("ipv4: igmp: encode multicast exponential fields")
e51560f4220a ("ipv6: mld: encode multicast exponential fields")
529dbe762de0 ("selftests: net: bridge: add MRC and QQIC field encoding tests")

This series was merged via: db314398f618 ("net: bridge: mcast: support
exponential field encoding")

History: The multicast stack currently supports decoding of IGMPv3 and
MLDv2 exponential timer field encodings, but lacks the corresponding
encoding logic when generating multicast query packets. As a result,
query intervals and response codes exceeding the linear encoding range
can be transmitted incorrectly. This can cause multicast queriers and
listeners to interpret different timing values, resulting in protocol
interoperability issues, membership timeouts, and premature multicast
group expiration.

Testing: The series adds the missing encoding support for both IGMPv3
and MLDv2 and includes selftests that validate the behavior.
I backported the series to v6.6.123.2 and verified the accompanying
selftests. The selftests fail on the unpatched kernel and pass after
applying the series, demonstrating both the bug and the effectiveness
of the fix.

Given that this is a protocol correctness issue affecting multicast
query generation, please consider backporting the complete series to
all applicable stable kernels.

Thanks,
Ujjal
