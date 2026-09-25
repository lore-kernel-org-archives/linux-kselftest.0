Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359C53E024B
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 17:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356053; cv=pass; b=L2kI0RKc8jOMq4TGcR8PbtRYkrhulGFuJlkMJjSFptx00jNVUsX1vQBe5+WuMaqDHBXB2myXkEIxbaIPW7Z7d9A8rjfl8tqkmYmzDSNJB1a+mjtdIjKrObbyrD8nMZHmhGkush4Qhj6jmUiGO/FcwLHoWyCZf+txtDZpaKoGFQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356053; c=relaxed/simple;
	bh=Z/QlDjEqmTsvd8hmVsRhjPJAPZKduCsAshcn9SEcHsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEayEA4KHzXigfPnJiuEXIDBXP3ZhCcYax5k47eGY1+vo/jheDOULtjzJUT7tclblv5w+Nb6GmPYgSmEwQNCwOfrPrvywqlbt3qWRz32xOVCYSgEgAioGzKK3XKfNnXL00VsFP0CwG9l8lfzSBU46+sHUbeMGTu8t4XNCqiH2FA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=JQ7vBslB; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="JQ7vBslB"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f05ffdso5082765ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 10:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790356042; cv=none;
        d=google.com; s=arc-20260327;
        b=Sm1PDf/wflg1sYinjmSjcj+dkEa3pDlYYkzAuLHOMNKQ7IBIJYGZ1T1u0I03kCtwRx
         c5WwQHHUW6L614YzAxz7G5TmsT2VO9dvCzKKcNqGpq1vvKxxs7131scp6xzJM/SoBRUW
         3/kQ2hpDXB0wlJfEu83Pw8lDJbAYls5qUw88bBSRFWtfsiYKTsm/BZvnZdmHc+uxaDqr
         TIDhafOvCQIWk9oR6W+xLEq6UknkLM62fSJDE8+IP6m9FtLw9qE7uwzzfDjsHKAo8EGW
         maASVFZaCPcW1EWRMO+aadgMHk7mOJdv+OTvaMlg2RT9+EjjEV0jRffxDnQ9dlnoTywp
         fA3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8YwzIASUiQRwU6GfvzkJObDJseuyBEMVP7g4XrNm/58=;
        fh=pneablCCUL38yuq67+j8rRixwg61Xt1b1pMgir9Y+9A=;
        b=rpD5wvGeVqbZTben2pr/pcAbCksOE/N+rk72+3DsFduoYKzILROSiSk+frXYJsQDK3
         DVhvC38FxG42lHHXomNK4XVKmgQJ4SUjFUIcd9kvmqCgqoMO+T5hE+Z+bFbvpxpbviGZ
         ncX1DN3vNoPUgPPgHFSFMS/G7ZswIIidV4rRUCCINrXW6JcRJz6bfX6FK2fHHN8L+eus
         quzFOK7FS5FC96tUKAzioP1CNLdf8KC0YowRtxKZsiI9kIsCmst9id4tevyiKntsVh6o
         eQwJlJvp453FG/Fqj6WOgQUAjbYIrJJ+tCB5XpCCy7RwGb3W4TwAiO9Cd788b2KTRKKE
         XgqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790356042; x=1790960842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8YwzIASUiQRwU6GfvzkJObDJseuyBEMVP7g4XrNm/58=;
        b=JQ7vBslBA75Oz3vhccuiegu2ZSCVFqSF0HyjC/3/vNzOkrP+yD6f4D4JjYMSYAoFrr
         wlg7Wmn6oEu7SXRotz0a67VZfHRO6XibZ9ZQ2iaB3D1nQj3Xnbu+DnvAmLPuwuabcTJk
         PXz37aU1zp89S9iK0/x3WEyWrQZ8hNLRiSYpSLIsFe52Q0ZtYHr08wUrk94pc3ENWlQd
         J+Tedgfpmw+/PX5h3yjumGEOqc+s3rcWYPx4Hn4luwZxasnr3NVcHxFxvCE/jfitgeBw
         +jOt/CmP2fD13Y486VYHbVYAPN3U4OMa+qtVuZhbWJD5jm5g1hu0o/Zq9FL93oXYU7V4
         vv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790356042; x=1790960842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8YwzIASUiQRwU6GfvzkJObDJseuyBEMVP7g4XrNm/58=;
        b=CB/lU4Tf9XHyp/ywlXnExFCNFe2igOlSGO+dJNtBvLLdhtxv2l8PMLmN0h6XS6KSRE
         JAc8mjzPTOdngUqewATuIy8N5Nn+edpQC89uq6bpKXWiLRvXPVmcEFNp7wzzbL4PwhgN
         aatwtRpC33A0i0PNghj//2XNN2fu3R/m4OfE3Ca1u+zboZy/a8VCpzILnziORApTIXcG
         rKbiVYOvrF1LO9Yxtrus6EmUmNvDL89M9xtUKDHOLh3M20XT0e4azfH0x453HYG+xiMh
         3LoxOPeTA1CjtxCh4i8YAivaH7/vrnM+ODMNxwE9SmxY29sS3yFvSoCp/cd2EH+AW/BX
         uhqw==
X-Forwarded-Encrypted: i=1; AKwUvBxfxSBdmmfiLtLvgFXMgNhVGwvIqyqMeejXDXWCW5cfNQI2BVq9lfJ/ibGp+fRjpjPAqlozusqGDUPrPsIS/UM=@vger.kernel.org
X-Gm-Message-State: AFuF++lokN+1jt9NO1rtHqSVRpIz9xFPRHUEq88Amr2SjoOKVePf+0tR
	9HcVxKo15LDxRNhaO6mDkV44IyWqcc6KE6EM5mZkRngA+wjtglw660L3Jwgu9mJabGc41EXAjp7
	xGldM9zwUTUPWjTY+lW+iWKhPdfewHZ4WdWEkELHl
X-Gm-Gg: AYBFou3eKRDiqlCm3ItFc6RkQXhpdc0o3lyii4NuKWmarRHTwATuN8+p2e9ZaruULiI
	y9XuT0DY/e4AN+eHc56ZRyExduMF4dakBCZ+gcTRAsAMv4a4a4QY0s6TNVWzKmbtATIdPUF1yzn
	E/LcUBbwwFg016a1zMNxnFfHKE7zoSjM2PYKKw8RCl64YWh9F8ylRfBUwkJlhnZWHuZ0s787NJz
	xoQ57zVJ3EJUBEvA2W3SXDE2vhW8WfjDQlDDlxeQ8jgyWVB5fYsJUj2p3OPGrbEo0dL/1QBJr/t
	TL61UorKmfj0OPCrnjvorjAB/n/2CRwOHb6Ga578l/a7gZJx8+OBKKbEv+dkZ+piPfWa6tdqVjh
	1bVYNu0xI7hAJcf3l6O5R1g==
X-Received: by 2002:a17:902:d48d:b0:2df:99e6:9448 with SMTP id
 d9443c01a7336-2df99e695bbmr12902675ad.61.1790356042370; Fri, 25 Sep 2026
 10:07:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924104831.1081137-1-caixinchen1@huawei.com> <20260925-zahnersatz-hielt-lerche-141893658522@brauner>
In-Reply-To: <20260925-zahnersatz-hielt-lerche-141893658522@brauner>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 25 Sep 2026 13:07:08 -0400
X-Gm-Features: AclHuK-PYyMWIn_xv6i13K6lF_3RP26uUOO_mtAnUMGHNcMrV5ydBitx8qn_ri0
Message-ID: <CAHC9VhSeXmOHvioZ12aVmnOtpP52-G=K_jS3K0fTSiCrDHStPw@mail.gmail.com>
Subject: Re: [PATCH RFC -next 00/12] landlock: Add READ_METADATA and
 WRITE_METADATA access rights
To: Christian Brauner <brauner@kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Cai Xinchen <caixinchen1@huawei.com>, gnoack@google.com, jmorris@namei.org, 
	serge@hallyn.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, dlemoal@kernel.org, hch@lst.de, axboe@kernel.dk, 
	viro@zeniv.linux.org.uk, jack@suse.cz, dhowells@redhat.com, code@tyhicks.com, 
	linkinjeon@kernel.org, sj1557.seo@samsung.com, yuezhang.mo@sony.com, 
	hirofumi@mail.parknet.co.jp, cel@kernel.org, jlayton@kernel.org, 
	neil@brown.name, okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com, 
	miklos@szeredi.hu, amir73il@gmail.com, senozhatsky@chromium.org, 
	chenxiaosong@chenxiaosong.com, zohar@linux.ibm.com, roberto.sassu@huawei.com, 
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, 
	stephen.smalley.work@gmail.com, omosnacek@gmail.com, casey@schaufler-ca.com, 
	nanx95726@gmail.com, djwong@kernel.org, daniel@iogearbox.net, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	netfs@lists.linux.dev, ecryptfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-nfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-integrity@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	xiujianfeng@huawei.com, lujialin4@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:33=E2=80=AFAM Christian Brauner <brauner@kernel.=
org> wrote:
> On Thu, Sep 24, 2026 at 06:48:19PM +0800, Cai Xinchen wrote:
> > This series adds two new Landlock filesystem access rights,
> > LANDLOCK_ACCESS_FS_READ_METADATA and LANDLOCK_ACCESS_FS_WRITE_METADATA,
> > which control access to file and directory metadata such as inode
> > attributes (mode, ownership, timestamps), extended attributes and POSIX
> > ACLs.  It picks up the work from the "landlock: add chmod and chown
> > support" series [1] and follows the coarse-grained grouping discussed i=
n
> > that thread [2]: instead of separate chmod/chown rights, metadata
> > operations are grouped into one read and one write right.
>
> This is mostly fine for me. @Michael, for the fs side of things I would
> give you a stable branch vfs-7.*.shared.landlock.path that you can pull
> once this is ready.

This is in my queue, but I haven't reviewed the changes yet.

@Christian, I'm guessing you will merge patches 1/12, 3/13, and 4/12
since those are the VFS changes?  Once you have a branch for that, and
we have all the necessary ACKs, I'll merge the LSM changes in 2/12,
5/12, 6/12, and 7/12 and then Micka=C3=ABl can merge the Landlock patches.

Are we all okay with that?

--
paul-moore.com
