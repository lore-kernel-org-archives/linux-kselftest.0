Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871287;
	b=LMvpBWnTPX7HCy7i6Sgb5VVcsoIYwe3gbt+r5hKtFxFDGd0kdvyKXr7kaHOfQwcaYr88
	 g2b0hfnJ+XPjgjTJJFDRcc3Si89HwENw3R/5U8d/e12KWmDaa+cbs+1rzIOqARugloFcF
	 t5/5ygUTKIJlyyPberGS8PRZEViiHRuINUTA9x+rO5PHnVOL9IVK5aCMdapN90RJs6x/B
	 yXTVbb2vSMn4URED8p3bUJRpfSLBqw5ob+P0aDrX2ZAfX+/Yly40y3AT20X8CwBoFcYmi
	 QwWn+Ry8wifgvRf0jJS/4+eq96VqaTfS4fqGR+FxkUxG33VUK5cq0N6dr8QDTDyC5bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871287;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DpLYJIWgXoS5zQrloj/RgE/cGCpS34NjW3pzuN6S6xY=;
	b=CG0GyfBC6DfY2jLSLrc0287OgO1roMk1jpbKr5UnscqnZYC0PGnPTigtliDGMPb+Snet
	 Y/mei/EyQAAQnZtWuYnmKIX8JyW1gFfoDyr3of5Q+Md9NsgvGwYeUW309FmYs98ALH/0s
	 dald2vmGwehMXx/bSTVDDSDBdU8zR9xy/qcXiGdl4wVt+uch2yLZjboEycjoBLbKeA/sm
	 x7JPk6DoJNjioST1ZwyP5Wkxwq7GM8q9JBIMcbWuvKxf5AZ1kBOmsSJzwnRqxM58NTuEq
	 2iLNpzbtlg/+HAuylcaJaDz961tUILqPqMlD+1X+lyVar/7+cyKa5F/J5JQ41iPG+AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08300606A336
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 09:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08300606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7c33cc572e6so359518137.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 01:34:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871286; x=1794476086;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DpLYJIWgXoS5zQrloj/RgE/cGCpS34NjW3pzuN6S6xY=;
        b=Rw5Qr46m+aoZupeN5jLMUheBnjomojUNwEGksZIwBoHGIwjhWZJTt0P2EmqWY9BW9R
         4YPA8F29k4I1poNDk22VBDPMr+rXU5awUADIQXuntIzdZ9sOWCo4gDixSlBpciW0gTRn
         JT4x/5cZVXrX3mfIeNTGypT9xU1HJphas2zFXmUT16yZKoUPfeJhGWyQjeXJZ0m/peHI
         3xR0gNd541E0K3fmeDs8mtua8ICINFMWJm43jvJKB2MiDOTjqHq1cKsVlGO8vVClXvV2
         jw+dpRENAZ349DYvDZw73+av4TanXCvv5njZ+wLCUH6pzjG6j/7F3bQdmSNk3HgIsjB5
         UZBg==
X-Forwarded-Encrypted: i=1; AKwUvBxd2JuOC6puVBgyPMBmmro7lEEJEom6hCTmREE4PQ6fm/tBQMTOjig0YJ23xH09W0xqwANcKT9vXiUX9aA62qo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/J/goqEPYsla7TZhkBB1lIRUAb11s+PWEam4Mjui+RpHjOBKSb
	aqAL6biY9HQ0feibh4p5xIdl2TsZ/0FlQ5DcKsyxIIvd4/4Wi5CHvmvf5fMK8n3wb4M=
X-Gm-Gg: AYBFou1X42vdZvUM7vd+Seek5tfvhTYIMj7TA8tDSWEquhnIAwdPf/qfyH5UJeofCvY
	y4tFwYrmAvw14dsWQDKeeUnQS9oyAeb2xOH7OtCFE+jUb34ICUVCMoiIR0cCrARh2ZN92NDgGrk
	l4LWyId8HYupNrNDPqYtuH+UM3e9VbKNwvnydMYgcecUkJTuyfXqYPU4Bi2R62ei7z0YNeP9pno
	ykzzd5VHrdeiz/iphPiIHWZ5SDPbppmaGjxdEyE/lDh/TlrkcEgj4AnbHQ3DepP8aOzNBfPgHQo
	SGhkXlIucxzbjDag8cYs+MBqDuJuxf5TnhCmXwuCXfWpj8N8oLRTxNXkcqJWzw3G2JW3WVrbrbi
	pxzVcuetyjSLsPQe5fFTb1LuD5AJ8+9gSu/q8sZ36xaNuYIlmFXcIqHAiot28lzrtD1LX2kaxeR
	nMgzaEZs8K3JUjPaji2ABRk85iPOVfD1KgE73ZjC7MFmeymDUCEjvj6cgTZSD4FPMFvEHfen3aZ
	UlwN3qYdwPmCd1HHYMVwZM/lYo0gVPG+43PGkM9+a6h/hzBTV0m2I/mdzV738xwM/CD3PfHEOyx
	n5MuAkVWg534TUb6uTBgcB/cDLC87ZzNyCxD26T+0EFT1KmVLRhwirg2wMJBeKTdvg==
X-Received: by 2002:a05:6102:1627:b0:7c3:83a9:edc5 with SMTP id ada2fe7eead31-7d2867d0ae6mr952126137.4.1793871285913;
        Thu, 05 Nov 2026 01:34:45 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d28a073cbesm1320913137.4.2026.11.05.01.34.43
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:34:44 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9912c47367cso342703241.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 01:34:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxN5pD6SQVU8ZVKCvIoY0dlCQHcaELc++HAfcGYX+sg3qsKd2YskkKLj+KLU/6HlLkidZmpi74hxWRasR0iiWY=@vger.kernel.org
X-Received: by 2002:a05:6102:3709:b0:7ca:5626:11e with SMTP id
 ada2fe7eead31-7d286b7fa17mr1126485137.36.1793871283167; Thu, 05 Nov 2026
 01:34:43 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105044046.52180-1-dennylin0707@gmail.com>
In-Reply-To: <20261105044046.52180-1-dennylin0707@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:34:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWzY9YRnGz1Y_60RYP7TH67q8fxi1VNWwkhhc0EUeSCFw@mail.gmail.com>
X-Gm-Features: AclHuK8PYnqOIDpZItZg042mTleQ6jUe2E1wddINt5GGmEiia8n8vhGDZzRowiM
Message-ID: <CAMuHMdWzY9YRnGz1Y_60RYP7TH67q8fxi1VNWwkhhc0EUeSCFw@mail.gmail.com>
Subject: Re: [PATCH] omfs: remove the filesystem
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: me@bobcopeland.com, willy@infradead.org, brauner@kernel.org, 
	viro@zeniv.linux.org.uk, jack@suse.cz, akpm@linux-foundation.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, tsbogend@alpha.franken.de, 
	maddy@linux.ibm.com, linux-karma-devel@lists.sourceforge.net, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 05:41, Hungyu Lin <dennylin0707@gmail.com> wrote:
> OMFS supports the on-disk format used by the long-discontinued Rio Karma
> music player and ReplayTV DVR. While reviewing a fix for incorrect block
> mapping on writes starting beyond EOF, Matthew suggested removing the
> filesystem instead of continuing to maintain it.
>
> Existing OMFS media can still be accessed using an older kernel with OMFS
> support.
>
> Remove the driver, its documentation and build configuration, the
> defconfig entries, and its name from the statmount selftest's filesystem
> list.
>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

>  arch/m68k/configs/amiga_defconfig             |   1 -
>  arch/m68k/configs/apollo_defconfig            |   1 -
>  arch/m68k/configs/atari_defconfig             |   1 -
>  arch/m68k/configs/bvme6000_defconfig          |   1 -
>  arch/m68k/configs/hp300_defconfig             |   1 -
>  arch/m68k/configs/mac_defconfig               |   1 -
>  arch/m68k/configs/multi_defconfig             |   1 -
>  arch/m68k/configs/mvme147_defconfig           |   1 -
>  arch/m68k/configs/mvme16x_defconfig           |   1 -
>  arch/m68k/configs/q40_defconfig               |   1 -
>  arch/m68k/configs/sun3_defconfig              |   1 -
>  arch/m68k/configs/sun3x_defconfig             |   1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
