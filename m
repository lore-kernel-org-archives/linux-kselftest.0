Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E370408626
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 11:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782820779; cv=none; b=Oyzol1meee6ruCTQ3gnrQ093xbGSTcAwKXWp00LugQjBvkSOrvAMjt7XYkiAJVLzi+fMGP1IksmwjT+WoJMdIvHf4RB0IJhVxZ0C4oMuXQd4f5GqHRzmZW1g2wqQyvIw36vxXIoCfkdb4LYRw9tGPxhvX61jFbQsSVFiV11tgNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782820779; c=relaxed/simple;
	bh=fvWUtTUUvTpQkCVxc6+vBkhTH2MPEvAFwFLKcBihbxk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsgUkLJWChr3FzY4Ku/QT0fhGnkvh5iZye/OuMuQjBVASYxi83ukrWuRI4qI7AxXnleEoWQc9XBFCMp6xczO2gwTLp2xeRUnEQv199BNVxQ6c2DqFrD4A8hxDPpNRjKPgNWEqI12zRTlFtk68JBWV7KXz80W/Ex2qnmmLRhfASw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/26EK3Y; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/26EK3Y"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-475881b9a4bso877615f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 04:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782820777; x=1783425577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wtjkuyq+MLHO8ZADzDM8QMisoUEPsdDW4dYskthH/dw=;
        b=p/26EK3YMD/92YGR0nKIUmKpHyW6E1LGeop/iWRq2eP7fKHjjiDPBWCxcHIuQatlwa
         AnE4Q70SbL47IKIg7ptayW467j2NX1uSMKL2sjTMxZJrFLsQ3NADMZ2PA55mQLeYmUDO
         9BlGMXn00nbKjb/KIi9b2wDuj7g2d7QVZSFNC/eDdu3UaIQ/qD1sJgUZnuq91056qlD7
         SSq7Ek1Z2mzWZmsSq6SdKfXHy4G7dG5MF2l3Ch88vFcV23nmjl0FvZkr0gwi7P9919M2
         EN8p0ynxD9xW+um0E3GrmpzYo3xCNPcBvhg4eHtZjV19ft+IZ0AesKfJwrTYm3LKIZR2
         Lb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782820777; x=1783425577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wtjkuyq+MLHO8ZADzDM8QMisoUEPsdDW4dYskthH/dw=;
        b=QUSjOFjPMsQsQNtbfWWASfeLcPlNSlRTMXmrdVknViOyjYYa9EkI5sqwOtqOvQQQ8r
         5jVKpE92UntArkiOnpc7nsOMr+tInALUjmEJK8M248MSpjye64/XEoShOiKHhr/+kbhE
         u9X4i4zh+v5yZln2UHU0ZhtC9acTmyfy7xWo2LJBZKVQUebwCMZw2ydcZhUI+S/r3aqD
         Uj80n/YVAalY20OfM2pjPPKfA7TR37fQdLxdGedq4UQH8XooXGghUlxuf1iVkZtRp3sv
         xO6vX7hXaYBZlw5FUbaenzjNGUSfltDVyatPbO1yqT2pdQCouy9fbqNdlV9lbtHvDkKs
         xvOg==
X-Forwarded-Encrypted: i=1; AHgh+RrLuFIs6k8cGekNnJGe/G+nh89d26lOVCqRg/wAVtEno3JE35rZC1o+9t0gwpLWFEp0CUKK1aJXmK1QH8zSJ9c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9USGxanswErX3b0772R7t7FR7zK7SC481368ZibSfT/H+3Uw+
	/JabIoFMHIRGbehdhkNpwuRR3+OynSiyLvB9TZ2/Nv5Cd/fg+b/LhxsL
X-Gm-Gg: AfdE7cnCFlqSOOEY3mfNEVAQ+U+V7V56fSYfp+9FH3WCmBpJnEYgxznN/b1A4DWwHx3
	vNVDu25IzyaI7n9BSeY2uIrLuM5aotxsiMVx9v1V8mK2G1piD0F0rUawinPDVXD04xgewdWllIo
	SKubrQF5EktbV7ANZvCetDtr2JX26N3xR7ZdwhhdqS689hXmFQOMZiOM/vJAO50Dsj71up0vBjd
	eBRfEZtmf+ne4A/RZUXDl6JxzwzKGaizY59jj0/xeFN3joXXZ3mJqmoleeEgxvB0jKBJe5wmrsX
	2Aq1kU9alywbt2gQcqdyTaHdUA+doTIEPKX+a7m7h96XjxH1jcWfXMEtuRyluud0C4vbiUoDNK1
	mcBsiUsf5Kx4+FDveaw7cd6kMc1+4xWN81CddIYO8hJDtJXxtjWcWQSU4KYphRnwdkF8nFhcNKq
	+wpGOZvyWvp7TKns3q5jcUJxiu
X-Received: by 2002:a05:6000:4381:b0:475:f100:35fa with SMTP id ffacd0b85a97d-475f1003789mr2289639f8f.55.1782820776839;
        Tue, 30 Jun 2026 04:59:36 -0700 (PDT)
Received: from krava (37-188-177-177.red.o2.cz. [37.188.177.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475671d02f5sm7790027f8f.28.2026.06.30.04.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:59:36 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 30 Jun 2026 13:59:29 +0200
To: David Windsor <dwindsor@gmail.com>
Cc: mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, shuah@kernel.org,
	rick.p.edgecombe@intel.com, linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] x86/uprobes: Keep shadow stack in sync for
 emulated CALLs
Message-ID: <akOvofX6jsk5ZJ8V@krava>
References: <8b5b1c7407b98f31664ad7b6a6faf20d2d4a6cad.1782777969.git.dwindsor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b5b1c7407b98f31664ad7b6a6faf20d2d4a6cad.1782777969.git.dwindsor@gmail.com>

On Mon, Jun 29, 2026 at 08:13:33PM -0400, David Windsor wrote:
> Uprobe CALL emulation updates the normal user stack, but not the CET user
> shadow stack. The subsequent RET then sees a stale shadow stack entry and
> raises #CP.
> 
> Update the relative CALL emulation and XOL CALL fixup paths to keep the
> shadow stack in sync.
> 
> Fixes: 488af8ea7131 ("x86/shstk: Wire in shadow stack interface")
> Signed-off-by: David Windsor <dwindsor@gmail.com>

hi, lgtm

Tested-by: Jiri Olsa <jolsa@kernel.org>
Acked-by: Jiri Olsa <jolsa@kernel.org>

jirka


> ---
> 
> v2:
>  - propagate error from shshk_update_last_frame() rather than returning
>    -ERESTART in default_post_xol_op(). (Oleg)
> 
> v1: https://lore.kernel.org/all/20260622183109.1137245-1-dwindsor@gmail.com/
> 
>  arch/x86/kernel/uprobes.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
> index ebb1baf1eb1d..d74bb54543b6 100644
> --- a/arch/x86/kernel/uprobes.c
> +++ b/arch/x86/kernel/uprobes.c
> @@ -1246,9 +1246,15 @@ static int default_post_xol_op(struct arch_uprobe *auprobe, struct pt_regs *regs
>  		long correction = utask->vaddr - utask->xol_vaddr;
>  		regs->ip += correction;
>  	} else if (auprobe->defparam.fixups & UPROBE_FIX_CALL) {
> +		unsigned long retaddr = utask->vaddr + auprobe->defparam.ilen;
> +		int err;
> +
>  		regs->sp += sizeof_long(regs); /* Pop incorrect return address */
> -		if (emulate_push_stack(regs, utask->vaddr + auprobe->defparam.ilen))
> +		if (emulate_push_stack(regs, retaddr))
>  			return -ERESTART;
> +		err = shstk_update_last_frame(retaddr);
> +		if (err)
> +			return err;
>  	}
>  	/* popf; tell the caller to not touch TF */
>  	if (auprobe->defparam.fixups & UPROBE_FIX_SETF)
> @@ -1338,6 +1344,10 @@ static bool branch_emulate_op(struct arch_uprobe *auprobe, struct pt_regs *regs)
>  		 */
>  		if (emulate_push_stack(regs, new_ip))
>  			return false;
> +		if (shstk_push(new_ip) == -EFAULT) {
> +			regs->sp += sizeof_long(regs);
> +			return false;
> +		}
>  	} else if (!check_jmp_cond(auprobe, regs)) {
>  		offs = 0;
>  	}
> -- 
> 2.53.0
> 
