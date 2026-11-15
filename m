Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752676;
	b=eANxUq02G3RW706LU3i46pyv7z0fPDBi++n8clIsjwVcn9QEvonu2RYjSJK7wPYjl92k
	 JEZOBsM6yQ4+9Q8v0mhgvyzGoLswNm0diPl/eh30ETS8FCUAVhi12N1o+C9ZBdiKH7Vyi
	 LO6fCDx49TCAiboO2/uqChHgdT6dWqHZvpxuEA5wmtiTupCOxdcoHXwfTkHmoFoBLOHy1
	 KBjumLuiVtnxaCZTpLwsNbmNtuiZZ9z7j5PUTE5vK+FgMd+rqZMIvJroZCigrjb3rySVv
	 5RPMvwEqI54hj4Xwi/tj1V0PQFspKLsMspnBhbOIW1bSJlQ+LHQy3mOhNzxHng9PXrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7QzzvIBZ5m85jb8a3T2vbOcaHxM8nqWRH2JKBq6oOx8=;
	b=BylKWcBbqHGR+Uv54Xz6u4qfrpYYd58khy582cMmaW3aUJQ9UT7ImFHGGzQEN34PGdxC
	 RBboUeolgbp9pYaTNBnpuvFP/NuOJC9Zy7gzC/nC2v2xb+6SzFs85xKOZXn/4mQ4vZIlZ
	 fbAHHgFkB2E1pQ5eB+LwntDpz0LME+YAysePDXyvvNmBZel6UQTgOhKkH9AhKtc56TkRL
	 AcrDN5mWYLa6o+UmLGGn1hwvoew6VkGYxQrGYUbOaJPvv18ZJb7Znr5fZmKD9suU/4OCG
	 29VovS9J19LEjeIE1R3BjDwMWeIZMDz7cwZUjRMB36vS9HfYRVfDTUFLlk+79L4mcsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxVes4fN;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9295A606A88F
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 14:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9295A606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxVes4fN
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b467581b98so19855525e9.0
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 06:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794752674; x=1795357474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7QzzvIBZ5m85jb8a3T2vbOcaHxM8nqWRH2JKBq6oOx8=;
        b=jxVes4fNS9TSgGvlHsTT80+9II9XinvC4prossPItwxQmdIh/ly0jdC/cdyT55vVR6
         dxr87FlrY8HaEzKWL1k6AkuqQTejZzqNuP03IkWn/1QKMcHCGusJm7Uzh90VmKNatLHN
         /Ur+ln5v7C1S9XPfNu7fKUrI1pDdBwtHp9o72Tv8ddrZYc02/UP04z5Cj9qKvnMUiuBc
         AKlR1i85YUHuEqLhR+nPnOGxB8gyhi3BmtQiXq42P2XoLdScRFWDqb++9b0P9t/EHP1y
         PjbWv5kEkbF943EnXhorY4a6wJ2J69Bqn/WcjcubzUA5IRKt9NLekdoBKWqKwl/hWu6c
         NQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752674; x=1795357474;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QzzvIBZ5m85jb8a3T2vbOcaHxM8nqWRH2JKBq6oOx8=;
        b=srWj5Yk6zyFr4SCgv82t+Voe73hjzfUjJsR3Bz2okVBToU8vmgU7QVHu3xsANKLu5k
         Fo/TjgviR4YzCr23SxAwy/ojray6bOcEI654I4w2rWl7pCw4mte6tHfohy3Y8Y8nPrB0
         1WKNC77zvN9Y1ySAP4X1wgfb+/JwIe21ubQrZAyW1x8DdsNL8IKxViP0VzWl9HYPA2hm
         WEFjwUbFPtJKJy98ok/FOewTV4Q5G5RMceTEDfdoA5D+ljvG9/rr423rVi0jblcyRHLG
         gDuFMKRBoNX2HWRqhoGTtpHU/NrywbYQdFwIQLta4AwGbp3G2mELacBEi9TAjxSzvBDZ
         TbxQ==
X-Forwarded-Encrypted: i=1; AL+hErGdzY02LYgnc10whG1fueIV0M3vAyqsdw1P5ATi/Eh3z2jU6q2gmf6MPLZz47d387qgSwBJUN8Mn8+9qVhVXHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DnJjJl5F0I/jYnUav+L6/fEttQDxsDH3zqcS6JRAQrXTowezV
	+fQ4WYgV0rsge/YE4UW/ZIItvJNNGIvpkPP/ebyp97o7ydkbkx5HYRt1
X-Gm-Gg: AYBFou30vS9UcDgZXEIaqc/N/4aODV+RswyFs73FpMCMQTNKq9cWOhkNRbW/Jp6pU6x
	2iy5TjqiM/UQ41LzchiEQOAOZ8rjKTzhl8ogSlNCgLS0DGEFmyU+76PZrlUejSSNMT06aVHxL8K
	MTC/WPmErZw56GX2aE3mI1vlm6hp93Nk4yk4alRdGKFrdj++/pwBKYNjKq6DBaJTAtZj5zIZwni
	fwwmAs/MmJTAJ++aWxntvc6knw0qleIxjlK/y6kNTBxNk0rk9kutI2T+kuG88dVsqdCa8UzUF+r
	7gWCA7JWrDy9oWtEttrW/HcTHoG30eH6xMkbpZMi2Tw5CT8jHc4VNxudjtZ14iScoAADYgbLD+r
	6EVQ4G+lUiv8PzBiD8dWFvmfICAjW+Mwr4aPvhXtgaQdRkvLa3w/FL5/HLwoXuwN6fIM9xUiM+w
	aigC0WG3NkATcCPCdBDwK5tklCxS42pJDrdG/tOHA+TTvdQKENX1BJOljJds/Fhr8Uen0Gm2mIT
	rtDzx09Ppsga3R1oVsJdD1piYxxGOa/zNBoDhXilp3Dh6mytQGIyTyg4Ihi3aZpPwz0wTFnRuCU
	A2cT9IuU11QcmAzP9W06N4otCcpei5wkxMPrU0Zqqmdkkpbfc+Sty65xjO7rNoq65h7cokPd1v0
	6FOqTATPWuo8=
X-Received: by 2002:a05:600c:c0c5:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4bb55a6602amr130912825e9.9.1794752673813;
        Sun, 15 Nov 2026 06:24:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm318854915e9.15.2026.11.15.06.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:24:33 -0800 (PST)
Date: Sun, 15 Nov 2026 14:24:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Daniel
 Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Aaron
 Tomlin <atomlin@atomlin.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-modules@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v3 0/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 and KALLSYMS_QUERY_BY_ADDR ioctls
Message-ID: <20261115142431.1587690a@pumpkin>
In-Reply-To: <20261113221248.3535369-11-wusamuel@google.com>
References: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Nov 2026 14:12:45 -0800
Samuel Wu <wusamuel@google.com> wrote:

> /proc/kallsyms is the primary interface for userspace to query the kernel
> symbol table. However, resolving even a handful of symbols or addresses
> requires reading and parsing the entire text file, which is often several
> megabytes and takes thousands of read() syscalls.

Separate from this, I've wondered about separating out the /proc/kallsyms
code from the code that actually handles the symbol table itself.
The two parts are pretty much separate.
IIRC it uses a static function to get the symbol type (which does most
of the work of getting the name - which it also wants) so it isn't
completely trivial.

I'm pretty sure all (well almost all) the changes will be lower down
the file than my changes and won't cause (hard) conflicts.

I've been compiling kernel/kallsyms.c and kernel_kallsyms_selftests.c
in userspace for testing both, but had to cut the bottom off kallsyms.c
to get it to compile with a sane number of definitions.

David
