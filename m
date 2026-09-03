Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430344DBD8E;
	Thu,  3 Sep 2026 16:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451687; cv=none; b=hyDyoJrahmPch/NqIh0NWJq2IsEh8yp/Zy8gDB7szsMQn9RZajiVS359n6F4nC/FSndwGLNVH5Qa/rTH12IjX9i5jLZqbwDBkGBf84iTFzljogFOM4AX1G6q2GApJFoL0xkdWYdFsbkBLDpkvFG5T8LX9C+s72ahJi0dQ9uQtlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451687; c=relaxed/simple;
	bh=QQHY7VAbEmpS20mi2zTXJgznuJ4zr7QMNhtHPB/CPKE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GbI7NnZi9CUgg3stjCWrXkYJWFCkCVQVV+zzt81rfgbLsOiorQjJWC5ZvGzyEPge6rqqX3IiayNrdl1NyJidBErG/ERQDOe6foVMKTx3BUwwm+LxJJfIQ9NVXBwMZ2ts2WaAEilhgaOSRvnZMWlIc05QcX1Jkjz+0WAQdc+ktz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OxZrOVI0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EEvzfYHf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aMvmeg3t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QAdTSwsK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OxZrOVI0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EEvzfYHf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aMvmeg3t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QAdTSwsK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DBBD21FD8F;
	Thu,  3 Sep 2026 16:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788451680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s7qk4rF4ucrFATvBIIWGJNf/bxF0erj4kBt1GCZQoPQ=;
	b=OxZrOVI0EZb6qBn1LtUrsSj5JFsL9e948LQnxr5NVGyiC/9U1EsVJ4rQ6zaL+c49IaKjaG
	ldupme80hMXki8t2x24w3MjofpoIcBRavc4YM4QPIpgBWBybdHAqKDXayUDkclGF4Jvp/v
	9YO16/tey4mVo/GGN6WUTmizHbGBa4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788451680;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s7qk4rF4ucrFATvBIIWGJNf/bxF0erj4kBt1GCZQoPQ=;
	b=EEvzfYHfVfnac3ZFkdXrxocjNBduX44mL1NaIde4b4yHD1UtgYndiUDip0nnaVpCagb5dP
	vE2U9OWM22/zVhAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788451675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s7qk4rF4ucrFATvBIIWGJNf/bxF0erj4kBt1GCZQoPQ=;
	b=aMvmeg3tUCKzzIcv93JJJ/fIo13/pQmXF8IvChHzvJKuALDGxMxb0Sm08oL5X/S/lUQw/J
	Dw5DzhyLEiQtOxvkPQxRJuBejdMV1J1lf4h//KEA68CiojDg80WPJyCGxmjHtms2xy7szG
	SwJABsUDcJOv7tfiOrM0ozyXqoFKYjM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788451675;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s7qk4rF4ucrFATvBIIWGJNf/bxF0erj4kBt1GCZQoPQ=;
	b=QAdTSwsK6TqU97LEfxXq8DqhVwgUhFvjWQZhDy+bz1blbpJ9xwdSfssOLCGmiBx9wZuD3r
	fWojKzwuEOAITXDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A689136D9;
	Thu,  3 Sep 2026 16:07:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id N1SkIFubmWoIeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Sep 2026 16:07:55 +0000
Date: Thu, 03 Sep 2026 18:07:55 +0200
Message-ID: <87o6ee71yc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/alsa: Fix the step check for INTEGER controls
In-Reply-To: <20260903123832.97377-1-sammiee5311@gmail.com>
References: <20260903123832.97377-1-sammiee5311@gmail.com>
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Thu, 03 Sep 2026 14:38:32 +0200,
HyeongJun An wrote:
> 
> The modulo sits inside the subtraction, so the check evaluates
> int_val - (min % step) rather than (int_val - min) % step. The
> INTEGER64 branch below it is parenthesised correctly.
> 
> The written form passes only when the value equals min % step, and such
> a value is always on a step boundary, so it never misses a real
> violation. It only reports valid values as invalid.
> 
> snd-aloop declares step 1 on four controls, so every non-zero value on
> them is reported. Before:
> 
>   # PCM Rate Shift 100000.0 value 100000 invalid for step 1 minimum 80000
>   # Totals: pass:660 fail:101 xfail:0 xpass:0 skip:296 error:0
> 
> After, same card, nothing else changed:
> 
>   # Totals: pass:740 fail:21 xfail:0 xpass:0 skip:296 error:0
> 
> Eighteen files under sound/ declare a non-zero step.
> 
> Fixes: 5aaf9efffc57 ("kselftest: alsa: Add simplistic test for ALSA mixer controls kselftest")
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> Assisted-by: Claude:claude-opus-5

Applied now.  Thanks.


Takashi
