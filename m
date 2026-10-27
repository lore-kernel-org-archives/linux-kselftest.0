Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793136731;
	b=MWSzkZtcqBdue0DUjPu9AgujQMoRgJyiiwIIV3sPU4A0XSACoQSlDoeO1qGjyl3YiiQY
	 PNUsbR/U947w/CRROMJf2nJBtfln6EfBDWPaQE4WqiriATEJkD+I1foyWhjT2m/EloG1Q
	 wO+xwEQicgHYCcjgUz3CIOYCpwln+sJaFuhq0VESIrpAs41klsLmE6cHTMFfdNk7OAGn3
	 1LfmKY5+Km9sdjn5aW1klFL94UnnrpaRnX/vqUtox0rM4aiL8cx3PCCdqh9bpx6npGWXk
	 4tIsrD4R3ilM5dxCL8wad60xrvSlcrrjgQYaedff8gaT7j1m8FOz5mW7h4fNUs79tVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QuhHDIMVu5WYcDA1LFoQtTkJOtLD/1lu0y5o2UH4ICo=;
	b=pZ2oa3L+ncg8aAe36+mav2sjMt+8bOLmQIb/1Qk2c7HyofVJY60waxW3RO06DZMGM+wd
	 eETwm9Q28a2dkeafOB7RNlzBA3rX2jpav3+B1KyC+PzI6N1kmO33/9cqu+LjwGHpwYcKN
	 2ddjmG+cE3K59sWM2AQCBZbrqWl0Kb0yPprH+iPtj/oulWmyDfYls0gHzack2JgErv/d2
	 2AhruNPoP9Bg6evqtDPmMkMpa8tSHUCtkeO8OmIs5HbjxjYRn5mbRHMeg41De5x55zWPi
	 Y0z2OfbFZXBlaG+AFmti1OccVZd9EMmVSpR4TJkX2/imc+dwYUX9Pp/M+MjNtCy9QkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S4q8x2rQ;
	arc=fail smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4C9606A320
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 21:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C4C9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S4q8x2rQ
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c40f29667e6so43701866b.0
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 14:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793136730; cv=none;
        d=google.com; s=arc-20260327;
        b=ib3iQBtJDzdPEUMzCJIi7DuwDF31EiKSM+5AGUvOQZo8NaWXm5v+DtajyGUB4QnEsX
         euJ3wQYqay6T6C52HUo/DOjkH2pbRtvfhPM7z4aaUg88p9KyNqccHbnifGVWWcG9FI/8
         0FmCtvVpgexHm4iPNbJeDvjo91BQL/LU3T2TuAzm5OOTDIiIBJ1ZqrruxAS3n5Mj7ieC
         uLaYeqUHpeAI0j49b5mMMpQwXEUSyySpzUwR8i2fRbqailJU1ImA0R+aKrMA20RnuuTO
         TplziEfB/NZgcw4hye32rVAVgtOuV3GQcSS5zEr+71kBh8aYmSXmS/9vtNSRIm34mWiS
         pJvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QuhHDIMVu5WYcDA1LFoQtTkJOtLD/1lu0y5o2UH4ICo=;
        fh=wHpFKnkOcefjYOby71SypUCb3JVqqLVz/sGqTiwywNo=;
        b=FE3eDvkCc3KDQqYsHzJj316dZoPfX5w8DXys6y3QMDLVhVu2PYdMB4jki0RmJe6cCZ
         5D+bEyTZvGrv8zHnNqbd29jDiW8SDh8ixdzzXdw3fZYXKtB430/7a+/IvOAcI6NYMRRb
         WuvGjUWFo9I4A3oGCzv+YMep8+0BMemERHQ+o7dLBeMBrhShZI4uLB3lLB1QtCqct9KN
         s1Rv94yKO2b64lIF99QdxgfW4XfLCpO9occ3C7lNXmUqHdhWsVk2uJ5X7R8nkh+lgnBy
         oX3WeoFLh4OZ3rRvcaiEZW9FFJrhVM1vU0CgDyyMyJpgXVvHcfOYbBnz3gE96wjkV6uZ
         2ggA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793136730; x=1793741530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QuhHDIMVu5WYcDA1LFoQtTkJOtLD/1lu0y5o2UH4ICo=;
        b=S4q8x2rQcUgbgnB2taH0pkeX7W824XEztlulInCkstTN98gFWl50fOUHsLcMogIWem
         +SWWuuIF9ShMS36X+rzUjPd7KU7unYZs0GbPKlZZc+H50ZsfMxB5kFt9pJF7G8rQPafS
         Yj/Qmgt7zp+vc5tnLKCYLsenY72iRxUoBzH1XWuLuKRRylx2sc/th56B7WwrxdvuqIlj
         tisiwgUTXoSytzPTLshRseVU8MV/f68st3yxUw4yxkUyz/mWdH6jW87vSpFl3DClcaci
         WvuRRwXmAgU+OVFLKqPNuTNITzE4a/9IGHAuQqBbyFGnX3jJ2y/T3HqHGFlomaAJHMvR
         E4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136730; x=1793741530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QuhHDIMVu5WYcDA1LFoQtTkJOtLD/1lu0y5o2UH4ICo=;
        b=sYzi01i8iztRrue3naCuoyGbTM2stkeCXCaUwOXPxNGUT96knbWX6YMJIYISlwjUKv
         7QtG6KFMyPqMlVu1z8Jn+kKGD3VPh7bDaAF/wf4ZRK7FejLaABAUjSJkqb8iKedS3tZG
         TGdvNxXRfwfztOASJ0+7ylAKt+8437V0ihFncpLkkuK4oHX3adDgdhVIO3uBcNFlPW+3
         VEI4U7ftVyqxejS5+Usaw3/vjp0ONDzb9rKEM7rORnv1yfEbnm0UPYGH6AHktypC1GEx
         zu9n9FULSa6NzAm74wh7dxm3Obfhk2e6iDwK4Grc225C+D5TULsr2bgQyDEP+MV5+uJx
         hkwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQ5eDAj78ijdGE/AfRvo13pdQd4LPXxuPZoZcDvEYZzAsbTOFLYdwyGkj8q+akIvWoSvpt0V3LwiBhfSklVXE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAoJRRc8l1W1EbyJ17o4sy9hHGAi7FHtkPv2rbjQu7TtgGd8Jz
	YEavxx1yRgVREfaUQvzCjKvzYw7f0rU2kcU9gTylKyIPGkbSQBkwIuAQjkVoqP6qiDkPO6XXYzX
	Fl6j8xkWYtY05L/CaCvSTBai/fQJVoqIdiaOHC6c9
X-Gm-Gg: AYBFou1fkd0q/D9HjYQeATbFGUlSqJNoVUOIkcWoVnzqDwBQAHEwrHpVkqdo1AChqKW
	G2S7+JgbmlqHST2BFIJV4gvQTLOWAYzTsc1N4taD+eeYzTSk945a/nEF9xHtyCHAz5BjcFUWKaH
	SQprg3rp45ZHLo9C23HL3qOQ3rFh3rC/Ud52nO6oPUNXy9+k5vV53Ara7woQWHUBk1EmEgr/Xab
	26D4sX52NrM32OUE78nnEP42d6kq4kMYkT6VQWbCac7Qy2Tfx4RTvIYr1de51087F/+cSAln858
	CulllipN/yxiRECVQLED6THSvOc1jA+gWR3PGt4ek+oXot9OXF4KLAvqSt5EFTmPoFtY/zE+n/y
	XiEwxDsn+kv/5vnTb5+F/TE2BK7OVSfb94WbKVg5JMPbN7zxusq/Hd0b7x4of1Si/NQbSgmeTR1
	jZo9Otnl6gC9iK
X-Received: by 2002:a17:907:868c:b0:c46:bbde:734b with SMTP id
 a640c23a62f3a-c49bdf39dc0mr39237466b.32.1793136729307; Tue, 27 Oct 2026
 14:32:09 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-9-wusamuel@google.com> <a925a7a8362e8e9aa0270c2b252aedcc10694857db29c31f66d6f7c5ba89ac08@mail.kernel.org>
In-Reply-To: <a925a7a8362e8e9aa0270c2b252aedcc10694857db29c31f66d6f7c5ba89ac08@mail.kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 27 Oct 2026 14:31:57 -0700
X-Gm-Features: AclHuK_3f2GFNzZ4NDx25anrHi3Bvdsj3Ks-ELoCN4hDAJz29yzPop2fh0fcApc
Message-ID: <CAG2Kctryf8+44WKQzUOzyMmtL4biW3Pbg3Pntzkn3Ot49RhFow@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: bot+bpf-ci@kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, andrii@kernel.org, 
	eddyz87@gmail.com, ihor.solodrai@linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, martin.lau@kernel.org, 
	mason@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:51=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> [ ... ]
>
> Should the BY_ADDR path return -ENOENT when kallsyms_lookup() resolves to=
 a
> BPF address (for example, is_bpf_text_address(addr) is true and the addre=
ss
> is not in vmlinux or a module) unless bpf_jit_kallsyms_enabled() is true?
>

Thanks for the catch. In v3, I'll update BY_ADDR to gate on
bpf_jit_kallsyms_enabled() so hidden BPF JIT symbols return -ENOENT.
