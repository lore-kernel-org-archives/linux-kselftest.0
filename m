Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3C22F531B;
	Sat, 12 Sep 2026 12:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789215601; cv=none; b=Car4Mz30zL5nLqkAt87B6fCAmC8iHmzAWULJMXNoQf+oBOXylFPE47unYFvtjHL0lmRO4QAqL4BsUPT0phTvRXGIURdIrThcBSnz+ptlMTUbWMUsgGGfuemTWaz2TgfMm+bCMlMevNr9ez5qy17Z4/F9gRM2PblTQXmB1b8kcpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789215601; c=relaxed/simple;
	bh=njrE7iqJKMTKFK+NR3Ogu0Rb202DOR1OeKyUEJuvdrw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=huMDJW0ktmmeoNnRNZdbPmB9dHtzaQW9itf4z3XetaXtOuqeReIk21vwuaRJp0o0iWE/AZyLwpKk7pjTxhCjt1Qe4Qu3ZTXOFiIF8Vfzf8DDMk+cRFGdOuwa/+zP0HDMGoQDoIanm24pJWFzJc3S8qSNFeZ9hIUcIeug74iAjNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WXBakg4A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GriudpHQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z1CsYSYe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LMEoQED3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WXBakg4A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GriudpHQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z1CsYSYe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LMEoQED3"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 882961F38E;
	Sat, 12 Sep 2026 12:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789215593; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9nMy6hYw6dcS8rtCTDMkqLgy+g4dqXHOIpTSAw8vyOs=;
	b=WXBakg4AWgoH/mYAiwaFxKevRAm05WrebE2+9Sjx+tT2ugTIY8v9lwDTE3m8yuFG2Doe9V
	AUNFFhkG4XNEK8O0TwZtAvvfhPAZF7B/NGZM7PolbrEPDHIdBTKITqbB7yo8IwdGZc+DKZ
	MUr2TYCuApGAo2xMUEi0OXnwsfoc2Lc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789215593;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9nMy6hYw6dcS8rtCTDMkqLgy+g4dqXHOIpTSAw8vyOs=;
	b=GriudpHQKYuTqT/s7m3eFemdHUMWEKkGqgQzR1yVsCwtnSNyyd/KuiPfaS7vjkWAkJDP6/
	3VWem//csliQHsDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Z1CsYSYe;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LMEoQED3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789215589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9nMy6hYw6dcS8rtCTDMkqLgy+g4dqXHOIpTSAw8vyOs=;
	b=Z1CsYSYet2MsTRCOc7PjJyxiZ5FsdbZjiOtZh/q7+XwvUgVp0DhstDObv6zI1SxV9OroDn
	j1980gIDtrmTs2ntZpuNL7jWuKGr4Bmz+Ilu8vmWmO133/EGYNmweaWmaotrcD3/LMYU3G
	b/NbDNOGCmfRcy9UVy2TykPXA5Lgqlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789215589;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9nMy6hYw6dcS8rtCTDMkqLgy+g4dqXHOIpTSAw8vyOs=;
	b=LMEoQED3kGdbJqsSDt+d8Atl4LpRPeNOpR6j07LEUwX1dE/vmTNAhg5rS1f9vcUwgMKHmq
	0Na7JTIkLaI0UzCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 122CC13687;
	Sat, 12 Sep 2026 12:19:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Z7zuAWVDpWq9fQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 12 Sep 2026 12:19:49 +0000
Date: Sat, 12 Sep 2026 14:19:48 +0200
Message-ID: <878q563bmj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shuah@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] selftests/alsa: Test writes to IEC958 controls
In-Reply-To: <20260912025430.2102149-1-sammiee5311@gmail.com>
References: <20260904123334.1505003-1-sammiee5311@gmail.com>
	<20260912025430.2102149-1-sammiee5311@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 882961F38E
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Sat, 12 Sep 2026 04:54:30 +0200,
HyeongJun An wrote:
> 
> Nothing checks that the put() callback of an IEC958 control reports a
> change, because write_valid skips these controls.
> 
> Where the device publishes a mask, toggle every bit in it and check each
> write.  A bit the mask advertises that does not stick fails the test, the
> way a rejected value fails for the other control types.
> 
> Where none is found, keep the old single guess at the non audio bit,
> which the device is free to ignore, so only the notification can be
> counted against it.  That path writes without checking so drop_events()
> clears what those writes leave behind.
> 
> On an HDA card with four HDMI PCMs the Con Mask is 0f ff, so each control
> walks eleven bits instead of one and all eleven stick:
> 
>   -# Totals: pass:212 fail:5 xfail:0 xpass:0 skip:56 error:0
>   +# Totals: pass:216 fail:5 xfail:0 xpass:0 skip:52 error:0
> 
> A driver whose put() never reports a change still shows up as
> event_missing.  hdmi-codec and img-spdif-out store every byte and return
> 0, so boards using them report one event_missing per walked bit, and
> hdmi-codec advertises the whole block so that is 191 of them.  A driver
> whose mask claims more than its put() keeps now fails write_valid
> outright: au88x0 and ice1712 on Delta 1010 and Mediastation advertise
> bytes they never store, cs46xx, oxygen and ice1724 advertise bits their
> put() drops, and the RME cards regenerate the whole emphasis field from
> one bit so the rest of it never reads back.  None of that hardware was
> to hand, the paths were read rather than run.
> 
> write_invalid stays a skip.  Every bit pattern is a valid channel status.
> 
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> Assisted-by: Claude:claude-opus-5

Applied to for-next branch now.  Thanks.


Takashi
