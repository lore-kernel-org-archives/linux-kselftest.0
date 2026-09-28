Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888CB367F2F;
	Mon, 28 Sep 2026 18:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790619424; cv=none; b=e4edfIqSWLES3Ur0ntlideaMYGE4Y7ULDkiT/ZEgLf5I1t61sMRd0qSu3LVUEzqcxyU9ekEm/yQFezz7CXfJ+UnPUWB46I/wHA0JzXcyrZl1LWW/C9s4z1Emo2Hw/5HIAkORdXWKa24JHpZu8Hx/vpnUM2ZBX6VsMny9A1yk+80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790619424; c=relaxed/simple;
	bh=SYVzJO4yzxWfIt2ZjFDBTDCjKXe+MYl187jm/yAY27s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsWy6Aq3cDpT2KujzoqoJdb6Hejvp7maDQ+YR0/UDjjTtAq1d/3q6JllRCo0SKgTO++e+9vJn1N2rkkp80FUeNXCWNvfTY0bGXgVw1CLEauIRt5Zx5DL7/UlBUG2emdT9y9bA+GoH3jPBPg3YqwqCLXSEFdoZixMR2naik1XnzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jsqBP4rH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Cob2+ThX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DTqAC8Q/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WQUk4VM/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jsqBP4rH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cob2+ThX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DTqAC8Q/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WQUk4VM/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 06BE21F395;
	Mon, 28 Sep 2026 18:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790619416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QhzBhh+sX2UeU6n8oJoJHyQ8DgBeRZdBkkfTngNCVDs=;
	b=jsqBP4rHDOMeIL+ouVMQQ0LO8ZYp8yC6NJGupeIFv4UwiHU/bX11QSinYhG6AH4K1TMCpd
	AJL5likiRIyDJ00bu7yGw6sTjrQDQMfIFC6i2mXIH67SL58h6QWiBU3vT2EXIVWCJ4IfRf
	Wc0ITgoNtn2n6K2wy+vdU2uTkpUrA9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790619416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QhzBhh+sX2UeU6n8oJoJHyQ8DgBeRZdBkkfTngNCVDs=;
	b=Cob2+ThX0ZnhUeavgoYaEdZ4fkPqAhpnFpLQkaFYZ/WsBXfOtgoYmK5iYukw0JuNpmteBM
	egk9vEOY4s91VFBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="DTqAC8Q/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="WQUk4VM/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790619412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QhzBhh+sX2UeU6n8oJoJHyQ8DgBeRZdBkkfTngNCVDs=;
	b=DTqAC8Q/5I651HSgcOyPutAJHDFqAdHIqNueDifk3hAzlEx8yvJdoV+glaoS0LYqzGSh70
	egqInx7JMF/xpnJn0TZHnKLg2hKdJojbqIKRn0mBIm1TAx4z1cPi3H3vzC7dU7bbkliVsK
	glbkoX5KUj36ocwzx2mzFH3w/5JjgTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790619412;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QhzBhh+sX2UeU6n8oJoJHyQ8DgBeRZdBkkfTngNCVDs=;
	b=WQUk4VM/WGEL3cU02YT2ORIz6Fe2zjOtlP5kI0ix/2Vw8prsay7hjX54RuJ/sh5GNZvxO2
	3uUjaZnwKRsSEGBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 418F8133F1;
	Mon, 28 Sep 2026 18:16:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IkdFAxKvumoMbAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 28 Sep 2026 18:16:50 +0000
Date: Mon, 28 Sep 2026 19:16:48 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: linux-mm@kvack.org, liam@infradead.org, rbm@suse.com, 
	akpm@linux-foundation.org, luto@amacapital.net, brendan.jackman@linux.dev, david@kernel.org, 
	liuhangbin@gmail.com, corbet@lwn.net, kees@kernel.org, ljs@kernel.org, 
	broonie@kernel.org, mhocko@suse.com, rppt@kernel.org, shuah@kernel.org, 
	surenb@google.com, vbabka@kernel.org, wad@chromium.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org, geert@linux-m68k.org, 
	daniel@thingy.jp
Subject: Re: [PATCH v3 1/3] selftests: kselftest: avoid cd - in runner
Message-ID: <arqu1zdvMBXDziRX@pedro-suse.tail5790ac.ts.net>
References: <20260926010819.604346-1-thehajime@gmail.com>
 <20260926010819.604346-2-thehajime@gmail.com>
 <arqi6iwLDDBlk6Tm@pedro-suse.tail5790ac.ts.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arqi6iwLDDBlk6Tm@pedro-suse.tail5790ac.ts.net>
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: 06BE21F395
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kvack.org,infradead.org,suse.com,linux-foundation.org,amacapital.net,linux.dev,kernel.org,gmail.com,lwn.net,google.com,chromium.org,vger.kernel.org,lists.infradead.org,linux-m68k.org,thingy.jp];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Flag: NO

On Mon, Sep 28, 2026 at 06:27:42PM +0100, Pedro Falcato wrote:
> On Sat, Sep 26, 2026 at 10:08:17AM +0900, Hajime Tazaki wrote:
> > The kselftest runner currently uses `cd -` to restore its working
> > directory after running a test.
> > 
> > This is not supported by the minimal BusyBox hush shell used by some
> > NOMMU targets. Store the original directory explicitly and restore it
> > with a quoted path instead.
> > 
> > This also avoids printing the directory change performed by `cd -` and
> > handles paths containing whitespace correctly.
> > 
> > Cc: Shuah Khan <shuah@kernel.org>
> > Cc: Kees Cook <kees@kernel.org>
> > Cc: Andy Lutomirski <luto@amacapital.net>
> > Cc: Will Drewry <wad@chromium.org>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Brendan Jackman <brendan.jackman@linux.dev>
> > Cc: Hangbin Liu <liuhangbin@gmail.com>
> > Cc: "Ricardo B. Marliere" <rbm@suse.com>
> > Cc: linux-kselftest@vger.kernel.org
> > Cc: linux-um@lists.infradead.org
> > Cc: linux-mm@kvack.org
> > Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
> 
> NACK.
> 
> https://pubs.opengroup.org/onlinepubs/009695099/utilities/cd.html
> 
> -
> When a hyphen is used as the operand, this shall be equivalent to the command:
> cd "$OLDPWD" && pwd
> 
> which changes to the previous working directory and then writes its name.
> 
> 
> If you're running selftests on !POSIX compliant shells, that's a
> you-issue. Fix the shell, or use something decent.

... I realize I was a bit too aggressive but seriously, lets not support
broken software, please?

-- 
Pedro
