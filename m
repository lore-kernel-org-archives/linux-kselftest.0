Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609631;
	b=ef1yOwpDTYVYMYbyB1ktXclCmFU3vzO4I2bvAWGyJMzuEk77jLwtzmRQR8Zk7ft1B+6B
	 T/LRo+EYeGQdAQPTpHJ0yExEDG6mR8GzzDQcrBz9ocyDs7NwmO6SU0ZaQsXKrsHAVeCkh
	 rKGG28WAUKIK3a+4R1Hj1yiZOqAOSqHyo4KNI4Gq6sNOQpfJFfk5TpIpQftKMl/92LIi6
	 YI/kkOXnrvOvPhT/yAOjqt6KdJS7cPufA20f+Emm0SnfM8EX2zzQpLtlzDww02rLKH+1B
	 abQIPFdAnW+LcPT6xIs4xYBTz7VpNMR9PxUPFtQ0G9ixtXx17w9enMMONitIGs6CwHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609631;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=+KGaFK0hXbsr6P3pyaOfsnWeHMObgqJEyVunXcd4Hmc=;
	b=i04+Bv5DMqs1+yyW3KWu4lKSRvyn44UJjWMGAE5VX+dWde2TLRChQt9vKrFJCr2hVL77
	 J84f609t6Bu14VHPki9/jb7waLtbt3z2NkLMig1jcmk5ymaZLVQtca590H1dip5UtrX35
	 t+HB8to7C1XfPN/dVJPVYZZeKxNoOjD6Y0023bZQ40r28uiVaoujx9HO7wJitzoBRlMzw
	 50qXWAS1KfvReoiC1s8XtKJ3W6xVs3JcImi7JZBYsWAZ39BVI8CvgcgDWxowYcygFRpKO
	 SswjhK0ch4xPzsy8QwUC1cihOpQHybtpA6qLc7kBxoMj04TW7Y7TRe1fu/pXXWVX3Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UcPPE8QJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BzsyZ33W;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UcPPE8QJ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BzsyZ33W;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF52606A332;
	Mon,  2 Nov 2026 08:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDF52606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UcPPE8QJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BzsyZ33W;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UcPPE8QJ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BzsyZ33W
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 718791F7CE;
	Mon,  2 Nov 2026 08:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793609629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+KGaFK0hXbsr6P3pyaOfsnWeHMObgqJEyVunXcd4Hmc=;
	b=UcPPE8QJ8lG8ZGClFH9L+PfqufKn0HrKewSGAe8xQCk9x843/7U2MZoIi5ZUCuL9aJElqt
	Vwn10Znha/v6c3Kf1TtaxdSSuDFDm6SW9anEv7AKeBFLp+XSEuZ2wZkUttB3K1FxMYSgp5
	xwVqv7Pm5/H5NK6Ko4JBi2QtFjWaIoQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793609629;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+KGaFK0hXbsr6P3pyaOfsnWeHMObgqJEyVunXcd4Hmc=;
	b=BzsyZ33WIy9qY2wAsoT6BKk68KjFGVmUplF+ut/pbfR0+6tS4HArNJFn6G8FoR/9RPqmh8
	qKtZePvgnrNKLrAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UcPPE8QJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BzsyZ33W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793609629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+KGaFK0hXbsr6P3pyaOfsnWeHMObgqJEyVunXcd4Hmc=;
	b=UcPPE8QJ8lG8ZGClFH9L+PfqufKn0HrKewSGAe8xQCk9x843/7U2MZoIi5ZUCuL9aJElqt
	Vwn10Znha/v6c3Kf1TtaxdSSuDFDm6SW9anEv7AKeBFLp+XSEuZ2wZkUttB3K1FxMYSgp5
	xwVqv7Pm5/H5NK6Ko4JBi2QtFjWaIoQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793609629;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+KGaFK0hXbsr6P3pyaOfsnWeHMObgqJEyVunXcd4Hmc=;
	b=BzsyZ33WIy9qY2wAsoT6BKk68KjFGVmUplF+ut/pbfR0+6tS4HArNJFn6G8FoR/9RPqmh8
	qKtZePvgnrNKLrAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 197AE134B8;
	Mon,  2 Nov 2026 08:53:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tjHCOJxP6GpDTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Nov 2026 08:53:49 +0000
Date: Mon, 02 Nov 2026 09:53:48 +0100
Message-ID: <87ik2f4ns3.wl-tiwai@suse.de>
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
Subject: Re: [PATCH 0/3] selftests: ALSA: pcmtest: Test error injection and pause
In-Reply-To: <cover.1792660433.git.sammiee5311@gmail.com>
References: <cover.1792660433.git.sammiee5311@gmail.com>
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
X-Rspamd-Queue-Id: 718791F7CE
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,kernel.org,perex.cz,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -11.01

On Thu, 22 Oct 2026 13:12:41 +0200,
HyeongJun An wrote:
> 
> The pcmtest driver can return errors from its PCM callbacks and
> supports pause, but the selftest covers neither. This series adds tests
> for both.
> 
> Patch 1 moves the capture data check into a helper, so patch 3 can
> reuse it. Patch 2 tests each inject_*_err parameter. Patch 3 tests
> pausing a capture stream.
> 
> Tested on x86_64 with the sound/for-next driver, built for a 6.17 host.
> All 10 tests pass in three runs. To check that the pause test catches
> real bugs, I loaded two broken drivers. One keeps running on PAUSE_PUSH.
> The other restarts the data on PAUSE_RELEASE. Only capture_pause fails
> on each.
> 
> HyeongJun An (3):
>   selftests: ALSA: pcmtest: Move the capture data check into a helper
>   selftests: ALSA: pcmtest: Test errors from the PCM callbacks
>   selftests: ALSA: pcmtest: Test pausing a capture stream

Applied to for-next branch now.  Thanks.


Takashi
