Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719119;
	b=gWaFh+iJvHi2hmaUuE7Y3b4NeHPjeg0sHJTgd9bR4ARGK8gLvSBqaj3P4xZRWlbKziJI
	 yqA9HK8DM14OzC0cqYr07BIpQOH3EpCezQ3/Zdp3CSs3xe0wLJzr2B9OYSuy/zInA9i/5
	 ohHi0vclMFtYgKhRbzpGw2GQzROb+u2fsDEHeAfSlLLy2AjRk9EDyLkH8kPzGUS6Lm0C5
	 m0bH8gKFCuWYeqqo3MFraznmRqMpGVaqAMx6S3JP6Q/1+5MEl0epfsc3BmXP93If+bh7B
	 7AAOyQ5Jdq2On9kZxIHgr1rIO/RsuYpHi23RYwX4f8ju9WF6A1tRuz/NxPkNlJBBgOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=wslCY1XSUoR3v4P9N4tk1erDlQSR29c2WrcvV4W33z8=;
	b=GbEP9P2Ua59jBbOQa69SCipjMYPutN1YWxp1aplzt1rlePkAiBQ5CfoYPDs5Sufsuru+
	 Lqi0ShrjzV6y0o4HCkLKs9LcTmzmdwt777KpOD+sFyt01OUF35dGiNuZawBhaqbjg0okT
	 Pixi66enxCuo4dbZU0mAr58TWtz7tNLO5Osx5YBcB7EDUa8KjXvV9pJxYdMvfP5dtcXn9
	 BrhHp5l9Ojrwn8jY72+nnAqIDzidyncdm1yRqpLvxRZRqbTUEcOAALd6gHuuaeCoamS7+
	 +Bm87sqOhSwfJFvE74SgBpw66Qo3PjcHYh5eS4eV+zoAi8ChtgG6kbpsllafbsEuOeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=NzH9v5uE;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E7E606FCE8
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 15:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33E7E606FCE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=NzH9v5uE
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a070781f63so1783685b3a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 07:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719118; x=1794323918; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wslCY1XSUoR3v4P9N4tk1erDlQSR29c2WrcvV4W33z8=;
        b=NzH9v5uEH+MPtdumNErHcLU8TI7esovID+0FCTg4cq4Ny7OB6Jbv2iuLnSDCRB39Vh
         z1jm9WbnlKgC0FM/ImPLdCDbfHy1wPtGKCnh7nLr66I2ZWRMh6r61Gw1Myi8kqqxygS/
         MP+GB+led6l0lrR+WCQZnEEeUcd7JizQOJMcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719118; x=1794323918;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wslCY1XSUoR3v4P9N4tk1erDlQSR29c2WrcvV4W33z8=;
        b=FS6/PHvTr5D/v/7rK94JYMAR0rfvarGVP1zXy47E5LsBYpX4om4X92fd4T8NhuaYrp
         7N9DLfS20vr9O31Zj3zi+u97RUCexFMqgHiYGHYfAzkhLEiJE1WTxUjay+eTfPRa8EWY
         RC+PW1wiICnTtU+cxwq7D6nXxm1PBbvpDs15le2KL+MPPiXLo71Ja1w7amAhRwNb2LEx
         MfY/Gr8cr9LIY31n/KVU0Nx5DrBjdW7X4RCxgD/fhJFY5y+CPdpYzdNABfx41tt7jZbJ
         uHzjjaHMRuBQ/1CDjOrgUzLL1qRqLLLaRAH1EmXroFXA/RKrcNwdgbQfuj7NkrwzSc3R
         w03g==
X-Forwarded-Encrypted: i=1; AKwUvBwcRtqbJwxEttXcXTBYzeHoGr0iLXfGUDr6XbgzLcpNvOh0O9Ua8+NW1LUTAfJoHjX4AB6wXJ4DdujOQuSAK7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eSShM8gfKEcY8ppHawgtbKtzfjsucPLo2i0YhPw96n5qGTIF0
	6wCoG5jCRjRcaq3WClS4XoavkLqp+s5tn+WL0IwjlVxUHXP/q4KyOg00f63Vmynh+uE=
X-Gm-Gg: AYBFou35gutTfn91dzWdKt3IDo/xoydft5NrKOmuvYT3cFTVx49tty22kGp2Ol3sVrh
	khBdFSx5aCULQ/FGXY2T5T//Tbzmd69kIzzwUsWJi5Gv7NSvQUeqheUZkgIY66hMNSaLqiN4q1y
	XmmyP3SUaOAGSKcmenV1EXsw3/e9aSXDKZfDX6TB3HFJDQ7JNKoa/WqVrwh0MjERSjB0gHumYvI
	c2Y5tsd82opLSsKkyuEDBGOJr1Lg77NiBk05TyCpf06cLTkzq8kK+Tts7BGBqARQqhW0mgQiDRM
	8phtYwB8BES7No2f1zM4Z/DHyyjjkMeI55OkVyjJaixIP/JBvFurrPTE2tYzOPUc9AQwizkTnnC
	xZZMJH/1+VJT6lPTbpKWCkZyD2DuxeUpiAY203MB2oa4rvXoFBDvvQAdtyYH24WEExIyNapuLot
	BmzHMA6P686GxjRi0s6UiVe1oibVZo2x7AtscArkMRYqLpDOCFB6xwS4vKp3+2RnGegnp1xV3t7
	30sIJHNu0V7yJutlmYOVdkwuvfwtZnvmVBTZDPp7DSI4E/9gtL0DV53dTOBszFIkRtXSWdjqOe9
	DTY1zdFnpaL1ymeko6PX170vyYNX+LNgWyCwhjTDGwzm6k7W+iY6hasYMpmCToGWepMuoZsO5Rf
	waGVlefLpi5U8b892nGh5OqoNYUULMrqzTKrdzqoybd7kvXf0E+bxO1kUHa5jukcSmlDd/sE3n6
	iDgb5Vk4+QhThGk2V+fQ==
X-Received: by 2002:a05:6a20:914a:b0:3dd:a009:3182 with SMTP id adf61e73a8af0-3e928e2909amr12529216637.42.1793719118513;
        Tue, 03 Nov 2026 07:18:38 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb362ab313sm1592131a12.0.2026.11.03.07.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:18:35 -0800 (PST)
Date: Tue, 3 Nov 2026 23:18:33 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Jeff Xu <jeffxu@google.com>, David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Shuah Khan <shuah@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2 5/8] uprobes/x86: Leave sealed trampolines in place on
 optimisation failure
Message-ID: <eafd3da2cd2c3e2c4d137a46f50351dc6290c5ea.1793718940.git.chris@chrisdown.name>
References: <cover.1793718940.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1793718940.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

If swbp_optimize() fails, __arch_uprobe_optimize() unmaps the
trampoline it has just created. The next patch seals all special
mappings when CONFIG_MSEAL_SYSTEM_MAPPINGS is enabled, which includes
uprobe trampolines, and then this do_munmap() would fail with -EPERM
and warn a second time.

Nothing is really leaked if we leave the trampoline mapped in that
case, since get_uprobe_trampoline() reuses any existing trampoline
which is in reach of the probe. So let's just leave it in place when
it's sealed.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 arch/x86/kernel/uprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
index 0f60c0d076b6..fb895bfc09e0 100644
--- a/arch/x86/kernel/uprobes.c
+++ b/arch/x86/kernel/uprobes.c
@@ -1183,7 +1183,7 @@ static int __arch_uprobe_optimize(struct arch_uprobe *auprobe, struct mm_struct
 	if (IS_ERR(tramp))
 		return PTR_ERR(tramp);
 	ret = swbp_optimize(auprobe, vma, vaddr, tramp->vm_start);
-	if (WARN_ON_ONCE(ret) && new_mapping)
+	if (WARN_ON_ONCE(ret) && new_mapping && !vma_test(tramp, VMA_SEALED_BIT))
 		WARN_ON_ONCE(do_munmap(mm, tramp->vm_start, PAGE_SIZE, NULL));
 	return ret;
 }
-- 
2.54.0

