Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670556;
	b=RjUAEplHDdY96bbOYWVj2UfpGhsJC4ZFGuPTG7MaPzTikmTZTgnBBlSv5dmRiqGoUh+x
	 Qb2gw8HnwDu9vVCQzQj/OdApHH8hJRB+2avlHP2h4HU5+Pso1rng0IDagG/g7bS4y3MMn
	 F1S6QhKp1FsJM1QcvhH3K6GYCdU3TLYeUIxvcPyRZt4HZbWIotiL0WxBHUDgClc0NJLIO
	 m+0XmgyMOa1UzmrN5AguQdIrReMQsoaqSjB4v+ww2VSeAo41f4ThqmfDvNtRnRFiXr0p3
	 3koj3yjjCV1RsNzPZaO2GgvpRkDP/hjnxnUvwdFLzi5g3u01ZZhwh9VLDCOMcpjD8RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=JkIPtkRIMfFcSEfUGwxsTLNIjz/Hdrm5pN4sxYxlXGQ=;
	b=Eg7K+miKyHnYlXzvDl/3Deaw9miR5VHK4q8vTteGPF/KrjRxUOxwhqqn2d6F8IJAR0wp
	 dFhGhdZEduaVWUj0uwWTL1TykJaF4PCzyoiqY5Lxf7RIqlrsyLMkSJBHobhrmV8xAowfb
	 2F48kJva92Hky1H1xF4+LvJtrIr3y3yQy7zKTg2chj77w30PLtj1oIYWbgZPDoGdm+B+r
	 VIRaFXMrZ0wXIVPBfPkXH8A8hBEzl3Et40BPMFBook/jucGfBls1eOCCXvfsH0OWsGYFG
	 /rSYKJJlfp91ZetZ3c6EKUGCQFVbXkMBjllXJjKFrYzxSTmyV4eScWf3UxaR0utQ+qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A7BJO4Lo;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35CD606A326
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 01:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A35CD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A7BJO4Lo
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so1474609a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 17:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793670555; x=1794275355; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JkIPtkRIMfFcSEfUGwxsTLNIjz/Hdrm5pN4sxYxlXGQ=;
        b=A7BJO4LoPpfxT6+H+ASpf8yGG9XZnj4GXxUtBiNX2dAZVoPB5KgLe7CBPmVM3Vgnp8
         dvKfDhjUDTRsKY170r6Chzx/5Ety2nC39hhwCg2njDrwCboUt+RtjVVKcpVWxcDZfkzQ
         KEWPtqMk+RC4F5tIsgO7faez614XCFe1pCoScDUC0+RXyytYiJBO0RQh53jUe+M3/9EB
         9dneUAlA4I40aRZ21WI3NNHBmQ5vORTDct/3PTlsqSy0vAJ24f9JSIGAqONzH7euyTuS
         o+YC3cMmYpmuCqLxyuVAwvJwEjF29hy7TWjUaZZ+aYjoh6TRwHRM6UFgg6a2hnuaA53N
         IMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793670555; x=1794275355;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JkIPtkRIMfFcSEfUGwxsTLNIjz/Hdrm5pN4sxYxlXGQ=;
        b=KmoHE2BN6cgm3NCgZlRTu8Z9YcKhux6BAYadkoMp1mNvzrbvu03iRjBg9ROIz3Fv+6
         NJkGmne1o6Dlsu9BUQoAVhlFZK72Km8/4LrhzCXYnnvLQg/dulsD/XeF/h13kragyWkY
         jZDHSjqaAHAanVjQDlT6tjhuFTd6HKGHRtE44P1ZLLUA0zMiq3qXnmcfdG7yxp/548Wk
         e6QGee8d7/lUJr5s91lE7r/zmyTWga1prOm2JE9JxSCNW7F3digyMEpqPS06liQw+A0y
         5DIc3bVv3NC0aoAnPBUzTtFMaeuQY/N+wMqenwnkeqYKvYGtYLqR1exNtJqbnGakGbYL
         6yoQ==
X-Forwarded-Encrypted: i=1; AKwUvBybU3deXzh1PUS9bCDt0P1Cr7gtvy6bV2e/rDwwdpKDpB8wX0NXk/55rrGNw8nP//0EhBM+iHY0zsV8tmgC0iQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yFaEsKqO8CgxsTOs+1FuLcK8uS+Bv8saJwcjKUesxMEwp1S3T
	1RgETAuwhJtnGKKAsrf0fa5NXC6GNvWoRMKsisnvn40SgAP/LC+e4MON
X-Gm-Gg: AYBFou30QWTPedWGJKbF4Rj20Pwe1ZGeyXG5Ffh4iUNCv7GOTXr5gYxgOUo5iu4rYM6
	xvwfW/Tt+RXxldxdz3S41+EJUUXAbwe3ds/hMriwrUqZOxoubbjm7UVdqyF7I/QYk+wZViIq+z7
	qZJYnVepzBR65m8kNBNX0K+W1YNeUoAmFHO6MZz9tTFcY10u/BRg/3DBVJZ91OjKhqLDcqM237G
	oakbqzuFwUwGKheMBmveu5nlCJKL5n7j0LMa1nT+m9fVyOEMdWIyQtEAnIb3KQzdGus4PnPAXiu
	jT6STjscNVy/8Io/7Xd8FCKcL4nj3OTK2xM24jtoXcukofLi5JLIa35lEnmOOkJE5ZtaYMjv/oG
	PiPz/krhq2T1NSsMQeMqPYV3Mkq416qxG4NV8hOkEaWGRY/r4yHcCFhUgoqTvdCLWVHabFSYbLv
	BlLjWn4cmeWF8FHfyN7QtCm0K48tVx7JeyEtB5xD0vYNmrKoHo5OdZgyWOx18QnL+/nQir4ogSE
	YEDEHlcX/IWA3je+ALBzhhle/E/nidSSbe55Cf1U1hxR0yqGcmjDVlu8Maqw/pVSEyMROZIRpvl
	MdsozABppCCk7rzsODDXJ9kiaBms7CMMnP0PT74zkP73Z0doHwPbpsx8e4Af9oQkTFtm/6QyopF
	VSKkdTEaJmKsjEV4ILbNOkMshF5JSPHzfdw==
X-Received: by 2002:a17:90b:2745:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3ae89776d99mr9290272a91.13.1793670555014;
        Mon, 02 Nov 2026 17:49:15 -0800 (PST)
Received: from localhost ([153.61.198.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85e4ff4csm10375603a91.1.2026.11.02.17.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 17:49:14 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 01:49:12 +0000
Message-Id: <DML75890DWIX.EYB690LPBM1O@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "Shuah Khan" <shuah@kernel.org>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let
 preemption cause false recursion drops in trampoline progs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mike Bazov" <mikeba@sentinelone.com>
In-Reply-To: <CAPnbwjrB_je6jXt3BGD-1q1yFs_wFd-Yh9KzixKzLK_X3Stuag@mail.gmail.com>
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com> <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <CAPnbwjrB_je6jXt3BGD-1q1yFs_wFd-Yh9KzixKzLK_X3Stuag@mail.gmail.com>
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

On Mon, Nov 02, 2026 at 03:24 PM Mike Bazov <mikeba@sentinelone.com> wrote:
> To fix fentry/fexit while keeping preemption enabled, we'll need to:
>    1. Disable private stack for fentry/fexit (so each task uses its own
>       kernel stack), and

Yes.
Then the stack limit covers the whole call chain instead of one frame.
It's 2 Kbytes on x86-64 and arm64 now.

>    2. Check recursion in __bpf_prog_enter_recur() per-task rather than via
>       the per-CPU prog->active counter (still blocking same-task recursion
>       and IRQ/NMI re-entry on the same CPU, while allowing a preempting
>       Task B to run).

No. I don't think we can switch to per-task that easily.
For your use case try fsession. It was added specifically to match entry/exit.
