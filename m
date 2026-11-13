Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564657;
	b=40hJBe6XUt/SCJcaHqqtGJZXfXGMqUoj1Ga8CdDEgMUa6NgII8RLoFtKq/RvpQ4w+tZx
	 F3qiZAo9YI6cLejCkvowbVs7vmA9wf08YuOGwu3XWPsU6d/uYfCyMsMMDX8cOWbf5+j5f
	 DqaCUYf+MW0AqKg+LqXL2FMB/Jd5/slIxIu2SP2bkBXVu18jFAFJhwMUa2HfvnvJVDcFk
	 w0eChf4GvCX8PfuGMWU1/NQKqrKwCaIoZaiRkxYMLL6c0XmBaDG6NoqFednmDk3qGo/fw
	 +//ZHBviqG3kTZLtVOhQPkHaEUHEDn+Ms2A0UrYTt7loh2rk4BJQ50hFcHXeMHdF4BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=RUn5HyOzv5zK74OCIfLVACQcizuS/sHn5qpIQd0Zvv8=;
	b=0z/EoMvfpVt6MI10BRFiEqEBaQbKDKlhjc65ltyPrDV6/cR3RfBNL203vnVx+88Tp4L1
	 JX3GGYLWGnChc6izfk0tPjqqb4CbqCJf1Q/Z/focIJBN5K5LqLB15JDGNFf+ImZ8u0S/j
	 ATo7AOhCf8GwxUbuSLxP3/BFeblcPevJ9ryF62bPa8V4s6cRhtxY7qhTF0g36UKZTfXAl
	 y8zAO61Y6yIYMvQwqir/qukQK+7D99PUjq4W7XZ4klFJfeErQo67fNdX/HXsdgf8sYoop
	 grUWruRdarLMxfHUGYPm0uieQ3ylwEvirPh6/1k+vwJI3tEGfWeu2f9v5fJNOGd71hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=afSYRRYW;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217E4606A883
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 10:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 217E4606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=afSYRRYW
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490f38e9688so497683f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 02:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564655; x=1795169455; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUn5HyOzv5zK74OCIfLVACQcizuS/sHn5qpIQd0Zvv8=;
        b=afSYRRYW0Lzg1RjNF5a8Z8fp4FTD8+wBAkqEEgX+uXVLN6iB/1Oe+S3s3pjBsHkfPy
         t+OYs+BeBV0n1jEyBb10NVx3dBSZolIBqoZV0sAqk1NmAyPkc8BtADcPrCcEDzdTW4+p
         zgkm0FzjpTOQt7I53MJB0zmRNwJ5JPK+9oiFhFL/qPiFq6x22bgZ8fSq9Se2ho9ikF+q
         rg0gx4TedCmdQu2h6zCkoXcFHWmQ+ZQsRVeKTv2sVCXhncyHGZ2k8DCVvoh7926dtvhd
         5w+l12l3Dd1UCqA4z70s6tomNhqNtGqcJuf3lRDB60cxVt/wNhZpOgzeegjchzcaCyfn
         tojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564655; x=1795169455;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUn5HyOzv5zK74OCIfLVACQcizuS/sHn5qpIQd0Zvv8=;
        b=FBV59rICcRimXKWr9wUDOZUCx980XeeuJ6gqkPved5j/kg3KCWp1YbnxhNlJ9dmv01
         yycuEKIp3vXE62PN8tG0EGomC+RTD4jI9u8Ra9WBX2nQcenBDL0PlV/JkeHk4UR2WBy7
         wHfnxBvov6PVY5EU1kvAgXepn+ivuvXRzHQhxc9z457jo7syWzXEZHO3Av5VVkFSYNSQ
         dZg9+3RR8RMyIv4KGN7MCYA0uLiTjItpC9/pSbNIT4A8dj+WN1HQIzocoXKeuEEKbc+/
         mkBc2c6eVMziQsM1iXbSHvwjjVB/HU4WZdc0AsMS72dkzM2RZe/0QFHdf3hBKF0z1wwH
         CXOQ==
X-Forwarded-Encrypted: i=1; AL+hErFcwA0taGeCVL0V0vD1MEiHKTI05psMehLSCK4fvjH28SCwkn90j5Dk4GlII3pgPeseikIjcmgJDxewZAL1hNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1d/cAjOyT5EpgLVTictqUzf2k+zdVaWMPZmtBF6hJxGyi1Xv8
	3LknYAGrMjSaew69AKLviO6P+VRnj5jt2TzuXqhKGyBKbHQotvCV4XW1bamSZXrLkNKX
X-Gm-Gg: AYBFou25GU04NWgz7BeSBvUsIACl7Gtwru17sFZ8cpm+rWhHaG7m0IvpchEowACbM1+
	IKc1u7p2Rmy/BfvPK1I8TGpkYqt664WVXOscOXdUJl+ATuBBTd6/pri9BG6Bd8w14nefdE+mk5U
	G51Z8DsXobxuw6IioLQ1Z+VofUz7svCERFCVUyw6V8+316Zql8UAtSicnU5UdM4wNFbu0PWrMmK
	eJrwlWRZ04q60ozWyF1QbHwROGI9GTyz1p0hrugzXf+vDJ/gNQVQ9bmgEBlOoCsV1jtTVpgyOme
	nVqPENZtNT+JRtFOCp2rrUPJNimm7KnxPnTA7af/GF9/5cXrNZ3fdv8mbgidv36pnb7ZgDkUxMy
	Yq8DzqnrnQx9NPVVdJisdhMcX0axaXOCtDCU/ceMjFdKRnewMCgdZC/AqYhMt2lg/7WHTP69ClC
	THWE76x1udmf7RSHaDGPRLa4LvbtFoYrJB7roBFhrPIfKyGaFNfjAOopbr0XLJl07R8DZYBdgar
	plAoUSJy8G1iDzAB+uuRJivyRwcHnBXa78/oraGULJAzm1jNFTGc/1AWX4xLp5r7JDDo1aC6hVU
	+3Y0+mnRkkSlNTXYddl8yhuRDsEENHpeETAaDZiCgHRsEPUQEDx3ZwPihWI57X4=
X-Received: by 2002:a05:6000:470e:b0:499:ffd4:f519 with SMTP id ffacd0b85a97d-49b02d4c2cfmr11662822f8f.23.1794564655454;
        Fri, 13 Nov 2026 02:10:55 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm4988050f8f.0.2026.11.13.02.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:10:55 -0800 (PST)
Message-ID: <0894c601b3f3c5b92008c6c399faaa539b658307.camel@amutable.com>
Subject: Re: [PATCH RFC 17/41] securityfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:10:52 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-17-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-17-4c998976c6c7@kernel.org>
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
> Initialize securityfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. securityfs never holds executables
> or
> device nodes.
>=20
> AppArmor puts a .null device node into securityfs but only ever opens
> it via dentry_open() which doesn't care about SB_I_NODEV.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0security/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/security/inode.c b/security/inode.c
> index 080402367674..93997a9f16fc 100644
> --- a/security/inode.c
> +++ b/security/inode.c
> @@ -14,6 +14,7 @@
> =C2=A0#include <linux/kobject.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/init.h>
> @@ -64,6 +65,7 @@ static const struct fs_context_operations
> securityfs_context_ops =3D {
> =C2=A0
> =C2=A0static int securityfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &securityfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
