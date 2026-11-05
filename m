Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897046;
	b=uxHtO813m8JG69DQFTk3VZWwcHG0e+CnTlQNvf6hZX3NhNngFQZo8JBZbqrlo0BBPV94
	 gQrSK6QfjGxB/BDfb+F40S993mKMuPT7p+6uIHJU1fq0atQF7+ghEIjXD7lshlUKFZpkr
	 e461KeT6m3dPK6t/M63zJ5ywTc0ObGhYng32ze8Fh+Z5Lkzqzd3FWRksuc55LTaphVfyl
	 6LOSLWVdWI7bU6Ve/Kh5v5vm5TyMkv+qKZe7wsqKe1H3W6/uGDzyJ78SqMN2nCQ31zzUs
	 Isez3Y5HMf7RI875PhPeoy9JmuKw5u1/RHPu4K13BGekffCdOA2vxFfDkAbQHDNhdrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Xa99gepi22SogAWQPeAgc0EROoR0OAvZegPBJ3DWXuQ=;
	b=LNw97dTOSUGHpl9cVeHMniU+Eku+c5j9BTSGQMz9qJslMZF//WFTxaL0is6tDYSV8ZLM
	 CNngaBiYxfgiqkzU+JMydCnb2PBc6/+mg79Zn5GSQAZU0yY1Q4l5j9kjOPhW2SGbVpyXX
	 LokBCw4+ovs3Pm2OgeVbO0jfrelkDS56sVGY0mrMtmrqOXEkS6V/4CjuHHhsuxeagxfA9
	 ciwDveMC4XIqW+m0EHGWtnvhi5NdgIld0T51cPgFAwkdgsVhMuijfnNF10DX266UnwjOV
	 8EKa+vp4B4RdrCSELtrLnzIJ9HbZLkvDEuSv+TIOSWXDxZ0HS0bORjRBAdhSYSK+fwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x0a4hyuZ;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22932606A331
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 16:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22932606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x0a4hyuZ
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491971ac844so676800f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 08:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793897044; x=1794501844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xa99gepi22SogAWQPeAgc0EROoR0OAvZegPBJ3DWXuQ=;
        b=x0a4hyuZR9bNPDK9sTp8JRC5Ve2YkPdwkHoycWtq0ppzB1zEDNW19cJ21e3yDVmmEt
         KPk355x58nrqTShOgSKA4QiZgEwGa9DqNwh7dlSHDIMwx6CPOY6CMn+zsgGKeLwCuJmk
         WAVlMYcQXgsb9r5/E60ot47kzTDhL7fG5KDezw4ldukrLDqj3kW4FPsWAvMoRAeikQwL
         uLtK/ljaMtp51WBPY+FRO8VSTHxQuLwIdLN2x+lu5E0iCsWJOqdc6m0/Idj7X0lc37Ng
         lE+IgGKz8xuUF2Zg5zkcXL9Hue6rqEcCs6uixr6rLYCeHXlXxfcsMxkDpA+Kty/tDx60
         TyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897044; x=1794501844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xa99gepi22SogAWQPeAgc0EROoR0OAvZegPBJ3DWXuQ=;
        b=ao3wODitfo0kXW+fk7kPzmRGJVAQF0ZxUcSDVJstoK2YS/qS0lcqXzqdv0tvr/CtI9
         8c52jFpCQHvv4Y5W7QXhNrt6E3PPw/kGgMjqDw+RLO/3Fn7HtTtLgBGcw485nwQbjOxl
         OGFRI8tRv/VW0RSeKfWt8QFNyiLTUAiZFfZX/PhdoTEfAe/dBC18SivUkUiQOizOIMqQ
         tmMJOUDbqa6VNakyT/IEAt2rdkLOonvVvDAIguH8d5zMEZ9EKnUYX5owFKchSLiPoFEO
         YxGEwbPzQwh4Hu+5AyaNfKNTRSc3EvC/IN1phn1TSqhsWHeTNSwgZ5k2jDwG0sbsTyIq
         xGZw==
X-Forwarded-Encrypted: i=1; AKwUvBz3u5uJtm4+phJiUc9tZATGsEECAp5kxMzph0dDvS1+aCs+jq/1Dgjawzk+iucfP5brlwDY8VU+k1/HJGwha7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z85/yC0sKfAEGmlkWW/0KZHhoyZ1aJNXikRz33CkGeDmcM312Gy
	yIurKwDNu9FhgqqQ1xYZFN8kRCDKRMmflNU990FPSo+fdbXocjndJWuj
X-Gm-Gg: AYBFou30Kzn6N6kytkvSbGae/Dj6tmU+4Gg+YTMzw4IvtVkRMfKdv/BmXQFJOiLeMOU
	rZ6ns0nfjJrTkpd+VocAiugMCmHyW5F/nx1/BH03CBcB59xWEtXItvDb4HU3tWbmkrMVNUzzopp
	IfcTVxgX4H3F6/sM6sA08ygPc+yr2Q4hQ76hF5fsrrRSkn9GlK70qHsuNT/loh1fmsdCNybzRpX
	XNUk5dNpHE0K+ziLhMrMLBwkDIZp6nNS5J8d4AQMxAYz9qU4gXKVYV07MD+VDR2GDYSoK6m95wR
	znsx8DHz/wq3F1EPTLPjtyuFRnJgh8fWMuLdyh8ifx50NWegXqby2QUMXWQgKO+QQEQYILbyGTP
	zc5rD87eGShaIfyoW44sMnIuxcMHLH1Vtbbrs+6w4XRhOn82Psqc3Eo8CDsTMcJ9DetOGax14f4
	OG2UYwwRqguP96e1RekWSlqI4zSOIRF6YHqV7GFHjV7vwt2Ypx+KT+Ct9G64D3I8/hy3DPvfC7X
	G90/81I+1+mIGrfrV2/YO0kuyXxXw5ALqIWQcNHK6zsKPwZEKtbk0oEJHGJRt3gIPq7JJmoVezt
	ZWoelFg4iqtLdDDf5NKbv7vRDj/E1l/MpzbEzTsotW5RU4aQdpoohJ+/UaJJ0VOQcWrFFe8Ez9q
	4iSnJham/X0bkeqkzjBjyqC0zkBW9
X-Received: by 2002:a5d:64c6:0:b0:48e:4e00:b737 with SMTP id ffacd0b85a97d-492775f151amr306112f8f.54.1793897044130;
        Thu, 05 Nov 2026 08:44:04 -0800 (PST)
Received: from andreayoga.localdomain ([151.43.242.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea18104bsm11441519f8f.6.2026.11.05.08.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:44:03 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Waiman Long <longman@redhat.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Kayra Cizmeci <kayracizmeci@gmail.com>,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 19/21] sched: Clear cpuset_locked where the policy check retries
Date: Thu,  5 Nov 2026 17:43:55 +0100
Message-ID: <20261105164356.28913-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104211207.1392343-20-mathieu.desnoyers@efficios.com>
References: <20261104211207.1392343-1-mathieu.desnoyers@efficios.com> <20261104211207.1392343-20-mathieu.desnoyers@efficios.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 04, 2026 at 04:12:05PM -0500, Mathieu Desnoyers wrote:
> The retry of the policy check in __sched_setscheduler() drops
> cpuset_mutex and leaves cpuset_locked saying it is held:

[...]

> Clear the flag with the lock.
>
> Fixes: 111cd11bbc54 ("sched/cpuset: Bring back cpuset_mutex")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

Hi Mathieu,

This is the same fix as [1], posted on Nov 2 and reviewed by Waiman,
Kayra and Juri.  If [1] goes in first, this patch can be dropped when
rebasing.

[1] https://lore.kernel.org/20261102134606.242743-1-parri.andrea@gmail.com/

Thanks,
  Andrea
