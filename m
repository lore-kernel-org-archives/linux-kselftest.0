Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904006;
	b=kfcVIHqRzEu3/KUwKqzsueDPeUuLAzeD7lwAuQ1dQ6bpV1V9utKYpbjWoHu40BbVutiP
	 vq5Di7JDJe69xh9qFnaHltdHHxtDRvLn3656kWzIjJd9rmTmUpSCBCe+hZxrwB7O9ie+F
	 BFV95H+/mBb47c5BSoQDA4juTi2PiobRf91V8Gu9WbfyolNykm4wsgDASAFL9K6CR7zc9
	 gGcItmK6J7G6Qh6E4F6RYs3uzbLTtdU+JX0CpLCFx5GJtHtSnM/3CExaFjHs3Kn5WZK8p
	 TE8NO1qOqrMVJH3czeSkxT/ydVj6uFjTYu/OQqmsrrfGC+jX1D4h1ayqbMwgiZFD8hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=zuUcsMvbqw5dxN0Fzu67367bPJAUtTqv88LLlRQCTVU=;
	b=mr7VKMYyZZzV6/+cVF11wziNGbrSlh7EmC7g39ZeY5+jLsH+jWv2pkUTgiqhPvBKm04o
	 3EEgmTXTOKC3d9eEAl0mNtB8df5Jb7kxsdR4gi+IMsulq/Nq1hC2A6JflL48cpIwdFM7L
	 zbd3ioYbWSZ4dsC64UeQLr8ue3qT9dwExrGc+7cDTAwegloGdsr77hnqyhzprHweqFkf7
	 L2uwuXCG/+Qclc/K9DmHg8qzLpiezTXA4z9MlY96oyPOH7AsoxV43alFthqFeEguSn4RI
	 9/cGg+GOqZzAKFG8awqCyKAaAMsrYI2qi0aVC5MItYrtoxxmiEpvb+FSHAovNyBtInQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Bh3COd7Z;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB07606A32F
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 08:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FB07606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Bh3COd7Z
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1759274f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 00:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904004; x=1795508804; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zuUcsMvbqw5dxN0Fzu67367bPJAUtTqv88LLlRQCTVU=;
        b=Bh3COd7ZzI6TmZdb32Fg462zWvuh7WQNnrUpXucHXcpV5t+t8gMfKKxOWwhkcHBcNt
         zIJKpUT9Ten8K9xmb0ZHj3p/ljeyNVefWtOpjWCo7Igmb/P1wzmYs63YOxLg7f+WXmDC
         wf3ao9cg3f1DrvZE/oBKoQiWFPBKSPnWk+jCT2CGoQgxeoDuJREjXd8oRMM0GizRyDLq
         q7c8W4Fdq61I08pJrjWNPm+S1jXNjmZ2MpEutx4SYZ/JoE6iRzvUZ/uRuGO7TyWDBzw1
         OlncqX8aSwrA8zDhY0Cn+N6eWM3qFfFk2ULf9A0Yk8lhKFDJjJXQbcxKbI+h6RZ2p0E1
         0Fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904004; x=1795508804;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zuUcsMvbqw5dxN0Fzu67367bPJAUtTqv88LLlRQCTVU=;
        b=263FqOAZ0u5p+PEaICmoSnyRctwot2pqTNlYqlsQ/SnUUXbH3Fg5JrECRXwY19TMR0
         wukIjvM2/o6/tWRF4ZR7X3hpYBZvzlDLILnQtAGqbnO7DpLW5rBsCYOJJvRGTzGUharc
         klNMoRESJoV6DprREgJkT4QedM4CMnYfh/x9/Sdxc6ylGvqIUXdiVH7qsoyu2BY/QWQI
         DVMr+rTGYsDQAAx/Sz+GSN5eKA2U8qpfXQ7AxbT957Nn1M5NFJPayHpL9ovUWe9mYttU
         qgLy+UhU8VfWp6T10zHDVU+hVdrfoUo8zriq69YodcgtLHeUFTmKxnkJdab7VhpNtoGi
         VvzQ==
X-Forwarded-Encrypted: i=1; AL+hErGlFS7YgRybYHjHfT+htG/8PZUFQFMvI/3/kb5H4y4k9EgcLXgaIxrXXvYP4ERcSZtnvmzcRPeshAjfZ6tukjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sfBZqiflJBisdg+qwnAcM86jXYscHN8CLZCa8LBzjayZ0FfsT
	mcYrhWsESqBk4euzZxWr/lggWwBh1E9SvFsYE6tmXPgoitI6opIfO1eWI/BzLIfcTMY+
X-Gm-Gg: AZFdTZdwtRjaGQXlgj4acoDEptjeh+N5c4OZ+VCGMWppKmsJIRHIXiDxTWf7XLQlahC
	4PXYOjJfPJBzzHtOzzJmoeQlw40kUtyTx26AYVZCCGRFWDHLoonBA9hb11Jd/xDY6rJput4ybJa
	YKbxxqMETGDGAAhibTOnyzYV81SrhprY8cJMrB4Y41kXc02bNeDMU32M59Xu4JkcYX+0Opf40XI
	vEAiyDq3MDAdkn+N1Y5gQlkAn4kzolErHO2G7wxNeKLkO44GqLqOo5WLviTuKUzslRt3oX4J/EE
	DH959FhMclDhl3qYLX/657LVlg45Z1CgNntfV5Gr6YnYWejy+QkOMOTz196D69b1rE0re8502o3
	Gvgz8NnCGV/1FPZ1ZMN45XOdZ9aSxe8Z2t++o+Om4/665wqeuxQ0NnpWReGjkiyuJwfvKeDTZoe
	PrgWrgUlnLYL+S2ILFsM736G1IGsREgRe5XRXdVOJuvU9Fdi6W1Ag2G4cQ09aC84WCPS4AKkvXK
	DmBlE6jrQioQA1Vx8JHge8Iy4KdWoTr/SHWrCGuijaztWl2NG1nWXutsbuRJ8o0VtM6Ag2z6DJD
	rQmpV0xM+c7+/5DMgwGmzl7IJoNunpb3KYbSA9/M8dVaZQkNSQJb5K5DCKTa6a+oTaW1XIn6TiH
	pbPxUh7T1AcbCldHKeR7VT0s+00T+3THdeyDdddbfoeM+IOjNOExgUilb
X-Received: by 2002:a05:6000:2009:b0:4a5:2e5b:51c2 with SMTP id ffacd0b85a97d-4a52e6a947bmr243585f8f.29.1794904004601;
        Tue, 17 Nov 2026 00:26:44 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4de4cb1c3sm977858f8f.8.2026.11.17.00.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:26:44 -0800 (PST)
Message-ID: <c43d70badf41f62f8e149ac024bab3df979fa756.camel@amutable.com>
Subject: Re: [PATCH RFC v3 11/44] failfs: use fc_init_pseudo()
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
 linux-kselftest@vger.kernel.org, Chris Down	 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:26:42 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-11-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-11-8cbbea1cf34f@kernel.org>
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

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> Initialize failfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/failfs.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/failfs.c b/fs/failfs.c
> index 437cdc981c2de..f03334f361c0e 100644
> --- a/fs/failfs.c
> +++ b/fs/failfs.c
> @@ -3,6 +3,7 @@
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs/super_types.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_struct.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/mount.h>
> @@ -132,7 +133,7 @@ static int failfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	fc->ops		=3D &failfs_context_ops;
> =C2=A0	fc->global	=3D true;
> =C2=A0	fc->sb_flags	|=3D SB_NOUSER;
> -	fc->s_iflags	|=3D SB_I_NOEXEC | SB_I_NODEV;
> +	fc_init_pseudo(fc);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
