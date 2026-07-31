Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8573B14C7
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 15:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785511039; cv=pass; b=NrTcSaRswi0fQVVmDARzOxreHXy/wEVxFW4slJQyxWPjQI1IFBa3gvHrgayDD5Yr8k4eGGP9D/YXk7IxBWJRUsNFXnywmTD6bHfE7/vlIuToNBpJk1zymdKmjx6ayUn/lty5MKLkCK4xOYciZtcpTG4NMWpeEp2KI+s+8S29LX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785511039; c=relaxed/simple;
	bh=MaagnOxntbuxGRXITbLMVGEEGsWlGpeYqyeDM+L3JQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l8E+0ChGwmlDWjKvFwCGkFmSS/PSB/kYsKZ2KolZ/vEERALCySAVCjSSDlwbu0UMNIPXt4xualpJKCLpOMvw7fQOHYzLUdY75b9nKzpKdlzhksqviBlZtqN8O+F+5IbMxeBV4amuJV4bajsp7KPwNPa8v21VY9+aYfs42dgrpaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=C5URBVxJ; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="C5URBVxJ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ced3386430so10530365ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 08:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785511036; cv=none;
        d=google.com; s=arc-20260327;
        b=qGqcGr04T467AUDAdeT2GUBcUugISGT56e7jhXLgjxasRdnY1g5Zv6nCdWNIfidLha
         crArb8tJ96O06dcoLH2uy+RCUhpcc0H+vPBTWoEfSzrDLI4mdAgyRQIsMzGmaw2Z3IxI
         YrmEY60alhlZ7T7cLD6/16F2nKZAA48PgSqHGvM0L0sNPYdHnstaxHak1G9ON+UEJ4yC
         8upPxCA+wx8hRT1pPXJIovLvAxFwsAo+xjuxcm4neIefhQKScYqVLcDFQd5v8ugdEZ1c
         Xg62DhgCORSao6lMoWXv2RU7AD0ussL57jqTgfw5RVLCNeQz+9yOSXmQOwESiZXOqeTW
         FL8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MaagnOxntbuxGRXITbLMVGEEGsWlGpeYqyeDM+L3JQ0=;
        fh=lHKLE1zM8hYt50govA4jNIPSB/8L22LVopDmccwP0H4=;
        b=WkTMxbcXbBegoT2IkMWuRPE1Kn2vnpyWRfuqTJUGwLnjfwJX3O90stVWIkCTtjVZjc
         bd2yzAdSRMUytFB/OJViNJD251M7zEZZUPCjidxFxTP0URX1piwTOM/TfB7HLSXGkSEY
         Hp1gV57cYXmM6upPSQiQwi58v8svdoeiiQjyK3OOG0ehUw+CYSBEWpc1csh9g2YMNBNA
         1SEa1dmIfZu4RJ0kKydy2aoRIdtbUMh4PS0uPTsADqN2SfWQ//vgQfUF+u0PGMunChIt
         ojsOCapc4w866LBMgRG+o7cEUsZ+NFHBH95xT8OSEoYe8zSP0vlGSK/tjkqmbq/KtKty
         3b4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1785511036; x=1786115836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MaagnOxntbuxGRXITbLMVGEEGsWlGpeYqyeDM+L3JQ0=;
        b=C5URBVxJ5tERBLgnpI1F6Uk1I8wczA1DgsZx6wU5E29TDJD9OlexQVboj2ikm7m4Vo
         G+DVy29rCfY3z8DteBOBZrGBt0A6NzbErXM1yBfFloMA1eBgxFG47mHi78CJI7hh5MTS
         Kajg4htZS9wNxXJmoOulS7kZUqkRiOhQe3zOkrQpebhQd9lt9YZIF1/aHmfGmxtjhxGa
         rD/2gv7lce/d0vipnWSBIgY6IZW6n4Z1DEk+Iv3wdUrZyhATZdXzysAX6p/yE0ZA9PHy
         G4lifiyT6/Kvh4p2Q7Ogfwx4NUJ17PuYzIPlojAjBifCDzNPoMo0FU5DWkCLgTqj15n3
         ZXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785511036; x=1786115836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MaagnOxntbuxGRXITbLMVGEEGsWlGpeYqyeDM+L3JQ0=;
        b=YfY/OZxBYEONiMu85sGM4Y4EAVdKwKMvQ+pVzyUKRaKm9NRodAWdC3SwchKibrndBF
         zFf0i7P86Bt3PbSHov0cdLV5fGZFyqtXGAIwvmuMBf2RV2vllg2yfcKfTrX29lmO5QbO
         zTahjmRr9Y+bZBVzWdCAv+TqNWOJeTvqW/EOAUlUBPfjOZS0wm5lP8xhLSdBqRsrdKjq
         4/6bRBn7JkvClV4q2XLGrYUu6lE9hInAzgszUa7EVkf//bDYuWvjnJpecHKUCjAhoMWl
         pS4n5SdYB34uATzxtXwmUt4eT/NtG/rmOo7l2SAYexvb3l8X87lzURhpQGHMnI0WRvFR
         5uPA==
X-Forwarded-Encrypted: i=1; AHgh+RrXxcu3Sr8V56ffDedWIn4w2WTusj6+8Gg0rvT3RsoFx8wxXDqmKE/1kAP8uZcR5NESuWFHZpiXxPVWvUB9vQo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8v0eKz1ADOdrfCE4TCrDy4LyFOCXZZm8mnndhOpu/ovbI4O4C
	xBmE2xFm5MTHjPCQgfnShdb9JBwYeX0QwSxRXEpvTfdvgPBrWrL81Upm8maMLCadcQwLI0osbx6
	ymbtiLJ8UAtsnoGltwapY2eRUWCj9PtXJvucdzQrt
X-Gm-Gg: AR+sD13droSvX+HNtlAia/YI9D1SqIUhyiA73zXpOXW/VOJZa4TMQRV9LjoTqVM9eeC
	17YebfE8E5mYqGi1q4Ll4RxFAqPU5He3xe76Z3pTXqtxEeCJ2yiv+k/2OpxYqjusUHoaN3Xmq7J
	z8EXTUJE9C+Ls2rAB4nxsEs7a9AHCTDJ387lIkhth6hKGp39YkCndKtLZUUrOoBQmYMr67T9wym
	3TrqlRk2UCbhkRbmpCpMZxnNiaOpBG5Ead4Riss23nDNEcXwyo5lJ7/mj3+G3N8+vZAUOF8k4px
	qOHaGhfkAPpM5/w4Zz6bYyIm8tOLiylpr2iEL0EwR9ls
X-Received: by 2002:a17:902:ecd1:b0:2ca:b89:7bcf with SMTP id
 d9443c01a7336-2d0523b96d8mr3879785ad.22.1785511036384; Fri, 31 Jul 2026
 08:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730234533.1912709-1-dwindsor@gmail.com> <20260730234533.1912709-4-dwindsor@gmail.com>
 <CAHC9VhT=m-GtOZx2AHym7uN1CNx94arKBiXeVC7LTEJ-b=1EVQ@mail.gmail.com> <CAEXv5_iiNspub=qE1YW-01sV_bxxFUrrcAR4KV4Ec5i_mePtHw@mail.gmail.com>
In-Reply-To: <CAEXv5_iiNspub=qE1YW-01sV_bxxFUrrcAR4KV4Ec5i_mePtHw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 31 Jul 2026 11:17:04 -0400
X-Gm-Features: AUfX_my_07XA5O156m3d-t8I3fv7r1HuUVA6nIPOKrM8LOdCX7kqs7sLBvl0mUM
Message-ID: <CAHC9VhTS7rSnBqg00ZxNkcZyh_=EeJmn_4z3CTCCxreEEDtTtg@mail.gmail.com>
Subject: Re: [PATCH v6 bpf-next 3/4] bpf: add bpf_init_inode_xattr kfunc for
 atomic inode labeling
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

On Thu, Jul 30, 2026 at 8:01=E2=80=AFPM David Windsor <dwindsor@gmail.com> =
wrote:
> On Thu, Jul 30, 2026 at 7:53=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> >
> > Based on our discussion in the v5 patchset, I was expecting to see
> > this under security/; did something happen, or was there some
> > confusion?
> >
>
> Nothing happened, perhaps some confusion. I was basing the placement
> off of Kumar's comment in v5:
>
> > I don't think we should do that in v6 though. What you're describing af=
fects all
> other xattr kfuncs. That's a broader discussion we should have separately=
 when
> folks are back from vacation, and more importantly involve FS folks where=
 the
> code currently lives. As you say yourself, the lines are blurry, xattrs a=
re as
> much a filesystem concept.
>
> My take on this was, leave it in fs/ for now and then litigate the
> placement of all of the fs-related kfuncs after bpf_init_inode_xattr
> lands.
>
> Happy to place this in security/ in v7, if that's preferred. Apologies
> if I misread the thread.

Okay, it looks like there was some confusion/misunderstanding.

My understanding of Kumar's comments was that he was referring to the
exisiting LSM related kfuncs that are located in fs/bpf_fs_kfuncs.c,
not necessarily the new kfunc you are proposing in this patchset.
Kumar is welcome to correct either one or both of us, if we read that
wrong :)

However, regardless of Kumar's intent, speaking as the LSM maintainer,
my stance on this is that the kfunc you are proposing must live in
security/bpf_lsm_kfuncs.c to be acceptable.

--=20
paul-moore.com
