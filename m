Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D483803D4
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 23:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776812914; cv=pass; b=BZzEZk/NMsCM/SltWY4VuDFXDdJ0ALHP0C+6xG8meKuHaOHf1JLBej4LfdHkk6e2L8bqSY1R4ozj/+BP4yfRzCPjomxgpT9iOmLZuLgmrRtoKHp20mvwp2JRx0QQizpj0h2FqDAe+XE2Rv1pRrmOc8shReVw/JCFapeMnN0L94U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776812914; c=relaxed/simple;
	bh=TR8FfcO11p7vVa6RPRWvJwht4gBSEvxOdxbVlJmTMFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9gaGZMZUowD9ckpjfCG8TSfrR1R4KzAJqF+Fa2Lbrb2uOC5YWeuZy3OYc4LBWzyZTzD6kJ55SdMZ7IOaJY0Y+PtRl3pQG0U5MDkpkFvRAPIu9wDl2u5Zq+tnGaxrxf7X29zk/7dVLhvpc83I8YgBOibAyApVUFpxMgoKLPFFcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8ISN6my; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8ISN6my"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so12206665e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 16:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776812911; cv=none;
        d=google.com; s=arc-20240605;
        b=ECTGelVpATehipuIcd1onoHPbhl+PEWmq11xJHhMgQKKyaGBmFfD55w9fbTjkVQ3fD
         LjvKaVOdLmSjGGHl4Sxm5VfDCSndtTp7sj7YpepiNdLHMwMkmYnpOBLMwo4NL5c39nZ8
         7kq3tC2O8LdOms4gM0nfqeNm86DvMLZIGdCBdiAiCcn7zMP32w8HlC/MDfsrBmxuUz70
         5UyobZEFL2tMtcbXC3Bszu4l1gslWJDGjlKSVBW9BI5N0F6aTKoNALdJ/WKONJ5KBmJ3
         zTJFvbDGI2Hsf+0k3upKaMLfDvzAeO+tlAcNrkDE7BD4qGc5STemIxHImLDIBgsHm0ps
         vf6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TR8FfcO11p7vVa6RPRWvJwht4gBSEvxOdxbVlJmTMFY=;
        fh=U845YzOguOEMmkbiL6oSZCcqj9Fu7+0Ds8wvMGMhvSc=;
        b=jGgTK1R+khC/dG/pw6AaSaJ0qcsMcBQAwzKCC5JtR+bD32UbreFdgpHr7oMYQtIyvq
         TjfCL+fzbMtJWYgOJb0DkwkrIpaxiWXNO7wZFmiWFgfk4qaWx2GsoF0bnyV8Wsicvoiq
         F5I4eIXRhZfCbyzjmK+uYYSMVkcofbgleUDW+R/wkEFAFXz1R98gobmGJLr+PotHZAoA
         YEwHPM0ottycgO2eDZTHV8EVvcwJYB4IeH7zHnvsEPRRgibQ6zPPnvOVYpVvVXjisFyJ
         K4aGhBT16xh7bvPckWOnYAai4ebj/M83gpHTTQUCEEDJrWKU+KSTwjDmSRaaxctLPDDI
         YAGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776812911; x=1777417711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TR8FfcO11p7vVa6RPRWvJwht4gBSEvxOdxbVlJmTMFY=;
        b=f8ISN6myN0HouaGClnTTEmtYdTHVXREC81ZsCdvw8OzsjdvhMDCIl/pHWuaWRc6yj7
         s8+QDhNUEOIRUrGGJPo4iXX+fXbI8ejZuYp6PAdrgZ8SCp/e8VyTkRt3kOChA0T7Ri3n
         JaJ4ay+KYNopVNKSHQxonn+n1eNDEjkSMxuvfy1eaDoWgO0tOwIegQO5Hs+UTIznTXMZ
         28iTByKLIpXNg/sfsHODU1wmZbBgJUfNVtH2u3+nU9aFevpzW1MEO6M+O1pJCAv7BqUh
         gkn4OBsbu30PqRPufkTbVSc5qXpWAkm6E3cZU6Gc3LcpcNS2EwMJHtnllscyw9Uwe4GL
         kr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776812911; x=1777417711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TR8FfcO11p7vVa6RPRWvJwht4gBSEvxOdxbVlJmTMFY=;
        b=PlLO5ZjPka3WiWmnbigdCtsCJ2z9LFVpVESeL4XozIVIVZl8TB4jEMlNPZJJpgozDG
         qtW1EKk/beTjhPcVQI9UUM/D/sJrBjlktRkImY4zzRzs8q7OM0x8MyLU/rUKho+9Yu1J
         Wyu+CtZ/5ezHI1F4GdasAij54t5POEqMS+UpKJTrifeb+CKrfrG9R8VxOv9C3uzycC5f
         bttdQhzoGrtgM23nweRFuB9/mjZKQMJ5G7Ghtla5i1cTAseePvVbTS+Hvdq66kQASIRJ
         auYscU3fygSgTugCJ4BuNhBEOtTK56mtbDqlxI6OmwjCqLWGOSQYPYLuFd9l7HyctbdL
         P1VQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dfd4Ftu4e2UB7IaEo1FLOE+M/5LUQJCOweX8GHOwP94CV3P0S2bJNxEEJcmyMyTZaFfndsBB6gjBcU1Tir7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyskV4b7SMD5eP6Y4CgwKWaq+t3FvErikuZalrYhaORYMaNrUvG
	T6RsiZAEF7shptPaMfP1sM4JagYg4xpemQyvuU6Ic0BWGzF1O6RN2mFkUb4bZyqxP39MvXfT37l
	FoW+F7I3yhbrAtiJaJRY5Osnuu16zk1I=
X-Gm-Gg: AeBDiesbcgy2/tczL7K+uK8eebZunC4Hc38n9Cz3yyo9svIIw9plz3k2ePGiCNyIgls
	NRibcX9pGGE4UnkjrSCeNoHY1PtkegamoeCUGx9BIPNK4KA8GCY7K+22hCNdtxlYmbpVLQk3abm
	n0450JkI2lGXTQ7ywPxgQKCVWTTWKKwN63q2x7yj44nLhUJC5EEF1OIFDxso36dXvObZ0mpxDmP
	g32jaY+8+ptRc6wlzQfo1/lIZO/JLmJNBObDADxXG4ov2wQ9aKruPrFhXw8b/BNJpGQh4QgAlbw
	ISNYE0oVNZkLe63QmMkZCl86Q0N+mID+XfiseeKHwa22yl1zF8TS4611zV1361+YAiBwCdoPxuW
	TtUz483X7VmsDZaukemvlar5KePuJOeeKpRgC
X-Received: by 2002:a05:600c:a314:b0:48a:58aa:523 with SMTP id
 5b1f17b1804b1-48a58aa059emr27059935e9.31.1776812911066; Tue, 21 Apr 2026
 16:08:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-bpf-auditd-send-message-v1-0-10a62db5c92f@cloudflare.com>
 <aefnIw1Tx_2r5nkS@CMGLRV3> <CAADnVQJQxa+fHM9X8COc60ZMcxF0DMhWbtArg_gPynpbbg55TQ@mail.gmail.com>
 <CAHC9VhSo-M1wK2s2P0B+2F0pJqNguW7Kj-g63anp1xCMSBLa6Q@mail.gmail.com>
 <CAADnVQL33TOWFmxcWod3BCgmMXSQ=cEp6NCcxgQaJL0C7+Z9zA@mail.gmail.com> <CAHC9VhSKvC+p5j5Pe1YKB-=vRkRA81K3kp97Q6-H5K+kvYa0AQ@mail.gmail.com>
In-Reply-To: <CAHC9VhSKvC+p5j5Pe1YKB-=vRkRA81K3kp97Q6-H5K+kvYa0AQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 21 Apr 2026 16:08:19 -0700
X-Gm-Features: AQROBzCAY_2lHhQ1prWwPyLIfmaKNZadZdFGYpecw-J2REDrg4GAqC8BWUzx63I
Message-ID: <CAADnVQJBOk8w89kj95M3GH-eFdC7njZt=zMEU=skB-DTb3k-bw@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 0/4] audit: Expose audit subsystem to BPF LSM
 programs via BPF kfuncs
To: Paul Moore <paul@paul-moore.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Frederick Lawler <fred@cloudflare.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Eric Paris <eparis@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	LKML <linux-kernel@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, audit@vger.kernel.org, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 3:50=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Tue, Apr 21, 2026 at 6:15=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> > On Tue, Apr 21, 2026 at 3:10=E2=80=AFPM Paul Moore <paul@paul-moore.com=
> wrote:
> > >
> > > > It's still Nack.
> > >
> > > Based solely on the diffstat and a quick look, this appears to be an
> > > LSM patchset, not necessarily a BPF patchset; yes, there are kfuncs,
> > > but they are LSM/audit kfuncs and not core BPF functionality.
> > > Regardless, I want to see how the LSS presentation is received before
> > > worrying about this too much, but your NACK has been noted.
> >
> > Paul,
> >
> > told you countless times LSM cannot touch BPF bits without
> > explicit Ack.
>
> Based on a quick glance it doesn't appear that Fred's patches touch
> BPF bits, they simply supply kfuncs for users to use in their BPF
> programs.
>
> > So, no, you cannot add bpf kfuncs in random places in the kernel
>
> I see plenty of places outside of kernel/bpf that define kfuncs.

We discussed this already.
All those places were explicitly acked by BPF maintainers.

Every time somebody adds a kfunc it breaks safety, because
people don't read or don't understand Documentation/bpf/kfuncs.rst.
kfuncs are not export_symbol.
Object ownership model needs to be thought through.
Calling context needs to be analyzed and so on.
Just because something "works for me" it doesn't mean
that it's safe.
