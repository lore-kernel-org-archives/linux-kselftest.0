Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831425;
	b=oWs+QnNs40RP4Wpm4mn3cb3YnqOePSnEdb7ZF4GKoINxWu9iBtwF+BOXjCw33AE2gDO1
	 nt61lf8EB88BWUToJmXMEw4YNokWsdFgEXrISwaWmLgTzAtS16Wswi+0ilCphiNvUBgHv
	 qE61s09DCk7o5WmbuEC5ipVI3h7mC6AY860VRdo1tz9WoAHDb7YmOPGnYw/iifnflwbeA
	 REtBcSaeP3VkKWxQwmKAp7rQCxVy0/n5cpEHfm1zbmH6rQokpU9E6Zh6ZxNMLLvYq2zbu
	 cif/lWFttQmNgPWPs0SUD6Pv5lKQ8mZBmKXKXI6XOGsY/JQZ+uOzMzBGI9J52NdwOlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831425;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=kRV4hRk2MNBPO2QdckWnPBfCWx84W7jJRJFVVEtCjZo=;
	b=U6ulr3I8rg9QHSgArC9tRiTI85/bNokudeTjep727g+QgfyvHEQeyNVlAwhZnZzWge02
	 91HZzHqCTGRLoD1YJRGgzabqVoVquaNFmoGGYVhmg3bCzIrSXj0LpEbPSCgDt3gQAu4E8
	 8Y8Rt/z+0MoIlpuWElC6gUP4Q6368veFhZ78qBW/d7+RtPRcy0lXyNbPh9u/A1C/VFcZp
	 GNsqM3j57Tcbn1zniTSu/3RbKCaXZ+Mg0xXmrN8McVi+irJ7yiVdFh0xTqk5IcKTY8dbq
	 O59pScDFPmqNmCLo79/Fhf68YUxlhJei9BVkN8uD6ENMShBQgyLhoDh64M4RoAT4aqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=dx2WKFmz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Zsx4xFdk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=dx2WKFmz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Zsx4xFdk;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8099606A32A;
	Mon, 16 Nov 2026 12:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8099606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=dx2WKFmz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Zsx4xFdk;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=dx2WKFmz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Zsx4xFdk
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3E7AA1FBA8;
	Mon, 16 Nov 2026 12:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794831423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kRV4hRk2MNBPO2QdckWnPBfCWx84W7jJRJFVVEtCjZo=;
	b=dx2WKFmzkR1qGmGhNlbR16KwKmHdB4znygcRQBQobld0V/Ki4b/axzqCOOxpdfxiZhqRbK
	TjGGxqAE+T8o6yd93E91j/XML+TIvq/WjzsMKl18wu5QSh0o609/iaR7PNmxNJXz1xLHeZ
	Oxd0jHkgEcZphhQV3cmAmZvKi+Kq/Oo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794831423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kRV4hRk2MNBPO2QdckWnPBfCWx84W7jJRJFVVEtCjZo=;
	b=Zsx4xFdkH5iTW9IegQE7wXwVyFuUrbHPU5wmiI25LKrgptQi4ubacs9Jzgnw2uX9E+vblt
	mDtOrpPtKKa7VFCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794831423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kRV4hRk2MNBPO2QdckWnPBfCWx84W7jJRJFVVEtCjZo=;
	b=dx2WKFmzkR1qGmGhNlbR16KwKmHdB4znygcRQBQobld0V/Ki4b/axzqCOOxpdfxiZhqRbK
	TjGGxqAE+T8o6yd93E91j/XML+TIvq/WjzsMKl18wu5QSh0o609/iaR7PNmxNJXz1xLHeZ
	Oxd0jHkgEcZphhQV3cmAmZvKi+Kq/Oo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794831423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kRV4hRk2MNBPO2QdckWnPBfCWx84W7jJRJFVVEtCjZo=;
	b=Zsx4xFdkH5iTW9IegQE7wXwVyFuUrbHPU5wmiI25LKrgptQi4ubacs9Jzgnw2uX9E+vblt
	mDtOrpPtKKa7VFCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D67681334C;
	Mon, 16 Nov 2026 12:17:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oZULKz70+mq8WwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Nov 2026 12:17:02 +0000
Date: Mon, 16 Nov 2026 13:17:02 +0100
Message-ID: <877bidynr5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] ALSA: seq: ump: Fix Note On/Off and key pressure conversion
In-Reply-To: <20261116030338.422671-1-sammiee5311@gmail.com>
References: <20261116030338.422671-1-sammiee5311@gmail.com>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Mon, 16 Nov 2026 04:03:33 +0100,
HyeongJun An wrote:
> 
> Hello Takashi,
> 
> While extending seq-ump-test, I found three conversion bugs in
> seq_ump_convert.c. In each case the UMP core or the other sequencer
> path already does the right thing, and the fix follows it.
> 
> Patches 1-3 are the fixes. They also apply to for-linus. Patch 4 adds
> the tests on top of seq-ump-test.c in for-next.
> 
> Without patches 1-3, the new tests midi1_key_pressure,
> ump_midi1_to_midi2_note and ump_midi2_to_midi1_note fail and the other
> 25 pass. With them, all 28 pass.
> 
> Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64 under
> qemu, on sound/for-next.
> 
> Best regards,
> HyeongJun An
> 
> HyeongJun An (4):
>   ALSA: seq: ump: Don't turn a zero key pressure into a Note Off
>   ALSA: seq: ump: Convert a zero-velocity Note On to Note Off for MIDI
>     2.0
>   ALSA: seq: ump: Keep a soft MIDI 2.0 Note On from becoming a Note Off
>   selftests/alsa: Test the sequencer UMP Note On/Off conversion

Applied all four patches now to for-next branch.  Thanks.


Takashi
