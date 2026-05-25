Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4D43F164A
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 15:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779724393; cv=none; b=SRzASyJNLNWXArZxnTmClVd8ZRGNjOnbdSReK46CO3RdtV8MFz++lJF2mRKEPJe0MMvvUK/muN33idvJoK4NutBD4QnOorbzbqkHCFqW9bMVVd6UsazjD+WEwn2cqjYORtKNjuxEjAJ2ACi6KvtnkshH1lyS6Zu5uosNJHXWn+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779724393; c=relaxed/simple;
	bh=WtAqurkqdqMugP+BJqmZF9BOBW7Avew3ovGi3PAgJEo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZjcJgNT/nJdmOsdPx1Bg8HgCFxaxN9DwG30zFeIflzlLH+4S1wBHRGUn7cJ9qB+mmDj2YDoO4S6L9vOU+lcV7H9wOsOqu9Gf0HQhu2LBX191wm/4UwNcLXPeJGaQmYm/M9JozIu1OOo0fqtiev8FDW5+peUSi5J/1IWXVa2D+gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Px5+k7r7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E4xACNad; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Px5+k7r7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E4xACNad; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Px5+k7r7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E4xACNad";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Px5+k7r7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E4xACNad"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C9BEA6B44E;
	Mon, 25 May 2026 15:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779724389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dfQOlnjll+vcbIkxe5BiU2ftJzrIA1B+Lx+upjWlbzE=;
	b=Px5+k7r7Qb51/zv17ac7d3C8EjhAGj2w8C/3mVcQ3FX8WuJtDhyEIVsc9U72Qu4VuV9bso
	T4rZKse+UxYMXbdR8WI9SlYIDGOsy0Wj2BYgewnfy6oCCg9Vaa5gleAGMLv8HZWM+1ZWJO
	UsilTIbacmSpZvOjZjDYViQdARHTN3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779724389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dfQOlnjll+vcbIkxe5BiU2ftJzrIA1B+Lx+upjWlbzE=;
	b=E4xACNadlXmQwuZZSq7MTedyLzhRHzycmlQsB5L8DxLw61EZjG6BI0NYbiRGKZ+iecBjgH
	WI8qqluw8hPRTvBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779724389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dfQOlnjll+vcbIkxe5BiU2ftJzrIA1B+Lx+upjWlbzE=;
	b=Px5+k7r7Qb51/zv17ac7d3C8EjhAGj2w8C/3mVcQ3FX8WuJtDhyEIVsc9U72Qu4VuV9bso
	T4rZKse+UxYMXbdR8WI9SlYIDGOsy0Wj2BYgewnfy6oCCg9Vaa5gleAGMLv8HZWM+1ZWJO
	UsilTIbacmSpZvOjZjDYViQdARHTN3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779724389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dfQOlnjll+vcbIkxe5BiU2ftJzrIA1B+Lx+upjWlbzE=;
	b=E4xACNadlXmQwuZZSq7MTedyLzhRHzycmlQsB5L8DxLw61EZjG6BI0NYbiRGKZ+iecBjgH
	WI8qqluw8hPRTvBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5093259D0C;
	Mon, 25 May 2026 15:53:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h53kD2VwFGr1BgAAD6G6ig
	(envelope-from <fmancera@suse.de>); Mon, 25 May 2026 15:53:09 +0000
Message-ID: <7fb927ab-591c-4c07-9f85-31697b80a366@suse.de>
Date: Mon, 25 May 2026 17:53:04 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3 net-next v4] selftests: net: add test for IPv4 devconf
 netlink notifications
From: Fernando Fernandez Mancera <fmancera@suse.de>
To: Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 horms@kernel.org, edumazet@google.com, dsahern@kernel.org,
 davem@davemloft.net
References: <20260510081528.5257-1-fmancera@suse.de>
 <20260510081528.5257-3-fmancera@suse.de> <20260513193544.47970cb8@kernel.org>
 <bd560c89-c71f-4ef5-a0fd-5ea096a0f767@suse.de>
 <20260514162429.366b94c9@kernel.org>
 <f528360c-18b3-46e5-8ba8-88f921203716@suse.de>
 <20260515181623.5a44140e@kernel.org>
 <f5cae72f-93c7-41d7-b7db-2b60281afb72@suse.de>
 <20260518142346.4c0903de@kernel.org>
 <54f7f213-9783-42c0-8ae8-51a6b65b7b5d@redhat.com>
 <6539e000-2bb5-4cda-a8b7-b09e5e0d66a9@suse.de>
Content-Language: en-US
In-Reply-To: <6539e000-2bb5-4cda-a8b7-b09e5e0d66a9@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	internal_greylist_whitelist(0.00)[10.150.64.97];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO

On 5/19/26 9:24 AM, Fernando Fernandez Mancera wrote:
> On 5/19/26 9:17 AM, Paolo Abeni wrote:
>> On 5/18/26 11:23 PM, Jakub Kicinski wrote:
>>> On Sat, 16 May 2026 09:02:27 +0200 Fernando Fernandez Mancera wrote:
>>>>>> Oh sorry, I should have clarified it. ip netconf only shows/query 
>>>>>> them
>>>>>> but it cannot set them AFAICS.
>>>>>>
>>>>>> Usage: ip netconf show [ dev STRING ]
>>>>>
>>>>> Oh, fun. anyway, you gotta find a better way. Or just give up on the
>>>>> selftest, the YNL hack is too ugly to live
>>>>
>>>> Fair, let me see what I can do. Otherwise, Paolo as you requested the
>>>> selftest, would it be acceptable for you to drop it given the 
>>>> situation?
>>>> I looking for alternatives anyway :-)
>>>
>>> Maybe extend iproute2 ?
>>
>> Ideally I think extending iproute2 would be the better solution.
>> @Fernando: perhaps you could update the self-test accordingly, adding an
>> explicit check for the iproute subcommand. If `ip netconf set` is not
>> available skip the test, so that iproute2 patches could land later.
>>
>> Does the above look feasible?
>>
> 
> Yep. I agree. Okay, let's do that :-)

As discussed in the thread, Jakub can you pick the other patches or 
should I repost the series without the selftest? I am now working on the 
iproute extension FWIW.

Thanks,
Fernando.
