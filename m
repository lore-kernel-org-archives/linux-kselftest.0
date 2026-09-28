Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFED3515F9;
	Mon, 28 Sep 2026 12:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598139; cv=none; b=hAiFk3NfsG7NN4fqrhuT7nwm+0q29YV5jAxonIahdL8FL//MDD1W15MUpRxZnMzBkl1lm/R17eo3/Qi1yGQW4b/I2PEPrMudMQ66pjy8HZAX0wHOeOy1lh2LHUTlz3CKlFEmUN3ukX9a5bxsmboDTF/RDujnd/w/0nQ3eURwavc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598139; c=relaxed/simple;
	bh=BrsBM5b+jhrtkW9EbuXBMTCH/6ologB5CM38m+YZG2w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iKGaHi72WQU7VGU3VUqDIVZ6b3lSx2DPzJZ/LQk1es01MAM+LPeI8Ezc37/TgiB7iM/pMtxAXQ76dRGxHwq1juc2tHS26VemO5dI+ZLPijR5tp04V0ozAQ0W2YPtoqAt6AysKpcEI3BMUhYM/5qfONXOJsyrpaCje5kLb5eaN/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p0Rjsju8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mTC4KTg6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hj1gGLkK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EndqyVQe; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p0Rjsju8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mTC4KTg6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hj1gGLkK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EndqyVQe"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2057222321;
	Mon, 28 Sep 2026 12:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790598132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ilbfi+4a89869sF6Jw39CE/+8m7auO72mbhe8bLvxe8=;
	b=p0Rjsju8vF9zzn/yv9s6ELPU1dA7Cz9QprB6LiG5lF3VJJtH5uhZrjNxjCeUaPSeZ4aNWt
	WH7apr+6IWgaDWgdbCNoTPKac3NqfZgWq3jcIESDwmL3dv4sCM3zwZKrEu361zcWvLs0B4
	x+mgIfRxmq/Ef6lnwhbsdW+nl0Gshbs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790598132;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ilbfi+4a89869sF6Jw39CE/+8m7auO72mbhe8bLvxe8=;
	b=mTC4KTg6eQ8OQwv0GkCfHeITV9tHBQC/pYBnqU8blnjYk1rO1pRYYSeVBR+ZAm9SbiMNQe
	w+Bb6JpUcP/dwjAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790598128; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ilbfi+4a89869sF6Jw39CE/+8m7auO72mbhe8bLvxe8=;
	b=Hj1gGLkKYDE2kGs23yJZb9Tob1m3Y7SyxBygyuvFxl+LReGy5MuhrKcrwBFKaUV79zoqLr
	nClZq+FyXWoJFJuZ+dAjUuqWEfyCWUZj9aZdpxTOcmYVfnVKBwyU6AFsR4cNMvZBqjiv8q
	Q1WLiyostUTtXmbQYdINACi2Oz6a/ss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790598128;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ilbfi+4a89869sF6Jw39CE/+8m7auO72mbhe8bLvxe8=;
	b=EndqyVQeo7iPULFsoCY+VlskdquWuPrymGWTjK5BY8C207AnbeIYuCkDylmmxz7nbY41LG
	BLWuc7AEK7BthCCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC40A133F1;
	Mon, 28 Sep 2026 12:22:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HlSmI+9bumpPdAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 12:22:07 +0000
Date: Mon, 28 Sep 2026 14:22:07 +0200
Message-ID: <87ld8l5zww.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alireza Feyzabadi Farahani <arfa79lg@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests: ALSA: Skip timer tests when device is unavailable
In-Reply-To: <20260927064430.2112688-1-arfa79lg@gmail.com>
References: <20260927064430.2112688-1-arfa79lg@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Sun, 27 Sep 2026 08:44:30 +0200,
Alireza Feyzabadi Farahani wrote:
> 
> When CONFIG_SND is disabled, opening /dev/snd/timer fails and the
> userspace timer tests report failures even though the test environment
> does not support ALSA timers.
> 
> Skip the affected tests when opening the timer device fails because the
> device is unavailable. Continue to report unexpected open failures as
> test failures.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218479
> Signed-off-by: Alireza Feyzabadi Farahani <arfa79lg@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
