Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821083;
	b=H3Db57w7xyiChOIrLWoRSPvFcEPmaSmJuVT6+oWOmyRtJFgwyMzb+0P0meaLi73off0C
	 ZtFRsp2qrtZ849U2y9W42vJ4MtkefwB7LGwU4tax98ZSFwiW8NJNLCk3LaCeU1gsYd/wy
	 mWh3wpdqhPRwTWSv2jzlvQDygE4YaT96+5tsUCh0kSVNDM21ffUqv2FOgBXBfg8dADlYs
	 E5UWzrh+s335+l3ufHmQAcWO4sJxuytyKhuNTV6LUgxWwkoyq2/kq9L8AOIGa4AJD1kEq
	 ms+KShD5a3t71IoopVGw53/tKDCw1Zd0Z6mz6OAW+lL7YczEPdLQ+tobeK49U/i/Zpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gHsVZIyLB4LY6jVwLQ9hDHHfJ9C6/ccEH9xuZg5C7+0=;
	b=Ux+msAWJNe2h5T7xZDMeqeLORUPBwmWXTQBR2KpMaEP9hMLb/H0HuO8PO2mPBTBoYtwT
	 S1HkKpOmb29wGAlCNBYmaAy7ZqMzFP+UPm4aEMME6lesbp3j39T7pSEjmwV0QQWgXt321
	 Y581wwD2oT6yOoZvC4X6jpXigTKECj23lT5kUaI+xhCiCI//W3Mo4Z1gsDEqlSxYvply0
	 D3s39U5dewbvxMyecQcqizgTCqxlvG/UOs8oc2k9X0JDnFW9b3pJjWk54l2URPlp39SiD
	 vOpTzlMHzQoxb3wWptteHEmpWtvl1u5vm7+b7nLHI/zO2QMgunUPjlVoTMsDwQ+69RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=TJnxG9tU;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B72607F2A7
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 19:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17B72607F2A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=TJnxG9tU
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eac01ff101so436977e0c.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 11:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793821081; x=1794425881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gHsVZIyLB4LY6jVwLQ9hDHHfJ9C6/ccEH9xuZg5C7+0=;
        b=TJnxG9tUZrPoE5M3bA/Qth/IxImRtZ6ZkMq6PZ7AxPARnJxjkE6uy8PDC0QRGzKkSB
         elYXKbXAU1qgJmeMb4qGyjSeThpKbLb0Yi0WVcXpGBSoVRJ/r4fqm2IFP/kgV03Lu0Oq
         g1sHEZF1Qc7zHAWXnlT6K4sHkyT/rmCkscbyZ94x25Si4yeTdZ9RuHwcsPs53vXxUTEP
         fTXl66YSox2ZvpqrGc2tyR8PROaI5AT2J328hxLCMTkBv6amz9S5MBAHLtY8Ggf3obm6
         KE/iJbxoQ5Ov1xzUOHsepj+BfiVK2Eb0rr3Hm5xfME8cVGLzdFqlw2ULC41owtgjTu/8
         gRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821081; x=1794425881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHsVZIyLB4LY6jVwLQ9hDHHfJ9C6/ccEH9xuZg5C7+0=;
        b=WgoSG9hSSmtwYwub53IkNorOtDJt4kKrgtgeIPFYEOCEt1raPHR64wzDql7YXRO6k6
         tRvPGIcHSnm8In1vGc1NO5iJtK/s4/ZXK4Zib8gG9H/B8LrhsbX6F1P9eZXS9eNczhw3
         Qh64aucYocEkuF94n8HkrcjPhkZfYsrnESGDkMJCMzftLmM7t3u7DAuFOri59Touis2B
         0yRlpn+mJRK1vNAAfNR6TUKhnxwUH1kTek6LhdF2R9sgLLwkdq0u+EKVSFFGz21IFtWQ
         B+pXd+fiA7KbpGbjdseuYF4BAbe3qvi6vBqJEtoxc9NG279K+foCY7H2bTr1sSQa4g3c
         ocQw==
X-Forwarded-Encrypted: i=1; AKwUvBy1uRw9FqkuiWfk0msaOqP6x8WMVAA3saH0qM6G5AitDf7hedByyVCZrztxWEhN5Wz5393WHl5nZtlay/r6jhw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HRkjsSKQkj78fDNnDTTeov9wTZ/Fh8d1Rq2h8s/m7S3hmtS9C
	z6GJMw+agGv2+Ssd8vX6CnCd1Tr76HGwtp0kxT6kOydlmFxwHkbCxRlM1W6/ZlwylvE=
X-Gm-Gg: AYBFou25U8hHEXx48Xd3uZeyhTQ/hl5umO4rb8dHLt4wC+DV9lKh0FoIZnvXI4fzZce
	0A76cIVA/cCOIYV4bUg2d8RYiSmYAJ3nR3mzHMrX3Qj4QZMoYtFTFPOexV8sRdPSLsCz7ZMUp4q
	8fba1tcFlNwF7iSG/y09z7ILbEw3hPKhoyhgF4eivK/Ifz5jdzwK1lSHczaJ7kP9x7zw63jcRM6
	G601Yh3wFM7gcw7qaJLgkB2coxodsrkDbPitxBkiDTMx48hQfCV7LNgub0apUM+dp8k9fRNrnIf
	hYWnTTxnQFXG+ZebHsGEtmDukc6qTqiY59L1ceR3W9muKokFQio45nfVk+KB/ZQqCzIHCziTtwd
	KrkjAsK5n/dvW/XgXPNPnHrfMgrSZjtyI752+8fnnwcT1GtJ3VlT0KBvRJq15nPa+MQ/V3yXY+I
	FB1Fd+tWY4qgJNWoFTPxj+gDc4W87JyWRXvX9OzFHrlYABjz1Gs8m03nuT68LWIBqoOsUzzVQ62
	OmXCp/flo1h9JGkxoag/mbMnqETsif48ShY5+JxNm35WqhBQ41+ND7DAQMq5iSPGA8JgPHksUAC
	dITjGaGVvYyGGUEZRNOWszBjjaF4sHAHP1qFZhylM2wD3m5xVWkkuDrIP57p7A2eGA8J3sVdl93
	10Rhi90bEnmGsIrelysc8Le5AHA5MXLhC0L88GlIoYGzBRc1uKQ==
X-Received: by 2002:a05:6102:6b0b:b0:7d0:3ed0:c61c with SMTP id ada2fe7eead31-7d0726a9cd7mr6446000137.16.1793821080773;
        Wed, 04 Nov 2026 11:38:00 -0800 (PST)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d91d2a3asm2569956241.8.2026.11.04.11.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:38:00 -0800 (PST)
Date: Wed, 4 Nov 2026 14:37:59 -0500
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 10/10] selftests/liveupdate: Add a test for preserving
 tmpfs files
Message-ID: <auuJM8c-bE43NP54@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-11-dmatlack@google.com>
 <2vxz1p90jzx4.fsf@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxz1p90jzx4.fsf@kernel.org>

On 11-04 17:59, Pratyush Yadav wrote:
> On Tue, Nov 03 2026, David Matlack wrote:
> 
> > Add luo_tmpfs, a kexec test for preserving tmpfs files and memfds, and
> > for retrieving tmpfs files onto a tmpfs mount with struct
> > liveupdate_shmem_retrieve_arg.
> >
> > Stage 1 preserves the source files of each test case. Stage 2 runs
> > each test case in its own directory, with its own tmpfs mounts, so that
> > block usage can be checked exactly with statfs() and st_blocks. The test
> > cases cover:
> >
> >  - The restored file: contents, size, position, seals and holes, for
> >    linked and unlinked source files.
> >
> >  - Creating the file: it is created like with open(O_TMPFILE), with the
> >    requested mode minus the umask, owned by the caller, and not linked
> >    until userspace links it, unless it asked for O_EXCL. Also O_RDONLY
> >    and O_WRONLY files, other open() flags such as O_APPEND, O_NONBLOCK
> >    and O_CLOEXEC, read-only mounts, and directories that the caller
> >    can't write to.
> >
> >  - Preserving files that can't be written to: a binary while it is
> >    executed, through a read-only fd, files on read-only mounts and
> >    superblocks, and immutable files, including sparse ones, whose holes
> >    are filled. Preserving someone else's file that the caller can't
> >    write to fails, and so does preserving a file through a write-only
> >    fd or an append-only file.
> >
> >  - Executing restored binaries: a restored binary can be executed
> >    before the session is finished if it was retrieved with O_RDONLY, but
> >    not if it was retrieved for writing, since LUO keeps the file open
> >    until then. These test cases execute copies of the test binary.
> >
> >  - Block accounting: the file fits a mount of exactly its size, and a
> >    large folio that extends past the end of the file is charged in full.
> >    Running out of space, or hitting the memcg limit, fails permanently,
> >    and leaves nothing charged to the mount or the memcg. The session can
> >    still be finished.
> >
> >  - memfds: they are only retrieved as memfds, with their seals, and
> >    files from tmpfs mounts only onto a tmpfs mount.
> >
> >  - Interactions with LUO: invalid arguments, which can be retried,
> >    retrieving a token twice, and outgoing sessions.
> >
> > Also check that the size of a preserved file is frozen, and that the
> > test doesn't trigger kernel warnings.
> >
> > Enable CONFIG_TRANSPARENT_HUGEPAGE for the large folio test cases,
> > CONFIG_MEMCG for the memcg test case and CONFIG_TMPFS_XATTR for
> > FS_IOC_SETFLAGS. Those test cases are skipped without them.
> >
> > tmpfs quotas are not tested, since the test runs as root, which is not
> > subject to quota limits.
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
> >  tools/testing/selftests/liveupdate/Makefile   |    1 +
> >  tools/testing/selftests/liveupdate/config     |    4 +
> >  .../testing/selftests/liveupdate/luo_tmpfs.c  | 2055 +++++++++++++++++
> 
> Umm, no way I am reading all this...
> 
> LLMs are great at generating tests, and I'm not saying there is no value
> in this. It is just that this massive code dump is unreviewable by
> humans. It is also unfair to the human reviewer because it took many
> orders of magnitude less effort to _write_ them with an LLM.
> 
> What do you all reckon we should do about this? Trust the LLM to get the
> testing right? Do we give up human maintenance of tests entirely? Do we
> do fault injection to test the tests themselves?
> 
> Or do we make the tests smaller and more human reviewable?

We need good test coverage, but I believe we can break this patch down 
into smaller changes where tested features are incrementally added.

> 
> >  .../selftests/liveupdate/run-vmtests.sh       |    1 +
> >  4 files changed, 2061 insertions(+)
> >  create mode 100644 tools/testing/selftests/liveupdate/luo_tmpfs.c
> >
> [...]
> 
> -- 
> Regards,
> Pratyush Yadav

-- 
Pasha
