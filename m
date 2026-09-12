Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2321C48EBFE
	for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 18:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789239597; cv=none; b=AJdL5LdwJiQjH8O9BJYGQLRDsL161daf8MAtVGBBVvOGPE8p6H9c6t1zN0EoDSmsqtKWJ+5neGYJvGsbWADpg2xg8Ip7PQHmvFMLu19vgmG9HiWKjQZ7m4sxxfGgQtBPGUQfb46eyOVrXmrh6NEO5GNogQTp/0xxtxQp43rT2XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789239597; c=relaxed/simple;
	bh=W5pYYkFbHu8gvCgwzbJArz6TGx07mjzoqi/91WuzJU4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XnJSYAKZfzoPZS6rhGqKglKYwqh0lvT64X65u7C3MHcTKPo49TRqv03xMc3v5lD/grVChyKXdoC/huDc64wHIOn14G31hgwjrDKqnnMzndOX8YNbCu6Ues3xZq+GcyjLPil/lG1ylQyQcUunQ5vUscR7pCkndc9hZHNbmiGz3NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gT11OAU3; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gT11OAU3"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6bc7a8b4802so2308532eaf.2
        for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 11:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789239595; x=1789844395; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m0hkFL/zZs+ga9gIE1b00ZBTTiY2auR/sNm0zFmpqW8=;
        b=gT11OAU3g0F4I6b0hBH48880CH9HvugutKIxYDKPRy7TdUII16F6pBPHpAyU447iw0
         J9r8+tnNb0xJlD0rf20WKlVjORVZUYPl6cC1vfnJQPAscqYiMjMtpoHPgTn6Ca7bBJ9r
         0qsGd8ewvpAClNXRIb+FIwK4w6NAXv8gMv/sKSrDS00mJ8mmnB/52JM1NAreq8tx+Zvd
         x2smqwqG+Aa9K9zV4zvzLBP0HIPySaA8V+MVkek5rlBCHeUu1GsewJbDaXli5AIkZNqp
         NXyQksM/9xAQmLBMuyDsJFZiOMcCS4O/OeM4E/sCZ5K1Ya1yUy3lJYYhxUmD7mn95ikq
         lwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789239595; x=1789844395;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0hkFL/zZs+ga9gIE1b00ZBTTiY2auR/sNm0zFmpqW8=;
        b=e3yGdIbyZ1ptpzvPGrN240SMmiknLg5+/c4m7JIBvGdAkYfuHIXZos1cHUiY2kwAjE
         mZvvTUJTkRS1LjtqpGv+CTOBOKlrkko9sig5MNvIdW6ns7vd7KevabEwxD0wjSkTC8x3
         oNlSm03WLPiywNMTHISdH1YVBSEEdBkQIUMEc0STPLisH0ZA6Bq7MYTRp4jwIplkIg3a
         wL9TMX+enmwAhGkiw+sDJ2+tDcYspSN3gtda8GLYmBOMyP9tuDVJUhUu93wkQHvAKy/E
         tUUtBUJuwVBkXWoyolgBMtm37RZunUnXFk9acDxPfm/6IYTNsVHS7N4hdvcppstziFDY
         Ighw==
X-Forwarded-Encrypted: i=1; AKwUvByvfnc5ZrgAcsRndov5kRo3f3lDrcyjS37cZWwDZ7P3kg/3DAU+Z1rTJXiWh09U4Yvjnp4/CUNWHEm64b9Nnvo=@vger.kernel.org
X-Gm-Message-State: AFuF++nVNG3DUCkUzh1Yh3Kq/6VzmYMdjnFoQ5+DeU+/JB6uA7wxPnzk
	sWW4XMrmVLB28bTEvb9kY+HsJi2QgoseyXF4ZFc3XlE6uBbokGRfuRa7
X-Gm-Gg: AYBFou0x6MKMLYX1jKmJj1QEziVY0kfy/dfHapTmncbHmxw9Y4usi9g3AQWbMQVNzBv
	y9WaCkI099w2Du+eo1cGuc4NXGmGeeWF7qXzJVnmhICDsemNeXTYzuPvtt/te921CD4wAzUL3MY
	F9N8zfHH3ia12h83atk5hXdpxl2TbYnTBMVywCrgLlbww1Dlwf0pLl3/5qTyTxpCzag44CsHMM1
	JVGpZvtNH2a414AGUN8COTgPTLlqGWeNjDWrpkiDIz/Knt61zTXqDL9DEPtJ+SKgsnXr47YXeE5
	Leyly8Swsq5SBjSnsgAIs579ekjxEqLMLEqHzMhXheWcnncGGeviNUzPQbKPKyd9bViNmHu8K92
	6d9+WULG0tSUUvNqgUge+xL6kQ/8+UxQnerr87qE4AsG8fWdofMK+Ekw37/atC4dt3vflLu62Uj
	dZ8nos/ztDjzD20JNF87LqvRWYsbSLUhxAEKjUvOWmhYxgpYOUnvjpsGpGMusfojrOj94rRkstX
	HY2YNWqXweeI6o+cuuLBKeOV8QRCnnnmjubpSrLa4aTiIy+OssS/ywLbj3mBypdcQ==
X-Received: by 2002:a05:6820:3393:20b0:6b7:83c5:fde9 with SMTP id 006d021491bc7-6c0bb1f316emr5155273eaf.42.1789239594641;
        Sat, 12 Sep 2026 11:59:54 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:41::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c342ec1ff5sm1030996eaf.14.2026.09.12.11.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 11:59:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 11:59:51 -0700
Message-Id: <DLDKI0ZXYI7H.1XQZZE2RCU7IF@gmail.com>
Cc: <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <john.fastabend@gmail.com>, <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 03/13] bpf: track low-32 scalar equality
 across zero-extending movs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Vineet Gupta" <vineet.gupta@linux.dev>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>
X-Mailer: aerc
References: <20260910164635.459558-1-vineet.gupta@linux.dev>
 <20260910164635.459558-4-vineet.gupta@linux.dev>
In-Reply-To: <20260910164635.459558-4-vineet.gupta@linux.dev>

On Thu Sep 10, 2026 at 9:46 AM PDT, Vineet Gupta wrote:
> Linked-scalar equality is full-64-bit only. A 32-bit mov from a source
> with unknown high bits therefore has to drop the relationship, and a late=
r
> narrowing of the source never reaches the destination:
>
>   r6 =3D ...              /* full 64-bit unknown */
>   w7 =3D w6               /* 32-bit zero-extending mov */
>   if w6 !=3D 0 goto ...   /* not taken: r6's low 32 bits are 0 */
>   if w7 =3D=3D 0 goto ...   /* not deduced today */
>
> Record a low-32-only link instead: dst shares src's low 32 bits and its
> high half is zero. On a later narrowing, sync_linked_regs() rebuilds such
> a register from the base rather than copying it, by re-applying the same
> zext_32_to_64() the mov used. The reverse direction is skipped: a ->subre=
g
> base knows nothing about a full register's high half.

at the first glance SUBREG_ZEXT is exactly the same as ADD_CONST32 delta =
=3D=3D 0.
no?
Both are unidirectional:
w6->id =3D=3D 1
w7->id =3D=3D 1, add_const =3D=3D 32, delta =3D=3D 0

will zero extend w7.

This new SUBREG_ZEXT will do the same.
What am I missing?

