Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A093DFC77
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 15:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777907333; cv=none; b=hmmGWlESbGmN3eamvB9VjWaKyk2gIfEzDDhkD+XFDNfwgIIOIGv7kN5RxUvmmQboBgrIwjJ/9AvJkFYi7aVx/llQJIEU/0yc4oNfZpBwJ7GPfYzBxa6FBvCADPr4QLdOHU4w3m0YQ7S9ZZ/lcLh9wsX3VQHDH3Af1JDvjrFOLdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777907333; c=relaxed/simple;
	bh=Ea5omULVnzdaSjNy5tojSHOvj5WfXMMZWBGEsxlHK2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQ7dTS8wqLD6lRt94xZhvRIJddf23i/hjicL1QyGwj90QIH0w+NfCXurOwgMAXrqkdeXbKT2YHViRNaBaLUgNSnNgiq0kXnusHMGk8yWTd6+JLwvgd2wDYwU0qiyUrwCqUcyZNDecM5/aPrEZwdKsFnBwDxz5zgyZjNkm+kXgjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NQgXsUy1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=itUItP3u; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NQgXsUy1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=itUItP3u; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NQgXsUy1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="itUItP3u";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NQgXsUy1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="itUItP3u"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 127D15C776;
	Mon,  4 May 2026 15:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777907330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lek3YVoWv/e5/EeAqCEpXt+87ZWsgHySNiTH6wyzoBU=;
	b=NQgXsUy1PRMgynFaRG7/cG4QwRTzTywCAc/Sf6dRYem+3tLrBeVkSLIZKie/YrxXY1ebN1
	nqzTnXe+BsgbybBnBxURmgsWSLKyu4T5CgPkZRfFrwNdZlOiJ26/nk61T0oi1/heEaH41o
	+W6WJ1OlDW1wSNkdJN2Gq+T6K3dXiUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777907330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lek3YVoWv/e5/EeAqCEpXt+87ZWsgHySNiTH6wyzoBU=;
	b=itUItP3ufWRswEPeNbGEbc0GaWfv2c7i3UN4RESyHhd9GklNy3ifQhV5B4dJJk/b/TNAha
	hi9/NRRDYJY7+UCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777907330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lek3YVoWv/e5/EeAqCEpXt+87ZWsgHySNiTH6wyzoBU=;
	b=NQgXsUy1PRMgynFaRG7/cG4QwRTzTywCAc/Sf6dRYem+3tLrBeVkSLIZKie/YrxXY1ebN1
	nqzTnXe+BsgbybBnBxURmgsWSLKyu4T5CgPkZRfFrwNdZlOiJ26/nk61T0oi1/heEaH41o
	+W6WJ1OlDW1wSNkdJN2Gq+T6K3dXiUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777907330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lek3YVoWv/e5/EeAqCEpXt+87ZWsgHySNiTH6wyzoBU=;
	b=itUItP3ufWRswEPeNbGEbc0GaWfv2c7i3UN4RESyHhd9GklNy3ifQhV5B4dJJk/b/TNAha
	hi9/NRRDYJY7+UCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 88DC1593A3;
	Mon,  4 May 2026 15:08:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uICQHoG2+GmNAgAAD6G6ig
	(envelope-from <fmancera@suse.de>); Mon, 04 May 2026 15:08:49 +0000
Message-ID: <1cc469cf-b337-4c4d-8bbf-ff65ab10f4ed@suse.de>
Date: Mon, 4 May 2026 17:08:49 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3 net-next v3] selftests: net: add test for IPv4 devconf
 netlink notifications
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
 kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 idosch@nvidia.com, dsahern@kernel.org
References: <20260504123143.6284-1-fmancera@suse.de>
 <20260504123143.6284-3-fmancera@suse.de>
Content-Language: en-US
From: Fernando Fernandez Mancera <fmancera@suse.de>
In-Reply-To: <20260504123143.6284-3-fmancera@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 

On 5/4/26 2:31 PM, Fernando Fernandez Mancera wrote:
> Introduce a new test, `ipv4_devconf_notify`, to verify that the kernel
> sends the appropriate netlink notifications when IPv4 devconf parameters
> are modified.
> 
> Since YNL currently has a bug where it declares an array of u32 values
> instead of the nested attributes expected by the kernel for devconf set
> operations, a temporary hack (`patched_add_attr`) is included to
> pack the netlink attributes correctly.
> 
> Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
> ---
> v3: added this patch to the series as requested by Paolo.
> ---

I just learnt about ruff. There are two new warnings. I will repost 
fixing them.

Sorry for the noise.

---
pw-bot: cr
