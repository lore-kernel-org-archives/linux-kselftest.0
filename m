Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587923;
	b=OZBWM1VP+gqJYlWmydvBoG5VVlPART8ZRhe3I0eKPvHIiZPDeunMkZMiG9HOuJMBB0bO
	 3SX6ESlOuKZD6q8XkFtg4163/vX0FykthVIiotW7bk8iHg2I3jX0qCXr3QB/IXlknMLFH
	 nsJn2B3KKV89XjaJbOC/v7vJZKUclu/d5C8IuiPjOLxgR8riPUDH/1i5Rk7fYv/iN0lx6
	 GoUdlJNYjpyEs9NeY7oMkXp9eOv6bm69Bn9toaS/2LWihFkU6sS0yQMZN0I+ogr0D2kBH
	 f3ytfga/koTUg+xugnavf1ISIbal3hxoNyJv5qJYzP27TSeqWqxHlyp2bhdQRa/ClnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587923;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=tWvYcI5ZlBLKYaklk0QxQ2K2rk8HgB95kcupSoHBljc=;
	b=yNXIUOYhusay+FhuJtTeGZbTnMMxz5u9w7vRawpLuIO8DQTGRhw7GKvOMLhV6A3YXEea
	 OnLuEwLvEZhhbJ0PB+Yl/RxdYoaA5tRc86l390g+39YageuU29zfMGXnyuAQ249ygxJJq
	 3aRS9Tm9ixoN7uy45x5/ymROOG6XP6jFMS7jnVwPba4gLdTLEsRIpxLGS8h+UM4hwaQjk
	 cwGOnqz8/o2yEzBujFN5hVuDS1yBliUUUOQ2czXO3etNZuoE+SjgEswHFrA7HWuj7/mf/
	 Q0BAIwEHIcuLcChosfvvyXV50C+UcKz7WpU1O/pJQoYyv4d97zvBAgvT0tepqVbsMqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1HqkgSYX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ql6RRaL1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1HqkgSYX;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ql6RRaL1;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AFF606A319;
	Wed, 21 Oct 2026 13:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31AFF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1HqkgSYX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ql6RRaL1;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1HqkgSYX;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ql6RRaL1
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8D0A521DC7;
	Wed, 21 Oct 2026 13:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792587920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tWvYcI5ZlBLKYaklk0QxQ2K2rk8HgB95kcupSoHBljc=;
	b=1HqkgSYX3nVEGhfGSj/UfxEw0IBJQG6UI4/QStWgHgiUVTUAj2dhu28ti5zfhiCJPkWkVL
	05g8XdiXnwwU7tJ+acAE4+uuzmMeMep3UfhMHo/JRkmx4f2RRPFY0+sXK314vU7i206+ax
	OGKVDhFW534Ba7DpcBzgUH9PR3hxGKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792587920;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tWvYcI5ZlBLKYaklk0QxQ2K2rk8HgB95kcupSoHBljc=;
	b=ql6RRaL1fsjX7UamdoQFicvxKxze3HLTCpT21I4d39ogoyQ7jL69piFwJMrsJGaz35ESGn
	QWLTGBgvVcjdjxBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792587920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tWvYcI5ZlBLKYaklk0QxQ2K2rk8HgB95kcupSoHBljc=;
	b=1HqkgSYX3nVEGhfGSj/UfxEw0IBJQG6UI4/QStWgHgiUVTUAj2dhu28ti5zfhiCJPkWkVL
	05g8XdiXnwwU7tJ+acAE4+uuzmMeMep3UfhMHo/JRkmx4f2RRPFY0+sXK314vU7i206+ax
	OGKVDhFW534Ba7DpcBzgUH9PR3hxGKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792587920;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tWvYcI5ZlBLKYaklk0QxQ2K2rk8HgB95kcupSoHBljc=;
	b=ql6RRaL1fsjX7UamdoQFicvxKxze3HLTCpT21I4d39ogoyQ7jL69piFwJMrsJGaz35ESGn
	QWLTGBgvVcjdjxBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D833134A5;
	Wed, 21 Oct 2026 13:05:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6zFTCpC42GqoeQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 Oct 2026 13:05:20 +0000
Date: Wed, 21 Oct 2026 15:05:19 +0200
Message-ID: <87pkx3dx0w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: ALSA: pcmtest: Compare all captured bytes in ni_capture
In-Reply-To: <20261021112554.4037107-1-sammiee5311@gmail.com>
References: <20261021112554.4037107-1-sammiee5311@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-10.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,kernel.org,perex.cz,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -10.80
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 21 Oct 2026 13:25:54 +0200,
HyeongJun An wrote:
> 
> The ni_capture test reads rate * time frames into each channel buffer
> and then compares rate * time bytes. A frame is sample_size bytes per
> channel, so with S16_LE only the first half of each channel is checked.
> If the second half is wrong the test still passes.
> 
> Compare rate * time * sample_size bytes per channel.
> 
> Fixes: 10b98a4db11a ("selftests: ALSA: Add test for the 'pcmtest' driver")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>

Applied now.  Thanks.


Takashi
