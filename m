Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865643BFE4A
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776868421; cv=pass; b=G2OoANENDiI9cBgbO8HR++6wI82MxX/KhI7WhTQQKRbrvxkdXkUKuVHHYkpc3/nsTIslC+tOcD5WuQu4AmCA+J3ntWDcl9MpGDMG7RW4XHhIakrrRkjH3I8WmnfIa4yMMqdgP+iUHfkJzGOO65hlc+C/tjPEhHskie7FYLluhI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776868421; c=relaxed/simple;
	bh=kZaE0D26y0L45OODMViKgePn+cdD4STT+bVvQ4zOYUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4VzvgUmjpzd22voVczXHjqXS8xVse4Tr0rWHMpVS9euYDk2pOUDlTQDgbVI02CrUU3Sk9EmhfG79IuU0YrAmmUxlY+iMIBBooofudmPWK99PmktyWSZFxeDOc8Uaf7RXB2aHqGEoAvjtvUgPi3zOEuQ2MzBMC1FnggOuy6Kofw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=e6cDqgJ8; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="e6cDqgJ8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2addb31945aso35704575ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 07:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776868420; cv=none;
        d=google.com; s=arc-20240605;
        b=dbtYOKP1vNcBOEAIB5eEK8QsRo+Gcu4JU2pA1nyz2kleDEZ3LcguU/fcmIr3Ms1gzn
         Nf56utS111YIBjNcUWfbrXhooadGAfPb447q+0ZC939mnvNqogF/eBZ1sZg2/x/C2a7r
         PynNOlYdnuC1v99fEmsoNO4Yr3238yaJXS+jC6aqv3MKNR0nRpG2js4yT5otq/WutFU6
         oat5RPNDYvq8d9eVF30/D5YGxDhJnTFHYh3GmSH8rlABq9B15CGHXSdfk9sxOVOcqtU2
         E67IK8hJSlmhJ6CjHyWqnZMzj0wIn3IADubw1ensBiW7zK+ZnRLhMxVhsPo/OaoCaQTr
         G+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PppXoQQI33/oAY139jaqfJMfBN0Od2EKiFn3+CzkDHI=;
        fh=Bhgg2VWn3ZtiDTp4f80dMnezWSG8M6NffytujAl42A0=;
        b=ildcSDwLx+z0OQx3uJ7ADgRKfjJ+TaWEkWNc4HkpYM2eQ07DmDccKnUfDNcs4mQJLn
         1U1HId74wowBvRnimsdU/i0W/rVjb4tSDlIxQpDPjFabgUS4SDwjmGxJ9+U0zetq4PVm
         NPiYI62205lLrQLAPqz1eEcENQOGIF4nAbcNqjNL1CUND1j+Hfmfv2Fuq9NvPt2nLIEO
         gJnvdYL+oEM8NEmrXGSGCuG2VFFwhtOXV5tam4l6Fh8zNLYQAgoIf9tPHTew3Un7InWC
         RU7FEQKLNR0mI4QBLuDCW2RYkOPVLusQF6hnoaL2KjJhQE0RanUDYUlfQMA/zKVGWlFD
         zfag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1776868420; x=1777473220; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PppXoQQI33/oAY139jaqfJMfBN0Od2EKiFn3+CzkDHI=;
        b=e6cDqgJ8BFgtXq7xoivxAi9/fbEB1EQUVeu5XfwW2hCn+Y2DGMDNw5c8k1nFLu2zE6
         dYL6+MmUnrjOOE+ICLvJlUHUo1HPbVHk8QYYhx8d82tEauzfsAUaO2i3nowncnHzdT43
         y83qwOQ2OuJqI79EwsD/6dEQS1ebsawLyNzTxIhAdKVTEW1Co9ErpHB3R377bhr1C3pD
         nDL+jDQld1wAOMcikyGX99QzkGLBpfbgx6j8Kre2YqEuug0YXjHc24ozj4s24nk9LNkz
         7M9wzIJA7eV1dobCXN7LQztczRoK8XdDokltoXcvO8TMDOjjJNbqGdJ9cV08/tuAW2nO
         6OLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776868420; x=1777473220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PppXoQQI33/oAY139jaqfJMfBN0Od2EKiFn3+CzkDHI=;
        b=c+kHVnNX9l3+8jlKlw9KZXC6SUCGMF8thKI3eApgn34E1UJjyNGXQOW3KN55XPFce0
         X/9m53kc72YxXMiGChaT/BVFEB7XO5TbzRGs68Fv2wf0MPWSRAaFlXiac59nLcY98Hsc
         AefEDwBBFr4zaA37OYtb3xRNIj+psJ3y4J7rpbQ1ex7ewGIMcTlMscPS1N1NhDddUX/B
         4xmp5lGshp+X8mziAIA2yUe++b3YD2jV+hXoA+3h/u0Jf3+wWFqgOmHVGENNq6/SwWEL
         hiptmLatU7OIZO+JovrQsiqyOiMVCzGwTV7afPZHEvFbdYrWMoryYVOFgKhYpLdjWlss
         BoUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Q7WbRsj5hRudGFKTd6lz85BTOISUVnfrp9fdL57ih7W/imsiBJEgItdHeuo70NcjhOfrJCUDsffvNWN+DrdA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx34INiF1MTM3/9kOLIgCsodo1C08pNGwzwjK69Mu36QmH0zVAB
	WHtNCKnS90hvtPmYOg94kZ3zLlV5mc+wg13DOPqi6UQzRZ34zFcI7KO274bjdohKTokYflaqX4j
	JL9bvm/yIkir59xdfz5HGbL+illLovSCVhNHC6t76
X-Gm-Gg: AeBDievovJWJq/Fd1mXES5IFhXcHzZMkfQVrdSmAfGKznqTMw+tXDZctR2k16bdRY8R
	auv41rUiB1F4BTVSfh6Cv31F+G1u72+W3VNXPaSZichyg/ToSsd/vlIU8B2dyPBKlna54aN308W
	dennxihf2eRVeyO59Pi/Mz8mmpF398F3QjOb8Rl/fSqT6qs+PqI018PoxIQ1EYkPIo0OE4dnxIK
	u1oRUoV3amp6D17aTXQejZ8SFTLUegvwKIg2KQZqjzq7K9LCEeAHTAW4MqX0+diWBi3P+PFjchN
	5duCKlv+AlE4NvSKHA==
X-Received: by 2002:a17:902:ff04:b0:2b4:5d87:a207 with SMTP id
 d9443c01a7336-2b5f9f64174mr195131765ad.30.1776868419545; Wed, 22 Apr 2026
 07:33:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-bpf-auditd-send-message-v1-0-10a62db5c92f@cloudflare.com>
 <aefnIw1Tx_2r5nkS@CMGLRV3> <CAADnVQJQxa+fHM9X8COc60ZMcxF0DMhWbtArg_gPynpbbg55TQ@mail.gmail.com>
 <CAHC9VhSo-M1wK2s2P0B+2F0pJqNguW7Kj-g63anp1xCMSBLa6Q@mail.gmail.com>
 <CAADnVQL33TOWFmxcWod3BCgmMXSQ=cEp6NCcxgQaJL0C7+Z9zA@mail.gmail.com>
 <CAHC9VhSKvC+p5j5Pe1YKB-=vRkRA81K3kp97Q6-H5K+kvYa0AQ@mail.gmail.com> <CAADnVQJBOk8w89kj95M3GH-eFdC7njZt=zMEU=skB-DTb3k-bw@mail.gmail.com>
In-Reply-To: <CAADnVQJBOk8w89kj95M3GH-eFdC7njZt=zMEU=skB-DTb3k-bw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 22 Apr 2026 10:33:27 -0400
X-Gm-Features: AQROBzCETT71ZyEIBu4j4G4yN_m6lu_6HdMoKXLTtULHj5B5zlT8sC-stV3h9FM
Message-ID: <CAHC9VhT0poHt_9P407tr3ihfMGJYH0d9=PKxW0sk7gYF8fD5Lg@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 0/4] audit: Expose audit subsystem to BPF LSM
 programs via BPF kfuncs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
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

On Tue, Apr 21, 2026 at 7:08=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> On Tue, Apr 21, 2026 at 3:50=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Tue, Apr 21, 2026 at 6:15=E2=80=AFPM Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> > > On Tue, Apr 21, 2026 at 3:10=E2=80=AFPM Paul Moore <paul@paul-moore.c=
om> wrote:
> > > >
> > > > > It's still Nack.
> > > >
> > > > Based solely on the diffstat and a quick look, this appears to be a=
n
> > > > LSM patchset, not necessarily a BPF patchset; yes, there are kfuncs=
,
> > > > but they are LSM/audit kfuncs and not core BPF functionality.
> > > > Regardless, I want to see how the LSS presentation is received befo=
re
> > > > worrying about this too much, but your NACK has been noted.
> > >
> > > Paul,
> > >
> > > told you countless times LSM cannot touch BPF bits without
> > > explicit Ack.
> >
> > Based on a quick glance it doesn't appear that Fred's patches touch
> > BPF bits, they simply supply kfuncs for users to use in their BPF
> > programs.
> >
> > > So, no, you cannot add bpf kfuncs in random places in the kernel
> >
> > I see plenty of places outside of kernel/bpf that define kfuncs.
>
> We discussed this already.
> All those places were explicitly acked by BPF maintainers.

Perhaps.  However, we don't have to look further than your first
response in this thread to notice a prejudice against existing
in-kernel security/auditing mechanisms that large numbers of users
rely on every day.  While I'll continue to try working with you, and
encourage others to do the same, you've forced me into a position
where I need to consider sending patches to Linus that you've NACK'd.
I don't like it, it indicates a cultural breakdown and the formation
of rigid silos/fiefdoms within the kernel community, but I have a
responsibility to the other developers and users to represent and
advocate for their security needs.

> Every time somebody adds a kfunc it breaks safety, because
> people don't read or don't understand Documentation/bpf/kfuncs.rst.
> kfuncs are not export_symbol.
> Object ownership model needs to be thought through.
> Calling context needs to be analyzed and so on.
> Just because something "works for me" it doesn't mean
> that it's safe.

Unfortunately that isn't the review you provided Fred in this thread.
There were no comments about object ownership, calling context,
safety, etc., only a dismissive comment telling Fred to use something
else for logging.  If you want to provide proper feedback, something
along the lines of Kumar's constructive review, I think Fred would
welcome that.

--=20
paul-moore.com
