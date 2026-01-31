Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1FA2C17A1
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Jan 2026 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769876204; cv=none; b=X81dgxG0QrsPDnjAtX/QoZdcEg1IM+QRlz3ioBosSBVOY7uuUKnudEpvQrMKM19fQpjTqpSEupL8+JDyeJ2HhyfAF1esdnJrK/RZbwjaSbKm/PdKNONav6xwpXbhqJ/0RuH3Hun6W3bgITCU6jp232UGjB6DWFPjx0oFRfo5tFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769876204; c=relaxed/simple;
	bh=VK9Pa6bSVZ2wX0vSxdh8PA9o16ssgUDKLaI9IEgywCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p50aTQUgchhGXce0Uhvgt3Vmy6CZYqWE/JkaIQwsN/ozJ6jutn6jqUkQW9Fj4j1NxaNvObLecpo3D75ILw5uH304DXr7iNXf959ElQHICUmpy86TeOVxxRH40Xq/RN8ia6hG1bphK2E+QrkpALiPui2MKqRWh3YZu/mpGxZLE8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJ7OVUD1; arc=none smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJ7OVUD1"
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-88a367a1dbbso46530866d6.0
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Jan 2026 08:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769876201; x=1770481001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZdfjr2YBB6Bg1S9gnKxkULsiC0x83ebbFEXgtKWVOQ=;
        b=NJ7OVUD1pA1QKFXc0lzZ838WyFQeOg3YXndf9vksmchuUOqZKypnHvk31JP5bgWjRo
         EbK1NhXf++9002Y3mV6KZ4EZdBhNi5+p0koURPA4t2QRuQm+RDd9cmweb9WJ9nZNFD9a
         9+qJcYR5MHm10hjHuyupmeUO1ONgqra2HjFL3BLp10dsk7O9R5tp92JmaIaBVylUG0HG
         Ju/aFZVBFAkyrJDUc3wjHuVTQo+d0j5alKTlwW5ptlumLOmDgmx+W/13+L6FwdTOCOOY
         RSBskJ4IkmnPjCFZqtLDv6T+RbHuZHDXKE7dkKp0qLClytN0WDE3bewrko7GCqMt+IGj
         R1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769876201; x=1770481001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZdfjr2YBB6Bg1S9gnKxkULsiC0x83ebbFEXgtKWVOQ=;
        b=ttIvLgxH06XeCeCN0wepRiLiwX2KYIEYEsZOBhEzbbbten/absVyuGlNdJI8TmkR9Q
         UmPB78MBt1kqFizb2h/hne0Vym082L2xdtlyDtC7ME7d1ysGsxc9sOtT6wwfRV7IVDae
         6Oc1xy50S2ldoh9L6R4ndfCyarTjCv/wNV6LYWjwuNXHGjRNuASraTSHYQg1dbeEYOl2
         4L92VF5aZE/C2CttWZc7/c8ze8afnpXlJoyv1mcBZhzENutjrszhhDpT/eZAUc8lvQUu
         PaEg5rh6mDpgblj+5NRs8g613+6xhOuPU11JEMeUt854oDX2Bf26gE/SOdgtJ6etAQYe
         Xr2g==
X-Forwarded-Encrypted: i=1; AJvYcCUaBB11ynAzln/oBzi56cN0OiKVMsyxSOlK4N9pLc88+kG9ArrJGkjb9fb6SyOYbcwM6c3sPgN1gyf/6QLVASc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyskHK9O5HZZpAhHPy+usboxZM+UMgtJqgV/b1dMhGqKW/LsTA5
	EkAhB0QTPhWq4SO3h6F6dpIj3cy1GoNWS0B+9ypol1dDtdUAAVMu7Cl9
X-Gm-Gg: AZuq6aJYqwHsvdtTZySBWnK4wbALPROB3p97AcjXbqsoaQEYfui3z1WswLMrXwhvaFY
	+ph+srrDOqRkeXe5JVncUtxifPawbfJvDbjMVHMu78gNqqTb7HUiTS+Yx89YOaU/FvwNtBIfNfz
	e/xkJRjiMgdYu5/ZRYTJ3NMp86H9XSt/20pmL5UGwcBdKSqRescn1h8zstzYgOjn53orQfUzPJK
	SF9O5vkGNlZK4yYsz1aEg4YqLBH9pQFKd1uT4BUdcLR7MlZIXcDfckGh4EMYE63/Di3GuP/TNpR
	9mwPmUG4DT4oGXBGIUQmVFH+ZcNOf/JxjFaoQso4noTXigw8/unJM2y2G08hG7IVCCoDZcNyUne
	ZYKyKWLI/eTCy/kLkHaqn+0ByV0eEiEiWGc+3V1i1DnVg7HrZJLAqhrtRkUPx9GQgoxugBoNyUe
	2YDGYmy4dO7a9hz00J9Rrt6JMl1D5zQTuBXjIgSP37MMA=
X-Received: by 2002:ad4:594c:0:b0:894:7322:f1c6 with SMTP id 6a1803df08f44-894ea036009mr91543476d6.34.1769876200574;
        Sat, 31 Jan 2026 08:16:40 -0800 (PST)
Received: from pc ([2600:4041:4491:2000:27cf:ceff:6f56:5b3e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d37412d4sm84497356d6.36.2026.01.31.08.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 08:16:39 -0800 (PST)
Date: Sat, 31 Jan 2026 11:16:37 -0500
From: Seokwoo Chung <seokwoo.chung130@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, corbet@lwn.net, shuah@kernel.org, 
	mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 v5 1/3] docs: tracing/fprobe: Document list filters
 and :entry/:exit
Message-ID: <ttsritlbnf5tpqvwcje3wgcjiri72thxo56c7y4ppjkpnw2c2d@tjvwfmxh2c55>
References: <20260118011815.56516-1-seokwoo.chung130@gmail.com>
 <20260118011815.56516-2-seokwoo.chung130@gmail.com>
 <20260120155340.2dac7fab@gandalf.local.home>
 <wqpijkdwziafpuci6js5mtfzro46bre4z7une547crcdzrlm67@kd4fgea5m6ov>
 <20260129093508.5064b3782a40811cbcd8cb7b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129093508.5064b3782a40811cbcd8cb7b@kernel.org>

On Thu, Jan 29, 2026 at 09:35:08AM +0900, Masami Hiramatsu wrote:
> Hi Ryan,
> 
> On Sun, 25 Jan 2026 15:23:17 -0500
> Seokwoo Chung <seokwoo.chung130@gmail.com> wrote:
> 
> > On Tue, Jan 20, 2026 at 03:53:40PM -0500, Steven Rostedt wrote:
> > > On Sat, 17 Jan 2026 20:18:13 -0500
> > > "Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com> wrote:
> > > 
> > > > Update fprobe event documentation to describe comma-separated symbol lists,
> > > > exclusions, and explicit suffixes.
> > > 
> > > Usually, the documentation updates comes *after* the changes.
> > > 
> > > -- Steve
> > > 
> > Thanks for the comment. As you noticed, I sent another patch since I forgot to
> > put log. That said, please let me know if you want me to continue on this
> > series. My apologies on the ordering. I noted after Masami mentioned but I
> > misordered when sending. Thank you.
> 
> Sorry for replying so late,
> Can you fix the kernel test robot's error? I think it is almost done.
> 
> Thank you,
> 
Hi. Thanks for the reply. I will fix and send the next version.


> > 
> > Best regards,
> > Ryan Chung
> > > > 
> > > > Signed-off-by: Seokwoo Chung (Ryan) <seokwoo.chung130@gmail.com>
> > > > ---
> > > >  Documentation/trace/fprobetrace.rst | 17 ++++++++++++++---
> > > >  1 file changed, 14 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/Documentation/trace/fprobetrace.rst b/Documentation/trace/fprobetrace.rst
> > > > index b4c2ca3d02c1..bbcfd57f0005 100644
> > > > --- a/Documentation/trace/fprobetrace.rst
> > > > +++ b/Documentation/trace/fprobetrace.rst
> > > > @@ -25,14 +25,18 @@ Synopsis of fprobe-events
> > > >  -------------------------
> > > >  ::
> > > >  
> > > > -  f[:[GRP1/][EVENT1]] SYM [FETCHARGS]                       : Probe on function entry
> > > > -  f[MAXACTIVE][:[GRP1/][EVENT1]] SYM%return [FETCHARGS]     : Probe on function exit
> > > > +  f[:[GRP1/][EVENT1]] SYM[%return] [FETCHARGS]		    : Single function
> > > > +  f[:[GRP1/][EVENT1]] SYM[,[!]SYM[,...]][:entry|:exit] [FETCHARGS] :Multiple
> > > > +  function
> > > >    t[:[GRP2/][EVENT2]] TRACEPOINT [FETCHARGS]                : Probe on tracepoint
> > > >  
> > > >   GRP1           : Group name for fprobe. If omitted, use "fprobes" for it.
> > > >   GRP2           : Group name for tprobe. If omitted, use "tracepoints" for it.
> > > >   EVENT1         : Event name for fprobe. If omitted, the event name is
> > > > -                  "SYM__entry" or "SYM__exit".
> > > > +		  - For a single literal symbol, the event name is
> > > > +		    "SYM__entry" or "SYM__exit".
> > > > +		  - For a *list or any wildcard*, an explicit [GRP1/][EVENT1] is
> > > > +		    required; otherwise the parser rejects it.
> > > >   EVENT2         : Event name for tprobe. If omitted, the event name is
> > > >                    the same as "TRACEPOINT", but if the "TRACEPOINT" starts
> > > >                    with a digit character, "_TRACEPOINT" is used.
> > > > @@ -40,6 +44,13 @@ Synopsis of fprobe-events
> > > >                    can be probed simultaneously, or 0 for the default value
> > > >                    as defined in Documentation/trace/fprobe.rst
> > > >  
> > > > + SYM		: Function name or comma-separated list of symbols.
> > > > +		  - SYM prefixed with "!" are exclusions.
> > > > +		  - ":entry" suffix means it probes entry of given symbols
> > > > +		    (default)
> > > > +		  - ":exit" suffix means it probes exit of given symbols.
> > > > +		  - "%return" suffix means it probes exit of SYM (single
> > > > +		    symbol).
> > > >   FETCHARGS      : Arguments. Each probe can have up to 128 args.
> > > >    ARG           : Fetch "ARG" function argument using BTF (only for function
> > > >                    entry or tracepoint.) (\*1)
> > > 
> 
> 
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>

Best regards,
Ryan Chung
