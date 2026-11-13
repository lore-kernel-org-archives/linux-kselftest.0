Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564808;
	b=Ixe3/41k+h+lVd8kDvZMzmqjPhJ872y9iyNao6kZ8Jr+sNUKhXZQJrPMnH6IOTWA/XR/
	 XhZXBPrI1cM0mlYjUCMPsYhAkYhPuKjqT3FoZb1HoR3b3jiGlX/sVWU/XkE4ybrsyrzIz
	 4QZ35tOCq53JfOUkE5WFycnznb4euNMfc7J+t1DiDQmjGm+zUJ4ZEjeskoRzyEgZf0umJ
	 JdE6elg81nUN7HY+EO4QZoi/f1iNr/4VxOIcE7QvP/D+Z2Osscn40L6CKCN++wB/I1iXk
	 gguCJU5Skl5VxtLle+Mq4GeSrT1nTGg3mI2goT0maPm7OhHE/keLuiqx0zhMtt1ovHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=UX3uQO58FXw3i2m3kzI3o8uINYIcsljrdUAfEKBly4o=;
	b=Tzy0zo7/FxUA6spM6/aoHnp/3liu5AghJDkzlHUXtuk/7/B8oq7TRLXO8GQBlbvcqnpi
	 aMUO8L3Plvc4aVU4Tip2lXuwjowRH2Nl1zF4F77qGXGtNJyWMOP1BgLBX3+zEK9CzM9i/
	 wjgcu3xCHV4ESHZl80CWA7svBX7+kHUnM6ZYRmKpnee2XO+Hd99fXllmIZMCSy2nMjazN
	 d4xYu2ggQr3J9rQQmaY/ifqlksHvRrKTGeH66tU0qR5fYXYcLapUW9yr2Dz9xh/Wy9Boa
	 IMsGn8XeRJjomjpywV9dF/oTqQT3wQ3k0CxuUcrdBzvqwNTb0JxSNR+Yh92pIoH055w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rqBNEWhe;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AEB606A882
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 10:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1AEB606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rqBNEWhe
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so13721155e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 02:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564806; x=1795169606; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UX3uQO58FXw3i2m3kzI3o8uINYIcsljrdUAfEKBly4o=;
        b=rqBNEWhefqtER2dpEJNVPTElbe19fVdkNyIzbVbNULqUnWk9JP4TtodfrAxZg35Ufq
         +ciPTMXXDC3Fn73QdDq1nxL10hoZ0LEMTSuk+HTluWLCH3mNQBpp5ecm/W/Lr1PQghIv
         NQThaRjLVubmwKFzY9W4H2pkvpw752j1vTd8XwcKuq70wsUgwzLrChjclsxLFe4j6CXh
         P2+zI4RYwkyiSmtYnxi7mmM5Yw0kfqLENKBervoD5JNkytp6QIULxp+qmuf3k5WOFN+d
         HC6ACfaHkSpUVoBZwd9XYoAangfmrtxV8FymQjjH9iY0qoozDauX1oxEdXhYxV5zTWYW
         c/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564806; x=1795169606;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UX3uQO58FXw3i2m3kzI3o8uINYIcsljrdUAfEKBly4o=;
        b=f1U/ywDy1Bsz8hlwhw6fuf4MtyF9pygr98HKDXFnZPSREe164hFz3JvETA8jnp1hlO
         ftvlSVDF/au+SxK3bNXONmN/sANBxtVfKvaIXheB5PzKwMPSJwZ9iPDuLoQRFAlEUVqW
         LyUnfxXDUeYw3iQZIINVnjOrWVmA920LOdM6F5f0Kt848ri8Sn1rRLX59II9INRC8vGQ
         9ktpHGhQgIEuYu9ay2+Ifp3uHheSuAVo+L0aQ4t5hhY+HQvfXKZ7jE6g+RGCEofqky+2
         bTEOEX9x2yaQL+oyGAuv5JMMu9SuwDfjCehQO++Xx/hFWgKeRKT/d68JA2ArY+Mz+t7X
         kpZw==
X-Forwarded-Encrypted: i=1; AL+hErH5w2+CGmqNCTwzbKxuIvKzayJPkEmiufkvkEZmiGsFjFMDlZS3rgqHSBlLhBUqL/YIlSBgXhspLMaWjawVX48=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WRq85YDPk7Apj92lMcmlfZWuhugPZRHZpsW88uX6fKGdMWhoP
	g5t1MKoVnLVtRlV1HFKS1Hik1xZgBacPJ89K0ZCUyOlvX+SyCqAVEHmP9bOdIFtRTbr9
X-Gm-Gg: AYBFou3p9aAOrHMNUQ46oXFn8q5YMsgTiAzRZSMtmeCJlWVYUEWywKhlsyb665iJYmI
	5Ct1rONu4mxixoWQ7k8IOQooGjn1x/b28SSPhnFNwvlQqzIA0P/vhmYy3WO/UZIdaMcgvkgcnRI
	KHs8e+G++yTxbI+3JhCusO7HrJ4hHs8jjkJJyTe+0Z8sr/0f5qvF703VrqrUSyYgs1M24cCZQDg
	mS7khPM5mcN6IlU8yl3wXMBe2Em/3QRRO2aLYWXY6hyLkiCNJCNhkdonrFysIEv4mSuflvNB59m
	DTjRAJeXZ1nJZnb2JLeE/sta/S3BH0W0TaiYLZcV0iwTXXeNGG3R58EdBvyIRRzQepurIBarL17
	X/Oxq2m/wTvxUmpOHsj57YkjCOhBzskCN3IPbV+Z7GLaCCXop0Ic8jxbJ0K5gAYsUGMinlB+E6g
	W1RXiX7kOIRRUXwC0MoyaNG0ilvUyOID2S2RlQ3u2XfZmmkdpq/ZqFM6zydqUKgI4Gx3DjHOuge
	XSMsBIto1ChsDEO5vCmtxfatLvR01tbAF6vSz51FKlxO5sUhnsgYLM5kj9BsB5m0rItY1ltLzhT
	KQpL8pToC9vZnfDO399dGxuugwbG+NacgzWMsjDVMSKUKo9OQbys8RQUk1MN8uo=
X-Received: by 2002:a05:600c:45d4:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4bb559f6f31mr43583035e9.2.1794564806374;
        Fri, 13 Nov 2026 02:13:26 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm4362275f8f.49.2026.11.13.02.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:13:26 -0800 (PST)
Message-ID: <23edc29c421f5d4c1103004f79e104e9f94d42c2.camel@amutable.com>
Subject: Re: [PATCH RFC 23/41] fuse: use fc_init_pseudo() for fusectl
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 11:13:24 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-23-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-23-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize fusectl as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. fusectl never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/fuse/control.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/fuse/control.c b/fs/fuse/control.c
> index 21ffde596d61..4497362e7df0 100644
> --- a/fs/fuse/control.c
> +++ b/fs/fuse/control.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0
> =C2=A0#define FUSE_CTL_SUPER_MAGIC 0x65735543
> @@ -334,6 +335,7 @@ static const struct fs_context_operations
> fuse_ctl_context_ops =3D {
> =C2=A0
> =C2=A0static int fuse_ctl_init_fs_context(struct fs_context *fsc)
> =C2=A0{
> +	fc_init_pseudo(fsc);
> =C2=A0	fsc->ops =3D &fuse_ctl_context_ops;
> =C2=A0	return 0;
> =C2=A0}
