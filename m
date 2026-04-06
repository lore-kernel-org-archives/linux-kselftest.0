Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48691313E01
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 08:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464547; cv=none; b=gme9XCioBE6ltDYNV8f/Hz9NcdP7r2U4NDqNdIfwrCwZb/r0ag4FIzOZ5jiaidxLKCWxcvBzIKphnxXaynYWl8flx2bhw541Vf4Scs7ci2S/0k/V9uY+DxZtjnHJwQwaH4o9yJltIiv5HRQuIhksZ/AMpnyCvKNv4TWp9Z5ZE54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464547; c=relaxed/simple;
	bh=uKUgvkWlOpWpXyES/XFCxab0Qv5v7aSygOWRVhWzZTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NERU6kPzgQQoa4Tr+iJlsgGN3Y0yE84Jm1ot4w4i+15qjTgugRutc1WEEnzfOIW/p5r2C0jcqAlIouk6hCtlV2CpTfw+4Y8u2cP2g6BKcjeSITJ88IIosG/ITIwP7x8VyA9Q1sK5/v5SA0Ql6otCmW7Zjw03qyiANdYEced/8AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EuZWg+9w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2pmHk/tH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EuZWg+9w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2pmHk/tH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EuZWg+9w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2pmHk/tH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EuZWg+9w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2pmHk/tH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 71BF35BE07;
	Mon,  6 Apr 2026 08:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775464543; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mGn3YqVusQfcpkRlU/Al/6e+9PEsnYlLqJj0S0m0v7k=;
	b=EuZWg+9w9RbxXJp7OB9syQGDnt7KHZL/sl66NwO23c4RFBz5ZbCkTNm3hL6DjjaqLEYFWB
	V0/nZXDKgdxj6xfp0CxSNQAq+14C4k5es56AUo3FWr/sUG1m5gIX/pSSkqh2y7Bj0bAkuX
	8qqAxStk17fFzBZ3XgJJ/T90zi+IiyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775464543;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mGn3YqVusQfcpkRlU/Al/6e+9PEsnYlLqJj0S0m0v7k=;
	b=2pmHk/tHwbWs0sP75f6badDDoruGdJKfNjFLA86DRWalUIEu20DhzpkMPXjoyKlJYus5rA
	VN74UsBnsBS2cWAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EuZWg+9w;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="2pmHk/tH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775464543; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mGn3YqVusQfcpkRlU/Al/6e+9PEsnYlLqJj0S0m0v7k=;
	b=EuZWg+9w9RbxXJp7OB9syQGDnt7KHZL/sl66NwO23c4RFBz5ZbCkTNm3hL6DjjaqLEYFWB
	V0/nZXDKgdxj6xfp0CxSNQAq+14C4k5es56AUo3FWr/sUG1m5gIX/pSSkqh2y7Bj0bAkuX
	8qqAxStk17fFzBZ3XgJJ/T90zi+IiyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775464543;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mGn3YqVusQfcpkRlU/Al/6e+9PEsnYlLqJj0S0m0v7k=;
	b=2pmHk/tHwbWs0sP75f6badDDoruGdJKfNjFLA86DRWalUIEu20DhzpkMPXjoyKlJYus5rA
	VN74UsBnsBS2cWAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 778D34A0B0;
	Mon,  6 Apr 2026 08:35:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hTG7GV5w02lYIQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 06 Apr 2026 08:35:42 +0000
Date: Mon, 6 Apr 2026 09:35:40 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Anthony Yznaga <anthony.yznaga@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, jannh@google.com, Jason@zx2c4.com, shuah@kernel.org
Subject: Re: [PATCH v2 1/2] mm: fix mmap errno value when MAP_DROPPABLE is
 not supported
Message-ID: <aa5xuslgioyrxko7lmkwp6y25v7smyihjcbsnj62lvc37otec4@74bk6pmugq7w>
References: <20260402235933.10588-1-anthony.yznaga@oracle.com>
 <20260402235933.10588-2-anthony.yznaga@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402235933.10588-2-anthony.yznaga@oracle.com>
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 71BF35BE07
X-Spam-Flag: NO
X-Spam-Score: -4.01
X-Spam-Level: 

On Thu, Apr 02, 2026 at 04:59:32PM -0700, Anthony Yznaga wrote:
> On configs where MAP_DROPPABLE is not supported (currently any 32-bit
> config except for PPC32), mmap fails with errno set to ENOTSUPP.
> However, ENOTSUPP is not a standard error value that userspace knows
> about. The acceptable userspace-visible errno to use is EOPNOTSUPP.
> checkpatch.pl has a warning to this effect.
> 
> Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Anthony Yznaga <anthony.yznaga@oracle.com>

FWIW I'm not a huge fan of EOPNOTSUPP here, because there's no precedent for
EOPNOTSUPP (it would perhaps normally be EINVAL, but the kernel does recognize
the flag, it just can't implement it...)

Anyway,

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
