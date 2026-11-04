Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811159;
	b=BVcFJTlPRAruEBSjN0CyRr6v+JzDV8wIAEkMhLtxOVJjRYMY0IBEkEDhhBdrQx/SQXuM
	 GsOyXXAm8Qq5/g9OGJoVqtcLbfy8fbaGqqs84h68mAA7SbYaRdY1iTb3dHDxPJcLFbNUq
	 aq+kn53d1JFpeb5bCUYkjbSHgmfXr7gj6dcVJS7l2o/VYRCLR/ZelQGRAEUh/ClRQDm7E
	 3S+fJaWKeI2YKpFE4iwY98g0tzXWsUCCIjDIrPZs1lMW2bp69Peyd8xTMK88tkvgmwEz9
	 y0k3ijsh687nSMPry7/eIH8qhV/T6RRc/nNIqe1ah86j7gMlAeSa+rCKwvzYvNYDfPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811159;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=TbExPZxbTeMwQMvr6C5iO2LZTzsQVMp/KAjDfnAxAsA=;
	b=AmGkFO2EA4z2NHIcdepNtS/e7fvJrexuvqmHAzZKeyhdHp6n6IQ3giLX6kZdzE2XyXGX
	 wIZ32BppRrygvYL22oZ4rmowblyG/5mWzIKXb1201oYeZAYvI7u+76OUC6OeaoVPjHpda
	 d+xvCfk3faTe264lyogzOltLheFR/Ab9+jkejMOu8oSmSR2/wNoeLqSMTG0U9UMEo8S6n
	 j9vogGzTG73x2bUnGWOe0S/GgohNrc3t41ejCeQQwMysUm1vg9iCmZJT/a+Bmo0ItNuv+
	 lPjDtnqgf5ft8ONOsEguOAgTbGFeTRz6hGH6//adygS+SYbbVaNDGfdhMfs5nkft29A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bVXe39cp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748BC606A339;
	Wed,  4 Nov 2026 16:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bVXe39cp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863471F000C1;
	Wed,  4 Nov 2026 16:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793811159;
	bh=TbExPZxbTeMwQMvr6C5iO2LZTzsQVMp/KAjDfnAxAsA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bVXe39cpVVcLguYmk8EACqs3hMlDpO2DUlD9NW4R6vZdAbeUsJ2gAV5m8uPsX3MM+
	 uBLD2AhG1qjg2zDH6eW0xq6rjKOLzEgtecSyZoU6wJWL3DfMryw9p0hYVBXBgHvOW0
	 4wn524rxoxn5Nb6GNB/CGP3plpbD1hK8p8f3TLvF+Vmehn9dYVo7pSD94J41K2Zp6V
	 mCJHRVbjEPEUw0045ku4CI8dhVZ5A49Dk6S6igqBDQ6/yHy3CbUeqpXFqFdKTUuh9S
	 /zdY0WfTdfVJLSsrvUxXkeqmzeFlB5bMkIaNav8xtirU1gA2dMCPyRe4q4iM0yeBRK
	 aANSnFkLhO5GA==
From: Pratyush Yadav <pratyush@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-mm@kvack.org,  Alexander Graf <graf@amazon.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Baolin Wang <baolin.wang@linux.alibaba.com>,
  Christian Brauner <brauner@kernel.org>,  David Hildenbrand
 <david@kernel.org>,  Hugh Dickins <hughd@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  "Liam R. Howlett" <liam@infradead.org>,  Lorenzo
 Stoakes <ljs@kernel.org>,  Michal Hocko <mhocko@suse.com>,  Mike Rapoport
 <rppt@kernel.org>,  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  Randy Dunlap <rdunlap@infradead.org>,
  Samiullah Khawaja <skhawaja@google.com>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Suren Baghdasaryan <surenb@google.com>,
  Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 09/10] mm/shmem_luo: Allow retrieving tmpfs files
 with O_RDONLY
In-Reply-To: <20261103010216.3447716-10-dmatlack@google.com> (David Matlack's
	message of "Tue, 3 Nov 2026 01:02:15 +0000")
References: <20261103010216.3447716-1-dmatlack@google.com>
	<20261103010216.3447716-10-dmatlack@google.com>
Date: Wed, 04 Nov 2026 17:52:34 +0100
Message-ID: <2vxz5wyck08d.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Nov 03 2026, David Matlack wrote:

> Allow userspace to pass O_RDONLY in struct liveupdate_shmem_retrieve_arg
> to retrieve a tmpfs file read-only.
>
> open() requires write access for O_TMPFILE, so create the file writable
> like before, then reopen it read-only with dentry_open() using the flags
> of the writable file, which file_open_root() normalized, and drop the
> writable file. Like open(), which grants the requested access to a new
> file regardless of its mode, don't check permission for the read-only
> open.
>
> Retrieving a file read-only allows a restored binary to be executed
> before the session is finished. LUO keeps the retrieved file open until
> then, and executing a binary that is open for writing fails with
> -ETXTBSY. Being able to execute restored binaries right away matters
> when they are needed to finish restoring the system, e.g. to bring up
> the services that retrieve and finish the remaining sessions.

Can't you put all your binaries in a separate session, retrieve it as
the very first thing, and then finish the session? Then you can execute
those and retrieve all the other sessions.

Why do we need to support this in the kernel?

Also, please put the motivation as on the top-ish of the commit message,
and the mechanics later. For example, your second paragraph should
likely come below this one.

[...]

-- 
Regards,
Pratyush Yadav
