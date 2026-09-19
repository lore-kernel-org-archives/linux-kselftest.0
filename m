Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46AC3F4108
	for <linux-kselftest@vger.kernel.org>; Sat, 19 Sep 2026 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789810794; cv=none; b=mr0LS3PhTkhvX17n2BJNT0bSilMnj8mfihS6ue9grBr7j1cIyAH7Jomu0PJPcm7A8+cDf3V3OKohN+lVSnlw0gVYZ/btqjG1ou6Bp99jRdQwsBPZt9CPq4wYWfLyl/PHljLKGBDnUUpDuYp/2mIlDiuty46FZkFk7r8Tb6QTQsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789810794; c=relaxed/simple;
	bh=tHdHCeV3i/53pBzx+BvRaG4iEMebCHpkPsy50Fuskxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvB1wVhBEJJleEjtiU/2odtZsF2aHUtluxKD2AGFv7Hv71ZFXpYWBU8gVIkZed31pMzMz2xgqDNkIlUg+p2MSQeW82MiQPDzFAv9Oya6H04+CYa22VqwUoMZ0hJoLMTl+oTpDMIx08WEHMJgspM03eXlD4OtGDjtM1/q6uxQtac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcDGXE9v; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcDGXE9v"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso15998385e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 19 Sep 2026 02:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789810791; x=1790415591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G7D6znmpASqvbzZksdBAJ2aUTbJ7HvmNoE6FBY58urg=;
        b=QcDGXE9vmm/H8m4H5M7wjApIcK1rfcHQ4bH6+pzWqT/pcTdIEgATWEUucjdZPixKK0
         ELFSRmPrh1/I82b3TSRUZE7sMNGGxJAcAPCYS5Tu6oTiwZwYVo75pnao4p7E9DRO1xxs
         FE2dhZ9g+MCW0DkDaqh4F7yNxvViK2ClO9JUcgsV0e03pXZyhqM1lCoL29UF5E3m+NBY
         1slOKaaOnH+bzU+qLC/lXcVFIZ3qc3myHL08DAs3aJLYNydQf9o2H2Twx8MIYl0pVzFi
         lfM72nR1e96Am1bEriXQUISdbDBXfeTcf0JOglWdsAb0funNzAsxxm+z+zbCUiUOoLAo
         Tpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789810791; x=1790415591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7D6znmpASqvbzZksdBAJ2aUTbJ7HvmNoE6FBY58urg=;
        b=2Je9eVLNKFvbSKvncOK1ExpysI+oIID17AJ7H2eLbZDRw6IrZKnUdzEBWz2BeLIbbc
         Bts9YDYhkDHBTA4NWImwUWevPpzbWTAmrS3HMcY80WrN8o8tYoa0sgiaRSRU58ZCOORe
         lSIqbVFwzlPglSNhYJrnWFUOcPXb21vPCkbFkG/SE48UQbjCjeHcqp3wBtwrvMazXahs
         R95wxQTOYDiXvGUKZj34eCSp5B0FNG9HLJ/c7Ei2Et5Rwx6DuiTEG3GY6sZLqUBKcU+v
         ZQwfbJP4VLbm1SCSfFraGhL5b303/wMWkHK9G2/7+JSzXL2ifAnfo6qyC3EFz7D1uQOQ
         Tksw==
X-Forwarded-Encrypted: i=1; AKwUvByywEjAlHiIYfwkeizIRSWjoF/PMY/+bhop5jVfMPgZLOi+AUB0BsQ/BTEWD6TmBMmhm3dvu/DeLeUuAvrlpyc=@vger.kernel.org
X-Gm-Message-State: AFuF++mAj0O40SlmgISUb669MGvEbGngabciGRz52eQQA+VVBUoJuwZ2
	rITh4Ou413xidRSL0uQELU27Gn0/kMt2D8/tj4CoIth1P4wqul2STimI
X-Gm-Gg: AYBFou0hU0nWg+iL350p/w56OjUz3nvmyjC6e0Ui151bZlGslfFpk/c0ZFsd88iejk6
	8PY4G4OVADqD2/Mb/Ah1GlXKFo2kNDbrMslew8ZrD6Iadc/TYaN7r1DNffogbs60H+cTIRbx5ro
	Cn8PDVCjgBGC/0lgXW6tX1MwhhGGdzaltMqPmdM+IHqZoOSyU/kfUHiIakjzIls6qF3V8TVEa1Q
	CfxGtvtxvaN14qIpPWwkx+cD89+/fJ08oebdkM6vgyhwl2EIQOPBl7Exmnun3QlQJddzD8B56zh
	/yTu+CtmYZuui6Q/ivvrsQNAmipsjGuDQpGn9BDbJFGyVK7R3uTRteGDh03GiDAgFYMYr/LiaK8
	VMqnDEmrQA70/34F5+llvDj/007rQ5u6D0qm9UdEU5n03W29SWHGrxwDhiTpcBkqVFj8fsWv9Xu
	GBnfoU62ZgiJTzeLF04f+m7ZJXSJ27kC5G52y+JkWpTZIVAUsp6Sy/apMOH7/eJxqHaZKE5OshK
	CHbKaN+TKG1ri5M03jFRIA9gtI7D1nDVJvnnTIYfWnv1u7hNZLc8NN0O5TG7RAB/l5C7TZNXM8j
	daMWg4ahawwti6q/y99dRUEpyYghpWvhvB5BbNkkf/t028z/Dmv5VAkXWV2UFQSk9TgP0XWMVfd
	wFYqBsPPY
X-Received: by 2002:a05:600d:848f:10b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49fc5735351mr48923145e9.20.1789810790822;
        Sat, 19 Sep 2026 02:39:50 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc6ca43edsm124495965e9.0.2026.09.19.02.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 02:39:50 -0700 (PDT)
Date: Sat, 19 Sep 2026 11:39:47 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 3/5] slab: handle ERR_PTR values in kfree and hardened
 usercopy
Message-ID: <aq5YL3P6tuFy4eTU@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
 <20260903203720.63689-4-kmehltretter@gmail.com>
 <497a85d3-e062-4930-bcb8-c86a8205e7b2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <497a85d3-e062-4930-bcb8-c86a8205e7b2@kernel.org>

> > +	if (WARN_ON(IS_ERR(object)))
> 
> Wonder if WARN_ON_ONCE() would be better.
> Also wonder about the benefits for hardening (as opposed to debugging).
> Without this check it would fault. Now it warns, but hardened setups often
> use panic_on_warn anyway, so the result is the same?
> 

Yes, I'll switch to WARN_ON_ONCE().

You're right about panic_on_warn. The benefit is a clearer diagnostic
and, when warnings aren't fatal, returning before virt_to_page().

I'll split out the ERR_PTR patches as Harry suggested and recheck the
KUnit warning-count test with WARN_ON_ONCE().

Thanks,
Karl
