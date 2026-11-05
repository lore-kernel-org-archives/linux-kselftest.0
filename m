Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793921752;
	b=g52YseotZH/1pELrF19V3IqlyU+r031HBP1IzVFVf83Rk67OccMF5xAbGiSb4iP6VQRO
	 ivdZ5ffBWx3VOw0Z0y6YWJDjbT/Yyzdq24N80VGFYR2oqmA3hBdV8QvdMCPq5/6noyM73
	 Nnh2iPHVMtleaNroOjZmjul1vnzHag0uPSdjmbbNZQUBLV1h0my2riT8k2CvAcu3Rt50K
	 fIct4shmyBJuq/jWZatnam/LxdJ/aeNmaDSLiPBXdHMe9VZJbSPCjEMEDin4A8hrsnKdF
	 WLKT7To1uUgp/MP9KGJo8V33PuvwtAe1zrtkj2srohtWnadi47Jd0ymEZMA6/w3+YAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793921752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=GCw0Dw3/6zz6nZRQ9tZkZQrpsY84tJiBfsLr+6sG1As=;
	b=PNWG5hSbjp36eK/lsFHnfjPS4mKkLoF+jubt/H3+W3A5IutoTqCGppkcDah40XQ6CjtC
	 BN1uIc2gR6dc7rf9INFkYDVpSDBx+qcDHjazaqZJbuZVSd8aymE7ES+rCmS5e+Vn8N7Hj
	 j7vtty6PcSt84eAfqX8jQoWjuWRMR84GKVj1XRLsEAPVdJmFpbBWJDOkaB95TsT7s3tYv
	 0XofPLRfxU+CclEtj1ceaBXZQt8vJCYSYH5YyiCecHp+DgYlIauKhn5+kFYcTIi33SiyG
	 8vSvlxFwT4nHuEpCnodsZns53CjxStyoXN1PQPbqnxhMa9paBYybMHDfbIjy8b3aEww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=KsafWJik;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52976606A31B
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 23:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52976606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=KsafWJik
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae1a9e187aso10127a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 15:35:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793921752; cv=none;
        d=google.com; s=arc-20260327;
        b=ICo1hqdsEAtDlrazej4mXS6Jayd8FUgLJTmmjZX26VEIJmHhlGROhB37bYPiIQM8Ka
         L8stoefVCcCz4iq1RIyJb3CBc0dKjyBdGoF/7BbLCwSxGX8ePG+K2G/FS+Wn+kdcn43h
         fgonrr6AhKNtV3kFXpLv6WIXbvTAFGt8B0CnOPLm8niaH4aHM7EiG0cGJUZyExUJTwgS
         S1I/b6ygyN7olh33HkquWQIUAKHDAu7r3LPF7gGE6X/uyLarpZVYat2sFZOdQNMaGDKZ
         DEacmX/kjN8lJArqHciJO3Ui8TKi/DaPv8pIbjryVpLYcl6s72yKXP9jCNztrNfTBOY3
         5Ymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GCw0Dw3/6zz6nZRQ9tZkZQrpsY84tJiBfsLr+6sG1As=;
        fh=mDn8h8WERfL0dOuidJf5TpgoIUM+RLC8m8k/lp6Hae0=;
        b=nSIW/ylOwl7jYiP0Zu4wpK6jZZveUGk+hyN5HQYKXCz3hzDkb0MIdZXLxmvPmygfnj
         1P6RHIcJvPSQzQAQhJcXJ0wq8mYeaTXnpnfVfMNjl/sgL2InG23TiEQCA489r0ZfrwSo
         3FL/hMNOJ05K1OXVGY5vemIUQ10uMrVJJYkMzyYHuu0Ooln9rhQ0BxBj2MQswdoMeZ9j
         9cry7zybMjeOCP/GVRMsizL6fjzW29MI/lMUvSptJGYUq+106/nJQi7Mk2ankt/Jkl47
         Un/lUbJeGCaW9BQlXQDP6bCxEE8grLo4uA8K//9iBu8ZkkSqSPuJ9lWk7W3ZboqhpLLP
         l0QQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1793921752; x=1794526552; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCw0Dw3/6zz6nZRQ9tZkZQrpsY84tJiBfsLr+6sG1As=;
        b=KsafWJikuo8FptLtf1RAxBqfXSGGJ/r8dS8Az671M1Xt4RUwVxO7wVepvIlQnOFBBf
         /MzkoiTn08xLX5LP+ahx8pNdH/6ukulK1QEWgZPxxWAEft9c9IsiuX+R0D0I4uOLWlvN
         h6pHrdaWzf4HfMYbaqATPgSoUqq3x78g0hsNakpCOrJKeWKkirPTnilEf/VFX37U2BZr
         89ylElyZXLuhv8PJRcTSqT2qOarnFkl+Z7Efa0cGxSAtBsmcQDPO5MCpc6I7B3NkdWmc
         LN/wvlS4dg9PvAVF4tguXMFlLKQb7alfujZj1CKStebBAsAb55nxUXfk5nOT3kw9FSZM
         ItDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793921752; x=1794526552;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GCw0Dw3/6zz6nZRQ9tZkZQrpsY84tJiBfsLr+6sG1As=;
        b=c61Yxta3L0M8CDoJ9lgA5thHfT98DDdG3KWM9S5UkrmMQc+fRP+enledhRFJjPdgaz
         FS7hy6Uap1iwT1/wczyrDSsLzYwX2OIwR2FpETwoFG9V3qibFKlsl4OBUxS7kuxylnBj
         rkOT1C4fAswwa8+fiH6nVXp+IjZ2LgDpxA6Dv3QjtME8GRS+zZ0gy3Ki5UMV7ldhHjIN
         /divzH8eTR65kDINEI1Tof6rshB89l4vSMMQ838h8WP0TWAj28K9ya6zIsfWF/Nj3pTV
         FL3xp/B2TzfhsHm6Gd4Lp3V4mHb19nqAbfLvknqZiV/foMsQ0XHKzRYSukVYDkslL+ch
         JKkA==
X-Forwarded-Encrypted: i=1; AKwUvBzG0wOMXpfXQEJDt1b5KJOkkuSkzaI+qgOizdjOXx7OnG/hSKyDiGvNHaQOBQk43RfSeFIRr2PbTEJ9EpOxy0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z83g6Aiyhyc+YnoqOBuHch/xxsN7puEDQ9zO7fZzWmmx6jcqa1e
	kkl2I0GYLn4ArdifFPyWTZron4Ukt0meIv2kJnKudQJd6YJ70sXgOv+vE6BWv/OSOwT8/7nUUyq
	r3vUtRe8WMt5a5bfivCjyL8PjBASbKPcNN4ZAWmiZDg==
X-Gm-Gg: AYBFou0E1rwirrsdOkSJAjEVSCUX0a1X7PH3iCFwBPer1PYTMvsv3PiuJhNbAzZ1b+A
	WeZsidJUcEJt3RQBKED5mNZEgHhDoWNiwycF3HbmsvH44/0IB8yeHBxELLF5ygLTZMWnyJWhK5D
	DKo4pay2Qn2E0Y8JQIDKMNmLaoK7LTfKlskM7q4g2tdKen+1gAwGU9alJHE8kLQJ6ZCGYFS9MLf
	PdKlOglmElF99d3+ldaG6L6A/OesUkunvfB6BkVXHX4cYsGCaR3NmjGC3rNuxt+NuYaqM3C0Io3
	05vdu3x7AgcCG2ZXrzSEoXwV4iLXC+K8Id67+ULbm3YFa4+G31RUoVbpDMFZis4LWl90Bvl0W6V
	i8dGOb6RofSYDB/DZTony2/29Hf3jIdt7lA==
X-Received: by 2002:a17:90a:d883:b0:3ac:9e5e:d1a5 with SMTP id
 98e67ed59e1d1-3b0db70872bmr1109408a91.6.1793921751683; Thu, 05 Nov 2026
 15:35:51 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
 <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <e3f63654-0f7c-462b-b58d-05f3164fe340@linux.dev>
 <DMM2G9OX9ACV.231CHJEPK0OHU@gmail.com> <CAPnbwjpQBR-KHwOMG2bo1uhdp22ZW_O5sUj3=vjazVu=Rdnb7A@mail.gmail.com>
 <DMN0RC27TJRM.3KUSPS9QTBV4G@gmail.com>
In-Reply-To: <DMN0RC27TJRM.3KUSPS9QTBV4G@gmail.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Fri, 6 Nov 2026 01:35:55 +0200
X-Gm-Features: AclHuK89NvSJapqCJ93P1wxW7lFPP0JUgKVanIyU8NMBiBOqz8MX0h4pCCAe_No
Message-ID: <CAPnbwjrX-ywbcgNQSZKE2jiggEOSVCRVw9OLfaksihiVSCoqvw@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: JP Kobryn <jp.kobryn@linux.dev>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu Nov 5, 2026 at 5:14 AM UTC, Alexei Starovoitov wrote:
   > Also try NO_HRTICK in /sys/kernel/debug/sched/features.
   > That may be decent workaround for now.

   The 7.0 numbers I posted were already with NO_HRTICK, and either way
   our agent runs on customer machines, so changing scheduler settings
   there isn't an option for us.

   > hmm. you really cannot tolerate that small drop? it's tracing at the end.

   For security monitoring each skip is an event we never see, and the one
   we miss can be exactly the one that shows an attack. For stateful
   protocol parsing, one skipped sendmsg/recvmsg can desync the parser for
   the rest of that connection.

   > let's try to think how per-task counter would work.
   > I'm guessing 128 connections is 128 threads servicing them,
   > so 200 cpus will be hammering the same per-task counter which will
   > cause real perf loss.
   > Gotta do better than per-task.
   > Also it needs to be per-task + per-prog. How will it look like?

   On Thu, Nov 05, 2026 at 01:26 PM Peter Zijlstra wrote:
   > I would strongly prefer all BPF programs that attach to known
   > preemptible sites to use a per-task recursion counter or something of
   > that sort.

   This is what I have in mind for v2:

   - Every trampoline and raw_tp run already has a run ctx on the running
     task's stack. Add the prog pointer to it, and link the task's active
     run ctxs through one new pointer in task_struct (other prog types
     don't touch it), so each task has a short list of the progs it is
     currently inside.
   - On entry, walk only the current task's list. If the prog is already
     there, it's real recursion (the same task, or an irq/nmi on top of it,
     since current doesn't change there): skip it, as today. Otherwise push
     the entry, run the prog, and pop it on exit.
   - A preempted task's entry stays on its own list, so another task on
     the same cpu is no longer blocked by it.
   - Cost: the list is empty unless the task is genuinely nested, so the
     check is one load and one predictable branch, with no atomics and
     nothing shared between tasks or cpus. The walk is capped (e.g. 8),
     which also bounds nesting depth. It also works across sleep for
     sleepable progs.

   To keep the per-cpu guarantee for existing progs:
   - Make it opt-in: a prog load flag for fentry/fexit and raw_tp progs
     (like BPF_F_SLEEPABLE) saying the prog may run concurrently on one
     cpu, and that it doesn't rely on per-cpu exclusivity for its own data
     (per-cpu scratch buffers etc.).
   - Flagged progs get no private stack. The verifier could also enforce
     parts of the per-cpu promise if you prefer.
   - Unflagged progs keep today's prog->active check, so existing progs
     see no change.

   What do you think?

   Mike
