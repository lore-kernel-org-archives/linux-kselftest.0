Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1C832B10A
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 15:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783439280; cv=none; b=bhRYSyOXTG3E9Zs52xJm/mSUnf184GNElvReH011F1wtoVpvxeHJJJ40c2z8r65vTOTlu/j7NM1n3lF2pbOyomDpyyYfQpKaNtxxDsqbx3cMp7W8jfb804WumTkwQqc6k+R6Fhi65/rcwAgxYTSoLwRoshCtjxRCpoMXcFYHJ5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783439280; c=relaxed/simple;
	bh=HbMq234Uyb3E8674h9zi3dcp6D6Ew7FJR1STGkpFODU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N56yW7TU5SvfdrDL/Wqi21NlBd/biOzI4jZKfSFZlzWHR50R/cqgnKgTuoCCQmERDnAww160DsAFp6E+UxJF8wR+aVpWbp8HQYa0Ufh36oLtVvNnUpl04B+Yr50/SVviWDV6aTMEk5nLtxOBlKBUVdKn2PCHuBJcXE9D0fpT/Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dgnMkIWN; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dgnMkIWN"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-38101e6fc6cso8332466a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 08:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783439279; x=1784044079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pnbZL8GFknsSmfGkHHwg+LoF2mVzXx5fw5O3ZG0ZY88=;
        b=dgnMkIWNh9r3jJ5bQCXAGHu+u/dw1KR9E7SHBPeFPo5GXsQSx47dx+jYDe5A7Bw+VK
         SMTe2H5nJ7L5nxrLcLZpK3lGBwnEmawF5mBKB6jwF9AAbGBuyJG1+w6NSCggU4FASMNb
         7nCXe2sY9OP+0QbLtiPyo4cV0NbmV797U5K4l+mpM+eLgD5aRpMQUJHD5PsdXx3j5CHr
         tgRIGehFWzbAklHu9GMhEeQB51klivY2Y5XCSmjdE8qM+p0e77ncJZ4pKIUwGLvtk0dK
         b43dgQg4rDfsbSr7q6sEMzU10UKe1Fm7oXiBjgABhvGV14gWGAGG5Y4QbC0v0C4+oCGS
         UL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783439279; x=1784044079;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pnbZL8GFknsSmfGkHHwg+LoF2mVzXx5fw5O3ZG0ZY88=;
        b=m0oNHQuxFC2DRcIecMsVcBcST+ZNvAfgd/zGaPi/24Sd9ADalkEUQ8c4dNWTeyFxgQ
         dsPAnH/mAD8iMjG1/ZGvRS/V626qbzikqcUM/8H164uysYFuQLsO+R4mU8B41OonMo9q
         k4Uvmin9ZLAmuRIqWlEEzQEVM5n18iZarnDh1RKKpX9X9UwfZp7cFx5FZ+/IF5uEm1+L
         PBQgUmxMZ2udRbMbKnjATuCyfYQjAUTm4tF3KTfqzHXFW16ZhEhIGCIA7VhPgknmoU3L
         lRyYKFEFUYlJHPqfGYNNOamstKTcNdihJwLVRdM2d1Z8UmY/Rodx7yF+1yBM/7MYIprs
         +3wQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFnHy7P3CvwS6c1/MXjaOCpVvUo+H30yGm86lfKHXn+igSTX2J6U9GmO23Skqw2du/rSX+WcYpQ21zR4ofz5M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxng4JccFOVmlzBMT2V6+KQjbZ6QmYt6SpD+gKaiWTR/j8mGDIB
	J/0+EQ6Ojc7GKY0pQCBAA9GS7PVHw4Vz3FOS/kqRFMHyEAa6R1bLBVXRrEZfkHCmw1sJf+WQoex
	wv894vw==
X-Received: from pljc4.prod.google.com ([2002:a17:903:3b84:b0:2c7:ee2a:a90e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e18b:b0:381:854:dba4
 with SMTP id 98e67ed59e1d1-38758164250mr6197519a91.20.1783439278489; Tue, 07
 Jul 2026 08:47:58 -0700 (PDT)
Date: Tue, 7 Jul 2026 08:47:57 -0700
In-Reply-To: <CALMp9eTK-Dg24geFN6tnkoD3rc4ct6eZcHCBv3EvPYOhBvaFaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CALMp9eSLH7pT7X22es+AotxhRMQ1VyziWWELQu6_ZRsyuQ=xzw@mail.gmail.com>
 <0e576fd8d8cd2ed1739cee36eba393fea7745506.camel@redhat.com>
 <f70b4a3b-1ac1-4269-ab7c-0ed1fb42c357@open-hieco.net> <CALMp9eR5jVLGeQck89kro1ocEX5aZcovdGMK+fuzXjqK1NR7kQ@mail.gmail.com>
 <d5645a47-c346-4e63-a5c6-c88bb39a3ee1@open-hieco.net> <akxwt1mX6blSnkxI@google.com>
 <CALMp9eTr0iJ5QgbZJ0YtOZg89XVFSesbyoGGdtkz+f8c60DcDA@mail.gmail.com>
 <CALMp9eQXGYevLQJnEV+Kx6hvp84vPQ=2U8AfZHiZrZj=CVM2hQ@mail.gmail.com>
 <ak0QYnYvchKTnwxS@google.com> <CALMp9eTK-Dg24geFN6tnkoD3rc4ct6eZcHCBv3EvPYOhBvaFaw@mail.gmail.com>
Message-ID: <ak0frVw7GZ3HTwJV@google.com>
Subject: Re: [PATCH 0/2] KVM: nSVM: Expose DecodeAssists to L1
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Tina Zhang <zhang_wei@open-hieco.net>, mlevitsk@redhat.com, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	zhouyanjing@hygon.cn, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2026, Jim Mattson wrote:
> On Tue, Jul 7, 2026 at 7:42=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
> >
> > On Mon, Jul 06, 2026, Jim Mattson wrote:
> > > On Mon, Jul 6, 2026 at 8:25=E2=80=AFPM Jim Mattson <jmattson@google.c=
om> wrote:
> > > >
> > > > On Mon, Jul 6, 2026 at 8:21=E2=80=AFPM Sean Christopherson <seanjc@=
google.com> wrote:
> > > > >
> > > > > On Tue, Jul 07, 2026, Tina Zhang wrote:
> > > > > >
> > > > > >
> > > > > > On 7/7/2026 9:32 AM, Jim Mattson wrote:
> > > > > > > On Mon, Jul 6, 2026 at 5:02=E2=80=AFPM Tina Zhang <zhang_wei@=
open-hieco.net> wrote:
> > > > > > >
> > > > > > > > I will take another look for the next version and try to ha=
ndle the
> > > > > > > > remaining pieces properly, while also making sure we don't =
expose stale
> > > > > > > > or incorrectly synthesized decode-assist state for emulated=
 exits.
> > > > > > >
> > > > > > > Naples erratum 1096 seems to imply that the instruction bytes=
 stored
> > > > > > > in the VMCB are not necessarily the same instruction bytes th=
at were
> > > > > > > fetched and decoded to lead to the #PF/#NPF. Hence, in the ca=
se of
> > > > > > > emulation, it might be sufficient to read the instruction byt=
es quite
> > > > > > > late in nested_svm_vmexit(). That would certainly simplify th=
e
> > > > > > > plumbing.
> > > > >
> > > > > The plumbing doesn't seem all that complex though.
> > >
> > > What about the case of a userspace-injected #PF while running L2, whe=
n
> > > L1 intercepts #PF?
> >
> > That can/will be handled by the fallback logic of reading the code stre=
am on-demand?
>=20
> Could be, but I would prefer consistency.

Not sure I follow.  Consistency with what?  If userspace injects a #PF in r=
esponse
to an exit from emulator proper, the emulator context will still be valid. =
 If the
#PF is injected for something like X86_WRMSR, X86_RDMSR, or MEMORY_FAULT, K=
VM will
fetch the bytes on-demand, same as it would if KVM itself synthesized a #PF=
 that
didn't originate in hardware.
