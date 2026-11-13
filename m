Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559050;
	b=0A4Z0jeZzuJEr/qUZPDqs3eELVNT5mV+cU7UhvpVY6iN4RIOorlBS+ncE6CE32fyefkn
	 0mDBFfCuF1UN/IVR5XeDOV+rzYam7Jq2I8r0HGNE+adpFAx5jJvI8x2CNcbLbgd7dCc1Y
	 yXIohDzyAv49ctFA2tyVMrpQSQttNxkpouJoo/h17Uesyx2b43BYoroo2Z2AADPNoBiDG
	 5oH7BpKet8NBUkXkkNKp2Ys4lnIm/YMdiwwIgqoNiHAHkFm4b5p2l6Lakm6uIazynhRBH
	 J/o1rUbFTDBIFKrvp7+iaoXlCarELiu6yyoO4jCAkUI8rRmSpMT/EEcBgYeh9gtg2EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=C0F5qYv7gtQEkIA9c8+UTK9jR4byuBtt4GhvmbtO5Uk=;
	b=47R9NV/wxSqx5U83LWdexwOOVjQmFe9/8uIC2+7z39pFC73/Wa4eKySm52JYHKgBYaIX
	 pg8mYTLvH/fSfOmUxQbfZ2w+LDMmpssl9eUO9nY+tFvEEHXZbdxks4sVAZ0AwZSajp9Op
	 odDPRpNmmuzX/KHt8LI2G+NyLoxdkGzu5uIsIt65Go7q+gh3GQ/+lyPNeLTkR0CdZm7gQ
	 sOBfqG/byllIZO8HLwfJFHfeNvLIBXf23XpZQbpGSX8Vh+Jzz835PW4AfloOnMfKYEuhX
	 zUm7AP3Vsd6W6aFMRf/EXPXsQIBMK7e0NkBQAdaxQpxc7prIYvNT6sY5uh+ydeoejnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=aD32PBvu;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FAA60A3837
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 08:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04FAA60A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=aD32PBvu
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b18717a193so343108a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 00:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559049; x=1795163849; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0F5qYv7gtQEkIA9c8+UTK9jR4byuBtt4GhvmbtO5Uk=;
        b=aD32PBvu9kNTQaV89p9UhhluQuDwjsxlOpcz0WYynBd7c2sZ8ptEabdXMyKoV5ZWs4
         W5QpazPGqxBK43Muc0B7nDBDrnl/Bg3eJ0yyGZxgubUBEw6Xxguc7FsXpeg+SB5iigkR
         6FbOU7bGojIdNULaDsdddlkd5MmBq63kSuhHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559049; x=1795163849;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0F5qYv7gtQEkIA9c8+UTK9jR4byuBtt4GhvmbtO5Uk=;
        b=S96MTqCK8cZCogXcbsOud8F9jXvuJrjp2Z1HnQV2dvd/OTUozAzvX5IhB/xaDzvjRx
         uTZaLd0uOcNJ7aNd6MVk5Napf6REwBHo0t/fyhNjPZObwhz8ivKNNgfe5+rYM4MIz/gM
         RvUwWqpnD/Ihe2+Kd9XSJCZBEX64ds2ZZPsVsnKToiNQL+MDYmYO2xkjxx87y48SHoRx
         9NBkSbWX+UIvrOw1TpZLfVnMm0cJsDSnxUIXtxog/vSXGCA1B2ITQkDPqlgPlJ7eLOUD
         q8dp/VQbD2C1Cwnh+7+l3qIEyzbbX3gCiNZ7ZxmZSP6FqLWr04NbtLKjhfVsJ+FJy9Ho
         KvXg==
X-Forwarded-Encrypted: i=1; AL+hErGNAibHygh0heC+mtBDrvH3GToY+iRwPzQA8e8b6hJ18eYpsbO5U3qRlyl68VKPqx8c4xsMKK1FuTkXJEtdlWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fm1CweVHcOeClpcBuEUXV4s9HCis6uQrRNPjxDmQ1QR/ktjSO
	ZOuxQ4pfmTTTuHE328q6SlO1ob9/pz2hqjxnPnjKooPFY6vTqSdCXpQeqrrM5qROCBw=
X-Gm-Gg: AYBFou1lfDjoK5YpWh/X2fmE4qTwiRQN4xy5ACwLshrXGhtUQNDNAdhczbKUOmcoxjo
	PN2W4f10o9oQN5fhtbmKvCgcNcAgZ7QM8K62QVTPUtVKKsNKb2RKVlIrO2x8Q9OHmLNufpFA24H
	gydERQmPR+fGtrrnzrlOzQ90JLfpMXsMWhBrQRrczodgOPrji6gkFoHmjE7YgGPlXbbKAT8pHLa
	Uhz4NVZOiFlU4TDTpr3qSn79bZ+dnvDSE1usa974QSGXgNQ1Y1XvlStBSFcSTbGAJLGhW8YCGmP
	B8uNJ024l6NqSY7p8qXXZH1jsSsdFo/S40VlvotjwTIv+21WqO5IKOYsk7bm/pn++SMo/mBXVsC
	2Nb/i/I1PzXJLnHwJMgyPjxWtthmkulsvEM1KTvN8kqN8meW65fXLd5/DWIioLAB0PAf9jQGorH
	YPlIeaUUP+JTfIGW+CAAfUAcXn8/6n1e61C5wQjq91Zrzb533smGLTjd2bt59uyUfm/YqM9JRow
	GFihnIvaGad3sfyXt4Gqi7P0X7EcOhowUuSa77tVMsR6xgeeWA6Mk4noqw4BXL3A8cM4F9BolZI
	czU4SPwIIs5K1bp6AKvqtJtZNRIaDO5t4QbgydSmxL0FvXqVSL7NTmh3Q7teJAQbwWPeWW5KNZ1
	43VSxgxvGqYJ5nu2ScB3L3dfOOcyu5KbSCRFMN9+AwV1KgikvucediKLKqk0/hSuYw51WeCwtzF
	wa/CyuhImCjezbPwKyvI1tJGBE602tVsXAEvoqw20a12dsGvamYQqnujs2XvzjZjE4WXbcyyWNr
	1MjTAo9
X-Received: by 2002:a17:90b:4c0e:b0:3ac:8741:e2e8 with SMTP id 98e67ed59e1d1-3b1b07ef0bemr1782230a91.8.1794559049401;
        Fri, 13 Nov 2026 00:37:29 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17042sm3384750a91.6.2026.11.13.00.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:28 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:26 -0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/3] sched/core: Skip the shadow stack end check when SCS is disabled
In-Reply-To: <20261027100843.GA2668564@noisy.programming.kicks-ass.net>
References: <cover.1793082868.git.chris@chrisdown.name> <0e607d3aa7c2c4cc1b5b8ba7b0e25ebdb55726af.1793082868.git.chris@chrisdown.name> <20261027100843.GA2668564@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113003726.68aef052ac869097@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Peter,

Peter Zijlstra writes:
>How about you push that scs_is_enabled() into task_scs_end_corrupted(),
>this makes less noise here, and also keeps the next patch saner, no?

Yep, that's nicer. I've done that for v2.

Thanks!

Chris
