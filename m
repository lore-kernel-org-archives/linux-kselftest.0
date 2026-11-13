Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564919;
	b=FZW6Pclvs5rOkh2GxwERJAvMF2Wji9OxG12Aj/x8COlrVX7ncrXE2GyT98yVucjhTpnD
	 3BxTN910+Pql/9rkqBHPuae+h6TsCMeerzGmpDVn8+q4R4PQSAhIiWV4Z1fGK5O1v6q0p
	 ZVU0VHZpXvZpCHpxAjLrA4AN/2oOa/XDHdynp5Re8Irzax4G7dUzMqqS58VYF+LNX+Ssh
	 LehCo+8aYGMDG7taOEpJ8hPMaQJHPg2EYjeHMEUF/rv+62EuNGUP/nSG66En+E0nATF6i
	 yPjAemVCv30xhJ58a57JodOGTDIa4EHgJfgNIeT/CTRUnxTEH7J5bSUcUvsxDYsS09w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=QtOsdPCKGJ1fBhMqXd/zLQfd50NEx4L7veNiE/G2OUE=;
	b=r7R7/Q/YavFnyQjNOs7mcTXnYA9kd2oVWIIBnltw+qCMVWAxYlKSuDETEm3Lt1imti8R
	 jlJJTpNnOTr7LsHB9aE1C20qHxURXKxWBj9n3rcD0tXdRYOBIqjcMOSPa/u0qzFxYwG2x
	 q2m6fCV6yEajxRyhpjEXEOOVj9bEsJSqS80pneAyAsxQdOo21JTWX1V8BIV3nSyKu11Oe
	 DoKuURBhYB6zV+UzfJS4Yfetz9kZNXKNph5MN0uCLpuqiE0kjvIB56MASc8M7l/zJ94u9
	 URN17ubX9ScopGCH4cyd3/08ke3oBUz+CxX1P+DMKTn6VSXdzLV6dT7HMW+icOlA0lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XokUN4uh;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D99606A886
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 10:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D99606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XokUN4uh
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so5469215e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 02:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564917; x=1795169717; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QtOsdPCKGJ1fBhMqXd/zLQfd50NEx4L7veNiE/G2OUE=;
        b=XokUN4uhZ5cnIDNPS9kLjfaPp8ZSmyDY7nHz3ffF9uftFGQzzc0NaUd0CPxl6tmm/G
         EB2bqVZrrrQULKzHfxmMlarOF7+NP4G1EuGLp1x7hwkFzcf5DKQIlYH5+zTWTg0qLXK8
         Q27+pu7matN83z4kFimCCYFY9EtcVBpSYh+f+WbPWczzC82gi2dU1+IxENiNgIvD4ssI
         1POQJndyP8zOY9I/drEtHc8Rir/wcokVwFCL8xkdsULqRcKqvw/m2pftg5e6OYSufYMA
         FPm06vn59Z5lYx4UA2FpKr0UjB0BBdejlJLIE+RKFWt9/d0/clXrD3SuYpmwDbHdW+74
         JQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564917; x=1795169717;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QtOsdPCKGJ1fBhMqXd/zLQfd50NEx4L7veNiE/G2OUE=;
        b=FX18DoS9IgdDeoreSQwDdzo2KqmEsZt8NNtE+HwSI7OxxVaW0YNAKo6/2iBBoKesrd
         ulIzyOV657kxTloxgrZnT4exwlhxxf55RWkWLH4x2z2JUuUHpoL0PfPVu8mDd0qFq2qN
         0rJWQ6FKifWu8f9BozVQPlB1kubj0fmHOc2a+bP9yrngz4op1eHLGgagCld4OQ+TkDlY
         gvX4CUzNjWliJDQFZHNnOeUFvhCYTfPkucqJIaknPBfYpCxY5PtrJaV9ndOnEt0LywK/
         kgUl6yoCMktpewVKVv05WKpnm57aOIG7JU04wxXvoBYDyCvEkvuR3CPD0i7ZWixH2+Kl
         G+Gw==
X-Forwarded-Encrypted: i=1; AL+hErHzl03Njfuy66g5nCK1DloWBQLdhRUzCO/wsySL2C9fx2Q8MMvUD+MipszgTfbJSmNk6P6LYWsJe37W3VYHrlQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IY/H4c9mTlgpoKHmG9urUgJEZN+VhOr+z/pZ5JWA3GZLXgfUX
	l6c7m1ym4ZC6bzo7qRGJHwxCdemhhHx0ujjHw90BIC7nYZwWho4yw8GOz7GNtw2iMhM+
X-Gm-Gg: AYBFou0pdS6WPNiH3kJTfL1Bs1EYINRCQ7yNFnvFbIjEFfJ37vvora6Q/jXNWxPHxvp
	Y5SqG5gMuuz0gaLVEC/OEn6SLVNNAoMlzZO+LmCGdO1U7vDDogpu5AUIQBFZ4YAZK3M8zNsJ9zv
	u+TLkzy83+Wu6CVHZA7s/kdaab9AhqB6NnmlFsNv2GsRwtGjDoRD5STjunp8d/vCeZHf+di/vcJ
	+VvOJxTPRQxNOYOcjoq2PHEBpI8sh44MNQhBQsqynWSDxuRpXswzc537EYEZLBJv37MGXZWu4p/
	qoLmikdZMCjyoR+XfY02L303mDufTpZjoR432bT2oh21nPw2n7+LdqyuXU1I7jEvjW4rC+QtqVL
	b4itrQdjgMJj71o4NNXnN0FO+ozSDiz4Wr5lIRCSOXPiUaDhJowWXR8YuLgFix93F7vwLinelOi
	wWe9ar7KgVHifex+nTfUNP5h1UZD2t0cZPwpnYhFNnrs5NgHwOmz8uhy4oWey1g+3ZKEfHMnZGr
	rbGWu8gioxd1eWHMvFOs3CPyGwjgE03THIbQjdmDCyS0cPjffXtt4EOFoIZb3qAS+5jZOPjT2kN
	DNUnUAVB6RjHwBc8lbp/LAMfJSNujkJA2WRAQE8i1bUFIn9JS30ceVJBDBiV6HA=
X-Received: by 2002:a05:600c:4f84:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb5599ade1mr43492835e9.0.1794564916955;
        Fri, 13 Nov 2026 02:15:16 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56680ea9sm31982365e9.0.2026.11.13.02.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:15:16 -0800 (PST)
Message-ID: <e2edfa06d185acd86b46945622b6eb6dff97b307.camel@amutable.com>
Subject: Re: [PATCH RFC 33/41] fs: add file_is_pseudo()
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
Date: Fri, 13 Nov 2026 11:15:14 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-33-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-33-4c998976c6c7@kernel.org>
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
> Add a helper to check whether a file is a regular file on a pseudo
> filesystem. Only regular files count. Device nodes on pseudo
> filesystems
> such as devpts, binderfs or the block devices on bdevfs are what they
> are.
>=20
> Look at the inode that actually provides the data via d_real_inode().
> overlayfs accepts sysfs, cgroup2, debugfs, tracefs, configfs and
> securityfs as lower layers and reads of such an overlayfs file are
> served by the file on the pseudo filesystem. Checking the overlayfs
> inode would miss that.
>=20
> No functional changes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0include/linux/fs.h | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 99caef43ff3c..407ffb6342ec 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2553,6 +2553,18 @@ static inline const struct inode
> *file_user_inode(const struct file *f)
> =C2=A0	return file_inode(f);
> =C2=A0}
> =C2=A0
> +/*
> + * Regular files on pseudo filesystems are kernel interfaces and
> must not be
> + * used as storage. Look through stacking filesystems at the inode
> that
> + * provides the data.
> + */
> +static inline bool file_is_pseudo(const struct file *file)
> +{
> +	const struct inode *inode =3D d_real_inode(file-
> >f_path.dentry);
> +
> +	return S_ISREG(inode->i_mode) && (inode->i_sb->s_iflags &
> SB_I_PSEUDO);
> +}
> +
> =C2=A0static inline struct file *file_clone_open(struct file *file)
> =C2=A0{
> =C2=A0	return dentry_open(&file->f_path, file->f_flags, file-
> >f_cred);
