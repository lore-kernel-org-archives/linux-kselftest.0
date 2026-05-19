Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F10371873
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 20:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779221933; cv=pass; b=mYNEIrqULHpBsnu8EGW/7h+DbYMM9pPzoAFBnYPXULoUorASeA7IlG5njBHq5/wbFnQ+97g3jxqO26iqZpp+h5OY4SVVNbYaJTHAu6JKcdFgwhFn6Zu4H57BelelSEufXdzABEOp+/w8ed3Ojsi/7V216z8F+5ua/OxXXgGR6O0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779221933; c=relaxed/simple;
	bh=qIwGtbbIYOUjCYL0DiEfUhZ2+eW3Zw2GTvfO7SWH0AY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXCuGUJG+obvNT4MuIyb+Rn4ZX948cWDzAVggqDcwWIBWhzLfbMw1ddbTRd1ee7pd25viWV6mByJMgP1nYm+8ecvwZF3/BiW30YbIXXEGpr8vZ7uhcyE/QeGGlO1IwbeShniljkIBjmV+jJke1YE/Jo9/i0RGiUtRPtNG9NA+Hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BIQXhuUL; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BIQXhuUL"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-573a81abef0so3050460e0c.2
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 13:18:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779221931; cv=none;
        d=google.com; s=arc-20240605;
        b=EX+tqHAYCt9WdiG/0Z1qk4kOetwghlTBiKqm2rrnaeakZISYAOCZLOWF7ns8YRNxEY
         MBV9ub579Az3KxPpTU/5P2kkfIazo8yBsjbmBcqRCVG3IUbL+HbQ2yxFlIICTMYdOGZz
         GMjZa5k/gCKuxmNIP9E34BubHbafMnKBqjjX7YajiovONnFT8FBOv5KL4OvPXDxc0kH8
         FEnUiV4PjJ8NSZeBHo6gD+rU2BXqWTr8GPSQsrEGmX91WhdO5LgBaU07b0jBT56ITfZ8
         ZdG/nGpzYzVQ5PCmsk8vdyv5aZ0ImRTO59kMzIccpt1Xp/5PYyK3OhSmuMQGvJAdv1Ke
         akag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=aR0ZMyUG0ozy7DkHe3z0/p/wjZOWH9x6XEkI9PUqxBQ=;
        fh=2vl/WQsRl7G3IyUy55A99xy9z4DsyPRNe6b4iVskUNE=;
        b=fU2eHi5KWHlFQjmrkWUAs1+cOc1rzOV9BKxWV9Qdv9j92tk97shBraXBeKoG/WhX57
         UyOKDjMw91Gs6nCLI8xJXPuJC9qJ2HGPSZhz9yRGM4OXK62wcVKDkadIoNFALDCkAHQp
         weR3ViHjX1vZEOFkHgZMl7/dpPlZnRmlLQ+OTzRmdzP+QVedTPZiPV69L/tRsrwqHTgf
         eDhGlDv5vkDbrJSUONcUWsDOT0N3V1LPnzCYIh0xexzQBqBY2XtMx+05L0FrkMp7gzp2
         9Xsi4gbdRyh+JpcVVEoZuqvG45VdGQrG5PzqGtt3Q3YdHoAiHQIN5CauFWuAdnML3kGl
         3Ujw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779221931; x=1779826731; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aR0ZMyUG0ozy7DkHe3z0/p/wjZOWH9x6XEkI9PUqxBQ=;
        b=BIQXhuULMNWYjAVkHUVU6ySKL7TXZ96TBcXdDbXCb8dJ1c87V4oPyigq50MrGLqXBM
         HpPF++ne5ZQl9LWNnuooZvI14vcBX2U4+5qwf7/HX3m2c4eXe9l1unwWFebjubNYd7Z+
         u/l4uY6Z8ddLmpkrMd4i3xBaNElHMLhc6Enhk1uE69pg7Y8Pm4q7stOyYUgsMpfTAytK
         33v0nPjSc+UvJN7Itgip/3jEc5GDPNBULvIJ1GP9aND8PJDK7kr9ZVdo775W9DSLWfx9
         LHgdV4COxxbRaJhgyt7sU6y2Y1ImwYSkDV8Mb8B7b2jWB8/iLm7Ww54JJo058phJit8J
         BbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779221931; x=1779826731;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aR0ZMyUG0ozy7DkHe3z0/p/wjZOWH9x6XEkI9PUqxBQ=;
        b=Y+PT+tfSfxFKaZKjFzChL+dTj/hQe2N/2eJyTVSSSnthd4JXHs91ZvTUiHHMszc57t
         t/hAChVfugAjetcyx+r3KWi52Bgkhe2mg36qJoCJqRdVgaEryC3JAgUxz716BqSDREHA
         qKXrnw5VeWNCizxETLx77MHaUqBj+p2P5TpFisA53ke5/Y1Tc7cnlIRwEZ1b2ttRQIH2
         Khd1c776CMULT7LUSiqNuFZ4UpZNaRSvAwwfJUbbhIR3Pi3SABJvRn0Xf8WWTvG+HVEC
         JJhDioz2aAsuPZsb6gg+vYLTSpn4wQUBHkqIvFn3mtJvvj4cwBb5DhGsLVxLDJ4CCyJi
         tLxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9brtBro8PcOvEUhERwuwTKwO+spRcfM9RA78O1UL369aOrB6HDbngtS6GWSqt03VVSTvSyFD9pY/0QScdyLBA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy27zS11Fmosqswa7M3v3JhrRyVdYy6kCgLpsDrRDRFI6GeQUJZ
	gJhx1XxZ3W4+C9ncHtz9Oe6dRWwNU8E/KC9nEfxZD66LZopv+U3Lh94L7HfYFNo46YuCFoM5p5q
	VRM3B07dtECleljh6+u9r09dCxoTHyWo5D2WkWuJa
X-Gm-Gg: Acq92OElw4nd06cnjqcaJxkFDYit2qqxF9LvBi7u1GKYy8dbiFdAz5vydFDk+DHwQrD
	V8WyZh4nUK9nPhkS01nXxr9p1I1TH7iLQ5R8CrdJrvNGbU6w8gBpKvINIEZ1ERCCRKjC0sovUqk
	NYZZMz3MPf3Mc9e7/1gE/uh0+mPZ2Ns0Sgp2sYK3o2yMir4pXKI90fbfEp6o4WPl/98qxP8WMw5
	kRa3elyBD7SFNn6njFo3oa1RoFTu1jDX4Hs8so0z0F8OBLkgyItRakTzKYbn4KWMArcxpr9mMW+
	1zJuZ2SD1Qkka7+agS1gkgjbdvgLeY5x9K4XnZxD2uS90nsP46x38BXkf7suegr/C+GOodigG5b
	sPBPR
X-Received: by 2002:a05:6122:3b87:b0:56d:9f2a:d6b1 with SMTP id
 71dfb90a1353d-5760c094366mr12403209e0c.12.1779221930921; Tue, 19 May 2026
 13:18:50 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 May 2026 13:18:50 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 May 2026 13:18:50 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <agOMfpW2Xxpzk-D5@google.com>
References: <20260414-selftest-global-metadata-v1-0-fd223922bc57@google.com> <agOMfpW2Xxpzk-D5@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 19 May 2026 13:18:50 -0700
X-Gm-Features: AVHnY4IUGrkVyn5ZtSAcdF_mZPpnt14rYBEsp_-8E5dO-1OBvH16aNRh83QJgZ0
Message-ID: <CAEvNRgEpy+d=KTSVcO9svAS9asHCDcwctGo=9PAaFVMUCd-Wrw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/4] selftests: harness: Provide global metadata
 pointer to allow clean teardown from selftest libraries
To: Sean Christopherson <seanjc@google.com>
Cc: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
	Shuah Khan <shuah@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, thomas.weissschuh@linutronix.de, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Tue, Apr 14, 2026, Ackerley Tng wrote:
>> Sean suggested using setjmp and longjmp [1] to back to the top level
>> TEST_F(). I looked at [1] and found myself wishing to use TEST_F() the from
>> kselftest harness directly.
>
> Can you elaborate?  If you have a need for direct TEST_F() in KVM selftests, odds
> are good someone/something else will have a similar need, sooner or later.
>

I guess I like the consistency of working with TEST_F(), there's also
TEST_F_TIMEOUT() and friends and all the usefulness of the rest of the
kselftest_harness as you described, all of which will probably need
re-wrapping if we proceed with the approach of wrapping.

>> Also, setjmp/longjmp felt like it was introducing state that could be messed
>> up easily.
>
> Meh, same goes for the kselftests_harness.h.  I can point you at a half dozen
> bugs where enhancements to the core framework wreaked havoc for unsuspecting
> subsystems.  I'm not trying to throw shade at the harness; there's a _lot_ of
> goodness in there.  My point is that doing complex things that impact a huge
> variety of downstream users is going to have many sharp edges, regardless of
> where the complexity resides.
>
> I'm not wedded to setjmp/longjmp by any means, but for me this isn't a compelling
> argument against the approach.
>
>> I also found recent work that removed setjmp/longjmp from kselftest harness
>> [2].
>
> KVM selftests don't support building with nolibc.
>

Not particularly against setting it up with setjmp/longjmp either, I
think the discussion here is mostly between

1. Wrap kselftest_harness for KVM
2. Improving kselftest_harness so KVM can benefit from it

setjmp/longjmp has already been removed from kselftest_harness so that
option doesn't make sense if we go with (2).

If we go with (1), I could (a) store the _metadata pointer in a global
variable within KVM or (b) go with setjmp/longjmp (c) some other
suggestion.

>> The kselftests harness is running tests sequentially anyway, and the
>> function pointers in _metadata wouldn't be changing all that often in most
>> selftests.
>>
>> Would maintainers be open to having the kselftest harness expose a pointer
>> to the metadata globally?
>>
>> Another option would be to expose the current teardown function pointer
>> globally instead of the pointer to the entire metadata struct.
>
> I'm strongly opposed to any idea effectively requires special casing KVM selftests
> in the common harness.  In my experience, the common harness is already quite
> brittle, in large part because there is no singular maintainer(s) that is responsible
> for ensuring changes work for all downstream users.  Adding odd bits of code that
> is only ever used by a handful of KVM selftests is only going to increase the
> probability that that code is broken.

If Kees likes the idea of exposing a pointer to the metadata globally,
does that make KVM selftests less "special"?

If the community likes the global metadata pointer, I could update the
harness to adopt the global metadata pointer and then KVM wouldn't be
special at all.
