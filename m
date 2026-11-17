Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904596;
	b=YPZyrhvR7mKWbHUCrCQfQuDVN5jCFBDPmtSvKHJ6GENoEuLKdOObyg14SSDkwjXQuXEv
	 smsSJgqGnbV8o+sWYACAwJoEIVxjpa8rnMMJuXS5hOED6f0Ctj8dUwQ/74m4dI8Moe1z5
	 I4wXwqibZ9VGj4LwDZR4Bfro1eIX7AW3j0ZJA0cqWLplR5GJ8Mr6mFnXCsBLXYNidG514
	 jPI6q4ehyTvt3w60tve0dCCaesg0h7z5zV2kw1QihiwiOnPia+a0Y+ZO288MKR2TMlNUy
	 xjLpBfLAkwmZr8ebdj7wWpj6oiH6iWRjZC3wHm7VMi/OhNxG4eKU1bLO83RFUbXVkuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
	b=DNYE78XTVM66/LA1hoAxp4P2vCC7PvKInZFlwhK4oH2ix9Mp1Z9ljASOdVdpvBYd7OCq
	 aEquGMePLtqYKCbwrDe4LLthL42r1mksPUzPxrX1gBXWfLoMkrhxmBmnDW2X9J0fQqwJq
	 JvwcjRqTCdDFIHBfaQagQaBnw8G8hCbScIFyfFgFHe7DGUIQAqQk5MUVfpyrrSxVO4h8W
	 T00/o24zD2kEiHlQnxd3M3zRK2DJ++XUW017ugaA37dxNGajSy9Th67JyaRT8f5NWhrRb
	 3XkXxy5YrK59CDFnltqwXSVyLGGiaC4pk9+G9m3eIcL/a8TElFLafeX3tiSGzrsknTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VB84C1sh;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C54606A88C
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 08:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C54606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VB84C1sh
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b467581b98so39088925e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 00:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904592; x=1795509392; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
        b=VB84C1shjSG034pSk2oK3egXlQwWjuu3VjrdbAKPawk/Twv4Yif6yhPlbROFWtMgPQ
         3tz2NQZOgPBk3fq0QRZC/paJXFCSb8aJt/mhh+A0iXMTZvR4a2C4xo37cxqDT+bS5wyK
         cFfqQ64HX4H+WtOYlqmaNWk53bLD4rVzH3Dam/22N7EldMgTIeT60YiznWNjIzN+eEJD
         Zc6kl9xoD3REW2KAU35dfm9/7zuNgWUL6hteTTxoqyJmYKiacM/NYuvwNSKHsMwzezat
         1L4qftGlpMPZouPAaee8sA2dATEpRVvU+RzrgkUS2mvSj/+KFRi5Npjbd19v9tUdsF88
         Zbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904592; x=1795509392;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
        b=ygS1GU/gVY0Ptq7zYSFWwRmiqF2hIph45l5Ymrl+Ra/gXfRTfppAqrc4zmwmDIL1SQ
         WL/sc55VOHpYJVPDmuE1N8IOtpw3BVuj4B8a+yLQhIrydL5fCfbc0qH5DUJr2Ei1Zmmv
         HuPLduSaKK74uN+gSma/tpbqduIhGtZf+3v7x3XO3BBem6zsjrAlej5ksIfIrgh9oqU9
         vfuw4Jxic0kmwQ+CZB9TYwaqN4nDPqU7A1FvIvb3d0GjA7gczhlSI0bmSKxDyRuyS7sO
         cWcSTq0QvO4JtjZLmPvipjCtpR18+2OEJwbRNNBjAjuGpHyEfil3rZiAiy5BWW6HggZM
         CjyA==
X-Forwarded-Encrypted: i=1; AL+hErEvj43fu0bdrqANelXAQhgV91NOOTc2q4p/qYCTJXGforcnjOvpjqJH/cx85EqSjTmyMQAmxDgTfElBcovbCAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z5Rn9KiDIOqITvJsqXZVYgyhbNPh5e/oPPU7bpwp9CUR9PqSf
	sde42b4Yq5fdJxtOYf5H18t79eV+1iYdPMi3EzFTVc4z5BynyOlBaS9B9/joQdpfYf7I
X-Gm-Gg: AYBFou3T708CwKcZN35o1jIg4KXQmibL76SrrLdViJu/4Lz27PuMPk76o2PBmWlvuWL
	W+TP4bZUD1BqDtd1ekI2CtGg+QUtsB2bMrpyvjnmObUJk+C0atk1odenT3lNZGOPSJsm6L2qJGN
	xvOMHk/+Xyk9odrHr2e1pxiJ3Xk0WN0RUjs4P4kKIOz1Z6e3EQzuXQx/DDhhGN3EdLZWJI50+IE
	U7JKKrhkhtnwd95T0oWtuDtW8vqoBVvJuiossmxeowXafSgqTBwI7mWqWwVal4eqGOUFX+a1tla
	Cr4Rg3ZhroW/IHOIANIZp5mJoctuNAp1J4/ijlH2OoXAfaZVa2h6bL30vB03VfZ5kbki2HFoXnx
	xntFdlIjnXBH4Fc+zPl+Hr8JCGgWcvKoMLhwRNNFebnT2KgQDTs2colc5L/J1/UIFZ8AJNIIzxA
	52oBKnsznfxdHZRLncXfsk6ln4HOcKe//MCp6iA4AeGFVWLxhkoM+eitdNeuU2B8znnAUMhhFtV
	BO2kd573J60mwuw1OFbvuU2M819tHKRdYIzJmmHIABkAd+w8uf+Ler8/J5HYxDWW2tGqmnYu+Sr
	I0AckQoRzphc+hrCZb2bsITsEIgUVDfsjsSVvFq9de6Gmi+qb9GJvp9gGB/7fDIGEhSI6zrqjnM
	IlCKw7C5F5vDR38thP59X3+Qq1OqQTEj8kTFCDEgtuubU/kjR9svx1oIv
X-Received: by 2002:a05:600c:1f90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb55ab281bmr266345525e9.21.1794904592167;
        Tue, 17 Nov 2026 00:36:32 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm52548565e9.12.2026.11.17.00.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:36:31 -0800 (PST)
Message-ID: <411502f9a4f940c223b2b88d7e19fafdce63172e.camel@amutable.com>
Subject: Re: [PATCH RFC v3 29/44] s390/hypfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:36:30 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-29-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-29-8cbbea1cf34f@kernel.org>
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

On Mon, 2026-11-16 at 12:05 +0100, Christian Brauner wrote:
> Initialize hypfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. hypfs never holds executables or
> device nodes.
>=20

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0arch/s390/hypfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/arch/s390/hypfs/inode.c b/arch/s390/hypfs/inode.c
> index 559b011e68800..8662169de477a 100644
> --- a/arch/s390/hypfs/inode.c
> +++ b/arch/s390/hypfs/inode.c
> @@ -12,6 +12,7 @@
> =C2=A0#include <linux/errno.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/vfs.h>
> @@ -301,6 +302,7 @@ static int hypfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	sbi->gid =3D current_gid();
> =C2=A0
> =C2=A0	fc->s_fs_info =3D sbi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &hypfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
