Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9853E4766A5;
	Sun,  4 Oct 2026 18:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791138176; cv=none; b=MmEhL6EhmIWZXfOrV04z592CBvNLUv4fh0d8DwtTV1BigXEOswwlKyVdBAtfin71WHYGjZSCLGvHTzzQsiVF7WZCXCibcPfZzQNx1eCu+F8fT/tsZIgKAngDGPtmX2vcAxKPlRYZLrpMqeas6CNWy0E3N68/GEL6RsnziPxoiIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791138176; c=relaxed/simple;
	bh=Uryj3YYK55Fef7hErvkG5mQB+3f98WLOJHxhpnstPms=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TVkABCxh7inEeacowUXCSGuFral19zKsWCwFRJ24KKy5QzgkeV+ZFiFd6dqHrOWmdt1fv7FsjTwvZrNklf9FeEThwJE/SLB82N+Ml7rRW6lXT94hM9eU1Q85MaSA502S1bbSK7w4KDvcdA4oTSh+D/OwHmewhGleKRRr43vd3i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pgshJhTP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jnGtYkqT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qUQKeGlc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZdA9MUje; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pgshJhTP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jnGtYkqT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qUQKeGlc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZdA9MUje"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 50BDC21D45;
	Sun,  4 Oct 2026 18:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791138162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J8nwckF1qvE1a3gD+m22QrerO8OMZ2HquKX90YnFDdg=;
	b=pgshJhTPOedUqg1e6VvIb3mQ/fM9FaRCFc281TTzDKr9AJSz9Gtfx7JO+iTjM2Uq5PI8Am
	pyDnc6jU9RqW6DOXer3n2GnLnwEPJwps0IQdvofRD9gG3RG5dFp9TDGy7cpLKSVMnYzPMu
	XAee5U8tw4/h4/hYSi55m9N940OpSSs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791138162;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J8nwckF1qvE1a3gD+m22QrerO8OMZ2HquKX90YnFDdg=;
	b=jnGtYkqTavfou16nN0BDatr0J5F3fr98uBSsyHDse/lcNzBy5frdBIFZHBgNPW81eSlKpZ
	ColLyCcN5YnVh+CA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qUQKeGlc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZdA9MUje
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791138158; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J8nwckF1qvE1a3gD+m22QrerO8OMZ2HquKX90YnFDdg=;
	b=qUQKeGlcX/vLUl/awQrt4ru31e2AFBgRSDRC5C5Z98S7iAL5t1l8GnvLX03YM1+a8HI4hK
	ycyv6KAqa/6HpNQRFbI8ZOa//LNiL7Ohka3lSGcQ4xMqIsKMDsddhFPhNrhpq8NfVpIY2H
	ThiKTJ6kFZ6LtXcwWNFm7hW8S4CNhws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791138158;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J8nwckF1qvE1a3gD+m22QrerO8OMZ2HquKX90YnFDdg=;
	b=ZdA9MUjeGj7tyxmovecqMPVabA9VCFKmGQg38TUgnHbdMS6+mDVIb27N4F/NiDV3F1p+YV
	OyF/ImlgVnbOlbAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 118B0133CF;
	Sun,  4 Oct 2026 18:22:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZaprN22ZwmoCTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 04 Oct 2026 18:22:38 +0000
Date: Sun, 04 Oct 2026 20:22:33 +0200
Message-ID: <87ece5iavq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] selftests/alsa: Catch writes that silently change other controls
In-Reply-To: <20260930111534.3782264-1-sammiee5311@gmail.com>
References: <20260930111534.3782264-1-sammiee5311@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 50BDC21D45
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Wed, 30 Sep 2026 13:15:32 +0200,
HyeongJun An wrote:
> 
> Mark asked for this in the es8316 thread [1]: have mixer-test check
> for other controls changing when one is written. Patch 2 adds that.
> 
> Patch 1 fixes a bug that testing patch 2 turned up. With a driver that
> notifies a neighbour with a value event, wait_for_event() returns on
> the neighbour's event and the next test reports a spurious one.
> 
> The cost is two extra writes per control and a read of every other
> control on the card after each. On the two cards here, 39 controls in
> all, the run time does not move. I have no card with hundreds of
> controls to measure against the 45 second kselftest timeout.
> 
> [1] https://lore.kernel.org/all/0fefbfe1-021b-46b2-8945-15956e75e37f@sirena.org.uk/
> 
> HyeongJun An (2):
>   selftests/alsa: Do not take another control's event as our own
>   selftests/alsa: Check that a write does not silently change other
>     controls

Applied both to for-next branch.  Thanks.


Takashi
