Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564728;
	b=KdpnIsyoCrDeKVtBeLfshyPXZarQr3t+KhmRYtjIwAAt1m1Db4Kgebd8pchNz9SNKRtn
	 Fv2kH80l/JX9uhKh8EZaVl6tPYfndxugZCZTBZqIEKQa+n6xkbz4zWTyxlITjIkpm5QHj
	 IhjoYp7ESaII2jcxTplSfY5B8cd3tBkAUJ1EpLDQOLhZktCqOwerNBUZWxHJYNZiqFFyw
	 IWJeiQvjO1TtL8fPaFqGadhyYuHqtlSfpQ/DuFfNgffzu4RHNl8qho4GKTTbdN8Y5h3p5
	 TLWQDjAVYZrNWoMX4H/c9bnAPDzcW2L94X7FXkD4XQePJHFZnLGloDd17ZvNw3EFSGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=C9TZKYRayQVC7UyXoancZRI4bPIYIHY06/n7s/4tB9k=;
	b=JrKgNoKhdyHmDjP3YyN83h7ohOAbt0psUFUuki0VUdCIxofdhVPtOYCLxQuhwhH3TSpt
	 TcfUYUVKwJSYjGI+EQsQs+5fcKpkjI1cDl7JG14gnbZ9JBzBxtR/WEh/0km30d7Piy0Bn
	 PTuBigyYedbLflu9c7A38mvATwM7ByA6DwhBK15aGwWLAUGBqpM0psk3a9NSnndrKCuP9
	 oCrJZMI+TwvO9+CVU9OEaooxTKEhpPG2a51t4Ny3tLz93ZM6LrYMv9UBsBBJ90+LMVrcA
	 B//mdmwWoSrjTwMUWwv2xfuF1hcJ/OzXZGa5W92arKm1ZoIu+LNAuwTqWEf6T0r1mYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JofFrwon;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AB1606A893
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 10:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4AB1606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JofFrwon
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso13097905e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 02:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564726; x=1795169526; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C9TZKYRayQVC7UyXoancZRI4bPIYIHY06/n7s/4tB9k=;
        b=JofFrwonLml2YmEXhdcViuKQhdgodt9TPfkjQoH5bRE5MuhkX9eapeBcuLoN9BMOMG
         mg62x7tr1NIo2ce3//xfxGBo2Glw1JnMwrRUE5PKg9cgXRmANAsmerUzgfn4I+APSoic
         nLUkrr6h7Ej/6ZnsBOEx8OEPXrCx3CvMaGkTszs9w9WOs3gF62hftbL3MH/tr8iwAkM5
         IEqdn+20vI39qrHT5Lu5B20ux21tBPJwfptIyU9tNUhlU5QyFDk51k8ZhbiJowoQswf0
         13eatahih0uhEB44iQMwucAarD0vNvZBAG3aTkRmepVuKD8cgol5N6Bgv+DPTP+kX4Yt
         YdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564726; x=1795169526;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9TZKYRayQVC7UyXoancZRI4bPIYIHY06/n7s/4tB9k=;
        b=cdilxQtd4Nd8fgQW8Xy67URFehXnQ28yzZM8yXcqQuAx9YORjg4ojCNCKNjKbuQVwZ
         PnO5qVMxhPiBd/gWCloIq/iat4HXpfpAwWGyRHYyMgtQVe/YI9Jda7YwnjX5zn3ogLld
         vRQJHeZ4g3CO+GAsxdZKB5CgFXOu/ypJTtPbvrAHcrRWDwvcF+vXpH1KgefomQZyT2CZ
         mMvJyIs3GwSIt5IiCanATlB59cx9gv3umkv071GHseYBowlAdHy1wLXHECCSja5+vIsB
         Zs5H+hFBn7HvkNzOWP9ItKIm4W2S7/0H1OSqmiRxH6sMzl+ZTeDVA8IHJKHWMknzVIWN
         u4BQ==
X-Forwarded-Encrypted: i=1; AL+hErF9ij/TnrR1fpjGVohGq6oWm9QHDjQ7ezJywMfYfn078cFITzwC6IPn6ls9pwIfwdFWPNITUYCx4QT8vxm00Bc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GrXnH2iU3RyWZxEOikdRuwE7Ldes9rH9koikIr0fIaugbkaHz
	A4r9Pvr88OGZ9197bKJFc3FMh8Pszqr0aR6+RcgRFkAaqkh+UWLLGApbMbzhaSSwN8cQ
X-Gm-Gg: AYBFou0dIfWoiIa/NsYiG36+1HQ5KT5zoGgP8n7XMRsThnp36WYAqmIMJnwi1oFt/a8
	GEfIyKUg8fjVqPQJSGT5M4tPrivhtX37AJoUHGOxhSPZII6wcXl+4jbOV91omBHHFH5QZq9ikpS
	g9YjxPSIE6dLWA9fwk1lFdzOqhBvs6z4GDy4FQUv7904J/As05gIHKy+ZT38rFgSosC0GTI8xoF
	KuXPeQ+zZVBibMRU0oTSVYtlKcADHeeK+TuX9fKK+aiD364nyc0xKsavH7ntvxmSkJuf07C3F8m
	h4hUsVCQqbVWQmT4RKfffKO0JGS5VZDojGonwef3H+UmsltNqAg5FAAmCUuM9bGbmBGSwFmArLm
	DSuhZVm7Ahrtg5X01CF+DDnbQhNVz3NH+8w19kbXO+EJdC4prVkiZvSW+D/LbsyAa0b8QzhS+nI
	yDhi0Y0kfVqaMNrbGdxxH2dNowohLUxsoQM/LawIto+pMk5LeBHqr+ePYM2pZpZWC+hyp+myZtB
	lsl54p7lhr4idmQ+UBcgDv2vRFMS2SXDh2xbZUaEsOPiJygQs9t5YsV8tfeW7rVdPB75BIcq6c+
	Rr11P5JxZOgbh0gL1+dfGJ5Y0maUknQPhoHKC4X5N/J9cix7gxojk95Eq/F7ujMa/ffAq50l796
	VfI+L685t
X-Received: by 2002:a05:600c:c4a3:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb55a02932mr40317635e9.1.1794564726124;
        Fri, 13 Nov 2026 02:12:06 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm142085915e9.4.2026.11.13.02.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:12:05 -0800 (PST)
Message-ID: <82d691d2db7579d9630bf89f73132e36124bf74e.camel@amutable.com>
Subject: Re: [PATCH RFC 19/41] smack: use fc_init_pseudo() for smackfs
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
Date: Fri, 13 Nov 2026 11:12:03 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-19-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-19-4c998976c6c7@kernel.org>
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
> Initialize smackfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. smackfs never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0security/smack/smackfs.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
> index a72bc7fabea9..4a56bbeaeca3 100644
> --- a/security/smack/smackfs.c
> +++ b/security/smack/smackfs.c
> @@ -25,6 +25,7 @@
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include "smack.h"
> =C2=A0
> =C2=A0#define BEBITS	(sizeof(__be32) * 8)
> @@ -2880,6 +2881,7 @@ static const struct fs_context_operations
> smk_context_ops =3D {
> =C2=A0 */
> =C2=A0static int smk_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &smk_context_ops;
> =C2=A0	return 0;
> =C2=A0}
