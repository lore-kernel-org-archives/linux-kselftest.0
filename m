Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895533FA5FD
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 13:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779888373; cv=pass; b=jAfej8Ex75KSJkcBGSPfvFF5COIpyPdkk/KL1OGNKeUaVVqxd0YZoN5J2Q12sZhCS3pZ3tG7KWZaLAKodLhUDwO3jeJMzMf4jwi8x6zT9GQ763pj2n+N26/l1DM6wA/LAMtfPADdefCsCmUoBNv1tj3UkU3dNs385s1aT2BW01s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779888373; c=relaxed/simple;
	bh=7ISeUr5KwK2guzwwLEHpuHEOrOE+ak/mdqUCT/LiwMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=soFVLA7jc+fpxlkyfV/qg1iJmRd2DR7qgEIhyNq5QEJaPRxc2EKZtOqMig1h+VRcNetU20g+dB4/fC1RhqZRNzPhFo6X9gynQQWryE+nCcSR2ACJZRPUz9Tz1dShcbKrPc6cHW0nkwTxggVj6kp/w94zicpgu+J6+o0LbIkhbvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EH3MYEVY; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EH3MYEVY"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-516d6009380so4161cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 06:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779888370; cv=none;
        d=google.com; s=arc-20240605;
        b=Xl18N2a7/VX+tQwxq2r6oXsk2/5Fuyoyl3GQym5NKwfnCumo46iG7i8WcznZvq8BYt
         NrRKw2n3NztZEne/a6dQMtXCp3UtIL1bdPkZaedGt9qBGtsBff5jEDRbVLij8PjmQWfv
         Bwz0qU0+CE2VyzS7GbrQ4yolM8r+G0FJiW7pgN8BVOnHBDCqQx0HxFk4Kq6MI917N9Y/
         vlhxwIu0w1A8hP8SivYXrFK4kNolB652SFRAowBowc+zjTLjg7w6WRcpzkXE6TOaM/kI
         RdcN5v4wpHRKFZefR2tZgevU6yCG5bsrbu5dFgS3FfbUhY+sxzq6C2atni8gYi4XXOo/
         XhKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+PPKsSodR5IZsW2lR7kl0s1UGOrQ7Jx8Sr9pFqcYS9w=;
        fh=ux2kdfGTR37T+1Cn9kNadzLhsh4VWJM7eeLL3iLuDhY=;
        b=eTASuKK/mjWB28JhL1704gcVEsXGfjlGDXBx54Tm743EafCzfgzvPt5/Z/B6EDMpcg
         +uh9/KpipvLbhLAA8GszLpMgiOXwbLjhaIIpphe0Vzv/Gtt+vqZlP8sMkFH8xz8fID/L
         x9OBP7A/ACaH9u6TwRDeIk6YVLRL9xhMxlqAku2v/et0bDzM2D4yfLZrt0MpWXCIAzWU
         tuc9CmXvunROc3xt3TIX0+H4OzkziqhT2toMEfY2zm4KxZCOG6XNbsvYtNyYfGklc7es
         3VhFUjh4a27HU5KRsyTgbTSKo+uMEB5FoOIvOfNOTs/YHKhr4zxXIzNr2QzkWukPcBNq
         /7Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779888370; x=1780493170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PPKsSodR5IZsW2lR7kl0s1UGOrQ7Jx8Sr9pFqcYS9w=;
        b=EH3MYEVYbZf3g0qtEmZ2zVzxM4mW7Kq00zPtEnEpcffAVR9bmvrIS4pvBVGRTwvALy
         MyN4MIm9NRePi2QGitMlL4Ce4MyCNSfuA89Dz6/XO1v/wrzJ+Tyt6uQ9+8VU/Myj/Pet
         bbbg1o3PjGcMJIqVUquGXmq5i10yIo+Kips68P8mbc0WMape5Fyx0w8P2nBQECLENKKe
         lRTyZ38zfdB2vR4qudTe2EbzbzuY1TN3/Kwgd8g4PBxTCjvH6ffCz4WOCpkcgXzpp9u2
         OH9nrCFs2OZv3Dj1sM8YqnaRWnCYz7WccQ+1gfoPTVuYpa4moh3sHvxjdspxAoV0d3Hj
         M3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779888370; x=1780493170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+PPKsSodR5IZsW2lR7kl0s1UGOrQ7Jx8Sr9pFqcYS9w=;
        b=J1O2vxY8vtcN7fjhC1vxzH6mMPZNx7FUX0kegWyx+TDo8j7LWyCtDsdIv4sKZisD+b
         g7nJMCTlzwnasvRlFJkVc5yTZGjpuGK3CcBFSl3NrmyJxhEyT/MtfTX8mJ30ReRTMD4R
         Rjhd7wW7hYV2C/tYA6wgVB+0u/kLda9rpEEo7lGR/pDkEnJuPVpYnMXclbyTO5C8O42X
         /Xi/Gmveb8porgubslkD/aw1qv8qsLt/hryIYpQS//V667u8YUAnBqN919YdESIGQL00
         +TQK02aHNTMFLv6Y2Ai/DmAHpidxBsQ4jDctWiSa17Q1IMNpQhAZf41c6s4QqcPmhIxN
         VbNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dIsuj/Abvi6a/p46y/LYI/jLqwQoDilS8W9DSUehNypFDVMt06XNEgc4kuveKxCazBJsYrlyM42RGqnzeUXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPaVq5romryOKGRE9Yi/hqasWhEc0xPYYXy859Y8xem1rXI2LM
	JH0fD5MGxIXqfQAyVY6iZ1GKH/ysRJchGxR8iLswDDUpYuPTHQMwA/ovD6/pmx8IWf8vy8xKGWF
	kr9MXbzhhv6/eo8acUfJvo1R9zhB42Ll+w+l5o7Vr
X-Gm-Gg: Acq92OF6xwYRao4mBAfZ/Srq46afaIGlSKZCk9Ad+BrPmB6u6p8zgnLmz3U4ia1xikp
	taFuRJF4lG5WcLZjdCRDSu2bl3YNretaschkIFeo2Ar0z4k5WUO9mxfUQ2IweeKGoRmN0Onq7YJ
	jrKzElfOIGpbNmblYnIX10itnM7nvLO2xFpBi+GrSsBgxfJcFsZnrARkY69BubTzr49k27ySRP/
	7OzWTj5UYncQ7WQ76tLnTua/he8RNJGwizhPtdyWrWLWwoahc/q8DdYs/cKwibXu5RqXxW1Zpf6
	+g06IrgT/UCuABDLuQ==
X-Received: by 2002:a05:622a:5806:b0:514:b17e:86f3 with SMTP id
 d75a77b69052e-516e0dba205mr49179141cf.12.1779888369544; Wed, 27 May 2026
 06:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513224608.1859737-1-jmattson@google.com> <20260513224608.1859737-4-jmattson@google.com>
 <CALMp9eS4s9tsOmvDUDeqS7oph0mSHyhxBiULQdwHVaG+7gXLSQ@mail.gmail.com>
 <agXcKDjnJc9DPcyr@google.com> <CALMp9eS831M153QmAgjzJcR2dFY_wCCCzDisd7_T6GyS3-gAFw@mail.gmail.com>
 <agX2SJF3rJSkIqDe@google.com> <CALMp9eQTSxFkVf4vV83yNYvv2AjseHYiD3M68mcc951L4U1Jxw@mail.gmail.com>
 <agX5v1utAfyMadPm@google.com> <CALMp9eQqbHrcV1_WM+5xUR16OpGk+unxoZGi+=t55cqVhFgAfQ@mail.gmail.com>
 <DS7PR12MB82016B1B310BD994C83B35D294072@DS7PR12MB8201.namprd12.prod.outlook.com>
 <CALMp9eQ2SLq2bVngJ1RHEfkFe5yaTDrFxXT0KNTgBZY6WRMDbw@mail.gmail.com> <DS7PR12MB82011943131DF5415365E19E940B2@DS7PR12MB8201.namprd12.prod.outlook.com>
In-Reply-To: <DS7PR12MB82011943131DF5415365E19E940B2@DS7PR12MB8201.namprd12.prod.outlook.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 27 May 2026 06:25:54 -0700
X-Gm-Features: AVHnY4I0b8Xs3Wrm7OXdTuIdTzIeBHdIlZ4VMGY_dPKD2Og3YCofmBlb9Wgl1mg
Message-ID: <CALMp9eQi=-1S5A1KYgQd4=echbnA6eu+eM8+OyayzsGMGB72Eg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] KVM: x86: Virtualize AMD CPUID faulting
To: "Kaplan, David" <David.Kaplan@amd.com>
Cc: Sean Christopherson <seanjc@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "ctpence@google.com" <ctpence@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 2:30=E2=80=AFPM Kaplan, David <David.Kaplan@amd.com=
> wrote:
>
> AMD General
>
> > -----Original Message-----
> > From: Jim Mattson <jmattson@google.com>
> > Sent: Tuesday, May 26, 2026 1:39 PM
> > To: Kaplan, David <David.Kaplan@amd.com>
> > Cc: Sean Christopherson <seanjc@google.com>; pbonzini@redhat.com;
> > tglx@kernel.org; mingo@redhat.com; bp@alien8.de;
> > dave.hansen@linux.intel.com; x86@kernel.org; hpa@zytor.com;
> > shuah@kernel.org; kvm@vger.kernel.org; linux-kernel@vger.kernel.org; li=
nux-
> > kselftest@vger.kernel.org; ctpence@google.com
> > Subject: Re: [PATCH v3 3/4] KVM: x86: Virtualize AMD CPUID faulting
> >
> > Caution: This message originated from an External Source. Use proper ca=
ution
> > when opening attachments, clicking links, or responding.
> >
> >
> > On Thu, May 14, 2026 at 11:17=E2=80=AFAM Kaplan, David <David.Kaplan@am=
d.com>
> > wrote:
> > >
> > > This appears to be a bug, as most other instructions (e.g. INVPCID) t=
hat have
> > CPL checks do the CPL checks before the VMEXIT checks.  I'm following u=
p on
> > this internally...
> >
> > Did you learn anything from the internal follow-up? The ellipsis
> > suggests, "stay tuned..." :)
>
> It appears it was a deliberate decision, due in part to the fact that the=
 traditional flow of checking CPL exceptions before intercepts typically ap=
plies to using instructions in an illegal way, but the user is not doing an=
ything illegal here by executing CPUID which is normally a legal instructio=
n at CPL3.
>
> That said, clearly the behavior is different now between the vendors, how=
ever at this point the feedback I got is that our architects want to stick =
with the existing behavior unless there is a strong reason that it is a pro=
blem for SW.

No problem from the standpoint of nested SVM emulation.

The APM does say, "**Generally** [emphasis mine], instruction
intercepts are checked after simple exceptions (such as #GP=E2=80=94when CP=
L
is incorrect=E2=80=94or #UD) have been checked, but before exceptions relat=
ed
to memory accesses (such as page faults) and exceptions based on
specific operand values," but it would be nice to have exceptions such
as this enumerated.
