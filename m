Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059952;
	b=DZ9y58RMajVw9uIsdGRLxk+BQZGDo4/vWn9JDfzBg+LpW4jFI/fgryscYKKiDlSZsIaa
	 m6ouNkEtCLH/D9Pp5kCLS5wP5lnWoS+H2ytkS0b1StNt0TxlmtD/W4RGhDig83v92ZeL7
	 wE8V1NDLfaiLcRp7ECcbrULB+aBbC8Mnz5tMUJlBD3hBAX/DY0p7q2LDMZHCGQWPHGYnD
	 YQLz+jbz1gzMCSUInNPpajHgykcs3Qpn3JtfBa5bPMgP6qDYFRqNXIZXSnivzGjRrRPQU
	 lwhYG8pa97QvqOxCZK9YC+UoE+nV+pbw1UIO9lQkZTjcOzoIfAwn24LsRU1Kdg7oVYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=8qLgOCLTulYn1+d3HKH9PJ+ODujlzAUfUScnoc6M1Q4=;
	b=UA9iHbQJljSW17ECZVDcpiBdSPqP3ABcFssLOPD7PQgHMvfctcB2hhdfNHobtt3TPVmC
	 JIYgAmgNf6E7+tUyceFesu5qr56Wi17nomPTcIvBYZtezqLvyQUlsCZUaThOsBibtJWmb
	 R/DxpCEH5gs4u5LeeiQ4qpSMQazs/xM5JrzFvqJd/B6B8vr3vVXnobYK1CtDcKBcczvPi
	 S7daYpQSd6DuEVG28znur7bsA3Tee0RIgXSCudrsByJke+GxfPquwkqGD6UTtrUSSupTe
	 JnQ2nMmaNG/TaoNWMi4RuRJ842HaeNYH9xtA1HyWMkPsU2N6k+HmY5qpDm6BUaNK/pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cbOzaWcX;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4509060A2606
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 03:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4509060A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cbOzaWcX
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso873962b3a.3
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 19:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059951; x=1795664751; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8qLgOCLTulYn1+d3HKH9PJ+ODujlzAUfUScnoc6M1Q4=;
        b=cbOzaWcXbcVheE/8dJiWdbmV7ND1PTau00PwNAkfFFOgzBe0y3gTkUsXRdkoVIeOHO
         VrcxSXC5ebaT4qrKtimClxvPuslbSxyhKy9GASjTFGTFu2dcelOi9xyVsdBxAc/hzED5
         oRhUxwnUbIIzsswiB/TLHTAPyWXMvfL73E0GTCffu3VCxY9XbaDiaVpf2YbrHmH7mU+y
         gu8nfT1P4y4gqTAUKJYFBhyh+rnujd43p134tcyfWD+xBMAY7N8eXQofxNUtsVcE0Ev6
         fWN/ptHi/ZQ5Zgeq9h2Uk73ZFPdC1iZ4gXD+RZQh8QAxb8WNd/rV60t3Gpci0oklxgKB
         ivZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059951; x=1795664751;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qLgOCLTulYn1+d3HKH9PJ+ODujlzAUfUScnoc6M1Q4=;
        b=px6/PXgShXTfWJV4natFedXtP5lzlnlh+9/uhhZIzfY0AB92kWN4FqdNrOvQXTYVxw
         Li3dfkKr3rdxYg27oppPQq8SDAAP8xHK5QL6XKYJgUMZ5WSs8qXhGQdlsPmI9j8AoKrb
         gW14Xj1hYH/sLbF1keyyfp3OOGfJxQ2u/UppdHeS9MvKmdGn7CBpdPdA3Snk77OGIHfq
         wzMkdtlRAlaKCxOjLZdywN8I36oIWKRGnCNAs0bmILF6qdBjBLtpT7mVhdpR3c1GdvQx
         +8RwlcxFqUHWEJQ3Eu8W5pFJbaLz9zg7Ys7O7kgeYVjupxv3ica5wIjsKOFsTKdWltQv
         25+w==
X-Forwarded-Encrypted: i=1; AL+hErG+vRpopfMmpPL9d68xBOTsk09yby0LpQ1njiG4Hy3jEqPw2QU86S5WE0mR5Q0KTIBIowE4hZbvb+rYJg5Mu1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WNK+yBq8keN9wkoyUw33XSy5DJdcbNXbuUEeMU+DTQhtAu3Pb
	WXmOgeP7NZv7jqV3rKDWYgpfJ3Ywz5Ag2lyAUyT6dDvKuQ9N12td1LsH
X-Gm-Gg: AYBFou3he7MiD93iGOoqq7Qf+Ep7aW/RcrSv9oWVOtI3TUx7nsad9hl+2HBwp83oA/h
	Qia5UsUZvJETQYZRUDIOqovqT9hir5Ne68S8sBmi5jw1Mcm1eNGebPZ8HS8BcrO8uX73bWRDw2B
	LYdqcQAhBmoGv3YdDagEcXYFZx0UHNwHsB7g6af8aEgIcG2T6sd97hno5dDCHi8xc+e/gDwvaBL
	I2ckhlulONKe8GQOBWvwZfHm1RJm/+dyF4FE5q0aqeKhi+SngVd7ysfPVu3MfUuDAkFbfgZkY2Z
	ZZsP6Q1y97ztcIB8otHnGhW9jQa1y9MbsuevTaw1ewEhyWV+w+paz2cE8QqJRNZcSioymlFO52s
	GhDZNqXcS6A3w1dJOXrA13oaXyBsGYLOfx0nZ3SZ1yBaczHnfC1FCdr2UPSgr7WXjsjnK8gymC6
	F7sxxLrgg8GK8OXVfjMhg5qGDnHrcPuO3XFNZQ44AGS/Jii9Do+NnhyipojD1dwQ5NrmeZctg4b
	7SyL2wpKlVqtKelqWWBm4lO6EWRqiGrbMbCTD/a+riVFRkJOtTvCelM3AZHQ8wNfwasBz15ZTjL
	x5d+gSqSFb4VJ51sk5z1WXo4EYKwAzvAVgUIWO13kYzN6TQVFIPkHdHBWL4hW/8+riFStOJCCx2
	jDkiVOH7+0uiEFT0pf9pXkE7lqTd4v+qqYzwR
X-Received: by 2002:a05:6a21:2d43:b0:3eb:99a9:d3a8 with SMTP id adf61e73a8af0-3fe8b6e4faamr4692271637.64.1795059951330;
        Wed, 18 Nov 2026 19:45:51 -0800 (PST)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm2028068b3a.20.2026.11.18.19.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 19:45:50 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 03:45:50 +0000
Message-Id: <DMYVN8WPV380.3ID1QHDI7BKUS@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Barry Song" <baohua@kernel.org>, "Shuah Khan"
 <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2] selftests/bpf: Fall back when
 memcg_proactive_reclaim data lands in shmem
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Hui Zhu" <hui.zhu@linux.dev>, "Kurt Lin" <lylin1023@gmail.com>, "Hui
 Zhu" <zhuhui@kylinos.cn>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 <bpf@vger.kernel.org>
In-Reply-To: <79797479-029f-4e9b-8076-6a92a2a70cdd@linux.dev>
References: <20261117170704.1146730-1-lylin1023@gmail.com> <DMY136RTAL9Q.2WQSZ57W1YLV2@gmail.com> <79797479-029f-4e9b-8076-6a92a2a70cdd@linux.dev>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 18, 2026 at 07:04 PM Hui Zhu <hui.zhu@linux.dev> wrote:
> What about two things: only check when the test fails, and check
> KPF_SWAPBACKED instead of f_type?

It's still overkill. 50 lines instead of one more compare per test.
It doesn't cover arena_memcg. The failure there is a dead child,
and its O_TMPFILE is gone.

> 1. Check only when the test fails.
> What the test needs is "these pages are reclaimable", not "these pages
> are not shmem": with swap available shmem reclaims fine, and then
> reclaimed == 0 is a real regression that must not be skipped. So probe on
> the failure path only -- nothing is paid when the test passes, there is
> no polling, and a regression cannot be masked.

It can. Kurt's guest has no swap, and /tmp is overlayfs over tmpfs.
Make bpf_proactive_reclaim() return 0 there:

  skel->bss->reclaimed      0
  si.totalswap              0
  file_is_shmem(data_fd)    1    -> test__skip()

With the f_type check workload_dir() moves on to "." and the test
fails as it should.

Swap alone is not enough either. The prog passes swappiness -1.
With vm.swappiness == 0 get_scan_count() doesn't scan shmem:

	if (cgroup_reclaim(sc) && !swappiness) {
		scan_balance = SCAN_FILE;

So reclaimed == 0 with swap on is not always a regression.

> 2. Probe with KPF_SWAPBACKED.
> f_type is a blacklist, so the next stacking filesystem repeats this.
> shmem-ness is a property of the pages rather than of the mount, so ask
> the pages: /proc/self/pagemap for VA -> PFN, /proc/kpageflags for
> PFN -> flags, then test bit 14.

Bit 14 doesn't replace f_type. ramfs pages are unevictable and not
swapbacked. file_is_shmem() returns 0 and the test fails.
Let's deal with the next stacking fs when somebody hits it.
