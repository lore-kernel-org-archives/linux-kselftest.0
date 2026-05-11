Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381D644E040
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 17:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778520220; cv=none; b=uCKwo8EBdzRLHPmFaLgeS14Xd8/LCM42nNTc/egFCkto8KERzp1czD/9a8oa9mzT171kOvXOeE9U4cAgagZjYTFRlbkcb2uXVuGWMsTi+/gZmYmeUdpFhABaTk6ufU5w21Umk7onLi1w+vwtJImUfaz6i4Iq5MfbUgl+nrauOec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778520220; c=relaxed/simple;
	bh=HYJUFll3XSBkLjGvCt2tKZdporDIDvggiHykAh6+xzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6KcOmsMiLhG0TPUnCPwPAoUYbh4W5LmA1tRTS3YIUoloR1FdVn32+kjKBVSrDl5kRB5Uqfpmao70MQwX8Vr6aJ7CkBRTG2e4laEh2HcqnrSdWN+nhGT8PbrNcqDONuRKRAaa/0BUTACBXtpCIbEd3tY0laoaL/Vpjs0QMoYzFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Ppn8o/8T; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ftZs2aGS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Ppn8o/8T";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ftZs2aGS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E84CC5D4BA;
	Mon, 11 May 2026 17:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1778520215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZIuycZuqU7w5gAlpgfql0KoA1oChA0h/EzoFK2I3ZCA=;
	b=Ppn8o/8TUB1oG3w+dB7fJl0BC3+BSKE55mIia9CE/Uc1Nzs7MGN+Z+w3FiUPeTy49NCoGY
	XoahOXqKX2DJjo/xVxBQQIvT+N25lYzoA8Nm7NPot6aNhFJImOQrSQAWgfEhVdEYjMoNt8
	u03yXeKCeaUFdwz6XQHt7Rba48Uldx4=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ftZs2aGS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1778520214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZIuycZuqU7w5gAlpgfql0KoA1oChA0h/EzoFK2I3ZCA=;
	b=ftZs2aGScDRbkIlQT/mhP08KgOyGShlWieKkMYWvWeDvIQPr9eK6d2GczqGSlIxC7ROTPj
	s4dCxpdr4nuGE2shYVOq0SjocwobEI2tYLPbPRPorPeh3GNz7Lras0rA1fDGaxMvKiFIrz
	z0a7N8ZQTnKgz6rNhA0qmUTnoPguGKQ=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5031D593A3;
	Mon, 11 May 2026 17:23:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KI9ZEJYQAmqyFAAAD6G6ig
	(envelope-from <ailiop@suse.com>); Mon, 11 May 2026 17:23:34 +0000
Date: Mon, 11 May 2026 19:23:25 +0200
From: Anthony Iliopoulos <ailiop@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Florian Weimer <fw@deneb.enyo.de>, corbet@lwn.net,
	akpm@linux-foundation.org, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agIQjd78N_6NMN2U@technoir>
References: <20260508195749.1885522-1-sashal@kernel.org>
 <87ecjku6y7.fsf@mid.deneb.enyo.de>
 <af8pw54Y-Q18kSR0@laps>
 <agGweC12aloH8DBq@foo>
 <agG6PnVAFMsb3iiz@laps>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agG6PnVAFMsb3iiz@laps>
X-Spam-Flag: NO
X-Spam-Score: -4.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E84CC5D4BA
X-Spam-Level: 

On Mon, May 11, 2026 at 07:15:10AM -0400, Sasha Levin wrote:
> On Mon, May 11, 2026 at 12:33:28PM +0200, Anthony Iliopoulos wrote:
> > On Sat, May 09, 2026 at 08:34:11AM -0400, Sasha Levin wrote:
> > > On Sat, May 09, 2026 at 02:02:24PM +0200, Florian Weimer wrote:
> > > > * Sasha Levin:
> > > >
> > > > > When a kernel (security) issue goes public, fleets stay exposed until a patched
> > > > > kernel is built, distributed, and rebooted into.
> > > > >
> > > > > For many such issues the simplest mitigation is to stop calling the buggy
> > > > > function. Killswitch provides that. An admin writes:
> > > > >
> > > > >     echo "engage af_alg_sendmsg -1" \
> > > > >         > /sys/kernel/security/killswitch/control
> > > > >
> > > > > After this, af_alg_sendmsg() returns -EPERM on every call without
> > > > > running its body. The mitigation takes effect immediately, and is dropped on
> > > > > the next reboot -- by which point a patched kernel is hopefully in place.
> > > >
> > > > Do you expect this to be safe to enable in kernel lockdown mode (i.e.,
> > > > with typical Secure Boot configurations in distributions)?
> > > 
> > > Yes: under lockdown, killswitch has to be configured on the cmdline. Runtime
> > > engage is gated on the new LOCKDOWN_KILLSWITCH reason.
> > 
> > Basically this proposal allows for any function to be overridden on a
> > production kernel as long as no lockdown level is enabled, which is quite
> > dangerous.
> > 
> > Assuming this is acceptable (which I am not sure it should be), then this
> > is equivalent to the existing error injection code that we already have in
> > the kernel (CONFIG_FAIL_FUNCTION) minus the explicit whitelisting on a per
> > function basis required to permit injection.
> 
> The mechanism is the same, but I don't think reusing fail_function works for
> what killswitch is trying to do.

How so? The kprobe handler is essentially the same. Setting the
whitelisting aside, it is currently possible to do:

echo af_alg_sendmsg > /sys/kernel/debug/fail_function/inject
echo 0xffffffffffffffff > /sys/kernel/debug/fail_function/af_alg_sendmsg/retval
echo 100 > /sys/kernel/debug/fail_function/probability
echo -1 > /sys/kernel/debug/fail_function/times

and that will return -EPERM, taint the kernel, and log the stacktrace on
dmesg on every rejected call.

> > Given that this achieves the exact same result, then why don't we consider
> > simply removing the whitelisting restriction from fail_function altogether
> > and use that instead? The only thing missing then would be the boot param
> > parsing and setup.
> 
> fail_function lives in debugfs, and on a typical Secure Boot distro debugfs is
> itself blocked by LOCKDOWN_DEBUGFS at integrity level. Dropping the whitelist
> doesn't help when the operator can't write to the file in the first place.

Agreed, for this to work fail_function would also need to parse boot
params similarly.

> Killswitch is in securityfs so that engaging it can be its own lockdown
> decision rather than being lumped in with everything debugfs exposes.

Sure but it makes no difference when a kernel is locked at integrity it
will anyway block either solution, this makes no practical difference.

> Fault injection in general isn't enabled on production kernels - having to
> enable CONFIG_FUNCTION_ERROR_INJECTION will drag in that entire infra into
> kernels that don't need it.

There's very little code that CONFIG_FUNCTION_ERROR_INJECTION brings in
apart from the override_function_with_return trampoline and
lib/error-inject.c which becomes obsolete without the need to whitelist.

Your proposal also depends on FUNCTION_ERROR_INJECTION necessarily.

The only thing that would be missing and not usually compiled in is
CONFIG_FAIL_FUNCTION that just implements the debugfs ops interface
which you are exposing via securityfs instead.

> > This way we'll be removing a few hundred lines of code instead of adding
> > more duplication, while enabling the same functionality.
> 
> I'm not even sure there would be hundreds of lines saved here...

I'm talking specifically about whitelisting which would essentially be
useless:

wc -l lib/error-inject.c include/asm-generic/error-injection.h include/linux/error-injection.h
 246 lib/error-inject.c
  43 include/asm-generic/error-injection.h
  28 include/linux/error-injection.h
 317 total

plus a hundred or so annotations of ALLOW_ERROR_INJECT and a tiny bit of
image space savings from dropping that whitelist section from the binary.

> The pieces that make killswitch what it is (cmdline parser,
> LOCKDOWN_KILLSWITCH, TAINT_KILLSWITCH, audit on engage and disengage, the
> module-unload notifier, etc) add up to roughly 200 lines that would move into
> fail_function unchanged. I really don't think we'd end up with much of a line
> delta.

All of that apart from the cmdline parser is already present in the
fault/error injection code, directly or indirectly. I can see though the
appeal of having killswitch cleanly separated from anything else, but
perhaps changing the existing code is more approachable.

> That said, the kprobe and override machinery underneath both of these is fair
> game for a shared helper that fail_function and killswitch both build on. We can
> look at extracting that as a follow-up once killswitch lands, but it's a
> separate piece of work from the policy questions in this thread.

Sure, but my point is that if this is acceptable, then it follows that:

- whitelisting becomes irrelevant (even if fail_function remains
  separate), since the exact same capability will be exposed via the
  killswitch interface for all functions anyway, so why would we need it
  to protect error-injection

and subsequently:

- fail_function would become somewhat redundant since the same
  functionality would be achieved via the securityfs (or just bpf, which
  is already the case).

Regards,
Anthony
