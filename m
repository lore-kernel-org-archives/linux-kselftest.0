Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307704;
	b=AUrR6mrugbkjpmHVVNFWhD6C9saK1NJdd6kG/chQec3eT4ArZf8lA3+Kz65NthlHhA0L
	 A5Czdc/8JMqr2YlyeuGRatruPmX4pYWc69cPf3K8x+CSVqRUo3EZPfJjHe1kc1AOIZHjy
	 N+igC1wu3x0PX/LbYIEFaaF02az+JfLlaG8r1Kn5yf82x1giRxn8tsW5TGvnkW2i+j8qY
	 yuFlDwX1zQqKI2gr19DBv8t4R/ZUxt5tlY4CoAo+e+GGVtVjZPdV3OJkcbCNqFUDFPaXs
	 w+RvFNImjOsXFwJNLS1FkX6Syl3QiKPaqKwNQpLgd5D6Zx7V8udsLoy96S+OSkx5idQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307704;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=k703M/piKyZ7PHvfHLHxgLKG63qKCWd6JJ43qPYVsb4=;
	b=YZtoLOnmhSF1rqBc79DQiCz7p9TWjRVk22SJCwzBkH2m5Qj7Ssb6pYK7Er6nciiHwP0H
	 YmYPN8WKLk/3syLMPw5Wufb5w6Ho9fzjo9ty6H6Py0RnJXuTCI98OjPcfxr0YlyWZv0rf
	 roSMs9jpbD9lne6HFFoJSzd6377/akfz5PElr1C7wkwGLqKKVIx4y8kaPn9F990HyEExu
	 FXWVUUeAbABcKX+C+8ZxHPjUo/v8QAB5vjBinYtKdxw9qAEku2tD91qk5RfhSCy0ayiuG
	 Dp2nk3VefYfEltlP4skl2biA5LW6HSjpiB2RXTbd7ZXhZnO3QXj8V6/fb5XtTjFF5Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PEdBu6ae;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=OJjryAXs;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PEdBu6ae;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=OJjryAXs;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E71606A331;
	Tue, 10 Nov 2026 10:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E71606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PEdBu6ae;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=OJjryAXs;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PEdBu6ae;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=OJjryAXs
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7F7541F7A9;
	Tue, 10 Nov 2026 10:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794307702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k703M/piKyZ7PHvfHLHxgLKG63qKCWd6JJ43qPYVsb4=;
	b=PEdBu6aeYbinim2tdZhleV9sVHQtfsHc+2YEfXh8P7eQa1FkwyOMvWaIXPDqdiXzrlL6I3
	kHc0FDGi+XhThTkR476aT0+R8G5zIMLG428M104ofhhiZpXZ117Ka6AZCaknyCdQum1QI+
	60rgQZL1KLWSszMtfRH+AJM2kyzzBbo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794307702;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k703M/piKyZ7PHvfHLHxgLKG63qKCWd6JJ43qPYVsb4=;
	b=OJjryAXs/NBbOB58RfQ0ikLCN+TGmP9sGa1n4fHHnjy9FNcgrzLrvh5NGgKZbPuZdxXrZP
	BDGtNEDT9t9fKbCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794307702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k703M/piKyZ7PHvfHLHxgLKG63qKCWd6JJ43qPYVsb4=;
	b=PEdBu6aeYbinim2tdZhleV9sVHQtfsHc+2YEfXh8P7eQa1FkwyOMvWaIXPDqdiXzrlL6I3
	kHc0FDGi+XhThTkR476aT0+R8G5zIMLG428M104ofhhiZpXZ117Ka6AZCaknyCdQum1QI+
	60rgQZL1KLWSszMtfRH+AJM2kyzzBbo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794307702;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k703M/piKyZ7PHvfHLHxgLKG63qKCWd6JJ43qPYVsb4=;
	b=OJjryAXs/NBbOB58RfQ0ikLCN+TGmP9sGa1n4fHHnjy9FNcgrzLrvh5NGgKZbPuZdxXrZP
	BDGtNEDT9t9fKbCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3FC9E1339F;
	Tue, 10 Nov 2026 10:48:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HALuBnb28mpQPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Nov 2026 10:48:22 +0000
Date: Tue, 10 Nov 2026 11:48:21 +0100
Message-ID: <87qzgtufm2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: tiwai@suse.com,
	broonie@kernel.org,
	perex@perex.cz,
	shuah@kernel.org,
	alyandra5b@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/alsa: Add a test for the sequencer UMP conversion of RPN/NRPN
In-Reply-To: <20261110012213.740288-1-sammiee5311@gmail.com>
References: <20261110012213.740288-1-sammiee5311@gmail.com>
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
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,kernel.org,perex.cz,gmail.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 10 Nov 2026 02:22:13 +0100,
HyeongJun An wrote:
> 
> The sequencer converts MIDI 1.0 CC and CONTROL14 events to UMP for
> UMP clients. Add a test that sends such events from a legacy client to
> a UMP MIDI 2.0 client and checks the RPN/NRPN packets it receives, and
> one that checks that a UMP MIDI 1.0 client gets the CCs as they are.
> 
> The cases cover switching between RPN and NRPN, Data Entry sent with
> nothing selected, repeated Data Entry, Null RPN and NRPN, and the
> CONTROL14 path. Some of them come from the KUnit test in Alyandra
> Zahran Nadhir's patch.
> 
> The test skips when /dev/snd/seq can't be opened or the kernel has no
> UMP support in the sequencer.
> 
> Link: https://lore.kernel.org/all/20261107111056.667-1-alyandra5b@gmail.com/
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
