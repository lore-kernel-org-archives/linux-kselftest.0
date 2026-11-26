Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795713687;
	b=QKPpDwTh5Jd/HVwQ9EC5lC0iUBbYaesXWQ+mVNuIUiYxcz4zKn1YCvZAURAfznV+CWe1
	 xIkEWOGoWwoGzXp4o4J6yFplbKrqEns8x5gAyxWjCI/yj9a37VYw+H5aoVqWlwNXG4pqb
	 GyHKCjgoAfnnOQbL9JMUfOiWYoXDIP7+oGFKfV53NxBrXjXkBiPCJQsVGm4hZimrj3n0F
	 hcOLhYgOyg+WQnS/fuI0sjM5aD1iGXRpcjEs3GpTPJU9Uge3V9J+6NQbHiffl0FovFBdm
	 NfdJqGf52WSmFXa5He3Fm/esum15++qgZ2rMdY5O+/9WRfhqMcS9geXVHbLRmEBIO6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hFMU0WQIu/Khu5nkOekEsJ9G7/wupBV+7k9T9skPX/c=;
	b=ed6mvPVkoGrEqkeXMEWI/LQ9DGhErQy6ZDCPPPSJdWsKwW4C8PUxjYct8hXu/i2WhH+J
	 gchxdeKqcNiMsD2vAVrTf9+ToSdkErkBh79xQTxPcZmVM/oN94LF9qflqNABSKeGahg05
	 JbtJRzdCJSGOpl0AgC8Qm2zlkjE1PtyIAge19S9ul4RpVg2kUrDxRMebL5EnJP3n/GxDZ
	 2+ZRYhEebF6wDg6jE9jcl0tmyQ5WzE2Q4CNUqruK6OqswgPc/KkaGv0gCZ590827UlOLb
	 sy5uY5RJIRXbuZACQywCstrm5r3MjFqE8GrqZPHSHbS70NOroIe8/u9J/8p1ZmysBEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eAUyELCh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EBC606A32E
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 17:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96EBC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eAUyELCh
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4395d31228so1231595766b.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 09:21:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795713686; cv=none;
        d=google.com; s=arc-20260327;
        b=EvAetSSRXVkXrcBez5Llppt283/+wXqrRtqegN0pvdCIwyNg7EzUqNqGxgeUGK7aX7
         CSFI43yLy+xQIGPRJf5yPKxQuBKZwPwCDAhQHEDNimdhdWNZYsubfiNj/0YKy1Kah0Sa
         hxShTw2s1zqZZ/FJao+/9lpF5n8/ZklnfMYA/VelShreRp7uK2kzwEuNOeYqm9KKnba7
         V95G+QskuslHTkOB2rUccLsxts/+7GVGtr3DDyq/PBWb5ZkjifOt9yT8PGoZYyXs+NeE
         pfNu2YLUgB+LM0gGqdD2ymEF/4OM7zMfvU8fRsMQiXZrKC/7jcuagZLSLodu8sQXbmM1
         SAPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hFMU0WQIu/Khu5nkOekEsJ9G7/wupBV+7k9T9skPX/c=;
        fh=1nEwCYKJbdTrlvkc/Ik9NVal4QavZ258cKvaqe00riA=;
        b=pkeYzTE6Yu6cCzovrZgDT06YvkoC8pzPxBuRmcGUOQ3DzRnDwkwWivd30Vj3Pd8sYC
         1qxqVEiTrvnGS8Z30RtxxQREv8D5Plv2sZ6a79UDUYrPiDVR8x40Nlv9mo2qpkzaoVLs
         r6t/QKWX2qODEIA5xAKtrwUEjcywHT/aKxFB7Jqu0gA02aI9LE+XcF9OPSySxNLbm1AC
         eGW0Fiv6BgUJYn8Bf1Qd1YFXMjnlKKWFaAwWdnLFltPq5i/LrA5KFoHDvQ5bS32a3RZu
         8PkdvN7wkq66ZGOz4Pd8qOH8RBdI5Hqfy78FJxTuNkSRAOrTpt1clF9xRk08SQgcrpNZ
         Z+uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795713686; x=1796318486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hFMU0WQIu/Khu5nkOekEsJ9G7/wupBV+7k9T9skPX/c=;
        b=eAUyELChNxN03tFWhGSn40N0o3gjWO71tl5Ghcmskz8b4PGVkssqVMVbtcP1ufdgYD
         siuET0E8+b/8ouzgAVqs2MIlCaW9vlronDx+CN5r4hENRnHoThYegScR0BXwbEXaFWVv
         vbCqNQk7tkQOJoCj6JvZkgF6A2MrU7JYcLhNOXZ1Xe1EpXiHSTAa8An0988zX+AY8Pep
         2FxXxxd9Yyf1K1seELTv3Pu/d0l8SVkab2alnZfc1y6/i2PE4nJZz1OmTUDwKwoKvPhp
         1ls0QPxv3w/sWpsW686NeXrfa9MjQEe1y8xx6d3P6ciusGwK3AyEX4jEpfF4Bn9DZiMX
         a+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713686; x=1796318486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFMU0WQIu/Khu5nkOekEsJ9G7/wupBV+7k9T9skPX/c=;
        b=I/1W9QHwHQhhSw6IAJJFdVl1Jo1X3p2WMmz26PzwtKcrt/xIXqelt4NUo92N7BPMUu
         5bjiu5VhqYA+aCfxeM2VnmJ8QagzinfxbzCsBY+ktxQM2Ng4P+6PNBF/pkhAMrAFZJ/m
         9kRcbM6UJQlGD9UH8TLOWulRGcAsD2tweSZvi6GBOJUR8HK1leO/N/J3WM2AMi9CTKyP
         33PyHf2LQXyDflTUEBgmyeg42P1DO2vlsAPSKgHjaJ1encixOcdmKD1pLEOnKqmysoCV
         5nrglb44gk45KN5bmo+d7Mgj/ElqOvxJMYVmembyLOq7mVi5yhPcsGgbPbs3+oRksMze
         SoIQ==
X-Forwarded-Encrypted: i=1; AL+hErFoSC7vHOEetnEZDkTuXw0AA2e41lxGqr3gbaR0jo508THjr7+WIrMyMNk8wbBER8EH88GW243RxOcMG2A4JiQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h/VyVFb+JSEshkF6wxOHnJLTD1ZSSOuSuIETbcTrXWQgUMNxR
	wuWgqZjI3UIW4GrFAhiB5fiik06sJ/k7AtfXgZ60AYrfxCIHU+eVagllxuF/TOqLAKgMEzGaKaT
	o2IquJ80xjnyFix4vKqlTlwrQdh+CKPYXyBYqkGZp
X-Gm-Gg: AZFdTZdwVaakjAQsVr7FwV44//AiI0apRl1mxujezvvgs0qxzWrV0OZ+1lTBgrseZ/y
	1tnBEjUC3vUnJXVIo4C4IqLaBEwkQMrL3d50bV3061OEHn3lOIp3DojENsMmCJsd/TskZf7jWd5
	TnAnzZNtuxTicnF18dmT/Jxr42FKQB4B1HuAhADSweSILWen0wHejDtLttHsUNPqB6/lpWvD2TG
	++Ey4ASGvRQ+zPHoAKRGPw3b5LD8V7kilkActGIvYOWd1arstPIZyF8m0OL1bnW2pEMp1ABhIc1
	HY4hkWxMPniFcnzsbVriFJL8/SZdRt2acw+Mmyb6ZFgYvXUP0lW/EEoM+m+OyArL8QlB43mtxNH
	HgvYgLYSxlk0/4rDDjpSYevWwKZNHgHO/V/A48LvsNclg685hktEpTZNdY7c/o2Znk+Vyzg==
X-Received: by 2002:a17:907:9612:b0:c2e:2baa:a642 with SMTP id
 a640c23a62f3a-c513a8845femr1932673766b.30.1795713685324; Thu, 26 Nov 2026
 09:21:25 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-14-wusamuel@google.com> <a40ad738-cb7b-469e-b67b-353b64622dbd@suse.com>
In-Reply-To: <a40ad738-cb7b-469e-b67b-353b64622dbd@suse.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 26 Nov 2026 09:21:13 -0800
X-Gm-Features: Aa3M54rqUPDLnBBM9ls6-9-k9q7s0wsA5-hr6KgHVGGraAEFEEYG4syBhxuXwjw
Message-ID: <CAG2Kctq7Mb=pb-SFU88eRA1cp2Qt_HJ0nADY5fET7Es-_CcCOQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 ioctl to /proc/kallsyms
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 2:45=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 11/13/26 11:12 PM, Samuel Wu wrote:
> > To find a few kernel symbols, users such as libbpf parse all of
> > /proc/kallsyms, which is several MB and text based.
> >
> > Add the KALLSYMS_QUERY_BY_NAME ioctl. It finds a symbol by exact name o=
r
> > by prefix in the entries of /proc/kallsyms, with vmlinux matches first,
> > and optionally in a single module with module_filter, or all modules by
> > default. Each call returns one match and its position; pos + 1 continue=
s
> > the search, until -ENOENT. The output returns the address, the size, an=
d
> > optional name and module buffers. A buffer that is too small gives
> > -ENAMETOOLONG and the required size.
>
> The kallsyms data in the kernel can change between two
> KALLSYMS_QUERY_BY_NAME calls, for instance, when a new module is loaded.
> Should the mechanism provide a way to detect such changes, likely by
> tracking and exposing some kind of generation number, or is it
> unnecessary?
>
> --
> Thanks,
> Petr

I'd like to keep scope of this series simpler, and I feel it's
unnecessary for now because:
- today's multiple read() of /proc/kallsyms have the same race
- vmlinux symbols are immutable (I imagine most queries come here)
- ioctl is size versioned, so a generation number can be added in
future as needed

I've documented the non-atomic behavior in the UAPI comments, so users
should know what to expect.

Thanks!
Sam
