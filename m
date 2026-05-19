Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EB33BB68B
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 21:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779226054; cv=none; b=TYx3cYSuYWKSV2Eks9IgjUJM/UyXIdHYQZ99MkSOwrne1xF56wJ8TbHI+EGeY5N5hlZ48rqgfG0DLpcXMRfCAbEXDaN+SuohkfHa28j1FykQKfUkxfLhCXZQNQV1D1cq4O72pa2Urr+xtUaHGMtyxd6VkO8XBFY2TgUj0rSNpvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779226054; c=relaxed/simple;
	bh=cJmccFI9Etzzi5InYNyRVp3fdNAEapEyzLHPebPGPPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dSL4M/wgwYmCFnneW8iIIOJrjct7o+aSHBF6zizjqZB7AjfRvUpTNJQ1HcctwtAnJTFyl6XDwx8qEcc1VYHMU+epJaspKdYW3I2R7tOg8dKfvhbVLjvl6SMSdsfHZFnypHnhg0ZnzRyop4OMSKP2r0q6EZXs6dCO37uOqF9yn38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=goZB2ftr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SqFpZdwE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=goZB2ftr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SqFpZdwE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="goZB2ftr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SqFpZdwE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="goZB2ftr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SqFpZdwE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2560C6C49A;
	Tue, 19 May 2026 21:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779226046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nKvzB1kjWBuQwOlFEsBDHoKrjXF6QopUogvCtpD2om0=;
	b=goZB2ftrxFCsmthWvoyTiFd4m35KiYQ3qRWJXejQ0jefT17MAjscPuv3aNXGlW+2RknhrZ
	6jjnRaFv2bWQqmwex1gRKADhAzzzKkZDGbBXaTZrDeP42MHoYnISTI50qjmcOrVMBvqzOl
	RALPC+jAZ94uTQgcLLmqrn+VD2ygqns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779226046;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nKvzB1kjWBuQwOlFEsBDHoKrjXF6QopUogvCtpD2om0=;
	b=SqFpZdwEWgCSB+quPpWPUcW/RTG68OYK+ilguVYPtyOn7frv7gA0VIFgpBh5N6vCJxhoST
	7TEmR6rVsUK4VHAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779226046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nKvzB1kjWBuQwOlFEsBDHoKrjXF6QopUogvCtpD2om0=;
	b=goZB2ftrxFCsmthWvoyTiFd4m35KiYQ3qRWJXejQ0jefT17MAjscPuv3aNXGlW+2RknhrZ
	6jjnRaFv2bWQqmwex1gRKADhAzzzKkZDGbBXaTZrDeP42MHoYnISTI50qjmcOrVMBvqzOl
	RALPC+jAZ94uTQgcLLmqrn+VD2ygqns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779226046;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nKvzB1kjWBuQwOlFEsBDHoKrjXF6QopUogvCtpD2om0=;
	b=SqFpZdwEWgCSB+quPpWPUcW/RTG68OYK+ilguVYPtyOn7frv7gA0VIFgpBh5N6vCJxhoST
	7TEmR6rVsUK4VHAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 08996593A8;
	Tue, 19 May 2026 21:27:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LsCMAb7VDGpzAQAAD6G6ig
	(envelope-from <fmancera@suse.de>); Tue, 19 May 2026 21:27:26 +0000
Message-ID: <f2cd87f0-e173-4af7-9bc8-3a1f38c58c06@suse.de>
Date: Tue, 19 May 2026 23:27:17 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3 net-next v4] selftests: net: add test for IPv4 devconf
 netlink notifications
To: nicolas.dichtel@6wind.com, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>
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
 <b8b89071-6f17-4f6a-8a06-101056f780fd@6wind.com>
Content-Language: en-US
From: Fernando Fernandez Mancera <fmancera@suse.de>
In-Reply-To: <b8b89071-6f17-4f6a-8a06-101056f780fd@6wind.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On 5/19/26 3:45 PM, Nicolas Dichtel wrote:
> Le 19/05/2026 à 09:17, Paolo Abeni a écrit :
>> On 5/18/26 11:23 PM, Jakub Kicinski wrote:
>>> On Sat, 16 May 2026 09:02:27 +0200 Fernando Fernandez Mancera wrote:
>>>>>> Oh sorry, I should have clarified it. ip netconf only shows/query them
>>>>>> but it cannot set them AFAICS.
>>>>>>
>>>>>> Usage: ip netconf show [ dev STRING ]
>>>>>
>>>>> Oh, fun. anyway, you gotta find a better way. Or just give up on the
>>>>> selftest, the YNL hack is too ugly to live
>>>>>    
>>>>
>>>> Fair, let me see what I can do. Otherwise, Paolo as you requested the
>>>> selftest, would it be acceptable for you to drop it given the situation?
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
> FWIW, netconf != devconf.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/ip.h#n156
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/netconf.h
> 
> The devconf API exposes all sysctl of an interface via RTM_NEWLINK /
> IFLA_AF_SPEC / IFLA_INET_CONF. There is no event when a sysctl changes.
> These sysctl can be set via RTM_SETLINK.
> 
> The netconf API (RTM_NEWNETCONF) is a notification mechanism used to notify
> users when a sysctl changes. It handles sysctl from interfaces but also from the
> 'all' and the 'default' entries. RTM_GETNETCONF is also supported, but not
> RTM_SETNETCONF.
> 
> 'ip netconf' uses the netconf API.
> 


I think we can reword this to.. "extend iproute2 to support setting 
devconf values"? If the naming or implementation on iproute2 is not 
clear now, we can merge this without the selftest and after the iproute2 
implementation merge the selftest.

> Regards,
> Nicolas
> 

