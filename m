Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101378;
	b=wEOv1AlwVykBigtQlBB2GKNhtVvg44i35FhLCmb3hZrjD3a3grlOIJxQWwOoUa5OjA8d
	 kIvCPJFsy+CZPw27IqOP9o9MMPUmC+ugAzgUuByrPLycyJFn2UqxVeSADKxF83uHt1NDd
	 910kKNLfNtupBO3ZERjY+jmNoeNUhefRZrwt/C3ZizZoB/ngcQIZ8S/P5TLqmBFbDuC3Z
	 QaNWf1oHCJZEXV7C1EDGwzoBVV9pTSFbWFLfpRfdSVC10N5P1r/eu1GMPGvabv5R5JEvo
	 +tPI3gzCyIP4q8M6u87Tok6+oXsVUBaPRSod6VDZG2PIlsLkdUzKBI9moiUSgoW19YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=IFKYyZe98olIOt/z7FVjqJN0LXwahHsaIWrhXMheXUY=;
	b=Lds0cv4xwsnpuypRbMteydZq40D55KcRuatstSuYaymLM9UQRek3uJHBFAU28dH79RO4
	 r1Ob725qVl4BJQto3ZY34IYhyHNcFgJN+/9uCUG+pYd5uHIQVYUlnplPdJ3m1KMgxnoM9
	 3cH9KZv+7Jqw/8Xjdmqftz7K8reuF8+RhwSunL9r5PCk8jLRjDwvPvJG6ryvqI/SMq4Jq
	 OAoctNdNlo3Yk6r64TiEtMPmMsRSJjfmjqFEun4FC/bcuumo5ScJqkS/wuD1SopKEaca/
	 iIfvJ/bsZ55y3xU7SsBm7b2gwl4kHa9IH+6kCXUROIDupLgvqTzzkLGbbRFiEAyOZrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ELiSdUOH;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9DE606A328
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 11:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB9DE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ELiSdUOH
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab98332238so2263597a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 04:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793101377; x=1793706177; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IFKYyZe98olIOt/z7FVjqJN0LXwahHsaIWrhXMheXUY=;
        b=ELiSdUOH/cIJPyFJHbgZeLUlxA1ZsPoFOAPtjqLzx/rzQ9JO7MiO1l1EylHRSz9ezg
         ictUVQ2uhhQ2pYHxEdBrFH5HIDKQqTiAHMzqlnq5QD5CgC6J+EP2q6pJpZRC73jUwRhD
         ylqMz+7fKAuQWhpAwt6wJQNE9JgQDJ+tXRAss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101377; x=1793706177;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IFKYyZe98olIOt/z7FVjqJN0LXwahHsaIWrhXMheXUY=;
        b=HoKsntCzHpW5Pct4ZrUMZfRY7iQ9WrcRmZZLc0+2MxC7dZI8+LX7WbxB/BxtBLlATc
         vix9kkfOH/pwTy41ZRhP63/431lPNfdR3wmwO17Ruqp0ILBISmm869vbuJfZPRo54kYs
         CWDcX/Xt3UanZxNZH1b1wVZNgZ+QbGhU0mBB4uvaYQqEJ+2b6Jw76KfhfPgCWy+eznKB
         +NzWRSC5jXdlITfXA+8H4xERtr62SqRC9E3rYrVgz/Yk8dCBvuUcs9dvwasfNVfZHyW0
         jjncf/D7jeeGUu37qEoXwqLNHQe6IpttCnnK1noBrtSyTEdqvbfQfUQO8hDUFkUmMojx
         xuHA==
X-Forwarded-Encrypted: i=1; AKwUvBxDNZNkCf3EI+xdbdhmlRaHUerQYCpurePTq+ytdA6O9q5x22iBeUkkvT0UvwMszz4ZH14RHCnqpr/5lBVYuSM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKl8uEnpDYQz43JQPMkBon8JBdPEL3x75u7XSoXLDEqV5Rpi0GX
	Lc7B6RSaOS9nHUTkPjihISV4EIHvh4Iee75E4LU12GHDOPgSSG9+04Kx5VKkLSJjHvc=
X-Gm-Gg: AYBFou3Ikxz7ovW6ZYi4jDRdeVXk2z2Jz4mq2L4BkXEOulW+ClWZxDYP0ErYdofXxoM
	CwGxHHkm3aIdTuxGgT2v0pW9qcAmkjyKUJ0OJwCX43cgaGqKaKzpY/BHh+IZc/FIBSOOc6IwEmS
	WS1Qhv30nWaDT3oqtH00UxSclMwNyeycjz9fuVALGXpZfZZ9qs9ZJ/9W0QzFleVJKHCztTUwDlt
	EJoTIQWyBS2CxunbwuvcPkotrpdxRpDpZkuTahGRaEUE+E8GyzDH5WSy8eOiKf1ACy8OKdzcd80
	4kSIfvVha7luf5iUrE8FqBPZPMHfhosNVQNhJhJXAu873Hm76EzN78c7+WOt/lIiSal/h+h6dg3
	RNok+Q7EzlH44A2srn8u7kttDcoLEfuDMu6x5iWj5QK+CtZXN6537TVl+hiSpoQ/VutXxJMMJCD
	4SdG1TLiF7/YRE2086W4fWn1bE8Rg8xiJaHRBw2joY2hIBq6Br4t43VdVvkc2f4ODi4Iw2Qgi7Z
	9kzEP77rAdOw18K1s4EnOYsDNJsiM9HIsZX/HW6klbY4CJpSgqI8tqN5ouEruHKu363XVy8oBLB
	CojOVOJU3o3RlbhR+TaUyHVJs78FsMKCIeX+dQ3Lg2a5VnBIswAnhDE5ZLIsO60S0KvSm+1WYlc
	4Zb3LhBzJXVXu/Gg5qLhFhRMiQNTZlEUCYTyLDrliIgudGJPsETdhRGDf3beRDmwZRL4h20Wx
X-Received: by 2002:a17:90a:d888:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3adeae7309cmr8343178a91.25.1793101377141;
        Tue, 27 Oct 2026 04:42:57 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404426c2sm3637757a91.7.2026.10.27.04.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:42:56 -0700 (PDT)
Date: Tue, 27 Oct 2026 19:42:54 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 0/3] mseal sysmap: Choose system mapping sealing at boot
Message-ID: <cover.1793094611.git.chris@chrisdown.name>
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
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

System mapping sealing is currently a build time choice. Hosts which
want it and hosts which need to move or unmap these mappings therefore
need separate kernels, which is not ideal. Let's allow the administrator
to choose at boot time.

Chris Down (3):
  mseal sysmap: Add mseal_system_mappings= boot parameter
  mseal sysmap: Allow with CHECKPOINT_RESTORE, default off
  selftests/mseal_system_mappings: Test vdso unmap and remap

 .../admin-guide/kernel-parameters.txt         |   7 +
 Documentation/userspace-api/mseal.rst         |   5 +-
 include/linux/mm.h                            |   3 +-
 mm/mseal.c                                    |  13 +
 security/Kconfig                              |  17 +-
 .../selftests/mseal_system_mappings/Makefile  |   2 +
 .../selftests/mseal_system_mappings/config    |   2 +
 .../mseal_system_mappings/sysmap_is_sealed.c  | 236 ++++++++++++++++--
 8 files changed, 268 insertions(+), 17 deletions(-)


base-commit: bae9a042b03b27924c6fd5bdc00a20d6a44d6041
-- 
2.54.0

