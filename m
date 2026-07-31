Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA46C44102D
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512004; cv=pass; b=mtLBuB0Ea6tNHMdTrt6l24BtBjcj47cwcTewrAmAfEYicwME1hwihNhlhzcyToel71LBb5LgM/le6wAkLLg5gZw8gpp9iDNjgNS2TcDoNOL/+y8INJnY8njj0vVl8Vs+BUKUebnN8lviH9J/aJOpJ2uyORzSTZGloHprIzEytlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512004; c=relaxed/simple;
	bh=VuFNcnIpHKuBE9TqXe/JfxuxV9DEEfYcH5BhOui7Tz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bGyF2pbEe9CUPZ76hkip0gTX325Kb+Kn+7VZkB4LjpSXIcI16SnfHm4ZvS7ZxC2OJL1b8UrVaaa7T5pbQt8tGKJuh7CJlpNSjqYrZ/3EWrLVCY2q3zuFqD0e8pJlI9JyBERydeEKdFMubaZ2tWR3ZiL5xqu2UZLCesAsJcmmLGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=WlLS7APe; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="WlLS7APe"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so866644a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 08:33:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785512001; cv=none;
        d=google.com; s=arc-20260327;
        b=Nge5q6Rpnn6o5Ad0+u0Ofc6NxpQSvMJIHcaJSRz+F5z0GTp4IEXw70e2Xrpbh+yqC+
         1wePM3yZhP8ywM8ViIU4PZtbxAACWJl1aOvIuOdW8bJqEjMUxF6v0OVw+HSg8I6A3TIP
         kRmNFYPS64sQtCWQ5TdMAPJpVOFpuyeSFFsrlSknliu/gh/XRofhjDfZWsz85pxNp4w/
         3XYQatExOBmuTTeJLl0v/x3f6Y5rjHSJKc7+F87KnpvD8lAuZ2+3F74/8rIDdbavJ42B
         +KilGF4yEhL3Kp3kndGbRSzWJyOWB+IidFmH72JXvLitf7NjLBARRC4lWbieqB2tERj0
         oJpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XnQ75jYzm8moYl46g1ePyO1gywKf+IeSpDPhO/wg5nE=;
        fh=SJ78W+lg8BbywGPdOlWb4ySFv1gVYGC1o9wNldzvQE8=;
        b=W0GgOQacQPdzAOhv2/Tg3oIEVHyPyC4+cTAHngmOKFpag0lbb48+oVLxaTyL3R89sw
         OEZb3zT78u5k8+1jLiOOS0V0hNbZsA05FbUypc+7dNhoelKLeyqWalqwQDG3NWt7iJXJ
         XE8D4SMNXAMX0AZ/Aj4aKfHwRW6cHJxsSahFC/9RdNXRE8KUm2lhLuKhCONhK9IpcIkn
         gHo5nNpvddyWfmNa+eil4LPGaouBRk4jGbVH32XNYvNCz5Fc++fkpS7cfVOAvT99+FSl
         O827czVSDgpgMKha3ZKCmRWbKep3eMy7O3kSWeUsuwT4Vyp9j7X80oxAu1vGgUX3LJE1
         H3oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1785512001; x=1786116801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XnQ75jYzm8moYl46g1ePyO1gywKf+IeSpDPhO/wg5nE=;
        b=WlLS7APeX/hA7NEpMaOEESuBOy9fewR9hgrNZhDweuEfsAh/zoyTHKGTJF9U9J5tq/
         s847tazcBtQqqpEIPCZXBYyQ3TC7humVlzydKPbO8qx9opWFdjz7TCnoMEGa4QIO2Wi+
         Ahj5xFgBiGOukwhXTPUjJYDHwXCGm1hXlbLknTbkVQvxbQqL2OkPbu3WWjJxOCfQoua4
         v0rgXyVwMwKBUiPTrtFyuoJ3JH1JQYPFRfSarLn5gtHHWLOZnhRsC/r1ro+0psVHAY3z
         /saiuR+VjYl9I0MSElkym7L/BAmicvjWjbB3CcOZUS1cwve44tpIhC2lftzsyegxt5Ww
         Z7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512001; x=1786116801;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XnQ75jYzm8moYl46g1ePyO1gywKf+IeSpDPhO/wg5nE=;
        b=TkYpYifLTmfLXMTmCwaEUbSbWPaCSNRer/c4ukKwf2wU89OddMYFuJcmQbacoqGNeG
         Z9VlNNU6WgLaVrpr7xyExV/h75OTbPWskSudEihpawSC2r53JcvorQzr/p0ViS9ADn6+
         yr8qt1WA58COJbpM3A7NQb2ZQD9586489AN+U7648QAGQCRuxpyFo3qe+sVh7hsAFMar
         JNruoxFb+AEOSlTag6/nZGW2RncCT9YbYe/+TqUtiMM4IgC1k2bnJqTiuUoJOKOOvDcR
         R0+uSeXlG2Hr3E0DV4Vge2EzuBpgLjt3BBr9Y1+PsodRXp1CavL+TB/apquIQxFv+iCj
         x0vg==
X-Forwarded-Encrypted: i=1; AHgh+RpAGAy3MUABV97EnJaQk3IOqp8aoInmFdBh6lG6qNgPcQp+jeN4ZCLc6gnOpczZOqAVrAQC7tqBHPHj76epVDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAE/dyHc9+qmODgrZVqx/YE1+frd6BSlhMdt24XXAL0RNaiUyF
	n8RRohLxUt6Sxld8+aacfismCzKAiQQ7uJYz/wT3ucYWNXhV1Aj/iD6hrQa9vPsNLPqnt3Pcqzx
	Cdtq7QlnZRTrcLqxfPlef32UI54eCGAz5HO9nV7+Z
X-Gm-Gg: AR+sD12wrqiECL6Y+R1HStc6q++M4NjBJY2zpZ/DZzaQOeAfYUNR65ZQmEUuyI0hCMW
	FSXtm0wBmEykaesf9xXOMpHWljFLjDa2h+v7biHXScWsYnmOj0Qhc0dmKOqeN/XBD1nUAf4fLng
	0faIpA4G/qXjoEIxOwWi6o2TWdWvtxlKJ9maqvgyquVhGUR2NbBjSdnRZBVs6k2kbDtUqayG3wB
	kwJO0ZUWFc2XF05SuFRBVvzVfgaBk8onqEfr80puBDkCvbCQ2wjbNvc0Moill/pMWdawUdidzjl
	HilGH66U5zLWkFcHTIeipMeNT5VGPzSa8BFwbE2K1uYI
X-Received: by 2002:a17:90a:dfd0:b0:387:e0db:bc24 with SMTP id
 98e67ed59e1d1-38fbc5225dbmr287131a91.36.1785512001460; Fri, 31 Jul 2026
 08:33:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730234533.1912709-1-dwindsor@gmail.com> <20260730234533.1912709-4-dwindsor@gmail.com>
 <CAHC9VhT=m-GtOZx2AHym7uN1CNx94arKBiXeVC7LTEJ-b=1EVQ@mail.gmail.com>
 <CAEXv5_iiNspub=qE1YW-01sV_bxxFUrrcAR4KV4Ec5i_mePtHw@mail.gmail.com>
 <CAHC9VhTS7rSnBqg00ZxNkcZyh_=EeJmn_4z3CTCCxreEEDtTtg@mail.gmail.com> <CAEXv5_iHLmzPT3Jj+qZsdt1Nk_5OD4Up3GGV0S9G7KyQshFhDA@mail.gmail.com>
In-Reply-To: <CAEXv5_iHLmzPT3Jj+qZsdt1Nk_5OD4Up3GGV0S9G7KyQshFhDA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 31 Jul 2026 11:33:09 -0400
X-Gm-Features: AUfX_myWZz1m6PowWXy7WcdAAbaku2QnixOSUt9yTgIUfLpwiNvXahY7xKnDbwo
Message-ID: <CAHC9VhQXtV_dGt_b5oD_LFNOygfx=37u6P_S32xo3A5aHvnj-g@mail.gmail.com>
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

On Fri, Jul 31, 2026 at 11:30=E2=80=AFAM David Windsor <dwindsor@gmail.com>=
 wrote:
> On Fri, Jul 31, 2026 at 11:17=E2=80=AFAM Paul Moore <paul@paul-moore.com>=
 wrote:
> >
> >
> > Okay, it looks like there was some confusion/misunderstanding.
> >
> > My understanding of Kumar's comments was that he was referring to the
> > exisiting LSM related kfuncs that are located in fs/bpf_fs_kfuncs.c,
> > not necessarily the new kfunc you are proposing in this patchset.
> > Kumar is welcome to correct either one or both of us, if we read that
> > wrong :)
> >
>
> Yes, after another reading, that does appear to be the case =3D).
>
> We'll need v7 anyway to fix the ocfs-related UAF the bot found.
>
> > However, regardless of Kumar's intent, speaking as the LSM maintainer,
> > my stance on this is that the kfunc you are proposing must live in
> > security/bpf_lsm_kfuncs.c to be acceptable.
> >
>
> Ack, will do this in v7.
>
> The Landlock series currently up for discussion [1] is proposing
> placing its kfuncs in a new kernel/bpf/bpf_lsm.c. Should these maybe
> go there?

Nope.  That patchset has its own issues, one of which is the location
of the kfuncs outside of security/; I simply haven't had the time to
review that in full and reply.

--=20
paul-moore.com
