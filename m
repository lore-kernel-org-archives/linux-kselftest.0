Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FDA39C017
	for <linux-kselftest@vger.kernel.org>; Sun, 10 May 2026 15:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778427802; cv=none; b=gAGMEdVMGl3jk8KUuoZEB9E5M+wyhGLTxh69bvFCnZ00/izuOSH2M495SzqruYbmR+Lopj8nP+tuYq85jb/H688Ni/boSV2Ir/hO0/Ysd7BY+ZBhcaSK8vjvNyFHNhAwD+9x53xJtZJV3rEgAHk/h2j8gaexI/5v67Y9sEpeWWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778427802; c=relaxed/simple;
	bh=Yqm0JJ6KMIy5Dj9ZilpV1LWQn4g2V6QCjYd20uha+qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LgUhcaBSGdbEeVAOJajxZO0QD0gkAXeqCk5UW88ZHSzE+C14oy/MB6c2kZjLMgQj/cN6uHt1UtxOo5iHGjwpcTztpFaRVXzkKk99ZZORwTM5/GcO6x6SZiC5pili84zvD56xwsFog2Zy2Ip1PTBhaZwaN9hCgQ5Ba1+0qzq5eLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wObcXIiT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KG4qWpqQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CO0at+Fg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gc7kH8YD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wObcXIiT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KG4qWpqQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CO0at+Fg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gc7kH8YD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 812816799C;
	Sun, 10 May 2026 15:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778427793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k8sWkn+8HuBV0/6DaAEZgQxc0UgzXG8eAgWGOiC0/xQ=;
	b=wObcXIiTm3Q0w8WeTOL9UavTr8HpZJCsAbHL72zuRuGeXHthIa21p1GKA9wvZbwegjX7pG
	LTAh9Xd1NoxyAQSob4YGO8Hz1xt5GbAYDyoHt9MNALQdD7Ejp75wGD75HfMtlANEJBZ0IV
	V8fOjKFDluV5UZi3FUtWu3Xp4jSoTu8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778427793;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k8sWkn+8HuBV0/6DaAEZgQxc0UgzXG8eAgWGOiC0/xQ=;
	b=KG4qWpqQLtjQA626K/5OLr32UJKGOLpiq5ZqfbA5SamYYk/kAKmI1LpBgdebaGqsZGjCdZ
	ZUPSV8UIqJL5RjDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CO0at+Fg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gc7kH8YD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778427792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k8sWkn+8HuBV0/6DaAEZgQxc0UgzXG8eAgWGOiC0/xQ=;
	b=CO0at+FgYf8ECQT3Lbxp1EWo17OfX3T7QC3rkU/eRlNFzuOi+OgrH5OB3EFHsU7DFq+CNF
	PPpco4dWFkwCeSKl+udZgEOLdizRHLiuH/jkKaDQOf8ftZ0ROtUpqfDLSf2gaAnEZC1owW
	/eGquXvVwP6jpm7fJJsEIYlsOTl9z/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778427792;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k8sWkn+8HuBV0/6DaAEZgQxc0UgzXG8eAgWGOiC0/xQ=;
	b=gc7kH8YDmDHjlVpXK0LuBX2ZCv3L/lpGpSqbCGLHOoe91MA5CRXJDBet+aN6D7Egx5bahf
	gug/2i/+M6qaC7AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C08D5593A3;
	Sun, 10 May 2026 15:43:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id szulI42nAGrtMQAAD6G6ig
	(envelope-from <fmancera@suse.de>); Sun, 10 May 2026 15:43:09 +0000
Message-ID: <ed9bfe0a-2460-476f-8d6e-4c92ecf18e00@suse.de>
Date: Sun, 10 May 2026 17:43:01 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2 net v3] ipv6: addrconf: fix temp address generation
 after prefix deprecation
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, dsahern@kernel.org, =?UTF-8?Q?=C5=81ukasz_Stelmach?=
 <steelman@post.pl>
References: <20260507132828.3923-1-fmancera@suse.de>
 <20260510145522.GA98198@shredder>
Content-Language: en-US
From: Fernando Fernandez Mancera <fmancera@suse.de>
In-Reply-To: <20260510145522.GA98198@shredder>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 812816799C
X-Spam-Level: 

On 5/10/26 4:55 PM, Ido Schimmel wrote:
> On Thu, May 07, 2026 at 03:28:27PM +0200, Fernando Fernandez Mancera wrote:
>> When a router temporarily deprecates an IPv6 prefix (either by sending a
>> Router Advertisement with Preferred Lifetime = 0 or by letting the
>> lifetime expire) and later restores it, the kernel permanently loses its
>> ability to generate temporary privacy addresses (RFC 8981) for that
>> prefix.
>>
>> This happens because the address worker attempts to generate a
>> replacement temporary address when the current one nears expiration. As
>> the base prefix is deprecated already, the generation fails after
>> marking the temporary address already having spawned a replacement
>> (ifp->regen_count++).
>>
>> When the router eventually restores the prefix, the temporary address
>> becomes active again. However, once it naturally expires, the address
>> worker sees this temporary address already tried to generate one and
>> skips the regeneration.
>>
>> Fix this by verifying that the base prefix has sufficient preferred
>> lifetime remaining before attempting to generate a new temporary
>> address. In addition, make ipv6_create_tempaddr() return meaningful
>> error codes. This way, we can catch if a 0-lft RA arrived just after we
>> passed the verification mentioned above. If we don't have sufficient
>> preferred lifetime remaining, the worker will keep the next timer as it
>> is.
> 
> I didn't go through all the Sashiko comments, but at least some of them
> seem valid. I wonder if we can simplify this and do the following
> instead:
> 
> When updating all the temporary addresses (f.e., because we received a
> RA), instead of only creating a temporary address if none exist, also
> create a temporary address if all the existing ones already regenerated
> a temporary address, as otherwise no temporary address will ever be
> created. Something like [1]. I didn't run it through Sashiko, but I did
> confirm that your test fails without it and passes with it.
> 

Hi Ido,

Thanks for this suggestion. I was preparing a new iteration for the 
patch and was trying to simplify it. This looks quite good indeed and 
better than messing with the timers.

Let me test this properly and if it looks good I will send a v4 and add 
a Suggested-by tag.

Thanks again Ido!
Fernando.

> [1]
> diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
> index 5476b6536eb7..3eaa583bb08d 100644
> --- a/net/ipv6/addrconf.c
> +++ b/net/ipv6/addrconf.c
> @@ -2597,6 +2597,7 @@ static void manage_tempaddrs(struct inet6_dev *idev,
>   {
>   	u32 flags;
>   	struct inet6_ifaddr *ift;
> +	bool all_regen = true;
>   
>   	read_lock_bh(&idev->lock);
>   	/* update all temporary addresses in the list */
> @@ -2637,6 +2638,8 @@ static void manage_tempaddrs(struct inet6_dev *idev,
>   		ift->tstamp = now;
>   		if (prefered_lft > 0)
>   			ift->flags &= ~IFA_F_DEPRECATED;
> +		if (!ift->regen_count)
> +			all_regen = false;
>   
>   		spin_unlock(&ift->lock);
>   		if (!(flags&IFA_F_TENTATIVE))
> @@ -2644,12 +2647,14 @@ static void manage_tempaddrs(struct inet6_dev *idev,
>   	}
>   
>   	/* Also create a temporary address if it's enabled but no temporary
> -	 * address currently exists.
> +	 * address currently exists or if all the temporary addresses already
> +	 * regenerated an address.
>   	 * However, we get called with valid_lft == 0, prefered_lft == 0, create == false
>   	 * as part of cleanup (ie. deleting the mngtmpaddr).
>   	 * We don't want that to result in creating a new temporary ip address.
>   	 */
> -	if (list_empty(&idev->tempaddr_list) && (valid_lft || prefered_lft))
> +	if ((list_empty(&idev->tempaddr_list) || all_regen)
> +	    && (valid_lft || prefered_lft))
>   		create = true;
>   
>   	if (create && READ_ONCE(idev->cnf.use_tempaddr) > 0) {

