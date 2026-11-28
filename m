Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795890454;
	b=bYQNEyVu0c3Z4pfnHiHAdPAplBp3bdYWzhrOAc5IcJ9LfRJGoN22EujVtv2MAjZqS2WS
	 cfU6pAEYKE0V07E33C9kYka45m3atWnmVxz5OeuHciNhnWL2QknKOhHpZLLpnzTrUInlu
	 26NmE9/3U0FvhoTZj1jsLNuyxSEthAwjWXs0YVBgGS0MUyET3pEFgDjRM9WIj2/zAWzNL
	 B0wPICmaMb9XduZH0/t4T3ovFcsOLblfrQDCiJaNyp7Duh0Bcr845VlR+q87Nxw/SwHHS
	 /gZdWd+Anh0Np5W/2bwUeH0cfKkKKsWYcuYb5s/ZWllRJa3J04Y73NaVin9E9Te7kWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795890454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:Subject:To:Cc:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=tWonGarP/JSpfYSCREzqgbxCwkI6wgnwB8spvNKTl70=;
	b=VdFnJUNu7tr1lCV76qFODHl3PBi0bs/MoqxU5H6jCGkS0XogzutP+h/kSYPSi0fWZ5Cg
	 P7HD0y5B9sQU0akU8Dikvq4rHbvJTNjeubiFJD2pZeGBtrT6PjqvDdG3WuOKsChoPQWPm
	 RZAlq2Z1bmMYaOTMcA14wWy3isEIqQ1gWoHn2SORHEJHJMvkp3p5bnQ3pQP63GSXAlWaV
	 VpvU0HB7QMQ1QvQHH0mxp43f5UkeZv6Kn1rHvdd5TUyNTKSxcbharKAxKKRg747zH3H2e
	 AMEO29mq0Vu36BKR6osBNpdi0Sql4gf1DO/QZAah9yGsHXuZR3nuMuYVoXh+Zryelfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=R9Iqhrx1;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D500606A31C
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 18:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D500606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=R9Iqhrx1
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b4cd576f2aso65481437b3.0
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 10:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795890452; x=1796495252; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tWonGarP/JSpfYSCREzqgbxCwkI6wgnwB8spvNKTl70=;
        b=R9Iqhrx1BzU8RY4kUDg4dJfmPt8aDiqfDMf4yc9EFQHkVeugn7bh28sUOtfX4sxinY
         5OyLMnxH2x3MSfJ/a3GaruNo1kN6WnrZgVirM+F9aHAZvy6HJvBEoeSD+MqdrMnnQQ/z
         5TxCrva3sdrgewS5tuchNqwGmgeJlsxIuQMLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795890452; x=1796495252;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tWonGarP/JSpfYSCREzqgbxCwkI6wgnwB8spvNKTl70=;
        b=Q0sbLz7lfqdQWdMGG8/DSH7/kpqI04LZTqPOmBg9fwyIGGeTxW8VZYfqaXGFJc40v1
         aA+LpYdKKYPR3byf8yn8O0bKJZTkySsnaX0W3LVbWdyOeKIjUfdHyAmoTnpGRgtqn+eB
         R6i0VUF827z9bFrv0J1XQVD8GJXNoyLlt8uCsqZc0yX+w5HkdKo5QLLRpC9Vln1aRpEI
         7+G+6ds0FSyKwfZo+Qc2zm7hED4FDvjqXaQn1PZr+kXFJE+e5eDqzhAmt4cdoKKPME4W
         5LhEVvQSjPnR0flpQzD/H559N7WVk8r/LxU5pnag2dac9BpHQcXsxZjgQFmVl8ayNaBY
         1pYA==
X-Forwarded-Encrypted: i=1; AL+hErEzajTzp93mwPn02w1nj94G+y5QnI2UBJpSxl95lSrsgPZpx9tbfctRsSe8FFjscKnSPOCYyqpaAGV5In1/9qs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GCNxBJy3cPxgeECe+iduk24VA122RfqgTnj1tMGD2S+rre6X1
	arsuw3L4LsDO7GhApyZIXu773WtYNcS7SI5End1Kxf4WPeIIA+Nt9RBH1atCvZQySkk=
X-Gm-Gg: AZFdTZdN+pr3X5TuX0Yej6vMgMds+IxMaR9HLrQuzdCtWBGd+o4NwuruLb/Lz4Gg2N9
	bmTa+p4OIOhejU2N0afeqxc4YFfQLv/sTiF95J11RU8v1hba1t2Y6ddANPswM79z8erIstANFqH
	+A1emka1UX7LbIldTsXGagEJ744YOqEujBtQUeFMdvryk882xo7U2HkR4aso1lYSC8wvmC0pBiS
	36rWI6LPhxlNTVz7rmvAFOO3hCoS4S6/kbW6ZkkHlxW68cWfcmJPSqzNFpsxORVW3KBLW6f4KBb
	J89gryB05h9SKbcVPr1QD/MYI8JcIxQqUjZasL/Ok95Oh02wPqxcryNVTITbfPLlEiRWiA2Pau9
	01msjkeZ6kRYmcY/HRUsTgvtV6wM5yW3opp3DHQ+bHZnzAr4iZ49hyrXLB4UlI0PH/hTpgvZ9EX
	cPKU4Zj1ACfNr1aReaVClTpIrbAd10k5kCXn0k9PoK3FEOxbWqF8/9JYZShR8Smctvgxo003TkL
	rR/XZc+haKNg5FB0moEWZOxSKcgj0yzz0oMrqZ1EGqWJwV4IBuUB7PMy42plPMmZ6Tt/1iBy1gh
	WqqVXtdM8HKH+FVbbDkuML5OBSxJtoPqTxBrQxr6uKGfrIIXo8dPOncpTX+qKZN7Rd9Ocl9GvZv
	vRyxURQJ5xbPEQvoUW0qN5Qh8jZB0JQAbxfzSzI614+ApPBAAGFJVgs805hH1acAvLG1eMbWsBI
	Jb6qtJKu2JLAnsFAoKQtMSo4RHOesiTAEJFRT92fyxpDXO9L5BD754i2F/8mJGecR0ldrKywK4s
	6iHX81ge6290feJ5Q/OTqY=
X-Received: by 2002:a05:690c:e3f0:b0:8ab:48c5:cbce with SMTP id 00721157ae682-8b52049ff5bmr118121637b3.32.1795890452372;
        Sat, 28 Nov 2026 10:27:32 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b59a06f3e9sm14464277b3.25.2026.11.28.10.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 10:27:31 -0800 (PST)
Date: Sat, 28 Nov 2026 10:27:30 -0800
Message-ID: <cover.1795857773.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 0/7] kho, liveupdate: KHO/LUO observability
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
    Mike Rapoport <rppt@kernel.org>,
    Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>,
    Baoquan He <baoquan.he@linux.dev>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    kexec@lists.infradead.org,
    linux-mm@kvack.org,
    linux-kernel@vger.kernel.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    kernel-team@meta.com,
    Breno Leitao <leitao@debian.org>,
    sashiko-bot@kernel.org
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

At Meta, we are moving towards using live update on hypervisors whose
VMs can't be migrated away first. We also want to preserve service fd
stores across systemctl kexec.

Our kernel rollout is driven by health checks from each host. For
example, an increase in rejected handovers or retrieval failures may be
a reason to stop a rollout, and the sequence number helps us understand
what is happening on which hosts. The series exposes:

- whether the new kernel accepted the incoming handover
- how much of the preserved memory has been restored
- whether LUO could give back the state that userspace handed over

We expose these in sysfs so the collector can read them without opening
/dev/liveupdate, which starts deserialisation, or depending on debugfs
or the kernel log.

I also noticed that the incoming kexec metadata page stays reserved
after boot, so free it once its contents have been copied.

Pratyush's "kho: housekeeping" series
(https://lore.kernel.org/r/20261127122536.3708770-1-pratyush@kernel.org)
renames kexec_handover.c and kexec_handover_internal.h and changes
kernel/liveupdate/Makefile. This series changes the same three files, so
whichever lands second needs a rebase.

v2:

- Rebase onto the current liveupdate next
- Free the metadata page without reordering kho_init(), now that
  kho/in/sub_fdts is gone (Pasha)
- Drop the Fixes tag from the metadata page patch (Pasha)
- Drop the bootmem size patch and its selftest (Pratyush)
- Move the KHO files to /sys/kernel/kho/incoming/, set up by KHO in
  kho_sysfs.c, so kexec_core.c is no longer touched (Mike)
- Add tags from Breno and Pasha

v1: https://lore.kernel.org/r/cover.1794383544.git.chris@chrisdown.name

Chris Down (7):
  kho: Reclaim the metadata page left reserved after kexec
  liveupdate: Make failed retrieves distinguishable from dropped files
  selftests/liveupdate: Catch incorrect file accounting across kexec
  kho: Expose rejected handovers that look like cold boots
  kho: Report how much handover memory is preserved and restored
  liveupdate: Expose the sequence number for consecutive live updates
  selftests/liveupdate: Check handover revival, sequence and memory
    stats

 .../ABI/testing/sysfs-class-misc-liveupdate   |  56 ++++
 Documentation/ABI/testing/sysfs-kernel-kho    |  21 ++
 Documentation/admin-guide/mm/kho.rst          |  11 +
 Documentation/userspace-api/liveupdate.rst    |   8 +
 MAINTAINERS                                   |   3 +
 kernel/liveupdate/Makefile                    |   2 +-
 kernel/liveupdate/kexec_handover.c            |  26 ++
 kernel/liveupdate/kexec_handover_internal.h   |  10 +
 kernel/liveupdate/kho_sysfs.c                 |  70 +++++
 kernel/liveupdate/luo_core.c                  |  58 ++++
 kernel/liveupdate/luo_file.c                  |  16 +-
 kernel/liveupdate/luo_internal.h              |  34 +++
 kernel/liveupdate/luo_session.c               |   6 +
 tools/testing/selftests/liveupdate/Makefile   |   1 +
 tools/testing/selftests/liveupdate/init.c     |   5 +
 .../selftests/liveupdate/luo_handover_stats.c | 258 ++++++++++++++++++
 .../selftests/liveupdate/run-vmtests.sh       |   1 +
 tools/testing/selftests/liveupdate/vmtest.sh  |   2 +
 18 files changed, 585 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-misc-liveupdate
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-kho
 create mode 100644 kernel/liveupdate/kho_sysfs.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_handover_stats.c


base-commit: a8d435799f3c87231bca0c245fd9e60f31e45135
-- 
2.56.1

