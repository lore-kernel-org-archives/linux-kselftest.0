Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AA137F8AC
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 08:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724715; cv=none; b=l9DSBkeGFBFnTZN4syByFHSgKAYhjJs2mTSO+kRndXxGg1vAH3LPG8rWyh8f7x/ylRQFJXQRY6HETazOqnf8NK4OHg+B2MwFXI4cnZwQihr2Z1DdUapscMmmtI9i1XCBF/Dk5RjK8PpjdOjl5E+n6r38OpQDch8m8vd0muW9G6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724715; c=relaxed/simple;
	bh=inmx+R9rV6e4qchz2coETZpaUi+iT/bHsLdKB7Z+Trw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtVVIRDmkmh17fbYBgzlWQ3YsvxOEZc+jvAV8o/QZdR+7a4wGrbjsB6jFFr00DAdXyR8pQICOCGfLm9F8CFnF6vHN/0ZMgV11EBcTQGTa63YZEiaB03X73rWVwq5fPcluJbAEOWqrZAqVTre8xrHqJCteLBnVcajg5a3WEm9YMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1/6mHsbJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zKA35l6H; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1/6mHsbJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zKA35l6H; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1/6mHsbJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zKA35l6H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1/6mHsbJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zKA35l6H"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8A7BB4EE4B;
	Thu,  9 Apr 2026 08:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775724712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S3UzexDVgj3hY9DW/GeYeGvfNpeCar+zlMKW2FpGQGE=;
	b=1/6mHsbJZhTkDFD+R641iqLHXBrz3ldYShDidr0cDdCyGKoyiyl4PtofD2WC+Y6FZl6xzG
	rHX3DQKy16EHVdaLBNkD8+XyrOLfHdG/5BHrE5BtVSnOVt/g2z4quNErwzFc15LLGQKdVe
	o8D6eosGdmB7kfRXYKk0FFHn6Ea9eRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775724712;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S3UzexDVgj3hY9DW/GeYeGvfNpeCar+zlMKW2FpGQGE=;
	b=zKA35l6HIsWaGbm41z3H5VCAGv6L9t/7wXvibqa7azITS04o8+vkqkoa52a2miY9val6ei
	/bp5fTSZh7xdIzBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775724712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S3UzexDVgj3hY9DW/GeYeGvfNpeCar+zlMKW2FpGQGE=;
	b=1/6mHsbJZhTkDFD+R641iqLHXBrz3ldYShDidr0cDdCyGKoyiyl4PtofD2WC+Y6FZl6xzG
	rHX3DQKy16EHVdaLBNkD8+XyrOLfHdG/5BHrE5BtVSnOVt/g2z4quNErwzFc15LLGQKdVe
	o8D6eosGdmB7kfRXYKk0FFHn6Ea9eRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775724712;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S3UzexDVgj3hY9DW/GeYeGvfNpeCar+zlMKW2FpGQGE=;
	b=zKA35l6HIsWaGbm41z3H5VCAGv6L9t/7wXvibqa7azITS04o8+vkqkoa52a2miY9val6ei
	/bp5fTSZh7xdIzBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D87B4A0B3;
	Thu,  9 Apr 2026 08:51:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T9PhHqdo12k4JwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 09 Apr 2026 08:51:51 +0000
Date: Thu, 9 Apr 2026 09:51:49 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: anthony.yznaga@oracle.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, david@kernel.org, 
	ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, jannh@google.com, Jason@zx2c4.com, 
	shuah@kernel.org
Subject: Re: [PATCH v2 2/2] selftests/mm: verify droppable mappings cannot be
 locked
Message-ID: <urtokyyat4gw3zvfffdpz5yq6pvwrzjvc3cttpps2xiuucflzz@ujutvveagq2l>
References: <20260402235933.10588-1-anthony.yznaga@oracle.com>
 <20260402235933.10588-3-anthony.yznaga@oracle.com>
 <20260403123120.82cb5becb19e1b572d474394@linux-foundation.org>
 <83b56ffb-6e2e-4c9b-b0cf-9f04b61ebe7f@oracle.com>
 <20260408140251.6158aa7a56f71128471f327e@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408140251.6158aa7a56f71128471f327e@linux-foundation.org>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MISSING_XM_UA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url]
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Level: 

On Wed, Apr 08, 2026 at 02:02:51PM -0700, Andrew Morton wrote:
> On Wed, 8 Apr 2026 13:35:42 -0700 anthony.yznaga@oracle.com wrote:
> 
> > 
> > On 4/3/26 12:31 PM, Andrew Morton wrote:
> > > On Thu,  2 Apr 2026 16:59:33 -0700 Anthony Yznaga <anthony.yznaga@oracle.com> wrote:
> > >
> > >> For configs that support MAP_DROPPABLE verify that a mapping created
> > >> with MAP_DROPPABLE cannot be locked via mlock(), and that it will not
> > >> be locked if it's created after mlockall(MCL_FUTURE).
> > > There are a few queries from the AI reviewbot;
> > > 	https://sashiko.dev/#/patchset/20260402235933.10588-1-anthony.yznaga@oracle.com
> > 
> > Interesting. Of the two issues, one is certainly legit. I need to add an 
> > munlockall() on early return from test_mlockall_future_droppable().
> 
> Cool.
> 
> > For the other, the question posed was whether the tests should handle 
> > possibly being run on an older kernel that doesn't implement 
> > MAP_DROPPABLE. It seems to me to that a selftest should not be expected 
> > to work (or even necessarily compile) on kernels older than when the 
> > selftest was introduced, but I don't want to assume.
> 
> I don't know that there's any policy on that.  My attitude is that
> selftests are not intended to be forward- or backward-compatible. 
> That's why we ship them with the kernel source!
> 
> If we get a selftests fixup then I do like to backport that into
> earlier kernels if appropriate, to keep those in good shape.  And that

/me puts on his gecko-shaped distro kernel hat

Yeah, adding selftests and selftests fixes to (upstream) stable is great.
Particularly when it comes to bugfixes (or CVEs) they are quite handy to
verify the fix is in place and works properly.

> has the effect of reducing people's motivation to run a later kernel's
> selftests on their current kernel.
> 

Yeah. Some people do that but... to each, their own :) It should not be
supported upstream.

-- 
Pedro
