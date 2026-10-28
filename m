Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793161821;
	b=va8jr9oQOdq2MQFu/4o/IbtmO9fSHVpHFM+vFBGTanZK9CysbyASEGO75OjZNcnilwaM
	 xiKD5OcMR/aADcNjJsBnRWfsyGhkoNzCUYkUwFmA6bWRf5P9YeG9J1Dxv1LQ40qjYO01i
	 F6OkoXdRaWk+e4kV6wySJS+ApN5lSLCRsoJJroNZgxLQQps5fzGmEAw6eLH/a0iI1ETKo
	 OtbAMNeccxG910sb2OSdXDTejBkEs/U69eMpl83UL/R/UtIdtG3jelmEKiPcKFhVBUgB6
	 GWENUTLa4C22Db/yiyJsMCTvRsK42/T3YZm/onLqbyhHwL6xVlt/JLDxARN/GNhdoZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793161821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:MIME-Version:X-Received:
	 In-Reply-To:References:Message-ID:Date:Subject:From:To:Cc:
	 Content-Type;
	bh=kPQx6GgboXmcUMcY5/lzKrJ0ssCkME3FTMDmy2U7T6k=;
	b=keqnA7VG3fkCzHbamGKNaYqm3Spcp/DIt4gSAKOevZA2KUHOE9GMbVN7jiL1DrmcqDv5
	 cCAfVEgP2zTHL41ANoAyh3WHnH0N+Pe1G5dQ5qUV5eWPPW9JnDvmwByhE56abvQRCLHdk
	 G00bFavAUT36a4gQp86rximPTesxg/wc8PKm6G6a8bLJLdBFHE/bordpHcyAqUXX1Tzmi
	 OF9RpkTj6l6EzKvOMkUoKn2awJplMmRUVhyRpaKPHHbxW1QBIEA5D9b5ssJ+xSGurPHAc
	 n1SMZ9tFuuLQhlKm1eyj/LCoMqZYptkimKUD51mSpjXF186Pm9/CXDPCNyLvbaxR04A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jeffxu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PCQLkeFq;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67334606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 04:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67334606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jeffxu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PCQLkeFq
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso940790eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 21:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793161820; x=1793766620; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kPQx6GgboXmcUMcY5/lzKrJ0ssCkME3FTMDmy2U7T6k=;
        b=PCQLkeFqYzzEc1UNxxO2SwDWNuvwXCTIhjbkdQznKqU2g4DjFA/FXyxGRex5YcdsnA
         Xgf5iy01BQ8rOnqrN6NVQPlizUrqHh2RZ6ivs+Oyj1MA9ZP9SL6SV4smhPoQSISGLof3
         bfkA1nptW6pC7C2owKdZR1L+bpDE/sb4uN3KYnQm7kyN18GNyXQlDYxEK1+9gaL4vYUd
         pnpf58X96pUnGR5kaD/ulKDbAv6Bam86N4YfddjhLeLkpwI9XD/lIKOBIC8VmpxhlctP
         WGbuwl9Y9WOJy3woSOwZZW3I37lEy/0CEbwuA8XqraBjnRplspQ8Og0S/bGriiZtuOI9
         k43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161820; x=1793766620;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPQx6GgboXmcUMcY5/lzKrJ0ssCkME3FTMDmy2U7T6k=;
        b=twpT8vwYPjzvwhgKcRvNfCqcPaL3fPxSOAmuJynXjv108Tbnd+zFMRqDmo67M9RAZC
         OskBSeN6IDfPv1a/OACS6lmHOm37D87FwiRzliAzr2+TwjN/DriGC8cs6igT/ilSEIya
         sMVB4+ZSmASFY1TkiErcLaeGZS99wZbWjQbcgGvzVmIHX315marhMwFocVdcVARU57WQ
         TP0/zBt6rtS/sBoz7QNHX/4HiY5VS4KPRzJiVThhBQATu0aq9yMhfMBe2QAdL4p9rYtb
         94qB1TdVyOXv/4cq0UeLxG/lTVo0qgfsvwHjcWzc2xRkSsY5Bxoe634Iq4gr+iSUHx4X
         qbvw==
X-Forwarded-Encrypted: i=1; AKwUvBxmHeJwHOMGYYvPv8k4gB7xbv2N1Td1lggB/izAXCsE44Eajk+qj5OzZ3A8MDbNLISLmITSZju93N9PyW6WS7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRNX85UcZogSzgvd9N3q2gGfuNwLx1AFMu44ydrjBVeSU3TiiJ
	kYxKh3Hfqi5tNAxZiT93v6kGmSEYW3xRwSd3agEt/CWpl3fw6Ar6NF1KhW5XmG4OlwIBurQojt5
	ON7kspA==
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: from dyaz12-n2.prod.google.com ([2002:a05:693c:638c:20b0:369:fbca:f640])
 (user=jeffxu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:250d:b0:369:f5f6:36a7
 with SMTP id 5a478bee46e88-36a2014b887mr2079336eec.16.1793161819981; Tue, 27
 Oct 2026 21:30:19 -0700 (PDT)
In-Reply-To: <auDTptDQsB4xBcz7@gremlin>
References: <cover.1793094611.git.chris@chrisdown.name> <5bd3c89d733ad22224f296dfa8900769de937de0.1793094611.git.chris@chrisdown.name>
 <auCxjbvY3qPv1sV6@gremlin> <auDTMb6WMFUpxeZy@chrisdown.name> <auDTptDQsB4xBcz7@gremlin>
Message-ID: <18e2972cb8520c2e.3137322e32382e342e3434.279dd1.0000sendgmr@google.com>
Date: Wed, 28 Oct 2026 04:30:20 +0000
Subject: Re: [PATCH 1/3] mseal sysmap: Add mseal_system_mappings= boot parameter
From: Jeff Xu <jeffxu@google.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>, Jeff Xu <jeffxu@chromium.org>, 
	Jeff Xu <jeffxu@google.com>, Andrey Vagin <avagin@gmail.com>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-hardening@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Hi Chris, Lorenzo,

On Tue, Oct 27, 2026 at 04:57:04PM +0000, Lorenzo Stoakes (ARM) wrote:
> > One option is to skip if [vdso] isn't sealed, and otherwise expect
> > all system mappings to be sealed. Then there's parsing at all, and it
> > also stops failing on kernels built without
> > CONFIG_MSEAL_SYSTEM_MAPPINGS, which matters more once it's in
> > run_vmtests.sh. The downside is that it can't notice sealing being
> > broken entirely.
> >
> > Another is to check /proc/cmdline for no_mseal_sys_mappings and
> > expect the mappings to be unsealed if it's there. That's only a few
> > lines now, but the test still fails on kernels without the option, as
> > it does today.
> >
> > Do you have a preference between the two?

> Yeah it's awkward, really moving the tests to mm we'd have to skip them
> if the vdso isn't sealed, then assume a sealed vdso for a new process =
> feature enabled.

> I guess at that point it's redundant to check if disabled?

Thanks for working on this series!

Could we please keep the test coverage for the unsealed [vdso] case and
avoid unconditionally skipping whenever [vdso] is unsealed?

There are two regressions I'd love for us to still be able to catch:

1. Kernel or config regressions when sealing is expected to be on:
    Distros/platforms such as ChromeOS and Android enable
    CONFIG_MSEAL_SYSTEM_MAPPINGS=y. Originally this test lived in its own
    selftest directory with `CONFIG_MSEAL_SYSTEM_MAPPINGS=y` in its
    `config` fragment specifically so that if a kernel change accidentally
    broke system mapping sealing completely, [vdso] being unsealed would
    trigger a hard FAIL rather than silently turning into a SKIP in CI
    (whereas `run_vmtests.sh` runs on kernels with
    `MSEAL_SYSTEM_MAPPINGS=n`).

2. Regressions in the new `no_mseal_sys_mappings` boot parameter itself:
    When booted with `no_mseal_sys_mappings` (or when unsealed), running
    the assertions in Patch 3 (verifying system mappings have no `sl` flag
    and that `munmap()` / `mremap()` -- and ideally `mprotect(PROT_READ |
    PROT_WRITE)` -- on [vdso] succeed) directly verifies that the boot
    parameter works and doesn't regress.

If we move the test into `tools/testing/selftests/mm/`, perhaps we could:
- Check `/proc/cmdline` for `no_mseal_sys_mappings` and actively test the
   unsealed behavior when it is set (rather than skipping), and
- Either enable `CONFIG_MSEAL_SYSTEM_MAPPINGS=y` in `selftests/mm/config`,
   or keep strict failure as an option (e.g. `./sysmap_is_sealed` fails if
   unsealed without the boot param, while `run_vmtests.sh` passes a flag
   like `--allow-disabled` when `CONFIG_MSEAL_SYSTEM_MAPPINGS` may not be
   enabled), so CI environments that expect sealing still catch a broken
   seal.

Thanks,
Jeff
