Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A2747798F;
	Fri,  4 Sep 2026 16:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540369; cv=none; b=q7CC7wDIg0p9pHXfGq2wUorltAADDbRG22TVO5Qai12syVc6jMuct7669Sn0ycFoFJ9HO8QHJx+wbAeNY0Rb8bcAbsQPdoO00rQvgN2KUT905/aJ0af8xdAQ1ZWROPRmVTg5UhddikceilUKsNm2SY9n1EOOV43xTjNVWPgD9UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540369; c=relaxed/simple;
	bh=p/QDGi7MJCxA8soqcqABl6a7rhLa88UYgRiKEbdriGs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F7+TX+e/OWOROtMF2HE/9BKCppnE8vfGhlVimovf9fqpft1mC+pT4E+rzdODeOB2zjweVf5sJsZGb//VKu09r6mq0hAWobqR7T43K9sa1F7BwPTDWDxpAfVEhLkDVbDhTwMzpK/HssruyWS30fSd3cerEhYHUOtXx+8r4Xw1M3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UShlwPcl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KaGGf68u; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ODVwy5Jr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ohap4DB+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UShlwPcl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KaGGf68u";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ODVwy5Jr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ohap4DB+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9E269203A4;
	Fri,  4 Sep 2026 16:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788540355; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o5Vk7nOeZkCcjmUccwIC3knrNfALT30x9jDi0kHot6E=;
	b=UShlwPclrh7FHtEs+KEKlAFVg2g5YyEERhzJVOvxdpksayYj3j9QOExmOPBR/RVp8nX1II
	5REFTcu4DV/JjcqF/hIZun0FpSuEjyMwC3Z5cv0mSgJZJs+LDXGXc3C+TLBh1vxm9aZ01/
	+XsCYSgt5LbZj1tJ4pu1qayNSEzxxhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788540355;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o5Vk7nOeZkCcjmUccwIC3knrNfALT30x9jDi0kHot6E=;
	b=KaGGf68uJ6a+1KdU27+C8iBosfL7j6epyxQTTqhSKnFt3rs6VwHKg+bXqK+kxToyrKDOmi
	ZNzIpzufJ6Rwh6BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788540351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o5Vk7nOeZkCcjmUccwIC3knrNfALT30x9jDi0kHot6E=;
	b=ODVwy5JrvyC4hqCTZYTI3CEF7K0qTPmWs0xwM+lP5hqUxMEEUDUoj1yIyoVZKdNXsNMY1n
	i8TvwJBrkuyExXgpc6UMdon9dhod334YNJB4RlmXEW8HI5qPN6ijwCtAjFmqPRPT6jOZko
	rA/RdqGgnnYe17355nCJyPIDR25vrqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788540351;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o5Vk7nOeZkCcjmUccwIC3knrNfALT30x9jDi0kHot6E=;
	b=Ohap4DB+z72s/6eNe0A15gIl1D8NrM/Kz/pB13pmVDYPTcIlQY/3wsn/dMD6T2TVnByG5I
	Mzg6+8sLIoIWf6Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A53713726;
	Fri,  4 Sep 2026 16:45:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DXrCK731mmoXVAAAD6G6ig
	(envelope-from <krisman@suse.de>); Fri, 04 Sep 2026 16:45:49 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Christian Loehle <christian.loehle@arm.com>, Shuah Khan
 <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Cc: Rama Krishna Katta <ramakrishna.katta@arm.com>, Thomas Gleixner
 <tglx@kernel.org>, Gregory Price <gourry.memverge@gmail.com>, Kees Cook
 <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski
 <luto@kernel.org>, Gabriel Krisman Bertazi <krisman@collabora.com>,
 linux-kernel@vger.kernel.org, Christian Loehle <christian.loehle@arm.com>
Subject: Re: [PATCH 0/3] selftests: Skip SUD tests when unsupported
In-Reply-To: <cover.1786965107.git.christian.loehle@arm.com>
Organization: SUSE
References: <cover.1786965107.git.christian.loehle@arm.com>
Date: Fri, 04 Sep 2026 13:45:44 -0300
Message-ID: <87jyp12cef.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Level: 
X-Spam-Score: -2.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MISSING_XM_UA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,gmail.com,infradead.org,collabora.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,arm.com:email]

Christian Loehle <christian.loehle@arm.com> writes:

> Syscall User Dispatch (SUD) is unavailable on architectures without
> generic syscall entry. Such architectures return -EINVAL for otherwise
> valid SUD prctl and ptrace requests, which the SUD selftests currently
> report as failures.
>
> Probe SUD with a valid disabled configuration and skip the affected tests
> when that probe returns EINVAL. Unexpected errors remain failures, and the
> existing coverage is unchanged on kernels that support SUD.

Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>

-- 
Gabriel Krisman Bertazi
