Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC6937A49F
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 09:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222983; cv=none; b=cMshJWLDoSphDnXrFdRolxaKPNpCFS+7QLNS/0+mbBvSh7bYrUFd10SRxaUcPLdpiDj96rPOTBJCuYIrq27czQU8Zx9nvBjyUvFQaZ/xfI+XHiq+VsOFt7uuoW/S7ueqwCB48TY1rEh7Z1YCt8Ig/CsR7RrC+1H80asm1hip2ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222983; c=relaxed/simple;
	bh=ZmO9Z5EpX/4qBh95+I/z9PQDaR52XQ0PaFt3FKJHVFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bc5Bfgf4UIGUK04N2oYjrqrQpbPtBFzZdUcIYusP6PZlQIAsw9E0jdWffrBIaBiQqFJGakz8YGce8BVXBazJzdwNSi+57mNQGcgPe0cTd7y5yYVcv/+aqRBBP0IMaSc9zdUMy9hznY6BSb0KzntBROUCfCAEuze7Hw0nl8dwit4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L4gJM2KD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FIfZdxZL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L4gJM2KD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FIfZdxZL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L4gJM2KD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FIfZdxZL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L4gJM2KD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FIfZdxZL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8B0584D1F6;
	Wed, 11 Mar 2026 09:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773222980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N7bzVvzdWc5ep0b7yb3gm0vq2rmlvwDapRWBJqvHgS8=;
	b=L4gJM2KDJO76PDAnMK9hmf9Wqfxee8YFW2bhh5aGGFmxtCvjM6ocknSK/iRPvJ+93SYNB8
	Pth8eua16VngWk5Qza2xmwQJFWAXcxlvqknJLK9zfAgcEGjWdhMFB286j2lN20EIKKn69B
	KQQvzs9bX49SAqA7ZqZUPRzyLN4FASI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773222980;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N7bzVvzdWc5ep0b7yb3gm0vq2rmlvwDapRWBJqvHgS8=;
	b=FIfZdxZLuee18ApOiH2YZ2mTWgPzOWVvmAEg4X+kpJiWY6LEPoC87Akx4tsa63okNSh3dc
	nkwA6zOKtQ5z7sBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773222980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N7bzVvzdWc5ep0b7yb3gm0vq2rmlvwDapRWBJqvHgS8=;
	b=L4gJM2KDJO76PDAnMK9hmf9Wqfxee8YFW2bhh5aGGFmxtCvjM6ocknSK/iRPvJ+93SYNB8
	Pth8eua16VngWk5Qza2xmwQJFWAXcxlvqknJLK9zfAgcEGjWdhMFB286j2lN20EIKKn69B
	KQQvzs9bX49SAqA7ZqZUPRzyLN4FASI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773222980;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N7bzVvzdWc5ep0b7yb3gm0vq2rmlvwDapRWBJqvHgS8=;
	b=FIfZdxZLuee18ApOiH2YZ2mTWgPzOWVvmAEg4X+kpJiWY6LEPoC87Akx4tsa63okNSh3dc
	nkwA6zOKtQ5z7sBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8FFE43F963;
	Wed, 11 Mar 2026 09:56:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EK7wH0M8sWlzcgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 11 Mar 2026 09:56:19 +0000
Date: Wed, 11 Mar 2026 09:56:17 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Anthony Yznaga <anthony.yznaga@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, jannh@google.com, Jason@zx2c4.com, shuah@kernel.org
Subject: Re: [PATCH v2 2/2] selftests/mm: verify droppable mappings cannot be
 locked
Message-ID: <ci3s76cywghceblvsjccphbmidr4yop37dupcj6jyccqzipzwy@4rk6gdjq2gum>
References: <20260310155821.17869-1-anthony.yznaga@oracle.com>
 <20260310155821.17869-2-anthony.yznaga@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310155821.17869-2-anthony.yznaga@oracle.com>
X-Spam-Score: -3.80
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MISSING_XM_UA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Tue, Mar 10, 2026 at 08:58:21AM -0700, Anthony Yznaga wrote:
> Verify that a mapping created with MAP_DROPPABLE cannot be locked
> via mlock(), and that it will not be locked if it's created after
> mlockall(MCL_FUTURE).
> 
> Signed-off-by: Anthony Yznaga <anthony.yznaga@oracle.com>

Acked-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
