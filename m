Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85934B8DEB
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780650071; cv=none; b=PmPT+VnZvA2oZDAqXtd1GWn4N08y23PxFAJR0kV0yotMtueOhb7bPDZQwDXiITHBkM9hB7yEcP4+CWk2AlyR0l0ypTzRI4518Gvyw1iwIdYvAoX7Sag4NcUlc2EMsMAofFmbnTX4+xSSyh72REon0QWjBaoa2bEaypOBeC+AIZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780650071; c=relaxed/simple;
	bh=o8BGdjq1Uu650RISG3GNTyGokpi2RqaLxlN7t9YSlPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NN5enxfRswr/xQx1fLBS4n6GC8pxTbd919XU44Z7VBViD5OYOfqajTOMoVScOBTBQxMIm27poZ9OMMoUSL8Uer5ejAdNmjnNDeNGZ365JK2vItowQ9J136PuTQctFwjkhBrBVGt1NoNGgRDrI+9A6u8P1rOF7lCUpHEYp9e6F2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbJqsznC; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbJqsznC"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so1179003a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 02:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780650069; x=1781254869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8BGdjq1Uu650RISG3GNTyGokpi2RqaLxlN7t9YSlPM=;
        b=BbJqsznC1aDzjzu8k2S8098KtddGlkbGsT15vcLJKsH7bL8JynyPIh87IHA9PSVa1h
         n2jmCcu8WIg7JuH55M610vIAgx6zszdRKUZrUMNnI8UGknhJTh8MJrlXDVoYsU6vxJc6
         Fvsv3uN4NxpZHOIqioqHLDZrbSvBcwbhkmL1CkKDsqN5qmZ6/IzjWY+BAja1HpOWusG+
         pUyxuxnft3zCCGVXsMvHv6yTw7KIbcroyj85/Xu8siqQvdgLW5xQjBxjv4XehBIfjgUZ
         3ckCq284/m74Yf0wxJQ2BZk7PWuiAne+7GAqRePt4E99Gp9NHzzR5ICL8ScHB3eSqfbe
         1Cig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780650069; x=1781254869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o8BGdjq1Uu650RISG3GNTyGokpi2RqaLxlN7t9YSlPM=;
        b=cwD+CQNszhvvkbMQMntZVbT6K2HLw91lUtCekxA+s8E8KhndTTJz8sSSCxNJ9bD7nj
         PB0KnvrPD/2fDoSbAw5dA9jfkdNRmSEZd3Wcr/JybQi5byxw3o6lS/oXmgS70b2ETDag
         6wDoKTnUWBJ9XNHfzKIXobfO3w8HhBTDnGkWxOjCKrDktgLfLgnOIcc5Z3prO35HZzUE
         Q9rGvvYlKZWYZSgUUCeCk9XStDAXGSB2mwP5MX3TTohuBQFH0YNURg9KTGDITkNhwZ4U
         8QVsE092je6fWyaxTQ6Ll8O3NPmzAppVZIOJjYu6aaoCI29NDu0Ac9t6DKex+J135th/
         VGOQ==
X-Forwarded-Encrypted: i=1; AFNElJ92Wwsc1LL+BOOp67vVjIuzHFqJpiPgqmXr+YvjJ9mCVecKHSSGMNV5w3ZYIj2Rbcdk+u9WgUlojFRznHDvlDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmyV9jqJYYgfrSv60uAtcoyWaxVrfnHC9T9qStsxeR4B495u8w
	s/eqxOeg2f40WDeSBkHpv2nFXvhz42SS6BtO5m21PF5cCBHrWROFiqjj
X-Gm-Gg: Acq92OHHQuNaqyyhM8GhLnHPiGKN7uwF4APW8YTA2uNmBVtls3z5bZouC20TqN9k9Lf
	A3ZoPJGk0ltC9Ql+autnwODUpDqZDJ6AkPZi+x5PbEFAbWBZ46wsRoeTq9Al2JMWsVODrK3sI3K
	JABsaYRZm4EaSc53CIV59XH98l4oFNjY/aAP2nHY3ocNtRbf4nHNmfS5zuvusR/OyGrobul7sTK
	iDgix/15x/UHGrZywEiNxUA9khlQIGQXE4L/ZhW+btd+xa6dYYL3b8lx06zFr1tWBxpyREc6z/c
	SlAW4HefK0gTV+LNdWnARG9yXuratUVUaoqe9EFtcTBhgtpiTTUIHuUYFJreSf2H0l0JeXpfah0
	9HlMtP3hI7b2dhLHlVrpQCD4O1Q6AIlzjyPNiqc5+EbC6ZmWfijkK2/UtojDIX3UsbqG5an3tbb
	4Q+McKlTvtqBF+MXv7EC8jZlQ=
X-Received: by 2002:a17:90b:3c8c:b0:369:74b3:a103 with SMTP id 98e67ed59e1d1-371316163cfmr1609773a91.8.1780650069088;
        Fri, 05 Jun 2026 02:01:09 -0700 (PDT)
Received: from laptop ([59.6.68.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4e59sm7670920a12.16.2026.06.05.02.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 02:01:08 -0700 (PDT)
From: Woojin Ji <random6.xyz@gmail.com>
To: Emil Tsalapatis <emil@etsalapatis.com>
Cc: bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Woojin Ji <random6.xyz@gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Add arena direct-value one-past-end reject test
Date: Fri,  5 Jun 2026 18:01:00 +0900
Message-ID: <20260605090105.511475-1-random6.xyz@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <DJ0DRM980L8V.3MR51HBLAVAEP@etsalapatis.com>
References: <20260603-arena-direct-value-v1-v1-1-7b31cc0a8cac@gmail.com> <DIZJ5P33U6YT.14OWBKG3T9LVD@etsalapatis.com> <20260604153712.199362-1-random6.xyz@gmail.com> <DJ0DRM980L8V.3MR51HBLAVAEP@etsalapatis.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks, I dug into the inline assembly route more.=0D
=0D
A hand-encoded BPF_PSEUDO_MAP_VALUE ldimm64 in verifier_arena.c can produce=
=0D
the right instruction bytes only with __imm_addr(arena), but that emits=0D
R_BPF_64_NODYLD32. The selftests libbpf/bpftool link step rejects that=0D
relocation type.=0D
=0D
I also tried register, immediate, and memory constraints with raw bytes. Th=
ose=0D
either fail in the BPF backend address matching or NOP padding path, or low=
er=0D
to a normal R_BPF_64_64 load followed by an ALU add. The latter does not=0D
exercise arena_map_direct_value_addr() with off =3D=3D arena_size; it tests=
 a=0D
later ALU-add path instead.=0D
=0D
I also checked the legacy test_verifier route. It can express the raw insn=
=0D
directly, but it requires adding arena-specific map creation and mmap fixup=
=0D
plumbing to the legacy runner. That seems more intrusive and less aligned w=
ith=0D
new selftests than the small prog_tests raw-instruction test.=0D
=0D
So my current preference is still to keep the userspace raw-instruction tes=
t.=0D
If that sounds reasonable, I can send v3 with this rationale added to the=0D
commit message/changelog.=0D
