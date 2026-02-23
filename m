Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072E436826D
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 19:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771875279; cv=none; b=F1NJicjTI+4FY9OAp5FljxnWQRtfCgL4sp2l7xqVwxd0izQ1gwOTuoJhNPspvXhUhPxLshlU4m6XYWjksij4WWRp7LUhEU9i8WVn6TCMtuthXFE77h1qCaAvX6a/bck0QXwFQnTi9ZuUx8NCdH6zSCcRNdDlXwnM0wvkYIjyy7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771875279; c=relaxed/simple;
	bh=zPzIE63q+SKIDVvzynuyd4TDpCR9AcVQsqgQm/sM/LA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IW9sxPw18Qajh2haMoyQz0V9lcY4JDDVs8u+BVJGiNNjzDYLsfgdGl1axXt02uNfV16uiS6haQiiwAmrTDI5KOVcX69BeRozKy3vXlqYD6uD816FcywjT80PhsRDqW42Qg2WLhdhs7cUHiinTbH7XVP7urL2JU4Tj+ir5Y2FV6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bcYdof09; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sAbOg2o3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ug7xIB1h; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rM0b80c4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bcYdof09";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sAbOg2o3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ug7xIB1h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rM0b80c4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E99CA3ED9E;
	Mon, 23 Feb 2026 19:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771875276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aPKhoA1IudoX9gVRAm7a8eC45/4QquXeX3VQupX9rHo=;
	b=bcYdof09AinURCf+eM4OpOKjUN1jXRBGnfToJe/OcV+wf92RUfWq6nyXZ5wk3SMy/E2hcU
	Qkk1gBlnm7yw8wJzFum+V4NgRx+IHsgFjvC9Dsaw/rrWkRPcQJ0Nj/kEHXZ1CGAQ3/Cl7L
	4vwXVQEvd3v6fxE/k2lJLwQ2TNWTayQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771875276;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aPKhoA1IudoX9gVRAm7a8eC45/4QquXeX3VQupX9rHo=;
	b=sAbOg2o3QjX82PJW0oEc4tKQMVS70O7oGC3oWi5xBTE5CYZldJsxf7TyfRzpHFpFEkloCz
	Y+ap2ZLBwDyGmeAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ug7xIB1h;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rM0b80c4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771875275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aPKhoA1IudoX9gVRAm7a8eC45/4QquXeX3VQupX9rHo=;
	b=ug7xIB1hUMgqFgNCH9X/7LWoqUKrUaE58ISIL0bByJIObvmNVG/bZ8ZnS4kjArzo55pDdU
	ieBjjGY0TiUBw3URbZdvUKX0qz8fahEEn9fPsBhbL253rC01KGdYjgrQ+NpYbIWs6jLhYp
	4vmyJpJVLKznGBtaln72NJVkND1nKV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771875275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aPKhoA1IudoX9gVRAm7a8eC45/4QquXeX3VQupX9rHo=;
	b=rM0b80c4y5q9Dg7aWpPSstQXvcJpwTZrWiqm+2eCd+A0cKnh5/1MubYm5Q02jdGfmjNuA2
	ymRmvpC0mDj4suAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B4C43EA68;
	Mon, 23 Feb 2026 19:34:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /aZFF8urnGl/NQAAD6G6ig
	(envelope-from <fmancera@suse.de>); Mon, 23 Feb 2026 19:34:35 +0000
Message-ID: <31aab9d3-b4d9-42fe-a248-1da22d5293ce@suse.de>
Date: Mon, 23 Feb 2026 20:34:28 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] selftests: net: add ipv6 RA route to ECMP merge
 test
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org
References: <20260223150950.31904-1-fmancera@suse.de>
 <20260223103902.4c06e85d@kernel.org>
Content-Language: en-US
From: Fernando Fernandez Mancera <fmancera@suse.de>
In-Reply-To: <20260223103902.4c06e85d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: E99CA3ED9E
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 

On 2/23/26 7:39 PM, Jakub Kicinski wrote:
> On Mon, 23 Feb 2026 16:09:50 +0100 Fernando Fernandez Mancera wrote:
>> +	# Prepare for RA route with gateway
>> +	$NS_EXEC sysctl -wq net.ipv6.conf.veth1.accept_ra_rt_info_max_plen=64
> 
> This fails for us:
> 
> # 95.85 [+2.11]     TEST: ipv6 promote RA route to static                               [ OK ]
> # 95.85 [+0.01] sysctl: cannot stat /proc/sys/net/ipv6/conf/veth1/accept_ra_rt_info_max_plen: No such file or directory
> not ok 1 selftests: net: fib_tests.sh # exit=1
> 
> https://netdev-ctrl.bots.linux.dev/logs/vmksft/net/results/531161/10-fib-tests-sh/stdout

Hm, I see. CONFIG_IPV6_ROUTE_INFO seems to be missing. I am adjusting it.

Thanks,
Fernando.

