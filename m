Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794859450;
	b=oFJrBEEcp1TJ6owO4J/uoF+ZHguwydW2Ql0p0qWY9m2S+ZR2F+bFrGRzjucBLCs4mViv
	 8kIVp05mGRMGTfr8FQA69idXJXELnnT76ZYDg0cNbLokrEh3KRPHGU079K++vnI+xbJpq
	 Ynq5GQYoUiOofeDU4DzZzVCSqCoNgArt8vfaVQxUez9vXSTM9ZxmMuzCZQSNpoAZ64O+9
	 6M/PzZxkFAedzXPRW44LGJFytlIp8ghDKq90yosYuat5IehQFwUYvy0IvwUlEUMY33I9Q
	 wfiBkmaFkrV14eMtO2pQCes+nlyhyhE124SxK2+2cHx4Qo2swzJgC10g5vNUkK5j2mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
	b=j6A+FKJLSVBYcNjf5qiRqZLkLkZzdwUDoWtwju9sZtVsnis+1HVPMRdoeKks4L5IViAa
	 uvc6qtpSCYmpGiYRQ0wxNA3GKU1o2TaHrBWX5lInBH9T+hcF7n2/tAuOsDcGb1s9kP/vP
	 nITKBz/YkeQd1bK4sdnvNntkDOyLtbvO0pbiu2AGdPGf3kIjGjYmV7Gs3bEtfsF7FmkFG
	 ZzluaaIdiJrkb4/ZRlQQ07KfETTRQqvuIzD94GfoWu3xwZZ6LmBMvUm63PUPFxLrqh1QS
	 UX/0WrZnsnZnv7Jl74iKVODOcBy0TjNW+tmSRRwyN0PzidFWPH9nCALsCwiyjMiuLcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hnqDx80H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E1A606A32F
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 20:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30E1A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hnqDx80H
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-498f5fa5103so1736447f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 12:04:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794859448; cv=none;
        d=google.com; s=arc-20260327;
        b=CUpSdmEBx5n+OYkJ78DyNVUlyyLXd9qJo4rDFxr7fSj5yL2IL+4TcEwVUZoMsd40j1
         ZnJQRunRz8C8wxwI00/nkGV6iUYO9EQdu7We/ypUhRW1sdexQWeVH0VqKy9pQzwPS1Ej
         BGlUyacL5i1WhjPcLI1McepqU5XDr1oRbTut2UZIsp0dEC/AbZ7z35sPqLksFANU/VBs
         hGwxAGw2RTIg1SP05KXIdXUczHB2BZ8qoFUSJrA3Adx5HYtPrTuLjxKSSQcvqf0D0QQh
         jNSVziRgd0e5icVw0k3QlnNUJ0abqP4cZNKPkkH+wmNZdF8VPSR7AmnMUDW6/NwI3YMh
         w50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        fh=4iIFOKBfa9085Wn7TR6QVeHZVd2q4g8d9wL91Qm1LEU=;
        b=fi4R2/Lu/QhpQzKa9WWP7KLChgGz73ZvzWLVsypS2BuSCfDOyp3d26C7IOX1tyqihM
         aWfT5ZJJkAeIsKbNoMpk0hDsG4A7lvRnB+cZkSrMDPv456H4GqSD+iHo3Stgxf2JRG5p
         2K3tUpLjhq5jpifOoJfGtu52J8JB4+L3M0tvitL9r6wBVGO43MiRkthuec2f7A5g2pJ0
         KeT79yEr47BxP9wuSACotcBYD8eMQUgQ2aElNCQ3RnedP2jLE8/qLduo/Z1+4OH/Lfkt
         zlTmIj2BWslPBKlmx8uso095uU1E8c1L0VTdFf/RP4Xp6fdwJUG8zwOtCDLBJFqqZG+I
         UWKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794859448; x=1795464248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        b=hnqDx80H1BHGMZ+jCw863LQE2wm4hG6wTw//ziQNWkZpZIjdyNNCtFJNcbykSvuJWZ
         RrqgQGru9l+9Rlw9NCoAO7RXSeH6CHzRwb+h6TsbT77V+vTLtC7o5AslWzWJ8+7yhciq
         sbJxN7Yoz6y6VYO91QUyEDVlXVHt5e/uzOZriYhKEljZIduQH6pNfhdOY5sHlJFueOxf
         bN/uTLfuNBjnHaTZ+WukZQS/Wa30tWyiKsfqEPmOKtkcPCgN1gGIeLsa9pfco/3ZvP3P
         koo3Bb9/+esUnHdHS2hTd5qtXE/k/xctadMJUuU/zchcL0VDKvTRNofZgdIQ6mLOou9W
         X5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859448; x=1795464248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        b=Uq22TKpoEYSxP24OTavDz4HsqVej0JLrBzo7gDI+42QuAcWfAlCCtIApIhWPb9+/dj
         Hi6VcFPH8EnPqmVdHXO/n4BDuEJezw/wQdgGI0pkjyQdfiz99XYEzQlHeI20+s7zsd1q
         soRTsZEeBTgumJjfbQXIJdd8ppFr2ApacdsFXLXClA4vIfgBRFlvr4ytf7tl1kcjbnsd
         GS3Tf0VLvx6O2BaItBfDgUVuG4PKdar6p1Jgn5CJNHSVQNFDQkrgvNZSaw3qEKh4fpww
         9gpP1y+rZT8/2IV9K1+PTvcflgIlLja6AFWQuhHLZucqYw5f3IUwYtolU7yXJkgF28qW
         1QZw==
X-Forwarded-Encrypted: i=1; AL+hErGsmoaR6YhAKNA2rptXeoGuplxbNLuMO36zrDz0qc27KuWDFht0N/k5/QrwsDtiPu911phOvHh49Ei/9OfhAjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LuCs96XoCLPvT4de8ug2/SXOxSbeXuSpB0M3eRjeQdcDjotG6
	J2Ar3iLxDHE3SpG6qMx+p00VJmmEl7MjoaZxAkYmJMkjrj81r8/OCRUG1v+KupROSdgyrBg20y0
	1scatkfUqMpdtX8p5K/cuYfB2xuvRXhg=
X-Gm-Gg: AZFdTZenFeqhO++NzbbrkyjaGU3rOIrojqCkFR4Zl8SRG1ZV229QMR25AblaJeE7qW8
	5aGWz6IyzqS4ArHyYEcdXpyDIbKcU3Sq3YZ4BALp4Fk6o0za+BUyHmAjR4hKJOqAOfxRd6zPnck
	GgPloNBcONEVEO4TQPaMwOxXvfdvWXQzitlf0YV6f3Sm5AJRpC8N5buivTasDbQufaCV6NaY+o4
	EFLceGaDVIxp1LKKskhcc4kkNPxhYWhHj5A/8r485w6484hGzmDMSV2eiN+iNvbNdCZ5fT+9dJm
	xD990w43WnRG3t5nwG6iRm0gZC7mdYUMbrxeJJ8UC7kLb7Tr5ZMznXk+rBupm63ieESzMzIbA25
	owJrink8+3PTgqw00tQrqZRAhdXQwNFCJWi5u39gOqE2H6WnUVoXYh4kmgCW+FAF5GNkDkZ2HjF
	xHi2BIl9lNYpuCHVyCTT8=
X-Received: by 2002:a05:6000:4692:b0:491:3fdd:af34 with SMTP id
 ffacd0b85a97d-49d61c80db3mr13343868f8f.36.1794859448335; Mon, 16 Nov 2026
 12:04:08 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-9-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-9-8cbbea1cf34f@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 16 Nov 2026 12:03:57 -0800
X-Gm-Features: Aa3M54q6P4M0RFDCKQ8HHGNCWJafItTSPdWR1qNwVGtToDAv2VOv8vDfWHzYR6A
Message-ID: <CAEf4BzbLFVawibuX0wk=8uzy0WZSYHbkgK55d7rqLab2qAM1Fg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 09/44] bpf: use fc_init_pseudo() for bpffs
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
	Alexander Mikhalitsyn <alex@amutable.com>, Chris Down <chris@chrisdown.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:21=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> Initialize bpffs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  kernel/bpf/inode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Acked-by: Andrii Nakryiko <andrii@kernel.org>

> diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
> index c6f328e4752e1..57cf3775c0766 100644
> --- a/kernel/bpf/inode.c
> +++ b/kernel/bpf/inode.c
> @@ -15,6 +15,7 @@
>  #include <linux/namei.h>
>  #include <linux/fs.h>
>  #include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
>  #include <linux/fs_parser.h>
>  #include <linux/kdev_t.h>
>  #include <linux/filter.h>
> @@ -1197,8 +1198,6 @@ static int bpf_fill_super(struct super_block *sb, s=
truct fs_context *fc)
>         sb->s_magic =3D BPF_FS_MAGIC;
>         sb->s_op =3D &bpf_super_ops;
>         sb->s_xattr =3D bpf_fs_xattr_handlers;
> -       sb->s_iflags |=3D SB_I_NOEXEC;
> -       sb->s_iflags |=3D SB_I_NODEV;
>         sb->s_time_gran =3D 1;
>
>         inode =3D bpf_get_inode(sb, NULL, S_IFDIR | 0777);
> @@ -1261,6 +1260,7 @@ static int bpf_init_fs_context(struct fs_context *f=
c)
>         opts->delegate_attachs =3D 0;
>
>         fc->s_fs_info =3D opts;
> +       fc_init_pseudo(fc);
>         fc->ops =3D &bpf_context_ops;
>         return 0;
>  }
>
> --
> 2.53.0
>
>
