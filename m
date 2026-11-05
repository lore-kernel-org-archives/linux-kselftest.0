Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793837566;
	b=qW8wiViLRHYCsDCNrcu1mQEEVOGEGTbqhyZwm5AmEwUsKbBtL9gD1f/JoWZLp0VsPygO
	 KxSOiHEBjpVX9SQUUZB+3cWajVxOyh8jSPXxBkpngd04KioOI0hFEgOnQyk95tCVgWa2x
	 NSXQUrUhwsUVjI2iFhf6xdIAzTxJPWc9NCti3Syxdkl/NIa1ANHZqefu6rfAhbN6/F9q2
	 6Frz6qFmM0nDqG3jj2G5JnlmmKAeKFH6O6RXkvEyWzjgYQNOwfPSWw0Pw+Mz4eY1/qQFB
	 tIsLtXXLznw8oeZxPcnTdUql+RM0R4VYXE64tBZDhh2qVdsaWO0gdxbKGCQK34q/MXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rwJhK3x7XVjm47244mpJl9P7sCIrVF4iHXLk2RT9ybs=;
	b=PHBVsx3LzFTSA1ovIJuiu/KgC5mTuQ55ZBYrMO0T5TcYI4cdPh9Mngu5prtRyHho8vD+
	 B0pYNqhzOm6xgncrpap952Rm6FNxy1+J/9agOjBKQQRHfPzOAIlC8zdiaVeBvECxgbmZJ
	 Dsu/0cQvvAKFM8tKUki+U5bxd7U8NrtaxKqAXbXVFVMsF75K13TF8TcOCyplbCHq02N2F
	 PcOfm3jLn07GnVRlSW2F6/xUoa+QrhUnn2Hh5TIhYuFyOvdWyDLEjlfE0gcl9vpPO/ZOi
	 w25cc8HsaHNYFw/GV6vWbzSEZUafPODVBV7X+A8ZKpVQS6O63R4FlhWqs21PzfxS55w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=AIPk4pu6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EC6606A333
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 00:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45EC6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=AIPk4pu6
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e83d2cc8a2so1899355ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 16:12:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793837565; cv=none;
        d=google.com; s=arc-20260327;
        b=mxJoIukvU6SmNXoTmkVF3xm+nkrmxtEhk26+mEIOLYtnF5IuD0jDE1EXygIXKeCgw7
         xOhBye0l1iXAjgTWDpchtPuBSB0BRIcHZ+/DrmyW5JJ1ktBXeplrxV14Svao1Xn4rQaC
         Sf+56T8/og8SnNXG5ke5Un8QbAa75s/aqyIVbhivzgG9WAF1pBhDbiFhQ500jxX/Fmsh
         q5RnS4A1U9VH+Qr0mhJHaS/ErFmcm0qK3MyL1osuFIedSUKXQo/j7UwRe/CRq3qSEdSc
         yFvjXSuti7/3S+uXBvUU9Pxo+7Q6ptrO6jbcIL+OFDbVDlI65ZiARDw7RGJRzDZH9UXc
         +yDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rwJhK3x7XVjm47244mpJl9P7sCIrVF4iHXLk2RT9ybs=;
        fh=YwiWPCqN2bCVzb/nWpPzA0uQzlMRUefJU3Qvo2JgkvU=;
        b=d/PkFtSIQkxR0Zi2awN1wBt1C2Xep/829LXp00NpClhG0wFu0sW/1qUXcPZ10uOlHe
         9JEk7MYKsdXXtWjfr11QhMXt4LfJERRw4e5CfIqh9JF32F97gc3cFFen1hpNtkWGTDgY
         mxEfc5kIbV2FEk0Hwb6FUPUx+mvV20ek8tNzAoQf11w7gRCwsMWWhZ+9w/4OI0jyfYr0
         9gsW4v6fCTXinhSbE72ysfMsGenA66BDm18Qr8EnntHdosIAH2uirOvkVlDPz48dx1jE
         5cb7FUncNsuVXs2GLmpHCKYfZqKseNZuOLyrWrTJnbF85OZ2vl882M9A0MZnH8iXpILj
         k+fQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1793837565; x=1794442365; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rwJhK3x7XVjm47244mpJl9P7sCIrVF4iHXLk2RT9ybs=;
        b=AIPk4pu6kv59pyU6Yftzb6cZja53z0GgjNiVDI0dY1cJucbOX64fTB4HWQprJ6UX3X
         bdYP63NgbU7hxKqGeS6fxjDJ+uk2aEAPmWo9GY9dDfVd2DNFHLu3aXzP9bFUF79PNSKy
         1omu0Tuve/kzRnzrZdOSkaEX0//VbVnQpQOdySSg2rNpGHxQ03eOKXvYNgsaZv9ZP1nB
         HKPe1ivDtl8WX++yckdqnXl45otViFSbIevYUhwZ3Ynn0HQ5Gz+5Ja5Gxk8Bjab7Kg9j
         3/QNU4jkIzgYYJeZxCT/zKUf+spcR9Y37aGtXc+/kS7fg9w7ZXZDM9x072jSL7DhWi72
         lMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837565; x=1794442365;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rwJhK3x7XVjm47244mpJl9P7sCIrVF4iHXLk2RT9ybs=;
        b=2lfiotVXjV4yom3iQM7F+1SNNwGlEonz3R/FhR6zZA/AqJZ23A7HjT086eiF7dbHch
         /xLeDeke+aMaqhY2ExbvJUvxtm07zTyotXNrAJ1FGRuWpxxkSwG/GUnGLdoTqaKrUW0E
         yBx2tL0OhdCEW+3fviMRWlzkfU9OAK5h0VuV5H85C/01sQmA5qCl9AObPReZhDDaR9KN
         zZEfQ36sPIdg/5uDD+eIwatynYXJ9kB2mnIQKwM3CJV0OCNhAmnyq/hmX9DsTtSzTJjn
         gQ1OdGkn//zhLvdVmjwQqJDQiilpPjcJdWh02uyVSP/sr4ddv0ghIZstAfY8mNfpevuP
         X1jw==
X-Forwarded-Encrypted: i=1; AKwUvBzdJvJcieuNvo352EC/sS/z1keC9Ou3PCiJJEKvT+Yw1K2R91GwedKPlX5LS9SHHJGLvedPrc29EkyZc1Kym7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ngrpyctr2GieqxLoBvGVE+l0oXdD8XlN+K3oNTVv70jf3/WFk
	eJbmOwV/BjFQDeuHZjlyY59798Ob/VbjwUXkgJhukWudz6f8a+CFc06bnswjbGF8w6b21lX8pFY
	zGkYuXbatU+nDSHEey2DqRo+6YetRHxox+N2ojS4faw==
X-Gm-Gg: AYBFou2YPX0o1QN6ex9OF46mox4l2jeRm8a8PCXYpdSRaG0n/faIxZjiciVdIyvOYIE
	C5sLJOo0bOPHF5owC7JL7UyT0UlvorD2ucosjprttHwGncZkjzGgzO71lldQ5cSCcPXukWJCvWn
	Se7s/KhJAfUzU7D13RatFgUNRAJJU8Ud7so308qbIQFxpRsET1DClQG7qSIb1vik5Ijk7CKvTtC
	iyEp6DfWcgFZfKTaE83NO+Oxa/nXMBEuX1yYSFZb3X+wruUGp4VckZBBLIw8CUECqeqbq50FuZp
	3rLL5no7RIXQFiC85WtE3CHGkTwYGM4xM+HfH8ufcK5lxljD3ydNf1cDuIhf9EoNYnm9sEdBArm
	udgFaZyhJT6cndsQ5XdgYScLgmyV1GM6EtMJp
X-Received: by 2002:a17:90b:2891:b0:3a8:1759:2217 with SMTP id
 98e67ed59e1d1-3ae8964f436mr24798413a91.2.1793837565532; Wed, 04 Nov 2026
 16:12:45 -0800 (PST)
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
 <DMM2G9OX9ACV.231CHJEPK0OHU@gmail.com>
In-Reply-To: <DMM2G9OX9ACV.231CHJEPK0OHU@gmail.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Thu, 5 Nov 2026 02:12:51 +0200
X-Gm-Features: AclHuK-Mv6D6Vzn9HGZ74QBGavLw0oS_88AhPwykn9JGIV4rU_H6TjzTRynM-M4
Message-ID: <CAPnbwjpQBR-KHwOMG2bo1uhdp22ZW_O5sUj3=vjazVu=Rdnb7A@mail.gmail.com>
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

On Wed, Nov 04, 2026 at 02:20 AM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
   > Add bpf_preempt_disable().
   > Your test forces the preemption in the middle of the prog.
   > Explicit bpf_preempt_disable() will fix it.

   I tried it, and with the whole prog body wrapped in bpf_preempt_disable() /
   bpf_preempt_enable(), Task B is still skipped in every round (on a 7.0
   kernel, 20 rounds, fentry and fexit: runs_b=0, recursion_misses=20).

   perf record -e sched:sched_switch -g shows where Task A is switched out
   now, 20 of 20 (Task A, SCHED_OTHER, preempted by Task B, SCHED_FIFO):

     __schedule+0x48f
     preempt_schedule+0x59
     preempt_schedule_thunk+0x16
     bpf_preempt_enable+0x1c
     bpf_trampoline_6442539626+0x105
     bpf_prog_7dd04eadc26e277d_on_fentry+0x11
     bpf_trampoline_6442539626+0x192
     __set_task_comm+0x5

   That is still inside the prog, while prog->active is held.

   > What are run_cnt and recursion_misses of your progs on inet_sendmsg()
   > and inet_recvmsg() in production?

   We hit this while testing new distros with 7.0 kernels, so we don't
   have fleet numbers for these counters yet. For our inet_sendmsg/recvmsg
   progs, in testing: fentry/fexit on inet[6]_{send,recv}msg, Ubuntu 24.04
   with its stock 7.0 HWE kernel (7.0.0-38-generic, default lazy
   preemption, 4 vCPUs), behind nginx -> gunicorn -> redis, with wrk from
   another machine (128 keep-alive connections, ~1.07M requests over 10
   minutes, ~62% CPU):

     run_cnt 38040015, recursion_misses 4063
