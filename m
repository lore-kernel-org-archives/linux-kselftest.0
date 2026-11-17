Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904347;
	b=36Yw8XBNOMJSJX95+oMDqPa0b1Cu4TR39Kbr3IM7iDiaT1csmrGg2FRGDLht0r5cgDOh
	 McHKANBXoQEwj5qY4hxMR+vBzrLAgnAC6G1zxdSkJw7BZo6N+QqOJB/eTrC9STzFVG1Ex
	 LrwlxuBLkhvrNzA6EPE4a00UQVefz611giXEKaTNb2zszTdRP94eYt5pK5dMQ23ajcHm0
	 Pkm6vz8lWkshMzlZFWDaKc/jtkhOsBPCnjxOKi6Pf5Mr8ZwLr8mfrTDtgeKOUOsfMIXsi
	 OCHcgzO4KMd+YRAfiwhfI4gZ5F4ZtF94sSmjcnJe1ILujbeI3BjnAA6jYg3k+d9MrAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
	b=CpyxkBCUX3OXC0ls4NWdxywUV6i78dP0Tk29hfl3mmNYPpQAqQM6JkCHigily781Tu7a
	 hDbM9EaL8WuQDWxqGdfFdPhJfOWhxrxtKWs+MmpvFU/hZ/1rWIWSJ4PsMICrhMEZ+5fro
	 9fACzVdbz2oKylEEEqYtyi5yuvCTby6atHtnHSEh/FoSdKm2mB1NZqBLc9t5UV4w4W5z5
	 OcX/A4rRWTxVIXLZQYp82k53+1L6YXX17OeGHq/Z2oFhUjKdQr8P3TLZxqiccqa9hqIhu
	 aSJvXHMz+KyfeML/MwyXUccqqXHkvSQgQs++ZzWHeBr5RNzNclKNtszmDDj7ggvICmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EFPX8Vuf;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75F7606A89F
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 08:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D75F7606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EFPX8Vuf
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a358881793so377437f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 00:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904343; x=1795509143; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
        b=EFPX8Vuf7iz+NzEUQG+pPgjK/MbrESqv3n9ATmra3Zopp4tpstszPHFfE2sR6EI1XH
         /MuIqTxoWkMXSLrvcYnqUGQvNVGY6YndEf7Smwels/t/G0PiJAqa5YTB3/XSR2c5vF/4
         5S685rADCuM7kD+KTHsn5xD0Bbvj+kfNJN7h3Eeu6Tgpz77cxc6E5ixV5T0A3r/KAOuP
         +pclbSVYUTOzYQ2RRiRVVs4C5Z7y/NhXCRc6Of4Q0fL8jD/Em4FfidsaQN0h6TdkChBo
         DufH5bn8tmF4fp27j4WWCE7M7sjar8yCORXmuz1wFPQxfWworU2xHCWyEC/YN83R4E+t
         3i9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904343; x=1795509143;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
        b=uD6XiB5H1mksDbGd7QPWxB6reOWgE9FtNA/smgCKc8OQngmS0blj+0IK/aJiHPnIqy
         RD8rwSEXZc+GY/EZ7taIswvriVmQVSIG6bkG7qDJQ9JNdy1N8h8uUpjbwwUQyg+av04n
         oBTPDYdx6PSd6lGm5JRHboP6+qB4Ri5Ra7VD/3DwsExTc7W7G8Pkug1EbBHHmxzUt9Dt
         E65ghQ3RdJIZ3igmQ3bD3q6c6mHH+j0CqwXlq9RqiaNMeLe6YMcRf7cpjbYB2T4mx9tg
         CnzXdSvkAwscu9/jfMcaJjQUPps7aWh5k3OXOlJq8IVCaYxmwkPHuNmbSRrSEe3YgPsj
         JVHA==
X-Forwarded-Encrypted: i=1; AL+hErEnch+X9w1IxOHguhdMAKn8B0hdDaahuIcsqPgNeTIwref8nPTp7ycnaKXlz/u6UX5UQIYfCjJEsAM/fjuX/Ho=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nIlQRLCWcscwHwr0Y8OFxQJf9D32JdFF26SKnAYU0EdurwIkH
	QnJNbLtt7pfk9Jh/8bX/EQjr5ue1RhoZACwlBlbttrn8LbL0g9Gqdvl3d1CvZb0hIAhk
X-Gm-Gg: AZFdTZe74c5Mdpq6+K9CuZAbOWiIA3FMB7BiwNvkAkSBfZX1DkKNIfwmuAwlheIsf2R
	uo9amSXI80bFS/530ldeD+yACfup0qjKBvztkGAk48Y50+xUcPc+NFEyqec6ChlDt82iMZm0hO8
	wjb77DVKSKGqt6rFs6JRD38WQ8LmAVPcZZ10aWxG4yNP+cCWs69T8yBdkWARATqnJj1OLJuLE4R
	LSyCxfKD8nPqNdn4MhfsJ1swbTM/KouDAfEWX+jS9SOaEVZuf4El/3Rx042/LqiV0c9DUSlNs+f
	YZqa2JG9BI7Q3aRag/WpJqA0T2tepLovJwU7Sr2cDOGvdl9fcVH5AAFnmubEWAzFQ+K2mI7HfR4
	EDRy5co1RzRQp8GBqQ+al0IPNJrGUqrHpjj4MS8qc7AjZzgJfJmVP/qsX+BePI7uWy1jqzrqJMI
	qoDsRvXeCYPGEHfgIX2falQHg2Gi//lp6EDLrqIukUqCzSeUsV+SijrCc8joW2Zw5OCH5YwmcO4
	g1VzM+HTH9VG4oqaAuGq0Doa/Gp5ydKDpYrvuSk292huLSQHduw+DpdMWU7awvAiqkoE1qXV2H8
	4W86QQHIZ1EUYIHI8zt142ShhIuofGPDH5gSjXt/SvZBME2dBMMkAI/mACEqJAl/RKw88qidpNs
	Uv40t8GOGy2XSheCnEwQgQOj1zCpuaMuP5pB62813NpihxCMMxQXe+5g5
X-Received: by 2002:a05:6000:3108:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-49c7353c415mr27089117f8f.45.1794904343236;
        Tue, 17 Nov 2026 00:32:23 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm43646659f8f.44.2026.11.17.00.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:32:22 -0800 (PST)
Message-ID: <fd39200976086130cc82d59699a988fc3e0689cf.camel@amutable.com>
Subject: Re: [PATCH RFC v3 27/44] openpromfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:32:20 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-27-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-27-8cbbea1cf34f@kernel.org>
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
> Initialize openpromfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. openpromfs never holds executables
> or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/openpromfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/openpromfs/inode.c b/fs/openpromfs/inode.c
> index fb8d84bdedfb2..6cd02d456bac9 100644
> --- a/fs/openpromfs/inode.c
> +++ b/fs/openpromfs/inode.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <linux/string.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/seq_file.h>
> @@ -419,6 +420,7 @@ static const struct fs_context_operations
> openpromfs_context_ops =3D {
> =C2=A0
> =C2=A0static int openpromfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &openpromfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
