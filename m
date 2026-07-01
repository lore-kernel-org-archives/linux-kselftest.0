Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57DB35F182
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 23:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948102; cv=pass; b=o/Gp3fC1C63ZZ+dqgUtEkAyKuBwNc8mIW1msApYjD/HNz8xXzXDH6sLgK8w8wttrAXg5fWPfg4hkjxG3th4ugSoWqJHPJQPoeg00GuVKXuat6BBuuqj0GV4++NAKOnocLij2ydgwV7YBwKUU8uXFRYWKkryUmZ/XjBdvdjfoFFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948102; c=relaxed/simple;
	bh=FtJm1XMA2u6fuGzBGX3Jb1FioFwf8hZ2gXCOXmPtfVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQrcSDb+oCZ/vt/vb9S7KG6UYGBkOTUDoNI+vyR+cq2R8gIF4zFJs/Lol4fql3z526ctWDlp2w3mNravL2/yGFlSm0KGlLAOG6lu1xf7IlQ6CK81KKqqGrIr5Nt3LN7zEayQc/hthwkey9v3gVgtXWPQcjN4M89058ss5C1epek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ZkcKu5l5; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ZkcKu5l5"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-847968ca62fso1072429b3a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 16:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782948100; cv=none;
        d=google.com; s=arc-20260327;
        b=LcA05hKsSkOjr5oY59qVdTkHKEiPAAmKiJTGUEYlw91SbHbPd/VJXZw+YHltukB9NN
         bIYYiR+Y1xD+832iaL2ugGzJbQdDAnDgwW45SyaNjYULTOQsAsyblIKwFaqQsJExiY7V
         T8OjzBVqA5mZq/+MZxyc98xrWHvJH3qZ38heVn8VhpbzCEU5HgZLcdBycqiq+RQw2CA8
         JBVdT3qEwl03KlvKKfnq7nhU0RNK5MVEigaNpWG1Ky1azv5LrJAVGR1ilbbOz4z/q5ZP
         U0rVRW+ovWB1Ub66z6LKqBHOzDgDBKTtRePgR2knTmzMA8qXemxxNF2+ODZLOJfZxZaU
         Ho8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OZhVbL00Yg5I6i6D230lOzIY4kpLQfWeLuTF6oDa7To=;
        fh=FRf3WvSISVTa0jc0XbwnsF8H5KzFL7wMRtTTA4CvT3k=;
        b=im6kBgrK4BkVLcqYpUPiPPNLUCVL8XP7VvDnS1UXfMx3bL4Y+OTMSqssHXOV7A93nR
         7TGpw9uRuVvCv6AbVBEohcC3ILWYNordh3/UiULVI4l7DAyJggshxTcTEf0LI1vt04cW
         RKo/hw3wUgul4AlZw7H5LDu/N4+xiv0HqNflxYVLB1dwShigwxu9GL45GZidsdgatKrm
         ybQKPjbY247ILgCiRXojViabfdNQ0ZvgotBVO2uvcGNydCYQj2T6LhzEjBc4NI2kBo7m
         LjV+Kk+gWKMzXSw9XV1W5FBa73Z7fN1VGwksAJ3adv+ph9LlXjGdx7xESlF4SYuW3Qrx
         4Tlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1782948100; x=1783552900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZhVbL00Yg5I6i6D230lOzIY4kpLQfWeLuTF6oDa7To=;
        b=ZkcKu5l54N20I+XXhjeX+Snq/ceTIYqHZrOU+F8zxdyybdWsf363sWsYa2/iCEwBUw
         5TkCQ8X2JlbeMTaKIxp6yJN6T2aqUx3bUXxsl9MlUqrkOFPKUYGtYbSgUwuP6FySolud
         b+YQnpEFriP83EOArtC4uRZsaj7FY0+ox/1NiBPmwzue3EfDkcbR3yl4WmH09XyG0ome
         C1bFhOFphJ5zkohvjbWWT61SV0BhTmGkNdV5ztmdUAGIc6ZylDS5L1D80USdAKMFzSgQ
         iCnwIX2O2SnifZTohViHr356Za0/WQPWreUCRcpOmXNL9Wn3mOlTAB0UUre7Jbw25EpM
         djXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782948100; x=1783552900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OZhVbL00Yg5I6i6D230lOzIY4kpLQfWeLuTF6oDa7To=;
        b=IC2cXc2Ucn9H0hfJIfF0OUjpk8OhGD69JTyB2+JCES6BmgLnD1e/lJOkkqrsN+RtON
         zWxEsuzvzTGHvDbr0UzaQdbIKQBT5w6rDvUjM0uqAm/XpiJwzLmFoKdmNQhDGyQ2Wia1
         pIkWO/IckRQV1qWejA3tlnWSJenYTOZZSvF0jK0NU9dwv9kcsgUslrFzoJ1neOAqf/2H
         unFyGHLU1SHc52SE/4b5UM83PLDg3J32H0xydo8MUzIce3kKu8McU1wqAjLQEhjQw3We
         Ol8kg2Ttgr1i1QM5Q8Llw3bNgL2NVVIvPM1OSYhBAsKUPYn200KqCqgteoZKfyNBle82
         z6zA==
X-Forwarded-Encrypted: i=1; AFNElJ+qtjUmDEUx44hetVlPQVeFyhlqi9z8qdVqV7lsPLC1nHJeiRVMvMm+IkUg4rnHgq1WcvXYRtA/ujZtTjDi5ow=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrD5gDpcIblP8tlCloR3IbaHaMtuK+VgVFhgbsPMTnz9LRLl/V
	ClzjMSxXF/ypkuDcX78D7S73UoCt9iGjuUJQ5A9g7g1Tajmw8jAdNs51lhBMMMduZJEFo95o0al
	ZQ34bNCa73JSqOcmvWHlpP1Yg/AwUz8EGkUt3Q2Wi
X-Gm-Gg: AfdE7cmJ37aiMVtZCWAR0nrPj5DLNgh462tuEiFr0brMvskfLeEeAxgsDCLSMJIc+BR
	FnP6qafvKvV/kOCNVT/CSlxu5OIT60DKa3VjyxOpk7mnrnl3mGweae4HWg1iiwyLSwOyIOCmsMe
	lIM/UyVJwFGIbdPQ/JDOUwkclDAkiQHucKEJJPS1HDEUyUPFxZO9uHk/8EnkFe9xFIwEUBcneXj
	PtcRBEss12Ev4N2tgj+/vAkcjpPmVI0jkBLkyrpoEVI/UKRsnJSEHRJIDuJrewBiIJaRgxV
X-Received: by 2002:a05:6300:6713:b0:3b2:8675:4866 with SMTP id
 adf61e73a8af0-3bfed471c52mr4022346637.31.1782948099973; Wed, 01 Jul 2026
 16:21:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630183956.281293-1-dwindsor@gmail.com> <20260630183956.281293-3-dwindsor@gmail.com>
 <CAHC9VhSYNF=_Tfe-D99rHy70EXQVr1ES0arxT09Bidey4zOFdg@mail.gmail.com>
 <DJN0EPROS056.3RY0R6W1XZHNZ@gmail.com> <CAHC9VhT37f5TwgksE_i0Yttpy3i7niBr6QrNVVmpwe_eGX428g@mail.gmail.com>
 <CAEXv5_ig4P=wMoiy4h-TbZt-Wz-YBAs5k6R4szSSxr4C0kjCTw@mail.gmail.com>
In-Reply-To: <CAEXv5_ig4P=wMoiy4h-TbZt-Wz-YBAs5k6R4szSSxr4C0kjCTw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 1 Jul 2026 19:21:27 -0400
X-Gm-Features: AVVi8Cckm_QE9ya8Cck0-aYUUFKQ3gs1NVwV2FqpNlxb6AaTiQhAvZrnWz_L4W4
Message-ID: <CAHC9VhTTjkHG7CQ1ptku3TONh=6bzcwVwqawAYggX3Z32kUy5Q@mail.gmail.com>
Subject: Re: [PATCH v4 bpf-next 2/3] bpf: add bpf_init_inode_xattr kfunc for
 atomic inode labeling
To: David Windsor <dwindsor@gmail.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
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

On Wed, Jul 1, 2026 at 6:58=E2=80=AFPM David Windsor <dwindsor@gmail.com> w=
rote:
> On Wed, Jul 1, 2026 at 8:55=E2=80=AFAM Paul Moore <paul@paul-moore.com> w=
rote:
> [...]
> >
> >   kfunc bpf_init_inode_xattr(...)
> >   {
> >     /* sanity check params */
> >     if (!xattrs ...)
> >       return -EINVAL;
> >
> >    /* get value/len from bpf dynptr */
> >
> >    /* hook will check for LSM specific xattr count/limits, allocate,
> > copy value*/
> >    rc =3D security_lsmxattr_add(xattrs, LSM_ID_BPF, value, value_len);
> >    if (rc)
> >      return rc;
> >   }
> >
> > David, if you like I can provide you a patch that implements the
> > security_lsmxattr_add() hook above if you aren't comfortable writing
> > that, but if you want to give it a shot that's all the better :)
>
> Makes sense, I can do it while I'm fixing the remaining issue flagged
> by sashiko.
>
> I'll route the LSM preparation patch containing struct lsm_xattrs and
> security_lsmxattr_add() through security and the kfunc and selftest
> through bpf. Does that work for you?

Yep.

--=20
paul-moore.com
