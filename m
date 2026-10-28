Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793201687;
	b=rVbRTR74tnkeYAnR0eV7e8AvQp7d4GAw0WQzAlN8gA+0COJK2emPDJBc9FnARTWFIGFc
	 vv8JdPJFyXJ91F0Ou3E9v7a3bRhkn5PNvdjwzld+56Gg/AachhP4aA9doe33RaKzClgyU
	 n5INiL3JcE+ZJX6U/g09XD/Po8QMJUbXjhgJOGEhoqJ9pP4PhEF5WFfglOm84gCAXDxQY
	 qF88erPERimGqbn9PV7uj5b7r0uy7EPd4daphj6iseTNuzTnBjGgsIE+ovdaM0kTO0QdW
	 aBk4ZEM5FY/rrACJ9k0GYGJLIddao7ZOOGbiSI8AbUsxm3E1ITC8MvEUq3Q8lyUrHrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JNFgtKDp87voFFR8yXktG0LWODrSokHg8hARj7IkQYg=;
	b=VAad3vghLy9dMMtjqNx4Udg0fOb4LcnHO8Ijd1cBkreug1DXWqmbF06BShVuZTIPC1WQ
	 LYIKZ7l7RURDoic5I4BScYCobwoD/j/FktvFr8TGr9DDzwcQtbaudCYdUmO+zm/O2kiJ+
	 JBMU8Xq6RlQoQJVFXuthLmYzeqHZLmaXxByJLkViqWFvkdziS9MT5oJfLhjLMz3yzFnYn
	 TkmV4Ev876U8D6OnzCCMtd8aJZtClFVy2qYWTotkILdDueeXHo0FQf13WC9kFg+GqkFP4
	 YXtzIb2vvFf54+6Y+FUQ4QryxqAVI2Q37bqLsvWzIATCKm4ZnLeCDTYBv/mC1289ChQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ef7UxKVo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A483606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 15:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A483606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ef7UxKVo
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-845788309b4so549813a34.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 08:34:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793201686; cv=none;
        d=google.com; s=arc-20260327;
        b=Qx9TGfv3yO9xclllUeNF4hrfudlMwk7sWPQ+UG0jXhyC7EfNjCvnF6926OqpHG7yda
         yy5rlImwOS5uagPmE4BONMgq0poq5Mwadcum6Znr6cYiRJ0E5yVFaH5EWzcYLtkwnPPj
         +hP0YdGvmON6uzi+QkbVCfU3ygOTr84AR++hGsPgiw5LFTvwHjK/HxzIQhiteeCbOmfk
         Kf3YlQIt3Yb62vhoJZXkXiNvZBwwXWS01FbEIsNkBxe8ccOseNOZld37VxWwjuhMVqa7
         wJmg4Rd58x4RG5lgZdCe8ELaC/3PXNF96JmUBahGqhEiIkDrPfVPOWyrqmdAG6IrkXga
         RAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JNFgtKDp87voFFR8yXktG0LWODrSokHg8hARj7IkQYg=;
        fh=jncqaoeXzB+JW55o2N0Ymnt3uSqAd53+bdSFjknylr4=;
        b=Yt08VeQxRnkvvMCzYeb8LMiZZf8q/+2XAHodScfy5/xoKENUtlr7euKLBJL70IMDXs
         2mRc9SCnGt+cvB75q4DIrMXEkG1z8gtdX2O1LSNh26aeS1ue/MbvEtSht9x0LI/egJ9S
         v1n/cKVSL4pmQs7bSFEUjlcyyVc9QHTeBBljjTx4MtM9bo9eqbyw3IxV+c7qnSOsyuTk
         5yVJtcSv//9z/05NteKHEoJJDg+XDquuv7gTocaxqhjeLKHJh6hjCaT1EpHIYg3P44HJ
         G4y/2QxgPWGZh/BaKYVa4+/Je7fjSvyZhOuUwI8dYu3nx4Q7XfSkU8OvFomvNoyd8Z7m
         0dRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793201686; x=1793806486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JNFgtKDp87voFFR8yXktG0LWODrSokHg8hARj7IkQYg=;
        b=Ef7UxKVoG+4kGFp5uykkaUkiMgN1G+lhfRLa/HcMnDuSiZ5htbI+UAqy9Z2N2Vu5x2
         AH+7Nu3jLP/OrYD/VNcTT6FgiRmooO5freMk6bEYmgd57MDL+PIpGjMbnDuc0PsaShxU
         5/3RUNC4r0BI+PdMJjPh9SHdp3hIH597VpChTatGqzIJSzF5YmFX4jXsJFMoU91acv3O
         Ue52hoB1ApBbbh+Buda7XrIKg8nxxtjLMGB26NWAc+iJw/l+fGBuodmpm0fGIbJAA621
         BxIqhM70bRBAAqgrfBdZuKZ1qmZlS/oXwRLDwosHR8d6uPolfMNbRlKOIi4wUlj1PVRO
         cGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201686; x=1793806486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JNFgtKDp87voFFR8yXktG0LWODrSokHg8hARj7IkQYg=;
        b=oEH3L9fSZzYlqvU7VEVXShP4buo63UXkGRue8r38VF2POpHN4YvG1PGLk5VvFCNeXa
         2fSmSsCIcreG/hl8MR8rKQmC+wwn7QRc0zhGAyI4uOTqg60CmBGa/6xcw/KWM7jkedra
         qXRcRtcRbAtmnxOEg3tBXFxiicdNKlOwxQ0tIDb0zu47SXIr57NV7M4THcb3g9CQlw5E
         zl/2XLAeQjVmSPFVGEXhLlWM7mWgURIjRwLZCE2YS9zbfVtEtkxjc01JcywlqI6ZA9hn
         RCaT8RsY5b8xWA+xjM95PVPGIFUhl77rxVgWbIbQ/5nVflC22fesLhBaDaSDufn9xJja
         Ymbw==
X-Forwarded-Encrypted: i=1; AKwUvBw+77EjgRYkEzFb6/k6ED0FA1GxydC1zTjx3uOPyKmvHdR/5AHa5CmxiLL7GdJ8r1F7RpVDn6dJILljpQpwa0s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIwmSDNuUPphis0ZI1Ujly0A9Xd6wGpJLgbkIgqMMlEtDcRVuQ
	109kaNC5dWC7MHW5Y+hlFwtC1FWl5QOrMnQBa2xArgTaQ8U4gRZqKJmKLsZquZvLvGA1rXlgcRB
	vurHUA2w1Vm5/Do7UWOxAlw58r3G95ns=
X-Gm-Gg: AYBFou2m4pa/dx+idY0whaekYaKLQN4Lzf8myeKBnSKG2a1YwzYdU7miUjoA2GEdeGm
	1mnuSk/Vw+MGsWVchg0TKY5QdSbX8WaVUejH+2+dGhYm/6YxwaZ0ERzIHEJxuVjFuSbxqlsHThC
	TH3lcCZqbGScwALe+B4tkR5Kao5m7jdQmqrg2ohk16CHGMwym41YaEpkalwGGthXVci7/lzsZkq
	D+5/BG6trn+OoIKVOq/GIxHTvaLkambYXoTsLWD25yB1ynwd0N5y1kRr5Db/uIiq6ESY92ozIp3
	Upmbs/yo3NCRx9Hy6vcAGeP7+KLoHaw2hbIiVO3jeNgpRxYFphmifaTNUAZHwzeX7TVsSDkc+7r
	MSU4imkaX43D5kJWUAhuer2eK6YEtr84DqPo=
X-Received: by 2002:a05:6830:2304:b0:846:e5a3:c8bb with SMTP id
 46e09a7af769-85ac012e9bamr2225801a34.15.1793201686073; Wed, 28 Oct 2026
 08:34:46 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793094611.git.chris@chrisdown.name>
In-Reply-To: <cover.1793094611.git.chris@chrisdown.name>
From: Andrei Vagin <avagin@gmail.com>
Date: Wed, 28 Oct 2026 08:34:34 -0700
X-Gm-Features: AclHuK81v527zBLgjPgT7UgeAn0ZRsnw4w8kJ2Fr9s5y5HrZvwNULUli5C61ZOA
Message-ID: <CANaxB-zEaaDaaR2Fszx0D4TAcKAapOfcxQ2MzZbFVAhR2n3SOA@mail.gmail.com>
Subject: Re: [PATCH 0/3] mseal sysmap: Choose system mapping sealing at boot
To: Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jeff Xu <jeffxu@chromium.org>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-mm@kvack.org, linux-hardening@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:42=E2=80=AFAM Chris Down <chris@chrisdown.name> w=
rote:
>
> System mapping sealing is currently a build time choice. Hosts which
> want it and hosts which need to move or unmap these mappings therefore
> need separate kernels, which is not ideal. Let's allow the administrator
> to choose at boot time.
>
> Chris Down (3):
>   mseal sysmap: Add mseal_system_mappings=3D boot parameter
>   mseal sysmap: Allow with CHECKPOINT_RESTORE, default off

This isn't just about CRIU. For example, gVisor does not depend on
CHECKPOINT_RESTORE, but it still needs to unmap the vDSO. Other
sandboxing solutions likely need to manipulate vDSO mappings as well. I
think this toggle should be off by default, regardless of
CHECKPOINT_RESTORE.

Thanks,
Andrei
