Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564824;
	b=SuY5np4WdnSbtzUjOATwjZZiKM30TO9BptPBhKzbFH8+VUpeEXBFQY9gRkcvP2+SJ0Aw
	 bApLMLJXUtCOWNsboS4Fia07d4aZL0Op8ih9xQqdetHO8iFjvmLqvXM285BUnpxyeQqU6
	 j7JGuZrRoWwErds0MmPBm33QpEmglRW9afussjNMs60+KNH+DJJcY6z3/wAIUxJGEtPj9
	 9aOILU7wXGV36vu235lSQoVOg/QoUN38LU32itaKzk+0JyASa63LT0vNJudfcgG33H42D
	 zo4rhvgDz2OGp7o/dHQIEpcVvZLJgt/rAVIQWJyAIbc3IaV+5yXYK/YkVwBTIu1kbrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=ycFr7tcHP3BtNSevVHScuCcUOF/OuOrXOdu+rsUd7U8=;
	b=HlEJIhFCE2GxybY0uuTtnsN3gdw3WiWnHqj/UMyJR7OwAvLru+QfAc5slVjTPnA6zoM3
	 eg+PeDF4poUA1caKi/P+KGHJENC4eQ0qOinoAVNJRqvdiImN9qsizWZUlbla+Wf+zUuqb
	 X41KA0Gdycss0jnHlnCRaa0YNJYXwEaO6BvBCmbpKjRy3/EvaiixYBfITcimT+Vuv/+i0
	 pO+xI6O8uQfc6m5Pp2ymPGHWljYTSLePrS78O1+NYQRN4xA8lxs1ihaoUPWko21JTviXE
	 sPRXEXJKVLte1/r+wayXj0+6NdS2LUBVAfe8bwZi+OdiCfY0xKqegZVrAxA0Tu7e2iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tBSDp3uS;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F363D60A2610
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 10:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F363D60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tBSDp3uS
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso1490867a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 02:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564822; x=1795169622; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ycFr7tcHP3BtNSevVHScuCcUOF/OuOrXOdu+rsUd7U8=;
        b=tBSDp3uSBFgypsbtBQgsadIQZQK7UWodMC4WHZVi1N1ipHHYu6WywVfCa4AZ6QIaRM
         wIcOajhLTVFUJp4yf9/N65gePrg5n4K0AYKI0yA+7KNwnMoUY/irx0jTqY91Kx7jR9xZ
         Pm03fPe9TdsIWGPKhcU7A4Ssshd7c8Dhe1zzS2a/pwsZLiwc6FmAy6ptf2LWGhArJX18
         uzRhPjO9k+hyhG0ceM77HGUPCflD5+7VnbyODCgVUFUm1PdMwYT1gZdGgKWe2z5NHlJg
         Ao5qYJPp+rBAoBURzi6iHuHACVVyoOXqBDLcaaEy2+qVTTu+93IkZN11FbEDMtWMDX2T
         mB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564822; x=1795169622;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ycFr7tcHP3BtNSevVHScuCcUOF/OuOrXOdu+rsUd7U8=;
        b=Z4IXWDzsjQtnzDoF/ljxc1bakWP/x5oj7kXamqsl3nGNcSrKX6gFV4yPRktFn9Z+H7
         m/W/h0H9cfP99sMGDLjmvEqv9Hq6p0K9Jvnb3+pEwxgyrHNpFTEUdXScy19ISoAJtSHN
         MDImuteXJfGocm/U1VUQRYmu3CvOc1gzGN18ws1k01aZjq8af0o+ceY/fLlTUuW56DHe
         b36Uh3zaVnGsiz3llz+2eAPeuUM49IpOycZZi0O5H8A5DAX1d6awfJndR+t31XcChBmS
         OW1H0nyApIQzBQq9y88XNKrt/i0xC5AsVXTMsMmCyS6e82sKZMLavYt1eBxyTgsd92EZ
         4JPA==
X-Forwarded-Encrypted: i=1; AL+hErHKfQIzTbUDoBZ6byOdp3bZLuPrGfg8NL995AVnsEWix6+tmxOAKvp7+1s/KcBeBtu59O8RDgKJ47BnJNz9Nmo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GnM6kCVn5GFygm7/dl+TrkmyaeZZxClWAz1IaaIAQ0YGmBfDw
	9kk/q4wIOYpgr6gh7oT+Kop39T1DymPeVK1QOMzoR/Q8NR/u1PdDPT0RmO3d4mxQh0qE
X-Gm-Gg: AYBFou0A9V/AxYz7669j3vT/OF/2N1guTmXts0hlUMmQeQkZ2KbAD928FnDdxTDa5Xd
	JvC4fX08syydop+AHGMWBqFo1CR1EjlEaW6GuuqHtWRUJp3W+fyHOgu/wG6XTX+gDHkv5TaIMi6
	A05I9o9aQj26v0gmhvJ16fsTn+NeUM/3aONDd7/m/+xga525J1IgqUv80mRapH9wq393a5g4E8y
	8+paobBJlg2Tr5MswEGY1jGaEy1ECd/RQL9LuBMCPpF3tzJfHG+TM4VkPzfZoKGuR1Una7TIXyQ
	Tra9w1+5S+0raQ+2GwXCfIjVOCCaeyYggk1dN1+U59n9FHNxKv0zXSowYsiOGqCD5aURVT9Pehb
	T5KzwGbGDNS382+y934ZjpnGaUaJLTM/PozGzpNIANnl7iF5VrXVVXWw/+kQHhFz4GRbg/NrAhU
	raWO9CDSDj6csC13XvykUw9XWY3OVxruKPk2PdLJox3XmAIOo9WHrLYoP5sL6SNBRsr7q2xcgw+
	354tjbEeHqHJsfCA3z7O3m4cjyDmxldX+OIRYVlLQzXdZaq2OLPWkf0dDRTR/h/xsGQJaCSOkL4
	fJTFT6bCkBB/BbmmKopp0AzxbByL3wXI0dutF2sWMuvmSlQeq0mtdJysq3YTvBSUUjjRKxIgUSj
	Js8jGlFBQ
X-Received: by 2002:a05:6402:208c:20b0:6b5:69f4:e7ce with SMTP id 4fb4d7f45d1cf-6b7c0c62bacmr1415990a12.39.1794564822367;
        Fri, 13 Nov 2026 02:13:42 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm4332158f8f.35.2026.11.13.02.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:13:42 -0800 (PST)
Message-ID: <3546dd28b1d63c1478d391a2015fff4c1b976639.camel@amutable.com>
Subject: Re: [PATCH RFC 24/41] efivarfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:13:40 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-24-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-24-4c998976c6c7@kernel.org>
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
> Initialize efivarfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. efivarfs never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/efivarfs/super.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/efivarfs/super.c b/fs/efivarfs/super.c
> index 12746ced6dc6..e598d42c5f42 100644
> --- a/fs/efivarfs/super.c
> +++ b/fs/efivarfs/super.c
> @@ -8,6 +8,7 @@
> =C2=A0#include <linux/efi.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/pagemap.h>
> @@ -554,6 +555,7 @@ static int efivarfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	}
> =C2=A0
> =C2=A0	fc->s_fs_info =3D sfi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &efivarfs_context_ops;
> =C2=A0
> =C2=A0	return 0;
