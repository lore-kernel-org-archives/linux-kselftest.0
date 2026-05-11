Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853153603CA
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 16:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515398; cv=pass; b=NoJaLjosGdMLRoqYXRlyyCxoqbekkwNg+A0QdYQZnHVrYt6uVUCaRjNu7fIwCnW+RrBQmLYh1uTOlyTo0aCmeA2FQ6NT9V0MtWdtck0Ua/o/OP/4eLRvbx9mdVbhmfIQViz0/pesleOo4AI/2XELmte8BzoGTRfXcN4uV+ZT/u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515398; c=relaxed/simple;
	bh=AuuaDDwSdRyrUMct4d7jjjibKHf0gx8tzrW/J2KjDZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+C7Tq/VFV0lEF1H8dM/7p7xraB8C8yD41t+kK1nXtxcGSsVdD9FnYe8KE7QpzjP90lktPWwc4wlny7VJqZ6Y280Pa89c/i10C0SX7+3ljUqBmmWxAfQQSxFXIWdxDRaxMnrh2nB0cny/ZRO5k5sLW2E0bTomM6Yh6Stjd0Xgc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vtQOLiYm; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vtQOLiYm"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-671588ab0cfso160a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 09:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778515395; cv=none;
        d=google.com; s=arc-20240605;
        b=dJCHMr5bCc8fwi28LQ/Fo43Hmu5kzAQIP4MIOcPwIqUCA/LBRxydmEzkpPRNT2hdl4
         2Vv+w4vwBCYFcnGOeFht2tqanChAQOHypWa0KCOdt+Q0mi7p97LXljP9Kh0Ee9NVk616
         HEc6Mz4kyUndmymaIlCAtKhiIASSESiaSuYmNFswXnUcAIhWj3cGGj8BjpD2c6+iKkjY
         5ncziQjwcB6ChLBF9fu4N9QHLBsMeYXlaizjPb6UwYxto2n/gBfHYuaBIP4UNOrh8OLK
         3mZimbmhvrAjxzBsvBPC6/VDfnmaSLLJXcTtUsTCqJ6IdtOtQW5vI32ez+L5K/njLCB1
         FqcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AuuaDDwSdRyrUMct4d7jjjibKHf0gx8tzrW/J2KjDZk=;
        fh=WR6gflsOpN0xiCqNwTH6d6t/b+2EsRPAkhEpHKwXhGk=;
        b=K2WheoOz0bAPMNtfuGvXShah9D/NBOKRfSXQNB/01f59xTKVlutW9YFfL1sSIgznnf
         2h0srSgiSi0hvcYTP6ToRvJRt9JurjP+KbPIHLw+KfciDcy7gZ20z2FI+8SLowVctpK0
         UjIEX2YGFrPjXG5OlHAUZosXjIoSTa/kSODxQyT0aAYjv0NpV83nDG39VKpmziBALBbz
         yaiBd1KU4UONywPAkQAdufk0An4GsJIqdiIxQUTJz+xJkZTAXUGRRLVBQGU/jrSg2gCR
         tbN8vs9SDIwmItHgjqIboal1mh0XUWqiJPVrZ9z9mFEjmRs7s9gAH26Cizb9h4av1TF9
         GShQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778515395; x=1779120195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuuaDDwSdRyrUMct4d7jjjibKHf0gx8tzrW/J2KjDZk=;
        b=vtQOLiYmOMq/cyX5N7uNtqsawE4AgDAxiHNAmtZmzNKFrVe5wI2Di/o0eO4a11+dSj
         8S4ymoNamVxaI1zlYvw+qMg20TEC5T7Iysc76iNFxWWF/jZQYd5W77r20QuCnVQGrtJT
         0GLkdkodF4dhsFm/8pPudlYDOygC6gG0b42f0ni3ceuDpREiYU6cWS/TRszFOiwayteV
         WarCD8x3ZI9nNHZ9/+dYNYhKXn18prrIl2o7Rn9CMxlXPRi3yuei4isAf0NbfNFMg1OL
         kct5xa7tNiXELXLyLZhfHL4r1fXU7kiUY822mRrXyyz0PqqWlfCEM09mlqe34Mq+YoTH
         TLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778515395; x=1779120195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AuuaDDwSdRyrUMct4d7jjjibKHf0gx8tzrW/J2KjDZk=;
        b=tHkijS7DLZNyAKqInwUcLByW5Qvy96rzk4xPIYnpaLeme/ghJqJx8n0tydSd1QmM+C
         gbXrA8GcbSxRdrtlxEhSvj7zaIeZHXT/j+uzHyK5H5EvZk227V1j2RQ6R1qU3fgnSUTo
         uxtO3WxJFQrGhGWCTEx1JtgkB/gkDOL4UfFBEak6ZYsGZUut5V6yEaAFHLJbz+lZpN8z
         5xZQiz0Qj0qrZYpjpk5mklkJzgleeFhL3AOfVHnf6aHwHY7TYQH7ioQXbAstdSQvz8jG
         US416RwTGqBSFNBVWfZlukRUNqEcFH36bt8vMZ29ZTsuFne84KG6LMU7doL0UKWMAUF6
         +e0g==
X-Forwarded-Encrypted: i=1; AFNElJ+hJ6fhybE0NUJA/n8mrV4GLNR4wQXoXNYQSXeLyytrbVmziKbLWG329gKdWRb/wIXf+VOeW6P6GNmQba8n8xI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm+ANojbMO3wQH9op4W1vxQIr5FDOWc+QFiVf3z7u16ppSuCtK
	CJJnRR/XjBMdnmHH9t/UevEFKGrxGPTGa96cR7vC5WvoVfW3Ha3ZOQEVS+sYmMtXjho0JJULbvD
	HC3RPq907pXBRsflAX4f0eRe28COf8yp7xPJV4h9h
X-Gm-Gg: Acq92OF3qtCUKCE19ByO165AcP+5yM2kL653zy1Dze0e8Ud9UWcGpmnJSM0vWsGi7ZT
	t0nfWPklgc7lC6ZMCjzLGQhffAv6S5oEtUrzE4rGpgCUhoiHrpgJibUYHOac9kTPa+lEXgAd+r9
	Ph6MBHuFoaGXA7SEuwZA9MTO+NLVoOA2WOKD8xyFJ1Uukp5up+8JG4LC8GHXDh23SId9AAXv5xA
	XN/crn7ci3MzmThMGgLiLBYsaODzdfchLE2rQ4eI81EuRuk1asaxiX3Ku/8+u6W3UBoYtn5f92F
	a+O2aHp7fIk8+oRc71zOxfA4TPY6d6QLoXCXkk3pgCS9Ozr3
X-Received: by 2002:a05:6402:4288:b0:678:cab0:4fef with SMTP id
 4fb4d7f45d1cf-67f5ab7d126mr133695a12.12.1778515393940; Mon, 11 May 2026
 09:03:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_863C8A01F3C81EBA238F375B16065CBACF08@qq.com>
 <agHmO4i4YUhs3cSG@lucifer> <CAG48ez1sLtSKVQLHbLO5usBgMgjyOGhbX29pKEfku4Ht05HffA@mail.gmail.com>
 <agH1ZSdX_7QF8P_I@lucifer> <CAG48ez17evhhcoDKF6AoPqzYZwGuFCkVAsc-0bBzevf0LHYNxA@mail.gmail.com>
 <agH7ONBSX7XLzS6q@lucifer>
In-Reply-To: <agH7ONBSX7XLzS6q@lucifer>
From: Jann Horn <jannh@google.com>
Date: Mon, 11 May 2026 18:02:37 +0200
X-Gm-Features: AVHnY4I2V_gElnqPN14yzCyNl2tB6MVkPAmUTaxoO8t6fLEorvR6VSpBkg8hWBk
Message-ID: <CAG48ez0y3N9uEOzvr4N85Js4XN1fh4JiUFjW=PQB2UZ_5t1R4A@mail.gmail.com>
Subject: Re: [PATCH] mm/mremap: unmap full fixed target for multi-VMA moves
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: fujunjie <fujunjie1@qq.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 6:00=E2=80=AFPM Lorenzo Stoakes <ljs@kernel.org> wr=
ote:
> On Mon, May 11, 2026 at 05:40:24PM +0200, Jann Horn wrote:
> > On Mon, May 11, 2026 at 5:32=E2=80=AFPM Lorenzo Stoakes <ljs@kernel.org=
> wrote:
> > > On Mon, May 11, 2026 at 05:19:50PM +0200, Jann Horn wrote:
> > > > On Mon, May 11, 2026 at 5:05=E2=80=AFPM Lorenzo Stoakes <ljs@kernel=
.org> wrote:
> > > > > Hmmm I think it's a bit debateable honestly. The ability to handl=
e there being
> > > > > gaps is a _new thing_, so there are no semantics to speak of. Pre=
voiusly
> > > > > mremap() simply required that you only span across a single VMA.
> > > >
> > > > FWIW, I think mremap() on a source region with gaps is such a
> > > > hazardous operation that nearly no userspace code should be doing i=
t -
> > > > gaps are areas in which any mmap() call without a fixed address cou=
ld
> > > > place unrelated mappings (unless stack VMAs are involved, which wou=
ld
> > > > also be a weird scenario), so to use it safely, you have to, among
> > > > other things, make sure not to use libc malloc() at a time when tha=
t
> > > > could place an allocation in the gap (which means you also can't us=
e
> > > > printf(), and so on, unless you have swapped out the memory
> > > > allocator), and make sure that you have no other threads that could=
 be
> > > > doing that, and so on. There are rare circumstances under which it
> > > > could be safe, but I think it is almost always better to have a
> > > > PROT_NONE anonymous VMA or such as a placeholder.
> > >
> > > Well, we're holding the mmap write lock so none of that could happen
> > > _during_ the operation right?
> >
> > Not during the operation, but right before the operation. So from the
> > userspace perspective, you have to know that there are no concurrent
> > threads that could be creating memory mappings at non-fixed addresses,
> > and you have to know that no mappings can have been created in the
> > memory range between when you checked that it's empty and when you
> > make the syscall.
>
> That's a very good point :)
>
> But I guess applies to any operations that operate over a range of mappin=
gs
> anyway (madvise() lets you also do this, though it'll give an error code
> _at the end_ _after having done the operations_ if there are gaps).
>
> So madvise() can have the exact same thing happen right? which is... fun =
:)
>
> I actually wonder if we shouldn't just change this to disallow gaps. It'd

That would be nice...

> simplify the code and we could even do the check upfront in one pass. It'=
s
> doubtful anybody is relying on the gaps behaviour for anything real.

(I remember that in the past, there were concerns that MM operations
with multiple passes are slow, but I guess mremap() is probably not
such a hot operation that that's a concern here.)
