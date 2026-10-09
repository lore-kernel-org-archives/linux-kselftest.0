Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F02F3176EF
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 02:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791511593; cv=none; b=EUObPHj3a+bFqWcJ4uIo9y0Aqz0ng6AtIzdcRG9eFpA4JeFgKUklIj20YVV3xOi9ZtBu+lWRxQks/1kC/jIbhsEIrzAWLwiF7kC8qB5q8CcTudrQx//s714270bd/etcPUn8YsnNyUvLQDvRFtGUN0QDhscOw71O12buRxuy+ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791511593; c=relaxed/simple;
	bh=nvMP/H0VCC9ksHrNS4KZHP17Fdd9SPbn0GfDW5pvWR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ur22fIAWQ6EqbNviaInWJ3FSzNziGlE656Q8jI69D8MMwPzLbPY1dHDZxsQCQFnDqxxcGUhZmOOHXGmHNJUQuE3xOcZM/3r8ArKfAtzlLbJSSjNCjD4N8ReLX+ELOmpSpAsWJG/2fTSm8AW45oGXirQn9NfHtYE+4pE9LoSGLP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COkUT/vB; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COkUT/vB"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15354aa70e8so12580c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 19:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791511591; x=1792116391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvMP/H0VCC9ksHrNS4KZHP17Fdd9SPbn0GfDW5pvWR4=;
        b=COkUT/vBaIMZ2BM4yNdKQpphz0q3kT1aEy02Z751bBzbwleUBW3Vzj8uzuhX0WQPUQ
         wXoKwkGZh+G3DZbsB8V8CoxRal5lHMfiGvAU6zDot8mrZm4bF+VusSXq+VU3+NZ2YhKL
         pitgSDll6kBb/XNpdSKpZq2iB2mTyCi8MYAUtMYn03Cp8MWC95F23wCr9Sx8lAmFMmh2
         PgS9FubnQqi4r0F0upWGXVYdSHeYAjse21MqWxyTYc1S7xEVVtNPQVD4UUIgMaZyp5Tk
         Z3wABW7kN8+YBp5ng6W0F5DCJj/T2BOwlNpX0/SwXNh5YNVOfMiz0faZXIZ5oN6gt0/1
         CVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791511591; x=1792116391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvMP/H0VCC9ksHrNS4KZHP17Fdd9SPbn0GfDW5pvWR4=;
        b=oCz+UH1XZVpBri0iQh05VfXl1KFPvIhf+IfWOp95ySv00y4vIlf9V81NHtqr+olVNn
         ubQWOzVFa926R5MPHczrE1uMFcFuOyRQs61vCBxtyXBowtPbohMc9NVmWIl6mWpg3+f0
         pe5Ek/qg5bZBw9A0bpvdUgzN3ANUhlHGWOa4TQJFOE3asGhWTYY2o38LXnzUZa034KMd
         3WFGkZ9k07jVJsxMgyoajdFlzp9HEJpXk0VtV//DvG4TTDR+eP9/nP3A80roKEWXzxMk
         j6Uv5lNWdU66LkVxqhDEzfil1EqlqjaQ5eJz7EE/T11mPk9OAA5O7/iY52m/51Fnmdqm
         eO2A==
X-Forwarded-Encrypted: i=1; AKwUvBzjCa3BA5K09bsgMDCckbu22QVCd30pEC7OqJH9BMT5GEG1Oz1GNMChWaUcOqIHEFwwEVuY2SYc1JTtCI+Pw+A=@vger.kernel.org
X-Gm-Message-State: AFuF++my6c0n/W6BEYEuJOQmpvvy7ts/aGdTKyXbXU9N7UhmU7kI+KMl
	RxaEGNbVJrKvuyzpYkqIT9qv69MFanx98rzrHlGSk+7HQbx92tu6Pw3e
X-Gm-Gg: AYBFou1bxLte4673nyUwbLMFmCptdmutZN0cMKMlj8QTdYdjRrJrryaEec5GJRaZE9X
	YMUc9l6mdrCahQ75RiroiKTaQxcXw9/7a/cTTotbu4s7kl9Cpf32FaE5sxJUmqDOiD2x/p2srhu
	wDvzlg/8qDyEdjEsIfpuQiq+VHK26GpEbHJ3iIyibV56pVlU4IET5kc1saT9mAXVl1jk2kwWXBv
	2ZmF+qvrgu+LZCwnMHf4VC3Y+IQIyPrJ8T6U5aF3Kx62ZTKmKZe1xIZekss97nzR4Y05c/JGctl
	QYKgSHQZsAyinzudCUG6ry4HMeOqKlDrnrK7MqBst1w56RngdhcKMEYc3TnM7VbpetDq0TEegF8
	PJzcBYMrio9N9vLaF1dzd8bW2WshPmQk6/2A3ArZuiQNTa4HaApB6W88/6NdDhceuKSy3VYei95
	RMX85eWVNhDAOtWRUyRjs7DA1nHz8wEx2hH9BncGhG7WsIo1C/EeE0lrsWaGeFfg==
X-Received: by 2002:a05:701b:42c2:10b0:143:2984:6517 with SMTP id a92af1059eb24-16a60fd3678mr661504c88.38.1791511591127;
        Thu, 08 Oct 2026 19:06:31 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2d2db98sm1964610c88.10.2026.10.08.19.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:06:30 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	Hao Luo <haoluo@google.com>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/2] selftests/bpf: Don't stack a bpffs in cgroup_hierarchical_stats
Date: Fri,  9 Oct 2026 10:06:25 +0800
Message-ID: <20261009020625.886508-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAO9r8zORCY-3W1eLmc7ZmEjTujuHRMNxsP1=i4gg6y4Pe-WedA@mail.gmail.com>
References: <20261008-selftests-bpf-cgroup-stats-bpffs-v1-0-76b9a6d1be34@gmail.com> <20261008-selftests-bpf-cgroup-stats-bpffs-v1-2-76b9a6d1be34@gmail.com> <CAO9r8zORCY-3W1eLmc7ZmEjTujuHRMNxsP1=i4gg6y4Pe-WedA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 8, 2026 at 7:11 AM Yosry Ahmed <yosry@kernel.org> wrote:
> Seems like both of these tests do not mount bpffs, but rely on its
> existence. If it's generally expected that bpffs is mounted when the
> tests are run, should we drop the mounting code here instead?
>
> Alternatively, should we have a common helper for creating directories
> in bpffs that mounts it if it isn't already there?

Thanks for the review. Looking further, the bpffs is mounted in the
wrong place: setup_bpffs() runs before setup_cgroups() moves the test
into a private mount namespace, so the bpffs lands in the namespace
shared with the other tests, and cleanup_bpffs() can't unmount it from
the private one. The BPF CI bot pointed that out as well.

v2 sets up the cgroups first, so that the bpffs is mounted in the
private mount namespace. The test keeps working where no bpffs is
mounted, and it no longer affects any other test, so neither dropping
the mount nor a common helper is needed for this. I kept your
Reviewed-by on the unmount fix, whose code didn't change.

v2: https://lore.kernel.org/r/20261009-selftests-bpf-cgroup-stats-bpffs-v2-0-f93a111da992@gmail.com

Thanks,
Qiliang
