Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575401;
	b=CoaiyEBAuhrG523EUsYeA8afs9YpZK6TMcXklKR/dG0q7um6pNQxeaPLoZR/l7uAPdH5
	 DgfIvI769X4R/a/O8/zp0s+WEhlAH/oiTxTgD94YfXmVVfjJUGWohUu3bZeJcGsecqNgT
	 2iiXYosHvi5fNAlsFSTR1JKtBG3AhVE3b5vcAfqHKt6RSuH8vl8TlbNS2hIsyJ56osJWG
	 C6dhLweeUgSsul9TzjriFUMS6WX6HqZveEYHwSknXKZTBcSvabjmp1+Qt8uAelxEmajhv
	 JSYt82ZqNcTB5rqHFAo14cZvytXhHc41EzLe8XbIpjTgAxlVRxL+BVVrIRvdR2s7ojA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575401;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=Qefb26IGP5AOdsfXsbEKDWsh35frzAzUc/TON+gbyqA=;
	b=lLOMVUjrKvtSp953eYQtI76k2CWjAc4/+I2sB8zaTTAQM2uqHoRs67KpIJjyck1ezqtv
	 u21/yRWwbUFvEKpRXdZM5003tiU8iWQcvz4qZChah4c5j+CCNDUTPCQcdqVoP0gHKpHsX
	 MuHMcldshqd7bWLZHUDjQIJ0tfaLLw8lMViSj9a6EXrdyT2xx3kWaWDbQy09vs7Xsz4ED
	 l7d8hbAGQO01MYyOTWRRI/HOeN16sZHfiiYpKI0s1FckbqgbjRddPAM30m7ioN75C4nvK
	 yaAp2f8gFBumDh22zDSa6r5t0LLm5MkIjoKpiWgk6heff4a6vyEgJpizkj7T4F5CQUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XbSgxa0b;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xJ6A5euU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XbSgxa0b;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xJ6A5euU;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8AD606A319;
	Wed, 21 Oct 2026 09:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E8AD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XbSgxa0b;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xJ6A5euU;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XbSgxa0b;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xJ6A5euU
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0A7891F798;
	Wed, 21 Oct 2026 09:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792575398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qefb26IGP5AOdsfXsbEKDWsh35frzAzUc/TON+gbyqA=;
	b=XbSgxa0bOIBa5zoEh/9RWoxsPq4EKEehdNGHXAAU+XyEbOvoIW6Tdh0GvTQDfCbYQ53hz9
	fRstEAtqgIk5LwW78KPY9P6/DN9lBTaTgMZMwuF5QDITN1BsdHFtsHMTZpNH9f52OQX1iH
	kbT8EimMk29PAS9IB1Kyv2SeLOK2tNs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792575398;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qefb26IGP5AOdsfXsbEKDWsh35frzAzUc/TON+gbyqA=;
	b=xJ6A5euUGwlnoHjWFJ/cg1xZNQ7rMZSiGeN6gbG4gvfMCkILcyz+8wQb7Xi6ry1yZZ7idi
	TrQd6WjVl6UjMjCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792575398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qefb26IGP5AOdsfXsbEKDWsh35frzAzUc/TON+gbyqA=;
	b=XbSgxa0bOIBa5zoEh/9RWoxsPq4EKEehdNGHXAAU+XyEbOvoIW6Tdh0GvTQDfCbYQ53hz9
	fRstEAtqgIk5LwW78KPY9P6/DN9lBTaTgMZMwuF5QDITN1BsdHFtsHMTZpNH9f52OQX1iH
	kbT8EimMk29PAS9IB1Kyv2SeLOK2tNs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792575398;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qefb26IGP5AOdsfXsbEKDWsh35frzAzUc/TON+gbyqA=;
	b=xJ6A5euUGwlnoHjWFJ/cg1xZNQ7rMZSiGeN6gbG4gvfMCkILcyz+8wQb7Xi6ry1yZZ7idi
	TrQd6WjVl6UjMjCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B023F13518;
	Wed, 21 Oct 2026 09:36:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id s4MgIqWH2GqLHAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 Oct 2026 09:36:37 +0000
Date: Wed, 21 Oct 2026 11:36:37 +0200
Message-ID: <874ieffl96.wl-tiwai@suse.de>
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
Subject: Re: [PATCH 0/2] selftests: ALSA: pcmtest: Fix two test bugs
In-Reply-To: <cover.1792390197.git.sammiee5311@gmail.com>
References: <cover.1792390197.git.sammiee5311@gmail.com>
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
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,kernel.org,perex.cz,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 20 Oct 2026 12:18:35 +0200,
HyeongJun An wrote:
> 
> Two fixes for the pcmtest selftest. The first makes the playback tests
> fail when a transfer fails. The second sizes the pattern buffer to the
> 4096 bytes the driver allows.
> 
> Tested on x86_64 with snd-pcmtest. All five tests pass as before. With
> inject_trigger_err=1 the playback and ni_playback tests passed before
> and now fail. With a 2000-byte pattern on channel 0 four tests failed
> before and now pass.
> 
> HyeongJun An (2):
>   selftests: ALSA: pcmtest: Check the frame count of each transfer
>   selftests: ALSA: pcmtest: Make room for the longest fill pattern

Applied both patches.  Thanks.


Takashi
