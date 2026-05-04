Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1E538B15B
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 22:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777935515; cv=none; b=EjEBupupdp6Av4VbjhBIqBdnEW1v1mqUUFnTuVhDSScPKEvX5A3jmg3QV+ddXZWoc7sb/Ham6tGiwpMoxud6ceDbPTYj7G6sR9l6HaeZksPJYriLIxMXXN/jsI+4RvZj7Vei6QdQTMvetjzq4wcoLHaPxrL9pxjgKNFmQzrnPOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777935515; c=relaxed/simple;
	bh=MxJCnrWrZ5qvw4Y90DojGsO/P0u1Iy+ggY5bKUvUeYc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VTGNrazvkoed8U1JmpTkYesX3/U/FpZyOx4OXlkQl9+bfTaMMsd/Dwc4AAf9LJP75Ov/2FYQ7crAUjaHYpEWHoDm3+9U3snyVdx45JFHV6Djc8dRzeE9VCs0+8sqboRQACDwwCIT5ZJF8xiUyhVsRuVEOjeO0T24ZXc5bDUxeBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kB9KXNVs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DRpsCPMF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kB9KXNVs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DRpsCPMF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kB9KXNVs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DRpsCPMF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kB9KXNVs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DRpsCPMF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 578CD6B625;
	Mon,  4 May 2026 22:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777935511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yvucfQDurO8wgOpEUDN53sENfGl46ZdPS0l9Z8rQ5K8=;
	b=kB9KXNVs00XfxbPwr3DGg4OFbUG3GhZjCD0f0umyDELoIRtl37gZGTU3kAbAQ6GyI5/wSQ
	CE0Jtwj3mTWjbo5NzAgHNz49PT9CFTx05+jmVMEgRLgZQEggEVHe/kD6c4MP1Fmp69a8UP
	GmCmYhphSAGSc6BhdKLP6z6oxzmpgrc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777935511;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yvucfQDurO8wgOpEUDN53sENfGl46ZdPS0l9Z8rQ5K8=;
	b=DRpsCPMFa7gdZpQCgZen1qNLkICpgz1Htax2WLnvChkLqY5kw5Iyyl5fYxWMiACWTO+w5n
	sn1gXxSq/iCRh7Dw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kB9KXNVs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DRpsCPMF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777935511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yvucfQDurO8wgOpEUDN53sENfGl46ZdPS0l9Z8rQ5K8=;
	b=kB9KXNVs00XfxbPwr3DGg4OFbUG3GhZjCD0f0umyDELoIRtl37gZGTU3kAbAQ6GyI5/wSQ
	CE0Jtwj3mTWjbo5NzAgHNz49PT9CFTx05+jmVMEgRLgZQEggEVHe/kD6c4MP1Fmp69a8UP
	GmCmYhphSAGSc6BhdKLP6z6oxzmpgrc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777935511;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yvucfQDurO8wgOpEUDN53sENfGl46ZdPS0l9Z8rQ5K8=;
	b=DRpsCPMFa7gdZpQCgZen1qNLkICpgz1Htax2WLnvChkLqY5kw5Iyyl5fYxWMiACWTO+w5n
	sn1gXxSq/iCRh7Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF9FF593A3;
	Mon,  4 May 2026 22:58:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id O9vpK5Yk+Wl/UAAAD6G6ig
	(envelope-from <fmancera@suse.de>); Mon, 04 May 2026 22:58:30 +0000
Message-ID: <c6b575dc-e4f9-4333-8175-277d49d1cdc0@suse.de>
Date: Tue, 5 May 2026 00:58:30 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2 net] ipv6: addrconf: fix temp address generation after
 prefix deprecation
From: Fernando Fernandez Mancera <fmancera@suse.de>
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, dsahern@kernel.org, =?UTF-8?Q?=C5=81ukasz_Stelmach?=
 <steelman@post.pl>
References: <20260503221139.3742-3-fmancera@suse.de>
 <20260504163549.GA385401@shredder>
 <2532adc0-262e-433a-9b69-df6d49f662c4@suse.de>
Content-Language: en-US
In-Reply-To: <2532adc0-262e-433a-9b69-df6d49f662c4@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[sashiko.dev:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,post.pl:email,suse.de:email,suse.de:dkim,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,sashiko.dev:url,suse.de:email,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 578CD6B625
X-Spam-Level: 



On 5/4/26 9:51 PM, Fernando Fernandez Mancera wrote:
> On 5/4/26 6:35 PM, Ido Schimmel wrote:
>> On Mon, May 04, 2026 at 12:11:40AM +0200, Fernando Fernandez Mancera 
>> wrote:
>>> When a router temporarily deprecates an IPv6 prefix (either by sending a
>>> Router Advertisement with Preferred Lifetime = 0 or by letting the
>>> lifetime expire) and later restores it, the kernel permanently loses its
>>> ability to generate temporary privacy addresses (RFC 8981) for that
>>> prefix.
>>>
>>> This happens because the address worker attempts to generate a
>>> replacement temporary address when the current one nears expiration. As
>>> the base prefix is deprecated already, the generation fails, burning the
>>> retry counter for temporary address generation of that prefix.
>>>
>>> When the router eventually restores the prefix, the temporary address
>>> becomes active again. However, once it naturally expires, the kernel
>>> sees the exhausted retry limit and permanently stops generating new
>>> privacy addresses.
>>
>> It's not clear to me to which "retry counter" you are referring to. Are
>> you referring to the counter of the temporary address or to that of the
>> "public address" from which it was generated?
>>
>> AFAICT, in the case of temporary addresses (those w/o "mngtmpaddr") this
>> isn't really a counter, but a boolean that tells you if an address was
>> already spawned from this address.
>>
>>>
>>> Fix this by verifying that the base prefix has sufficient preferred
>>> lifetime remaining before attempting to generate a new temporary
>>> address. This prevents the worker from burning through its retry counter
>>> during temporary network deprecation events like a router reboot.
>>
>> Again, I think that "retry counter" here is confusing. IIUC, what
>> happens is that the kernel marks the temporary address as having spawned
>> an address ('ifp->regen_count++'), then tries to spawn an address by
>> calling ipv6_create_tempaddr(), which fails because the preferred
>> lifetime of the public address is 0.
>>
> 
> Yes, you are right. I used the word counter as the variable was ifp- 
>  >regen_count although for temporary addresses it is just a boolean. Let 
> me modify the commit message to make it clear.
> 
> Thanks Ido for reviewing!
> 

I have checked sashiko feedback and it spotted another race condition. 
To fix this altogether I believe we could improve ipv6_create_tempaddr() 
to return meaningful return value. This way we could catch a 
-ETIME/-ETIMEDOUT and reset the regen_count on the temporary address.

https://sashiko.dev/#/patchset/20260503221139.3742-3-fmancera%40suse.de?part=1

>>>
>>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>>> Reported-by: Łukasz Stelmach <steelman@post.pl>
>>> Closes: https://lore.kernel.org/ 
>>> netdev/87340td30q.fsf%25steelman@post.pl/
>>> Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
>>> ---
>>>   net/ipv6/addrconf.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
>>> index 5476b6536eb7..f6a3d9da3cb1 100644
>>> --- a/net/ipv6/addrconf.c
>>> +++ b/net/ipv6/addrconf.c
>>> @@ -4654,9 +4654,11 @@ static void addrconf_verify_rtnl(struct net *net)
>>>                   !ifp->regen_count && ifp->ifpub) {
>>>                   /* This is a non-regenerated temporary addr. */
>>> +                unsigned long pub_age = (now - READ_ONCE(ifp->ifpub- 
>>> >tstamp)) / HZ;
>>>                   unsigned long regen_advance = 
>>> ipv6_get_regen_advance(ifp->idev);
>>> -                if (age + regen_advance >= ifp->prefered_lft) {
>>> +                if (age + regen_advance >= ifp->prefered_lft &&
>>> +                    pub_age + regen_advance < READ_ONCE(ifp->ifpub- 
>>> >prefered_lft)) {
>>>                       struct inet6_ifaddr *ifpub = ifp->ifpub;
>>>                       if (time_before(ifp->tstamp + ifp->prefered_lft 
>>> * HZ, next))
>>>                           next = ifp->tstamp + ifp->prefered_lft * HZ;
>>> -- 
>>> 2.53.0
>>>
> 

