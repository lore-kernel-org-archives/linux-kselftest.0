Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564337;
	b=kazupoIGQydHKwtKHLqT5VmeAkHTgYswdPHRjxuW2ChN63azU26KDAFOtS7+V7d3jCI7
	 eGxO2HJ/FGP7oXMfmWnrI+Ik8+ZE3xwp8n9HSLZDt2Y3o2sfrdRLgZ2eQBJ+qkQzJBv1Y
	 41PEJPTWMMIa+f5lR+kCfAs8tncByRNTWHiTitmYw0etVnAd/XOr8rzSI5a4xue2FMBHH
	 JwoJbNBSTegbvWrcAougO2RC6edhCPQNnGl98lBPem/dih3fPi/8YB+VdjM2+qNq4l+H1
	 PFNEkN97sE0I4hnDNufLX0kSoNhz4KqLm+oKKYQAxAFMkW541NsmJ0qr7W8ruC6WxZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=fNM18G1T3F0ezY9f7dMoEwC6d3kOVWk14Z1vuqkOGWM=;
	b=SP2Lbn+a44wMEqIbhoUGy5JB3QcSz2ATIfMfzcTgb7GFyR0L8jMV/aIt3OPRCxlZ3bLp
	 FCCdg7TiOxix6DeRSfpnv4a80DwZ30AsbPyicibqHuk/QFutKRdjRkvMcGRX1Z5BHn5VT
	 SCXLNxLdvL3ng17F3Vp/Kc6SmExeXnyDS6S7B/ZoDx9Xx6w39KOFhOoVkO0u3iPtF2Gj7
	 Fyd8DxPr215r7wCHzUMu2iVNnGBrvZG++O8AgUZ5EWwUijbeGq/SMYuvJjEjSFe7XQ4fr
	 xKQooUvmB8vBGgGrVXaFsva44UFxfqPyTZs+u1FkYjl05OG3UhcngJZrIzW2IWPltQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nUCLd8f0;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3976A606B125
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 10:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3976A606B125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nUCLd8f0
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so1381289a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 02:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564335; x=1795169135; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fNM18G1T3F0ezY9f7dMoEwC6d3kOVWk14Z1vuqkOGWM=;
        b=nUCLd8f0G/K2fMNIytq9u2LWpw8l5XbCSUxsIs6+S5nVG1T3fI5ErIjnpvRMTRJ1g3
         66+hupjWTQxex7ntfQ08B69tN3G7DYFzu+MIzI3GxWcQnqgZu7yay01l+4mpEhy0Ef02
         xbNHIv/PH0KitW7ZH+pZK/qyW26JriIVV4HRgFAXvls3DDajVpT9R5cy9rfpfJ9qOhH/
         quuiU6KaH+bd+1MNp1oe0tS5lHpOu5FifqraRZhGcQQrLcBdrSt8hi6RHYJpJDDneT+2
         609Jb+e8BW/fqMWXfEgOdGZ8nZZS6I2LapQ01HWyupMw/vLrZIn5Q4gffAveGLQARYQM
         rrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564335; x=1795169135;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNM18G1T3F0ezY9f7dMoEwC6d3kOVWk14Z1vuqkOGWM=;
        b=Zl5Y+Kc3YQOkwwlzGhctNoz931epZs3+/gm3bst60iV0zyrN218+IGubhOtKsGao0c
         1BnkLzNOvQx/H8CrPiSF2OlzcNB7LRFy+W/hlOM4jNBVn3AsVKsJVwMxqkK+R8ud8SAc
         iUqZLatJJdmOp34zrLgLDSg+ubdqoiOJ7DohBR7rpR90LDapwtGEBv44gWybPHdl4/Et
         HHaFM6/L3dT+TO9gAtqEnbcewJDN8o4pFBA5oD5OdAaA0+tiOIPI3rRGLvcE4RT9wotM
         RXwPUHAvYWrKFE/Xw2BitbXnMKqx4M0Lmo0QmFzE5ACRH632Jr5gl5EUscpGYCzK2i01
         jjzQ==
X-Forwarded-Encrypted: i=1; AL+hErELQeIdWGIITUUKVSZLVg/FiE3Ors9rSj/lHVFmMX+gsrElJxBAbnw/utvBRP3W8UQnd7/YIrDXQ72GuzugX2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6NwhuGBPM5MCe6lhs8B+nOjzbwPdqS34Qb56VyKBd8FtAxfYI
	l54me14aT8CfGvOou6ZAbz1LYOjc+dumxGxy711Xi82TVNgytX0ox70dbM6PHj6PyN1y
X-Gm-Gg: AYBFou0s1YMK1sfR+es7kLMclWWnILUA11p0G8HZ9QgzknxCfbfP/rNtP2FVJAt/gfw
	PM/vWSnizkWRKUqUbdwfWHujSEHfR7ZD0HaF4QLwWL+fd8Mv209QjEJBrE4p65iCzZtLK6jSwXS
	EWPknwgG2uvf3Czj3YiVcMbUD6k/OBmi/zXBb8vgmwfi8P8AsG+F+l1oSs3FP8o9UdZbPb/Vq0t
	/MT+cZZyexbsVWA/9hKidVl/vVPgiEpODDGxUR4gh3KTuM0El+NNhfRniUC/67KaOHLdj2ZfCOW
	yDzRS7Hnj33tPcAJdRQSBL5GLiuOXxgcyCrfiG3g+M7SlC4ELkiKtEvcDATK1n4wlQaUTnkjRaM
	BkecUTIHW1w/d07/koAH7QWQGqyeJh2uqulJadSpmR2p3oMdvXye75DNmj70AD/5Ow7Ci06RvVv
	GnrXlCZqJ7v5ddR6BzVOiJvGPPY+VyRay6ZHMdFXrcOOhfr5mUG87rZBZUS+5u7/chFIbM0m9d4
	WiYCLuY6AUuoIRuoQaTki05lUFAeeAXq/c/rUKMrBW8iLsB7CkTiJW9ryk5CLyoXJZUGIevFSm5
	/qd0LWF+WX5rgPPXkTzffyh0gmEOVZ7dO+tBrlhD047bRVWUbuZQWumdhxrrc2kL6IQD5q0Jj1v
	2HqsDoYVT
X-Received: by 2002:a17:907:608f:b0:c43:eae5:ee80 with SMTP id a640c23a62f3a-c5096398b03mr148720566b.17.1794564321873;
        Fri, 13 Nov 2026 02:05:21 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7b2c9sm75811766b.73.2026.11.13.02.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:05:21 -0800 (PST)
Message-ID: <08fa1be263cf4a3db6b3e5ec2847107fba7acfba.camel@amutable.com>
Subject: Re: [PATCH RFC 13/41] devpts: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:05:19 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-13-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-13-4c998976c6c7@kernel.org>
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
> Initialize devpts as a pseudo filesystem. This raises SB_I_PSEUDO and
> SB_I_NOEXEC. devpts never holds executables. devpts_fill_super()
> keeps
> clearing SB_I_NODEV for the pty device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/devpts/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/devpts/inode.c b/fs/devpts/inode.c
> index bd1e8eb26edb..47ef12241d92 100644
> --- a/fs/devpts/inode.c
> +++ b/fs/devpts/inode.c
> @@ -13,6 +13,7 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/namei.h>
> @@ -438,6 +439,7 @@ static int devpts_init_fs_context(struct
> fs_context *fc)
> =C2=A0		fsi->mount_opts.reserve =3D true;
> =C2=A0
> =C2=A0	fc->s_fs_info =3D fsi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &devpts_context_ops;
> =C2=A0	return 0;
> =C2=A0}
