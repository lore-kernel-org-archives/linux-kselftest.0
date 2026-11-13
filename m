Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564841;
	b=RwsYd/ZfrOdh6l7dboVRHOTP9aYZdJ439gSVX/Jp3vw5/+AQ+jqk6z43jK81Z8uHxcdn
	 vMW+OdBWRZt89clYTsDX+g6J1m+TrlFqKl7cyrKD69wyhqejb3THHrp2zfZjGvKOjZ+Oy
	 sw6pWJgtXzsMtI8riSCJXfkg7Liz66S4hX0hCmQRir4T09KQH2ynXuUSAHOtLO8SrX4AF
	 tg0hvRC+PGTu5HI7Tk+eHbmxiBGtfLBkm15jNveV9Fcth3hz0j5Du48rt+P4Ll/wmf4n1
	 sMrkjhWAdGqHMzUVA6L++OICX/vhakBDdcJ1stkkjEdOolTNlyjriwyI6pD4NMsiLNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=LWRhkHq/o14g3eGvU8PB/2eVsiZ8AcgjQiitoPu4Uko=;
	b=I/CsmQHsaNCqiew6VXXAnIrW9MP+faHMZruGCV4nK0JCeycK/3TeImLjIPeFVcFo9YS/
	 V2cm+6t6vdKwcH4PtyFFjtbVLbYOOHdl8GOfC3CYe8AHB2yp2MX3wTY2c9ENU2qZf/IXS
	 LS0LkhbYbpAWxfduPMPs01gMqptDB3VtNSLDwNc7RuQt9Tiq5sl2Iy50THJ8kJSBmc3OI
	 /vkBTes5RIv64MQxFq8SaZocp1ouyWRv9gp1f0QhmXK3d2P3nrctvwz93+yfNBOZQRHUg
	 oStMEITgnIiGkgvsVKqoQns2+UdTQM7evxFOMzVxIx8Vw+mOS7hxbGBoaAtl686U3Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fgkfOyvU;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D86606A885
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 10:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48D86606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fgkfOyvU
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b001cd92bso590382f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 02:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564839; x=1795169639; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LWRhkHq/o14g3eGvU8PB/2eVsiZ8AcgjQiitoPu4Uko=;
        b=fgkfOyvUu8xf6W8q9zChbNscxyQBBGlOoHgKBKJ1BkQkWvPVGihrF+rRK/++Rh9GyG
         JHspcfYOBNPixo8oPKNP4HMqn4Pm5ECxNu6WadiPSEV1Ef7s5pMOTmdpp1h0qheNYCAL
         reGCPjjBuRkeLgJtvMnJj51efD/XBAnW7OBUZupe3DEOpiY9mIzToOLvbGpl9PZAiITD
         ja/hKOWfLJ2HwVqW5WbU5vpLe4u/8sEd47rKsdelsOgJDSYM8eMKS9Bg+p1Lcupp+2o7
         A8nYundFQzH4qm98PvOkGZvKdsA4h3jxn0f8A/jmsMNUP8nMz4irJ6DT1xabl6IkGIEw
         iw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564839; x=1795169639;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWRhkHq/o14g3eGvU8PB/2eVsiZ8AcgjQiitoPu4Uko=;
        b=ifiidgKqgnSzuSSofj6hczP9YuSLZHCFPg/F9oVXapAEuR1IDckbkJmHO1OOmjYYTQ
         alz+cXDHAkrro9R822M4oSkc2WwQu5uJojabJDBe3QIAVu+ExNubIUlh8mtFfi+mwqTH
         BTGN18Chji+FYaj7CqpEa1T8U2mD5tSxkehb0fcRnWwILbraArhqSWPJGPmJxqnJsW8Y
         MybTjNSZLe06zPRRMEc5TQj/G3MeX9OMHH0FQvfymEzew6faM3BiVf7Gm88Y/ohNUMS8
         IxiKgy1Yda8D+iCi99cD4g7i4WvJBSYE5RYxPXvoialro8TUzO0OPVB/jEnIQ/rBwBLM
         QBdw==
X-Forwarded-Encrypted: i=1; AL+hErFddqlfE72y3L/auhB6IC5ynVm0DwjuihPVC5eyP9bMVqsOBmfvu/0LvFCzvsdSZfYSd1aH/7zZv3MWWx2FFec=@vger.kernel.org
X-Gm-Message-State: APuU4Z83JicVTSbZ6R9SC2ZlcXpc+zSGEDc3tOuKXar0PwdTMQFQrwYX
	N3pE7AcPPQTu2DpA5EtEl0upKtWiSwXgu2iCUjGunNhe2vzebrt0m/Ha3riddTRGiTOm
X-Gm-Gg: AYBFou0dE296T0Vvc9kDeZ8xl4LZYqdSIqR8/fmfsjmVXQeIjuc7biCFPtOlVzcghxd
	3RpdvEGN51fSO2lzrQVjXwY469YLKUv9DOiFiybG0ydTPl08fYJ0fQ8c4DVOQAgYEMcOJCzPS25
	SQ3vuL2ePy8fSDxy/ex7t4XQjYIwwl+fq+Uwhz6GZzNJyxSGd4QpMcVFeaVvDH0CIJmwdw2q6Li
	OFTqbYoIR7+fOplSo0DN03jjtYfbUqTmN2wNSpKzMnH6lHo1v1x3kAjhZzn25q7tFD/SEm7egBW
	7PgTm4iWJ/N7S5g4C/uzYXSiIcFL+VRsQgXqPe+HfQL9J1P28Wb0xX7TEBM2xpkHICwke9iIKCM
	mSnRGdiuUwK2I29vsojaYAeo1q2mBH+LWC/PnccM9ClLS6zJ5rEwgxpD7Iv6bbqaW2a521VUv8k
	u/dVM/l698b6PH7AEsEmcy2PfUFV0hLNiWbsLLjRs3ldJE0Sokr6dTkvxjK/xWDD0VVNX4iAqgr
	IkB4MSE8VTdVvwsZpl/vZDh7AUPJ9kRgWW1kpA5RI2K0Uq7NLJSmigmjfyYcEz2H0ugyBKQyZv8
	DysI8HVV3OIXdzN3Q8X4cFG83tWIQoDg0ifwLEIdTruD2nH5Y7J29S5IKH7G1oI=
X-Received: by 2002:a05:6000:993:b0:48f:bc59:ab9c with SMTP id ffacd0b85a97d-49c6fd932f0mr4358101f8f.12.1794564838578;
        Fri, 13 Nov 2026 02:13:58 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d673ce75fsm190118f8f.55.2026.11.13.02.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:13:58 -0800 (PST)
Message-ID: <77855be3fb9f0e1888c6dddc56d73a1683c820f0.camel@amutable.com>
Subject: Re: [PATCH RFC 25/41] pstore: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:13:56 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-25-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-25-4c998976c6c7@kernel.org>
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
> Initialize pstore as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. pstore never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/pstore/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/pstore/inode.c b/fs/pstore/inode.c
> index cf499ba72702..4658561cf90b 100644
> --- a/fs/pstore/inode.c
> +++ b/fs/pstore/inode.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <linux/ramfs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/pstore.h>
> @@ -491,6 +492,7 @@ static int pstore_init_fs_context(struct
> fs_context *fc)
> =C2=A0	ctx->kmsg_bytes =3D kmsg_bytes;
> =C2=A0
> =C2=A0	fc->fs_private =3D ctx;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &pstore_context_ops;
> =C2=A0
> =C2=A0	return 0;
