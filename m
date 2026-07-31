Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5630140A953
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 16:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785517174; cv=pass; b=TjnGCMeOSR19C38ZfsNfGrkwAReO6CVZdEcbYATcRrv+BaT1yIcl8ycfQWgt8kHotJ/aItgoxCxhS49qMRg6rvgY/ArJa0jmSH91obvq/gP1h2xoBNjrdhxA3dXFnCWpL5bjun/PunNRiO8hysum02Mc6YWLCSpgG8tOmNiuelI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785517174; c=relaxed/simple;
	bh=QRsMcHmTFVFh22BHxXQg21CAvxZvm8fj0rIAcVM2X2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYYGUOxTPdoNjuvkxpiMv+XtHtXm7L4qlJkqXCTogY4S9hbqDuNzuJUsXWT1MKwN/5zcJ7sQyIZ5ES8yEHtIMS9mXUGC2xEPU5qxwk5hys6Lyb1ePHpT15qCKUQe35gIgimojFKkL9jmCQDW3yriEztkk+GDOzflXPlsWor1f/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=RK/ffCL+; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="RK/ffCL+"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso1194763a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 09:59:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785517172; cv=none;
        d=google.com; s=arc-20260327;
        b=ClRvDfEOOvmDXzeWMB1OfCpegbXgkEVVfBEJ4fqo024QDymP5qzrGWR3b1AoVrG0UA
         6VMvfSYJK2zM8LB5aiso2KpbwVL/qKoV1OMwa5reGgO3pWwdIa2BdOK8hgkaq5PoBKld
         qpUUYAdTywinZV0RtvXVyC01E3a1XGaO1iQiuuEwsFXK+NClFLBPi4T3S/JOMHYBdEY5
         XzBRFz7W74d0O/R5Y/notU5Lj4YATnLiyS0HRA9JxjCCAI90Anly68nCgzWfQOH8aI24
         IEwMPQximsLbsHj6vdE7OdkpSqcQWPQfekT8OPCnJ6tiWIunpf674oV3NAJjzj6Fe//t
         02Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zOKR/PjmyeeQ5AAj59WkFZ8/Hg/6PfssbyNnrg+0nMg=;
        fh=XNfhgSvsPEY2mLJLyyesLYCZ8dHPYMdONJ+m1VWsk3E=;
        b=qy/1j97enr1c8UXvPERICi/z7JT4gnv0S851Rk/mw39rQGao9Ux7NIYnnykDyHmgf2
         ofesJhOnKE+YHdE/KcKduQIRsUpsWpssdM8utF5IP2D3fWw5iqmeThX7SWHWPV+2c991
         dbJWLVirs4luqEHis3wE2L+EBC2BVVz6KfwONOUEDSqI2mvgCIeVX54sanUuoCoYFEZw
         WWVo1QHUnv3YPenPv+OEPhWLapo+ME8qdkCq9Afq5WWqy3NJjLG1zqjIKs9HyBK5fh2v
         MiLFQQGs/DmgzqMLA2atlq+wJJQuQrIDe0QFrHuYXoC9plhF9tBO1yOQbFS2sXEIsya7
         A+vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1785517172; x=1786121972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zOKR/PjmyeeQ5AAj59WkFZ8/Hg/6PfssbyNnrg+0nMg=;
        b=RK/ffCL+62C/EbBLkUR5vfyVH831xrlHLmfwSa4rgWJIe6oagWgsKcMZm6SsdGdYCt
         DYBESgUCY5oodjuf1puuRv62UVDRSa15X0LOEzot/yRH7EFy8Jh6U8VxSvZIrZLfidYy
         bunxAGK0hH58Ai6xQ/gY9rR5RFumpoUDEr4kYFLuv1N3o0DyFjRWwfYDg2rVbdYsWoPY
         C3rIFlOxwWxo3gshS5IiYFc/ic/XSohJ8q0qJUGqWKjm2y4jRoy+SXZLz9cSv5JBqv0q
         oEINlI0axA/2NEhGQ5Vm/NbEkD63MjbQmGlqIAlswCIB6ruNh2Oek7pnZFfrXZxd537k
         k8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785517172; x=1786121972;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zOKR/PjmyeeQ5AAj59WkFZ8/Hg/6PfssbyNnrg+0nMg=;
        b=i/8nD2kGd+kkWvPz9DqVhiRIF9h6amz0WGuklESpYPRQ08AKCQzagNPUlj5ap7dbZ2
         qfewBpW+vpGhdNVJzJFI0/O/3353cK0lqYePsy2H9+pLcfZTUiP3XFsZ9YwgS+8QyQXE
         cKDv2QJTBDzPrtXO1cSfEqxTe+lNHtXiSw8xSXJNDiIeI1dGsQUfqWhQGhwNcB2WeZZZ
         ETKQOS8aL1p5GKvH+mzQAOW2eWtjAULoPGHsk4zzIF6/o8DWiSCNnsL1SpqrDYQpz8xx
         uIZxN3Osuf8qBzmmfh7O1dgMeCZFS/n4CKHhpltrLmJvXD8qi6CbAHDNs0Z8hwO0zfqa
         jV+w==
X-Forwarded-Encrypted: i=1; AHgh+RpZRISZJwTUpnl6W556nu8SkEQ4c46XriycqQIgZEOLTt3JbsjiurR1HmYDP6mNzrRCgx/2OIH733b/R6u716c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1R4fu2P2jvvoBXtgemYKLXIuXr9XNtv4L/yHsVTTbAcUZKkPy
	pmG2YYJkpWSh1r3WiFaNrApVNpL1++CeFtm6DJNAzNCsPLLg2M95UPvjrB/qJigxR+d+IEos4g8
	GE4Y4jQlftr5hloxAmLy8SmuHjuP9cznhIfRQj3FW
X-Gm-Gg: AR+sD12dpUZlJq7WeET6I7kL/JlPTOzGdqAlJqXrs/+QdjbynIt7TV3nXY20mrbU6xw
	SbDolJ8j1naA/3+ddUoGJb9HYj5F7QwuDH1pdCWYzlY9kYazUFc0FNhuBhD82IhKuLpXeZ46+S4
	e7zgZXZvsFN7sQyRX/Mrp6z0piNIDijR410Rm4ZqPww42kCNGg+TROeFDa3IO7semRGZJWXerZt
	a9HrWBorl2i+7olicj6aRX4yyy+dLzG3apyHJcjHj+mM+eB66i65137xAw7qzm4pI8TLqx7acrg
	KxvwQYfpDWMI4I1H1HC569h4oDku8NH6NS7atzB5c0cG
X-Received: by 2002:a17:90b:564c:b0:380:9f17:6df3 with SMTP id
 98e67ed59e1d1-38fbc3e5947mr633869a91.4.1785517171698; Fri, 31 Jul 2026
 09:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730234533.1912709-1-dwindsor@gmail.com> <20260730234533.1912709-4-dwindsor@gmail.com>
 <CAHC9VhT=m-GtOZx2AHym7uN1CNx94arKBiXeVC7LTEJ-b=1EVQ@mail.gmail.com>
 <CAEXv5_iiNspub=qE1YW-01sV_bxxFUrrcAR4KV4Ec5i_mePtHw@mail.gmail.com>
 <CAHC9VhTS7rSnBqg00ZxNkcZyh_=EeJmn_4z3CTCCxreEEDtTtg@mail.gmail.com>
 <CAEXv5_iHLmzPT3Jj+qZsdt1Nk_5OD4Up3GGV0S9G7KyQshFhDA@mail.gmail.com>
 <DKCVF3KRQSOJ.1WKITMP369I0R@gmail.com> <CAHC9VhR5yfw+sMfrYpy8Qm2uNoxqsTweh=KhDRZsU1CioHRDDQ@mail.gmail.com>
 <DKCWFKAD79IU.TMCNT9RUAJAU@gmail.com>
In-Reply-To: <DKCWFKAD79IU.TMCNT9RUAJAU@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 31 Jul 2026 12:59:19 -0400
X-Gm-Features: AUfX_mxiTF4CmakubyzcMYYVqWjlKYkApVmZz3ybbsziujIkCqg8Z2kjrrbozIE
Message-ID: <CAHC9VhRQWRKHi-hdtvSnYPD_dqgP7Q8RB_X4PEDLwPUe6EegYA@mail.gmail.com>
Subject: Re: [PATCH v6 bpf-next 3/4] bpf: add bpf_init_inode_xattr kfunc for
 atomic inode labeling
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: David Windsor <dwindsor@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Matt Bobrowski <mattbobrowski@google.com>, 
	James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Shuah Khan <shuah@kernel.org>, 
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 12:32=E2=80=AFPM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
> On Fri Jul 31, 2026 at 6:02 PM CEST, Paul Moore wrote:
> > On Fri, Jul 31, 2026 at 11:44=E2=80=AFAM Kumar Kartikeya Dwivedi
> > <memxor@gmail.com> wrote:
> >> On Fri Jul 31, 2026 at 5:30 PM CEST, David Windsor wrote:
> >> > On Fri, Jul 31, 2026 at 11:17=E2=80=AFAM Paul Moore <paul@paul-moore=
.com> wrote:
> >> >>
> >> >>
> >> >> Okay, it looks like there was some confusion/misunderstanding.
> >> >>
> >> >> My understanding of Kumar's comments was that he was referring to t=
he
> >> >> exisiting LSM related kfuncs that are located in fs/bpf_fs_kfuncs.c=
,
> >> >> not necessarily the new kfunc you are proposing in this patchset.
> >> >> Kumar is welcome to correct either one or both of us, if we read th=
at
> >> >> wrong :)
> >> >>
> >> >
> >> > Yes, after another reading, that does appear to be the case =3D).
> >> >
> >> > We'll need v7 anyway to fix the ocfs-related UAF the bot found.
> >> >
> >>
> >> Since there is confusion, let me clear it up.
> >>
> >> I meant it for all of them. I don't think it makes sense to keep this =
one in
> >> security/ when others are in fs/bpf_fs_kfuncs.c. That confusing limbo =
state is
> >> worse than just placing it where others already are.
> >>
> >> As I already said, the discussion around whether all of them they shou=
ld go in
> >> security/ is orthogonal and should be done separately; it isn't produc=
tive to
> >> repeatedly bring it up in the context of this patch set.
> >>
> >> I honestly don't get the urgency; it will be a mechanical change if we=
 need to
> >> make such changes. The worst outcome would be stalling David's work ov=
er it.
> >>
> >> As for landing this stuff, we can let Paul take the patches touching s=
ecurity/
> >> and route the rest (3-4) through bpf-next after the merge window. We n=
eed them
> >> to go through BPF CI anyway to ensure nothing breaks.
> >
> > Some existing LSM kfuncs are located in the wrong files.  I'm not
> > suggesting that David needs to fix the existing problems, but there is
> > no reason to keep making the same mistakes.  The new LSM kfunc must go
> > in security/bpf_lsm_kfuncs.c; if that isn't acceptable to the BPF
> > developers then David will need to find a new way that doesn't involve
> > kfuncs.
>
> What "mistakes"? Really? It's just code organization bureaucracy. Calling=
 it a
> mistake is just blowing things out of proportion.

 :D

You've no doubt seen the challenging interactions between some of the
BPF and LSM developers over the past several years.  A recent BPF LSM
bug/vulnerability as well as these interactions between the BPF/LSM
devs, has caused me to take a much closer look at how things have been
done regarding the BPF LSM and there are a number of things that
should be addressed.  Not all of those things will be addressed now,
but I won't support patches that continue to do things the wrong way
because I currently have very little faith in our ability to correct
them later.  I do hope that at some time in the future we can reach a
point where there is more cooperation between the two communities, but
given the recent difficulties over even the small things, we are not
there yet.

> I don't think you can simply decide this unilaterally either. Do you take=
 full
> responsibility that kfuncs going there won't introduce BPF side regressio=
ns? Who
> makes sure patches touching the new location run through BPF CI? All of t=
his
> needs to be thought through before we decide upon anything.

I would expect, and require, that patch submitters perform the
necessary testing for the patches they submit; this is no different
from any other patch today that is submitted for the LSM framework.
Patch submitters would also be required to CC the BPF mailing list and
I would encourage interested BPF community members to offer their
feedback and review; once again, this is no different from any other
cross-subsystem patch today submitted for the LSM framework.

> Thus, I am simply asking you to be reasonable: let's help David make prog=
ress,
> and get the changes landed. FS, BPF, and LSM folks can then decide on whe=
re to
> copy paste the existing kfuncs later.

I view my position as both entirely reasonable and consistent with the
current LSM approach to cross-subsystem patches.  The location of the
kfunc David is proposing is dictated largely by the kfunc's contents
and interactions; it is only legal to be called from an LSM hook
callback, it manipulates LSM-only data structures, and aside from some
BPF kfunc boilerplate, it only calls into LSM hooks/functions.

--=20
paul-moore.com
