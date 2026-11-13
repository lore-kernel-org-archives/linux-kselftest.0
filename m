Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563700;
	b=PO0ot9sC+zDHnMUY5Z2yiEvWBA/qyMtFV9sZBYEyzFntYb4pruUT6BJLB3X22XQaYKi5
	 i1PXqLMQSCikz7nVthQk8192f7X4v02w01f9fSl6/KmA8avloeCzHI9IpbJSR5yWnGkKB
	 3fjQ9ecIVp1wX8QmddgcHu4son6+RBZXZkyqrYKDUUAK0i/pH5mHWLEKRkmVWHQrg5UoZ
	 /tw0pxpgNsLbT9vnrapvlMIRyXP6t58vXpo9bnghG1mavagg5gydFKzCaPYWkXa3oPB/e
	 ZQZw/NBIb8qQSVPdxPuo0A9gF0IryRFZ4kRc2nKW6ixNaqNyxtMRaZ/pUuUudS4rlXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=G8DmFU4pJwAPCJlqHBF8SKasEEThxtJNlC1sg/CSkLw=;
	b=yN5gMkGlx1aaEa270aEmajZl5WjyAiVgphxk3sJTb9Ql3vRwIet9/2ZmjZmwMGTiJi3L
	 ThjEuxxP+wKW5iQuujipWIwSVThW+R6ajQIBhyKTt/wd5EPsltNq0mkUu+FLOId6hosPe
	 c3RCW18xS/R64k/zq43CK1B1Yi/5ElCoZ0I1QdcXGaesejGOQYIPhLRPlO6QlfI/d5Fyb
	 TNDbJObmWJzpaMtKCo6eS5lqvn83D+B3uTjpw9NYGYF9iawMVKio1Kob7Ziprq9923vHt
	 HO6fLZ0tzk8TDyllcylznI5YDEnWcZ3f6oukuBz5+5fqDwfTFgE4GDtENk1yU5OlTVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sk58W6sW;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4222A60A2605
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 09:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4222A60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sk58W6sW
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so171534666b.3
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 01:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794563698; x=1795168498; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G8DmFU4pJwAPCJlqHBF8SKasEEThxtJNlC1sg/CSkLw=;
        b=sk58W6sWmN4ERo+6S+koVh/BM/TVuc998Smvb7+dAHAHasLoIxA1PyH7SpTb2sphTs
         qaL8BceJIK/C5zTluK59TXAg0t7i18MIhSXKzAc74GDtFkVBtJ5XexxofTn2ErTCpEyw
         wBL0ZIwSoD+QdFLNUYuAtp3uhttIIU+8CcgeY50Q9BuPcdVkRSxffNnvhBi5q+TOT3Z0
         N0fPVcnw8avDa7R0wdKzwUNoVC/3vPRCD1SmgKjZfrkNv7BBIugYP8aqCryl3mRTzhIm
         nyzLSOhSkS/Bye+QA00IM2MsjhnUA408QIyungJaHYxvuyXbuTeC6K0dJcKnUnQNsCLo
         BJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563698; x=1795168498;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8DmFU4pJwAPCJlqHBF8SKasEEThxtJNlC1sg/CSkLw=;
        b=mjBd3Q9f29zeiZhda5qTxmPTRhczH16GSrq4yAdzfG0yL6sMCxnmgcj0wAfVOWZ8kQ
         ynkgZKXDxuS50rdkGDxtplp84kaq1yRu3b/z3lnZwI17M106Ct3u4LW/jO0aCVnHh63y
         pkf6Eyv6qYRhZS0P//arsktITjnArCY/x17apaCv+fqMlpZZzfoC0XRiIDq3P9ZpvgZP
         rQWy4m6np5lOzPEcFWoVbc69IArxTXwi0gaP9aUcXWJK1qZ7bUKQMhxQbVpLoQWwuWtr
         P/uNsjg2Crk6BTNzm3Itjfr6yYO+qsrAGr4o3wOgvXjAL7eApa6LG0YIwfCSWOcAGvWz
         9p8A==
X-Forwarded-Encrypted: i=1; AL+hErGRLRkkXNqdM5p5WdzH3SLw7u1izBLnBucic6CwwO1ps+l2jE8wxvBztJQYOPcCaEf8L8ThCx0SYzu47f0Majg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rInNrmjNA9j4lHIhD98YQPFnG88xGbr+zghr2ZshUlUiMQY/1
	A2G6SOHUa5tX5Zm1YFYMW6c/bL33m1WOghHOiK5halgfKPmbb6r5X3quFP0OPrBSjB4W
X-Gm-Gg: AYBFou1+N6jVtG80WWjtVI4xhe2xFxjjnYfOuRvX+NmRO3+OnUGVd/VVkRGud1BdCav
	VL63XW6kmF8IbSSrVSyhs2l3YTVUAYS1vL5wl/QiONHGsiowDNkW8UsuBF/HZezetp3cnNLbPfq
	I+pi+l32YH/mZlhAG3/qjmbKK4RiYtV6jnnIaOFcX1tIZ0JKXGEWt7ELEAoIDKaXsG2lqFILBE9
	elMQQPtvixQW/7CSrRPbBmEu6O4o69Tyj2E/WVH9E421Zm+KPku3sCXAFeiRKFMW1qW6vPIoTGA
	xW2rvVbyCYiD8Ek1PE+LmaejQuIT9sw9f6uHhtS3Fg5RYTO657dulcR31h+D1rsW6uOlRZlPcVA
	misiX7tGq3IqMM3Wsj11TywgjIP5IvHtr7hTS/ETztV4mXA7I5fkBEcaxJqJTke2UfN1Ll9Ec01
	mAnxPyunRJmbLMAf1se9WK9vGiRu8MJd1R7mMJxt5WlVy6afxWZRtBR2KCa5TioW7yZVeQaP3cU
	y0njnjGsDH6K/j4wVqYnPZsDevr5PSJujucZU6kr8gHv2VJiPKkoYoJ63Vd72KXJM7ICQa0aNv8
	2RpgO6G9tjQU1E/bLSHKVHveX5UDciL0HfXJ3XxRUjIpU+dD8wuks44rndnMQcM=
X-Received: by 2002:a17:907:ea93:b0:c41:4c20:5a80 with SMTP id a640c23a62f3a-c50963bdb9bmr198299566b.44.1794563698514;
        Fri, 13 Nov 2026 01:54:58 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50957c6c1fsm75151566b.0.2026.11.13.01.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:54:58 -0800 (PST)
Message-ID: <b42c9f4d29a9cbea66929c95cc8f736f12703c72.camel@amutable.com>
Subject: Re: [PATCH RFC 01/41] loop: refuse backing files that aren't open
 for reading
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
 linux-kselftest@vger.kernel.org, 	stable@vger.kernel.org
Date: Fri, 13 Nov 2026 10:54:56 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-1-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-1-4c998976c6c7@kernel.org>
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
> loop_configure() takes any file as long as it implements -
> >read_iter().
> Loop itself never checked whether the file was actually opened for
> reading. Buffered I/O went through vfs_iter_read() which refuses
> files
> without FMODE_READ. Direct I/O has called ->read_iter() of the
> backing
> file directly ever since loop grew support for it.
>=20
> Since commit f2fed441c69b ("loop: stop using vfs_iter_{read,write}
> for
> buffered I/O") buffered I/O calls ->read_iter() directly as well.
> That
> commit was about O_DIRECT handling and the FMODE_READ check went away
> as a side effect.
>=20
> So whoever can set up a loop device can read a file it was only
> allowed
> to open for writing. Open the file O_WRONLY, configure a loop device
> with it and read the contents through the loop device.
>=20
> Refuse backing files that aren't open for reading. Loop always reads
> from its backing file so a write-only backing file never made sense
> in
> the first place.
>=20
> Fixes: bc07c10a3603 ("block: loop: support DIO & AIO")
> Fixes: f2fed441c69b ("loop: stop using vfs_iter_{read,write} for
> buffered I/O")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/block/loop.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index a3325ceab484..c96e35c3ef42 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -528,6 +528,9 @@ static void loop_assign_backing_file(struct
> loop_device *lo, struct file *file)
> =C2=A0
> =C2=A0static int loop_check_backing_file(struct file *file)
> =C2=A0{
> +	if (!(file->f_mode & FMODE_READ))
> +		return -EBADF;
> +
> =C2=A0	if (!file->f_op->read_iter)
> =C2=A0		return -EINVAL;
> =C2=A0
