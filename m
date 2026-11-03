Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713125;
	b=TMWq0Z2/My0YKzxn8GlR2r3IwfaQXUeT/+yUXgHdRWF3aMBhBGUbPQSAs8UWHiAe0vno
	 khhsXhBkQd1I4uYfgmZzjpUQU8J1iDKFr9EjurDVxTFE3GglnNJk/H9BtbQuwxQ65ZDod
	 8JfUr53i7zMKMxWStPMxTGmybx3adY56Q/pI9v+PH7f15vS8fcdo/8fM+whZpe+GG+5+d
	 98NiBm9Bmb6ba4HPmRnVK9U/tuXgkuB2FOIF3r4tqhH3nNyieljIB2vKK1EydlceFNeEc
	 Aq0V9Tskg5sIu1jEouHB2iw6sUzWNGHhfnhbVf6RKtjVtBv2MW/jNoXBwd1LaP+lsnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713125;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:
	 X-Spam-Level:X-Spam-Flag;
	bh=VwtEDaQcAhVmJ7JYis2QG6RHgDJgRtJGtpize8EwNyM=;
	b=mgKNdOn58I/1VXjT01T8/4vhsSlJb+NfI3gA5zto96oS5EC6Yjsas4K/OIfla/ADOBtV
	 wlO4CFFPHVQsxHde2vlvx5GxRaJG9eKzWzv+tv3Uv11ly+gb+QgJlEMBzRhhIA0Q2TPez
	 SMQKgO2ow2hpmrKO5NRgezUDYTtB4vhk/dCg58SvnPwvreLgukX/0jxcLPmMQSwQ35E9t
	 FwSWpDe6ZgeCFHYEi52ddES2v7+2kknoE20xIJyqOABl1NSrz2/Rm51WjwcVOs5nSFiuw
	 WLwfooFbti/U7spcDZ3ubsL8UqIrebJaHC82+qyxkN/g0M3JkXhvxw4CHBAQ3HYFdQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fK9OJ8BN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oQ2QNvW9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GfxejqrD;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GVnFgtgW;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92409606A336;
	Tue,  3 Nov 2026 13:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92409606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fK9OJ8BN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oQ2QNvW9;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GfxejqrD;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GVnFgtgW
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E17121FB80;
	Tue,  3 Nov 2026 13:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793713115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VwtEDaQcAhVmJ7JYis2QG6RHgDJgRtJGtpize8EwNyM=;
	b=fK9OJ8BNI9aFq2ckciDxFFRzZSJOQbPQhL/Jioi2978AmliL+wz+xMPyiD0UX0tz9JEewd
	K9Qy6Ik2DOZiCU+62rKQbeteVfQkUtYIWx7gvC8gWhnbpIOjodXQh3hf1XDusyq9YIWZh0
	zXKgOaCfQOwP/cWIafyk8AEpEnsvbng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793713115;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VwtEDaQcAhVmJ7JYis2QG6RHgDJgRtJGtpize8EwNyM=;
	b=oQ2QNvW9ltAmIDJSwbHEx03IPD2xbKC5ZRY2nTHMdMICuV7+yIc9RfqvctXTy8EMQS4Buh
	EoJc2EWrWOFCiQCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793713114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VwtEDaQcAhVmJ7JYis2QG6RHgDJgRtJGtpize8EwNyM=;
	b=GfxejqrDcSQuy3ht0KaTITE0qUp0G5cPTk5r8YpZk5nA3OV9/4DRfD47Y8jApjEm2cTaoG
	UajEi6W0pV6z4LnGYJcy6kpvPIqb+gD9OHcVlVCe0/OTCGKgkcoMHHWSR/sJDa/4mb1dCm
	aNoKFtcXzCBwFb2j35yujFju3xyF+Zs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793713114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VwtEDaQcAhVmJ7JYis2QG6RHgDJgRtJGtpize8EwNyM=;
	b=GVnFgtgWSPNFvkdLx2A9GYbgN3wUlmyGTdnZwalznI3alnRXGLJFKw2S9dbE++humhkZcu
	vgEWc+ssAYj4aTAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 57169134B8;
	Tue,  3 Nov 2026 13:38:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I67sC9rj6WoUSgAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 03 Nov 2026 13:38:34 +0000
Message-ID: <9d264274-adcd-4e01-afe4-dbb96bb1ecd0@suse.de>
Date: Tue, 3 Nov 2026 14:38:33 +0100
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
Subject: Re: [PATCH net-next v4 3/5] tls: update the RX key when a KeyUpdate
 is received
To: Martin Belanger <martin.nvme.dev@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Sabrina Dubroca <sd@queasysnail.net>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
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
 <20261102-keyupdate-rfc-v4-3-f17419972b9f@gmail.com>
 <dd6d8c92-a96c-4bb3-aee1-a28f2156fb9d@suse.de>
 <46288afa-affe-4262-bd0d-38a16f4608b4@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <46288afa-affe-4262-bd0d-38a16f4608b4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-11.79 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,queasysnail.net,davemloft.net,redhat.com,lwn.net,linuxfoundation.org,infradead.org];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -11.79
X-Spam-Level: 
X-Spam-Flag: NO

On 11/3/26 12:23 PM, Martin Belanger wrote:
> 
> 
> On 11/3/26 02:15, Hannes Reinecke wrote:
>> On 11/2/26 5:58 PM, Martin Belanger via B4 Relay wrote:
>>> From: Martin Belanger <martin.belanger@dell.com>
>>>
[ .. ]
>>> @@ -2023,9 +2041,8 @@ ssize_t tls_sw_splice_read(struct socket *sock, 
>>> loff_t *ppos,
>>>       if (err)
>>>           goto splice_read_end;
>>> -    if (!skb_queue_empty(&ctx->rx_list)) {
>>> -        skb = __skb_dequeue(&ctx->rx_list);
>>> -    } else {
>>> +    skb = __skb_dequeue(&ctx->rx_list);
>>> +    while (!skb) {
>>>           struct tls_decrypt_arg darg;
>>>           err = tls_rx_rec_wait(sk, nonblock, true, false);
>>
>> Why this change? Looks a bit out of place here...
> 
> splice() handles a single record. With this patch,
> tls_rx_one_record() returns 1 for a KeyUpdate that the kernel
> consumed. splice() then frees that record and has no skb to pass to
> the user, so it must wait for the next record. The loop does that.
> recvmsg() and read_sock() already loop over records, so there a
> "continue" is enough.
> 
> The unconditional __skb_dequeue() only sets skb for the loop test.
> It returns NULL on an empty queue, so it does the same as the old
> skb_queue_empty() check.
> 
> I can move the restructuring into a separate patch without a
> functional change, if you prefer.
> 
Yes, I guess that would be best. Having a separate patch also allows
you to describe the rationale (as you just did) and avoids confusion
why a change for 'splice' ended up in a keyupdate patch.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
