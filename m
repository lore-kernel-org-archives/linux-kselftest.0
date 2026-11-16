Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794850649;
	b=J0vj97/t8cOcuvGdtD/j4b0Bh8GUmB9f1FRW+I6oZZKG+RTU3DH+vwS7oU5Mg43BzG0r
	 uBuJZl7SW8hyIzO+1XG5BkoVBmafdPP6RZsjh37Z9wSCHSONCo7HjW+4WmMtxIp/X8nUp
	 dOVtSlGGpExO4qvCZMEGP5xiUF9d1Pmko3vzNjq7ukFKUfRsvOZIN4nDRAuqvh5Kg/5a9
	 gPVac/HD6EZakStMD9DLppurF+yMKaARAOA3SkspJpqvaMPkZSM5Xz5A/t4fYsdPtZnkQ
	 7i+p1Rb6qn5sE81m68vYi12AF4+lgHmo/rZjEMs2v5nPt0XN3Mosz1B3Vjghay3Ld+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
	b=nnRrjkELirlKSat0iMjwfHLlZcSObOTRDteCg+64RJIEoS336lws/Un39vEjBZ5kvXmn
	 JEfHWpHxBQ+LBM0RKmlY2UcpRPd7IVHgQ6WuZAII96vX12a5d9Tncmy+uSp21+gsRrtXd
	 43hp/ORuwkWur367ZMXaHQoNEI0wGFDfP4qiDAY6FiXLePdxiv3lFFFH+7eC88hFe4BbC
	 B6Pch5NF7AGQsdh2kCAT64HdgcrNDiLwynjFX30GLs4olB5pYao7YZ0QhF/PPimFgQda9
	 4dzwpRPkD1BULe2hWXHeJcTPiyIwkzQPzI5jkyqwH69JQTqHZi5C5P4hkCW++Ijm+ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wda5m4T+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A1D606A893
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 17:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53A1D606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wda5m4T+
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b81214ab40so218681a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 09:37:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794850648; cv=none;
        d=google.com; s=arc-20260327;
        b=GNYQwkgvuRTWnjpBFoKiiZlx1Tn5D0qTRuhr+vhpent4m90CtOW84RcJ/vg2X3msFw
         gpQl/F8hPEVgUznxOjvANci/f681iN5mw8XuGLZbVdDovhGmmU6SMpC0W+SAMNLp1eIN
         cx9NMmDkiQ4kqbYk+6ENj1R7BuKovC6xG8SAYO4JxH4E54J8VSBUiHwEwrbXnywbI5Cc
         CDR6EhSC/2fJ10H2bvvNI4qtzgKGLCQuapRj2fgMaPP4xD2qz9MdPQCrUEyXkC+g5Qlh
         figZLWckA/88WaXKmOxg5+g0qBGSh/tlvPqjjDOPyn47NQuoVsFR0CMsbyFeiZLVaUUH
         sEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        fh=DolhQ3D+FSQGFnqHvRpACUO3EAO2SViwY79NSQgYGgg=;
        b=ZHo8a6kY86ACqbEYfPOQd3i373SL1FzLlMx/TPkjGNhfjUbXJio/MsLREFLaCLjgc+
         e39NHAY5/y+47lCGBv4o5I5MnQLXMHOT1ze85PbmOEs4+imolqbOpp7t2m590u5dMjUM
         bQ8YSjmUETwBKCC555yX2ko3py9mrzMI5dTbN4+H1eGilwvDzfk19uso2t0QR5maYrkU
         IjKvkvxfH76M6PKCypsVAMYBtF9JSsq1pOH8kx8+7gZVH3+3pBNEu5/hjMPydGW24wCl
         hQSPe1DCFGQLsVirbV+VxVnFg/F4140GlF5Xh2M5xUARb3MeXsaFe2WLqzpmPTSR9R6C
         UVhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850648; x=1795455448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        b=Wda5m4T+Og74YNLartpajMnAcctT7hnb5haqi9hjLlBRa67TYcEPjf80gw45qsgIx7
         FMobW/aC2ZXQsUmoaLilVLeaESS9ODytholTX6ZkGdI39Z50BqAMQuVm0upEGdU/eTIl
         KzXBiwaEJY7eqa6p49n+ZePGE0YUDeVtz78JPQJb7w7ae3zRsyAfYOAEtJq8eS6befDe
         ANfoXo4rOnrr9cTK5CEQbvEa19yD1CMimOfBL7pxwr0U+pGpN6RB970vgsC2xV+kB6BG
         DqloDFELm5xz1LM2zdKvbUwHIwogDmvmrNVDo81Was00uh+K9TR8cjrFQWZvFUjBWrt9
         3Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850648; x=1795455448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        b=rBUDfg5wsOpqDxEYP9tFZ2va65Z7KOzqX9A2X5Rfdfu5EhKPJVvmcDoVSTt0SIp/d9
         nXQXQhp2Cmq6A9075Khab5N+6x2KSGpqNPHW9zNOLBwAU9ShRkJa7/upc9gjwp2+mpoi
         4+nREAkJLh0zVKVcxC/713W9eMQPkJ4ntrkPSKGLCaUZ3nvwasMPpgVSeNXoL0PReNdi
         Ee23PcsyULybGvQh5IkM18Wrvcn+pFyoMjv3WWPjVl3HRgLXjT2vTrsB7JeJNWeYKNea
         nbhtNo9V09pB2akHa9IrOL1iDiaEgVdW7PaIFuCaSlkHVbTm49ZsVdkNT+p8i1hEV+5D
         9ojg==
X-Forwarded-Encrypted: i=1; AL+hErE3JQ6IWyRZq5XcEwdUgSt4ADnHpJiU83aMOrVDLf5zzi9C0C1Hzrsf6hi30qKyLH1LHqM0fWwc2fmLYnf4mVg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K8jYCqKOBoYXs2vhIwFKqUPOmlYf2ZX4iBBrBxYCKbOC0DdFV
	MrRG0ssbGSCljc6gSfJgc8aeFDWJLPPKUQuMGZWQRp31I4eRNKv0j9FQOVYQKezAX0pbQhKG9Fe
	pMzHcjPP27qJgDc0h2ecGl2ZMtC4csl0=
X-Gm-Gg: AYBFou0t3mjfawAUUchTwLvNuM4S//MjEfonWqxiY5P+i4jdeTPNaBX18VRie/JQQ7O
	k1TavZq7jnmDY28/YbyxOMOizkOW1nJEdux4pn2Zo78IAoms/IQapRT/oENB2IO/P/CjigQKW3T
	BEk/OeUKaWjRzi+ytA8hieawjGvP/N1xnTqqCigiAhWRxwrePYeGdYlN2QjciRbwjLo4PYaJMLk
	x2FfiJmR4D3IykflpHOwyiOefg0a6BDdWqdGAGNp6JTtzpBhYYz4ojHc43/GHenP1F4ndUfwkzF
	y7b/kHRUvRfGplVByHaYORSEQvWidjpt+QcuheKzHey5ZRmwe8Lbg/BoGYVly6HV8k0tmgGjRS9
	4HIJv4BP9cTATkmYxH8aujCheoLFROBdfMtUEd1JAgAUha/D2qZTwADVeJlX3GIYsCjlI/Q==
X-Received: by 2002:a05:6402:1598:b0:6b5:7250:d621 with SMTP id
 4fb4d7f45d1cf-6b859ae1a00mr134291a12.15.1794850647426; Mon, 16 Nov 2026
 09:37:27 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-33-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-33-8cbbea1cf34f@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 16 Nov 2026 18:37:16 +0100
X-Gm-Features: AclHuK_sKnxFPAK3k65pZhjyZC94SJD4eZ9z2j_P12s3kyb9TMw6hurQcjyq55Q
Message-ID: <CAOQ4uxgPerkkG4ie0SyHVXaBD9VZN2wYfQpEAEi4hytn=ara3A@mail.gmail.com>
Subject: Re: [PATCH RFC v3 33/44] ovl: refuse data-only layers on pseudo filesystems
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
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:10=E2=80=AFPM Christian Brauner <brauner@kernel.=
org> wrote:
>
> The data of a metacopy file can live in a data-only layer. overlayfs
> doesn't look that data up when it looks up the file. It only remembers
> the absolute redirect and looks up the data lazily the first time
> someone needs it. So until then nothing can tell which filesystem holds
> the data of such a file.
>
> But a data-only layer has no business being a pseudo filesystem in the
> first place. All it does is hold the data of metacopy files and the
> regular files of a pseudo filesystem are kernel interfaces, not storage.
> So let's refuse data-only layers on superblocks with SB_I_PSEUDO at
> mount time.
>
> Data-only layers can be added via the "::" separator in "lowerdir=3D" and
> via "datadir+" by path or by file descriptor. All of them end up at the
> end of ctx->lower. So a single check in ovl_get_lowerstack() covers all
> of them.
>
> Note that regular lower layers on pseudo filesystems are left alone.
> Stacking overlayfs on top of sysfs keeps working.
>
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Link: https://lore.kernel.org/all/CAOQ4uxhGxpBtMZ5kfuzR1tQAewiecoX7UjXQRo=
91QjJHH9T_Yw@mail.gmail.com
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  fs/overlayfs/super.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index 39d4d57dec230..719c2569dfeaf 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -1237,6 +1237,14 @@ static struct ovl_entry *ovl_get_lowerstack(struct=
 super_block *sb,
>         for (i =3D 0; i < ctx->nr; i++) {
>                 l =3D &ctx->lower[i];
>
> +               /* Pseudo filesystems don't hold data for metacopy files.=
 */
> +               if (i >=3D ctx->nr - ctx->nr_data &&
> +                   (l->path.dentry->d_sb->s_iflags & SB_I_PSEUDO)) {
> +                       pr_err("filesystem on %s not supported as data-on=
ly layer\n",
> +                              l->name);
> +                       return ERR_PTR(-EINVAL);
> +               }
> +

How about we make this just a tad more restrictive:

                /* Pseudo filesystems don't belong in composefs setup */
                if (ctx->nr_data &&
                    (l->path.dentry->d_sb->s_iflags & SB_I_PSEUDO)) {
                        pr_err("filesystem on %s not supported along
with data-only layers\n",
                               l->name);
                        return ERR_PTR(-EINVAL);
                }

I could send this as followup patch, but since this version is simpler
there is no real reason to have the intermediate "only ban datadir" step.

Only the commit message needs a little more flexing to justify this.

Thanks,
Amir.
