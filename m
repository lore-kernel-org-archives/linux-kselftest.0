Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093533644DE
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222878; cv=none; b=leaCdqA9aN1HDgKnwccFBpxd/FRxU5OVHEVlou/t30sZFM7/n/e6Ww0B7gjdmkSQI9Le7rq3zMKvDFpP8YcuxMipaodhCiD+DYxm6CnRMvuQP17nDQDMniTFN/Ap2zdRrXqQLTNmyRnoq2qyXxuhYv5Mnx4MH0zAH2cK8fnYbYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222878; c=relaxed/simple;
	bh=rtxIzOGs24KHK20FXt+aGc7dWtSYSvUJYnte2movCcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwPzs7Wn1XmBHxYASnMm7h+TzLBa95KUtudwcB8Nh9it6ioUPX0MGgadt/qLqdGdzuOlp2qVBpOBbG7BDAfhyCvoZ3o/DLxGMULU3V2bWOC17H8CLXsxA5D0Uz6L85IYR2buM1p4PGW7XUDzep04ucmObvKU8fnKMViQFY+nr9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pe+yqPrj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xQlVpttI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pe+yqPrj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xQlVpttI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pe+yqPrj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xQlVpttI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pe+yqPrj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xQlVpttI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 47D044D1F6;
	Wed, 11 Mar 2026 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773222874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sxiJpIkDUFuoJGi52S6NRrnTVEEE9NEolRRadyXj58w=;
	b=pe+yqPrjdbl4R+8tIibZZbAP74IXafLXeJDKRBPWq1i0ai9bOcTjcP6y9HIEcNWlXlA0pF
	REuNeMQtPcHya7je1lxfJb59oYn5wI8mKw9XwVGtoKqJKa/Bj2wXYmCE1wjjlzIx4sbkU7
	Pqg6+svi2U2EMvZ7yOhflRGKCHwYgAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773222874;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sxiJpIkDUFuoJGi52S6NRrnTVEEE9NEolRRadyXj58w=;
	b=xQlVpttIzplcCI5s7qpHiSGShn1Cvtihko//2/njdvXMUXOHue8e9GSG6Mm1Hen6qkrdyS
	/bzU+AnE2RKx+BAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pe+yqPrj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xQlVpttI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773222874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sxiJpIkDUFuoJGi52S6NRrnTVEEE9NEolRRadyXj58w=;
	b=pe+yqPrjdbl4R+8tIibZZbAP74IXafLXeJDKRBPWq1i0ai9bOcTjcP6y9HIEcNWlXlA0pF
	REuNeMQtPcHya7je1lxfJb59oYn5wI8mKw9XwVGtoKqJKa/Bj2wXYmCE1wjjlzIx4sbkU7
	Pqg6+svi2U2EMvZ7yOhflRGKCHwYgAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773222874;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sxiJpIkDUFuoJGi52S6NRrnTVEEE9NEolRRadyXj58w=;
	b=xQlVpttIzplcCI5s7qpHiSGShn1Cvtihko//2/njdvXMUXOHue8e9GSG6Mm1Hen6qkrdyS
	/bzU+AnE2RKx+BAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4AF873F961;
	Wed, 11 Mar 2026 09:54:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id V0ANDtk7sWl3cAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 11 Mar 2026 09:54:33 +0000
Date: Wed, 11 Mar 2026 09:54:31 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Anthony Yznaga <anthony.yznaga@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, jannh@google.com, Jason@zx2c4.com, shuah@kernel.org
Subject: Re: [PATCH v2 1/2] mm: prevent droppable mappings from being locked
Message-ID: <s5pp37sswbp4g5lw37eszhsduwcgmxbd2jufigjvlwtjzun357@ztzjh6nhhezx>
References: <20260310155821.17869-1-anthony.yznaga@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310155821.17869-1-anthony.yznaga@oracle.com>
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 47D044D1F6
X-Spam-Flag: NO
X-Spam-Score: -4.01
X-Spam-Level: 

On Tue, Mar 10, 2026 at 08:58:20AM -0700, Anthony Yznaga wrote:
> Droppable mappings must not be lockable. There is a check for VMAs with
> VM_DROPPABLE set in mlock_fixup() along with checks for other types of
> unlockable VMAs which ensures this when calling mlock()/mlock2().
> 
> For mlockall(MCL_FUTURE), the check for unlockable VMAs is different.
> In apply_mlockall_flags(), if the flags parameter has MCL_FUTURE set, the
> current task's mm's default VMA flag field mm->def_flags has VM_LOCKED
> applied to it. VM_LOCKONFAULT is also applied if MCL_ONFAULT is also set.
> When these flags are set as default in this manner they are cleared in
> __mmap_complete() for new mappings that do not support mlock. A check for
> VM_DROPPABLE in __mmap_complete() is missing resulting in droppable
> mappings created with VM_LOCKED set. To fix this and reduce that chance of
> similar bugs in the future, introduce and use vma_supports_mlock().
> 
> Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Anthony Yznaga <anthony.yznaga@oracle.com>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>
> ---
> v2:
>  - Implement vma_supports_mlock() instead of vma flags mask (DavidH)
>  - Add selftests (Lorenzo)
> 
>  include/linux/hugetlb_inline.h    |  2 +-
>  mm/internal.h                     | 10 ++++++++++
>  mm/mlock.c                        | 10 ++++++----
>  mm/vma.c                          |  4 +---
>  tools/testing/vma/include/stubs.h |  5 +++++
>  5 files changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/hugetlb_inline.h b/include/linux/hugetlb_inline.h
> index 593f5d4e108b..755281fab23d 100644
> --- a/include/linux/hugetlb_inline.h
> +++ b/include/linux/hugetlb_inline.h
> @@ -30,7 +30,7 @@ static inline bool is_vma_hugetlb_flags(const vma_flags_t *flags)
>  
>  #endif
>  
> -static inline bool is_vm_hugetlb_page(struct vm_area_struct *vma)
> +static inline bool is_vm_hugetlb_page(const struct vm_area_struct *vma)
>  {
>  	return is_vm_hugetlb_flags(vma->vm_flags);
>  }

I don't like this. In case a future backport depends on the constification
of the is_vm_hugetlb_page() argument, they'll be hardpressed to bring the
whole patch in. But it looks like we're going to do it anyway...

-- 
Pedro
