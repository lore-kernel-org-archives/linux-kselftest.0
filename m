Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197452;
	b=I6j2yN+SF5yfA6ijwwXjs+Vn/n9+sUHsQ+8ar+1aZ95J/vUe94Ygmre5LjmHuupw1CPH
	 uYxLZhwToCwUx//BWcZ8aNVD2OFdwlyWSg3jdqIcvkUC2rG+IA0pTNJWf7qCMgmiZTd2k
	 OiITMT+F//z8nrgVCjSPsPXnDHCyp7zro9Q9dQOYxq3hR/Ojf3sDRXDhi2k5nvUZFDaCL
	 ECx7jo7VSjoWe8rJwLT0CzOhlKQdOqWygoZNAuimB//JL+526jTYzERxQn6rk1D8FLKLB
	 zCCF/xZi3aHjUa3+Mq6jOnWwL2Msy17zq0JRHtwvd8Cxth+nF32g6dAT25iX8ktiCWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197452;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=/PT46a5OQHjLVPNOL9vrXw1V6oTcz8SAwynmCtaEe1c=;
	b=3vW2P6xDIs9Om7gCN7zibKPWQJJnccwG9aTcyMjcKL6y6I7b88oDti2lr3ryIfDugm1Z
	 xVF5CW/gs67bB+IpyMk4LYnGKRIUoOazgEdw/d38nW54MUKbTwghuxm4nHOttC2PsmLUa
	 VxyCcaRbf6t47ZQYiH0mK7gWy5FxmXkR2FAf9hBrHNECvqqy9m6Kta0AqBFwVYlq6ONkI
	 WKWIlzV2NW/e7zSc/DIxXy3EncACxsTZtZpuKcQHw9FrUyXs9gKVPLkNoBDcK6AUnCdPt
	 J62WVECHpEnW2kikeHzZdQ33s+WnU6Y+Hyh3xHZdxKcXA2niKSrTv5O5+oH9maQm+5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DKvWZxwz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yhpd7nZe;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DKvWZxwz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yhpd7nZe;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E8D60A380A;
	Wed, 28 Oct 2026 14:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20E8D60A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DKvWZxwz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yhpd7nZe;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DKvWZxwz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yhpd7nZe
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 93661220FB;
	Wed, 28 Oct 2026 14:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793197442; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/PT46a5OQHjLVPNOL9vrXw1V6oTcz8SAwynmCtaEe1c=;
	b=DKvWZxwzDkJbXDy0P6+jx85xmx9QUxpVMKD/2y0AEWF1zrDPHC+zE6BZYMiDslmjxbaOe5
	RX+yalO8CLnYWAJblkPgZiv1gJ6jIBh2rkE3iBxHULAqetrV5cZSxrEId6nnp+Bo+kJSfu
	ZFKdr2Dquf8m14DTOwaE3S/CEVPzFWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793197442;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/PT46a5OQHjLVPNOL9vrXw1V6oTcz8SAwynmCtaEe1c=;
	b=yhpd7nZezvjAErq4Q29OG2O8kgwoRgVCaV++xl/JvxbNR1vYV8GeDPbPUdHp8QQ6TIvJHm
	IgiohLDKGqycfkAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DKvWZxwz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yhpd7nZe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793197442; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/PT46a5OQHjLVPNOL9vrXw1V6oTcz8SAwynmCtaEe1c=;
	b=DKvWZxwzDkJbXDy0P6+jx85xmx9QUxpVMKD/2y0AEWF1zrDPHC+zE6BZYMiDslmjxbaOe5
	RX+yalO8CLnYWAJblkPgZiv1gJ6jIBh2rkE3iBxHULAqetrV5cZSxrEId6nnp+Bo+kJSfu
	ZFKdr2Dquf8m14DTOwaE3S/CEVPzFWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793197442;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/PT46a5OQHjLVPNOL9vrXw1V6oTcz8SAwynmCtaEe1c=;
	b=yhpd7nZezvjAErq4Q29OG2O8kgwoRgVCaV++xl/JvxbNR1vYV8GeDPbPUdHp8QQ6TIvJHm
	IgiohLDKGqycfkAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1CD781342D;
	Wed, 28 Oct 2026 14:24:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3PfsOIEF4mqHcwAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 28 Oct 2026 14:24:02 +0000
Message-ID: <ebb1aa06-60cf-415c-9001-0d8267db81c0@suse.de>
Date: Wed, 28 Oct 2026 15:24:01 +0100
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
Subject: Re: [PATCH RFC net-next v2 5/5] selftests/tls: add KeyUpdate tests
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
References: <20261028-keyupdate-rfc-v2-0-eb5143b4c487@gmail.com>
 <20261028-keyupdate-rfc-v2-5-eb5143b4c487@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261028-keyupdate-rfc-v2-5-eb5143b4c487@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 93661220FB
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.00 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,queasysnail.net,davemloft.net,redhat.com,lwn.net,linuxfoundation.org,infradead.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.00

On 10/28/26 2:52 PM, Martin Belanger via B4 Relay wrote:
> From: Martin Belanger <martin.belanger@dell.com>
> 
> Test the in-kernel KeyUpdate on a bidirectional connection with both
> traffic secrets registered on each socket:
> 
> - registration errors: wrong length, missing key, TLS 1.2, SM4, the
>    RX secret before the TX secret, and a secret that does not give the
>    installed key;
> - KeyUpdates in both directions with data around them;
> - a data record, a KeyUpdate and another data record queued before
>    the first read;
> - update_requested: the peer answers before its next data, and a
>    second request waits for the answer;
> - splice() across a KeyUpdate;
> - a key installed with TLS_TX removes the registered secrets;
> - after a key installed with TLS_RX, a new update_requested is
>    accepted;
> - TLS_TX_KEY_UPDATE on a shut down socket does not raise SIGPIPE;
> - more than 8 KeyUpdates in one second, and an invalid
>    request_update value, end the connection.
> 
> The keys are derived from the secrets with HKDF-Expand-Label, with the
> HMAC of the kernel through AF_ALG.
> 
> Assisted-by: LLM
> Signed-off-by: Martin Belanger <martin.belanger@dell.com>
> ---
>   tools/testing/selftests/net/config |   4 +
>   tools/testing/selftests/net/tls.c  | 412 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 416 insertions(+)
> 

Reviewed-by: Hannes Reinecke <hare@kernel.org>
Cheers,

Hannes

-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
