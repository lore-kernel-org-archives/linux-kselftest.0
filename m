Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999670;
	b=eFYwgBkr6GUlPF0/ULpMJnBD/CmFRtBS0dhfw9KtVSrTPea7XPHO7lOq4noNdBtiuY3k
	 A6s7n2DBd3Dl3RA5lhdLOlJIsWdhfUhIdkTLl+RJ46QiVVJ96o8Bdl0TNwxFWJ2868zIk
	 R1bgz/aJxc14IfcKs7wc3n0K3cFTRWaj+S1bnAjxCDLLCne4Q+tk/0DsgetV/fnwumiW+
	 1iNM9rGrJ2esr90u8JCbFXOmzYiyD3vj5pqN5yz8dX3rQx0V0ZWjPLpBD6txlFe8lBblM
	 MmZ4NsCIdr/rmBG/vfHkq0CkEUiK9eJ58N/MSsHhkH8mlYvFwxg81945Jayiq3PVfWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999670;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=xd+Q2GNr8nIy5+L7Fq89NHZ6U8XPfuMrTobDomthdxI=;
	b=rXKGDVtRvtInJ1SkbgZvsLrF4BX1jUECKbz8+ZCxGJfQLZ7peDJ0W1oF+s8wHjuggfVs
	 KKIj7urH2mpFTS5nWruczJv1IymXVU5KBcPCHo6p7AVEuXTdWEgB+d0gfOPY2QL4ZRihJ
	 YvI3hS9LvD1AH/wdsM9j2klkDrw3FkoaF1JoEoNRKxELBuCAexxhihlrzZf5tkqMTDx7t
	 ndtmC7lnKHUWRM9G4LskKiXiOtTkb1nc6693FmUPVOf6d7Q6FUCj0wmWchibH7xbWKvA1
	 jQ+LEeK8GvX74JT3ZhB9rQ5C6a11s8ng8cU3f+ZLzux+UentU+viYuIRJJV/Sn5v46Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XFmpJEfN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="DhH8VB/E";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="v4Lrp/Vh";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=surgh2wM;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FFD606A31D;
	Mon, 26 Oct 2026 07:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7FFD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XFmpJEfN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=DhH8VB/E;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=v4Lrp/Vh;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=surgh2wM
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 28DB01F74D;
	Mon, 26 Oct 2026 07:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792999660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xd+Q2GNr8nIy5+L7Fq89NHZ6U8XPfuMrTobDomthdxI=;
	b=XFmpJEfN+4BximqlWLj734i2buybpqq7hSBUakhvVdFCDA0ETnerOQobVI9bR092EnW023
	4O2jHcdJ9hnWOyJbucj25hZcoJWNAJTH9D9C0nYhiJEzlY92tYp5+bE1sajGN02Do1u88/
	PoA+Jnyp6/hQ2YTJtpyyTO4udiQGAsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792999660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xd+Q2GNr8nIy5+L7Fq89NHZ6U8XPfuMrTobDomthdxI=;
	b=DhH8VB/EEl18g9rmCBEKrLTEazdhGCHMdmfz2cXpV6C0PhFF/MEOWvljPRG3LSE44332zu
	D1uJF1/0rT8ypEDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="v4Lrp/Vh";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=surgh2wM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792999659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xd+Q2GNr8nIy5+L7Fq89NHZ6U8XPfuMrTobDomthdxI=;
	b=v4Lrp/Vh4IDINCIDmCuvVBOR7XBMupafNbV/FgT0/bCZPm7Mz1gUzPPN9M/pjXoyQnWFUR
	0X21T8Ciijm6RHojTKQahKBP2xESGFmpoqqSidBRGTZ/RUPObhkjXzgc92HtI02F5QghhC
	zQhiMOEqs0yVVNeL0kG0ISnw0XJVEdk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792999659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xd+Q2GNr8nIy5+L7Fq89NHZ6U8XPfuMrTobDomthdxI=;
	b=surgh2wMSmw14witl+4e5hq+ISCfaVtVy/CTFbeBFCjXw8XQL41QW9GgiNqpB8amLWwebe
	2XlSadtOKNm0lJAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 357E213319;
	Mon, 26 Oct 2026 07:27:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DOCtAOoA32o6dwAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 26 Oct 2026 07:27:38 +0000
Message-ID: <c75aa5d6-5037-4489-99e0-3e38528e10d0@suse.de>
Date: Mon, 26 Oct 2026 08:27:37 +0100
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
Subject: Re: [PATCH RFC net-next 1/5] tls: add HKDF-Expand-Label for the TLS
 1.3 key schedule
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
References: <20261025-keyupdate-rfc-v1-0-60b7756eccbd@gmail.com>
 <20261025-keyupdate-rfc-v1-1-60b7756eccbd@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261025-keyupdate-rfc-v1-1-60b7756eccbd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 28DB01F74D
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
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,queasysnail.net,davemloft.net,redhat.com,lwn.net,linuxfoundation.org,infradead.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: -12.00

On 10/26/26 1:36 AM, Martin Belanger via B4 Relay wrote:
> From: Martin Belanger <martin.belanger@dell.com>
> 
> A TLS 1.3 KeyUpdate derives the next traffic secret, key and IV with
> HKDF-Expand-Label (RFC 9846, section 7.2). Add the helper for the
> kernel to do this itself.
> 
> Only the part of the key schedule after the handshake is needed. The
> input is a traffic secret, which is already a pseudorandom key, so
> HKDF-Extract is not needed. Each output is at most Hash.length bytes,
> so each derivation is a single HMAC with the library SHA-256 or SHA-384
> functions.
> 
> Assisted-by: LLM
> Signed-off-by: Martin Belanger <martin.belanger@dell.com>
> ---
>   net/tls/Kconfig    |  2 ++
>   net/tls/Makefile   |  2 +-
>   net/tls/tls.h      |  2 ++
>   net/tls/tls_hkdf.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 87 insertions(+), 1 deletion(-)
> 
And another HKDF implementation. Maybe it's time to split if off (again).
But anyway.

Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
