Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564338;
	b=pd88FB5JmKFdxoYSvR2lQ8zPaKHJQGVaUkWBZOykSbOJ5C5lFmN1PFz2l+ZVDWuRdk2Z
	 N4MeBncnoPvjP2GsSulyUvcHKcJUAouFZYWI9ccJEtEEXqh976NF5CFdrEraQPXfcYg6n
	 NycITQYBpLxnlyMfoVR/28bEVQTV+z1zcW8E0YF4g+qynSjtBwieIWWn7m1NT93V5VO+Q
	 FLbA7nU5jVz2KCLhCd7Kvujd59JaZ41qIYQ7JYuWDzl7DJvS9xDbvZrnb+x+HjFuF4C5M
	 NM7uRAl85lH8MQ1Z6RVEXFoUmxKd9+epCsnApwYzIdoHGHXe4FfVlCe+CelYqE4J5vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=/ZNAGjGCHSUHK/hbpNrctHFuArQcFUaSPHFuYTd8W2k=;
	b=ygWnFYnIpdnddWJuOSKsHXuM+RYxr4MSmSb9TOSATy5UvgMEVCl1lnv3NvhGvmafp6ic
	 /3LwQrU8MWjDM7eCrKygmGIO6FRF36j+Rbu/tK+VQZ/ZCAaB5QcnItNOEu7ox/aNmeaCc
	 ucWyh1kRshN3s/RV4wtzK2FPdAn52XGHDlWnMAzGcg99ZbJ/sWU/zYUW521NLZG03F3Y3
	 RVQ1solIsZGzx0o6LjAJ5qklxaATjtfRVDuHy42bkrZ4U2ll2dt7q9faLMeFGZ0dLkDiL
	 u1fx0pGQyY+IZcMcYWAS73VkokAv4b5YZ26tAN63aVwfB/sAGbsisQExNNXt4ftN4Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="BcN8/JZ3";
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4F7606B139
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 10:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB4F7606B139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BcN8/JZ3
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4322d310e7so190392266b.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 02:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564336; x=1795169136; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/ZNAGjGCHSUHK/hbpNrctHFuArQcFUaSPHFuYTd8W2k=;
        b=BcN8/JZ3o8G8RngOszXG3JTNOcmRF7Y5HhcgHfEFuj8bd59D6/ZB+k5Qh/rpeFRCcR
         ddACGgLLZgU5b3f6uROOjMlLzNHxLpnDWTvmFTIG7dNNkaJHDW07G6TO1gom3Rvc3G6a
         phj31A4a6/nEoCYWD8i1KXLteYhy5qLcfDwMY03tf9yOOPsaa+sC0St/LDVgowIEHsk0
         tZO/CMI2RrlSiK2F32OSWBbCdipxonxIIN0DBtho56nDsRF+fFDKa92VHmnJVt2oHACg
         qH7hz+1dQBsoiVIgFoQGohYiLAIIKP/PCGAm0hHsixZQutOWB167lk9DbkeNw+vQ2Hrh
         L2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564336; x=1795169136;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZNAGjGCHSUHK/hbpNrctHFuArQcFUaSPHFuYTd8W2k=;
        b=hU6WBMn699+NnKgCr1Xe/P3jzXGVptalUiqFbbkb5DrbifJZ8YjwpiEXK0F69HQiNY
         sNloNVXfZ50KsDQF3AHg70rDXo1l0TRlL2wzMh2I5bF/WmB1ZEc2XDS0yOrVKyytE/Mz
         3atPau7WviNmvWc2u2ozvuQ3AKAQICIgC4BO+8ashLA7GDJBDAXmNcqYBwYXclZU2Irg
         xnbAZNltyJP/igM6cjKhpfd5DVRi24zb2r4BOG8Rd7prghX4fu0PF7V4891NYfp/yZCy
         R7KD057mv5pyare+SO3Ip4nPVk0uO9W7YITxDnjw8WbZVWYJU0bHkjrCyWcH73E8rI40
         g+kg==
X-Forwarded-Encrypted: i=1; AL+hErEdOr8i8P6Cm12BdRvdxeZFnwDVlXHyfYOTK+uqJHDnlvcSyuofEe7Au/B0ysxiMgwH5XlvSH9JHSaGLQ9txXE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eWnxSOV/S0g/g1CK5NiO/eeQYYTGHAgiqwFIkFqiqd7fKPeKo
	Xgy+xGyj0klkpwwaVdVYMA7/GpLNsI1kULeGx9M+K1i7jxxoahO3i1nDTqrc2/hOP2zL
X-Gm-Gg: AYBFou2W2O0zOqthEB3uXsot0QdFc109+f5+eJXyg2JpP3Jt4IqZbmam7cjEbLyXsb/
	BBl7z7A0s6oxmvzjU9oreGr1OygjOZ2N3GzHGYUYTmRH1A1Mlsuq8eKYl+J7lDioKBEgns7VpoD
	d8gXKoalgE84SfL2GYYWO+zKZ6Z2osSUBYDQZeEtwnJFddEcTKJ1nzWo2J+fBVKv70D5gj0OrYh
	HaTRHYdh2kS9H1vP1ZcSWQreUgNveZyO+in9LZIU0W8YROMAK+HUPgX49yvtZZHA4ZK7tdAPV1f
	GYX/f6buKh8tFDqDX5pj0L7tNiedm6m5rVnko4lAJkLpdjDAEf+1XjfL4FzY9Yhu68GaaxAOB8f
	2f1aBDJbaDlC7h22R1R5TFE3BK0UotiUExMBOPIf95wcauNG2zdVPKSRDPUiN3Ta6NcmfKLJ2DY
	ePzfcvpMQIBihL9z75nRxYQvM+/Qsu3e59Bxbjbq/7TzH0Ig/4gpFDPpgoU22yC32nYOY3UZp7V
	rROceS4qKAWPk+RzUCoCwLXK9Sa8K9MqBLFD83AQOTm0cx793Zp70MvJIYKYRRk83Ky8XaPNO12
	qL1TB54fFLiflCid3VP2ED2XColkj0ZgOp1g/Tc0KRL5oJxyGrb2BqN+6aVw1tI=
X-Received: by 2002:a17:907:94cb:b0:c2e:3a72:ffbd with SMTP id a640c23a62f3a-c5096389759mr162937766b.41.1794564336347;
        Fri, 13 Nov 2026 02:05:36 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5b93csm75365566b.5.2026.11.13.02.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:05:35 -0800 (PST)
Message-ID: <8f532a01f6cc2eb73582864343e25be4ec990919.camel@amutable.com>
Subject: Re: [PATCH RFC 14/41] debugfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:05:34 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-14-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-14-4c998976c6c7@kernel.org>
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
> Initialize debugfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. debugfs never holds executables or
> device nodes.
>=20
> SB_I_NOEXEC also refuses PROT_EXEC mappings. The debugfs files that
> can be mapped, kcov, relay channels and powernv's memtrace, map data.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/debugfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
> index b4915551ad31..f163f0bc5703 100644
> --- a/fs/debugfs/inode.c
> +++ b/fs/debugfs/inode.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/init.h>
> @@ -317,6 +318,7 @@ static int debugfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	fsi->mode =3D DEBUGFS_DEFAULT_MODE;
> =C2=A0
> =C2=A0	fc->s_fs_info =3D fsi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &debugfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
