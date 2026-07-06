Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234F52475F7
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 08:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327911; cv=none; b=bf6AC85KEVGY6prDz7a++nq2w1WykPMNrVO8zgCUvWVbhQNdLilyqI3qRq4f361xbYlz8bVS2kVoCQSdektH5SeoiaYwU2OJB9vW3fYJNnSW4nf6Q0RLHkrK1OUp7I7hPLyxcrYfpIcJWYsT7WCUc4Gt3Y2ROK0YwWMa1Hs9yLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327911; c=relaxed/simple;
	bh=yVESiWj5i22ODaL63YhHXsLyvxNOobWdb6lP19hItgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=noKE2c6DMDE40XlSHAqSkwnkZ77wOAtywHCC4Eh6shKrnUs0cAZ0sTCzZsohgOzI8gokwkeeVhJVb+3eTBeiqN28tbD2Yulpj0B7r8Oe32fDHjX/hDzDPe+/dFtiBXr4ORyotSpa2zeqkBRoVoLKi0jq7zcr3cRDlUg/5hVoyLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kt0mKmKc; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kt0mKmKc"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1675656a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 01:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783327903; x=1783932703; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T0gzeXbVPPuDm6MFw6rW3cSp3Szz2VQxXfM+6OAkUTo=;
        b=kt0mKmKctLIjmGVS2vT/oJk7PRa9XW3iWWbIL88wiWUXomvQ1bcaGHP7xImmQSDNqK
         XlN8s4AWbNkl0mBHg8ic4qidz8YiRkhFWh+j5VSDPI5vwoEKxIBziAGLGZ8a2EHNZyaN
         1y+SzuOi4+N22zkVxbH/cmHAgyk35QdjDPtIpVL/XD6J757o41CtkAJ3ovjStnzFW7Pt
         +IVw8g4FH5XAhsAIYK7kfe545Do35TzCedIZ6sNr3VsYK97RIHuVxqo6ZrNnWsbTtRL4
         ab21ezZ09BIS4DN9r9VEVPODu5h9fkkEszBHQly31/9ZKxDn4o3vNNGhvNVipr5hQMy4
         0n9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327903; x=1783932703;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T0gzeXbVPPuDm6MFw6rW3cSp3Szz2VQxXfM+6OAkUTo=;
        b=QzAWF8LdQpxM5ge4pLD7x4c1tJISnplN6vMKF2Twf+Av/bNKbVouCDQU7eo/sPcDXZ
         W5gK/untnvrsHl+Ep0QqYcX+JjZLrIhWkTiJCWZEsmSPjGyv/hDSrul4WUZgL0a6aLqq
         gvPFl5EM13CWuOWwvESeIVtPHHCObstezhlyC7BJOp1IGqW6XfMmw+lmBCXKeVU1beHS
         axYYqFVWo+nz5XIczn+Nh0v0Je0gZ9Qa6VcLdHRULWOT63FWsufKUC3Ni0DJHp+1n9vP
         7QFKA3Ur0sy9ujtCFf+SSX4MdzJ2YMpJkzG1J1QtOrkAl76CT2OTUAMpyMwSpvFS7jcw
         4rmw==
X-Forwarded-Encrypted: i=1; AHgh+RqrqoERUGI0FEuQB2IqrOT2KzWR0SoasOqriakxtRFuTUhTfDUkBX9hExTE1h79SHfotCcQd8gTnF52B1lPeLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRLgVtol6H8GeK85sdsCsYIiCNIru6NqaHrC7uK+MugJn9LhtP
	ixKpWJXNIjB7KFF2S42yO2blRaGZSaSK8AQEa8oGGtkY5w3HxBlsMpPlEa4hecFu
X-Gm-Gg: AfdE7ckO1xr+FYYv+/6GFUL4P2LFkJJJh36tajiOx5GFr2E4DbSAaXYCuorBtA/T1Xu
	ElslxbQtQJOvWABefIcKeDbtIpmQhC2Tp6IHNj+JQvmyjc7rG97jsFc17Fa/UPefEex6X89vluB
	OdudqoN+onIe/PqOF/AzasqQ3FQU1vf1QeUnfV34p/H0e9ltIhBwc+4mgHO+QHEpSnsf6omXCW0
	Fo3MVAA0LtzobBdm7nn3srAOoSGRmfLHJqJNBv2F8wvmv8Znf6/GJjlishRFcKw00vwBR4uyhbn
	6fsrIdJuixxCRLYQiOMXQO2XZqNPjSJSK/NxcteJfiJvF0devgbjTnAAxmfPoKxAaXZt67JVAAt
	EfpWCoNByvxiy0OK9Q2FNZWZKkHQLPyFpGrV+O6GBCy8xPakmDCl4sxCxK7OeI6+gLhPUJ4oz1x
	pe829mRVsCB3Nf2c6UrvzyoldMW3556HC2Cr+pHkrAPD5ArhgOUG7fkwgstA==
X-Received: by 2002:a17:90b:3a50:b0:381:cef1:11b0 with SMTP id 98e67ed59e1d1-382a01beeb4mr9152255a91.33.1783327902707;
        Mon, 06 Jul 2026 01:51:42 -0700 (PDT)
Received: from computer ([2405:201:d015:d26b:41c5:151e:6e02:36c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31164c1c422sm4055231eec.13.2026.07.06.01.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:51:42 -0700 (PDT)
Date: Mon, 6 Jul 2026 14:21:33 +0530
From: Varun R Mallya <varunrmallya@gmail.com>
To: Pu Lehui <pulehui@huawei.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, bjorn@kernel.org,
	alex@ghiti.fr, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
	puranjay@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/3] riscv, bpf: Add support for BPF exceptions
Message-ID: <aktslXMz29C9twvo@computer>
References: <20260621144259.288135-1-varunrmallya@gmail.com>
 <20260621144259.288135-3-varunrmallya@gmail.com>
 <b6e8c677-5fff-4de1-8483-fc23361898dc@huawei.com>
 <akDOkptnqJt9LDtj@computer>
 <d5810b66-a2f9-4449-a808-c588e4a2ff1c@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5810b66-a2f9-4449-a808-c588e4a2ff1c@huawei.com>

On Mon, Jun 29, 2026 at 10:53:26AM +0800, Pu Lehui wrote:
> 
> On 2026/6/28 15:34, Varun R Mallya wrote:
> > On Tue, Jun 23, 2026 at 10:11:57AM +0800, Pu Lehui wrote:
> > > 
> > > We don't need to duplicate code. Please merge it.
> > 
> > Making this change in the next version!
> > 
> > > > +
> > > > +		if (!aux->exception_cb && aux->exception_boundary) {
> > > > +			/*
> > > > +			 * Boundary program: allocate the frame and save the
> > > > +			 * full callee-saved set, capturing the caller's values.
> > > > +			 */
> > > > +			emit_addi(RV_REG_SP, RV_REG_SP, -stack_adjust, ctx);
> > > > +			for (i = 0; i < ARRAY_SIZE(rv_exception_csave_regs); i++) {
> > > > +				emit_sd(RV_REG_SP, store_offset,
> > > > +					rv_exception_csave_regs[i], ctx);
> > > > +				store_offset -= 8;
> > > > +			}
> > > > +			emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
> > > > +		} else {
> > > > +			/*
> > > > +			 * Exception callback, reuse the boundary program's
> > > > +			 * frame, whose frame pointer is passed in a2. Setting
> > > 
> > > something confused—why is it A2? I feel like I missed something.
> > 
> > bpf_throw() invokes the exception callback as
> > bpf_exception_cb(cookie, sp, bp, 0, 0) , whose 3rd argument (which,
> > according to RISC-V's calling convention resides in A2) is the boundary
> > prog's frame pointer. Since this else branch handles
> > the callback, it expects A2 to have the frame pointer. The arm
> > implementation does something very similar with emit(A64_MOV(1, A64_FP, A64_R(2)), ctx)
> > where A64_R(2) is the third arg.
> 
> ok, so it would be better to clear in the comments that it is the third
> parameter.
>

Will do that in v3. Sorry for being very late to reply to this. There
are BTF issues I am encountering while running RISC-V kernels which I
have found the cause for and will send a report and propose a fix soon.

> > 
> > > > +			 * SP = FP - stack_adjust lines the epilogue's loads up
> > > > +			 * with the registers the boundary saved.
> > > > +			 */
> > > > +			emit_mv(RV_REG_FP, RV_REG_A2, ctx);
> > > > +			emit_addi(RV_REG_SP, RV_REG_FP, -stack_adjust, ctx);
> > > > +		}
> > > > +
> > > > +		goto tail_setup;
> > > > +	}
> > > > +
> > > >    	if (seen_reg(RV_REG_RA, ctx))
> > > >    		stack_adjust += 8;
> > > >    	stack_adjust += 8; /* RV_REG_FP */
> > > > @@ -2082,6 +2173,7 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
> > > >    	emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
> > > > +tail_setup:
> > > >    	if (bpf_stack_adjust)
> > > >    		emit_addi(RV_REG_S5, RV_REG_SP, bpf_stack_adjust, ctx);
> > > > @@ -2157,3 +2249,13 @@ bool bpf_jit_supports_fsession(void)
> > > >    {
> > > >    	return true;
> > > >    }
> > > > +
> > > > +bool bpf_jit_supports_exceptions(void)
> > > > +{
> > > > +	/*
> > > > +	 * bpf_throw() unwinds by walking the frame-pointer chain from inside
> > > > +	 * the kernel back into the BPF frames (see arch_bpf_stack_walk()), so
> > > > +	 * exceptions require the frame-pointer unwinder to be enabled.
> > > > +	 */
> > > > +	return IS_ENABLED(CONFIG_FRAME_POINTER);
> > > 
> > > riscv select ARCH_WANT_FRAME_POINTERS, so this will always true
> > 
> > I checked that the kernel compiled even when I turned
> > CONFIG_FRAME_POINTER explicitly off, so not gating this
> > would be a mistake, right ? ARCH_WANT_FRAME_POINTERS makes
> > CONFIG_FRAME_POINTER user selectable and makes it default to
> > true, but it's not always true. What does force it is PERF_EVENTS=y but if
> > that too is turned off, then CONFIG_FRAME_POINTER can also be turned
> > off.
> 
> alright, lgtm
> > 
> > Thanks for the review!!
> > - Varun
> > > > +}
