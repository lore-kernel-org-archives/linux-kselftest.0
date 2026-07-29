Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238883B0581
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 15:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340076; cv=none; b=CAj7ERaEozZDaRQFAKo+Ex1+K6xBnGgzVYdZeK2ab1PhKtt9CJIp41f7BFmCehLX0oNX8LCRwJAVylSU8Ddc0onFGkxfJBL2zDgndUokb8V2Tlq2qrKn8e+2r5Hiqv7kBwWlfddwuaXPaPaGsIql/ejCp2LXbnEk5B6th4kmd0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340076; c=relaxed/simple;
	bh=EXhgVMS0NxlxE5f0pFtmC2iT2ieedzhRX+u7Ni9PIk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R0/cmN5Vudq86lBLotUjnkwWD3D4WLJlnVjePSVxZsxytC2XHhOhFfEPJGcTg2GrR7koziqpFKTRk8joQ449RsdF/bOFa9sElMIVGtL0Ymav1eep6xJPMQQjeqp3fbhdAxKys1f8hEn1AJaGeDMYq62IEtPRP58FM4UTTS409Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OV8xTAoQ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OV8xTAoQ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69c1220bd51so1734192a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 08:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1785340073; x=1785944873; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fldeuHlUZsSgbof6A4RukHGxb8EkbZ80+aaj64d3jk=;
        b=OV8xTAoQxXUDo6xWyNB6bv7plWghUh/KVmswVMTKPsyj/n/R57TaB2j82DIsGGuK4C
         Hx3V3B+XX5YVX+rKw+up0JYcgfUkV3tZeiQGkb2VRHvNp6x7fC8/xtLe+Fc7C/NIVHVJ
         ZfqwGCY5hDXcAok7N/Cweil8ybB69cmnUFv0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340073; x=1785944873;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8fldeuHlUZsSgbof6A4RukHGxb8EkbZ80+aaj64d3jk=;
        b=c70aHmixpi0i2n+bG2ZvtU36PDAGnaqkTBapFCDpQ1ByaSBAOM1iZWI7YDCppn1hwb
         fakVmvZSV2oUd2lAuJdJB2bHSWw4Vr8HDNOeWk2vIVXk+oEUKdkyEDLVIU8Td/tC0xx4
         QCm5MY8VCRzmM582VLN/wKLvvCGd3UROyIwqg3LqoPueTVyABNjUhLYBX6b9DmFdNrdq
         zYk45kBqf3dpd2UpJHT2AoW5nDIt1HWt8AWCgf0IG7TDftrHdqkD5v39sepQE8USo+9F
         a6avdHCNg2m0IlDJ8BLt7mrtHUrfPk6487QxAYdqTPw60mcfCZq/8lDHEgeZ1/lFr3b4
         eUAw==
X-Forwarded-Encrypted: i=1; AHgh+RoGw2gMF1s+kMizkNatacE7VvJ3c3o/YNGUeOCjug4735uX5p9Z8PHendiSxISq12dKRqE6Bnt4tqA9j6x5yTo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkf9kNHPgvCUc1GoBfPUVFY0onDLuwCTvsocCfvEtJGXv9H58a
	W4qboQgaYDsAGA2hczK0asnboOe+MDHZjlzWKY5dbntG2ub3XMBy2DNjr2y5Yw04Ons/R27dABd
	lC4r+iS8=
X-Gm-Gg: AR+sD10BOjizzyyYfx6VgMcFB4xkz7o8YZhM3kgYXbhSqLQHejOD8o2X51bZt40mHHZ
	N9f32T9w+KMg9Bsc1Lqt9IcJVc8eb39pR8a6W3WTcHF2UbyBtctfgRdH6xFVWOjTQjVgvISXxel
	aPcCifTrmppFLFM5sQAZsg9AEfXh4zo365ReebkhalkJI9pAYNW6Quf/j9ICPGDUKklkB5tXE4a
	6+l0e3FKFhehs/p9qSMcm68DzNK+UFcWAaHOq322kYZdGxPAvTPOGMOfHKy1Nzukq/+j7tE742C
	xPeTRdr8aJKtDX6Z6rtdAwj8HM/L5+v29cCUki665N//3GAPXdw7a8p5VdK8f6ITh2ywp5+HGil
	qcHjlFYL+/9NwWgppDAiubvBk77yd/FYzedbNNzVjhZg/SppfGQeBrQerB0CAGqdnGsW3CP232S
	CkJEaUHV8hAnjLRTBNW+WsSSftEDt0AgJE/KlLdfDckhSw8f2Gwg0M/g/0XA3mek+k1RzD9+Xps
	TIfy4OGIvMPiOyadQvlIEwH9nhn8akvEdBCOw==
X-Received: by 2002:a05:6402:190d:b0:698:663d:d7bd with SMTP id 4fb4d7f45d1cf-6a034a5289dmr4023480a12.11.1785340073048;
        Wed, 29 Jul 2026 08:47:53 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050c4ac32sm1101662a12.19.2026.07.29.08.47.51
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 08:47:51 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69c1220bd51so1734125a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 08:47:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoMs/Gc7yy+atWwtZKeE1Npog/8oIrMLjcIpBzXEV/Cw6hsccg1BJO06fZmxjxAUaFL5MaNFv4E/A6VytTpRTA=@vger.kernel.org
X-Received: by 2002:a17:906:fe47:b0:c15:bea2:d209 with SMTP id
 a640c23a62f3a-c1f7215dee1mr360497966b.4.1785340071289; Wed, 29 Jul 2026
 08:47:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729005959.3853865-1-andrey.grodzovsky@crowdstrike.com>
 <20260729104114.04298a48@gandalf.local.home> <CAOu3gNgc0XHScgEf+yWF5Kr8sAm8Fsa4RBuwL0YE2EscSiBPrA@mail.gmail.com>
 <20260729113136.32af2a4d@gandalf.local.home>
In-Reply-To: <20260729113136.32af2a4d@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 29 Jul 2026 08:47:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjzHTuomhTegkD69veDVRxprX8NB=i7A+BEB2-v6v5n+g@mail.gmail.com>
X-Gm-Features: AUfX_mzh3d70XkZOQ8mPTBmYgVx50lGXSyciETgOqHmLrGk5Ua4q2GHqtff665s
Message-ID: <CAHk-=wjzHTuomhTegkD69veDVRxprX8NB=i7A+BEB2-v6v5n+g@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next 0/3] ftrace, kprobes, bpf: mark
 trampoline/kprobe ftrace_ops permanent
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, song@kernel.org, 
	jolsa@kernel.org, naveen@kernel.org, davem@davemloft.net, mhiramat@kernel.org, 
	stable@vger.kernel.org, linux-open-source@crowdstrike.com, mbenes@suse.cz
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Jul 2026 at 08:31, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> > > Honestly, I would love to get rid of it as today ftrace has proven to be
> > > rather stable. But as it is a user space ABI, I'm not sure what will break
> > > if we do. I wonder if we just make it a nop, and print a message to dmesg
> > > saying:
> > >
> > >   "ftrace_enabled no longer does anything. Please report if you need it to."
> > >
> > > ?
> >
> > Thanks Steven, if you and/or other community members would approve such
> > approach I would happily do this instead for a few reasons -
>
> It's actually if Linus is OK with this approach.

The rule is always the same, and I don't understand why there's any
discussion about it because it's been stated a million times: we can
try to make any ABI changes at all, and what matters is whether it
breaks somebodys setup.

If people rely on old behavior, it can't change. And if people don't,
nobody cares. It really is that simple. That is literally the
DEFINITION of "don't break user space".

Whether something is user-*VISIBLE* in theory is entirely immaterial
except in the sense of "be careful, this needs testing and may have to
be reverted". So user-visibility isn't a "don't do it", it's a "do it
carefully, and knowing that you may have to revert immediately if
somebody complains".

So changing user-visible things is potentially a lot of wasted effort,
and needs loving care and follow-up.

So everybody should typically avoid changing user-visible things
because it's potentially painful and developer-intensive, but not
because it can't be done.

All that matters is whether real user workloads regress.

And please make sure that any changed behaviour is really obvious, so
that people don't spend lots of time chasing down *why* something
broke. A kernel printk is generally way too subtle - and no, the
tracing "make the printk extra ugly with crazy ASCII barfics" model is
not an improvement.

It might be better to actually return an error to user space so that
users can see that setting ftrace_enabled to zero failed and it would
show up in user logs. kernel developers may think that kernel logs are
important, but users seldom even think about them. Of course, that can
then cause even worse regressions, so there's a balance here.

End result: don't do user visible changes unless you really really
care. And then you spend the extra effort.

               Linus
