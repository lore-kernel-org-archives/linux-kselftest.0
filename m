Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872240;
	b=RQSpSN/jY4B/yJu81dHM2fTUj/Uttm1+FjkxixWJRq1zGBElo+OM82u8sceRP5QWXuLY
	 qOobQBdt2Brpbk/Nef6dYjVn+9aDRcbmYiuB9p6IhtDlxf4Fz9/t59MrkoV1nzBJOA0MR
	 WolUGrjixRCIGsFbNL4ozUEXW9Q28PVatoK9GGiM8gkIzrSWqZxTzlerYkbiYdzShZD0f
	 tlwA9LoC2hrVGd9/awTV6fPaIeB9aa3ik6fP/ToSM4IwfHG++WFyZ9Dn89CaBdpzBTj8Q
	 2S80uhRxUFTPhqk29z2sTrP4LPpTwwY5/Lw/eA4k7l+M9xsYviQoCl3hCPLptTZBL2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872240;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
	b=Mm2AHzn6qU5UCwZYzNxhJOoUo7xlHwfMC42vtrY3Dx3KX3Z310SF/ybrGhTRrNc8A2eH
	 qThJQRReH2ZUynY0YssPzNjPopO/+Ocfxs9Xvmb5FlBy/MsG6JLMpBfrEj4R1LOKTL36F
	 nJ05h1AYgRo1ZrWZGe/QBYdz6MiiqR/hrC3LyIPDfdDVFbJpIvIGMe8nVZ14XZ9MqL9i4
	 yod0tr7Vqk0AMjl5ZOmiyJW82KODcZ+oN0X1/Cq4Nu9yfnb6eKGZtpBkhgO/J5GyW9zEx
	 y/Pxi1zQdkU6u5zYe18iQWr30O41CQ1Oo/0swxpguPPbNOHOdmk8okC9/WrUKTOmzKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0ED606D81D
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 09:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE0ED606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c7a0c1617so23249736d6.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 01:50:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872239; x=1794477039;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
        b=r2b5g7nBpv2RxTY34BfvXrVvOWEATMEsfV76uvqT6q8pKYb6BkyRJD74BZf0wo2FrF
         AfYG8OoPcyxoODmRTBETCkP9yMpPPNrkBKnEuZ/ZfILTzLIm/fyZ8CDDMunZ+Dk+7GHA
         GpvvwrkW5OVAT9KTh4fEGzXPtH2cToBJN7TkZE0ayNImV8WxGM718YyTkYqn4S30gGCv
         OlZ0LexhZ/i+WZPqcR2TwjSjvl0H3YTMT0lbBtPBjA1ko0GgVLlhOcNJyIWMvPVdsO3J
         8QQpmOlghwezFYgdpVEm1qOeLD2LJW6KH+PuoW9daMe6aFcyyrwCMCdjieM3dn0NTjHf
         rS/g==
X-Forwarded-Encrypted: i=1; AKwUvBy/3lUiTTNaO+jlxkj8ffFYOE9f9gZ8+et8nOaEAVGVnR7jUF76IyzhNlIq5dQHPQiP3Eyly98AEDcxytRXm1Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Icsuqy+6wl7mPcbN+HF/hIZi3eH+98yv+G1oJUiGDqjoP3859
	M2HgjfhFt34wPBEc2iIMpS3a87iJL23vfWQJPVRkii5Vc1DwU8q/Mip8OaN90NMV580=
X-Gm-Gg: AYBFou0D4mxT0bbdaYFHr8728EhtcCcRVJM0Ol3v2L4mGm596D968gJleCGdKoBRZUh
	U5vW8kStBbHo6iO+/hmugAvEW1jyIJLQ3NHEkyWO8DC4E+vDq1P4zT8i7XLeOO1IofGdMP01ibg
	zg4qH/Xw73y1gEdDWVxrRm7E+Zly8wMHMShgmAn0vzlbm97z8dCNlaPQ8Df4ttjsv7tCFHdnghC
	CDMzqV/I83/GI7/e9fhx3JGk4tBcc7+2jPU7mxYUb8zJW7W8LGwrzYwLEDfcAwRmlIUIM7c6eJd
	K4M7wgzyzmNE/S1Qvx3Xl7PmnsL2nxauJkjdaZsZ7gYoQ3kNDunCF33KNwHPFpMF2Dy1Z59P77B
	Gkd+KM7hDauLtVmTCwl1HELmwa/gGn0ZJz/zlA1n3DLrBAdGTmJnX+qflxW1+jFkS18h3TLOv2F
	p5QtRZVt2fDbFQRbL7ZZPFrhkYa6rCBnVm0np35i9KrnW+TSQaHmVdOI9DtNMrkmfvISH3cvpZl
	7X3E6E0PlBmXopkE0HRyEPxyvXv/RWo3DMOcD6ZtKG76p2JuCohakq9Zl60W7FVYopt5CfPAeYu
	lCkNifU7LGP0FGqqVL9f1aPmeTBtEQGKrDt14ZnEqtc1TKfzAI/dRdfK2JRwZSaz9F2hXA==
X-Received: by 2002:a05:6214:1312:b0:91c:6d83:60ed with SMTP id 6a1803df08f44-91ca4b9325bmr307813966d6.55.1793872238662;
        Thu, 05 Nov 2026 01:50:38 -0800 (PST)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e9a5d0656sm10035816d6.16.2026.11.05.01.50.38
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:50:38 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53653e30353so21918821cf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 01:50:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz5MGY9Ke9/XRdhKhpjR6Dnqiy6Npt8D/fr+Qu3xnGLGSp5reFBryP4TDBIunQGQ+WzNvDZhiUb8Pb4cYL5E/w=@vger.kernel.org
X-Received: by 2002:a05:6102:3ec5:b0:7cc:2bb7:131d with SMTP id
 ada2fe7eead31-7d072baa484mr7324212137.9.1793871885062; Thu, 05 Nov 2026
 01:44:45 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org> <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:44:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
X-Gm-Features: AclHuK9D-nB8icBns0zdoQH8fV1cfUPJ6LOey8o_VlUZpDIGqKC4cFf8-j5-HdE
Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 10/51] zorro: size the proc files like what they serve
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 20:18, Christian Brauner <brauner@kernel.org> wrote:
> The files under /proc/bus/zorro hand out a struct ConfigDev and seek
> within that, but their size says sizeof(struct zorro_dev). Say
> sizeof(struct ConfigDev).
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
