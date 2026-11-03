Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690284;
	b=dfnKp7Ft9wX15ngnzIyOoDfxqXBc0edPulVk2G6kON+q8TcU9m/IKGsruIYCpX7aRm3c
	 imJhPjQkEjlE23KtpzO84xP9tnDsEoclIWg5tCP/4G8rrCiU0Mp2CvpTjW67q3iQ1JS8U
	 HH43lHbiq6dGIRrecSPXs8xkgeq+TPSJf2OqRSUaDbLAXJWGiIBH5Lox4i1Rat9ry9T6/
	 bXhkxt1nJjp40yRxcN9CFeotQ3Eax5plECeZaIsxtea4tVvVsXGzIcCyhtRfc6ydIra06
	 FeuWtMh6zqjIPwmD4qpAZEJDW9x3QbxRoAYyeHMalVuuyuNVSaiG2D0iS39Dc5tmDlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690284;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Score;
	bh=lpocdNVUbmYyyd056ZZlbZF2yCCZZiKZbl6Sa7xUaRM=;
	b=LU9YCxVUXWINibZgR7sLRXjg++J+FxQ042y/9SQsXDiKzfRHAcnAv9wl4alf4Lh9N9hb
	 HgfgzrWTJo3Tz1ATadpSwadr3E7JpVTkhSjp8NT9oOaSyEYQ/ltIfqGcu1YL7o8GR69ZN
	 wm1AagvOTowVPJbsDbfxWY7PmAx3t/NZzxgIggcIG9IoExx4/rp4d9WG1BoSgzTgjJeig
	 rgorB4JSCbcafQltcR3PrKKa0qEh+NwbuwUI9yIKLiP4aMT3SRwG0pjpzMwGO5mFDNDwB
	 L4j4PYJm7rfZl/KHjDG/4ErX5pMVArwx8J/xvsDho41pzlnTTn9cOq/XDP1jQMT80nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FbXFSRy6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="aMl3/vL3";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FbXFSRy6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="aMl3/vL3";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE33606A337;
	Tue,  3 Nov 2026 07:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BE33606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FbXFSRy6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aMl3/vL3;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FbXFSRy6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aMl3/vL3
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4A3D41F830;
	Tue,  3 Nov 2026 07:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793690275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lpocdNVUbmYyyd056ZZlbZF2yCCZZiKZbl6Sa7xUaRM=;
	b=FbXFSRy6ytSYU92ZOd8VR7iCCxOCv4lXwxN8kLqornC86vh8rlG8Iql8mTCShHMM2nG2Tw
	wK1oel4EUgMvtFFo2Dz6x6njCXrIO9lnOPVYuCpAJCZKq53wtgrGrbcTvDNqhNd1LksW4b
	pMpyt3hf4+ZbmQsui2fAUF48LgwN/TY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793690275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lpocdNVUbmYyyd056ZZlbZF2yCCZZiKZbl6Sa7xUaRM=;
	b=aMl3/vL3fU3giMRWG0V/pApmNtVe1Hnpuf0lkMH6KWd1RnifQVI7ZHEVWhXecpwUBHCPWf
	Lkl6kuCS4mgHW5Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793690275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lpocdNVUbmYyyd056ZZlbZF2yCCZZiKZbl6Sa7xUaRM=;
	b=FbXFSRy6ytSYU92ZOd8VR7iCCxOCv4lXwxN8kLqornC86vh8rlG8Iql8mTCShHMM2nG2Tw
	wK1oel4EUgMvtFFo2Dz6x6njCXrIO9lnOPVYuCpAJCZKq53wtgrGrbcTvDNqhNd1LksW4b
	pMpyt3hf4+ZbmQsui2fAUF48LgwN/TY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793690275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lpocdNVUbmYyyd056ZZlbZF2yCCZZiKZbl6Sa7xUaRM=;
	b=aMl3/vL3fU3giMRWG0V/pApmNtVe1Hnpuf0lkMH6KWd1RnifQVI7ZHEVWhXecpwUBHCPWf
	Lkl6kuCS4mgHW5Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C6D7134B8;
	Tue,  3 Nov 2026 07:17:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id E4UCFaKK6WozPwAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 03 Nov 2026 07:17:54 +0000
Message-ID: <3798994b-f252-45d9-80ad-e98932d9c2c0@suse.de>
Date: Tue, 3 Nov 2026 08:17:54 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 4/5] tls: send a KeyUpdate at the record limit
 and on request
To: martin.nvme.dev@gmail.com, John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>,
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Martin Belanger <martin.belanger@dell.com>
References: <20261102-keyupdate-rfc-v4-0-f17419972b9f@gmail.com>
 <20261102-keyupdate-rfc-v4-4-f17419972b9f@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261102-keyupdate-rfc-v4-4-f17419972b9f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-11.79 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,queasysnail.net,davemloft.net,redhat.com,lwn.net,linuxfoundation.org,infradead.org];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -11.79

On 11/2/26 5:58 PM, Martin Belanger via B4 Relay wrote:
> From: Martin Belanger <martin.belanger@dell.com>
> 
> RFC 9846 section 5.5 requires a key update before the key reaches its
> usage limit, 2^24.5 full-size records for AES-GCM. The limit counts
> records, and only the record layer knows where records start and end.
> Section 4.7.3 also requires a reply to a KeyUpdate with
> update_requested, sent before the next Application Data record. Both
> need a KeyUpdate at an exact position in the record stream.
> 
> For a socket with a registered TX secret, send a KeyUpdate before the
> next Application Data record when the key has protected 2^24 records, as
> GnuTLS does, or when the peer asked for one. ChaCha20-Poly1305 has no
> record limit. The KeyUpdate is sent as a handshake record, which closes
> the open data record first. Pending encryptions are then completed, and
> only then is the next key installed.
> 
> Add TLS_TX_KEY_UPDATE to send a KeyUpdate now, optionally asking the
> peer to update too. It can only bring a KeyUpdate forward: the record
> limit is enforced either way. Following section 4.7.3, a new request
> to the peer waits for the answer to the previous one, and no more than
> 2^48-1 epochs are used.
> 
> Signed-off-by: Martin Belanger <martin.belanger@dell.com>
> ---
>   Documentation/networking/tls.rst |  17 +++++
>   include/net/tls.h                |   5 +-
>   include/uapi/linux/tls.h         |   1 +
>   net/tls/tls.h                    |   1 +
>   net/tls/tls_keyupdate.c          |   5 ++
>   net/tls/tls_main.c               |  38 +++++++++-
>   net/tls/tls_sw.c                 | 160 +++++++++++++++++++++++++++++++++++++++
>   7 files changed, 225 insertions(+), 2 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
