Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5081E3009ED
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Jan 2026 20:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769372604; cv=none; b=pWp6mcO6AM6355VjQx7/kL9Da8sQ+CUJIc9KapEnagXECiMVMYGS2svBZOVnRPM3JuRDwL20df8MwrNsvT0xXNYPTkZ55CIuOxuPYkrPT1KJOIjQCcy8dcFDqRJpmONbopZpAVo4K4fEPN6h2ouQRDUurGNShayVQ9VocPn9qZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769372604; c=relaxed/simple;
	bh=kA4osmuywNGnfc/EW5DvQpt+uRvoP6E0fmnIPNpufnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONOnWNoBQ0JbZ2oBUpk9JiCQY+V/4X0XAldU+4Sn6tIVvKHOwAtsp7t93OnTiQ28ykxMswp0A7IOsyhmLN5neVD1Ci16d0SQsb5gNCnXvRYVme5rvcIH/ZhPXeZGcqsFjycOXNsHVUwR9UIDpmYCNkyd3m6LhmGZiC0ZHMfM0FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsYGaSLy; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsYGaSLy"
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8c6d76b9145so502799385a.2
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Jan 2026 12:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769372601; x=1769977401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GVz+XHeZzWVROGlrmIWxthJXoXXHUDugP+jXUUa2fbw=;
        b=PsYGaSLyE5wcIcqq/gJGs0mNYa5JLWRotsDc+sZtZ2tA7xmccL2e7OiNBw/cYE/Fwv
         3Soc8iZ+vQNWLlscv3Sk4fohaE8lK5feYaSoIDgfXPj/JMJc7UA6haxWUTQHC38ZwRK4
         0Cgl0PJ//gOJSkumLew7kHm/bQT4cQYYsqoYMo/8UAirF/uOWSTu5h40JqSBUVnCeAsN
         MWTprOOgD9+ZBrkNfcFT6PKEMpALAT7bDF1CeStQ0rcay8G+D72x+43DviKOENSFBPxs
         swOpwzo+o20wcoJE0Xzc8HalbJ5XFoXzfdwSVV38iLP0qYlUJdj6bgey6o2BFgm4cnG/
         5yLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769372601; x=1769977401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVz+XHeZzWVROGlrmIWxthJXoXXHUDugP+jXUUa2fbw=;
        b=dUdf+/TKsm5IcYmqRI1TPDTtzxy7dvrGhzta9YwzRU6S1VdUcU01TMR1afoB+5FOfD
         q457f5GGinudj0EAP2IYjY2H2gF/TrmEykZWzhWEB6heIVpszL5ZpuzqZ0i2LmPCXWsF
         WlaUDJfZ1T6kVcpl0XG/pw3vH+Z/3Oai7xjZpGNHtltl0BJ0vhS8TpzLmbmL3X0KoaQK
         8RnIP7sBlabOcBSxbrOP91mGhbkvTP+1u27H3OKw1EWm2JUfrrA5jO7a3ZFHBe/wrxan
         8JmoAZV/wEAoO3btIbvPEy8TQ6r2B6jwuM/Ouvs9JSMH7S1R1RPiyS+Y5g8gUlvWhaK/
         2hzA==
X-Forwarded-Encrypted: i=1; AJvYcCWG3CRlvkBHsXw1LSkh0tyEK7bl5if/A90zLfMPhPpRxI3Sde57qyCA2gVNL3m5yq6Tu/I5Fl/EzReLaeI0KwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhNY8mIsI8suNI5OKStPgRKfzczOt7U9OrjW/o0888Y81feaLU
	73ZE8YE2bW7YEWP+5idSBGxogk4bfqVRNPixvW5+QHaUqzGIf2LqXIwh
X-Gm-Gg: AZuq6aJ+VKQ+KFdZtTyPwWlYxV8SQcnFX0UnQ3RSvx3R6CMbPTTmXYkuzieagT9+4Ye
	Kq/F4plBSvhg+FEpN1ffDFFyqaFejunKZ2SeeJQ2I5aneqrK7tgvobetDsEkYJ4q2cFJIyp0baP
	WQP1O6yhmMG25doIDFFm8FPFueTCJq5keaLXfbb/TvEnSlVXkrS83MhtCVchBu8DeUhNQehS2r+
	u9Mb+kqldA4H1vM/rgnkwYPxqgrURrBeLdN2vTtSeJXQL2XM307G0Dy4CanOq2h8y5ItKNn7xD8
	BqMLyHrdJnTDLl1vMCNYZPSyu76skqOsO74KK9sZx3KuCuDwZsC8052J/kPluBmDtC61ZS2LPth
	i9XEu/FNuUPRSgJul4fTJ4xnIMbeHNilIX9ZkRTCUBRre3B8jdG3duzDaa5t54zDCFhUFtwjdM1
	T+sDxG4ApXIxXOAgSF0IFdZlVuondlhNqIC0mFqI3zwg==
X-Received: by 2002:a05:620a:178e:b0:8c0:cec4:b6fa with SMTP id af79cd13be357-8c6f96bd886mr266639585a.65.1769372601285;
        Sun, 25 Jan 2026 12:23:21 -0800 (PST)
Received: from pc ([2600:4041:4491:2000:c864:93f:1893:5824])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e385490bsm813994185a.39.2026.01.25.12.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 12:23:19 -0800 (PST)
Date: Sun, 25 Jan 2026 15:23:17 -0500
From: Seokwoo Chung <seokwoo.chung130@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, corbet@lwn.net, shuah@kernel.org, 
	mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 v5 1/3] docs: tracing/fprobe: Document list filters
 and :entry/:exit
Message-ID: <wqpijkdwziafpuci6js5mtfzro46bre4z7une547crcdzrlm67@kd4fgea5m6ov>
References: <20260118011815.56516-1-seokwoo.chung130@gmail.com>
 <20260118011815.56516-2-seokwoo.chung130@gmail.com>
 <20260120155340.2dac7fab@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120155340.2dac7fab@gandalf.local.home>

On Tue, Jan 20, 2026 at 03:53:40PM -0500, Steven Rostedt wrote:
> On Sat, 17 Jan 2026 20:18:13 -0500
> "Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com> wrote:
> 
> > Update fprobe event documentation to describe comma-separated symbol lists,
> > exclusions, and explicit suffixes.
> 
> Usually, the documentation updates comes *after* the changes.
> 
> -- Steve
> 
Thanks for the comment. As you noticed, I sent another patch since I forgot to
put log. That said, please let me know if you want me to continue on this
series. My apologies on the ordering. I noted after Masami mentioned but I
misordered when sending. Thank you.

Best regards,
Ryan Chung
> > 
> > Signed-off-by: Seokwoo Chung (Ryan) <seokwoo.chung130@gmail.com>
> > ---
> >  Documentation/trace/fprobetrace.rst | 17 ++++++++++++++---
> >  1 file changed, 14 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/trace/fprobetrace.rst b/Documentation/trace/fprobetrace.rst
> > index b4c2ca3d02c1..bbcfd57f0005 100644
> > --- a/Documentation/trace/fprobetrace.rst
> > +++ b/Documentation/trace/fprobetrace.rst
> > @@ -25,14 +25,18 @@ Synopsis of fprobe-events
> >  -------------------------
> >  ::
> >  
> > -  f[:[GRP1/][EVENT1]] SYM [FETCHARGS]                       : Probe on function entry
> > -  f[MAXACTIVE][:[GRP1/][EVENT1]] SYM%return [FETCHARGS]     : Probe on function exit
> > +  f[:[GRP1/][EVENT1]] SYM[%return] [FETCHARGS]		    : Single function
> > +  f[:[GRP1/][EVENT1]] SYM[,[!]SYM[,...]][:entry|:exit] [FETCHARGS] :Multiple
> > +  function
> >    t[:[GRP2/][EVENT2]] TRACEPOINT [FETCHARGS]                : Probe on tracepoint
> >  
> >   GRP1           : Group name for fprobe. If omitted, use "fprobes" for it.
> >   GRP2           : Group name for tprobe. If omitted, use "tracepoints" for it.
> >   EVENT1         : Event name for fprobe. If omitted, the event name is
> > -                  "SYM__entry" or "SYM__exit".
> > +		  - For a single literal symbol, the event name is
> > +		    "SYM__entry" or "SYM__exit".
> > +		  - For a *list or any wildcard*, an explicit [GRP1/][EVENT1] is
> > +		    required; otherwise the parser rejects it.
> >   EVENT2         : Event name for tprobe. If omitted, the event name is
> >                    the same as "TRACEPOINT", but if the "TRACEPOINT" starts
> >                    with a digit character, "_TRACEPOINT" is used.
> > @@ -40,6 +44,13 @@ Synopsis of fprobe-events
> >                    can be probed simultaneously, or 0 for the default value
> >                    as defined in Documentation/trace/fprobe.rst
> >  
> > + SYM		: Function name or comma-separated list of symbols.
> > +		  - SYM prefixed with "!" are exclusions.
> > +		  - ":entry" suffix means it probes entry of given symbols
> > +		    (default)
> > +		  - ":exit" suffix means it probes exit of given symbols.
> > +		  - "%return" suffix means it probes exit of SYM (single
> > +		    symbol).
> >   FETCHARGS      : Arguments. Each probe can have up to 128 args.
> >    ARG           : Fetch "ARG" function argument using BTF (only for function
> >                    entry or tracepoint.) (\*1)
> 
