Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191DE362149
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Jul 2026 07:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783237201; cv=none; b=cCbkCHnCzhyzq0HQ7xVezudC7DIELzriLEmGxBd/gYfJuBdCzDuyDNR/nQGnhsud829axzDhBWn6OJ9xqwyh7JMChGhDg4mtaJdXGZpZDKlSdW4XPwB8oL8t9LOrIgxeWbEK6qUVDJJw+S9unskBmzWDRYJJdxRykd8gH//2FH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783237201; c=relaxed/simple;
	bh=Oeebzmlj2IUYz9Wvf7b8zwEBWFf6yEz6RSrG2e5iXv8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fdJQ+WslbDb7rTRjcQykdeVPFrKgDW4EzRGNs1gFGnaKRiDgF7AviUe6nz6euTKcMLTHobCuhZ9+ruY9AvUJAU8CbHlEAvApp2O6SFHzt3+iY0Lk42b3bRC1R73XUObnRxwHpIznJH+RMXJo5Ug9a2U2lT9Hy6kXKOV2qfJFfBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JSXs2jIM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4kQxb+ui; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JSXs2jIM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4kQxb+ui; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JSXs2jIM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4kQxb+ui";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JSXs2jIM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4kQxb+ui"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0256A7580E;
	Sun,  5 Jul 2026 07:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783237191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2U3/co07P0FjfO8pupYTVfbHIwzb+992bBN9i9egodI=;
	b=JSXs2jIMEgaugQNCZ5QttAuJ9tD0C145GVfjVnT3xVuo5BYUOaK3EIgoeMeGyyaP2pYp3Z
	zBQKhfIvbfBqoKegqjfaR7Hms5ALUh8zo9R2emYHFTxxKeGWqImLyEx+VZuvm83ZVoosJA
	zlwYW3ZMXCF0TOXsYYvZR56pPAT/f1g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783237191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2U3/co07P0FjfO8pupYTVfbHIwzb+992bBN9i9egodI=;
	b=4kQxb+ui76Khy0qHN4bjtMUIkCKsIpgIsmjq/eawr6/unkKwGXEy67LxKGL58mNvzs1zkJ
	CzOvydnJ7jsNQ4BQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JSXs2jIM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4kQxb+ui
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783237191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2U3/co07P0FjfO8pupYTVfbHIwzb+992bBN9i9egodI=;
	b=JSXs2jIMEgaugQNCZ5QttAuJ9tD0C145GVfjVnT3xVuo5BYUOaK3EIgoeMeGyyaP2pYp3Z
	zBQKhfIvbfBqoKegqjfaR7Hms5ALUh8zo9R2emYHFTxxKeGWqImLyEx+VZuvm83ZVoosJA
	zlwYW3ZMXCF0TOXsYYvZR56pPAT/f1g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783237191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2U3/co07P0FjfO8pupYTVfbHIwzb+992bBN9i9egodI=;
	b=4kQxb+ui76Khy0qHN4bjtMUIkCKsIpgIsmjq/eawr6/unkKwGXEy67LxKGL58mNvzs1zkJ
	CzOvydnJ7jsNQ4BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A6862779AA;
	Sun,  5 Jul 2026 07:39:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JZ/zJkYKSmpdZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 05 Jul 2026 07:39:50 +0000
Date: Sun, 05 Jul 2026 09:39:50 +0200
Message-ID: <87y0fp6g1l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Malaya Kumar Rout <malayarout91@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mrout@redhat.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/alsa: Fix memory leak in find_controls error path
In-Reply-To: <20260704105736.94874-1-malayarout91@gmail.com>
References: <20260704105736.94874-1-malayarout91@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0256A7580E
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Sat, 04 Jul 2026 12:57:36 +0200,
Malaya Kumar Rout wrote:
> 
> In find_controls(), card_data is allocated with malloc() but when
> snd_ctl_open_lconf() fails, the code jumps to next_card without
> freeing the allocated memory. This results in a memory leak for
> each card where snd_ctl_open_lconf() fails.
> 
> Add free(card_data) before goto next_card to ensure proper cleanup
> of the allocated memory in the error path.
> 
> Fixes: 5aaf9efffc57 ("kselftest: alsa: Add simplistic test for ALSA mixer controls kselftest")
> Signed-off-by: Malaya Kumar Rout <malayarout91@gmail.com>

Applied now.  Thanks.


Takashi
