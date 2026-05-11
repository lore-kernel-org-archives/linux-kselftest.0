Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795AE3D75DB
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 10:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495613; cv=none; b=G+hJYpbl0v25pzjIiaHMVo/y/Iv9AWREwb0jaFn5XF8cSyy5eyIHzLTOeHiTuowvzRfcrR3H5tAAr9i70beLqDQsvmCfrSsG72D/wafYwC534i4mpNJuSlvvMNgQ7iXtqiYTKLkoqsUucw6SXNT/kIDRX7iQ+psvtC3fuoZQwBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495613; c=relaxed/simple;
	bh=paKqw+AxbYX8Ac7JYkYZuyWmkzfQCaRJN4HHMNZ2eOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2ncDUeiaL+XQjkLXYMFbIlZtgCD5on1gpmZlwVqkrGK61y6S+cGMJc+EhQSFcvVQ8p3Tb4SGmRcIQNCz7i6orxnsCzJUCLA5pc+WicZwHFDSoSSi+JDexzHUvHAqR+Eg+dQITKGUegSQBbvqWZhex02cP+bB8tRVOlazvI60iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=vN8lnB2V; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=vN8lnB2V; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="vN8lnB2V";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="vN8lnB2V"
Received: from foo (unknown [IPv6:2a07:de40:b306:2000::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 85AFD68611;
	Mon, 11 May 2026 10:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1778495609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dJ2zZxs/5ZIKE08XTANU853dRSSk0fWTqi6tGbGlOE0=;
	b=vN8lnB2Vh3PR0Tmw4DG4IBoa/8im3GOXpjghq/UJDqT1HEXyNaHCb6NLDr74D6qMv4fz1m
	q1CWYByw5Ui8+rLi/GUd8ogSEijBOakmdnvyUifBpqsa9yWBWXeA93fRJZjlrkGEUpip22
	NUnDZXdaBaEQWANHXY8Uw6nAsK90cCw=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=vN8lnB2V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1778495609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dJ2zZxs/5ZIKE08XTANU853dRSSk0fWTqi6tGbGlOE0=;
	b=vN8lnB2Vh3PR0Tmw4DG4IBoa/8im3GOXpjghq/UJDqT1HEXyNaHCb6NLDr74D6qMv4fz1m
	q1CWYByw5Ui8+rLi/GUd8ogSEijBOakmdnvyUifBpqsa9yWBWXeA93fRJZjlrkGEUpip22
	NUnDZXdaBaEQWANHXY8Uw6nAsK90cCw=
Date: Mon, 11 May 2026 12:33:28 +0200
From: Anthony Iliopoulos <ailiop@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Florian Weimer <fw@deneb.enyo.de>, corbet@lwn.net,
	akpm@linux-foundation.org, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agGweC12aloH8DBq@foo>
References: <20260508195749.1885522-1-sashal@kernel.org>
 <87ecjku6y7.fsf@mid.deneb.enyo.de>
 <af8pw54Y-Q18kSR0@laps>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af8pw54Y-Q18kSR0@laps>
X-Spamd-Result: default: False [17.36 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[1.000];
	BAYES_HAM(-3.00)[100.00%];
	HFILTER_HELO_5(3.00)[foo];
	NEURAL_SPAM_SHORT(2.97)[0.991];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.com:+];
	MISSING_XM_UA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DNSWL_BLOCKED(0.00)[2a07:de40:b306:2000::2:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim]
X-Spamd-Bar: +++++++++++++++++
X-Rspamd-Queue-Id: 85AFD68611
X-Spam-Score: 17.36
X-Spam-Level: *****************
X-Rspamd-Action: add header
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: YES
X-Spam: Yes

On Sat, May 09, 2026 at 08:34:11AM -0400, Sasha Levin wrote:
> On Sat, May 09, 2026 at 02:02:24PM +0200, Florian Weimer wrote:
> > * Sasha Levin:
> > 
> > > When a kernel (security) issue goes public, fleets stay exposed until a patched
> > > kernel is built, distributed, and rebooted into.
> > > 
> > > For many such issues the simplest mitigation is to stop calling the buggy
> > > function. Killswitch provides that. An admin writes:
> > > 
> > >     echo "engage af_alg_sendmsg -1" \
> > >         > /sys/kernel/security/killswitch/control
> > > 
> > > After this, af_alg_sendmsg() returns -EPERM on every call without
> > > running its body. The mitigation takes effect immediately, and is dropped on
> > > the next reboot -- by which point a patched kernel is hopefully in place.
> > 
> > Do you expect this to be safe to enable in kernel lockdown mode (i.e.,
> > with typical Secure Boot configurations in distributions)?
> 
> Yes: under lockdown, killswitch has to be configured on the cmdline. Runtime
> engage is gated on the new LOCKDOWN_KILLSWITCH reason.

Basically this proposal allows for any function to be overridden on a
production kernel as long as no lockdown level is enabled, which is quite
dangerous.

Assuming this is acceptable (which I am not sure it should be), then this
is equivalent to the existing error injection code that we already have in
the kernel (CONFIG_FAIL_FUNCTION) minus the explicit whitelisting on a per
function basis required to permit injection.

Given that this achieves the exact same result, then why don't we consider
simply removing the whitelisting restriction from fail_function altogether
and use that instead? The only thing missing then would be the boot param
parsing and setup.

This way we'll be removing a few hundred lines of code instead of adding
more duplication, while enabling the same functionality.

[As a bonus, this would also make the existing framework more practical to
 use for testing arbitrary function failures. I have been carrying a debug
 only patch to that effect for a while, which basically just shorts the
 whitelisting check when CONFIG_FUNCTION_ERROR_INJECTION_ALLOW_ALL=y.]

Regards,
Anthony
