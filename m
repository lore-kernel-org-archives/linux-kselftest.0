Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B4A3FF888
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 13:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691604; cv=none; b=VcijVMGjHn/hvI/r1oUwt4Fi8R2pU/VzWPeLrvWw7TrSjm4ZPXePhYdHNqEGi838U2Od2x49IlGr4ZytYBQwMfCc08EdrW7cWGuBwx+SyC+cGpyNaQbVisuSSC0a8wFYkxKIlrVvqT2eX//0WZ/vMXzo+LeJr/RK44eKysOW1d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691604; c=relaxed/simple;
	bh=SUnJjgkqoiRjey4Mme0Ytcc27949+m9HMpFNJ4j4u04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIBBoZw1nVyi/LEqkf35E6Aa3nznXRLLd6tNGq8VV4fkBrQYYslPImBpVYRooYjgz9h5GlmN5M8f7yLy8FogGmlkXrOPVGJfkSh/OksTPYTVYk8ku2TaXNZ0sQBDJBqavFJySt9hKAZDXU0Suvo6qNKlr4iuNovQdBBm5RKIB0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=A58xvaoE; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="A58xvaoE"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8d7e7f48499so348997485a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 06:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1776691600; x=1777296400; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZK98ieIRG457WI8zfD0fDHqFblKktpbnpJAvLDPkbM=;
        b=A58xvaoEq67aH9ULs1ces4Ml7HWYtldV1dz76aMvy6xSXVbEBCsk4KsUbNGc293np+
         aXqPeThxXbHjAUA4bcGnZYMP9NB3CdSSQyLbdiyGdryr86TrQSD0PGMbc0bysFMmiGUF
         fgtfpLyaY17Y/MEJuY1WGge9YOPtHAizWFg32S688H5wvh7DqlukcN+8KQcEyoEkVnYr
         YAi2vky7Ap9FGBIaO9dRT9zR0aVbcIBzsYSs8Vbd013cA7gc/koyBslV/1sjlzxnNF18
         7nMG50BggmcjUZ8E9rODMNHtUpJyxMcJxlc709pjTbloBr+IOkFw5b/q9XuDugNVmiai
         qOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776691600; x=1777296400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZK98ieIRG457WI8zfD0fDHqFblKktpbnpJAvLDPkbM=;
        b=JT/6n3NL42b7nQDvuBS5t9K+HqjBJvIZ9/DQLuB/+aeGpyPW3xrL39Tafl4emujZ3P
         /+MnCNEEqIAcsIbbEuPB89yQuyYIffxo/U34/28Plhawd2WbaU8LkhyKW3Vjp1eBIdsH
         7uxGedNlqTh4416FK6Jx26TtNB0/i0FMNisoExg0AsjmGLaIplyoeXwnnRvSRMNYiFO/
         fPbuYXwXhMUO7oTv6GPzy3FzUuSQ3rW5TM+SqlH8/HhrFFopWz51KU8vV+mz2Tu7q6Ym
         0vuT4rGRaAVMZ9A5IpdOBJ4N6pHCmFix1I8We7/pcGG42yJHfrcEt3PMKDURhhNLI07p
         EaOA==
X-Forwarded-Encrypted: i=1; AFNElJ8ff0F35dk98hVgf7UezCC40oVGi+exCAUdC1dEWipOPq98rtAsQ8FKifzBQMtlHE7NVZLGEjDxocerHRJ2nH8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1nvD1h1BysPlTgR6tb4uij/f8B7CiU7BRRhx2TX0rNdD2gM5O
	i6bEy70ze43jovd6FdklcHa9z/CFVZ1pHqYICXpbaERGO37twYByLSleJLcK5Soe1wA=
X-Gm-Gg: AeBDiesJ6XEgTryMfl/yUzJ+P5Y2tLNnNgGmI93072q1nKirrjzJw8LCBIzDo8zlSYt
	cRJizwH7YWqf4VANR4gopOPuWLs7Hq7s0FZ8saRRBib6QfgdOwGNwW81kma+OxU2xbipEJyXNcc
	RwIkR59jydbs5xRdidrH9IlfM+A4vCcF/VR0JQ3n9rXTnfqe1urcKqW1UXR01YDfruNyQmwx3tM
	VeeasE3ombD9U2/vQsMUIa5U8nx9FK62sK67WkUqPUsmZhJvQcMJ39oxh7YUVKxatpnJHN2X6Qy
	ZdEjmsWlNxLjrZG1lQtKTsfhGva4zzUtWZM5QepkVH3ZygFgJiLuW2xdv+XeWiDFEcui1KW4zm8
	vzsbQpSdN7F3Bmf5OTqCP3hMKs5t/UJa/FOSUybCN4NHaGwWa0WSA3l7aq7shRmTL186W7cFNaK
	rnBiI92RDbXAqrMGe/wJ81/PXsPUu1k1YUfh1L/a1QL+2gZEXd/nLK2M3dveDF
X-Received: by 2002:a05:620a:410c:b0:8cf:c729:a629 with SMTP id af79cd13be357-8e78fc29218mr1998016685a.20.1776691600368;
        Mon, 20 Apr 2026 06:26:40 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8eb61bc0d7dsm201476385a.24.2026.04.20.06.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 06:26:39 -0700 (PDT)
Date: Mon, 20 Apr 2026 13:26:38 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH 1/5] liveupdate: Remove limit on the number of sessions
Message-ID: <ttirtg6trmvhuaubix4ufhv2i7vl37n3ef5rgkpxp56nvfvwmt@ehghcskmjqzo>
References: <20260414200237.444170-1-pasha.tatashin@soleen.com>
 <20260414200237.444170-2-pasha.tatashin@soleen.com>
 <aeXSEe9Bo-vsSkMH@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeXSEe9Bo-vsSkMH@kernel.org>

On 04-20 10:13, Mike Rapoport wrote:
> On Tue, Apr 14, 2026 at 08:02:33PM +0000, Pasha Tatashin wrote:
> > Currently, the number of LUO sessions is limited by a fixed number of
> > pre-allocated pages for serialization (16 pages, allowing for ~819
> > sessions).
> > 
> > This limitation is problematic if LUO is used to support things such as
> > systemd file descriptor store, and would be used not just as VM memory
> > but to save other states on the machine.
> > 
> > Remove this limit by transitioning to a linked-block approach for
> > session metadata serialization. Instead of a single contiguous block,
> > session metadata is now stored in a chain of 16-page blocks. Each block
> > starts with a header containing the physical address of the next block
> > and the number of session entries in the current block.
> > 
> > - Bump session ABI version to v3.
> > - Update struct luo_session_header_ser to include a 'next' pointer.
> > - Implement dynamic block allocation in luo_session_insert().
> > - Update setup, serialization, and deserialization logic to traverse
> >   the block chain.
> > - Remove LUO_SESSION_MAX limit.
> > 
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  include/linux/kho/abi/luo.h      |  19 +--
> >  kernel/liveupdate/luo_internal.h |  12 +-
> >  kernel/liveupdate/luo_session.c  | 237 +++++++++++++++++++++++--------
> >  3 files changed, 197 insertions(+), 71 deletions(-)
> 
> ...
> 
> > +/**
> > + * struct luo_session_block - Internal representation of a session serialization block.
> > + * @list: List head for linking blocks in memory.
> > + * @ser:  Pointer to the serialized header in preserved memory.
> > + */
> > +struct luo_session_block {
> > +	struct list_head list;
> > +	struct luo_session_header_ser *ser;
> > +};
> > +
> >  /**
> >   * struct luo_session_header - Header struct for managing LUO sessions.
> >   * @count:      The number of sessions currently tracked in the @list.
> > + * @nblocks:    The number of allocated serialization blocks.
> >   * @list:       The head of the linked list of `struct luo_session` instances.
> >   * @rwsem:      A read-write semaphore providing synchronized access to the
> >   *              session list and other fields in this structure.
> > - * @header_ser: The header data of serialization array.
> > - * @ser:        The serialized session data (an array of
> > - *              `struct luo_session_ser`).
> > + * @blocks:     The list of serialization blocks (struct luo_session_block).
> >   * @active:     Set to true when first initialized. If previous kernel did not
> >   *              send session data, active stays false for incoming.
> >   */
> >  struct luo_session_header {
> >  	long count;
> > +	long nblocks;
> >  	struct list_head list;
> >  	struct rw_semaphore rwsem;
> > -	struct luo_session_header_ser *header_ser;
> > -	struct luo_session_ser *ser;
> > +	struct list_head blocks;
> 
> Don't we need some sort of locking for blocks?

The rwsem right above the blocks field protects it. New blocks are only 
created when luo_session_insert() is called, which takes 
rwsem_write(&sh->rwsem).

For simplicity, once blocks are created, we never free them. This is 
safe given that sessions can only be created by a single privileged 
agent.

> 
> >  	bool active;
> >  };
>   
> > @@ -147,15 +222,6 @@ static int luo_session_insert(struct luo_session_header *sh,
> >  
> >  	guard(rwsem_write)(&sh->rwsem);
> >  
> > -	/*
> > -	 * For outgoing we should make sure there is room in serialization array
> > -	 * for new session.
> > -	 */
> > -	if (sh == &luo_session_global.outgoing) {
> > -		if (sh->count == LUO_SESSION_MAX)
> > -			return -ENOMEM;
> > -	}
> > -
> >  	/*
> >  	 * For small number of sessions this loop won't hurt performance
> >  	 * but if we ever start using a lot of sessions, this might
> 
> For ~8.1 million sessions this comment does not seem valid anymore ;-)

Fair point! However, in all reasonable use cases we expect to have at 
most hundreds of sessions, so this should still be fine. To extend on 
this: the O(N^2) complexity mentioned in the comment is really only a 
problem during restoration, which happens during our performance 
critical blackout time. However, it is used there only for sanity 
checking, if we trust the previous kernel, we can remove this 
duplication check entirely.

Let's keep this sanity check for now. If it ever becomes a performance 
bottleneck, we can remove it during the blackout time and optimize the 
pre-blackout session creation to use an O(log(N)) search by storing them 
in a sorted by name data structure.

> 
> -- 
> Sincerely yours,
> Mike.
