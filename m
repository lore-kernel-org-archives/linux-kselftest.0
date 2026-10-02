Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724D746AEFE
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936020; cv=pass; b=LlI+cYHrHjKjUYxlyGlAy3HmksucZOeN/nlKiMF/w1AJh+P9SvoQgjP43dnOSokwLAlJrYqBYlKg5wJRiykm7bAkjBBAayF9ikR3HuXrs2FBCI5dffL6s6VkPHOGDzBiWygq4lby7Gtmr7QYejsX0W0pD5Er2elZK/rR32zIROs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936020; c=relaxed/simple;
	bh=R31dQDnJ53ap5GeH4hbi3ZM97krFZBGuCEodpNOsenA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aHkR01AGRcxHwXkrB4srdVIE83QjxL4ShfvchrQyYVvVEaL+9A1sX1Qqz1vmuTKuaa8Fue5abr1U+bOZRKItHrnly9/FgmP6x2qHSvipgpPrvZzSHH/QCLIbGGdoEYWiqgRZ1pX2WYo6lpFu61dbinLONyDSv4LepK5koc9Kgtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzoImABX; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzoImABX"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba447469b1so1542632e87.0
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 03:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790936016; cv=none;
        d=google.com; s=arc-20260327;
        b=jGv4soE9EpyRt4wxupLu05ywpXvU5VavsBoYT9pETzp+8QjD0I/miBqGYLI6hsjzJC
         oknLvxoQEmdb7gmBmYx6uCsh/MPBQ1PiL8fMLgf8w0lySefmrDrIMpxK0t95tqcMeFFb
         AjYfzjkPoQ+RQItbeC6FRjSHMyncbT8gZjhEq4eUoyzBxTmrwrMzKxl+xideWc1JEIJh
         SkUx//RZOyYSVPgSF4d3hNX6XulDdlPYRyf3M4jjLzMAyO9aFJPdhmCk/SgugdEr4qrB
         Oa5CH+53mJKde6a2TXBW4XNMIykfg/vq4wL/aTyPWDUiDYHPGM1WaYJOdeDYqwg3RKpp
         25Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YtQs44M5gzBLsCq+UUJQkpTtJc7hzbbbWNdnDCJs0yY=;
        fh=2DiUrFhzhVJdTt7BpTaFaSSPJBJJa++r4V8Zw+pDUq4=;
        b=ncmhlk5WFTLqYsJj8GJI1f5qKgRKYDN8RxijbHLBJHD78BIa6Gzlz0yGkF58B0Y39O
         0Zoy0ADh+YQYfZWcLoo0W3fph4rFtwI2pqmeaWrS5/V5BTDgGNlzuwBHpXztGfnSgMwm
         lRHazalJg0TvC1HY5SvJTWgiKeMH943o8UFJHlbkSbBzL8TUHbWq8P3h8+kBUyX/Xxbk
         dNLmdTLTo8IsJMGWy27jn4dbuQt7m2RqzvMIpBcswgdJ7/ElZyFH8CK2XOTi9A+KgpUL
         MzSnokHMMoGD3ZfQvrWBy3P8YTcVowlNtvUHGJYzE5A2PJFUikDMrDUudieCxdsUNiHH
         qLqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790936016; x=1791540816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YtQs44M5gzBLsCq+UUJQkpTtJc7hzbbbWNdnDCJs0yY=;
        b=dzoImABXSK2Gn5sUjxkaIb3Ut06JZ5GtduYxFB+DlVlZxUZXLMXBxKtl9w5wb8jKmN
         869QAukK38CFKwy5AW1Wl/eSoSBulkQ9FYMFHJPXX65uanH6t15vx8mYbkA2Rp2+ETQc
         91gou23YDlaZVvHG9ZnL2ad6tnx7JY29xRZ+wMVqo6syg6pc5xswPPskxc/p7WiI/HwM
         5oHGaMz9xGzb5IvxIpqM205iFpKjvQ2fPi1oYxKrsI6Q2IeerGYiXYF5Lm1fjAPsQHiW
         dVT/sBCTxzfQu4ULOo9wOWQgSUGEy+aaADXdcPdak0rAqz5Vu/qZkvHos4pdlou5Jj8l
         KxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936016; x=1791540816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtQs44M5gzBLsCq+UUJQkpTtJc7hzbbbWNdnDCJs0yY=;
        b=jgN+ldhmP0ylhCS7LRnAl+doHinMztyBaOF7+ayWtX8Y196JY8cQnmlt3BNwIgTp57
         MDiAGELDZq9qHKPQmTTrUVYsL/xidagI7NaSoOWtSIqa8RsF4Zj1C9ibM8dffqgw6D0H
         8hMj6i5bYjZqnh+/vEvrSlcyihJiPzXCAc/CiBUWQmlZ373gbt3e2TUbimrmhDyUSsJ6
         5BIaZGaGKJGDNU3fST7/J9zYzxBls9HQ2qu4ThhbzQ62BpucSWR9Cuc2g8b9zwTfYTbC
         jDI3o13Q+0+QPCTBI75Vr3JLuAT1JBlTBk7byxChhMtGRoqvio0PoH9UgTRz+lPVe3yV
         t/OQ==
X-Forwarded-Encrypted: i=1; AKwUvBwE9Vnl6Oe/7IF3bwjbhBTogDTb02dphjKrHhqd8j+P11MwIaCqrWe3+ZwBCdhSCrkkBUNxu9FbrAsOMJyy+n8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHhEWGshDhsN0YbdFt4JuZqunxywL0EvBYGgHddrfpYr6Vn6JU
	6E36S+310E3qqKL0aInbR4UtZUt1lF2nNjhvdRtC3r/2qfCzwbT1ifAAIJBJoGnaatyME3wEtq0
	63oALYfLCob3vilClBslW3AfIEE7lK4s=
X-Gm-Gg: AYBFou0cS4IhPwjV9N8ZNobBUw8gQDZiOrA3KrlpDR+H5Tj9D0Ec9gxMxO1rVhqS5QH
	WPF+Yj0t5quZtJZVBRnbOQmrM1DukCo7bzoV539GwFpEUXZk6QNJFHjXeqgrz0I085jdnrufqtc
	Z7Dp9HmqncM9s21ORi96IHJSuG4PRQnCWp0fZfAkS19PJLXt2dDJcb/p1S6bDDxtjzTZ301Dw7U
	2idp0L1+crTQWfLONhq4/e8DNGIKwOT/lVBjuTqv3j2x0Bwedjyb4WV1R4mRdny8lAfqsiqEm03
	FQdbVR8EgF8rcrdmH6gxjw/nkF02JVnsnnvcaW9qdxQV1/qhtTUjneziSslcexIWul1kpZg/KT6
	8n0yLtpNMRc0=
X-Received: by 2002:a05:6512:2346:b0:5ba:3888:705b with SMTP id
 2adb3069b0e04-5bb9bb22cb8mr661934e87.54.1790936016247; Fri, 02 Oct 2026
 03:13:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930112842.21323-6-sigefriedhyy@gmail.com> <179089748368.434549.14167408771777474746@kernel.org>
In-Reply-To: <179089748368.434549.14167408771777474746@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Fri, 2 Oct 2026 19:13:25 +0900
X-Gm-Features: AclHuK9nykm4Rn1HobyHFdYa8n2y3hHFC_CiwY1QwI6PRZQntiimuWrJxRLpDDc
Message-ID: <CA+7S2vJCT+PzSvFtmL9disx8t8nAMZvEMULcL=97v4p6MDyPcw@mail.gmail.com>
Subject: Re: [PATCH net-next v9 5/6] netlink: specs: rt-addr: document
 AF_PACKET multicast dumps
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

> - [Low] The patch adds `target-netnsid` to the getmulticast dump request
>   with no condition, and writes doc text on which request semantics=E2=80=
=A6

Fair, will mention target-netnsid in that sentence if there is a v10.

> - [Low] In Documentation/netlink/specs/rt-addr.yaml, the getmulticast
>   operation still has a `do` section, and its doc still starts with "Get=
=E2=80=A6

Pre-existing issue.
