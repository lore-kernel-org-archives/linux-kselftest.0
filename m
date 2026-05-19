Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679E73B895A
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 07:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175597; cv=none; b=HeX1Q8w+zLWuc5RlaSvXfaWHfbpduq2sS77DOT0+mL9jePvtWEPCcbBs0i0DLlY2WMNVDRXUsMcY4Is+ooAyl3o6qLQI/gAnYSGegT60cYYqgirvXIGiySDfYNGDWRN4d7GVvEW7cxIdw+I8GXWAryOBq/+BjsVotappPBzx2vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175597; c=relaxed/simple;
	bh=566wJyoQNaZppcgHsn0XB16I7fjmZC3Gy2nMiD9Q2YY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ISdED/2Wig+1c8noP9+HmPPRfOVPhtTRmg8ZAhbXg5w8iitVgaynsf9Sm7DsT/vOOhLJmqWkr+nSsHlola8OmPhfMDLQ9+9vbjh4smG1k6RPLVIDdyTOd2QuyBffk/21zLNlbIo+194mFA0+BPgjO1pWKv77jX6lW7LHnXrS1IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JIr3DL/o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s5YB0rRy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JIr3DL/o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s5YB0rRy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JIr3DL/o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s5YB0rRy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JIr3DL/o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s5YB0rRy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F31DE5D9A3;
	Tue, 19 May 2026 07:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779175459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=867OvcOyeRotwEwrhB4wKBsZTy+9UT/N4Yew+an6ItQ=;
	b=JIr3DL/ozA7IttpQDlrztsls1d6KULVZmtJ+FW6sVa2m84XrHdVcdFzhosmmvB4eZvit9I
	mPazrBl4d+MZWsVwLkitoDfkheKEJYSFrJsn/BS/MRr1Geghb6G8Phq7FsJXSjdE1e3YkW
	fDoxrf28LAo8sz1qtdvoOTEO6Fy6Qf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779175459;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=867OvcOyeRotwEwrhB4wKBsZTy+9UT/N4Yew+an6ItQ=;
	b=s5YB0rRyDyt1ZfncccSF8CYZVrFdaY/UbovX3NX4S8dXOehwNTzO5i22F0zZ3nkcc4WR5S
	z8/TOkFX2i6a8gDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779175459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=867OvcOyeRotwEwrhB4wKBsZTy+9UT/N4Yew+an6ItQ=;
	b=JIr3DL/ozA7IttpQDlrztsls1d6KULVZmtJ+FW6sVa2m84XrHdVcdFzhosmmvB4eZvit9I
	mPazrBl4d+MZWsVwLkitoDfkheKEJYSFrJsn/BS/MRr1Geghb6G8Phq7FsJXSjdE1e3YkW
	fDoxrf28LAo8sz1qtdvoOTEO6Fy6Qf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779175459;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=867OvcOyeRotwEwrhB4wKBsZTy+9UT/N4Yew+an6ItQ=;
	b=s5YB0rRyDyt1ZfncccSF8CYZVrFdaY/UbovX3NX4S8dXOehwNTzO5i22F0zZ3nkcc4WR5S
	z8/TOkFX2i6a8gDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D24A6593A8;
	Tue, 19 May 2026 07:24:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qjKvMiIQDGq2SwAAD6G6ig
	(envelope-from <fmancera@suse.de>); Tue, 19 May 2026 07:24:18 +0000
Message-ID: <6539e000-2bb5-4cda-a8b7-b09e5e0d66a9@suse.de>
Date: Tue, 19 May 2026 09:24:02 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3 net-next v4] selftests: net: add test for IPv4 devconf
 netlink notifications
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
Content-Language: en-US
From: Fernando Fernandez Mancera <fmancera@suse.de>
In-Reply-To: <54f7f213-9783-42c0-8ae8-51a6b65b7b5d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.30

On 5/19/26 9:17 AM, Paolo Abeni wrote:
> On 5/18/26 11:23 PM, Jakub Kicinski wrote:
>> On Sat, 16 May 2026 09:02:27 +0200 Fernando Fernandez Mancera wrote:
>>>>> Oh sorry, I should have clarified it. ip netconf only shows/query them
>>>>> but it cannot set them AFAICS.
>>>>>
>>>>> Usage: ip netconf show [ dev STRING ]
>>>>
>>>> Oh, fun. anyway, you gotta find a better way. Or just give up on the
>>>> selftest, the YNL hack is too ugly to live
>>>>    
>>>
>>> Fair, let me see what I can do. Otherwise, Paolo as you requested the
>>> selftest, would it be acceptable for you to drop it given the situation?
>>> I looking for alternatives anyway :-)
>>
>> Maybe extend iproute2 ?
> 
> Ideally I think extending iproute2 would be the better solution.
> @Fernando: perhaps you could update the self-test accordingly, adding an
> explicit check for the iproute subcommand. If `ip netconf set` is not
> available skip the test, so that iproute2 patches could land later.
> 
> Does the above look feasible?
> 

Yep. I agree. Okay, let's do that :-)

Thanks a lot!
