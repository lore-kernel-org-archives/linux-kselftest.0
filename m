Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778181;
	b=FnAl+/13e0bXokPk9JmrsDjo0ijpUG/lH+i/4JrEZL3ghF5vb93NXCQRSwEkjrZUDICb
	 /LNqs5s/mZtvKDVB5CRX1o3fcbjh7Ywmh5ok7cXfgkpSO+Wv1lsfVV8odrPq0vAOSo4dP
	 HIOCiCItTu3fJJm13GNUG7AmkOjAAuVNNcbCQ8kGIiSmCnTmOAgULHo4HdvqppNHVD+aF
	 Mv1tkKrrtBMRGydOvYe6Y0ooAXvmcrUtWaIyLU3Mr74Tj5yhfwuUQ/cytwL3H8FK22Q7S
	 Z7rA8RRHy52CqC9+f88aqMsHpGcdX6gnpYiqkQH5tZ1GPCiBqHi6DGhfutt4AmfSRCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778181;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=2zLFLCL/b9bAd9ZrT8hb8cfeRX98D+M8elHb874j11k=;
	b=Xckhwz8R4g/UTz4ZqHOkh30kZOYjTz1lWAJYjV7v9YostyOQc68WeLXT/iClZxaUvn97
	 775otAUlTjQEHWeSunyiTLkNdEHFtS3NUm62lt5YCmrlV0+aowC8uGc7kl1a8FzYTgnYI
	 /2Xodd9tk70PNELx2y5Y7pZIyis+aWTcIjLs3mvshTLkt+yAOy6h8RPAhFDefbf8E+EMj
	 I64Jf8CkLKwmdcFUVbWlAo2MPVGm8/Zwv+X/l30FbpL/T2yTXyRAER7h0Ox+4CYGdrbOw
	 VM8OcUbqw/7KE8s/86kvBwqoQgViCCuBkraQ7jH9WTONuwDsMwvIebkHN1H9O2kXqNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=s4Evfq1Y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=V9fgRPoN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=NzxAaNfH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Y2jgEy39;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9D5606A332;
	Wed,  4 Nov 2026 07:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C9D5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=s4Evfq1Y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=V9fgRPoN;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=NzxAaNfH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Y2jgEy39
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E187E1F7A7;
	Wed,  4 Nov 2026 07:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793778171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2zLFLCL/b9bAd9ZrT8hb8cfeRX98D+M8elHb874j11k=;
	b=s4Evfq1Y+dJcpjvdG0aHRWvmAfmvylOxuRcbGH7qsc4lyOF8yEBVcHK2IbFGy1HyiDOYpO
	KFoUKP7w3lNyQD/Rkg5nN0cE8PTDQ2E3cdmsVyYbZk3WPom7coqTvCqGNmzN4scqzfA8Jx
	bjH6kNDL8qUWMdMaEpPiWaooZPjavho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793778171;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2zLFLCL/b9bAd9ZrT8hb8cfeRX98D+M8elHb874j11k=;
	b=V9fgRPoNibtncpOanIoZ+FbCYxwlPRSxcNNUso/5N2egeSUzX6PXyRpU/7jtrAQv46+rfl
	KnWDkShuSlCp5ACA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NzxAaNfH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Y2jgEy39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793778170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2zLFLCL/b9bAd9ZrT8hb8cfeRX98D+M8elHb874j11k=;
	b=NzxAaNfHMiG458vk55hoBIn50+WjabvpKeQfMENuM8ivPpb18CsK6KlehpvbXYpSe2FdvN
	Hi9eThl8XpLaj90OWG0g1t8SobnN7yjXIwoFhumU/cIWirUYtL9zMN8rGUGvh+AmOjQnc/
	M9Hi79hJu6qpwtimnuSuit0hxgnSMCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793778170;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2zLFLCL/b9bAd9ZrT8hb8cfeRX98D+M8elHb874j11k=;
	b=Y2jgEy39SpR0Lj2CyUyfOfe5r2LxrffO4fQEcuwl5J5GYINEHKRx5prql+8m6dlpVrxgmN
	eX+eHaRoiiG2HEDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B89B134A5;
	Wed,  4 Nov 2026 07:42:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tMCDN/nh6mreSAAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 04 Nov 2026 07:42:50 +0000
Message-ID: <cfe020a7-a622-4a7e-ace3-aa427551796d@suse.de>
Date: Wed, 4 Nov 2026 08:42:49 +0100
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
Subject: Re: [PATCH net-next v5 4/6] tls: update the RX key when a KeyUpdate
 is received
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
References: <20261103-keyupdate-rfc-v5-0-de1ab90a88d5@gmail.com>
 <20261103-keyupdate-rfc-v5-4-de1ab90a88d5@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261103-keyupdate-rfc-v5-4-de1ab90a88d5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E187E1F7A7
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,queasysnail.net,davemloft.net,redhat.com,lwn.net,linuxfoundation.org,infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email]
X-Spam-Score: -12.00

On 11/3/26 10:43 PM, Martin Belanger via B4 Relay wrote:
> From: Martin Belanger <martin.belanger@dell.com>
> 
> When a KeyUpdate arrives, kTLS blocks reads with -EKEYEXPIRED until
> the user installs the next key. A kernel user such as nvme-tcp or
> sunrpc never does, so the connection stalls.
> 
> For a socket with a registered RX secret, derive the next key and
> install it when the KeyUpdate is decrypted. The record is not passed to
> the user, so recvmsg(), splice() and read_sock() go on to the next
> record. Without a registered secret the behavior is unchanged.
> 
> A KeyUpdate that is not alone in its record, has a wrong length or an
> invalid request_update value ends the connection, as RFC 9846 section
> 4.7.3 requires. So does a peer that sends more than 8 KeyUpdates in one
> second, the same limit as GnuTLS. That case is counted as
> TlsRxRekeyError and logged, rate limited.
> 
> Reviewed-by: Chuck Lever <cel@kernel.org>
> Signed-off-by: Martin Belanger <martin.belanger@dell.com>
> ---
>   include/net/tls.h       |   7 +++
>   net/tls/Makefile        |   3 +-
>   net/tls/tls.h           |   2 +
>   net/tls/tls_keyupdate.c | 155 ++++++++++++++++++++++++++++++++++++++++++++++++
>   net/tls/tls_sw.c        |  38 +++++++++++-
>   5 files changed, 201 insertions(+), 4 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheerx,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
