Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383572;
	b=5D6TOkBVtTD+OL5gCFm9/LZ0G5iQh+oUkn0fFdTG5n0ntvn3x2WcLWGulQyZepn4g1nB
	 PTX64i9MXXmQI2AtYfSdJf8IGleKXFFGj5aHXdv4putj1UTnHLJGDnIx4s4ajWk599gkH
	 vdJ5HuyJScKOVMMuggdtj1OM4pF/HnYV5LijLq5EVPlxnf64XuGkzC/UZTq5O93VMlv7o
	 fSHpNowNS6AytpsC81+8imYrWb2u2D7h1Qo/jbW89aNioh9yDyfrnHDeYfW1YpREaf0gU
	 TfkajV7wRkrAEsPCwCIojMeUZL7myBYbTntIZCAJJVhIJZJMDjFAgIYGKLEkbC/5foQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=59sgXJgrAjzlF6lUUIt9hHd7ZlSVCeSH79v3f3zBjaU=;
	b=WNqGrQJ/TEXiyuu6oX37qJ4iWvnxlU7Cw6ul4xdT7nXXhAAamYcZE24B+l2mldowEqRS
	 ofe/1BiP1qCViXhZLcYzyEFbZueIA6y401qj/otKDPPUHbShqqxe1zgXbnI+QeFP6iOnF
	 kkOCcNbwMFjMhG7Af6Ztws7qntiVxSHAl+hQnB7Igsi0g0gkIWue/ThtsT6wJ6f/C1bkK
	 T5oXBe8vY9514EYI/lDNfXT3OdkdgACbTkeSy1QL2s0dGpb9ebYmj8Ryr2xWJ2AWfbBok
	 x751MGpW902ObA541hsXYO3Yd0AIJVfr6uWdaOrXVMVAPEbYCXSb/0Aga9VavPb4z+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=rg0AnoZk;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58999606A324
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 07:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58999606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=rg0AnoZk
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso17688835ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 23:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383571; x=1794988371; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59sgXJgrAjzlF6lUUIt9hHd7ZlSVCeSH79v3f3zBjaU=;
        b=rg0AnoZkPwtV1r39FwY0fYtx+B96qCAj4XVMip88C/9myzm80RBPFU2IAquryZOpEw
         HdyksEXUIKYlStPIHQFe+XswkRSfDVjCV+PuDM5mPVvVsB5Zhzq12JVethAv4uT7qDLh
         gLXECA+eszlPSiHp3RlqZOoUtxhu/9gEEG7ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383571; x=1794988371;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=59sgXJgrAjzlF6lUUIt9hHd7ZlSVCeSH79v3f3zBjaU=;
        b=RFkoIsEkPdestAAAQJYDcdyLAIZVSLYVTRNUm2KBh7+XewmVityDYYNSjJn4Y3iJKW
         lT5lZCce9TXgFbyFJoDn9OYUW0lrBO/aX4HhsMPEncFOoGmN/dMJAKKUrj2BhwfuY/x1
         vsO2RFmi7ExpcBBLCiAfJck33jbWKt905IX97nxiEdz1SZgWpJZNwm2jC+FFanQ+7ISt
         j0FukhjfKr0z12LKIslbdImqx7mxADvoeHYVDMnxSRiQwmq0ty0f6Q4z31X5MtfuF8Bt
         zw9uBp/5btiEC2LsG24Jf3z8kbb0kGdLrTl0T/PtVYlJWtNrcsdla00Vm+CYJBXGkMtZ
         X9sA==
X-Forwarded-Encrypted: i=1; AL+hErF0xc6c7w9aBHpyZaYc1bya6vMgRVxGTBB97pP4C7KGaBDMB3ZMOlblqr0CND4VXgF4+4EQmW4RjEQu9PJpP6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xvYwl98/QzKAk9+0t3NrDqFJeWx1+44O20DO9fXARe1/P79Ip
	BCdQmFRqbU5lf46pZVWvwuqcPscMjtiBw9F1HQOmAwl6bJgj4s/BdvagBZ6kJPV/uCA=
X-Gm-Gg: AYBFou1O+jhlfLHDa0IFi0gm4XaQV43rAszNKkvSmT6yiTw4dNgiZwkKgkr6qZPq056
	Cn5Xbf+ht8DCsS8PQ86G/achu47Lq+BIcaXr98qB7QNgfhb9a+4906seNSfeiF7IPSgaCcTIk25
	2kbIowdLuIDy+Fcy0le1hduSzdLHjy1gpsJ5+j18QTOaaeDGV/D+AvAQpJ6FZsul9eFqyuPZwip
	zP/z9GYxUtTlRVSRrnkjT+KBOTDJGNkE2LJqnjBLG2wNYWNgGCwhGbdCSbQnegkrIGrUrwllqre
	Nyi6GhEMINcyQGMxQwoDN60qssLvML+cjYM3D1BFo83gblwE9hSZMDHtBB6vbJJzh5f97xuF7Xq
	qn6W/7IwNf3DQefx1kok7Z0fmos5wsjRdAgeQVpNERTAOfFIQ22KKh3yk9FPjgIFaUe8gJpE8Rl
	kFnQ42TGHGir6AURX72G8sM3CT4pmMJDezDZR4HC5366RibfB9YkjOedFuArP1DXE6mvBdsHrBy
	MdiI6Y6aKAbasDZL9/I6zs/PrBpzg3Ga/1KKvVsWZhjyAxRooFPbQ3VjVM3CUifrEYG12qMod93
	sjzlL2Te0TUNiKDkOYuAPmRRqoP0vY+9k2Eyk0T8CVpAMuNRix8clYrQ5pWmDHRyoKWoPaPjpGX
	HOCki2XVsJmP4tzZTrhUgrc6Ps6pxMXdDQ/jtKl48jeXXjIYhMEWbXaqz7TRJTlsn/ZkrFUpKJE
	BLomZvjX2MI04Eq39WVXvc5IY98ap1ICIVXycn2Unku0qOaoj0gDzV
X-Received: by 2002:a17:902:ce83:b0:2ed:205e:eac3 with SMTP id d9443c01a7336-2edd7673ee3mr20690885ad.12.1794383570630;
        Tue, 10 Nov 2026 23:52:50 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm17541865ad.71.2026.11.10.23.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:50 -0800 (PST)
Date: Tue, 10 Nov 2026 23:52:46 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 0/9] kho, liveupdate: KHO/LUO observability
Message-ID: <cover.1794383544.git.chris@chrisdown.name>
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

At Meta, we are moving towards using live update on hypervisors whose
VMs can't be migrated away first. We also want to preserve service fd
stores across systemctl kexec.

Our kernel rollout is driven by health checks from each host. For
example, an increase in rejected handovers or retrieval failures may be
a reason to stop a rollout, and the bootmem size and sequence number
help us understand what is happening on which hosts. The series exposes:

- how much memory KHO set aside
- whether the new kernel accepted the incoming handover
- whether LUO could give back the state that userspace handed over

We expose these in sysfs so the collector can read them without opening
/dev/liveupdate, which starts deserialisation, or depending on debugfs
or the kernel log.

I also noticed that the incoming kexec metadata page stays reserved
after boot, so free it once its contents have been copied.

Chris Down (9):
  kho: Reclaim the metadata page left reserved after kexec
  kho: Make bootmem reservations visible to fleet monitoring
  liveupdate: Make failed retrieves distinguishable from dropped files
  selftests/liveupdate: Catch incorrect file accounting across kexec
  selftests/kho: Catch missing or zero bootmem reports before kexec
  kho: Expose rejected handovers that look like cold boots
  kho: Report how much handover memory is preserved and restored
  liveupdate: Expose the sequence number for consecutive live updates
  selftests/liveupdate: Check handover revival, sequence and memory
    stats

 .../ABI/testing/sysfs-class-misc-liveupdate   |  56 ++++
 .../ABI/testing/sysfs-kernel-kexec-kdump      |  30 ++
 Documentation/admin-guide/mm/kho.rst          |  19 +-
 Documentation/userspace-api/liveupdate.rst    |   8 +
 MAINTAINERS                                   |   1 +
 include/linux/kexec_handover.h                |   3 +
 kernel/kexec_core.c                           |  26 +-
 kernel/liveupdate/kexec_handover.c            |  82 +++++-
 kernel/liveupdate/luo_core.c                  |  58 ++++
 kernel/liveupdate/luo_file.c                  |  16 +-
 kernel/liveupdate/luo_internal.h              |  34 +++
 kernel/liveupdate/luo_session.c               |   6 +
 tools/testing/selftests/kho/init.c            |  24 ++
 tools/testing/selftests/kho/vmtest.sh         |   1 +
 tools/testing/selftests/liveupdate/Makefile   |   1 +
 tools/testing/selftests/liveupdate/init.c     |   5 +
 .../selftests/liveupdate/luo_handover_stats.c | 258 ++++++++++++++++++
 .../selftests/liveupdate/run-vmtests.sh       |   1 +
 tools/testing/selftests/liveupdate/vmtest.sh  |   2 +
 19 files changed, 624 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-misc-liveupdate
 create mode 100644 tools/testing/selftests/liveupdate/luo_handover_stats.c


base-commit: a0dc8eddbfdb6dd9c5c2b70eb66ab49cb1978425
-- 
2.54.0

