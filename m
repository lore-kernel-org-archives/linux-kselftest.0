Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8489A3C945B
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 20:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784580109; cv=pass; b=DYO/9ccj2FOarE4+Z8cvnX0JBKNiWX7bMLAkh9pU10wBF2JfiAtcFQevo4iDoVwvXEIxtjjAtRFMfaSUetTT/MppOzQhugDfU3BnczN3d7jYG4ma6ZMI0cPh5dZn34hEvrYvIu/coKx3sSl0etu7/YAFzNh0945JDLqrF+GbRGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784580109; c=relaxed/simple;
	bh=+FnGzrkieywgVg11x7JlrzQVOV+0MSbS/7UrH/f2buE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NddAmrL9ce64SR/QnFEnZdzueArtVyYXrDfDftULwyeMEIqbjdVKhNdokURH3YN/lZuaEQKwQaCPdKDj9oldP9suzSWyUADZtvUQUKQRVj1D/BJ/KQN/PYhTuxwfRhBALnMmXP+dFxlbeEIIWA7ZekS3M5f6R02NK81w4XzD1xQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=acU5kcyz; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="acU5kcyz"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38101f85591so3475377a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 13:41:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784580107; cv=none;
        d=google.com; s=arc-20260327;
        b=h5DVASSV+fmpR2hhVwBzgTXMFUsvulVn77XxcLxS8S2DOEa81xka3YH+yb1cpAnVQt
         dRcwkiHCf0HGbynXvq2+4PbxZ1EIhOiqZ90g3PtruNhkaAii1JRCh3t0YoTpOoXA2+Rg
         5Ihz385xFWRKo1Pb4fJ0Fm80bQ79ZfKOW5V/HZ1JutHkQFnNbE/Cz3Hu53ZZkM2jhVaI
         EIjAiZRUsJnOqg8bvI4eTfkGB9pbHVnbytGsmCJe3CxG94lfaiuoVPOXDICsh9cyzIqa
         ROsqMBSTicaiZePCTVnuN4utYwGfkj+/H8TRX55QG2SJ4B3hVhJ9R9is264d1XAycsOy
         /Gbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A9BFAH7wtR+2i0gcTzfUj/Ayf/0UVSPIiKXXXL362qU=;
        fh=rv0tiFloxCfkg+BQCQY6pz+zVN1BPDBOGd3SR9QAE44=;
        b=saA/5gjJxAl7/5so972UzEgialhGfBSCh1X/xh1Y4FKEXgNfSsA2SB2fcNsoSAnJ6w
         Vn0MD0EKhQ8Mu7k7HwSU4rzk00Gm5vIETAkVSvt2w6EDhkPQPDx4XpyP49l61sFgGM98
         8uk1n+omnrNOs/gez3e3GeAV2i/tMYRv960+/zgnmzdg2rL73QsJkr2pH2e+C4sx4NYQ
         QB5p4QUobju/jNHe+a6qRM9/KuPw2HWHUI4UJaRE9oY66/I1GLqaN+i8fZbr0Elatq4P
         E6DAbUKg8lVUSM2Ui0+wiCZDkioYFKSh1sI/rKVc3/ozcETAqAWSTXExw0hV7bBf78rk
         AHwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1784580107; x=1785184907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A9BFAH7wtR+2i0gcTzfUj/Ayf/0UVSPIiKXXXL362qU=;
        b=acU5kcyz461RfGj31K+aMa61941kdHnQBbJ6e+23LJp4LwniIds9WYheH6RX4YeoNR
         7M52t4Ca736IkAbT2nYVebEA/eSSOwjaJECJ35omKzxXNoN0ZOQnqhKGz6LCYloqdDGH
         fGAodT8jcRTm6eVGA3+33QYCO47NNbbUaOtT/NrH2dRm0GLTh12p0sDRP28QvWm/B7ui
         U7ItQAxCvfMVlZ2CKXqWBQ1guXfAn9gKhFhgkrLpkTCLOcAsuRsCsaYkrB2uRhOtiSU+
         NXyQdOQhNBCOCVmzMfHof6ypHtgwwI6D64fu46mfBjdqG8hg7AixokpvzVQvF3qzwXNY
         ebYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784580107; x=1785184907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A9BFAH7wtR+2i0gcTzfUj/Ayf/0UVSPIiKXXXL362qU=;
        b=TbkvkjALIid3pfFSDDywsmwBj17LoNmL01naB0kbFJc7SKhHGK1aTjaMzjxW53j4BS
         ag3YXR/7fYJiPzYhhCaH9y2Mle4+W/jGfituyWdoNzji/Y33D/DuvOLWaQDzaA/XYkOi
         m9rkOgldT2Zh9wb6akzqXlKqfKMz5zb7BNYWTwOtphFnGiX2DEGQ7LfR4D0PxHURClin
         bsE/4MueIAT44NYQSJGzlKxf3XYzDcLVJJPFoaws/cM0YPtqlBQLMN+Ng0bxuj+eWP9k
         8uKiMwSYa43Z67gpLT5X2ZvVJKStRezPa8wiHLD3tQlZRRxlsj3xgXHHeC8OuqRV/Syl
         HqXg==
X-Forwarded-Encrypted: i=1; AHgh+RpkMxU8+jpScN81vZAku9RARBeH9zNvRSm/fBbSZGpvU/nzb3oggCEHIWzKQAGBV8JscSvFFhPze6U2BEVNGq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIJ94qDxqXoNlMMOis/RI3YGoq/HMa2QmEXf8XRu8RLckYiunO
	PIIPawOPuwYnZSGtH7tK/zWHRczpxa95M5MaBy9i8M8LK557lR3EVkedz7OKrjyckA6vtVKx5hC
	riHzV58WEssOfQBxOz1Y5Xp02qJXTSogwId22S4Dq
X-Gm-Gg: AfdE7cnnxqiLkvaRXiERhiEQHATFm3QIhxDCpfIVQQQLpvC5iXUi/NxGdrrS9NMyUkq
	r8erOlxndb0Ov/3Cwd128H2I0dh7TVAZuaednJAX9RMKJ6YAjBuw2M5RwWEqJqVXaBiNNo+OfXa
	S7iyAFWsBzJnVXJjM5dbFlKtbJnThNvNHBEFSjBJa+icCYdsXcfh9no6bRBcErwdA6pNl1zBkUV
	2X3v67d/S2RwTkUu9Inyqq6G9fUfORIFWYESwNo2ptmTt6+5vINNN9Yiyrmhw==
X-Received: by 2002:a05:6a20:9183:b0:3c0:9acb:3fc with SMTP id
 adf61e73a8af0-3c3ad121d58mr15942725637.33.1784580106787; Mon, 20 Jul 2026
 13:41:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708000956.46138-2-dwindsor@gmail.com> <cb9f84292a7f1d41ff8388d8c0c8c3d0@paul-moore.com>
 <CAEXv5_i_iHmF8n6Qf1NiVOhm2cCnVLgmwXK-b8M+hvmdO3aQdA@mail.gmail.com>
In-Reply-To: <CAEXv5_i_iHmF8n6Qf1NiVOhm2cCnVLgmwXK-b8M+hvmdO3aQdA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 20 Jul 2026 16:41:35 -0400
X-Gm-Features: AUfX_mxGGJZotoA_L59yykgtbAa9gAB3rgxUm27TjBp9LjxVqLCLOtt3LkUBu9U
Message-ID: <CAHC9VhQFGQmJ829kAZ7U48kQOyPT-+zixb61VuK3Zn-myV6+vA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] security: rework inode_init_security xattr handling
To: David Windsor <dwindsor@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Matt Bobrowski <mattbobrowski@google.com>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-integrity@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 2:06=E2=80=AFPM David Windsor <dwindsor@gmail.com> =
wrote:
> On Thu, Jul 16, 2026 at 5:55=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> >

...

> > > +int security_lsmxattr_add(struct lsm_xattrs *xattrs, u64 lsm_id,
> > > +                       const char *name, const void *value,
> > > +                       size_t value_len)
> > > +{
> > > +     struct xattr *xattr;
> > > +     void *xattr_value;
> > > +     size_t name_len;
> > > +
> > > +     if (!xattrs || !xattrs->xattrs || !name || !value)
> > > +             return -EINVAL;
> >
> > Sashiko raised a good point about xattrs->xattrs being NULL not
> > necessarily being a good reason for -EINVAL.  If xattrs is NULL, yes,
> > something has gone wrong and -EINVAL seems reasonable, but the
> > xattr->xattrs NULL case does seem like it should simply return early
> > with a value of 0 (see SELinux's handling of this case as an example).
>
> The problem is, SELinux has already set the sid by before calling
> lsm_get_xattr_slot, so we do indeed get an in-core label for the inode
> before returning early here. Returning early here from BPF would not
> mean the same thing: there is no label anywhere, in memory or on disk.

It's important to remember that you are not always guaranteed to have
an lsm_xattrs buffer, for some filesystems that is going to be normal
and expected.  In these instances the 'xattrs->xattrs' value is going
to be NULL and each LSM that provides a security_inode_init_security()
LSM callback needs to handle that condition gracefully.

As you already know, the SELinux approach to this is to set the
in-memory inode label, but refrain from setting a presistent label
(these filesystems are typically either transient or don't have a
mechanism to allow for persistent label storage).  Each BPF program
will need to decide how they want to handle this in their
security_inode_init_security() callback, but in the
security_lsmxattr_add() code where the only purpose is to populate the
lsm_xattrs strcut with the persistent BPF label/xattr, there is
nothing that can be done, it should simply return early without error.

--=20
paul-moore.com
