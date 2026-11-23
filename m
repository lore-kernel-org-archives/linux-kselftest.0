Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424796;
	b=gKtMLe9O9XBKyX0timOy/K3RU6SIWDxX84TOnveeL5UhqgHiWQlNdlqgCMTWmuv5w8r+
	 hUlXBraX7u/zPVzh8W4mH2y3tQRGdbE4IVu6QRzWJWWsNzQg9Nj/wIKNgQY+/YKcqqbDX
	 j9EL9FO8v2f16GFlLTbKUeXCJkfgG14FGdaCNsDThUDjSLzdWB+MDytnLL08zBKzUveWo
	 WBO1lKes/xWv4v5ptenStFEOhp0VPyA1RVmUykSxLrU+oUr2eJ0cA8RP+sqJbuA+5hOi4
	 lZ/YwnmCvZ/V+7D+3uTkiER6GFgJudARpg2186kHqCxUCJadMm2chAAs9Shy7V3lzHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424796;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=15Ht46g1Fi4jbVj8JCWcJmUreEdiS3C7u0Rehkt5Jo8=;
	b=Ey1qGW7vwGIyVLNi9CF8mk1uL+k+6E2ZDjDsG8JqANB01VpLRB62xMJ/xQv+FWm4IFN1
	 0fAsPmqNVT/AJ5RHc6PqxhPUbKM4vAkHAybiGaqG1E8m2OJy/05GfDqi8+dC0WkwdX+NI
	 NLgDXX3QQ9uDz/qIGB6cfCvodLfb20aWIqMjVTGdoRcImz7Jm1G4W+Ka3no7PxOFLnP9M
	 FP3ODnCjHrxJy0pXwVXdiGsrtrMIZClj/lCy/e9V6D0XxcpPEtIqBFGq0qtlx0OkWklm8
	 7EgIn/xwQBcuSzUttXzDGvIeUBNlT9vnhqQvt7cxhcpEf/rMcLpyW+jxvtFU00r3cLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UYkdOdWm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Loj1Wq1q;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wXQMwfa+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zYZ0mDRE;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8041C606A327;
	Mon, 23 Nov 2026 09:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8041C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UYkdOdWm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Loj1Wq1q;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wXQMwfa+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zYZ0mDRE
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BF84D2202D;
	Mon, 23 Nov 2026 09:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795424793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=15Ht46g1Fi4jbVj8JCWcJmUreEdiS3C7u0Rehkt5Jo8=;
	b=UYkdOdWm5DVMqIBoabCMneMs/9fc0q22E7PrhHFWwYD+plWFnuYeUmsoUCaGCizRttdTgE
	RgiHZGN2WIY36dHPde1NipXUxLqE1iiSHzDVTu/DELHtxhJL6C7PrVLDe/WsWShfMEPvSS
	xUKhll+vAWkGK9vswCMg5ImXiB3ipBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795424793;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=15Ht46g1Fi4jbVj8JCWcJmUreEdiS3C7u0Rehkt5Jo8=;
	b=Loj1Wq1q5CJ2ZMC24+O7a//o1TdpL9FERsJ0Mj+jK7yP85MHCFFevjmN4QdYfl5aq8mwya
	XY8bU5ieXL/zIdBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795424792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=15Ht46g1Fi4jbVj8JCWcJmUreEdiS3C7u0Rehkt5Jo8=;
	b=wXQMwfa+rOsy0CL49zSxGW5rYxSe5oXzJUsjnFzrkIUda/78Y5XTbZAKvUmESpflGU39R+
	vLd6vCDkEPc3LhlySJk1unes4C/VauERrKlvULvaPpwzVZyimJcZ5ND/SENnomlnMXEQDZ
	ofb0WtnDbVZQVcqsUIRFKAjSSwhMBEY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795424792;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=15Ht46g1Fi4jbVj8JCWcJmUreEdiS3C7u0Rehkt5Jo8=;
	b=zYZ0mDREy3zRaJ8AQrhDDcimAh9NGWGOC7IwcJQuspcBLfBvUiJ7OfWaWUcBlXAAtyiC4f
	jqryDnc+SBnrAnAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 659F313532;
	Mon, 23 Nov 2026 09:06:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fHbIDRgCBGs5DAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Nov 2026 09:06:32 +0000
Date: Mon, 23 Nov 2026 10:06:31 +0100
Message-ID: <87mrqzdii0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: seq: ump: Convert MIDI 2.0 RPN and NRPN for MIDI 1.0 clients
In-Reply-To: <20261122103611.3264343-1-sammiee5311@gmail.com>
References: <20261122103611.3264343-1-sammiee5311@gmail.com>
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

On Sun, 22 Nov 2026 11:36:09 +0100,
HyeongJun An wrote:
> 
> A UMP MIDI 1.0 client gets nothing when a UMP MIDI 2.0 client sends an
> RPN or NRPN. Patch 1 converts them to CCs the way the core converter
> does, and patch 2 adds a test.
> 
> A related question. In the other direction, CC 101, 100, 6 and 38 from
> a UMP MIDI 1.0 client reach a MIDI 2.0 client as four MIDI 2.0 CC
> messages. The same CCs from a legacy client are combined into one RPN
> message by cc_ev_to_ump_midi2(). Should cvt_ump_midi1_to_midi2() do
> that too? I can send it if you want it.
> 
> Tested in QEMU (x86_64) on sound/for-next 1afd6b7547b2. seq-ump-test
> passes 28 of 29 without patch 1, where the new test gets no packets,
> and 29 of 29 with it.
> 
> Prepared with Claude Code (Claude Opus 5.5).
> 
> HyeongJun An (2):
>   ALSA: seq: ump: Don't drop MIDI 2.0 RPN and NRPN for MIDI 1.0 clients
>   selftests/alsa: Test the sequencer UMP MIDI 2.0 RPN conversion

Applied both patches to for-next branch.  Thanks.


Takashi
