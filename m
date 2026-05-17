Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD4A2F8EA8
	for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 01:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778981575; cv=none; b=Eaimltu8GgriWoo5rK1sVGdK3ScFjcuig/oW9PFkjPQP8cUFMryFlLuT9MI/wZvBxu1IJ+9TM4FOboG0N2DEHe+Yve6JzQ+zTXp7N2ZC7AQb5qe4zsp0FpJg7KwAgj8IelwATJb0BznmNn3EA81FTC97dkuLyYrAK+4I/6nMBQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778981575; c=relaxed/simple;
	bh=vM7dpFsn5ov8F0liu1dS7ratbNckjDrhOhCUfYNjLzI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VLmNzhzP9SWUgZzWXjquBLQtTgN8hx9ioCFquWAkabEJ0YOV7RhT7avPKwYx0cME1CKvrbMXH0j+yYSD03CNxr6Yg58zVRofZ8OAwYyOMsXy+ByMyRyybnCabZ0j84nZBXH0gvIDy/fWSP2/cLPM2IhzsLZqhG5uwrfbQsy9DKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jj6R3vDy; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jj6R3vDy"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7c2fa14795aso4944507b3.1
        for <linux-kselftest@vger.kernel.org>; Sat, 16 May 2026 18:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778981573; x=1779586373; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vM7dpFsn5ov8F0liu1dS7ratbNckjDrhOhCUfYNjLzI=;
        b=jj6R3vDyElkhUFmgAsP82ArSxFYXiHoXyJKfcX+mXYPzqp2smQgMmHWNmAxCNiTcm/
         472A9ueEexelywvD2r2/mnrhVM3U8n2zokAMivIOuMho0cQL8zBcw8tJ+HHXZXtbFE3Z
         lh7UFD4xzoBmB55bWfn0c8trye0NaWzUedfsLfT0KaY275tB9ZP52kASbA8cG0I2raeA
         IyNsHEV7iCXH3w2LclSgJntWq79OGneewy1CmLD3V4sBgZbwAdrORzQKSEUZY3h4nqUv
         6NkHHidkZhtkkcvnuZ3Rpl5X/1in0HP+5DWbdHQkQ4OJwD5Opt+wufLbob9CP/4ZYDVT
         4l2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778981573; x=1779586373;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vM7dpFsn5ov8F0liu1dS7ratbNckjDrhOhCUfYNjLzI=;
        b=ON2QMxt3hKYvOaOiSzvGhmuBK5LiC4Ucg6iFZo4D1D/xaBQv2fmA8m8uCHyQqYeen2
         cQYsVmzS5TAWqdP/VZcils0b6PkOlYIrbqn7LJyMzcvW0oVqPCp56mt30nHX77P0lY5d
         SYqrh4q/PcvwLyfxqO9Z+muFlCy+CipULDcxOCjVulI1N5A3n7jihKD//K19bpkdcvmi
         VKdtETtIGq3ttz9S/WZwEXhXih29EJ6nBxXO6BRXSb65Pxgwuc0bwQNwX3tA7e3W7mEL
         A3eFo+nrJ/RcNhj4XYJm/Ce5F02w4VeotkWsIK8TV3npxEH+YPkuq88YiaePSHCfgutl
         nbkg==
X-Forwarded-Encrypted: i=1; AFNElJ8a9mJpjmKCS5wGEgKo00TOikPFjjQFB+aYxP4k6ScCv0f4KAlXSMWvvZ87eUYQRNYusr/YKJzQ08R8dx1wQLE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Rcy+MKZ7J125EaZhK21aUPPIgPh3AqcbiDfw+eOdVkoRvjhJ
	k1eMxN9igPe8tCHwr6fvY1eElHZ/dBMP4LDeNp3dI1sMkSpXPoVkLRwL
X-Gm-Gg: Acq92OGkCiPhIjF34wLRPBRoMqhakSK+RbzuGAizSW5h1i+9JXuUY/4xaVJzBp5xClu
	JbPzT8rPiwgFTaTmjGcXr57TV5E8A5dm9RQ7ZPJFp8ZJygHxMxkixWrbDxxutg0PycEfRmleUHl
	3kdPE/k6HvoGbhEAm+VTI89hXuvc3I78YxNu8jAkMqEd0JgxSnn9pU91niZ43JARst0kIvKeNpG
	seqJHTTz7CST4cbK7EkoV52d+LNQ3Psh7o9dJsM3/cclh+/gT+hS7Utb3C78wQ++ybVDMJDT1uz
	tlLqAvQRpEZ7GIShWnH5lsGun3XtELALM7R0qSGFvosW4jSKX4Luz9wSrBIld/nHu+Zzka4/9w9
	RSoyQ8k2xw4Qv/9jMxNxDern22yqW3721xKNGE62eKLPxR7j44ST81C9v9XRicMZxBCAUNUezLc
	WC+PJnUB+mU4K8wUeqHZY+MN7yQoN1ZgcVyMozSDvvQr/RSBYkt/bHT7E/majbDtr7wI9htOTVZ
	hWfg/V0vCY54uWwuQ==
X-Received: by 2002:a05:690c:f09:b0:79a:b9cc:2100 with SMTP id 00721157ae682-7c95c00dc67mr115014067b3.35.1778981572872;
        Sat, 16 May 2026 18:32:52 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:4f::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc9bc0dab3sm2342547b3.24.2026.05.16.18.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 18:32:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 16 May 2026 18:32:51 -0700
Message-Id: <DIKKC3RENM6O.24MCCPOVFAVZ6@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [PATCH bpf-next v11 00/11] selftests/bpf: Tolerate partial
 builds across kernel configs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>, "Alexei
 Starovoitov" <ast@kernel.org>
X-Mailer: aerc
References: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>
 <DIJ8QPTPH61Q.6NT4DT90K5F9@suse.com>
In-Reply-To: <DIJ8QPTPH61Q.6NT4DT90K5F9@suse.com>

On Fri May 15, 2026 at 5:15 AM PDT, Ricardo B. Marli=C3=A8re wrote:
> Hi Alexei,
>
> Just a gentle ping, please let me know if there's anything else that coul=
d
> be done in order to move this one forward. I believe everything has been
> addressed.

Conceptually the series make sense, but I'm not a makefile expert, so
waiting for human to review them.

