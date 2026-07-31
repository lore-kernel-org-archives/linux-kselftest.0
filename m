Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AFB369D76
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 22:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785536595; cv=pass; b=oE7YYb1E5fv70a6zYgGjUwNxc7vpai58G135JATyZMgeGoqCANJ0tFXOi6+gOW8MI/35phZ33OTiG1yupabrJyAEy4kIv56LqybhGVyQSFOZS8pdS6dK51zUsHdtvdGEBmvu5PDd13mDFWA4qPP7+Q1BJ0E5ZNAMC4wMubgkCwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785536595; c=relaxed/simple;
	bh=WWC//Uy5P2vJL7f4I2irNaI5LhMsKvWd5AiC4Vo3R54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WETIkY3hlxAH1pTrkBqB4dMY7Mr6wRJUzTGHYlx8Bl7BDy+4Ph8bh960sRZrLQ/f9jawfjHulPMnJtafYlctTnTPc1e7oP6ZdgkK1SYGQj3r+C/TwTVcv8jqzg15ZuCG1p0um4uZhxlsg5eF+mUanEhFhnVBkhNTDEPhYJfuWfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=azYAMVWj; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="azYAMVWj"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso1949868b3a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 15:23:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785536593; cv=none;
        d=google.com; s=arc-20260327;
        b=WJEDWAJ3uTH8mxSml7fpRqIgO0bVt9s/1q0LK1Ih5/BmnmHL6sR4rkuN1Mm/jxGTS7
         UWTilShmmbp+o9TnTvJFOrbaS5kkbfoVWJhSIn/rompttM281H8W3hSq6mNkWfa8aRc3
         XUMLHHrafffScRcqOaExpahkNe/L4PbR7JnVKV7cq8MXWd740Dd0mPOzV1bcXCKzhoUm
         K1xGx5G7rZdP2CKvlfi2HNa7PscdVzYL5wjtsezOPtdUEI3wv/aijXyGhQNVoBMuKSYs
         J9UiVNyl8Oqp4dM6gBnMXIgczXWc+uNIDjAYz9DUtBe8Wtm1tI5cnalpKxslqwxOKRtL
         j0ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WWC//Uy5P2vJL7f4I2irNaI5LhMsKvWd5AiC4Vo3R54=;
        fh=2NUC1Z7ka6hUUEBGrTCyFkL0ycca/7H/TpQSpwLrdV8=;
        b=dZ76pQbdbpqF0AHWRuLPh8cBVtrCkGzuNdckxkOcMXcJwwNPNO2jq99FhThvRKVKnP
         PFuNqWWt0Klmmzpmhi3eIL1uV0ln0X9UcAxRhEuu6sM3HqezD6VUajo+u4qDFWJBjOMH
         vMks1S7Fibjfn0Ptd+kmvoP8Unh7iCn7MFM3BvzYat7cTrQ2aMkNA1SX5e83JAIanald
         SycAq0d3mCxNQY+xoRNwTd2BkSL8QgXKeN4TyHURi0R4yYVrifVVDWtTFSBZJwvItmUt
         Ve2YBbCnhvcUXl3MWT+ie+nRCmrgNox4IaGQpeky3WMflDMGENxk3Xn/hT6xLUS63d7+
         /Epw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1785536593; x=1786141393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WWC//Uy5P2vJL7f4I2irNaI5LhMsKvWd5AiC4Vo3R54=;
        b=azYAMVWjhYdwMzeWcI05q+xknmIUABIj20r9StipuVxCW9z+9th7XSxJqAvVXfLmGe
         kwiyItVFAYt+/ueem29u5RRBWGKKVb/wEmoj2QlgXoncZDuBe7sHY2+mO9KYLJQkzMyP
         eZzNV/8pcDHq3R1KiUYE5q4288oLsAtCZCxriuDmXBAyNDhifmb+sHXOEmyYaL22lye2
         BMRteaBReo5RF62tMgo4B/Fz0XbfFvMDQqUJBYYrxNMBbIc0v5bNJQh42DHKyBp4+gev
         EPWOPkGDeGFMIo+IqbnsjD4/JzZJmej3g8N9b4AvPsvs9jJVId27rbMrogTfmo7xAwdr
         2akQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785536593; x=1786141393;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWC//Uy5P2vJL7f4I2irNaI5LhMsKvWd5AiC4Vo3R54=;
        b=VDr9kVzTCclZxuFlCErQKUy0Dgh3HZp7jPx4QznXWzWOHKYRN9siHI6+q4z9IX8dm9
         O4I5+T7YWActJeTTvmmuMXthY9NVk2KfsbpWTgHUO5fUTcGA+lhx7V82GJ2fmwCShMy3
         vpPr7itYdK0BQAzllVdLLhamZEXzaS5NFMxcINPt8OO5+yY3PsEnB6KFQVtM3xREzPkR
         kVM5Cqv3ty7dX5oasfMGVW0Byiap3HuLJ89cC1ey9xIBbcwGKkzqMDwCQKGprlDAUO0G
         Yl7Kw6tdpzoPZdp47JcIASRRcxesKUHwVS+qJWjtT6lHg5QNPwuhoYu2o9RRcvH9Jonr
         Tleg==
X-Forwarded-Encrypted: i=1; AHgh+RrF4HcjIRWRiAkyCW+g4sLatJ0qz8FQmKPuEQdfy0AR5Wz/hQ7u8t5KtuNL0bqWYCyXPRWOuQzNd7s+zeosDUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuqwTYKVv3IKNkVTgVmy+lCQagrnS7x1IJO3an+u8OHPnkbTbz
	EeR5SXXqfWdgEOX7fziSKkandcfzDQ1FiNbSkmM2wsIH1SB8dIm+ZcL7q7MmvXWv1RXYhhqrhKl
	wcRYgtlrTYTe3ESXjvpTXj3lRup+U3OTOcsFgAnH2
X-Gm-Gg: AR+sD10COl9pTHNuJdQsOqZr9lvhtCWnUfOD7kDF4SBz5PYbE0DZmDBiny7/pL6Eiws
	GMiBlxTfpUprr/XnkXcyDdOJGZeQV74gAvsACrBg5WxPGim9bFEst1z/2rlQrzEJ3CQCGBiAXgt
	8fdkrAQVpiZE0PFlWem24Zefb2VgSfFmOyWRONQGvgC0OSxdyAnUWkifS6LjLuJe6Vwzjvh6N28
	ztV4394d+Fl0kOsmdY5/3SHf4sRxUzOYIdA9IO7l1dP3P1poySo2y2Ppop+Y/fYpP/LqHStRDND
	n6SuCkAM+rXVaniNxvSw3SrN+2TR8rp6bYGRbs2L5jYr
X-Received: by 2002:a05:6a20:e20f:b0:3c3:c3fb:2473 with SMTP id
 adf61e73a8af0-3c92a53cb12mr1339830637.20.1785536593141; Fri, 31 Jul 2026
 15:23:13 -0700 (PDT)
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
 <DKCWFKAD79IU.TMCNT9RUAJAU@gmail.com> <CAHC9VhRQWRKHi-hdtvSnYPD_dqgP7Q8RB_X4PEDLwPUe6EegYA@mail.gmail.com>
 <DKCYOLBUWJBZ.1N8JAXJ3QJYCE@gmail.com> <CAHC9VhRK38bVU5+rYxwLsvVt0oBBSWs4xKsjexbvc3TuA9LVNQ@mail.gmail.com>
 <DKCZDM2G8VHO.38SPG4I4JZTJI@gmail.com> <CAHC9VhR3AK4r4_0eqWxDmrA8UKOsbyQh6ZRRie99Pe6cW0EL8Q@mail.gmail.com>
 <DKD00NYVQQC9.OK8JEWHH1NUV@gmail.com> <CAHC9VhQ5vSr6JK0xtNnP2cre+3bbW9GUT7kXwLAcctwNpPzwrA@mail.gmail.com>
 <DKD17D5H7N95.2VI5IOQBNTHGX@gmail.com> <CAHC9VhQ24fp7_sy1=NiWkfzPLSM35ugSCOKDKxnm6H9W-pDa6Q@mail.gmail.com>
 <DKD2R5268G2C.TPLR4XMTZ91R@gmail.com> <CAHC9VhQNozNGH4o=8D6wxks4deZ2eVOHmxFK=fvjhkCC0JSCkw@mail.gmail.com>
 <DKD3I17NPS96.3G49BTZ4ZVUVV@gmail.com>
In-Reply-To: <DKD3I17NPS96.3G49BTZ4ZVUVV@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 31 Jul 2026 18:23:01 -0400
X-Gm-Features: AUfX_myDvAP-mn0LUSqkiSdO37b1-jlQ3lFWXPwWxDYV3yXxAuKFWzBHOxeX2Yo
Message-ID: <CAHC9VhQmb=v3-T5HZUzfr_me6S7bo6sX0Vs4nDFQZnMe+SQOMQ@mail.gmail.com>
Subject: Re: [PATCH v6 bpf-next 3/4] bpf: add bpf_init_inode_xattr kfunc for
 atomic inode labeling
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: David Windsor <dwindsor@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, James Morris <jmorris@namei.org>, 
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

On Fri, Jul 31, 2026 at 6:04=E2=80=AFPM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
> On Fri Jul 31, 2026 at 11:49 PM CEST, Paul Moore wrote:
> > On Fri, Jul 31, 2026 at 5:29=E2=80=AFPM Kumar Kartikeya Dwivedi
> > <memxor@gmail.com> wrote:
> >> On Fri Jul 31, 2026 at 10:48 PM CEST, Paul Moore wrote:
> >> > On Fri, Jul 31, 2026 at 4:16=E2=80=AFPM Kumar Kartikeya Dwivedi
> >> > <memxor@gmail.com> wrote:
> >> >> On Fri Jul 31, 2026 at 10:01 PM CEST, Paul Moore wrote:
> >> >> > On Fri, Jul 31, 2026 at 3:20=E2=80=AFPM Kumar Kartikeya Dwivedi
> >> >> > <memxor@gmail.com> wrote:
> >> >> >> On Fri Jul 31, 2026 at 9:05 PM CEST, Paul Moore wrote:
> >> >> >> > On Fri, Jul 31, 2026 at 2:50=E2=80=AFPM Kumar Kartikeya Dwived=
i
> >> >> >> > <memxor@gmail.com> wrote:
> >> >> >> >> On Fri Jul 31, 2026 at 8:42 PM CEST, Paul Moore wrote:
> >> >> >> >> > On Fri, Jul 31, 2026 at 2:18=E2=80=AFPM Kumar Kartikeya Dwi=
vedi
> >> >> >> >> > <memxor@gmail.com> wrote:
> >> >> >> >> >> On Fri Jul 31, 2026 at 6:59 PM CEST, Paul Moore wrote:
> >> >> >> >> >> > On Fri, Jul 31, 2026 at 12:32=E2=80=AFPM Kumar Kartikeya=
 Dwivedi
> >> >> >> >> >> > <memxor@gmail.com> wrote:
> >> >> >> >> >> >> On Fri Jul 31, 2026 at 6:02 PM CEST, Paul Moore wrote:
> >> >> >> >> >> >> > On Fri, Jul 31, 2026 at 11:44=E2=80=AFAM Kumar Kartik=
eya Dwivedi
> >> >> >> >> >> >> > <memxor@gmail.com> wrote:
> >> >> >> >> >> >> >> On Fri Jul 31, 2026 at 5:30 PM CEST, David Windsor w=
rote:
> >> >> >> >> >> >> >> > On Fri, Jul 31, 2026 at 11:17=E2=80=AFAM Paul Moor=
e <paul@paul-moore.com> wrote:

...

> As a consequence, everyone suffers because they first need to satisfy you=
r whims
> on how all code and kfuncs written thus far are wrong, and need to be mov=
ed
> around ASAP, including the one being proposed.

That's not a reasonble or truthful summary of things, I've only
requested that David locate his proposed kfunc in
security/bpf_lsm_kfuncs.c, I never suggested he move any others.

--=20
paul-moore.com
