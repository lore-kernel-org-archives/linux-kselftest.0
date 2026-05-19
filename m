Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7712B3F0AB6
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 09:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183230; cv=none; b=V9UVZDUqUEpOaA2vph3q8BM5lLbFKQ0Npm9p9MLtMxPJolrZWjV5zvwb685X5F26+Nl0joc5L+w3/mjlTZGbqtCJiIZBgutHOW89z22yGQy0X+ckiyQuy+Qv53Hbn70hLSCxXudjVD1uXkfR5J2tDp1/WlYzNzeuF7q6gy8RM60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183230; c=relaxed/simple;
	bh=MZ64336EcOvTT9LLzwO4iommfKZLchNDwIRgvURGiNs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IniZadgkx4ukAcsjDh6JkZKneekKrQR5j7wZEMI1d4HKePPAOAScYsdGroJqUnVZY1SRiU12LV6AVaz+JhcK2vgn6kt8LTE6juPM1W+pdlJ/LvJhvDh4yeu7Ct3fkZB3Ko1vgPUwVpMQa+zpYqxdTpm7Z5s2VCpmerxHzYJ0980=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPu+SmRa; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPu+SmRa"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso16648355e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 02:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779183228; x=1779788028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wk4oMDiAJiBC2lkNmxliIsTP18c/i7C6NCjort+Ra0E=;
        b=CPu+SmRaajJu3NaZ4Utl9DPnxqYwW+1VfqvU4eTCla9LzEbjN0J+y0VKvYy+1Hf/21
         9UXaWs8Cmytz9pmAEcjzqNHshgM2DJAzt5yzJHBJuOkA+uV/3wVVoQ5g8eU15rb2bLk1
         NADK/PH6bfTmmSTzO8evni5A9dzV2UColCxD+FbvzFgoM0R4c9Cm1PUy+yt+hk2jxQTe
         itexd5IOU6I7E6cI/516edTOPTArpu1ELyl/zqIcrKGxL28GtkCNxJxQt5PkUac82jYI
         AkTXgteGRHgb5bpOexNDQrrQ1084Jyqn/3Atk9OHtbPM9aAzcwa8xQDXd7E3PLEw5Og3
         w57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779183228; x=1779788028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wk4oMDiAJiBC2lkNmxliIsTP18c/i7C6NCjort+Ra0E=;
        b=PD5YS+D1a36MqJJtCLvHE+UVPJMOVVgvbo7JA8rclt1VJx8ud1AfzkhWORHy2c5RKO
         RKgg5z+E98GAvQ4y3+X09bZeNuCS+LqAuhZgmvx93TiAAltRFjylJaN4hMS17qrofMd8
         g91oHSVGofCxD3IDIz0A8mr4VIpHSICyXYqs58bxArhYGkeNiBKz13MYemE2x9YpvcJq
         6kMhM5knZ+9CSDacFRGp0WfV9n1D0Mn3Vi8pk0u9p2UG6eNTUeVhgYkimNaxxU45fC8s
         LaJ8Fk9B+xmeBu9j6DGE1ZHcI3dy5RvDnpexjuNxogyGXSFWU+EvKBe3WQO0JwMALJf+
         iVZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4WGN6rIH40DkiAMeUol6wBK8nzVJwQF8zafl5ZgcHBYkSY75lRKBwaahE37jU/Pj4mX22fTV6hXt4bRhFNnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjXue9HUR3xQXZTS2S7tIE3j0FZeL+PXONgq0/UEWwnwyU++61
	nRDKGatTeeGF0djY8y8emoddiCLpBkoKORoEaSIrBIRKv+cQu68pM5Tw
X-Gm-Gg: Acq92OFjtdpUTmux0S/zCNXJ8k+IfS5G2uyCzgHCgawbwQuAYGumZyKTcHVXEUa9Z/K
	noU0q7ByucQ/Yf2ITWGV2yRFCbu6Bwc0iGwSXT+FbeJQ6ql10V7CtQJp1apibloLqBjCQNK5jOV
	zfKP+cYvivbeeQnG+RSrDisllYEag6JUQqRGJSqcxXfydRGt//eD4yvqdb2AWF6GrPiajcjMR0U
	I4cYHUmUA3nm3ADbUGv/VTOa+KprseYe0JWPIA8OgElG9YmXhGfjv4SceQ2fPWCfgDnu4/NSPJM
	BFEjwpU7g/BXD1M48RCuIZjq5TYN59TaUfkxVXug/fte639qrKGwYf5SdWIT+LDPzRH6dA6H4l0
	EBTn8Q5o8Ef7+X20Evl04ajJiee+OskeOyX7X+7etAKXqDLzW4jorz/RtFrlAP9+Q4sl+P1JvkU
	nupnRaXMcV8EcFjnHmVIi+VHXz+M2+PWmXNKsuZln5iKsW6S+FB+aF1JuF7qC3novm
X-Received: by 2002:a05:600c:5247:b0:48f:d1b8:9aa0 with SMTP id 5b1f17b1804b1-49007bdff16mr143726635e9.7.1779183227717;
        Tue, 19 May 2026 02:33:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaa2c96csm104842005e9.2.2026.05.19.02.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:33:47 -0700 (PDT)
Date: Tue, 19 May 2026 10:33:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Richard Patel <ripatel@wii.dev>
Cc: x86@kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>, Yu-cheng Yu
 <yu-cheng.yu@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Thomas
 Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski
 <luto@kernel.org>, Kees Cook <kees@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] Usermode Indirect Branch Tracking
Message-ID: <20260519103345.49e52ceb@pumpkin>
In-Reply-To: <20260517183024.16292-1-ripatel@wii.dev>
References: <20260517183024.16292-1-ripatel@wii.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 17 May 2026 13:30:17 -0500
Richard Patel <ripatel@wii.dev> wrote:

> I was quite surprised that the Linux kernel still does not allow
> userspace to enable x86 IBT (indirect jmp/call integrity).
> 
> Compilers and linkers have been emitting 'endbr64' IBT markers and ELF
> support notes for a while now.
> 
> The hard work was done years ago by Intel:
> https://lore.kernel.org/all/20210830182221.3535-1-yu-cheng.yu@intel.com/
> 
> In summary, usermode IBT requires 3 things:
> 1. Set the CET_ENDBR_EN bit in MSR_IA32_U_CET for each IBT-enabled thread
>    (PATCH 2,5)
> 2. Back up the WAIT_FOR_ENDBR bit across signal handling (PATCH 3,4)
> 3. Provide a way for usermode to enable it (PATCH 5)
> 
> This builds on top of Yu Cheng's work, with some adaptations:
> - FRED support
> - Implemented the existing prctl(PR_CFI_*) API
> - Removed ELF parsing (can be added later)
> 
> Unresolved questions:
> - Is there a cleaner way to do the WAIT_FOR_ENDBR XSAVE fallback?
> - What to do about 'notrack jmp *rax'?
>   I leave CET_NO_TRACK_EN enabled, which weakens IBT, by enabling a jump
>   prefix that skips the ENDBR check. GCC emits it for jump tables
>   (-mcet-switch). We could introduce a PR_CFI_IBT_STRICT bit.

Isn't using 'notrack jmp *reg' for jump tables actually more secure?
If an attacker can write code it doesn't matter.
The jump table in is RO memory so can't be written.
But if there are ENDBR on all the jump table targets they become
possibly useful code addresses to arrange to write into some RW
function pointer table - which might be useful.

-- David

> - There's some obvious overlap with arch_prctl(ARCH_SHSTK_*).
>   Happy to use that API instead.
...
