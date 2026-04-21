Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A723A75B2
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 22:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776809430; cv=pass; b=RWfRbybBAmShNSFTQ3wwGSlUX+8UKK33b282nklGQVr0jq7vX8RKMQNVDHSKXzTF2K7Lz59sRgzYn48KzaowYqXtPDNgyjY6CejdJdQDJYt2grv2IKgRjoSqYw3NnfHPoHf52syGapymrXEon8Hyzk1OqgDKpE2XwFcMqVUaLfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776809430; c=relaxed/simple;
	bh=xFXFGWyulzpS5kgQ1H2MDTMFPA/U/219DnWbJY3bqbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CxR0qEblXmsvHJutbJgiNIDSz1EDWL6xkW80S2loy5EBfc/ImPFp6XrfpOmeTBY7c2nZmRoI2yXwzgzGKrnbeMDXtb7+Vz5dP5vjRh09nZHy3y5dVKkKk60Ad8d2IraRy6B3DOFe9X8mJNsPoBhQ+itXy8+rxTmPOfXOoybMq20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=CymeQB43; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="CymeQB43"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c76cce85bd9so1756776a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 15:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776809428; cv=none;
        d=google.com; s=arc-20240605;
        b=i208YkOow7czM6IBWRgAKXX9xYjZ8KJg9iFGFXqFI2qdo/iMtbc5PtAJtItBKKy3Lm
         x3pgyRddIS8Zk5kJ7GqHBELf7sVFXqZev1l+uOf7yUcDdje/S07gKhlLOrfrrXvPsVWt
         tW03csfTOUIXfQq/hXnJk4TLYqVZT9f8uemuQAoc45VaFjtNi8rjdKi8diPKvo8rSOXB
         7HLb9UA+FCTks/hSt/3fCjmS89klE10mpcyA1P1dckTnSzrh+7hFN1yOB6978G0/EWpn
         69ii7sXWqnvAw9ZSNKwHutPYx1Vs4ify7DZlkTN/BEzNhmiL5F1x5XJjyMQ6sYEGmcnR
         ULHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AiGwsmPVPMIRS9FmLSReJQ9g0VW0y/S1QWZXVUVPj4c=;
        fh=rUO/MJq/ZH+CSWz1vuHr+qgcHkLu8t0IeOLQGQs6dBA=;
        b=Rf2ZK7IWXFQIR54g2oxMgK9Y0W+Ksg5zuOiVg4amg50U6bZ/pe0xgWclzD7VysBF0H
         UjO0bbx+Hw7OfhR1dRxKkrdON0H/OkUXi8a0mn+9CMmS3jH8RicAvAq7vk5Iv6T2dzVI
         GgPepux9qGGmbFomi2IPkYSfV1e8XVKMU1ePa8LW5gJuYpgOUn7G/tIOzv+n/2bXWArl
         nMGMdufT+FTd8gkzyVaGIPKklT3WJsMhZQ77eU5dbieXiFmw9CSh9zCO/5yCuqIHm4yA
         lCvqaVBPT9wwacGvBqZ+gIqYpvoa9tQxOKp7Tsfv4v3pjCawkuPBiY+RYra2Qmp2a/ab
         8GHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1776809428; x=1777414228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AiGwsmPVPMIRS9FmLSReJQ9g0VW0y/S1QWZXVUVPj4c=;
        b=CymeQB43g+xgXJkvDnYkNZWs7GQqQn1p0+1Mp1dP+MUiiv2jL58H8azLIiUlG+C0CQ
         oVKVMDkL6kmEZJDJ0Al1sF5svSL5adj6rMz1Ie+h9FNhm+DTGzUW7USpBsRaI9Fit8Dm
         vVJRWetTHq/Zlx104bdtYXQZwnM1ALCHL6Ctr6y2TFxEtxpBKRkVRcGeDe7a18igmPbA
         OZqoHjQXWEONHQzAf+ftKhWbI8IUuf/VvuS5Vz/dFmUjQOcDMWaLXmcdi8vks5J8lExi
         LmZ1AlOdF+vfRsCjqb8V5ZrC9Ea8TeMNY+Gw2Jrka+cQzaOeRFx2iA6rpZ31/Eg70bcg
         6r7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776809428; x=1777414228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AiGwsmPVPMIRS9FmLSReJQ9g0VW0y/S1QWZXVUVPj4c=;
        b=oXyE0qAUFnMbeOEv3CXV2MYVH204hcusvKGDmACF9wV1oHWfq9hP/Gt9OrgoGSD8K5
         haU9a1z/N9/BCAqpGV6sAQNFSa3R6cIPOUkVLvilN4KaaqrHWLlynczfShTcbQ//E6lo
         oWb9tyfRlhjTwM+gdu8Ut68BwCFKVBIbMeeyqQSvkTNKVEzerFaF+5qNFGVj4yP3WCoq
         7Ml9tFecbGbE1MNzLnIYXRWSdwU120xCclcNOJ+NWLvfjnDzOAhx+N48WaXpltaGf4sz
         c6zA3kgeZfPESMstQExENhLT2qGohNhyq2KBsYFcKV/NGq8GUviVdc9NPsfiQo/20glx
         k3HA==
X-Forwarded-Encrypted: i=1; AFNElJ+Gd/WxYCDuN/m8MVhFnI054/64l82CXvTboPpjTfYwe5usa0M8OC6LFod3TVIOAcstvIZdOTebsTCX4SzF9GY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Ewha/yPLLxmvHmGlxAfff0GveJwnvwZx2fI4u4GTZ6PlLcN2
	zDjlfAcBCjVqYSGOmcu3Jk/nrLsj+KZ1BhWV4RwgpKlW5pmeOSp7e67vd1MjEPmOPsVAchWzz03
	GzHEZqas9oU3rHnEOHrh+oKSTNN+80WpmCl+ZlFZS
X-Gm-Gg: AeBDieuNumMhn6DSnHpi8bWMC5r3rrzt5aDhF945DKXjKR1488on/p6yB+ZQigaPChv
	t5K+W2t1GiLgtK88FW/5Tq+whClfqg5+I4j9Nsuq/xHWx19V3EyZwH4l5mVVqdRCmgfzrg/lAs/
	3oD+TxJOPVLniXLOVjuDcuWanN5+Lo9p0D0L0NR0OSU4aTcR1rNfcW2GY8GVZVjDKiXyCAKfKkK
	0AhAlwQmtBRC2mDhupHUs1AWffIH+BoDDu7vdLD0IMBsD1Dj2N/egy3vQNFYyK8hVMG99l7JBJN
	CqpVqLGwv6QBg9RW9d0/bOIX22bs
X-Received: by 2002:a05:6300:8088:b0:39b:8dcb:f37d with SMTP id
 adf61e73a8af0-3a08d716acemr16416581637.17.1776809428374; Tue, 21 Apr 2026
 15:10:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-bpf-auditd-send-message-v1-0-10a62db5c92f@cloudflare.com>
 <aefnIw1Tx_2r5nkS@CMGLRV3> <CAADnVQJQxa+fHM9X8COc60ZMcxF0DMhWbtArg_gPynpbbg55TQ@mail.gmail.com>
In-Reply-To: <CAADnVQJQxa+fHM9X8COc60ZMcxF0DMhWbtArg_gPynpbbg55TQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 21 Apr 2026 18:10:15 -0400
X-Gm-Features: AQROBzAZx6KqlUgLuc6SEp8mHgK0_7ru1fA894kSMYQ0Oc1ORPoRRj_U35eYYmo
Message-ID: <CAHC9VhSo-M1wK2s2P0B+2F0pJqNguW7Kj-g63anp1xCMSBLa6Q@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 0/4] audit: Expose audit subsystem to BPF LSM
 programs via BPF kfuncs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Frederick Lawler <fred@cloudflare.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Eric Paris <eparis@redhat.com>, 
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

On Tue, Apr 21, 2026 at 5:12=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> On Tue, Apr 21, 2026 at 2:07=E2=80=AFPM Frederick Lawler <fred@cloudflare=
.com> wrote:
> >
> > Hi folks,
> >
> > I was accepted to speak a little bit about this patch series at Linux
> > Security Summit this May [1]. I'm going to use this opportunity to
> > re-iterate some of the motivation, what can be done today with BPF,
> > drawbacks, and wrap up with discussion topics. I'd love to hear feedbac=
k
> > from audit, BPF, and security folks to work towards a viable solution t=
hat
> > addresses shortcomings to allow for better integration with BPF.
>
> I don't think any bpf folks will be there.
> Also giving a talk about it doesn't make it acceptable.

I think it's valid to have a discussion with the LSS folks as they are
the ones who will most likely be interested in using the
functionality.  From my perspective there is still value in validating
the basic ideas in Fred's patchset and checking the value amongst the
LSS audience.

> It's still Nack.

Based solely on the diffstat and a quick look, this appears to be an
LSM patchset, not necessarily a BPF patchset; yes, there are kfuncs,
but they are LSM/audit kfuncs and not core BPF functionality.
Regardless, I want to see how the LSS presentation is received before
worrying about this too much, but your NACK has been noted.

--=20
paul-moore.com
