Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18C23DCDA5
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 09:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603859; cv=none; b=H2VEBeCVQjPB7jDe/OnbKlfcNd9LMMPNaNPhc37qmdEl1lv9uvMUPQ4K9LbV4dRwhDRzPg3rkr289gEAsUJSs9L58SXiO7jj/Cv5dvXcVoUWNSbMwv+qJX3+Ma/jXxyBqjcSodLylG84ngrZZOlcgIWVxqWCq9WUzVRdBBykUDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603859; c=relaxed/simple;
	bh=Zap8Nf2s7gDAhwnSpmpWsNocOlhBznBtoELIW7UvjrA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ktJvV2RLLuJup8Ug/b6a+Dxi3DsdA9hgoZM998kJzybcSpLic+Ejzp1+PjIxdmpXdwNSKVL6KYc0cBeDGpx96/TKEHBe6b4479On5+qYDJskepwoVngEuysoRp83lqU5Cdz7JQb/5l7n1zqxUfWjDzae9DWDW9hRHRkKM1wRxic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rLaJGNpi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KttgLv7B; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rLaJGNpi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KttgLv7B; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rLaJGNpi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KttgLv7B";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rLaJGNpi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KttgLv7B"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 830D95BCF9;
	Fri, 27 Mar 2026 09:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774603851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gk8PIggsG7ixTKeoOJVzS1Vk4djGPCKMVimJFMweYtY=;
	b=rLaJGNpig/AWsBQfWey0UPR4+34Z6DY4ljKDR+EUDidogU1A1x0MAR7iv9D4CqD8UU6621
	1HUnXGAb0zA/0OvAX/L7MVtG4p64UfOsUK3/YmHpjvtCbAzGM+SnVgXIhQ8CaLLh5OQwym
	W5mWPbAHqA5JtO0QI5o6/v/XYXPRZ3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774603851;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gk8PIggsG7ixTKeoOJVzS1Vk4djGPCKMVimJFMweYtY=;
	b=KttgLv7BTJKcf9hJcqMC4HUChRyeDKv9HlgelOcTnYEuI8Prq4wpNo3BNPiGIMve8FEiJ2
	lbOS1CqSnxurHCCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rLaJGNpi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KttgLv7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774603851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gk8PIggsG7ixTKeoOJVzS1Vk4djGPCKMVimJFMweYtY=;
	b=rLaJGNpig/AWsBQfWey0UPR4+34Z6DY4ljKDR+EUDidogU1A1x0MAR7iv9D4CqD8UU6621
	1HUnXGAb0zA/0OvAX/L7MVtG4p64UfOsUK3/YmHpjvtCbAzGM+SnVgXIhQ8CaLLh5OQwym
	W5mWPbAHqA5JtO0QI5o6/v/XYXPRZ3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774603851;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gk8PIggsG7ixTKeoOJVzS1Vk4djGPCKMVimJFMweYtY=;
	b=KttgLv7BTJKcf9hJcqMC4HUChRyeDKv9HlgelOcTnYEuI8Prq4wpNo3BNPiGIMve8FEiJ2
	lbOS1CqSnxurHCCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 329774A0A2;
	Fri, 27 Mar 2026 09:30:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kBUOC0tOxmmSIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 09:30:51 +0000
Date: Fri, 27 Mar 2026 10:30:50 +0100
Message-ID: <87o6k9sjp1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ben Copeland <ben.copeland@linaro.org>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: ALSA: Skip utimer test when CONFIG_SND_UTIMER is not enabled
In-Reply-To: <20260319124521.191491-1-ben.copeland@linaro.org>
References: <20260319124521.191491-1-ben.copeland@linaro.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,linaro.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 830D95BCF9

On Thu, 19 Mar 2026 13:45:21 +0100,
Ben Copeland wrote:
> 
> The timer_f.utimer test hard-fails with ASSERT_EQ when
> SNDRV_TIMER_IOCTL_CREATE returns -1 on kernels without
> CONFIG_SND_UTIMER. This causes the entire alsa kselftest suite to
> report a failure rather than skipping the unsupported test.
> 
> When CONFIG_SND_UTIMER is not enabled, the ioctl is not recognised and
> the kernel returns -ENOTTY. If the timer device or subdevice does not
> exist, -ENXIO is returned. Skip the test in both cases, but still fail
> on any other unexpected error.
> 
> Suggested-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/linux-kselftest/0e9c25d3-efbd-433b-9fb1-0923010101b9@stanley.mountain/
> Signed-off-by: Ben Copeland <ben.copeland@linaro.org>

Applied to for-next branch now.  Thanks.


Takashi
