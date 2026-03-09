Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB242512DE
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 03:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773028230; cv=pass; b=Ad3QQIve6xSoR8R3+PMm4ape99Iw00sLxKxtXxzQGX+F+668GjgNKT5zbg/OwigEEPKd4TJZ3icTWLsUk8Z2km+k5bOV/fCUYGgys2v8WY+uoouMM8LU2OYRx1RRWKN5D0eBZwfTqYgbvju6j/i/hO1eAQTYBxcWGEiLjTg9BhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773028230; c=relaxed/simple;
	bh=RdEIT9ybKdemBVxAis1wIx3aLUIDAFAUwrYBUv8C/Y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pe9cCfemsaHlzn9PM6rf84y9Ngm3535hw9wy9FpGVL2CJKROghcapaLalyiGw+i6ZrGS2Bx6sS+2J8ex4Ilhib4vV0tOjgvZ3zVFQt90lWRJMWfoqWO+NA1PwrPjpmCvy+T3OPbLVGbljtAs6fjxpaeE3XGwIBlM6sl7BVx+cww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BA8WbDW9; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BA8WbDW9"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79881805788so117080397b3.0
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Mar 2026 20:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773028228; cv=none;
        d=google.com; s=arc-20240605;
        b=bRQTxat2dJbV42EUvX+5RpGjJxVBtiFIcT5X+1Mr7a0VdsTXvuuBBH2Fbp2/pehbZ3
         iUwpj11YkjrTSAL9S+G4J1mUzIkpllhBsyReXJrCTVHDT7Wy+culYz+FLJM/DMr1IOVt
         pcCJKjbgPgxze+39p/sFxFPm5JnT2K+C1H0Hlk1S8Xrf4rHn93KkKrvTcuiyc33EhPH5
         FhkR/XL1wtpwCQPXvXxT93QzhDau7uAEXO6FOULUxTDnfRfvVyOTrsdvFkX4zKLKTqVu
         D8s4K9dLGrNDxtyFCMvGaJg1JOWgJAKb0Ydu/cj3oDRrNquCIS/MjB8bDykA8xyzuLuA
         Vo3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RdEIT9ybKdemBVxAis1wIx3aLUIDAFAUwrYBUv8C/Y0=;
        fh=wngNNuGKHAQ569cFyZxgrQyHx6aD/juTxk+l8EzFuNM=;
        b=FY+qhHEBB+znXVI3Vy1O9Muv0JCp/amF82jfby+K9hzvu6ZBwNLpweDobH5l2x9Bq4
         FxTteMTCStuhg5aqpsHGPcqnzHUReuLB2S4fgiDyi/BWzzYqYNMU2YyMRAbopR8KDk1c
         bbYt3KrZZDMYE+tJ7IEWJWeQ1n4igibX0Te1bGClddN+9F8X0TNVH0r7yoMWi5eH8zZV
         +F+3bKP8tYaL3nVOuWlHWuFgvEyf7+lQgKy/7ylb0oFXUsBVm21B4K8POrLF/VsKLX6B
         /KCFmjOogTLfCJUQr+3SvwMgzUvcYv2g+9dj9XfeM90Nk99I7VFUAQWfZKNOzNF38Bmq
         QysQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773028228; x=1773633028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdEIT9ybKdemBVxAis1wIx3aLUIDAFAUwrYBUv8C/Y0=;
        b=BA8WbDW9yAFx8pPXEzjFFIQz9yPXKktwBcjHToCqXlMkSyB4VjsLFbJYo5HB/ViHqO
         tn1YYnqMNQyIbDXZA3VfaxdQpxmOrwLL6wEcQGtAXLBGZRz74+wAcRPgwDtnAQ+E/zBg
         tbsob4jBG1JjUaIkY+Nd+2NOiLUQ4c6nOv/ZBQdlN3tWMuL3sERNKZlNpL0F5zBG0MgF
         YaTivA4ruulby3FGDw+dLYBupCVrGkyljcZIwmrAG5IIzNJ4mo+AB8/BLTl6etrsNDar
         9gMKIHatpnuRSjC8sFAtdoaMYbWy6XuqcNUylw+VpfsNxeBJ8FKQIn6odFKrY8HwJkw2
         lUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773028228; x=1773633028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RdEIT9ybKdemBVxAis1wIx3aLUIDAFAUwrYBUv8C/Y0=;
        b=KrL11pp02aD4xbuCdum0+8H432UXBveKhj0f08IPLC40Oy1Gp8kkYVatisZwvfrcJB
         kZwPkJKdpm6eV1NepIjJYPWL2E4Rts1vUSdx2PeAgZluEdMj2vh92P/cS3CBgUu05oU5
         3MpPqd18/DT1T02g3X92gBOQg2umntaglaPeCkwvmlupFt1Z/nZ0gcfsSHXgjtDW51wK
         Zr/FpjM61oe5MUzeZ+eaA2gkCLMMYkUwZaSqYTkYjID+/Mo7QwpceEXLoex2GyTdpRBK
         06wIp4ZkdOohXEi3MldYdNz+XRbjiheUK8hDm5TiqWHb7goYM+3+9415oNbrJs2ueUf/
         p1Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVGKxKVyS/XKRo34QELXsRmGU8V/zPnY4lWZwdLobRS0r5LkLWhBDeHy9nfHwsJz1+UZLP1Do4S/Be8/XKR3M4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlLVk7suNhYzjEX1U3/bbCqNGbAL+2PPcmq18BscqSHVLA4/Db
	kACTZo6XL7t2nFBiIMcTyQWxYYBBFZ7bxXbdwncaaoGJoWF6vuwS7I2xUzwpPULLSI7JP5KPUoo
	NdOJewrwOILt3zL2PnVwiVJmZAFp9YVI=
X-Gm-Gg: ATEYQzx/LgV74mIsKctq1SmVj96OUcM6HzgCgtZlzZRkD6h7GPVmFKPhWN5wr/NQlKx
	Vlmeqoou+zrPMSRoaBprbvTZb2VwhXm8qBqKIpsQlfMCB0nW5z0KvH1nqSsGoIDt2scL6+jVpU/
	FBKlhDqdZgqHL6uOgwCBErSEbbMlDSQD3dCELV//C+idK4q1tiH4g+xiXTRknY1a2emXWiz6Iav
	Ls0x1nJjTKqhfqMIdCYku1fpoNSXrbliLCIKB7tb1GJXqzP7VSss8HqEEMa34donZurA4ALTMlz
	3kZxRA/lMmFc4ZfprjL9/JjMt2x0RQ==
X-Received: by 2002:a05:690c:c52c:b0:798:65ed:bb9b with SMTP id
 00721157ae682-798dd688c7fmr89351937b3.27.1773028228644; Sun, 08 Mar 2026
 20:50:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305030258.5273-1-sun.jian.kdev@gmail.com> <aalGh2sjKl_mZp7G@krava>
In-Reply-To: <aalGh2sjKl_mZp7G@krava>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Mon, 9 Mar 2026 11:50:17 +0800
X-Gm-Features: AaiRm51uUEhkJcmn4QO3MwOWN1G6F5PFKmsYAMlcoRfnq31RLjwF3XvQDes7nMQ
Message-ID: <CABFUUZHXROhFTgVtK9CS_PERkCEJrJ6d3wAfHP9GLa7o+mVLAg@mail.gmail.com>
Subject: Re: [PATCH v2 bpf-next] selftests/bpf: livepatch_trampoline: skip
 when prerequisites are missing
To: Jiri Olsa <olsajiri@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Song Liu <song@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 5:02=E2=80=AFPM Jiri Olsa <olsajiri@gmail.com> wrote=
:
>
> load_livepatch returns -ENOENT if we fail to open the file, we could
> check for it instead of putting together the path again
>
Hi Jiri,
Thanks for the suggestion. v3 sent:
https://lore.kernel.org/bpf/20260309033712.728133-1-sun.jian.kdev@gmail.com=
/

Regards,
Sun Jian
