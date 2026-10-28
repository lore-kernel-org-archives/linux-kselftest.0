Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198558;
	b=LgX4gtcUO8jKJ7mxmT4ErvU8BYyCWaQgvS/j+j1oZc3h9GfG6vukYJK4ICKo4//nkM0H
	 vrNkEufIG3xo7EBm9Ck41MAKRTVgALe/tNBn/5BF6iZpDklpILuRAx3lDyiXac8io2bBx
	 gvAgG9dEr4SjA9zUcCbf3UgOppeN52r25Wosn848iPvMj5ffks1IU13px+OTbYdlNz9o9
	 r8yV2YR3WzWdZFNIgzgnZlpI2llgAeAQW6W6PgC0SwpW4ALj4hUzxnn0uwNHlopwbi6ck
	 q26LvbIo+D7I1Pme8LtGoKLDepahIvH4D9/Se/otcIWcNW6qf4ssWH7ozfifPwyPCzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198558;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Score;
	bh=zGvM4WaKud/5KFKek7VP+6vXlrF9p+blEmIcU3Dd2uU=;
	b=pyCh90DLLpV7DZnOC8RFUvEhUbvq1D/C/aEd4sYFTXWdD5hO0fMrZLuOCMsvGrGbRRWx
	 BNoLOHaKA4HI9UlcQCJQN9mV3La5rfUZd8Y5ZPgxOieS0D9VfMdx4OqnWJbJMdadhQ4QQ
	 jd/nZdfXrp44quhJPqNWDqNA//lH9GldIPXBEVwFyLxsuk61Me5XxnxLni7a9v1N2rGtu
	 TSkmrvpscUua+7CuGEnUsM7i1bFUhpr5HsRFGMuLAW99QjlzlySbJlxVr2rOOey295S1J
	 Du86D71W6ib10PafQv9rLGsbRFer659aHOXK/fPSZLzOcVUrzxV8UHp+7TraVDZYLWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=B9eXWaex;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CBHmMrtn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=B9eXWaex;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CBHmMrtn;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8117606A31D;
	Wed, 28 Oct 2026 14:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8117606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=B9eXWaex;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CBHmMrtn;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=B9eXWaex;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CBHmMrtn
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C89E41F7A9;
	Wed, 28 Oct 2026 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793198548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zGvM4WaKud/5KFKek7VP+6vXlrF9p+blEmIcU3Dd2uU=;
	b=B9eXWaexz8/aeAqZ1393KVLUf50NlZJvQuaPZiWDAmiZZDwsjSGMlbS4cOJyrGGx6s639j
	ac8ImIXtZ98g2XMyh8seJyWhJg/mDnheJ9WfvApMNqHX4i4mOgQWq1CIf4BbJKoH9aFAV5
	tH0o8Zw+r9hsnv9ieQPeghVo+tpCCiQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793198548;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zGvM4WaKud/5KFKek7VP+6vXlrF9p+blEmIcU3Dd2uU=;
	b=CBHmMrtneTknzVLz83xFs8Ob00TgPvpbpbGukzUzLRN+0CCEVgkUCvD5JPwVRuo/4VcXe2
	I29SIJDRlZ8Y26Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793198548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zGvM4WaKud/5KFKek7VP+6vXlrF9p+blEmIcU3Dd2uU=;
	b=B9eXWaexz8/aeAqZ1393KVLUf50NlZJvQuaPZiWDAmiZZDwsjSGMlbS4cOJyrGGx6s639j
	ac8ImIXtZ98g2XMyh8seJyWhJg/mDnheJ9WfvApMNqHX4i4mOgQWq1CIf4BbJKoH9aFAV5
	tH0o8Zw+r9hsnv9ieQPeghVo+tpCCiQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793198548;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zGvM4WaKud/5KFKek7VP+6vXlrF9p+blEmIcU3Dd2uU=;
	b=CBHmMrtneTknzVLz83xFs8Ob00TgPvpbpbGukzUzLRN+0CCEVgkUCvD5JPwVRuo/4VcXe2
	I29SIJDRlZ8Y26Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 764CD13419;
	Wed, 28 Oct 2026 14:42:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dWnXE9QJ4mo0CAAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 28 Oct 2026 14:42:28 +0000
Message-ID: <3544cb56-e43b-49ec-aa94-beafe061879b@suse.de>
Date: Wed, 28 Oct 2026 15:42:28 +0100
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
Subject: Re: [PATCH RFC net-next v2 0/5] tls: perform TLS 1.3 KeyUpdate in the
 kernel
To: Chuck Lever <cel@kernel.org>, martin.nvme.dev@gmail.com,
 John Fastabend <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Sabrina Dubroca <sd@queasysnail.net>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, kernel-tls-handshake@lists.linux.dev,
 linux-nvme@lists.infradead.org, Alistair Francis <alistair.francis@wdc.com>,
 Martin Belanger <martin.belanger@dell.com>
References: <20261028-keyupdate-rfc-v2-0-eb5143b4c487@gmail.com>
 <76ccd502-f1d1-4135-b92e-d783f259a687@app.fastmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <76ccd502-f1d1-4135-b92e-d783f259a687@app.fastmail.com>
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
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,queasysnail.net,davemloft.net,redhat.com,lwn.net,linuxfoundation.org,infradead.org];
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

On 10/28/26 3:21 PM, Chuck Lever wrote:
> 
> 
> On Wed, Oct 28, 2026, at 9:52 AM, Martin Belanger via B4 Relay wrote:
>> kTLS does not currently handle TLS 1.3 KeyUpdate. It never sends a
>> KeyUpdate. And when it receives one, it blocks the socket until the
>> application installs the next key. kTLS also does not enforce the key
>> usage limit on transmit.
> 
> No argument here.
> 
> 
>> This applies to TLS libraries in user space as well as kernel users such
>> as NVMe/TCP or sunrpc:
>>
>> - GnuTLS sends a KeyUpdate after 2^24 records when it runs its own
>>    record layer. With kTLS, the record layer is handled in the kernel and
>>    GnuTLS therefore never runs the check. OpenSSL never sends a KeyUpdate
>>    on its own.
>> - NVMe/TCP and sunrpc don't have a mechanism to install a new key. A
>>    conforming peer that sends a KeyUpdate stalls their connection.
> 
> The design intention of these consumers is that they are supposed to break
> the connection and create a new session, rather than stall. If that is not
> happening, that's a bug. KeyUpdate is complicated enough that backporting
> to LTS is not really an option, so that bug needs to be addressed first,
> IMHO.
> 
Yes. But Martin send already a patchset for that (well, for NVMe, at least).

> The argument that was made that put tlshd in user space is that we do
> not want the kernel to handle something that the libraries are already
> good at (IOW, mechanisms that have been soaked in commodity usage by many
> consumers).
> 
> Is that rationale different for handling TLS KeyUpdate? I see that the
> series adds back the HKDF functionality to the kernel. That seems like
> an indication that KeyUpdate should be handled via an upcall.
> 
Yes. TLS KeyUpdate requires that all records _after_ the KeyUpdate 
message are encrypted with the next key; idea is here that one can
(and should) do this in-line without stopping/resetting the connection.
_And_ TLS KeyUpdate is done independently on the RX and the TX side.

This makes it extremely hard to implement via tlshd; we would need
to pass the KeyUpdate message to tlshd (which is easy), but then
we would need to stop processing incoming packets until we get
a response from tlshd indicating that it has installed the new
secret.

Which makes the whole idea of KeyUpdate (namely that you can
do it _without_ stopping packet processing) a bit pointless.

And I haven't even mentioned that you would need to be able to
stop RX and TX _independently_, which I'm not sure the various
ULPs can do.

Plus there is the question why ULPs need to be burdened with
protocol specific knowledge; why would I need to code hooks/
handling for an extremely protocol-specific know?
It's far better be handled by the protocol itself.

> Are there policy decisions that need to be made during KeyUpdate (like,
> has the peer's certificate expired, or has it been put on a revocation
> list in the meantime) ?
> 
No. This is not about the certificate, it's about traffic secrets.
If a certificate is expired you need to reset the connection
to install a new certificate; TLS 1.3 does not allow you to do
that while the connection is established.
And handling of expired certificates is an admin choice, not
something one should do automatically.

(The last thing you want is your root fs becoming inaccessible
just because a lazy admin forgot to renew the certificate ...)

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
